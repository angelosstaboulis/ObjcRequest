//
//  ViewController.m
//  ObjcRequest
//
//  Created by Angelos Staboulis on 6/11/23.
//

#import "ViewController.h"
#import "Controller.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialValues];
    // Do any additional setup after loading the view.
    
}
-(void) initialValues{
    _controller = [[Controller alloc] init];
    [[_btnFillFields layer] setCornerRadius:22];
    [[_btnClearFields layer] setCornerRadius:22];
}
- (IBAction)btnFillFields:(id)sender {
    __weak ViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->_controller createRequest:@"luc" :^(GenderModel * _Nonnull dict) {
            __strong ViewController *strongSelf = weakSelf;
            dispatch_async(dispatch_get_main_queue(), ^{
                [[strongSelf lblName] setText:[dict name]];
                [[strongSelf lblGender] setText:[dict gender]];
                [[strongSelf lblProbability] setText:[NSString stringWithFormat:@"%@",[dict probability]]];
            });
        }];
    });
}

- (IBAction)btnClearFields:(id)sender {
    [_lblName setText:@""];
    [_lblGender setText:@""];
    [_lblProbability setText:@""];
}
@end
