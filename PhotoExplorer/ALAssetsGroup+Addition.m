//
//  ALAssetsGroup+Addition.m
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ALAssetsGroup+Addition.h"

const char * assetsArrayName = "assetsArrayName";

@implementation ALAssetsGroup (Addition)

- (NSString *)getGroupName
{
    return [self valueForProperty:ALAssetsGroupPropertyName];
}

- (NSString *)getGroupPersistentID
{
    id value = [self valueForProperty:ALAssetsGroupPropertyPersistentID];
    return value;
}


//- (NSArray *)allAssets
//{
//    
//}

@end
