//
//  ViewController.h
//  OCCalculator
//
//  Created by 崔健 on 16/4/5.
//  Copyright © 2016年 崔健. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (strong, nonatomic)  IBOutlet  UILabel  *display;

    //处理显示点击数字
-(void) processDigit: (int) digit;
    //判断点击运算符
-(void) processOp: (char) theOp;
    //判断是否进行分数计算
-(void) storeFracPart;

//获取点击数字
-(IBAction)clickDigit:(UIButton *) sender;

// 算术操作运算            +  -  *  ／
// count  numbers
-(IBAction) clickPlus;
-(IBAction) clickminus;
-(IBAction) clickMultiply;
-(IBAction) clickdivide;

//功能键
// 区分分子分母,进行第一个分数的分母输入、执行计算、清除当前计算
-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;


@end





