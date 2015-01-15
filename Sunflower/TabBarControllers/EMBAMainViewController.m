

    //
//  EMBAMainViewController.m
//  Sunflower
//
//  Created by hanyazhou on 14-11-20.
//  Copyright (c) 2014年 韩亚周. All rights reserved.
//

#import "EMBAMainViewController.h"
#import "EMBAAppDelegate.h"

@interface EMBAMainViewController ()

@end

@implementation EMBAMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"message_icon.png"] tag:0];
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    }
    return self;
}

- (void)barItemClick:(UIBarButtonItem *)barButtonItem{
    if (barButtonItem.tag == 21) {
        EMBAMyCollectionViewController *myCollectionVC = [[EMBAMyCollectionViewController alloc] init];
        myCollectionVC.needPop = YES;
        [self.navigationController pushViewController:myCollectionVC animated:YES];
    }else{
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *openItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OpenBar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(openButtonPressed)];
    openItem.tag = 19;
    self.navigationItem.leftBarButtonItem = openItem;
    
    UIBarButtonItem *searchBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Search_Bar.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
    searchBarItem.tag = 20;
    UIBarButtonItem* collectBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"collect_bar_icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(barItemClick:)];
    collectBarItem.tag = 21;
        
    self.navigationItem.rightBarButtonItems = @[collectBarItem,searchBarItem];
    
    _historyArray = [[NSMutableArray alloc] init];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATEION_HEIGHT-TABBAR_HEIGHT) style:UITableViewStylePlain];
    _mainTableView.delegate = self;
    _mainTableView.dataSource  = self;
    _mainTableView.tableFooterView = [UIView new];
    [_mainTableView registerClass:[EMBAMainCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_mainTableView];
    
    for (EMConversation *conversation in [[EaseMob sharedInstance].chatManager loadAllConversationsFromDatabase]) {
        [_historyArray addObject:conversation];
    }
}

#pragma mark -
#pragma mark ChatViewControllerDelegate -
- (void)dataReload{
    [_historyArray removeAllObjects];
    for (EMConversation *conversation in [[EaseMob sharedInstance].chatManager loadAllConversationsFromDatabase]) {
        [_historyArray addObject:conversation];
    }
    [_mainTableView reloadData];
}

#pragma mark -
#pragma mark UITableViewDataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 64;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _historyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EMBAMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.firstImageView.hidden = YES;
    
    EMConversation *conversation = [_historyArray objectAtIndex:indexPath.row];
    
    cell.nameLable.text = conversation.chatter;
    cell.contentLable.text = [self subTitleMessageByConversation:conversation];
    cell.timeLable.text = [self lastMessageTimeByConversation:conversation];
    cell.numberLable.text = [NSString stringWithFormat:@"%ld",(long)[self unreadMessageCountByConversation:conversation]];
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate -
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EMConversation *conversation = [_historyArray objectAtIndex:indexPath.row];
    
    ChatViewController *messageViewController  = [[ChatViewController alloc] initWithChatter:conversation.chatter isGroup:NO];
    messageViewController.title = conversation.chatter;
    messageViewController.hidesBottomBarWhenPushed = YES;
    messageViewController.delegate = self;
    [self.navigationController pushViewController:messageViewController animated:YES];
}

    // 得到最后消息文字或者类型
-(NSString *)subTitleMessageByConversation:(EMConversation *)conversation
{
    NSString *ret = @"";
    EMMessage *lastMessage = [conversation latestMessage];
    if (lastMessage) {
        id<IEMMessageBody> messageBody = lastMessage.messageBodies.lastObject;
        switch (messageBody.messageBodyType) {
            case eMessageBodyType_Image:{
                ret = @"[图片]";
            } break;
            case eMessageBodyType_Text:{
                    // 表情映射。
                NSString *didReceiveText = [ConvertToCommonEmoticonsHelper
                                            convertToSystemEmoticons:((EMTextMessageBody *)messageBody).text];
                ret = didReceiveText;
            } break;
            case eMessageBodyType_Voice:{
                ret = @"[声音]";
            } break;
            case eMessageBodyType_Location: {
                ret = @"[位置]";
            } break;
            case eMessageBodyType_Video: {
                ret = @"[视频]";
            } break;
            default: {
            } break;
        }
    }
    
    return ret;
}

    // 得到最后消息时间
-(NSString *)lastMessageTimeByConversation:(EMConversation *)conversation
{
    NSString *ret = @"";
    EMMessage *lastMessage = [conversation latestMessage];;
    if (lastMessage) {
        ret = [NSDate formattedTimeFromTimeInterval:lastMessage.timestamp];
    }
    
    return ret;
}

    // 得到未读消息条数
- (NSInteger)unreadMessageCountByConversation:(EMConversation *)conversation
{
    NSInteger ret = 0;
    ret = conversation.unreadMessagesCount;
    
    return  ret;
}

- (void)openButtonPressed
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
