//
//  ViewController+PostController.m
//  BoatIt7
//
//  Created by Academy 2 on 10/07/15.
//  Copyright (c) 2015 JosipGatjal. All rights reserved.
//

#import "PostController.h"

#import "APIManager.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "Post.h"
#import "PostDetailsViewController.h"




@interface PostViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *posts;

@property (nonatomic, strong) NSMutableArray *imagesArray;

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic,strong) UIImage *image;

@end

@implementation PostViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Posts";
    
    //init fields
    _titleArray = [NSMutableArray array];
    _imagesArray = [NSMutableArray array];
    
    _image = [UIImage imageNamed:@"NoImage.jpg"];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [SVProgressHUD show];
    [APIManager getThreadsWithSuccess:^(NSArray *posts) {
        self.posts = posts;
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
    
    
    //refresh
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    

}


- (void)refresh:(UIRefreshControl *)refreshControl {
    [self.tableView reloadData];
    // Do your job, when done:
    [refreshControl endRefreshing];
}



#pragma mark - UITableView datasource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    
    Post *post = self.posts[indexPath.row];
    
    cell.textLabel.text = post.title;
    cell.detailTextLabel.text = post.imageUrl;
    
    
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:post.imageUrl]]];
    
    //add titles to array
    [_titleArray addObject:post.title];
    
    //send images array to postdetails controller
    
    
    if ([UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:post.imageUrl]]] != nil)
        {
            
            [_imagesArray addObject:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:post.imageUrl]]]];
        }
    else
    {
        [_imagesArray addObject:_image];
    }
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Post *post = self.posts[indexPath.row];
    

    
    PostDetailsViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PostDetailsController"];
    
    vc.titleLabel = _titleArray[indexPath.row];
    
    vc.number = post.postId;
    
    vc.post = post;
    
    //set image
    vc.img = [_imagesArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end