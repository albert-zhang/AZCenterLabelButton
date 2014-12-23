//
//  AZViewController.m
//  AZCenterLabelButton
//
//  Created by albert-zhang on 12/22/2014.
//  Copyright (c) 2014 albert-zhang. All rights reserved.
//

#import "AZViewController.h"
#import <AZCenterLabelButton/AZCenterLabelButton.h>

@interface AZViewController ()

@end

@implementation AZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	AZCenterLabelButton *btn = [[AZCenterLabelButton alloc] init];
	[btn setImage:[UIImage imageNamed:@"btn"] forState:UIControlStateNormal];
	[btn setTitle:@"Hello Meizai!" forState:UIControlStateNormal];
	[btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
	[btn setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
	[btn sizeToFit];
	[self.view addSubview:btn];
	
	btn.center = self.view.center;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
