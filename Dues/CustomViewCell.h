//
//  CustomViewCell.h
//  Dues
//
//  Created by SungJae Lee on 13. 5. 21..
//  Copyright (c) 2013년 SungJae Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *menu;
@property (weak, nonatomic) IBOutlet UILabel *amount;
@end
