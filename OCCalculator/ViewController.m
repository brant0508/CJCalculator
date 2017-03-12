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
    char  op;
    int  currentNumber;
    BOOL  firstOperand,isNumberator;
    Calculator  *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad {
    //覆盖应用程序载入的自定义方法

    firstOperand = YES;
    isNumberator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) processDigit:(int)digit
{
    currentNumber = currentNumber *10 +digit;

    [displayString appendString:
            [NSString stringWithFormat: @"%i",digit]];
    display.text = displayString;
}

-(IBAction)clickDigit: (UIButton *) sender
{
    long    digit = sender.tag;
        //通过获取按钮的tag属性，来获得tag的的值
    [self processDigit: (int)digit];

}

-(void) processOp:(char)theOp
{
    NSString *opStr;

    op = theOp;

    switch (theOp) {
        case '+':
            opStr = @"  +  ";
            break;
        case '-':
            opStr = @"  -  ";
            break;
            case '*':
            opStr = @"  *  ";
            break;
            case '/':
            opStr = @"  /  ";
            break;
    }

    [self storeFracPart];
    firstOperand = NO;
    isNumberator = YES;

    [displayString appendString: opStr];
    display.text = displayString;
}

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
{
    if ( firstOperand == NO)  {
        [self storeFracPart];
        [myCalculator performOperation: op];

        [displayString appendString:@" = "];
        [displayString appendString: [myCalculator.accumulator  converToString ] ];
        display.text = displayString;

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end





