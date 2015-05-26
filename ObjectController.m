//
//  ObjectController.m
//  Weather Playground
//
//  Created by Michael Sacks on 5/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ObjectController.h"
#import "NetworkController.h"


@implementation ObjectController

+ (ObjectController *)sharedInstance{
    static ObjectController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ObjectController new];
    });
    
    return sharedInstance;
}

- (void)getWeatherWithName:(NSString *)name completion:(void (^) (Weather *weather))completion{
    
    name = [name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *path = [NSString stringWithFormat:@"weather?q=%@", name];
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject){
        
        NSLog(@"getWeatherWithName: %@", responseObject);
        NSDictionary *responseWeather = responseObject;
        Weather *weatherObject = [[Weather alloc] initWithDictionary:responseWeather];
        completion(weatherObject);
        
        
    }failure:^(NSURLSessionDataTask *task, NSError *error){
        NSLog(@"Error!: %@", error);
        completion(nil);
    }];
    
}

@end
