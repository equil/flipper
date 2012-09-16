//
//  CMGyroData+CMGyroData_CoreDataConverter.m
//  flipper
//
//  Created by Андрей Иванов on 16.09.12.
//
//

#import "CMGyroData+CMGyroData_CoreDataConverter.h"

@implementation CMGyroData (CMGyroData_CoreDataConverter)

-(NSManagedObject*) toPointWithContext: (NSManagedObjectContext*) aContext
{
    NSManagedObject *point = [NSEntityDescription
                              insertNewObjectForEntityForName: @"CFlipperGyroscopePoint"
                              inManagedObjectContext: aContext];
    
    [point setValue: [NSNumber numberWithDouble:self.rotationRate.x] forKey:@"x"];
    [point setValue: [NSNumber numberWithDouble:self.rotationRate.y] forKey:@"y"];
    [point setValue: [NSNumber numberWithDouble:self.rotationRate.z] forKey:@"z"];
    [point setValue: [NSNumber numberWithDouble:self.timestamp] forKey:@"timestamp"];
    
    return (point);
}

@end
