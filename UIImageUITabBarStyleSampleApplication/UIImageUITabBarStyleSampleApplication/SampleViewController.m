//
//  SampleViewController.m
//  UIImageUITabBarStyleSampleApplication
//
//  Created by Oliver Letterer on 24.09.11.
//  Copyright 2011 Home. All rights reserved.
//

#import "SampleViewController.h"
#import "UIImage+UITabBarStyle.h"

@implementation SampleViewController

#pragma mark - Initialization

- (id)init {
    if ((self = [super init])) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Sample" image:[UIImage imageNamed:@"145-persondot.png"] tag:0];
    }
    return self;
}

#pragma mark - View lifecycle

- (void)loadView {
    [super loadView];
    
    UIImage *tabBarImage = [UIImage imageNamed:@"145-persondot.png"];
    
    UIImageView *normalImageView = [[UIImageView alloc] initWithImage:tabBarImage];
    normalImageView.center = CGPointMake(30.0f, CGRectGetMidY(self.view.bounds));
    [self.view addSubview:normalImageView];
    
    UIImageView *unselectedImageView = [[UIImageView alloc] initWithImage:tabBarImage.unselectedTabBarStyledImage];
    unselectedImageView.center = CGPointMake(130.0f, CGRectGetMidY(self.view.bounds));
    [self.view addSubview:unselectedImageView];
    
    UIImageView *selectedImageView = [[UIImageView alloc] initWithImage:tabBarImage.selectedTabBarStyledImage];
    selectedImageView.center = CGPointMake(230.0f, CGRectGetMidY(self.view.bounds));
    [self.view addSubview:selectedImageView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
