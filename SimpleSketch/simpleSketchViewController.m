//
//  simpleSketchViewController.m
//  SimpleSketch
//
//  Created by Liam on 9/11/12.
//  Copyright (c) 2012 MediaMarqer. All rights reserved.
//

#import "simpleSketchViewController.h"
#import "SettingsViewController.h"

@interface simpleSketchViewController ()

@end

@implementation simpleSketchViewController

@synthesize primarySketch;
@synthesize tempSketch;


- (void)viewDidLoad
{
    
    red = 0/255;
    green = 0/255;
    blue = 0/255;
    brush = 10;
    opacity = 1.0;
    [super viewDidLoad];
	
}

- (void)viewDidUnload
{
    [self setPrimarySketch:nil];
    [self setTempSketch:nil];

    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    swiped = NO;
    UITouch *touch = [touches anyObject];
    lastPoint = [touch locationInView:self.view];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    swiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.tempSketch.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeNormal);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.tempSketch.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.tempSketch setAlpha:opacity];
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!swiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [self.tempSketch.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), brush);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), red, green, blue, opacity);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        self.tempSketch.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.primarySketch.frame.size);
    [self.primarySketch.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.tempSketch.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:opacity];
    self.primarySketch.image = UIGraphicsGetImageFromCurrentImageContext();
    self.tempSketch.image = nil;
    UIGraphicsEndImageContext();
    
}



- (IBAction)colorPressed:(id)sender {
    
    UIButton *pressedButton = (UIButton*)sender;
    switch (pressedButton.tag) {
        case 0:
            red = 0/255;
            green = 0/255;
            blue = 0/255;
            break;
            
        case 1:
            red = 0/255;
            green = 0/255;
            blue = 255/255;
            break;
            
        case 2:
            red = 255/255;
            green = 0/255;
            blue = 0/255;
            break;
            
        default:
            break;
    }
}

- (IBAction)eraserPressed:(id)sender {
    red = 255/255;
    green = 255/255;
    blue = 255/255;
    opacity = 1;
}

- (IBAction)resetPressed:(id)sender {
    self.primarySketch.image = nil;
}

- (IBAction)savePressed:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Save to Photo Library", @"Send via Mail", nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        UIGraphicsBeginImageContext(primarySketch.bounds.size);
        [primarySketch.image drawInRect:CGRectMake(0, 0, primarySketch.frame.size.width, primarySketch.frame.size.height)];
        UIImage *saveImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        UIImageWriteToSavedPhotosAlbum(saveImage, self, @selector(image:didFinishSavingWithError:withContext:), nil);
        
    } else if (buttonIndex == 1) {
        //send image via email
    }
}

-(void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error withContext:(void*)context {
    if (!error) {
        UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your sketch was saved successfully" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [success show];
    } else {
        UIAlertView *fail = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error in saving your sketch" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [fail show];
    }
}

- (IBAction)settingsPressed:(id)sender {
    
    SettingsViewController *settings = [SettingsViewController new];
    settings.delegate = self;
    settings.brush = brush;
    settings.opacity = opacity;
    settings.red = red;
    settings.green = green;
    settings.blue = blue;
    [self presentModalViewController:settings animated:YES];
}

-(void)closeSettings:(id)sender {
    brush = ((SettingsViewController*)sender).brush;
    opacity = ((SettingsViewController*)sender).opacity;
    red = ((SettingsViewController*)sender).red;
    green = ((SettingsViewController*)sender).green;
    blue = ((SettingsViewController*)sender).blue;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
