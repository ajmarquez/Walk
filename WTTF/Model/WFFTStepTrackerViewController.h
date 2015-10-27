//
//  WFFTStepTrackerViewController.h
//  WTTF
//
//  Created by Abelardo Marquez on 8/26/15.
//  Copyright (c) 2015 ajmg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface WFFTStepTrackerViewController : UIViewController


@property (nonatomic, strong) CMPedometer *pedometerData;

@property (nonatomic, strong) NSString * currentSteps;


@end
