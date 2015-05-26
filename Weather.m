//
//  Weather.m
//  Weather Playground
//
//  Created by Michael Sacks on 5/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Weather.h"

@implementation Weather

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    
    if (dict) {
        self.locationName = dict[@"name"];
        self.weatherMain = dict[@"weather"][0][@"main"];
        self.weatherDescription = dict[@"weather"][0][@"description"];
        self.weatherIcon = dict[@"weather"][0][@"icon"];
        self.weatherTemp = dict[@"main"][@"temp"];
    }
    
    return self;
}


@end
