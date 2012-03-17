//
//  NSData+NSDataMD5.m
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSData+MD5.h"
#import <CommonCrypto/CommonDigest.h>
#define CC_MD5_DIGEST_LENGTH 16

@implementation NSData (MD5)

- (NSString *)MD5String
{
    const char *cStr = (const char *)[self bytes];
    unsigned char result[CC_MD5_DIGEST_LENGTH]; 
    CC_MD5(cStr, [self length], result); 
    return [NSString stringWithFormat: @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",                     
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}
@end
