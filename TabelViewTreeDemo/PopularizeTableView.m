//
//  PopularizeTableView.m
//  CheShiLi-B
//
//  Created by cheshili5 on 2017/8/24.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import "PopularizeTableView.h"
#import "PopularizeModel.h"
#import "PopTreeTableViewCell.h"


@interface PopularizeTableView ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation PopularizeTableView

-(instancetype)init{
    if (self = [super init]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.scrollEnabled = NO;
        self.clipsToBounds = YES;
    }
    return self;
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
    model.isSelect = !model.isSelect;
    if (model.level<3) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"csltablereload" object:indexPath];
        [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }else{
        [self reloadData];
    }
    
    
    
}

@end
