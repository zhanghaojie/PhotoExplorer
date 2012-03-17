//
//  ALAsset+MD5.m
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ALAsset+MD5.h"
#import "ALAssetRepresentation+MD5.h"

const char * AssetsGroupKey = "AssetsGroupKey";

@implementation ALAsset (MD5)

- (NSString *)getMD5String
{
    ALAssetRepresentation * defaultRepresentation = [self defaultRepresentation];
    return [defaultRepresentation getMD5String];
}

- (NSURL *)getUrl
{
    ALAssetRepresentation * defaultRepresentation = [self defaultRepresentation];
    return [defaultRepresentation url];
}

- (NSString *)getUTI
{
    ALAssetRepresentation * defaultRepresentation = [self defaultRepresentation];
    return [defaultRepresentation UTI];
}

- (void)setAssetsGroup:(ALAssetsGroup *)assetGroup
{
    objc_setAssociatedObject(self, AssetsGroupKey, assetGroup, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (ALAssetsGroup *)getAssetsGroup
{
    return (ALAssetsGroup *)objc_getAssociatedObject(self, AssetsGroupKey);
}

- (void)dump
{
    NSLog(@"ALAssetPropertyType: %@", [self valueForProperty:ALAssetPropertyType]);
    NSLog(@"ALAssetPropertyLocation: %@", [self valueForProperty:ALAssetPropertyLocation]);
    NSLog(@"ALAssetPropertyDuration: %@", [self valueForProperty:ALAssetPropertyDuration]);
    NSLog(@"ALAssetPropertyOrientation: %@", [self valueForProperty:ALAssetPropertyOrientation]);
    NSLog(@"ALAssetPropertyDate: %f", [[self valueForProperty:ALAssetPropertyDate] timeIntervalSince1970]);
    NSLog(@"ALAssetPropertyRepresentations: %@", [self valueForProperty:ALAssetPropertyRepresentations]);
    NSLog(@"ALAssetPropertyURLs: %@", [self valueForProperty:ALAssetPropertyURLs]);
}

@end
