//
//  FLAccelerometerTestViewController.h
//  flipper
//
//  Created by Alexey Rogatkin on 08/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFlipperMotionManager.h"
#import "FLEmailSender.h"

@interface FLAccelerometerTestViewController : UIViewController
{
    CFlipperMotionManager *m_motionManager;
}
@property(nonatomic, retain) IBOutlet UILabel *xAccelLabel;
@property(nonatomic, retain) IBOutlet UILabel *yAccelLabel;
@property(nonatomic, retain) IBOutlet UILabel *zAccelLabel;

@property(nonatomic, retain) IBOutlet UILabel *xGyroLabel;
@property(nonatomic, retain) IBOutlet UILabel *yGyroLabel;
@property(nonatomic, retain) IBOutlet UILabel *zGyroLabel;

@property (nonatomic, retain) FLEmailSender *emailSender;

-(IBAction)startButtonAction: (id)sender;
-(IBAction)stopButtonAction:  (id)sender;
-(IBAction)clearButtonAction: (id)sender;
-(IBAction)sendButtonAction: (id)sender;
@end