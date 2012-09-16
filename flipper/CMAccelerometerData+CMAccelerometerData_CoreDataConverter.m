//
//  CMAccelerometerData+CMAccelerometerData_CoreDataConverter.m
//  flipper
//
//  Created by Андрей Иванов on 16.09.12.
//
//

#import "CMAccelerometerData+CMAccelerometerData_CoreDataConverter.h"

@implementation CMAccelerometerData (CMAccelerometerData_CoreDataConverter)

-(NSManagedObject*) toPointWithContext: (NSManagedObjectContext*) aContext
{
    NSManagedObject *point = [NSEntityDescription
                              insertNewObjectForEntityForName: @"CFlipperAccelerometrPoint"
                              inManagedObjectContext: aContext];
    
    [point setValue: [NSNumber numberWithDouble:self.acceleration.x] forKey:@"x"];
    [point setValue: [NSNumber numberWithDouble:self.acceleration.y] forKey:@"y"];
    [point setValue: [NSNumber numberWithDouble:self.acceleration.z] forKey:@"z"];
    [point setValue: [NSNumber numberWithDouble:self.timestamp] forKey:@"timestamp"];
    
    return (point);
}

@end
