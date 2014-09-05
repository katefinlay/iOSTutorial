//
//  KFViewController.m
//  BullsEye
//
//  Created by Katharine Finlay on 9/5/14.
//  Copyright (c) 2014 Kate Finlay. All rights reserved.
//

#import "KFViewController.h"

@interface KFViewController ()

@end

@implementation KFViewController
{
    int _currentValue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_currentValue = self.slider.value;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
    NSString *message = [NSString stringWithFormat:
      @"The value of the slider is: %d", _currentValue];
    
    UIAlertView *alertView = [[UIAlertView alloc]
      initWithTitle:@"Hello, World!" message:message
      delegate:nil
      cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lroundf(slider.value);
}

@end
