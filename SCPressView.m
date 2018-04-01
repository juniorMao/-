//
//  SCPressView.m
//  BaitingMember
//
//  Created by 毛强 on 2016/11/17.
//  Copyright © 2016年 Goose. All rights reserved.
//

#import "SCPressView.h"

@implementation SCPressView

-(instancetype)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bgcolor = color;
        self.backgroundColor = color;
    }
    return self;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self makeScale];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self pressDidClick];
    });
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self restoreViewSize];
}

//重写缩小倍数
-(void)makeScale{
//    self.transform = CGAffineTransformMakeScale(0.94, 0.94);
    self.backgroundColor = BACKGROUND_COLOR;
}

-(void)restoreViewSize{
//    self.transform = CGAffineTransformIdentity;
    self.backgroundColor = self.bgcolor;
}

//重写点击事件
-(void)pressDidClick
{
//    self.transform = CGAffineTransformIdentity;
    self.backgroundColor = self.bgcolor;

    if ([self.delegate conformsToProtocol:@protocol(SCPressViewDelegate) ]) {
        [self.delegate pressViewDidClick:self];
    }
}

-(UIColor *)bgcolor{
    if (nil ==_bgcolor) {
        _bgcolor = [UIColor whiteColor];
    }
    return _bgcolor;
}


@end
