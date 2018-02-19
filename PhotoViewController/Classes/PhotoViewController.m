//
//  PhotoViewController.h
//
//  Created by Nicolas Dujardin
//  Copyright (c) 2018 Nicolas Dujardin. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@property (nonatomic, strong) UIImageView *imageView;

- (void)centerScrollViewContents;
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer;
- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer;

@end

@implementation PhotoViewController

@synthesize myView = _myView;
@synthesize imageView = _imageView;
@synthesize myImage = _myImage;


-(void)orientationChanged
{
    [self centerScrollViewContents];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];

    if (self.myImage != nil)
    {
        [self performSelector:@selector(showImage) withObject:nil afterDelay:0.2];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged)
                                                 name:UIDeviceOrientationDidChangeNotification object:nil];
    
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                 name:UIDeviceOrientationDidChangeNotification object:nil];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    
    [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [menuButton setImage:[UIImage imageNamed:@"Backspace.png"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    self.navigationItem.leftBarButtonItem = menuItem;

    
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDoubleTapped:)];
    doubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapRecognizer.numberOfTouchesRequired = 1;
    [self.myView addGestureRecognizer:doubleTapRecognizer];
    
    UITapGestureRecognizer *twoFingerTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTwoFingerTapped:)];
    twoFingerTapRecognizer.numberOfTapsRequired = 1;
    twoFingerTapRecognizer.numberOfTouchesRequired = 2;
    
    [self.myView addGestureRecognizer:twoFingerTapRecognizer];
}


- (void) showImage
{
    
    for (UIView * view in self.myView.subviews)
    {
        [view removeFromSuperview];
    }
    
    
    self.imageView = [[UIImageView alloc] initWithImage:self.myImage];
    self.imageView.frame = (CGRect) {.origin=CGPointMake(0.0f,0.0f), .size=self.myImage .size};
    [self.myView addSubview:self.imageView];
    self.myView.contentSize = self.myImage.size;
    
    // Set up the minimum & maximum zoom scales
    CGRect scrollViewFrame = self.myView.frame;
    CGFloat scaleWidth = scrollViewFrame.size.width / self.myView.contentSize.width;
    CGFloat scaleHeight = scrollViewFrame.size.height / self.myView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    self.myView.minimumZoomScale = minScale;
    self.myView.maximumZoomScale = 1.0f;
    self.myView.zoomScale = minScale;
    [self centerScrollViewContents];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.imageView = nil;
    self.myView=nil;
    // Dispose of any resources that can be recreated.
}

-(void) setMyImage:(UIImage *)img{
    // Set up the image we want to scroll & zoom and add it to the scroll view
    _myImage = img;

}

- (void)centerScrollViewContents {
    CGSize boundsSize = self.myView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
    
}

- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer {
    // Get the location within the image view where we tapped
    CGPoint pointInView = [recognizer locationInView:self.imageView];
    
    // Get a zoom scale that's zoomed in slightly, capped at the maximum zoom scale specified by the scroll view
    CGFloat newZoomScale = self.myView.zoomScale * 1.5f;
    newZoomScale = MIN(newZoomScale, self.myView.maximumZoomScale);
    
    // Figure out the rect we want to zoom to, then zoom to it
    CGSize scrollViewSize = self.myView.bounds.size;
    
    CGFloat w = scrollViewSize.width / newZoomScale;
    CGFloat h = scrollViewSize.height / newZoomScale;
    CGFloat x = pointInView.x - (w / 2.0f);
    CGFloat y = pointInView.y - (h / 2.0f);
    
    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
    
    [self.myView zoomToRect:rectToZoomTo animated:YES];
}

- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer {
    // Zoom out slightly, capping at the minimum zoom scale specified by the scroll view
    CGFloat newZoomScale = self.myView.zoomScale / 1.5f;
    newZoomScale = MAX(newZoomScale, self.myView.minimumZoomScale);
    [self.myView setZoomScale:newZoomScale animated:YES];
}


- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // Return the view that we want to zoom
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // The scroll view has zoomed, so we need to re-center the contents
    [self centerScrollViewContents];
}

-(void)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
