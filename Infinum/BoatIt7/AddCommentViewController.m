//
//  AddCommentViewController.m
//  BoatIt7
//
//  Created by Academy 5 on 22/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "AddCommentViewController.h"
#import "PostDetailsViewController.h"
#import "APIManager.h"

@interface AddCommentViewController () 

@property (nonatomic, weak) IBOutlet UITextView *textView;


@end

@implementation AddCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (IBAction)previousScreen:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
 
}

- (IBAction)postComment:(id)sender
{
    [_delegate reloadComments:_textView.text];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
