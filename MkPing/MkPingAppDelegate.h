//
//  MkPingAppDelegate.h
//  MkPing
//
//  Created by 12345 on 05/05/11.
//  Copyright 2011 jj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MkPingViewController;

@interface MkPingAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MkPingViewController *viewController;


@end
