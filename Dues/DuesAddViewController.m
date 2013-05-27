//
//  DuesAddViewController.m
//  Dues
//
//  Created by SungJae Lee on 13. 5. 21..
//  Copyright (c) 2013년 SungJae Lee. All rights reserved.
//

#import "DuesMasterViewController.h"
#import "DuesAddViewController.h"
#import "Due.h"
#import "DuesAppDelegate.h"

@interface DuesAddViewController ()

@end

@implementation DuesAddViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   
    if (self.due == nil) {
        self.due = [[Due alloc]init];
    }
    
    if (self.update) {
    self.name.text = self.due.name;
    self.amount.text = [NSString stringWithFormat:@"%@", self.due.amount];
    self.menu.text = self.due.menu;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)save:(id)sender {
    if (self.due == nil) {
        self.due = [[Due alloc]init];
        [self.parentObjects addObject:self.due];
    }
    
    self.due.name = self.name.text;

    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];

    self.due.amount = (NSDecimalNumber*)[formatter numberFromString:self.amount.text];
    self.due.menu = self.menu.text;

    DuesMasterViewController *mvc = [self.navigationController.viewControllers objectAtIndex:0];
                                     
    if (!self.update) {
        [mvc addDue:self.due ];
        [self.due remoteCreate:nil];
    }
    mvc.selectedDue = self.due;
    [self.due remoteUpdate:nil];
    self.update = false;
    
    [mvc.tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
