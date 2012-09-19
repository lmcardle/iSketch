//
//  simpleSketchViewController.h
//  SimpleSketch
//
//  Created by Liam on 9/11/12.
//  Copyright (c) 2012 MediaMarqer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface simpleSketchViewController : UIViewController <SettingsViewControllerDelegate, UIActionSheetDelegate> {
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL swiped;
}

@property (weak, nonatomic) IBOutlet UIImageView *primarySketch;
@property (weak, nonatomic) IBOutlet UIImageView *tempSketch;



- (IBAction)colorPressed:(id)sender;

- (IBAction)eraserPressed:(id)sender;

- (IBAction)resetPressed:(id)sender;

- (IBAction)savePressed:(id)sender;
- (IBAction)settingsPressed:(id)sender;
- (IBAction)mySketchesPressed:(id)sender;
@end
