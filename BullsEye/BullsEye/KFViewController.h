//
//  KFViewController.h
//  BullsEye
//
//  Created by Katharine Finlay on 9/5/14.
//  Copyright (c) 2014 Kate Finlay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KFViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISlider *slider;

- (IBAction)showAlert;
- (IBAction)sliderMoved:(UISlider *)slider;

@end
