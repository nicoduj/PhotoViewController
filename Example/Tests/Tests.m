//
//  PhotoViewControllerTests.m
//  PhotoViewControllerTests
//
//  Created by Nicolas Dujardin on 02/19/2018.
//  Copyright (c) 2018 Nicolas Dujardin. All rights reserved.
//

// https://github.com/Specta/Specta
#import <PhotoViewController/PhotoViewController.h>


SpecBegin(InitialSpecs)

__block PhotoViewController*  pvc;

describe(@"Verify that view is loaded", ^{
    
    before(^{
        pvc = (PhotoViewController*)[UIApplication sharedApplication].keyWindow.rootViewController;
    });
    
    it(@"Verifying the valid views", ^{
        XCTAssertNotNil(pvc.view);
    });
    
    it(@"Verifying that the image is set", ^{
        XCTAssertNotNil(pvc.myImage);
    });
    
    it(@"Verifying that the image is set in the view", ^{
        XCTAssert(pvc.myView.subviews.count > 0);
    });
    
    
});

/*
describe(@"these will fail", ^{

    it(@"can do maths", ^{
        expect(1).to.equal(2);
    });

    it(@"can read", ^{
        expect(@"number").to.equal(@"string");
    });
    
    it(@"will wait for 10 seconds and fail", ^{
        waitUntil(^(DoneCallback done) {
        
        });
    });
});

describe(@"these will pass", ^{
    
    it(@"can do maths", ^{
        expect(1).beLessThan(23);
    });
    
    it(@"can read", ^{
        expect(@"team").toNot.contain(@"I");
    });
    
    it(@"will wait and succeed", ^{
        waitUntil(^(DoneCallback done) {
            done();
        });
    });
});
 */

SpecEnd

