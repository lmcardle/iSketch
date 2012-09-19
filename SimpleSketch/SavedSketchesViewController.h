//
//  SavedSketchesViewController.h
//  SimpleSketch
//
//  Created by Liam on 9/19/12.
//  Copyright (c) 2012 MediaMarqer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AQGridView/AQGridView.h>

@interface SavedSketchesViewController : UIViewController <AQGridViewDataSource, AQGridViewDelegate> {
    NSMutableArray *_icons;
    AQGridView *_gridView;
    
    NSUInteger _emptyCellIndex;
}

@end
