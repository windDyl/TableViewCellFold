//
//  TableViewCell.h
//  TableViewCellFold
//
//  Created by Ethank on 16/2/18.
//  Copyright © 2016年 Ldy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (nonatomic, strong)UILabel * contentLabel;
@property (nonatomic, strong)UIButton *foldBtn;
@property (nonatomic, copy)NSString *contentFlag;
@property (nonatomic, copy)NSString *contentStr;

+ (CGFloat)cellHeightWith:(NSString *)contentStr;
@end
