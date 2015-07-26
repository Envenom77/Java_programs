//
//  ViewController.m
//  BoatIt7
//
//  Created by Academy 2 on 08/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "APIManager.h"
#import "ViewController.h"
#import "PostController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITextField *usernameField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;

@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Login";
    [self.usernameField becomeFirstResponder];
    
    self.usernameField.text = @"admin@infinum.co";
    self.passwordField.text = @"infinum1";

    
 
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Actions

- (IBAction)login:(id)sender
{
    [SVProgressHUD show];
    
    
    [APIManager loginWithUsername:self.usernameField.text password:self.passwordField.text success:^(User *user) {
        [SVProgressHUD dismiss];
        
        PostViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PostController"];
        [self.navigationController pushViewController:vc animated:YES];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
