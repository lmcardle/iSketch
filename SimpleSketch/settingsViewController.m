//
//  SettingsViewController.m
//  SimpleSketch
//
//  Created by Liam on 9/19/12.
//  Copyright (c) 2012 MediaMarqer. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize brushSlider;
@synthesize brushValueLabel;
@synthesize brushPreview;
@synthesize opacitySlider;
@synthesize opacityValueLabel;
@synthesize opacityPreview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setBrushSlider:nil];
    [self setBrushValueLabel:nil];
    [self setBrushPreview:nil];
    [self setOpacitySlider:nil];
    [self setOpacityValueLabel:nil];
    [self setOpacityPreview:nil];
    [self setBrushSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)closePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)sliderChanged:(id)sender {
}
@end
