//
//  MkPingViewController.m
//  MkPing
//
//  Created by 12345 on 05/05/11.
//  Copyright 2011 jj. All rights reserved.
//

#import "MkPingViewController.h"

@implementation MkPingViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    state = MK_STATE_INIT;
    pingDispatcher = [MkPingerDispatcher new];
    pingTextLogger= [[MkUITextViewLogger alloc] initWithUITextView:textLog withLinies:20];
    //[textLog setContentOffset:10];
    //pingTextLogger= [[MkTextLogger alloc] init];
    [pingDispatcher setTextLogger:pingTextLogger];
    state = MK_STATE_STOP;
    //[textLog setCon
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(IBAction) btnStop:(id)sender{
    
    switch (state) {
        case MK_STATE_RUNNING:
            [hostText resignFirstResponder];
            [pingDispatcher stopAllPingers];
            //[pingDispatcher releaseAllPingers];
            state = MK_STATE_STOP;
            [pingTextLogger passText:@"Ping stopped"];
            break;
        case MK_STATE_INIT:
            [pingTextLogger passText:@"Can't stop initializing"];
            break;
        default:
            [pingTextLogger passText:@"Already stopped"];
            break;
    }
        
    //[textLog setText:@""];
    //NSLog(@"Parando Pingers");
    //[sender setBackgroundColor:[UIColor blackColor]];

}
-(IBAction) btnStart:(id)sender{
    switch (state) {
        case MK_STATE_STOP:
            [hostText resignFirstResponder];
            NSString* host = [hostText text];
            //NSLog(@"host: %@",host);
            MkPinger* pinger = [MkPinger pingerHostName:host pingDispatcher:pingDispatcher];
            state = MK_STATE_INIT;
            [pinger startPinger];
            [pingDispatcher addPinger:pinger];
            state = MK_STATE_RUNNING;
            //NSLog(@"Staring pinger");
            break;
        default:
            [pingTextLogger passText:@"Ping already running"];
            break;
    }
       
  //  [sender setBackgroundColor:[UIColor blackColor]];

//    [pinger init

}
-(IBAction)hideKeyBoard
{
	//Para esconder el teclado le decimos que desista de entrar datos
	[hostText resignFirstResponder];
    
    
}
@end
