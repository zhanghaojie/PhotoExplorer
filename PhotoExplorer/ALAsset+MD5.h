//
//  ALAsset+MD5.h
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAsset (MD5)

- (NSString *)getMD5String;
- (NSURL *)getUrl;
- (NSString *)getUTI;

- (void)setAssetsGroup:(ALAssetsGroup *)assetGroup;
- (ALAssetsGroup *)getAssetsGroup;

- (void)dump;

@end
