//
//  April5AppDelegate.h
//  April5
//
//  Created by Sunil Gopinath on 4/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface April5AppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;
}


@property (strong, nonatomic) UIWindow *window;

@end
