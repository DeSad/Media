//
//  PersistencyManager.h
//  BlueLibrary
//
//  Created by Stanislav Kozhemyako on 5/19/16.
//  Copyright © 2016 Eli Ganem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface PersistencyManager : NSObject

-(NSArray *)albums;
-(void)addAlbum:(Album *)album atIndex:(NSUInteger *)index;
-(void) deleteAlbumAtIndex:(NSUInteger *)index;

@end
