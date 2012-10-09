//
//  FLEmailSender.m
//  flipper
//
//  Created by fredformout on 09.10.12.
//
//

#import "FLEmailSender.h"

static NSString *email = @"";
static NSString *pass = @"";
static NSString *smtp = @"";

@implementation FLEmailSender

@synthesize accMsg, gyroMsg;

- (id)init {
    
    self = [super init];
    if (self) {
        accMsg = [[NSString alloc] init];
        gyroMsg = [[NSString alloc] init];        
    }
    
    return  self;
}

-(void)sendEmail
{
    [self sendEmail:accMsg subject:@"ACC"];
    [self sendEmail:gyroMsg subject:@"GYRO"];
}

-(void)sendEmail:(NSString *)message subject:(NSString *)subject
{
    SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
    
    testMsg.fromEmail = email;
    testMsg.toEmail = email;
    testMsg.relayHost = smtp;
    testMsg.requiresAuth = YES;
    testMsg.login = email;
    testMsg.pass = pass;
    testMsg.subject = [NSString stringWithFormat:@"[Flipper] %@ coords", subject];
    testMsg.bccEmail = @"";
    testMsg.wantsSecure = YES;
    
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain",
                               kSKPSMTPPartContentTypeKey,
                               message,
                               kSKPSMTPPartMessageKey,
                               @"8bit",
                               kSKPSMTPPartContentTransferEncodingKey,
                               nil];
    
    testMsg.parts = [NSArray arrayWithObjects:plainPart,nil];
    
    
    [testMsg send];
}

- (void)writeLine:(NSString *)line typeOfCoords:(coords)type
{
    switch (type) {
        case ACC:
        {
            NSString *tempStr = [accMsg stringByAppendingString:line];
            [accMsg release];
            accMsg = [[NSString alloc] initWithString:tempStr];
        }
            break;
        case GYRO:
        {
            NSString *tempStr = [gyroMsg stringByAppendingString:line];
            [gyroMsg release];
            gyroMsg = [[NSString alloc] initWithString:tempStr];
        }
            break;
            
        default:
            break;
    }
}

- (void)dealloc {
    [super dealloc];
    
    [accMsg release];
    [gyroMsg release];
}

@end
