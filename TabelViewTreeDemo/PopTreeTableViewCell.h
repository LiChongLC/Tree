//
//  PopTreeTableViewCell.h
//  CheShiLi-B
//
//  Created by cheshili5 on 2017/8/23.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopularizeModel.h"


@interface PopTreeTableViewCell : UITableViewCell

@property (strong, nonatomic) PopularizeModel *model;

@property (strong, nonatomic) NSIndexPath *indexPath;
@property (assign, nonatomic) NSInteger level;

@property (assign, nonatomic) BOOL hasLeftImage;
@property (assign, nonatomic) BOOL isBottomLineHiden;

@property (weak, nonatomic) id tableViewDelegate;


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier delegate:(id)delegate level:(NSInteger)level indexPath:(NSIndexPath *)indexPath;

@end
