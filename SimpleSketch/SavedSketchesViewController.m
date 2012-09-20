//
//  SavedSketchesViewController.m
//  SimpleSketch
//
//  Created by Liam on 9/19/12.
//  Copyright (c) 2012 MediaMarqer. All rights reserved.
//

#import "SavedSketchesViewController.h"
#import "SavedSketchesIconCell.h"

@interface SavedSketchesViewController ()

@end

@implementation SavedSketchesViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(NSUInteger)numberOfItemsInGridView:(AQGridView *)gridView {
    return [_icons count];
}

-(AQGridViewCell*)gridView:(AQGridView *)gridView cellForItemAtIndex:(NSUInteger)index {
    static NSString *EmptyIdentifer = @"EmptyIdentifier";
    static NSString *CellIdentifier = @"CellIdentifier";
    
    if (index == _emptyCellIndex) {
        NSLog(@"Loading empty cell at index %u", index);
        AQGridViewCell *hiddenCell = [gridView dequeueReusableCellWithIdentifier:EmptyIdentifer];
        if (hiddenCell == nil) {
            hiddenCell = [[AQGridViewCell alloc] initWithFrame:CGRectMake(0, 0, 72, 72) reuseIdentifier:EmptyIdentifer];
        }
        hiddenCell.hidden = YES;
        return hiddenCell;
    }
    
    SavedSketchesIconCell *cell = (SavedSketchesIconCell*)[gridView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[SavedSketchesIconCell alloc] initWithFrame:CGRectMake(0, 0, 72, 72) reuseIdentifier:CellIdentifier];
    }
    cell.icon = [_icons objectAtIndex:index];
    
    return cell;
}

-(CGSize)portraitGridCellSizeForGridView:(AQGridView *)gridView {
    return CGSizeMake(192, 192);
}

@end
