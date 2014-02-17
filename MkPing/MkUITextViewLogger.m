//
//  MkUITextViewLogger.m
//  MkPing
//
//  Created by 12345 on 05/05/11.
//  Copyright 2011 jj. All rights reserved.
//

#import "MkUITextViewLogger.h"


@implementation MkUITextViewLogger

@synthesize textView;
@synthesize linies;
@synthesize contaLinies;
- initWithUITextView:(UITextView*) textViewParameter {
    if ([super init] == self) {
        self.textView = textViewParameter;
        [textView setText:@""];
        
    }
    return self;
    
}
- initWithUITextView:(UITextView*) textViewParameter withLinies:(int)liniesParameter {
    if ([super init] == self) {
        self.textView = textViewParameter;
        self.linies = liniesParameter;
        [textView setText:@""];
        
    }
    return self;
    
}
/*
 for (int temp = 0; temp < [txt length]; temp++){ //run through the string
 if ([txt characterAtIndex: temp] == '\n')
 contaLinies++;
 }    
 */
/*
 - (void)textViewDidChange:(UITextView *)uiViewContent{
 if ((uiViewContent.contentOffset.y + uiViewContent.frame.size.height) < self.entryTextField2.contentSize.height){
 self.entryTextField2.text=[self.entryTextField2.text substringToIndex:[self.entryTextField2.text length] - 1];
 }
 }
 */
- (NSString*)stringAppendingSaltLinia:(NSString*)primer amb:(NSString*)segon{
    NSString* primerSalt = nil;
    if (contaLinies > 0) primerSalt = [primer stringByAppendingString:@"\n"];
    else primerSalt = @"";
    primerSalt = [primerSalt stringByAppendingString:segon];
    return primerSalt;
     
}
-(void)txtAutoScroll:(NSString*) txt{
    contaLinies++;
    [self.textView setText:txt];
    if (contaLinies>=linies) {
        //[self.textView text]
        CGPoint scrollPoint;
        scrollPoint = [self.textView contentOffset];
        NSLog(@"Height %f",textView.frame.size.height);
        NSLog(@"contentOffset %f",scrollPoint.y);
        scrollPoint.y= scrollPoint.y+30;
        NSLog(@"contentOffset %f",scrollPoint.y);
        [self.textView setContentOffset:scrollPoint animated:YES]; 
    }
    
    //[self.textView contentOffset
    
    /*NSRange range = NSMakeRange(textView.text.length - 1, 1);
     [textView scrollRangeToVisible:range];
    */ 
}

- (void)passText:(NSString*) txt {
    [self txtAutoScroll:[self stringAppendingSaltLinia:[textView text] amb:txt]];
    
}
- (void)passText:(NSString*) txt code:(NSInteger)code{
    [self txtAutoScroll:[self stringAppendingSaltLinia:[textView text] amb:txt]];
}


@end
