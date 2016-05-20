//
//  Album+TableRepresentation.m
//  BlueLibrary
//
//  Created by Stanislav Kozhemyako on 5/20/16.
//  Copyright © 2016 Eli Ganem. All rights reserved.
//

#import "Album+TableRepresentation.h"

@implementation Album (TableRepresentation)

-(NSDictionary *)tr_tableRepresentation
{
    return @{@"titles":@[@"Исполнитель", @"Альбом", @"Жанр", @"Год"],
             @"values":@[self.artist, self.title, self.genre, self.year]};
}

@end
