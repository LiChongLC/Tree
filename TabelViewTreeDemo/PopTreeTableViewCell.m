//
//  PopTreeTableViewCell.m
//  CheShiLi-B
//
//  Created by cheshili5 on 2017/8/23.
//  Copyright © 2017年 cheshili5. All rights reserved.
//

#import "PopTreeTableViewCell.h"
#import "SDAutoLayout.h"
#import "PopularizeTableView.h"

#define BaseFont(fontSize) [UIFont fontWithName:@"PingFang SC" size:fontSize]

#define CEll_UN_Select_Blue [UIColor colorWithRGB:0xa3b7e9]
#define CELL_UNSelect_Line_Color [UIColor colorWithRGB:0xE5E5E5]
#define CELL_UNSelectText_Color [UIColor colorWithRGB:0xa9a9a9]
#define BASECOLOR ([[UIColor alloc] initWithRGB:0x2D50A7])
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

@interface PopTreeTableViewCell ()


@property (strong, nonatomic) UIView *leftline;
@property (strong, nonatomic) UIView *cicle;
@property (strong, nonatomic) UIView *rightline;
@property (strong, nonatomic) UIView *topline;
@property (strong, nonatomic) UIView *bottomline;
@property (strong, nonatomic) UIView *bgView;


@property (strong, nonatomic) UIView *conView;
@property (strong, nonatomic) UILabel *phone;
@property (strong, nonatomic) UILabel *nickName;
@property (strong, nonatomic) UIImageView *showSel;


@property (strong, nonatomic) UIImageView *leftImage;

@property (strong, nonatomic) PopularizeTableView *subTable;

@end


@implementation PopTreeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier delegate:(id)delegate level:(NSInteger)level indexPath:(NSIndexPath *)indexPath{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.tableViewDelegate = delegate;
        self.level = level;
        self.indexPath = indexPath;
        [self createView];
    }
    return self;
}
-(void)createView{
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    UIImageView *leftImage = [UIImageView new];
    self.leftImage = leftImage;
    
    UIView *leftline = [UIView new];
    self.leftline = leftline;
    
    UIView *cicle = [UIView new];
    self.cicle = cicle;
    
    UIView *rightline = [UIView new];
    self.rightline = rightline;
    
    UIView *topline = [UIView new];
    self.topline = topline;
    
    UIView *bottomline = [UIView new];
    self.bottomline = bottomline;
    
    UIView *bgView = [UIView new];
    self.bgView = bgView;
    
    UIView *conView = [UIView new];
    self.conView = conView;
    
    UILabel *phone = [UILabel new];
    self.phone = phone;
    
    UILabel *nickName = [UILabel new];
    self.nickName = nickName;
    
   
    
    

    
    [self.contentView addSubview:leftImage];
    [self.contentView addSubview:leftline];
    [self.contentView addSubview:cicle];
    [self.contentView addSubview:rightline];
    [self.contentView addSubview:bottomline];
    [self.contentView addSubview:topline];
    [self.contentView addSubview:bgView];
    
    
    
    [bgView addSubview:conView];
    [conView addSubview:phone];
    [conView addSubview:nickName];
    
    
    
    leftImage.sd_layout.topSpaceToView(self.contentView, 30).leftSpaceToView(self.contentView, 10).widthIs(24).heightIs(24);
    leftImage.layer.cornerRadius = 12;
    leftImage.image = [UIImage imageNamed:@"shop_blue"];
    
    
    cicle.sd_layout.leftSpaceToView(leftImage, 25).centerYEqualToView(leftImage).widthIs(8).heightIs(8);
    cicle.sd_cornerRadius = @4;
    
    leftline.sd_layout.leftSpaceToView(leftImage, 0).rightSpaceToView(cicle, 0).heightIs(1).centerYEqualToView(leftImage);
    
    
    rightline.sd_layout.leftSpaceToView(cicle, 0).centerYEqualToView(leftImage).widthIs(20).heightIs(1);
    
    topline.sd_layout.bottomSpaceToView(cicle, 0).topEqualToView(self.contentView).centerXEqualToView(cicle).widthIs(1);
    
    
    
    bottomline.sd_layout.topSpaceToView(cicle, 0).bottomSpaceToView(self.contentView, 0).centerXEqualToView(cicle).widthIs(1);
    
    CGFloat bgWith = self.level < 3 ?130:105;
    bgView.sd_layout.leftSpaceToView(cicle, 20).centerYEqualToView(leftImage).widthIs(bgWith).heightIs(44);
    bgView.sd_cornerRadius = @2;
    
    conView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(1, 1, 1, 1));
    conView.sd_cornerRadius = @2;
    
    phone.sd_layout.leftSpaceToView(conView, 5).topSpaceToView(conView, 5).widthIs(100).heightIs(18);
    phone.font = BaseFont(14);
//    phone.textAlignment = NSTextAlignmentCenter;
    
    nickName.sd_layout.leftEqualToView(phone).rightEqualToView(phone).topSpaceToView(phone, 0).bottomSpaceToView(conView, 5);
    nickName.font = BaseFont(14);
//    nickName.textAlignment = NSTextAlignmentCenter;
    
    
    if (self.level < 3) {
        PopularizeTableView *subTable = [PopularizeTableView new];
        subTable.backgroundColor = [UIColor clearColor];
        subTable.level = self.level + 1;
        subTable.superIndexPath = self.indexPath;
        self.subTable = subTable;
        [self.contentView addSubview:subTable];
        CGFloat leftSapce  = iPhone5 ? (-10):10;
        subTable.sd_layout.leftSpaceToView(cicle, leftSapce).topSpaceToView(bgView, 0).bottomSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 5);
        
        
        UIImageView *showSel = [UIImageView new];
        self.showSel = showSel;
        [conView addSubview:showSel];
        showSel.sd_layout.centerYEqualToView(conView).rightSpaceToView(conView, 5).widthIs(16).heightIs(16);
        
    }
    
    switch (self.level) {
        case 1:
        {
            self.topline.backgroundColor = BASECOLOR;
            self.leftline.backgroundColor = BASECOLOR;
            self.bottomline.backgroundColor = BASECOLOR;
            self.phone.textColor = [UIColor whiteColor];
            self.nickName.textColor = [UIColor whiteColor];
        }
            break;
        case 2:
        {
            self.topline.backgroundColor = CEll_UN_Select_Blue;
            self.bottomline.backgroundColor = CEll_UN_Select_Blue;
            self.conView.backgroundColor = [UIColor whiteColor];
            
        }
            break;
        case 3:
        {
            self.topline.backgroundColor = CELL_UNSelect_Line_Color;
            self.bottomline.backgroundColor = CELL_UNSelect_Line_Color;
            self.bgView.backgroundColor = [UIColor whiteColor];
            self.conView.backgroundColor = [UIColor whiteColor];
        }
            break;
            
        default:
            break;
    }
    
}

-(void)setModel:(PopularizeModel *)model{
    _model = model;
    self.leftImage.hidden = !self.hasLeftImage;
    self.leftline.hidden = !self.hasLeftImage;
    
    self.topline.hidden = self.hasLeftImage;
    self.bottomline.hidden = self.isBottomLineHiden;
    if (model.NickName.length == 0 || [model.NickName isEqualToString:@" "]) {
       self.nickName.text = [NSString stringWithFormat:@"%@",model.RealName];
    }else{
        self.nickName.text = [NSString stringWithFormat:@"%@/%@",model.RealName,model.NickName];
        
    }
    
    self.phone.text = [NSString stringWithFormat:@"%@****%@",[model.Mobile substringToIndex:3],[model.Mobile substringFromIndex:7]];
    
    if (model.isSelect && model.level < 3) {
        self.subTable.dataArray = [NSMutableArray arrayWithArray:model.Children];
        [self.subTable reloadData];
    }else{
        self.subTable.dataArray = [NSMutableArray array];
        [self.subTable reloadData];
    }
    
    switch (model.level) {
        case 1:
        {
            if (model.isSelect) {
                self.cicle.backgroundColor = BASECOLOR;
                self.rightline.backgroundColor = BASECOLOR;
                self.bgView.backgroundColor = BASECOLOR;
                self.conView.backgroundColor = BASECOLOR;
                
                self.showSel.image = [UIImage imageNamed:@"round_move"];
                
                
                
            }else{
                self.cicle.backgroundColor = CEll_UN_Select_Blue;
                self.rightline.backgroundColor = CEll_UN_Select_Blue;
                self.bgView.backgroundColor = CEll_UN_Select_Blue;
                self.conView.backgroundColor = CEll_UN_Select_Blue;
                
                self.showSel.image = [UIImage imageNamed:@"round_add"];
            }
        }
            break;
        case 2:
        {
            if (model.isSelect) {
               
                self.cicle.backgroundColor = BASECOLOR;
                self.rightline.backgroundColor = BASECOLOR;
                self.bgView.backgroundColor = BASECOLOR;
                self.phone.textColor = BASECOLOR;
                self.nickName.textColor = BASECOLOR;
                self.showSel.image = [UIImage imageNamed:@"round_move_blue"];
                
            }else{
                self.cicle.backgroundColor = CEll_UN_Select_Blue;
                self.rightline.backgroundColor = CEll_UN_Select_Blue;
                self.bgView.backgroundColor = CEll_UN_Select_Blue;
                self.phone.textColor = CEll_UN_Select_Blue;
                self.nickName.textColor = CEll_UN_Select_Blue;
                
                self.showSel.image = [UIImage imageNamed:@"round_add_blue"];
            }
        }
            break;
        case 3:
        {
            if (model.isSelect) {
                self.cicle.backgroundColor = BASECOLOR;
                self.rightline.backgroundColor = BASECOLOR;
                self.phone.textColor = BASECOLOR;
                self.nickName.textColor = BASECOLOR;
                
            }else{
                self.cicle.backgroundColor = CELL_UNSelect_Line_Color;
                self.rightline.backgroundColor = CELL_UNSelect_Line_Color;
                self.phone.textColor = CELL_UNSelectText_Color;
                self.nickName.textColor = CELL_UNSelectText_Color;
            }
        }
            break;
            
        default:
            break;
    }

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
