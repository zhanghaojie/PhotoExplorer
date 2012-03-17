//
//  ALAssetRepresentation+MD5.m
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ALAssetRepresentation+MD5.h"
#import "NSData+MD5.h"

const char * AssetMD5StringKey = "MD5String";

@implementation ALAssetRepresentation (MD5)

- (NSString *)getMD5String
{
    NSString * md5 = objc_getAssociatedObject(self, AssetMD5StringKey);
    if (!md5) {
        NSUInteger size = [self size];
        if (size > 0) {
            uint8_t *buff = malloc(size);
            if (buff) {
                NSError *err = nil;
                NSUInteger gotByteCount = [self getBytes:buff fromOffset:0 length:size error:&err];
                if (gotByteCount) {
                    if (err) {
                        NSLog(@"!!! Error reading asset: %@", [err localizedDescription]);
                        [err release];
                    }
                }
                NSData * data = [[NSData alloc] initWithBytes:buff length:gotByteCount];//[NSData dataWithBytesNoCopy:buff length:size freeWhenDone:YES];
                if (data) {
                    md5 = [data MD5String];
                    objc_setAssociatedObject(self, AssetMD5StringKey, md5, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                }
                [data release];
                free(buff);
            }
        }
    }
    
    return md5;
}

@end
