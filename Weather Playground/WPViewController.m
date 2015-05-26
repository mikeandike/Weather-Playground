//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "ObjectController.h"
#import "Weather.h"

@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UILabel *descriptionWeather;
@property (weak, nonatomic) IBOutlet UILabel *mainWeather;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *temp;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (double)farenheitFromKelvinString:(NSString *)kelvin{
    double kelvinVal = [kelvin doubleValue];
    return (kelvinVal - 273.15)* 1.8000 + 32.00;
}

- (IBAction)searchButtonTapped:(id)sender {
    
    [[ObjectController sharedInstance] getWeatherWithName:[self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] completion:^(Weather *weather) {
        self.temp.text = [NSString stringWithFormat:@"%.1fº F", [self farenheitFromKelvinString:weather.weatherTemp]];
        self.location.text = weather.locationName;
        self.mainWeather.text = weather.weatherMain;
        self.descriptionWeather.text = weather.weatherDescription;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
