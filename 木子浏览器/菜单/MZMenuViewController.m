//
//  MZMenuViewController.m
//  木子浏览器
//
//  Created by 肖睿 on 16/3/28.
//  Copyright © 2016年 李成. All rights reserved.
//

#import "MZMenuViewController.h"
#import "mb2ViewAdditions.h"
#import "MZVideoViewController.h"

@interface MZMenuViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView                   * tableView;

@property (nonatomic, strong) NSMutableArray                * listMarr;

@end

@implementation MZMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"菜单";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listMarr = [[NSMutableArray alloc] initWithObjects:@"视频", nil];
    
    [self.view addSubview:self.tableView];
    
}


#pragma mark - TableViewDataSource
// 有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listMarr.count;
}
// 每行中的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellId = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.listMarr[indexPath.row];
    return cell;
}
#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MZVideoViewController * video = [[MZVideoViewController alloc] init];
    [self.navigationController pushViewController:video animated:YES];
    
}
#pragma mark - 懒加载
// 表格
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
