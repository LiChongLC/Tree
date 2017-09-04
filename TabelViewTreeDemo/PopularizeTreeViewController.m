//
//  PopularizeTreeViewController.m
//  CheShiLi-B
//
//  Created by cheshili5 on 2017/8/23.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import "PopularizeTreeViewController.h"
#import "PopularizeModel.h"
#import "PopTreeTableViewCell.h"
#import "PopularizeTableView.h"

@interface PopularizeTreeViewController ()

@end

@implementation PopularizeTreeViewController
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
//    self.title = @"";
    [self requestData];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tablereload:) name:@"csltablereload" object:nil];
}
-(void)tablereload:(NSNotification *)notify{
    NSIndexPath *indexPath = (NSIndexPath *)notify.object;
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
-(void)requestData{
    

    NSArray *data = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"date" ofType:@"json"]] options:0 error:nil];
    for (NSDictionary *dic in data) {
        PopularizeModel *model = [[PopularizeModel alloc] init];
        model.level = 1;
        //                model.isSelect = YES;
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PopularizeModel *model = self.dataArray[indexPath.row];
    return model.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PopTreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    PopularizeModel *model = self.dataArray[indexPath.row];

    if (!cell) {
        cell = [[PopTreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid" delegate:self level:model.level indexPath:indexPath];
        cell.tableViewDelegate = self;
    }

    
    if (indexPath.row == 0) {
        cell.hasLeftImage = YES;
    }else{
        cell.hasLeftImage = NO;
    }
    
    if (indexPath.row == self.dataArray.count - 1) {
        cell.isBottomLineHiden = YES;
    }else{
        cell.isBottomLineHiden = NO;
    }
    
    cell.model = model;
   
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PopularizeModel *model = self.dataArray[indexPath.row];
    
    if (model.level < 3) {
        model.isSelect = !model.isSelect;
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }

    
}

-(void)leftButton{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
