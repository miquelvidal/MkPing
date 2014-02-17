//
//  MkUITextViewLogger.h
//  MkPing
//
//  Created by 12345 on 05/05/11.
//  Copyright 2011 jj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MkTextLoggerP.h"

@interface MkUITextViewLogger : NSObject <MkTextLoggerP> {
    UITextView* textView;
    int linies,contaLinies;
}

- initWithUITextView:(UITextView*) textView;
- initWithUITextView:(UITextView*) textViewParameter withLinies:(int)liniesParameter;
- (NSString*)stringAppendingSaltLinia:(NSString*)primer amb:(NSString*)segon;
- (void)txtAutoScroll:(NSString*) txt;
- (void)passText:(NSString*) txt;
- (void)passText:(NSString*) txt code:(NSInteger)code;
@property (nonatomic,retain) UITextView* textView;
@property (nonatomic,assign) int linies;
@property (nonatomic,assign) int contaLinies;

@end
