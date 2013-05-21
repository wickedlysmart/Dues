//
//  DuesDetailViewController.h
//  Dues
//
//  Created by SungJae Lee on 13. 5. 21..
//  Copyright (c) 2013년 SungJae Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DuesDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
