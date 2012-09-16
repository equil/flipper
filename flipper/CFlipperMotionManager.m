//
//  CFlipperMotionManager.m
//  flipper
//
//  Created by Андрей Иванов on 16.09.12.
//
//

#import "CFlipperMotionManager.h"
#import "CMGyroData+CMGyroData_CoreDataConverter.h"
#import "CMAccelerometerData+CMAccelerometerData_CoreDataConverter.h"

double const kAccelerometerUpdateInterval = 1.0 / 20.0;
double const kGyroUpdateInterval = 1.0 / 20.0;

@interface CFlipperMotionManager()

-(void) startAccelerometerUpdates;
-(void) startGyroUpdates;
-(void) stopAccelerometerUpdates;
-(void) stopGyroUpdates;

@end

@implementation CFlipperMotionManager
@synthesize motionManager = m_motionManager;
@synthesize accelerometrReaction = m_accelerometrReaction;
@synthesize gyroReaction = m_gyroReaction;

@synthesize managedObjectContext = m_managedObjectContext;

-(id) initWithAccelerometrBlock: (BFlipperAcceleromertReactionBlock) aAccelerometrBlock
                   andGyroBlock: (BFlipperGyroReactionBlock) aGyroBlock
{
    self = [super init];
    if (self)
    {
        self.motionManager = [[CMMotionManager alloc] init];
        self.accelerometrReaction = aAccelerometrBlock;
        self.gyroReaction = aGyroBlock;
        
        m_queue = [[NSOperationQueue alloc] init];
    }
    return(self);
}

-(void) start
{
    [self startAccelerometerUpdates];
    [self startGyroUpdates];
}

-(void) stop
{
    [self stopAccelerometerUpdates];
    [self stopGyroUpdates];
}

-(void) startAccelerometerUpdates
{
    if (m_motionManager.accelerometerAvailable)
    {
        m_motionManager.accelerometerUpdateInterval = kAccelerometerUpdateInterval;
        
        [m_motionManager startAccelerometerUpdatesToQueue:m_queue
                                              withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                                                  if (error)
                                                  {
                                                      [self stopAccelerometerUpdates];
                                                      NSLog(@"%@",[error description]);
                                                  }
                                                  else
                                                  {
                                                      dispatch_async(dispatch_get_main_queue(), ^{
                                                          self.accelerometrReaction(accelerometerData);
                                                      });
                                                  }
                                              }];
    }
}

-(void) stopAccelerometerUpdates
{
    [m_motionManager stopAccelerometerUpdates];
}

-(void) startGyroUpdates
{
    if (m_motionManager.gyroAvailable)
    {
        m_motionManager.gyroUpdateInterval = kGyroUpdateInterval;
        
        [m_motionManager startGyroUpdatesToQueue:m_queue
                                     withHandler:^(CMGyroData *gyroData, NSError *error) {
                                         if (error)
                                         {
                                             [self stopGyroUpdates];
                                             NSLog(@"%@",[error description]);
                                         }
                                         else
                                         {
                                             dispatch_async(dispatch_get_main_queue(), ^{
                                                 self.gyroReaction(gyroData);
                                             });
                                         }
                                     }];
    }
}

-(void) stopGyroUpdates
{
    [m_motionManager stopGyroUpdates];
}

-(void) testCoreData
{
    /*
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *list = [NSEntityDescription
                             insertNewObjectForEntityForName: @"CFlipperDataList"
                             inManagedObjectContext: context];
    
    [list setValue:[NSNumber numberWithDouble:3.14] forKey:@"timestamp"];
    
    
    NSManagedObject *point = [NSEntityDescription
                              insertNewObjectForEntityForName: @"CFlipperDataPoint"
                              inManagedObjectContext: context];
    
    [point setValue:list forKey:@"list"];
    
    CMAccelerometerData *accelerometerData = nil;
    NSManagedObject *accelerometer = [accelerometerData toPointWithContext:context];
    
    [point setValue:<#(id)#> forKey:<#(NSString *)#>]
    
    CMGyroData *gyroData = nil;
    NSManagedObject *gyroscope = [accelerometerData toPointWithContext:context];
    /*
    /*
    [point setValue:<#(id)#> forKey:<#(NSString *)#>]
    
    [failedBankDetails setValue:[NSDate date] forKey:@"updateDate"];
    [failedBankDetails setValue:[NSNumber numberWithInt:12345] forKey:@"zip"];
    [failedBankDetails setValue:failedBankInfo forKey:@"info"];
    [failedBankInfo setValue:failedBankDetails forKey:@"details"];
    
    NSError *error;
    if (![context save:&amp;error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
     */
}

@end
