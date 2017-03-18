//
//  ViewController.m
//  OCCalculator
//
//  Created by 崔健 on 16/4/5.
//  Copyright © 2016年 崔健. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"


@implementation ViewController
{
    char  op;       //     判断操作符
    int  currentNumber;     //  表示现在输入的数字
    BOOL  firstOperand,isNumberator;//  跟踪第一个和第二个操作数，以及用户当前输入的操作数的分子和分母
    Calculator  *myCalculator;      //用于执行分数之间的计算的计算器对象
    NSMutableString *displayString;     //用于存储显示当前结果的字符串
}

@synthesize display; //合成属性

- (void)viewDidLoad {
    //覆盖应用程序载入的自定义方法
    //初始化
    firstOperand = YES;
    isNumberator = YES;
    displayString = [NSMutableString stringWithCapacity:40]; //限定字符串容量
    myCalculator = [[Calculator alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) processDigit:(int)digit
{
        //显示当前数字
    currentNumber = digit;
        //show   pressed  number
    [displayString appendString:
            [NSString stringWithFormat: @"%i",currentNumber]];
    display.text = displayString;
}

-(IBAction)clickDigit: (UIButton *) sender
{

    long   digit = sender.tag;
        //通过获取按钮的tag属性，来获得tag上的数字
    [self processDigit: (int)digit];

}

    //判断操作符
-(void) processOp:  (char)  theOp
{
    //用于临时储存操作符号
    NSString  *opString;

    op = theOp;

    switch (theOp) {
        case '+':
            opString = @"  +  ";
            break;
        case '-':
            opString = @"  -  ";
            break;
            case '*':
            opString = @"  *  ";
            break;
            case '/':
            opString = @"  /  ";
            break;
    }
//每次操作运算符判断之后进行   是否为分数计算判断
    [self storeFracPart];
//    进行第二个操作数或者第二个分数的输入
    firstOperand = NO;
    isNumberator = YES;

        //添加操作符并更新视图
    [displayString appendString: opString];
    display.text = displayString;
}

//分数计算或者操作数计算判断
-(void)storeFracPart
{
    if (firstOperand) {
        if (isNumberator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumberator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }

    currentNumber = 0;
}

-(IBAction) clickOver
{
    [self storeFracPart];
    isNumberator = NO;
    [displayString appendString: @" / "];
    display.text = displayString;
}

//算法操作键
-(IBAction)  clickPlus
{
    [self processOp:'+'];
}

-(IBAction) clickminus
{
    [self processOp:'-'];
}

-(IBAction) clickMultiply
{
    [self processOp:'*'];
}

-(IBAction) clickdivide
{
    [self processOp:'/'];
}

//功能键

-(IBAction) clickEquals
{           //
    if ( firstOperand == NO)  {
        [self storeFracPart];
        [myCalculator performOperation: op];

        [displayString appendString:@" = "];
            //传入分数计算结果，转换成字符串
        [displayString appendString: [myCalculator.accumulator  converToString ] ];
        display.text = displayString;
            //重设
        currentNumber = 0;
        isNumberator = YES;
        firstOperand = YES;
        [displayString setString:@" "];
    }

}

-(IBAction) clickClear
{
    isNumberator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];

    [displayString setString: @" "];
    display.text = displayString;
}

@end










