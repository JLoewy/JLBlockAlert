//
//  JLViewController.m
//  BlockAlert
//
//  Created by Jason Loewy on 1/25/14.
//  Copyright (c) 2014 Jason Loewy. All rights reserved.
//

#import "JLViewController.h"

#import "BlockAlertView.h"

@interface JLViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *blockSegmentedControl;

@end

@implementation JLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 Responsible for presenting the block alert demo
 PARAMETERS:
 sender -> The UIButton that is responsible for firing this method
 */
- (IBAction)showButtonPressed:(UIButton *)sender
{
    NSString* actionTitle      = (_inputTextField.text.length > 0) ? _inputTextField.text : @"Submit";
    BlockAlertView* blockAlert = [[BlockAlertView alloc] initWithTitle:@"Block Alert" message:@"This alert uses blocks." delegate:Nil cancelButtonTitle:@"Cancel" otherButtonTitles:actionTitle, nil];
    
    //----
    // Implement the block that is called based off of the segmented controller selection
    // You can set more than one block if you would like
    // This is just to demonstrate the difference
    //----
    switch (_blockSegmentedControl.selectedSegmentIndex) {
        case 0:
            [blockAlert setClickedButtonBlock:^(BlockAlertView *alertView, NSInteger buttonIndex) {
               
                NSLog(@"Clicked Block Fired");
                
            }];
            break;
        case 1:
            [blockAlert setWillDismissBlock:^(BlockAlertView *alertView, NSInteger buttonIndex) {
               
                NSLog(@"Will Dismiss Fired");
                
            }];
            break;
        case 2:
            [blockAlert setDidDismissBlock:^(BlockAlertView *alertView, NSInteger buttonIndex) {
                
                NSLog(@"Did Dismiss Fired");
            }];
            break;
        default:
            break;
    }
    
    [blockAlert show];
}

@end
