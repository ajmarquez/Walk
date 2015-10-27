//
//  WTTFMeasures.m
//  WTTF
//
//  Created by Abelardo Marquez on 8/27/15.
//  Copyright (c) 2015 ajmg. All rights reserved.
//

#import "WTTFMeasures.h"
#import <CoreMotion/CoreMotion.h>

@implementation WTTFMeasures


#pragma Date Methods

+ (NSDate *)getToday{
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    return today;
}

+ (NSDate *)getYesterday{
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    
    return [NSDate dateWithTimeInterval:-86400 sinceDate:today];
}


#pragma Measures Methods

- (NSString *) computePastSelfWithPastData:(NSNumber *)pastData andPresentData:(NSNumber *)presentData{
    
    
    NSNumber *total = @(([pastData floatValue]/[presentData floatValue])*100);
    NSNumberFormatter* format = [[NSNumberFormatter alloc] init];
    [format setNumberStyle:NSNumberFormatterDecimalStyle];
    [format setPositiveFormat:@"0."];
    
    
    return [NSString stringWithFormat:@"%@", [format stringFromNumber:total]];
    
}

- (NSString *) computeQuestWithGoal:(float)aQuestData andTodayData:(NSNumber *)todayData{
    
    NSNumber *total = @(([todayData floatValue]/aQuestData)*100);
    NSNumberFormatter* format = [[NSNumberFormatter alloc] init];
    [format setNumberStyle:NSNumberFormatterDecimalStyle];
    [format setPositiveFormat:@"0."];
    
    
    return [NSString stringWithFormat:@"%@", [format stringFromNumber:total]];

    
}
    
    
    


@end
