//
//  MkPingViewController.h
//  MkPing
//
//  Created by 12345 on 05/05/11.
//  Copyright 2011 jj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MkPingerDispatcherP.h"
#import "MkPinger.h"
#import "MkPingerDispatcher.h"
#import "MkTextLoggerP.h"
#import "MkUITextViewLogger.h"
#import "MkTextLogger.h"

#define MK_STATE_STOP 0
#define MK_STATE_INIT 1
#define MK_STATE_RUNNING 2

@interface MkPingViewController : UIViewController {
    IBOutlet UIButton* stopPing;
    IBOutlet UIButton* startPing;
    IBOutlet UITextView* textLog;
    IBOutlet UITextField* hostText;
    id<MkPingerDispatcherP> pingDispatcher;
    id<MkTextLoggerP> pingTextLogger;
    int state; //0 stopped; 1 init; 2 pinging
}
-(IBAction) btnStop:(id)sender;
-(IBAction) btnStart:(id)sender;
-(IBAction)hideKeyBoard;

@end
