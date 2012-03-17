//
//  AlbumLibarayManager.h
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumLibraryManager : NSObject
{
    ALAssetsLibrary * albumAssetsLibrary;
}

@property(strong, nonatomic) NSMutableArray * assetsGroup;
@property(strong, nonatomic) NSMutableDictionary * groupAssets;

+ (AlbumLibraryManager *)sharedAlbumLibraryManager;
+ (void)purgeAlbumLibraryManager;

- (void)loadAllResources;
- (void)loadAllAssetsGroup;
- (void)loadAllAssetsByGroupID:(NSString *)groupID;

- (void)addAssetsGroupWithName:(NSString *)groupName;
- (ALAssetsGroup *)getAssetsGroupByGroupID:(NSString *)assetName;
- (NSArray *)getAllGroups;

- (void)removeAssetsGroup:(ALAssetsGroup *)group;
- (void)removeAssetsGroupByName:(NSString *)groupName;

- (void)addAsset:(ALAsset *)asset inGroupByName:(NSString *)groupName;
- (NSArray *)getAllAssetsInGroup:(NSString *)groupName;

- (void)insertObject:(id)anObject atAssetsGroupIndex:(NSUInteger)index;
- (void)removeAssetsGroupObjectAtIndex:(NSUInteger)index;

- (void)insertObject:(id)anObject atGroupAssetsIndex:(NSUInteger)index;
- (void)removeGroupAssetsObjectAtIndex:(NSUInteger)index;

@end
