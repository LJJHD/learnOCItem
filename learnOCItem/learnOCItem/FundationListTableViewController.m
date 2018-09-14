//
//  FundationListTableViewController.m
//  learnOCItem
//
//  Created by 马拉古 on 2018/6/22.
//  Copyright © 2018年 shanghaiDouke.com. All rights reserved.
//

#import "FundationListTableViewController.h"
#import "FileMananerHandleViewController.h"
#import "FMDBLearnViewController.h"
#import "CustomObjectCopyViewController.h"
#import "MemoryManageViewController.h"
#import "BlockViewController.h"
#import "KVCViewController.h"
#import "PresenViewController.h"
static NSString * const cellIdentyfiy = @"defaultTableViewCell";
@interface FundationListTableViewController ()
@property (nonatomic, strong) NSArray *vcArr;
@property (nonatomic, copy) NSArray *testArr;
@property (nonatomic, copy) NSString *str;
@end

@implementation FundationListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"foundtion";
    self.vcArr = @[@"filemanagerHanle",@"fmdb",@"customOBJCopy",@"memoryManager",@"BlockViewController",@"kvcVC",@"category"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentyfiy];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
//   NSKeyValueCoding
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"123",@"4455", nil];

    [self setValue:@"123" forKey:@"str"];
}

-(void)setStr:(NSString *)str{
    
    _str = str;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    NSLog(@"self.view.safeAreaInsets3===%@",NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//       NSLog(@"self.view.safeAreaInsets2===%@",NSStringFromUIEdgeInsets(self.view.safeAreaInsets));
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
    return self.vcArr.count;
}

#pragma mark - table view delegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentyfiy];
    cell.textLabel.text = self.vcArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            FileMananerHandleViewController *kvo = [[FileMananerHandleViewController alloc]init];
            [self.navigationController pushViewController:kvo animated:YES];
        }
            break;
        case 1:
        {
            FMDBLearnViewController *kvo = [[FMDBLearnViewController alloc]init];
            [self.navigationController pushViewController:kvo animated:YES];
        }
            break;
        case 2:
        {
            CustomObjectCopyViewController *kvo = [[CustomObjectCopyViewController alloc]init];
            [self.navigationController pushViewController:kvo animated:YES];
        }
            break;
        case 3:
        {
            MemoryManageViewController *memoryManager = [[MemoryManageViewController alloc]init];
            [self.navigationController pushViewController:memoryManager animated:YES];
        }
            break;
        case 4:{
            BlockViewController *blockVC = [[BlockViewController alloc]init];
            [self.navigationController pushViewController:blockVC animated:YES];
        }
            break;
        case 5:{
            KVCViewController *kvc = [[KVCViewController alloc]init];
            [self.navigationController pushViewController:kvc animated:YES];
        }
            break;
        case 6:{
            PresenViewController *kvc = [[PresenViewController alloc]init];
            [self.navigationController pushViewController:kvc animated:YES];
        }
            break;
        default:
            break;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
