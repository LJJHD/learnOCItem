//
//  ComposeImageTableViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/8/23.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "ComposeImageTableViewController.h"
#import "ImageTableViewCell.h"
#import "ImageModel.h"
static NSString * const reCell = @"ImageTableViewCell";
@interface ComposeImageTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ComposeImageTableViewController
-(void)dealloc{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _dataArr = [NSMutableArray array];
    [self.dataArr addObject:@"http://cdn2.179e.com/1526896080223155.jpg"];
    [self.dataArr addObject:@"http://cdn2.179e.com/1518011612"];
    [self.dataArr addObject:@"http://cdn2.179e.com/1509066600358890.jpg"];
    [self.dataArr addObject:@"http://cdn2.179e.com/1510217820215097.jpg"];

    
//    for (int i = 1; i<= 3; i++) {
//        [self.dataArr addObject:[[ImageModel alloc]init]];
//    }
    self.tableView.rowHeight = 100;
    [self.tableView registerNib:[UINib nibWithNibName:reCell bundle:nil] forCellReuseIdentifier:reCell];
//    [self performSelector:@selector(test) withObject:self afterDelay:5.f];
}
-(void)test{
    NSLog(@"延迟执行");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reCell forIndexPath:indexPath];
    
    // Configure the cell...
//    ImageModel *model = self.dataArr[indexPath.row];
//    [model img:^(UIImage *img) {
//        cell.img.image = img;
//    }];
    cell.url = self.dataArr[indexPath.row];
    return cell;
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
