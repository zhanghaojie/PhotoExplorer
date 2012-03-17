//
//  ALAssetsGroup+Addition.h
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsGroup (Addition)

- (NSString *)getGroupName;
- (NSString *)getGroupPersistentID;

//- (NSArray *)allAssets;

@end
