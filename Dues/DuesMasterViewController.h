//
//  DuesMasterViewController.h
//  Dues
//
//  Created by SungJae Lee on 13. 5. 21..
//  Copyright (c) 2013년 SungJae Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Due;

@interface DuesMasterViewController : UITableViewController

@property (strong,nonatomic) NSMutableArray *objects;
@property (strong, nonatomic) Due *selectedDue;

- (void)addDue:(Due *)object;
@end
