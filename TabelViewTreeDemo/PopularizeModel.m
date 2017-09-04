//
//  PopularizeModel.m
//  CheShiLi-B
//
//  Created by cheshili5 on 2017/8/23.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import "PopularizeModel.h"
#import <UIKit/UIKit.h>

@implementation PopularizeModel

-(void)setValue:(id)value forKey:(NSString *)key{
    if ([key isEqualToString:@"Children"]) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in value) {
            PopularizeModel *model = [[PopularizeModel alloc] init];
            model.level = self.level + 1;
//            model.isSelect = YES;
            [model setValuesForKeysWithDictionary:dic];
            [arr addObject:model];
        }
        self.Children = arr;
    }else{
        [super setValue:value forKey:key];
    }
}

-(CGFloat)cellHeight{
    
    CGFloat height = 70.0;
    
    if (self.isSelect == YES && self.level < 3) {
        
        for (PopularizeModel *model in self.Children) {
            height += model.cellHeight;
        }
        
    }
    return height;
}
-(void)setIsSelect:(BOOL)isSelect{
    _isSelect = isSelect;
    
    if (!isSelect) {
        for (PopularizeModel *model in self.Children) {
            model.isSelect = NO;
        }
    }
    
}

@end
