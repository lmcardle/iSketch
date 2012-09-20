//
//  SavedSketchesIconCell.h
//  SimpleSketch
//
//  Created by Liam on 9/19/12.
//  Copyright (c) 2012 MediaMarqer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AQGridView/AQGridView.h>

@interface SavedSketchesIconCell : AQGridViewCell {
    UIImageView *_iconView;
    
}

@property (nonatomic, retain) UIImage *icon;

@end
