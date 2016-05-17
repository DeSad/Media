//
//  AlbumView.m
//  BlueLibrary
//
//  Created by Stanislav Kozhemyako on 5/17/16.
//  Copyright © 2016 Eli Ganem. All rights reserved.
//

#import "AlbumView.h"

@implementation AlbumView

{
    UIImageView * coverImage;
    UIActivityIndicatorView * indicator;
}

- (id)initWithFrame:(CGRect)frame
         albumCover:(NSString *)albumCover
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        Set backgroundcolour as black
        self.backgroundColor = [UIColor blackColor];
        
//        Create image with indent 5 px
        coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width-10, frame.size.height-10)];
        [self addSubview:coverImage];
        
//        Adding activity indicator
        indicator = [[UIActivityIndicatorView alloc] init];
        indicator.center = self.center;
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        [indicator startAnimating];
        [self addSubview:indicator];
    }
    return self;
}

@end
