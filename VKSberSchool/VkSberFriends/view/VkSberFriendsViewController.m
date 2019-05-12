//
//  VkSberFriendsViewController.m
//  VKSberSchool
//
//  Created by Александр on 09/05/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

#import "VkSberFriendsViewController.h"
#import "VkSberProfileViewController.h"
#import "VkSberProfilePresenter.h"
#import "VkSberFriendsRequestService.h"
#import "VkSberFriendsTableViewCell.h"
#import "VkSberFriendsAssembly.h"
#import "VkSberFriendsModel.h"

@interface VkSberFriendsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) VkSberFriendsRequestService *service;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation VkSberFriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupUI];
	[VkSberFriendsAssembly assignView:self];
}


-(void)setupUI
{
	self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
	self.tableView.rowHeight = 100;
	
	[self.tableView registerClass:[VkSberFriendsTableViewCell class] forCellReuseIdentifier:NSStringFromClass([VkSberFriendsTableViewCell class])];
	[self.view addSubview:self.tableView];
	self.tableView.dataSource = self;
	self.tableView.delegate = self;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.presenterOutput numberOfEntities];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	VkSberFriendsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VkSberFriendsTableViewCell class]) forIndexPath:indexPath];
	
	[cell configureCell: [self.presenterOutput entityAt:indexPath.row]];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	VkSberProfileViewController *viewController = [VkSberProfileViewController new];
	VkSberFriendsModel *userId =  [self.presenterOutput entityAt:indexPath.row];
	VkSberProfilePresenter *presenter = [[VkSberProfilePresenter alloc] initWithUserId:userId.userID];
	viewController.presenterOutput = presenter;
	[self.navigationController pushViewController:viewController animated:NO];
}

#pragma mark - VkSberFriendsViewLoadedProtocol


- (void)reloadData
{
	[self.tableView reloadData];
}

- (void)assign:(id<VkSberFriendsPresenterInputProtocol>)presenterInput :(id<VkSberFriendsPresenterOutPutProtocol>)presenterOutput
{
	self.presenterOutput = presenterOutput;
	self.presenterInput = presenterInput;
	
	[self.presenterInput viewLoaded:self];
}

@end
