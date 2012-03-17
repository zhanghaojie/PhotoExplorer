//
//  AlbumViewController.m
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AlbumViewController.h"
#import "NSData+MD5.h"
#import "AlbumLibraryManager.h"
#import "AlbumGroupPhotoCell.h"

@interface AlbumViewController ()

@end

@implementation AlbumViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)addAsset
{
    ALAsset * asset = [[ALAsset alloc] init];
    NSData * imageData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"shot_background-iPad" ofType:@"png"]];
    [asset setImageData:imageData metadata:NULL completionBlock:^(NSURL *assetURL, NSError *error) {
        NSLog(@"%@", assetURL);
    }];
    
    AlbumLibraryManager * albumLibraryMgr = [AlbumLibraryManager sharedAlbumLibraryManager];
    ALAssetsGroup * group = [[albumLibraryMgr getAllGroups] objectAtIndex:0];
    bool editable = group.editable;
    NSLog(@"%d", editable);
}

- (void)viewDidLoad
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //self.tableView.
    AlbumLibraryManager * albumLibraryMgr = [AlbumLibraryManager sharedAlbumLibraryManager];
    //[albumLibraryMgr addObserver:self forKeyPath:@"assetsGroup" options:0 context:NULL];
    [albumLibraryMgr loadAllResources];
    
    [self.tableView performSelector:@selector(reloadData) withObject:NULL afterDelay:5];
    [self performSelector:@selector(addAsset) withObject:NULL afterDelay:4];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    AlbumLibraryManager * albumLibraryMgr = [AlbumLibraryManager sharedAlbumLibraryManager];
    NSInteger count = [albumLibraryMgr.assetsGroup count];
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //AlbumLibraryManager * albumLibraryMgr = [AlbumLibraryManager sharedAlbumLibraryManager];
    //ALAssetsGroup * assetsGroup = [albumLibraryMgr.assetsGroup objectAtIndex:section];
    //return [[albumLibraryMgr.groupAssets objectForKey:[assetsGroup getGroupName]] count];
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    AlbumLibraryManager * albumLibraryMgr = [AlbumLibraryManager sharedAlbumLibraryManager];
    ALAssetsGroup * assetsGroup = [albumLibraryMgr.assetsGroup objectAtIndex:section];
    NSString * groupName = [assetsGroup getGroupName];
    return groupName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    AlbumGroupPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == NULL) {
        cell = [[AlbumGroupPhotoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    AlbumLibraryManager * albumLibraryMgr = [AlbumLibraryManager sharedAlbumLibraryManager];
    ALAssetsGroup * assetsGroup = [albumLibraryMgr.assetsGroup objectAtIndex:[indexPath section]];
    NSString * groupName = [assetsGroup getGroupPersistentID];
    cell.photoAssets = [albumLibraryMgr.groupAssets objectForKey:groupName];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlbumLibraryManager * albumLibraryMgr = [AlbumLibraryManager sharedAlbumLibraryManager];
    ALAssetsGroup * assetsGroup = [albumLibraryMgr.assetsGroup objectAtIndex:[indexPath section]];
    NSString * groupName = [assetsGroup getGroupPersistentID];
    NSUInteger count = [[albumLibraryMgr.groupAssets objectForKey:groupName] count];
    NSUInteger row = count / 4;
    NSUInteger residue = count % 4;
    if (residue > 0) {
        row += 1;
    }
    return row * 79 + 4;
}

@end
