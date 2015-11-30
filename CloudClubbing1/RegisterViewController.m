//
//  RegisterViewController.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 19/06/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "RegisterViewController.h"
#import "SWRevealViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize userId, userPassword, userMailAdress, userPhoneNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [_idLabel setHidden:YES];
    [_mailLabel setHidden:YES];
    [_passwordLabel setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)validationButton:(id)sender {
    NSString *uId = userId.text;
    NSString *uPassword = userPassword.text;
    NSString *uMail = userMailAdress.text;
    NSString *uPhoneNumber = userPhoneNumber.text;
    BOOL wrongValue = NO;
 
    NSMutableString* encodedPw;
    
    if(uId.length < 4){
        [_idLabel setHidden:NO];
        wrongValue = YES;
    }

    if(uPassword.length < 4){
        [_passwordLabel setHidden:NO];
        wrongValue = YES;
    }
    else {
        if(![_passwordLabel isHidden])
            [_passwordLabel setHidden:YES];
        
        const char *cstr = [uPassword cStringUsingEncoding:NSUTF8StringEncoding];
        NSData *data = [NSData dataWithBytes:cstr length:uPassword.length];
        
        uint8_t digest[CC_SHA1_DIGEST_LENGTH];
        
        CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
        
        encodedPw = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
        for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++){
            [encodedPw appendFormat:@"%02x", digest[i]];
        }

    }
    
    if(uMail.length < 1){
        [_mailLabel setHidden:NO];
        wrongValue = YES;
    }
    
    if(wrongValue == NO){
        
        NSString *urlComplet = @"http://163.5.84.210/api/user/register.php";
        urlComplet = [urlComplet stringByAppendingString:@"?login="];
        urlComplet = [urlComplet stringByAppendingString:uId];
        urlComplet = [urlComplet stringByAppendingString:@"&password="];
        urlComplet = [urlComplet stringByAppendingString:encodedPw];
        urlComplet = [urlComplet stringByAppendingString:@"&email="];
        urlComplet = [urlComplet stringByAppendingString:uMail];
    
    
        NSMutableURLRequest *request =
        [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlComplet]
                                cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                            timeoutInterval:10
         ];
    
        [request setHTTPMethod: @"POST"];
    
        NSError *requestError = nil;
        NSURLResponse *urlResponse = nil;
        NSData *response1 =
        [NSURLConnection sendSynchronousRequest:request
                          returningResponse:&urlResponse error:&requestError];
        NSLog(@"%@", request);
    }
        
}
@end
