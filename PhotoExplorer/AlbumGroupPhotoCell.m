//
//  AlbumGroupPhotoCell.m
//  PhotoExplorer
//
//  Created by 浩杰 张 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AlbumGroupPhotoCell.h"

@implementation AlbumGroupPhotoCell

@synthesize photoAssets = _photoAssets;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)dealloc
{
    [_photoAssets release];
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPhotoAssets:(NSArray *)photoAssets
{
    [_photoAssets release];
    _photoAssets = [photoAssets retain];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)drawRect:(CGRect)rect
{
    int x = 0;
    int y = 0;
    for (int i = 0; i < [_photoAssets count]; i++) {
        ALAsset * asset = [_photoAssets objectAtIndex:i];
        x = i % 4 * 79 + 4;
        y = i / 4 * 79 + 4;
        CGImageRef CGImage = [asset thumbnail];
        UIImage * image = [UIImage imageWithCGImage:CGImage];
        //NSLog(@"%f, %f", image.size.width, image.size.height);
        //[image drawAtPoint:CGPointMake(x, y)];
        [image drawInRect:CGRectMake(x, y, image.size.width/2, image.size.height/2)];
    }
}

@end
