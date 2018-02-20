//
//  PhotoViewController.h
//
//  Created by Nicolas Dujardin
//  Copyright (c) 2018 Nicolas Dujardin. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 Instances of `PhotoViewController` create a viewController that supports UIScrollViewDelegate
 
 In order to use this, you need to :
 - inherit form this interface like this : @interface MyViewController : PhotoViewController
 - In your viewDidLoad event :
    - Set the UIScrollView : self.myView = self.mainView; (assuming you have an IBOutlet to your UIScrollView named "mainView" on your storyboard)
    - Set the image self.myImage = [UIImage imageNamed:@"toto.jpg"]; (you can do it later, bnut in this case you will need to call showImage().
 
 */
@interface PhotoViewController : UIViewController <UIScrollViewDelegate>

/**
 Specifies the scrollView that will be used
 */
@property( nonatomic, retain ) UIScrollView* myView;

/**
Specifies the image that will be displayed
 */
@property (nonatomic, strong) UIImage * myImage;

/**
Allows you to force image refresh in case you changed it.
 */
- (void) showImage;

@end




