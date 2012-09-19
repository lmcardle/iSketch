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
@synthesize redSlider;
@synthesize greenSlider;
@synthesize blueSlider;
@synthesize redValueLabel;
@synthesize greenValueLabel;
@synthesize blueValueLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {
    int redValue = self.red * 255;
    self.redSlider.value = redValue;
    [self sliderChanged:self.redSlider];
    
    int greenValue = self.green * 255;
    self.greenSlider.value = greenValue;
    [self sliderChanged:self.greenSlider];
    
    int blueValue = self.blue * 255;
    self.blueSlider.value = blueValue;
    [self sliderChanged:self.blueSlider];
    
    self.brushSlider.value = self.brush;
    [self sliderChanged:self.brushSlider];
    
    self.opacitySlider.value = self.opacity;
    [self sliderChanged:self.opacitySlider];
    
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
    [self setRedSlider:nil];
    [self setGreenSlider:nil];
    [self setBlueSlider:nil];
    [self setRedValueLabel:nil];
    [self setGreenValueLabel:nil];
    [self setBlueValueLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)closePressed:(id)sender {
    [self.delegate closeSettings:self];
}
- (IBAction)sliderChanged:(id)sender {
    UISlider *changedSlider = (UISlider*)sender;
    
    if (changedSlider == self.brushSlider) {
        self.brush = self.brushSlider.value;
        self.brushValueLabel.text = [NSString stringWithFormat:@"%.1f", self.brush];
    } else if(changedSlider == self.opacitySlider) {
        self.opacity = self.opacitySlider.value;
        self.opacityValueLabel.text = [NSString stringWithFormat:@"%.1f", self.opacity];
    } else if(changedSlider == self.redSlider) {
        self.red = self.redSlider.value/255;
        self.redValueLabel.text = [NSString stringWithFormat:@"Red: %d", (int)self.redSlider.value];
    } else if(changedSlider == self.greenSlider) {
        self.green = self.greenSlider.value/255;
        self.greenValueLabel.text = [NSString stringWithFormat:@"Green: %d", (int)self.greenSlider.value];
    } else if(changedSlider == self.blueSlider) {
        self.blue = self.blueSlider.value/255;
        self.blueValueLabel.text = [NSString stringWithFormat:@"Blue: %d", (int)self.blueSlider.value];
    }
    
    UIGraphicsBeginImageContext(self.brushPreview.frame.size);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), self.brush);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.red, self.green, self.blue, 1);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 45, 45);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 45, 45);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.brushPreview.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContext(self.opacityPreview.frame.size);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 20.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), self.red, self.green, self.blue, self.opacity);
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 45, 45);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 45, 45);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.opacityPreview.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

@end
