//
//  ViewController.h
//  Transformator
//
//  Created by Ivan Najdanovic on 12/24/16.
//  Copyright © 2016 Deployed Systems. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTextFieldDelegate>

@property (weak) IBOutlet NSTextField *dimensionATextField;
@property (weak) IBOutlet NSTextField *dimensionBTextField;
@property (weak) IBOutlet NSTextField *powerTextField;
@property (weak) IBOutlet NSTextField *primaryVoltageTextField;
@property (weak) IBOutlet NSTextField *primaryCurrentTextField;
@property (weak) IBOutlet NSTextField *PrimaryTurnsTextField;
@property (weak) IBOutlet NSTextField *primaryDiameterTextField;
@property (weak) IBOutlet NSTextField *secondaryVoltageTextField;
@property (weak) IBOutlet NSTextField *secondaryCurrentTextField;
@property (weak) IBOutlet NSTextField *secondaryTurnsTextField;
@property (weak) IBOutlet NSTextField *secondaryDiameterTextField;

@end

