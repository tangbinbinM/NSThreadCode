//
//  ViewController.m
//  NSThread使用
//
//  Created by YiGuo on 2017/10/18.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "ViewController.h"
#import "TBBThread.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self createThread1];
}

-(void)createThread1{
    //创建线程对像
    //第一个参数要执行方法对应的对象，第二个选择执行的方法，第三个函数参数
    //    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"tbb"];
    //    thread.name = @"Thread1";
    //    [thread start];
    //测试线程什么时候死亡
    TBBThread *thread = [[TBBThread alloc] initWithTarget:self selector:@selector(run:) object:@"tbb"];
    thread.name = @"Thread1";
    [thread start];
}

//创建线程后自动启动线程(不需要配制线程其它属性时使用)
-(void)createThread2{
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"tbb2"];
}

//隐式创建并启动线程
-(void)createThread3{
    [self performSelectorInBackground:@selector(run:) withObject:@"tbb3"];
}

-(void)run:(NSString *)str{
    for (NSInteger i = 0 ;i<1000 ;i++) {
        NSLog(@"---run--%zd--%@--str:%@--ThreadName:%@",i,[NSThread currentThread],str,[NSThread currentThread].name);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
