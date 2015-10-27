//
//  WTTFMainViewController.h
//  WTTF
//
//  Created by Abelardo Marquez on 8/26/15.
//  Copyright (c) 2015 ajmg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface WTTFMainViewController : UIViewController


@property (weak, nonatomic  ) IBOutlet UILabel          *stepsLabel;
@property (weak, nonatomic  ) IBOutlet UILabel          *stepsYesterday;

@property (strong, nonatomic) CMPedometer      *pedometerData;

@end
