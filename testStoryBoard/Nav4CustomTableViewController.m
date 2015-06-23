//
//  Nav4CustomTableViewController.m
//  testStoryBoard
//
//  Created by Jesselin on 2015/6/17.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

#import "Nav4CustomTableViewController.h"
#import "Nav4CustomTableViewCell.h"

@interface Nav4CustomTableViewController ()

@end

@implementation Nav4CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 6;
}


//置換客制的Nav4CustomTableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Nav4CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nav4CustomCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.theLabel.text = [NSString stringWithFormat:@"Item%ld",(long)indexPath.row];
    
    NSString *targetFileNAme = indexPath.row%2==0 ? @"first.png":@"second.png";
    
    cell.theImageView.image = [UIImage imageNamed:targetFileNAme];
    
    //Add Switch Support
    cell.theSwitch.tag = indexPath.row;
    
    //Event:ValueChanged 值改變就會觸發"switchValueChanged:"這個method
    [cell.theSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    return cell;
}

- (void) switchValueChanged:(id)sender {
    
    NSInteger itemIndex = [sender tag];
    
    NSString *message = [NSString stringWithFormat:@"Item %ld is turned %@",(long)itemIndex,([sender isOn] ? @"ON":@"OFF")];
    
    //新用法:iOS9之後，不能用UIAlertView了
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"OK" message:message preferredStyle:UIAlertControllerStyleAlert];
    //UIAlertControllerStyleActionSheet
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"what's this : %@",action.description);
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:^{
        NSLog(@"present ok");
    }];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
