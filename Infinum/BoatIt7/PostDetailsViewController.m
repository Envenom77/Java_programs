//
//  PostDetailsViewController.m
//  BoatIt7
//
//  Created by Academy 5 on 17/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "PostDetailsViewController.h"

#import <SVProgressHUD/SVProgressHUD.h>
#import "Comment.h"
#import "AddCommentViewController.h"
#import "APIManager.h"

@interface PostDetailsViewController () <AddCommentDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *comments;

@end

@implementation PostDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = _titleLabel;
    _imageView.image = self.img;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd  target:self action:@selector(Add:)];
    
    [SVProgressHUD show];
    [APIManager getThreadsWithSuccess2:(self.number) success:^(NSArray *comments) {
        self.comments = comments;
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];

    
}

#pragma mark - UITableView datasource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    
    Comment *comment = self.comments[indexPath.row];
    
   
    cell.textLabel.text = comment.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", comment.author.lastName,comment.author.firstName ];
    
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}


- (void) reloadComments:(NSString *)data
{
    [APIManager postNewComment:self.post.postId data:data success:^(NSArray *comments) {
        [SVProgressHUD show];
        [APIManager getThreadsWithSuccess2:(self.number) success:^(NSArray *comments) {
            self.comments = comments;
            [self.tableView reloadData];
            [SVProgressHUD dismiss];
        } failure:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:error.localizedDescription];
        }];

        
    } failure:^(NSError *error) {
        NSLog(@"Fail to load new comments %@", error.localizedDescription);
    }];

    [self.tableView reloadData];
    
}


-(IBAction)Add:(id)sender
{
    AddCommentViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AddCommentController"];
    vc.delegate = self;
    [self.navigationController presentViewController:vc animated:YES completion:NULL];
   
}

#pragma mark - Actions

- (IBAction)upboat:(id)sender
{
    [APIManager postNewComment:self.post.postId data:@"Komentar" success:^(NSArray *comments) {
        NSLog(@"Success");
    } failure:^(NSError *error) {
        NSLog(@"Failire %@", error.localizedDescription);
    }];
    
//    [APIManager upboatPostWithId:self.post.postId success:^(Post *post) {
//        NSLog(@"success");
//    } failure:^(NSError *error) {
//        NSLog(@"%@", error.localizedDescription);
//    }];
}

- (IBAction)downboat:(id)sender
{
    [APIManager downboatPostWithId:self.post.postId success:^(Post *post) {
        NSLog(@"success");
    } failure:^(NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
