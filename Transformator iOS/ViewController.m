//
//  ViewController.m
//  Tranformator
//
//  Created by Ivan Najdanovic on 12/24/16.
//  Copyright © 2016 Deployed Systems. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    double s,power;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle =UIBarStyleBlackTranslucent;
    [numberToolbar setTranslucent:NO];
    [numberToolbar setTintColor:[UIColor whiteColor]];
    numberToolbar.items = @[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                            [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAge)]];
    [numberToolbar sizeToFit];
    self.dimensionATextField.inputAccessoryView = numberToolbar;
    self.dimensionBTextField.inputAccessoryView = numberToolbar;
    self.primaryVoltageTextField.inputAccessoryView = numberToolbar;
    self.secondaryVoltageTextField.inputAccessoryView = numberToolbar;
}

- (void)doneAge{
    [self.dimensionATextField resignFirstResponder];
    [self.dimensionBTextField resignFirstResponder];
    [self.primaryVoltageTextField resignFirstResponder];
    [self.secondaryVoltageTextField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string{

    if ([string isEqualToString:@""])
        return YES;

    return [string rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@".0123456789"]].location != NSNotFound;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{

    if ([textField isEqual:_dimensionATextField] || [textField isEqual:_dimensionBTextField]){
        if (_dimensionATextField.text.doubleValue != 0 && _dimensionBTextField.text.doubleValue !=0){
            s = _dimensionATextField.text.doubleValue * _dimensionBTextField.text.doubleValue;
            power = pow(s,2);
            [_powerLabel setText:[NSString stringWithFormat:@"%.03f",power]];
        }else{
            [_powerLabel setText:@""];
            [_primaryCurrentLabel setText:@""];
            [_primaryTurnsLabel setText:@""];
            [_primaryRadiusLabel setText:@""];
            [_secondaryCurrentLabel setText:@""];
            [_secondaryTurnsLabel setText:@""];
            [_secondaryRadiusLabel setText:@""];
        }
    }

    if ([textField isEqual:_primaryVoltageTextField]){

        if( _primaryVoltageTextField.text.doubleValue != 0 && s != 0 && power !=0){
            double primaryCurrent = power/_primaryVoltageTextField.text.doubleValue;
            [_primaryCurrentLabel setText:[NSString stringWithFormat:@"%.03f",primaryCurrent]];
            double primaryTurns = 45 / s * _primaryVoltageTextField.text.doubleValue;
            [_primaryTurnsLabel setText:[NSString stringWithFormat:@"%.0f",primaryTurns]];
            double primaryDiameter = 0.7 * sqrt(primaryCurrent);
            [_primaryRadiusLabel setText:[NSString stringWithFormat:@"%.03f",primaryDiameter]];
        }else{
            [_primaryCurrentLabel setText:@""];
            [_primaryTurnsLabel setText:@""];
            [_primaryRadiusLabel setText:@""];
        }
    }

    if ([textField isEqual:_secondaryVoltageTextField]){
        if (_secondaryVoltageTextField.text.doubleValue != 0 && s != 0 && power !=0){
            double secondaryCurrent = power/_secondaryVoltageTextField.text.doubleValue;
            [_secondaryCurrentLabel setText:[NSString stringWithFormat:@"%.03f",secondaryCurrent]];
            double secondaryTurns = 45 / s * _secondaryVoltageTextField.text.doubleValue;
            [_secondaryTurnsLabel setText:[NSString stringWithFormat:@"%.0f",secondaryTurns]];
            double secondaryDiameter = 0.7 * sqrt(secondaryCurrent);
            [_secondaryRadiusLabel setText:[NSString stringWithFormat:@"%.03f",secondaryDiameter]];
        }else{
            [_secondaryCurrentLabel setText:@""];
            [_secondaryTurnsLabel setText:@""];
            [_secondaryRadiusLabel setText:@""];
        }
    }
}

@end
