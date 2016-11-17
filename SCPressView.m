//
//  SCPressView.m
//  BaitingMember
//
//  Created by 毛强 on 2016/11/17.
//  Copyright © 2016年 Goose. All rights reserved.
//

#import "SCPressView.h"

@interface SCPressView ()
@property (nonatomic, strong)UIButton *pressButton;
@end

@implementation SCPressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (![self.subviews containsObject:self.pressButton]) {
            [self addSubview:self.pressButton];
            [self addActionSelector];
        }
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    if (![self.subviews containsObject:self.pressButton]) {
        [self addSubview:self.pressButton];
        [self addActionSelector];
    }
}

-(void)addActionSelector{
    
    [self.pressButton addTarget:self action:@selector(pressDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.pressButton addTarget:self action:@selector(makeScale) forControlEvents:UIControlEventTouchDown];
    [self.pressButton addTarget:self action:@selector(restoreViewSize) forControlEvents:UIControlEventTouchDragExit];
    
}

//重写缩小倍数
-(void)makeScale{
    self.transform = CGAffineTransformMakeScale(0.94, 0.94);
}

-(void)restoreViewSize{
    self.transform = CGAffineTransformIdentity;
}

//重写点击事件
-(void)pressDidClick
{
    self.transform = CGAffineTransformIdentity;
//    if ([self.delegate conformsToProtocol:@protocol(SCPressViewDelegate) ]) {
//        [self.delegate pressViewDidClick:self];
//    }
}

-(UIButton *)pressButton{
    if (nil == _pressButton) {
        _pressButton = [[UIButton alloc]initWithFrame:self.bounds];
        [_pressButton setImage:[UIImage imageNamed:@"Press"] forState:UIControlStateHighlighted];
        [_pressButton setShowsTouchWhenHighlighted:YES];
    }
    return _pressButton;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.pressButton.frame = self.bounds;
}
@end
