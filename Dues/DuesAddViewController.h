//
//  DuesAddViewController.h
//  Dues
//
//  Created by SungJae Lee on 13. 5. 21..
//  Copyright (c) 2013년 SungJae Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Due;

@interface DuesAddViewController : UITableViewController
@property (strong,nonatomic) NSMutableArray *parentObjects;
@property (strong,nonatomic) Due *due;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (weak, nonatomic) IBOutlet UITextField *menu;
@property (assign, nonatomic) BOOL update;

- (IBAction)save:(id)sender;
@end
