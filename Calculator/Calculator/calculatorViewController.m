//
//  calculatorViewController.m
//  Calculator
//
//  Created by sanket on 14/01/2014.
//  Copyright (c) 2014 Techmentation. All rights reserved.
//

#import "calculatorViewController.h"

@interface calculatorViewController () {
    BOOL isOperatorUsed;
    
}

@end

@implementation calculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(BOOL)doesString:(NSString *)string containCharacter:(char)character
{
    if ([string rangeOfString:[NSString stringWithFormat:@"%c",character]].location != NSNotFound)
    {
        return YES;
    }
    return NO;
}

- (float) calculate: (NSString *)screenStr {
    
//    NSString *operator = nil;
    NSArray *calculationData;

    if ([self doesString:screenStr containCharacter:'*']) {
        calculationData = [screenStr componentsSeparatedByString:@"*"];
        
        return [calculationData[0]  floatValue] * [calculationData[1] floatValue];
        
    }
    
    else  if ([self doesString:screenStr containCharacter:'/']) {
        calculationData = [screenStr componentsSeparatedByString:@"/"];
        
        return [calculationData[0]  floatValue] / [calculationData[1] floatValue];
        
    }
    
    else  if ([self doesString:screenStr containCharacter:'+']) {
        calculationData = [screenStr componentsSeparatedByString:@"+"];
        
        return [calculationData[0]  floatValue] + [calculationData[1] floatValue];
        
    }

    else  if ([self doesString:screenStr containCharacter:'-']) {
        calculationData = [screenStr componentsSeparatedByString:@"-"];
        
        return [calculationData[0]  floatValue] - [calculationData[1] floatValue];
        
    }

    
    
    
    return 10.6;
}


- (IBAction)setScreenNumbers:(UIButton *)sender
{
    
    
    
    
    if ([sender.currentTitle isEqualToString:@"="]) {
        
        screenLabel.text = [NSString stringWithFormat:@"%f",[self calculate:screenLabel.text] ];
        
        return;
    }
    
    
    if ([sender.currentTitle isEqualToString:@"+"]||[sender.currentTitle isEqualToString:@"-"]||[sender.currentTitle isEqualToString:@"/"]||[sender.currentTitle isEqualToString:@"*"])
    {
        if ([screenLabel.text hasSuffix:@"+"]||[screenLabel.text hasSuffix:@"-"]||[screenLabel.text hasSuffix:@"/"]||[screenLabel.text hasSuffix:@"*"]||[screenLabel.text hasSuffix:@"="]){
            
            screenLabel.text = screenLabel.text;
        }
        
        else
        {
            screenLabel.text = [screenLabel.text stringByAppendingString:sender.currentTitle] ;
        }
    }
    
    else if([screenLabel.text isEqualToString:@"0"]) {
        screenLabel.text = sender.currentTitle;
    }
    else
    {
        
        
        
        screenLabel.text = [screenLabel.text stringByAppendingString:sender.currentTitle] ;
        
    }
    
    
}


@end
