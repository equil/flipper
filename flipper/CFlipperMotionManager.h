//
//  CFlipperMotionManager.h
//  flipper
//
//  Created by Андрей Иванов on 16.09.12.
//
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreData/CoreData.h>

typedef void(^BFlipperAcceleromertReactionBlock)(CMAccelerometerData *aAccelerometrData);
typedef void(^BFlipperGyroReactionBlock)(CMGyroData *aGyroData);

@interface CFlipperMotionManager : NSObject
{
@private
    CMMotionManager *m_motionManager;
    BFlipperAcceleromertReactionBlock m_accelerometrReaction;
    BFlipperGyroReactionBlock m_gyroReaction;
    
    NSOperationQueue *m_queue;
    
    NSManagedObjectContext *m_managedObjectContext;
}

@property (nonatomic, retain) CMMotionManager *motionManager;
@property (nonatomic, copy) BFlipperAcceleromertReactionBlock accelerometrReaction;
@property (nonatomic, copy) BFlipperGyroReactionBlock gyroReaction;

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

-(id) initWithAccelerometrBlock: (BFlipperAcceleromertReactionBlock) aAccelerometrBlock
                   andGyroBlock: (BFlipperGyroReactionBlock) aGyroBlock;
-(void) start;
-(void) stop;

@end
