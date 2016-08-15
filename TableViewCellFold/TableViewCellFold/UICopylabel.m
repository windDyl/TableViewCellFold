//
//  UICopylabel.m
//  TableViewCellFold
//
//  Created by Ethank on 16/3/28.
//  Copyright © 2016年 Ldy. All rights reserved.
//

#import "UICopylabel.h"

@implementation UICopylabel

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copy:));
}
- (void)copy:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.text;
    [self resignFirstResponder];
    NSLog(@"pasteboard.string:%@", pasteboard.string);
}
- (BOOL)resignFirstResponder {
    self.backgroundColor = [UIColor whiteColor];
    return YES;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        [self attachLongPressHandler];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self attachLongPressHandler];
}
- (void)attachLongPressHandler {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressgesture:)];
    [self addGestureRecognizer:longPressGR];
}
- (void)handleLongPressgesture:(UILongPressGestureRecognizer *)gesture {
    [self becomeFirstResponder];
    self.backgroundColor = [UIColor colorWithRed:138/255.0 green:186/255.0 blue:244/255.0 alpha:1.0];
    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];
    [[UIMenuController sharedMenuController] setMenuItems:@[copyLink]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
