//
//  ViewController.m
//  Transformator
//
//  Created by Ivan Najdanovic on 12/24/16.
//  Copyright © 2016 Deployed Systems. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController{
    double s,power;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#pragma mark - TexFieldDelegate
- (void)controlTextDidChange:(NSNotification *)obj;
{
    NSTextField *textField = [obj object];

    NSCharacterSet *charSet = [NSCharacterSet characterSetWithCharactersInString:@".0123456789"];

    char *stringResult = malloc([textField.stringValue length]);
    int cpt=0;
    for (int i = 0; i < [textField.stringValue length]; i++) {
        unichar c = [textField.stringValue characterAtIndex:i];
        if ([charSet characterIsMember:c]) {
            stringResult[cpt]=c;
            cpt++;
        }
    }
    stringResult[cpt]='\0';
    textField.stringValue = [NSString stringWithUTF8String:stringResult];
    free(stringResult);


    if ([textField isEqual:_dimensionATextField] || [textField isEqual:_dimensionBTextField]){
        if (_dimensionATextField.doubleValue != 0 && _dimensionBTextField.doubleValue !=0){
            s = _dimensionATextField.doubleValue * _dimensionBTextField.doubleValue;
            power = pow(s,2);
            [_powerTextField setStringValue:[NSString stringWithFormat:@"%.03f",power]];
        }else{
            [_powerTextField setStringValue:@""];
            [_primaryCurrentTextField setStringValue:@""];
            [_PrimaryTurnsTextField setStringValue:@""];
            [_primaryDiameterTextField setStringValue:@""];
            [_secondaryCurrentTextField setStringValue:@""];
            [_secondaryTurnsTextField setStringValue:@""];
            [_secondaryDiameterTextField setStringValue:@""];
        }
    }

    if ([textField isEqual:_primaryVoltageTextField]){

        if( _primaryVoltageTextField.doubleValue != 0 && s != 0 && power !=0){
            double primaryCurrent = power/_primaryVoltageTextField.doubleValue;
            [_primaryCurrentTextField setStringValue:[NSString stringWithFormat:@"%.03f",primaryCurrent]];
            double primaryTurns = 45 / s * _primaryVoltageTextField.doubleValue;
            [_PrimaryTurnsTextField setStringValue:[NSString stringWithFormat:@"%.0f",primaryTurns]];
            double primaryDiameter = 0.7 * sqrt(primaryCurrent);
            [_primaryDiameterTextField setStringValue:[NSString stringWithFormat:@"%.03f",primaryDiameter]];
        }else{
            [_primaryCurrentTextField setStringValue:@""];
            [_PrimaryTurnsTextField setStringValue:@""];
            [_primaryDiameterTextField setStringValue:@""];
        }
    }

    if ([textField isEqual:_secondaryVoltageTextField]){
        if (_secondaryVoltageTextField.doubleValue != 0 && s != 0 && power !=0){
            double secondaryCurrent = power/_secondaryVoltageTextField.doubleValue;
            [_secondaryCurrentTextField setStringValue:[NSString stringWithFormat:@"%.03f",secondaryCurrent]];
            double secondaryTurns = 45 / s * _secondaryVoltageTextField.doubleValue;
            [_secondaryTurnsTextField setStringValue:[NSString stringWithFormat:@"%.0f",secondaryTurns]];
            double secondaryDiameter = 0.7 * sqrt(secondaryCurrent);
            [_secondaryDiameterTextField setStringValue:[NSString stringWithFormat:@"%.03f",secondaryDiameter]];
        }else{
            [_secondaryCurrentTextField setStringValue:@""];
            [_secondaryTurnsTextField setStringValue:@""];
            [_secondaryDiameterTextField setStringValue:@""];
        }
    }
}


@end
