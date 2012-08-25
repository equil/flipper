//
//  FLAccelerometerTestViewController.h
//  flipper
//
//  Created by Alexey Rogatkin on 08/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLAccelerometerTestViewController : UIViewController <UIAccelerometerDelegate>

@property(nonatomic, retain) IBOutlet UILabel *xLabel;
@property(nonatomic, retain) IBOutlet UILabel *yLabel;
@property(nonatomic, retain) IBOutlet UILabel *zLabel;

@end