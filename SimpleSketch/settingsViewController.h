//
//  SettingsViewController.h
//  SimpleSketch
//
//  Created by Liam on 9/19/12.
//  Copyright (c) 2012 MediaMarqer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *brushSlider;
@property (weak, nonatomic) IBOutlet UILabel *brushValueLabel;
@property (weak, nonatomic) IBOutlet UIImageView *brushPreview;
@property (weak, nonatomic) IBOutlet UISlider *opacitySlider;
@property (weak, nonatomic) IBOutlet UILabel *opacityValueLabel;
@property (weak, nonatomic) IBOutlet UIImageView *opacityPreview;
- (IBAction)sliderChanged:(id)sender;
@end
