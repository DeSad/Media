//
//  LibraryAPI.m
//  BlueLibrary
//
//  Created by Stanislav Kozhemyako on 5/19/16.
//  Copyright © 2016 Eli Ganem. All rights reserved.
//

#import "LibraryAPI.h"
#import "PersistencyManager.h"
#import "HTTPClient.h"

@interface LibraryAPI ()
{
    PersistencyManager * persistencyManager;
    HTTPClient * httpClient;
    BOOL isOnline;
}
@end

@implementation LibraryAPI

+(LibraryAPI *)sharedInstance{
//    Declare a static variable to store a pointer to the instance of the class
//    (its value will be available globally from our class).
    static LibraryAPI * _sharedInstance = nil;
    
//    Declare a static variable dispatch_once_t, which will ensure that the
//    initialization code is executed only once.
    static dispatch_once_t oncePredicate;
    
//    With Grand Central Dispatch (GCD) Initializes LibraryAPI instance. This is
//    the essence of the pattern "loner": initialization block will never be
//    executed again.
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - initialized variable -
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        persistencyManager = [[PersistencyManager alloc] init];
        httpClient = [[HTTPClient alloc] init];
        isOnline = NO;
    }
    return self;
}

-(NSArray *)albums
{
    return [persistencyManager albums];
}

-(void)addAlbum:(Album *)album atIndex:(int)index
{
    [persistencyManager addAlbum:album atIndex:index];
    if (isOnline) {
        [httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

-(void)deleteAlbumAtIndex:(int)index
{
    [persistencyManager deleteAlbumAtIndex:index];
    if (isOnline) {
        [httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}



@end
