//
//  AlbumLibarayManager.m
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AlbumLibraryManager.h"

static AlbumLibraryManager * shareInstance = NULL;

@implementation AlbumLibraryManager

@synthesize assetsGroup = _assetsGroup;
@synthesize groupAssets = _groupAssets;

+ (AlbumLibraryManager *)sharedAlbumLibraryManager
{
    if (shareInstance == NULL) {
        shareInstance = [[self alloc] init];
    }
    return shareInstance;
}

+ (void)purgeAlbumLibraryManager
{
    [shareInstance release];
    shareInstance = NULL;
}

- (id)init
{
    if (self = [super init]) {
        albumAssetsLibrary = [[ALAssetsLibrary alloc] init];
        self.assetsGroup = [NSMutableArray array];
        self.groupAssets = [NSMutableDictionary dictionaryWithCapacity:0];
    }
    return self;
}

- (void)dealloc
{
    [albumAssetsLibrary release];
    [super dealloc];
}

- (void)loadAllResources
{
    [albumAssetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll 
                                      usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                                          [group setAssetsFilter:[ALAssetsFilter allPhotos]];
                                          if ([group numberOfAssets] > 0) {
                                              [_assetsGroup addObject:group];
                                              [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                                                  NSMutableArray * array = [_groupAssets objectForKey:[group getGroupPersistentID]];
                                                  if (array == NULL) {
                                                      array = [NSMutableArray array];
                                                      [_groupAssets setObject:array forKey:[group getGroupPersistentID]];
                                                  }
                                                  if (result) {
                                                      [array addObject:result];
                                                  }
                                              }];
                                          }
                                      }
                                    failureBlock:^(NSError *error) {
                                        
                                    }];
}

- (void)addAssetsGroup:(ALAssetsGroup *)groupName
{
    
}

- (ALAssetsGroup *)getAssetsGroupByName:(NSString *)assetName
{
    //return [_assetsGroup objectForKey:assetName];
    return NULL;
}

- (NSArray *)getAllGroups
{
    return _assetsGroup;
}

- (void)removeAssetsGroup:(ALAssetsGroup *)group
{
    
}
- (void)removeAssetsGroupByName:(NSString *)groupName
{
    
}
/*
- (void)addAsset:(ALAsset *)asset inGroupByName:(NSString *)groupName
{
    [self willChangeValueForKey:groupName];
    [[_groupAssets objectForKey:groupName] addObject:asset];
    [self didChangeValueForKey:groupName];
}
 */
- (NSArray *)getAllAssetsInGroup:(NSString *)groupName
{
    return [_groupAssets objectForKey:groupName];
}
/*
- (void)insertObject:(id)anObject atAssetsGroupIndex:(NSUInteger)index
{
    [self willChangeValueForKey:@"assetsGroup"];
    [_assetsGroup insertObject:anObject atIndex:index];
    [self didChangeValueForKey:@"assetsGroup"];
}
- (void)removeAssetsGroupObjectAtIndex:(NSUInteger)index
{
    [self willChangeValueForKey:@"assetsGroup"];
    [_assetsGroup removeObjectAtIndex:index];
    [self didChangeValueForKey:@"assetsGroup"];
}
 */

/*
- (void)insertObject:(id)anObject atGroupAssetsIndex:(NSUInteger)index
{
    
}
- (void)removeGroupAssetsObjectAtIndex:(NSUInteger)index
{

}
 */
@end
