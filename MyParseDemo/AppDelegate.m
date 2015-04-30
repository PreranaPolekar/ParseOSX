//
//  AppDelegate.m
//  MyParseDemo
//
//  Created by betterlabs on 4/30/15.
//  Copyright (c) 2015 BetterLabs. All rights reserved.
//

#import "AppDelegate.h"
#import <ParseOSX/ParseOSX.h>
#import <OSAKit/OSAKit.h>


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [Parse enableLocalDatastore];
    
    [Parse setApplicationId:@"Q9Oq2XmwoukyoqjrQ9wyD3DesC4k307OMBCTOtq8"
                  clientKey:@"MnFVjeWENvhEYtWpT0r16vj8kD0JvyAriQ1Yv6Qa"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:nil];

    //PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    //testObject[@"foo"] = @"bar";
    //[testObject saveInBackground];
    //NSLog(@"Object Saved");
    
    PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
    gameScore[@"score"] = @2288;
    gameScore[@"playerName"] = @"Brett Lee";
    gameScore[@"cheatMode"] = @YES;
    
    [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
              // The object has been saved.
            NSLog(@"Object saved");
        } else {
            // There was a problem, check error.description
            NSLog(@"Error thrown, please check");
        }
    }];
    
    
}




- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)getData:(id)sender {
    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
    [query getObjectInBackgroundWithId:@"Dhxtw2NqZV" block:^(PFObject *gameScore, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", gameScore);
    }];
    
}
@end
