//
//  Due.h
//  Dues
//
//  Created by SungJae Lee on 13. 5. 21..
//  Copyright (c) 2013년 SungJae Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSRails.h"

@interface Due : NSRRemoteObject
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSDecimalNumber *amount;
@property (strong,nonatomic) NSString *menu;
@end
