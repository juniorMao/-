//
//  SCPressView.h
//  BaitingMember
//
//  Created by 毛强 on 2016/11/17.
//  Copyright © 2016年 Goose. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCPressView;

@protocol SCPressViewDelegate <NSObject>

-(void)pressViewDidClick:(SCPressView *)pressView;

@end

@interface SCPressView : UIView
@property (nonatomic, strong) UIColor* bgcolor;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) id <SCPressViewDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color;
@end
