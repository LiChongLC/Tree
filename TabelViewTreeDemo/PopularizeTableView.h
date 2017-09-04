//
//  PopularizeTableView.h
//  CheShiLi-B
//
//  Created by cheshili5 on 2017/8/24.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopularizeTableView : UITableView

@property (strong, nonatomic) NSIndexPath *superIndexPath;
@property (assign, nonatomic) NSInteger level;

@property (strong, nonatomic) NSMutableArray *dataArray;


@end
