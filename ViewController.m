//
//  ViewController.m
//  iOS11_ScrollView_Issue
//
//  Created by Shivaiah, Mahesh | TECD on 2018/01/16.
//  Copyright © 2018 Shivaiah, Mahesh | TECD. All rights reserved.
//

#import "ViewController.h"

typedef struct
{
    NSLayoutAttribute attribute, from;
    NSLayoutRelation  relation;
    CGFloat           multiplier;
    CGFloat           constant;
    UILayoutPriority  priority;
    const char*       identifier;
} _rauthentication_constraint_attributes_t;

@interface ViewController ()

@property(nonatomic) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scrollView = [UIScrollView new];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.view = _scrollView;
    
    UITextField *userName = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 400)];
    userName.placeholder = @"Enter User Name";
    userName.backgroundColor = [UIColor redColor];
    userName.translatesAutoresizingMaskIntoConstraints = NO;
    [_scrollView addSubview:userName];
    
    UITextField *passWord = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    passWord.text = @"Enter Password";
    passWord.backgroundColor = [UIColor greenColor];
    passWord.translatesAutoresizingMaskIntoConstraints = NO;
    [_scrollView addSubview:passWord];
    
    UIButton *login = [UIButton buttonWithType:UIButtonTypeCustom];
    [login setTitle:@"Login" forState:UIControlStateNormal];
    [login setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    login.titleLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:16];
    login.translatesAutoresizingMaskIntoConstraints = NO;
    [_scrollView addSubview:login];
    
    NSLayoutConstraint *usernameTopConstraint = [NSLayoutConstraint constraintWithItem:userName attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:300.0];
    
    NSLayoutConstraint *userNameCenterConstraint = [NSLayoutConstraint constraintWithItem:userName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *passwordTopConstraint = [NSLayoutConstraint constraintWithItem:passWord attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:userName attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *passwordCenterConstraint = [NSLayoutConstraint constraintWithItem:passWord attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    NSLayoutConstraint *loginButtonTopConstraint = [NSLayoutConstraint constraintWithItem:login attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:passWord attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *loginButtonCenterConstraint = [NSLayoutConstraint constraintWithItem:login attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    
    UILabel *emptyView = UILabel.new;
    emptyView.backgroundColor = [UIColor redColor];
    
    [_scrollView addSubview:emptyView];
    
    NSLayoutConstraint *emptyUIViewBottomConstraint = [NSLayoutConstraint constraintWithItem:emptyView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    
    [NSLayoutConstraint activateConstraints:@[usernameTopConstraint,userNameCenterConstraint, passwordTopConstraint,passwordCenterConstraint, loginButtonTopConstraint, loginButtonCenterConstraint, emptyUIViewBottomConstraint]];
    
    
    
    _scrollView.contentSize = CGSizeMake( self.view.frame.size.width, userName.frame.size.height + 500);
    
}


@end
