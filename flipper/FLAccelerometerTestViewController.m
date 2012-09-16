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

@synthesize xAccelLabel = m_xAccelLabel;
@synthesize yAccelLabel = m_yAccelLabel;
@synthesize zAccelLabel = m_zAccelLabel;

@synthesize xGyroLabel = m_xGyroLabel;
@synthesize yGyroLabel = m_yGyroLabel;
@synthesize zGyroLabel = m_zGyroLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    m_motionManager = [[CFlipperMotionManager alloc] initWithAccelerometrBlock:^(CMAccelerometerData *aAccelerometrData)
    {
        m_xAccelLabel.text = [NSString stringWithFormat:@"%f", aAccelerometrData.acceleration.x];
        m_yAccelLabel.text = [NSString stringWithFormat:@"%f", aAccelerometrData.acceleration.y];
        m_zAccelLabel.text = [NSString stringWithFormat:@"%f", aAccelerometrData.acceleration.z];
    }
    andGyroBlock:^(CMGyroData *aGyroData)
    {
        m_xGyroLabel.text = [NSString stringWithFormat:@"%f", aGyroData.rotationRate.x];
        m_yGyroLabel.text = [NSString stringWithFormat:@"%f", aGyroData.rotationRate.y];
        m_zGyroLabel.text = [NSString stringWithFormat:@"%f", aGyroData.rotationRate.z];
    }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


-(IBAction)startButtonAction: (id)sender
{
    [m_motionManager start];
}

-(IBAction)stopButtonAction:  (id)sender
{
    [m_motionManager stop];
}

-(IBAction)clearButtonAction: (id)sender
{
    
}

-(IBAction)sendButtonAction: (id)sender
{
    
}

@end