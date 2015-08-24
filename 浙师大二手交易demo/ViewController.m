//
//  ViewController.m
//  浙师大二手交易demo
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 Michael. All rights reserved.
//
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
#import "ViewController.h"
#import "ZFMessage.h"
#import "ZFMessageCell.h"
#import "ZFMessageFrame.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *messageFrames;
//@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

//懒加载
- (NSArray *)messageFrames{
    if (_messageFrames == nil) {
        //1.加载模型数据
        NSArray *messages = [ZFMessage messagesList];
        NSMutableArray *tmpArray = [NSMutableArray array];
        //2.创建frame模型
        for (ZFMessage *msg in messages) {
            ZFMessageFrame *msgFrame = [[ZFMessageFrame alloc] init];
            msgFrame.message = msg;
            [tmpArray addObject:msgFrame];
        }
        _messageFrames = tmpArray;
    }
    return _messageFrames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //测试
    NSLog(@"%@",self.messageFrames);
    //隐藏滚动条

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    //隐藏滚动条
    tableView.showsVerticalScrollIndicator = NO;
//    [self.view bringSubviewToFront:self.tableView];
    
//    self.view.backgroundColor = [UIColor whiteColor];

    //设置navigation的标题
    self.title = @"发现二手";
    //设置navigationbar的半透明
    [self.navigationController.navigationBar setTranslucent:YES];
    ////设置navigationbar标题的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],UITextAttributeTextColor, nil]];
    //设置navigationbar的颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:50/255.0f green:177/255.0f  blue:163/255.0f alpha:1.0f]];
    //设置navigationbar左边按钮
    UIImage *btnLeftImage = [UIImage imageNamed:@"btn_left.png"];
    CGRect backframe = CGRectMake(0,0,40,36);
    UIButton *leftButton= [[UIButton alloc] initWithFrame:backframe];
    [leftButton setBackgroundImage:btnLeftImage forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:Nil];
    //设置navigationbar右边按钮
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:Nil];
    //设置navigationbar上左右按钮字体颜色
//    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.创建自定义可重用的cell
    ZFMessageCell *cell = [ZFMessageCell messageCellWithTableView:tableView];
    //2.给cell内部的子控件赋值
    cell.messageFrame = self.messageFrames[indexPath.row];
//    cell.textLabel.text = message.text;
    //3.返回cell
    return cell;
}

//返回行高
//#pragma mark - tableView的代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.messageFrames[indexPath.row] rowHeight];
}

@end
