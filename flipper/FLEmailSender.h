//
//  FLEmailSender.h
//  flipper
//
//  Created by fredformout on 09.10.12.
//
//

typedef  enum {
    ACC,
    GYRO
} coords;

#import <Foundation/Foundation.h>
#import "SKPSMTPMessage.h"

@interface FLEmailSender : NSObject

@property (nonatomic, retain) NSString *accMsg;
@property (nonatomic, retain) NSString *gyroMsg;

- (void)sendEmail;
- (void)writeLine:(NSString *)line typeOfCoords:(coords)type;

@end
