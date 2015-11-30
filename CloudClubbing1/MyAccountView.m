//
//  MyAccountView.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 30/04/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "MyAccountView.h"
#import "SWRevealViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "RestAPI.h"
#import "User.h"

@interface MyAccountView () <RestAPIDelegate>
@property (nonatomic, strong) RestAPI *restApi;

@end

@implementation MyAccountView
@synthesize idTextField, passwordTextField;
@synthesize user, saveUser;

- (RestAPI *)restApi{
    if (!_restApi) {
        _restApi = [[RestAPI alloc]init];
    }
    return _restApi;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    passwordTextField.secureTextEntry = YES;
    
    _fieldError.text = @"Login ou Mot de Passe incorrect";
    _fieldError.hidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"contactView"]) {
        return false;
    }
    return true;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    User *sUser;
    sUser = [saveUser objectAtIndex:0];
    
    [[segue destinationViewController] getUser:sUser];
}



# pragma mark - Request

- (void)httpGetRequest:(NSString*)str{
    NSString *strUrl = str;
    strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:strUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:GET];
    self.restApi.delegate = self;
    [self.restApi httpRequest:request];
}

- (void)getReceivedData:(NSMutableData *)data sender:(RestAPI*)sender{
    NSError *error = nil;
    NSDictionary *receivedData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSDictionary *response = [[NSDictionary alloc]initWithDictionary:[receivedData objectForKey:@"request"]];
    if ([[response valueForKey:@"result"]  isEqual: @"KO"]) {
        _fieldError.hidden = NO;
    }
    
    else if ([[response valueForKey:@"result"] isEqual: @"OK"]) {
        _fieldError.hidden = YES;
        
        NSDictionary *userData = [[NSDictionary alloc]initWithDictionary:[receivedData objectForKey:@"user"]];
        
        saveUser = [[NSMutableArray alloc] init];
        
        NSString *sKey = [response valueForKey:@"session_key"];
        NSString *uID = [userData valueForKey:@"id"];
        NSString *uLogin = [userData valueForKey:@"login"];
        NSString *uName = [userData valueForKey:@"name"];
        NSString *uAddress = [userData valueForKey:@"address"];
        NSString *uEmail = [userData valueForKey:@"email"];
        NSString *uPhone = [userData valueForKey:@"phone"];
        NSString *uPicture = [userData valueForKey:@"picURL"];
        
        [saveUser addObject:[[User alloc] initWithSession:sKey andUserID:uID andLogin:uLogin andName:uName andAddress:uAddress andEmail:uEmail andPhone:uPhone andPictureURL:uPicture]];
        
        [self performSegueWithIdentifier:@"contactView" sender:self];
    }
}



- (IBAction)connectionButton:(id)sender {
    
    NSString *userId = idTextField.text;
    NSString *userPassword = passwordTextField.text;
    
    const char *cstr = [userPassword cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:userPassword.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* encodedPw = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++){
        [encodedPw appendFormat:@"%02x", digest[i]];
    }

//    NSLog(@"user: %@",userId);
//    NSLog(@"pass: %@", encodedPw);
    
    NSString *urlComplet = @"http://163.5.84.210/api/user/login.php";
    urlComplet = [urlComplet stringByAppendingString:@"?login="];
    urlComplet = [urlComplet stringByAppendingString:userId];
    urlComplet = [urlComplet stringByAppendingString:@"&password="];
    urlComplet = [urlComplet stringByAppendingString:encodedPw];
    
    [self httpGetRequest:urlComplet];

}
@end
