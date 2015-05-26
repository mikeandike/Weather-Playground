//
//  NetworkController.m
//  Weather Playground
//
//  Created by Michael Sacks on 5/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "NetworkController.h"


@implementation NetworkController

+ (AFHTTPSessionManager *)api{
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString: @"http://api.openweathermap.org/data/2.5/"]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
    });
    
    return api;
}


@end
