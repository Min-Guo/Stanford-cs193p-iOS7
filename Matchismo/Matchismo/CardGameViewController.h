//
//  CardGameViewController.h
//  Matchismo
//
//  Created by min guo on 6/4/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardGameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *cardSwitcher;

- (IBAction)cardSwitched:(id)sender;

@end
