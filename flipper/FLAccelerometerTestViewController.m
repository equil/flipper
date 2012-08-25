//
//  FLAccelerometerTestViewController.m
//  flipper
//
//  Created by Alexey Rogatkin on 08/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FLAccelerometerTestViewController.h"

@interface FLAccelerometerTestViewController ()

@end

@implementation FLAccelerometerTestViewController

@synthesize xLabel = _xLabel;
@synthesize yLabel = _yLabel;
@synthesize zLabel = _zLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIAccelerometer sharedAccelerometer] setUpdateInterval:1.0/180.0];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    _xLabel.text = [NSString stringWithFormat:@"%f", acceleration.x];
    _yLabel.text = [NSString stringWithFormat:@"%f", acceleration.y];
    _zLabel.text = [NSString stringWithFormat:@"%f", acceleration.z];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end