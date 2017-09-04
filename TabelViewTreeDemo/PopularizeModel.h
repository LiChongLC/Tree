//
//  PopularizeModel.h
//  CheShiLi-B
//
//  Created by cheshili5 on 2017/8/23.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import "HBaseModel.h"
#import <UIKit/UIKit.h>

@interface PopularizeModel : HBaseModel

@property (assign, nonatomic) BOOL isSelect;
@property (assign, nonatomic) NSInteger level;

@property (copy, nonatomic) NSString *UserID;
@property (copy, nonatomic) NSString *GrouthValue;
@property (copy, nonatomic) NSString *InviteCode;
@property (copy, nonatomic) NSString *Data;
@property (copy, nonatomic) NSString *Enable;
@property (copy, nonatomic) NSString *RewardPoint;
@property (copy, nonatomic) NSString *RegisterFrom;
@property (copy, nonatomic) NSString *RegisterCont;
@property (copy, nonatomic) NSString *AddTime;
@property (copy, nonatomic) NSString *TimeLine;
@property (copy, nonatomic) NSString *CmnAmount;
@property (copy, nonatomic) NSString *OpenID;
@property (copy, nonatomic) NSString *RealName;
@property (copy, nonatomic) NSString *IDCard;
@property (copy, nonatomic) NSString *NickName;
@property (copy, nonatomic) NSString *Mobile;
@property (strong, nonatomic) NSArray *Children;


@property (assign, nonatomic) CGFloat cellHeight;



@end
