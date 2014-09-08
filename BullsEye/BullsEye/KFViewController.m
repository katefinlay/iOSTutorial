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
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
}

- (void)startNewRound
{
    _round++;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

- (void)startNewGame {
    _score = 0;
    _round = 0;
    [self startNewRound];
}

- (void)updateLabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",
                                                    _targetValue];
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",
                                                    _score];
    
    self.roundLabel.text = [NSString stringWithFormat:@"%d",
                                                    _round];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert
{
    int difference = abs(_targetValue - _currentValue);
    int points = 100 - difference;
    _score += points;
    
    NSString *title;
    if (difference == 0) {
        title = @"Perfect!";
        points += 100;
    } else if (difference < 5) {
        title = @"You almost had it!";
        if (difference == 1) {
            points += 50;
        }
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    
    _score += points;
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
      initWithTitle:title
      message:message
      delegate:self
      cancelButtonTitle:@"OK"
      otherButtonTitles:nil];
    
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lroundf(slider.value);
}

- (IBAction)startOver
{
    [self startNewGame];
    [self updateLabels];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}

@end
