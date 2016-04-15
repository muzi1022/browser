//
//  MZVideoViewController.m
//  木子浏览器
//
//  Created by 肖睿 on 16/3/28.
//  Copyright © 2016年 李成. All rights reserved.
//

#import "MZVideoViewController.h"
#import "mb2ViewAdditions.h"
#import "LDZMoviePlayerController.h"
#import "MoviePlayer.h"

@interface MZVideoViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView                   * tableView;        // 表格

@property (nonatomic, strong) NSMutableArray                * listArray;        // 列表数组

@end

@implementation MZVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"视频";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.listArray = [[NSMutableArray alloc] initWithCapacity:0];
    [self.listArray addObject:@"1"];
    
    [self.view addSubview:self.tableView];
    
}



#pragma mark - TableViewDataSource
// 有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}
// 每行中的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * cellId = [NSString stringWithFormat:@"cell%zi",indexPath.row];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = self.listArray[indexPath.row];
    
    return cell;
}
// 每行的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    LDZMoviePlayerController * mpc = [[LDZMoviePlayerController alloc] init];
//    mpc.movieURL = [NSURL fileURLWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"5540385469401b10912f7a24-6.mp4"]];
//    [self.navigationController pushViewController:mpc animated:YES];
    MoviePlayer * movie = [[MoviePlayer alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) URL:[NSURL URLWithString:@"http://baobab.cdn.wandoujia.com/14468618701471.mp4"]];
    [self.view addSubview:movie];
    
//    AVPlayerViewController * pvc = [[AVPlayerViewController alloc] init];
//    pvc.url = [NSURL URLWithString:@"http://baobab.cdn.wandoujia.com/14463059939521445330477778425364388_x264.mp4"];
//    pvc.delegate = self;
//    [self.navigationController pushViewController:pvc animated:YES];
    
}


#pragma mark - 懒加载
// 表格
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
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
