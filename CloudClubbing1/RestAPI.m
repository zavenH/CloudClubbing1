//
//  RestAPI.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 20/11/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "RestAPI.h"

@interface RestAPI() <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSMutableData *receivedData;
@property (nonatomic, strong) NSURLConnection *requestConnection;
@end

@implementation RestAPI

- (NSMutableData *)receivedData{
    if (!_receivedData) {
        _receivedData = [[NSMutableData alloc]init];
    }
    return _receivedData;
}

- (NSURLConnection *)requestConnection{
    if (!_requestConnection) {
        _requestConnection = [[NSURLConnection alloc]init];
    }
    return _requestConnection;
}

#pragma mark - Request

- (void)httpRequest:(NSMutableURLRequest *)request{
    self.requestConnection = [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - Delegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [self.delegate getReceivedData:self.receivedData sender:self];
    self.delegate = nil;
    self.requestConnection = nil;
    self.receivedData = nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@", error.description);
}

@end
