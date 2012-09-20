//
//  SavedSketchesIconCell.m
//  SimpleSketch
//
//  Created by Liam on 9/19/12.
//  Copyright (c) 2012 MediaMarqer. All rights reserved.
//

#import "SavedSketchesIconCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation SavedSketchesIconCell

-(id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier];
    if (self == nil)
        return nil;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 72, 72) cornerRadius:18];
    
    _iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 72, 72)];
    _iconView.backgroundColor = [UIColor clearColor];
    _iconView.opaque = NO;
    _iconView.layer.shadowPath = path.CGPath;
    _iconView.layer.shadowRadius = 20;
    _iconView.layer.shadowOpacity = 0.4;
    _iconView.layer.shadowOffset = CGSizeMake(20, 20);
    
    [self.contentView addSubview:_iconView];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    self.contentView.opaque = NO;
    self.opaque = NO;
    self.selectionStyle = AQGridViewCellSelectionStyleNone;
    
    return self;
}

-(UIImage*)icon {
    return _iconView.image;
}

-(void)setIcon:(UIImage *)icon {
    _iconView.image = icon;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
