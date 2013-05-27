//
//  DuesMasterViewController.m
//  Dues
//
//  Created by SungJae Lee on 13. 5. 21..
//  Copyright (c) 2013년 SungJae Lee. All rights reserved.
//

#import "DuesMasterViewController.h"

#import "DuesAddViewController.h"
#import "Due.h"
#import "CustomViewCell.h"

@interface DuesMasterViewController () {
//    NSMutableArray *_objects;
}
@end

@implementation DuesMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;

   //sync
   //self.objects = [NSMutableArray arrayWithArray:[Due remoteAll:nil]];
   //async
    [Due remoteAllAsync:^(NSArray *allRemote, NSError *error) {
        if (error) {
            NSLog(@"remoteAllAsync error %@",[error localizedDescription]);
            abort();
        }
        
        self.objects = (NSMutableArray*) allRemote;
        [self.tableView reloadData];
        
    }];
    
    NSLog(@"after you");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    [self performSegueWithIdentifier:@"showAdd" sender:self];

/*
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
 */  
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"due number: %d",self.objects.count);
    return self.objects.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];

    if (cell == nil) {
        cell = [[CustomViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
    
    Due *object = [self.objects objectAtIndex:indexPath.row];
    NSLog(@"%@",object.name);
    cell.name.text = [object.name description];
    cell.menu.text = [object.menu description];
    cell.amount.text = [object.amount description];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
     
        [self.objects[indexPath.row] remoteDestroy:nil];
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
     //   [self.tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.

    }
}

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  /*
    if ([[segue identifier] isEqualToString:@"showAdd"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Due *due = self.objects[indexPath.row];
      DuesAddViewController *dvc = [segue destinationViewController];
        dvc.due = due;
    }
   */
    if ([[segue identifier] isEqualToString:@"showAddSelect"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.selectedDue = self.objects[indexPath.row];
        DuesAddViewController *dvc = [segue destinationViewController];
        dvc.due = self.selectedDue;
        dvc.update = TRUE;
    }
}

- (void)addDue:(Due *)object
{
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    } 
   // [self.objects insertObject:object atIndex:0];
    [self.objects addObject:object];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
