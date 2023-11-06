//
//  ViewController.h
//  ObjcRequest
//
//  Created by Angelos Staboulis on 6/11/23.
//

#import <UIKit/UIKit.h>
#import "Controller.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblProbability;
@property (weak, nonatomic) IBOutlet UILabel *lblGender;
@property Controller *controller;
- (IBAction)btnClearFields:(id)sender;
- (IBAction)btnFillFields:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnFillFields;
@property (weak, nonatomic) IBOutlet UIButton *btnClearFields;

@end

