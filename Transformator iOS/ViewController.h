//
//  ViewController.h
//  Tranformator
//
//  Created by Ivan Najdanovic on 12/24/16.
//  Copyright © 2016 Deployed Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *dimensionATextField;
@property (weak, nonatomic) IBOutlet UITextField *dimensionBTextField;
@property (weak, nonatomic) IBOutlet UILabel *powerLabel;
@property (weak, nonatomic) IBOutlet UITextField *primaryVoltageTextField;
@property (weak, nonatomic) IBOutlet UILabel *primaryCurrentLabel;
@property (weak, nonatomic) IBOutlet UILabel *primaryTurnsLabel;
@property (weak, nonatomic) IBOutlet UILabel *primaryRadiusLabel;
@property (weak, nonatomic) IBOutlet UITextField *secondaryVoltageTextField;
@property (weak, nonatomic) IBOutlet UILabel *secondaryCurrentLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondaryTurnsLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondaryRadiusLabel;

@end

