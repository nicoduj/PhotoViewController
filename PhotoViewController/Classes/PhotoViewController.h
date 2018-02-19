//
//  PhotoViewController.h
//
//  Created by Nicolas Dujardin
//  Copyright (c) 2018 Nicolas Dujardin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController <UIScrollViewDelegate>

@property( nonatomic, retain ) UIScrollView* myView;
@property (nonatomic, strong) UIImage * myImage;

- (void) showImage;

@end




