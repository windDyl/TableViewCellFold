//
//  TableViewCell.m
//  TableViewCellFold
//
//  Created by Ethank on 16/2/18.
//  Copyright © 2016年 Ldy. All rights reserved.
//

#import "MyTableViewCell.h"
#import "Masonry.h"
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width

@interface MyTableViewCell()
@property (nonatomic, weak)UIView *lineView;

@end
@implementation MyTableViewCell

- (void)awakeFromNib {
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *contentLabel = [[UILabel alloc] init];
        [self.contentView addSubview:contentLabel];
        contentLabel.font = [UIFont systemFontOfSize:14.f];
        self.contentLabel = contentLabel;
        
        UIButton *foldBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [foldBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [foldBtn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateSelected];
        [self.contentView addSubview:foldBtn];
        self.foldBtn = foldBtn;
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:lineView];
        self.lineView = lineView;
        
    }
    return self;
}

- (void)updateConstraints {
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_contentLabel.superview).offset(17);
        make.right.equalTo(_contentLabel.superview).offset(-37);
        make.centerY.equalTo(_contentLabel.superview.mas_centerY);
    }];
    [_foldBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_foldBtn.superview).offset(-17);
        make.bottom.equalTo(_contentLabel.mas_bottom);
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_contentLabel);
        make.top.equalTo(self.contentView.mas_bottom).offset(-1.);
        make.height.mas_equalTo(0.5);
    }];
    [super updateConstraints];
}

-(void)setContentStr:(NSString *)contentStr {
    _contentStr = contentStr;
    _contentLabel.text = contentStr;
    [self updateConstraints];
}
//cell是否展开 0未展开1展开
- (void)setContentFlag:(NSString *)contentFlag {
    _contentFlag = contentFlag;
    if ([contentFlag isEqualToString:@"0"]) {
        _contentLabel.numberOfLines = 1;
        self.foldBtn.selected = NO;
    } else {
        _contentLabel.numberOfLines = 0;
        self.foldBtn.selected = YES;
    }
}
//cell展开后 动态计算cell高度
+ (CGFloat)cellHeightWith:(NSString *)contentStr {
    CGSize size = [contentStr boundingRectWithSize:CGSizeMake(SCREENWIDTH - 17*2, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:14.f] forKey:NSFontAttributeName] context:nil].size;
    return 20 + size.height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
