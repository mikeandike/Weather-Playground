//
//  ObjectController.h
//  Weather Playground
//
//  Created by Michael Sacks on 5/25/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface ObjectController : NSObject

+ (ObjectController *)sharedInstance;

- (void)getWeatherWithName:(NSString *)name completion:(void (^) (Weather *weather))completion;

@end
