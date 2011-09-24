//
//  SampleViewController.m
//  UIImageUITabBarStyleSampleApplication
//
//  Created by Oliver Letterer on 24.09.11.
//  Copyright 2011 Home. All rights reserved.
//

#import "SampleViewController.h"


@implementation SampleViewController

#pragma mark - Initialization

- (id)init {
    if ((self = [super init])) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Sample" image:[UIImage imageNamed:@"145-persondot.png"] tag:0];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
