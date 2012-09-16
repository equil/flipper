//
//  CMAccelerometerData+CMAccelerometerData_CoreDataConverter.h
//  flipper
//
//  Created by Андрей Иванов on 16.09.12.
//
//

#import <CoreMotion/CoreMotion.h>
#import <CoreData/CoreData.h>

@interface CMAccelerometerData (CMAccelerometerData_CoreDataConverter)

-(NSManagedObject*) toPointWithContext: (NSManagedObjectContext*) aContext;

@end
