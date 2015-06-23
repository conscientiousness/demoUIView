//
//  Nav3TableViewController.m
//  testStoryBoard
//
//  Created by Jesselin on 2015/6/16.
//  Copyright (c) 2015年 Jesse. All rights reserved.
//

#import "Nav3TableViewController.h"

@interface Nav3TableViewController ()
{
    NSMutableArray *datas;
}
@end

@implementation Nav3TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //編輯功能
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //datas = [[NSMutableArray alloc] init];
    //datas = [NSMutableArray array];
    datas = [NSMutableArray new];
    
    //Add Button Support
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtnPressed)];
    
    self.navigationItem.leftBarButtonItem = addButton;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

}

- (void) addBtnPressed {
    
    //Add into db first:insert往第一個放
    [datas insertObject:[NSDate date] atIndex:0];
    
    //Insert into TableView 的位置
    NSIndexPath *insertIdexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    //插入項目到指定位置(insertIdexPath) 資料來源會呼叫tableView
    [self.tableView insertRowsAtIndexPaths:@[insertIdexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
    
    // section可動態判斷
    // Return the number of rows(cells) in the section.
    return datas.count ;
}

//cellForRowAtIndexPath:某cell該show什麼

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //storyboard tableView 要設定 Identifier的名稱 myCell
    //dequeueReusableCellWithIdentifier 負責處理cell資源運用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    //測試
    //cell.textLabel.text = [NSString stringWithFormat:@"Sec: %ld,Row: %ld",(long)indexPath.section,(long)indexPath.row];

    
    [tableView setSeparatorColor:[UIColor clearColor]];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(0, cell.contentView.frame.size.height - 0.5, cell.contentView.frame.size.width, 2)];
    //UIView *separator2 = [[UIView alloc] initWithFrame:CGRectMake(0, cell.contentView.frame.size.height - 1.0, cell.contentView.frame.size.width, 1)];
    separator.backgroundColor = [UIColor yellowColor];
    //separator2.backgroundColor = [UIColor blackColor];
    [cell.contentView addSubview:separator];
    //[cell.contentView addSubview:separator2];
    
    NSLog(@"indexPath: %@",indexPath.description);
    
    NSData *targetItem = datas[indexPath.row];
    cell.textLabel.text = targetItem.description;
    return cell;
}



// Override to support conditional editing of the table view.
//控制cell是否能做編輯
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    //if (indexPath.row == 2)
        //return NO;
    //else
        return YES;
}



// Override to support editing the table view.
//刪除前會到這個method
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        [datas removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


//cell移動資料處理
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    //更新陣列內容
    //取移動cell row位置的資料=[datas objectAtIndex:fromIndexPath.row]
    id tmpItem = datas[fromIndexPath.row];
    //刪除該位置
    [datas removeObjectAtIndex:fromIndexPath.row];
    //插入到移動後的位置
    [datas insertObject:tmpItem atIndex:toIndexPath.row];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
