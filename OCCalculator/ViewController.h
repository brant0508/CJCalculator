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

-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFracPart;

//数字键

-(IBAction)clickDigit:(UIButton *) sender;

// 算术操作键

-(IBAction) clickPlus;
-(IBAction) clickminus;
-(IBAction) clickMultiply;
-(IBAction) clickdivide;

//功能键

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;


@end





