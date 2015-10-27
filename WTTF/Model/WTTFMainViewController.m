//
//  WTTFMainViewController.m
//  WTTF
//
//  Created by Abelardo Marquez on 8/26/15.
//  Copyright (c) 2015 ajmg. All rights reserved.
//

#import "WTTFMainViewController.h"
#import <CoreMotion/CoreMotion.h>
#import "FWDCircleShape.h"

@interface WTTFMainViewController ()

@end

@implementation WTTFMainViewController{
    
    NSNumber *yesterdayData;
    NSNumber *todayData;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.05 green:0.05 blue:0.05 alpha:1];
    // Do any additional setup after loading the view.
    self.pedometerData        = [[CMPedometer alloc] init];

    
    
    
    /*!
     *  Define Days
     *
     */
    
    
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    
    int day = 3600*24;
    
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    NSDate *now               = [[NSDate alloc] init];
    NSDate *yesterday         = [NSDate dateWithTimeInterval:-day sinceDate:today];
    
    
    /*!
     *  Gets today Steps
     */

    if ([CMPedometer isStepCountingAvailable] | [CMPedometer isDistanceAvailable]){
        
        //In case is available
        
        NSLog(@"YES is available!");

        [self.pedometerData startPedometerUpdatesFromDate:today withHandler:^(CMPedometerData *pedometerData, NSError *error) {
            

            dispatch_async(dispatch_get_main_queue(), ^{
                if (error) {
                    NSLog(@"Pedometer is NOT available.");
                }
                else {
                    NSLog(@"Entering the pedometer data NOW %@", pedometerData);
                    self.stepsLabel.text = [NSString stringWithFormat:@"%@", pedometerData.numberOfSteps];
                }
            });

                }];
        

        /*!
         *  Queries distance data for this day
         *
         */
        
        [self.pedometerData queryPedometerDataFromDate:today toDate:now withHandler:^(CMPedometerData *pedometerData, NSError *error) {


            dispatch_async(dispatch_get_main_queue(), ^{
                if (error) {
                    NSLog(@"Pedometer is NOT available.");
                }
                else {
                    NSLog(@"Entering the pedometer data YESTERDAY %@", pedometerData);
                    
                    NSNumberFormatter* format = [[NSNumberFormatter alloc] init];
                    [format setNumberStyle:NSNumberFormatterDecimalStyle];
                    [format setPositiveFormat:@"0.##"];
                    
                    
                    NSNumber *kilometers = @([pedometerData.distance floatValue]/1000);
                    
                    self.stepsYesterday.text = [NSString stringWithFormat:@"%@", [format stringFromNumber:kilometers]];
                }
            });

        }];

              }else{
                  NSLog(@"Damn... it doesn't works");
              }


    
    //test
    
    FWDCircleShape *circle = [[FWDCircleShape alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 200, 150, 150)];
    
    circle.backgroundColor = [UIColor blackColor];
    circle.percentage = 25;
    
    [self.view addSubview:circle];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
