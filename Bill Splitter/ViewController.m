//
//  ViewController.m
//  Bill Splitter
//
//  Created by Arsalan Vakili on 2015-06-20.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *totalBillEntered;
@property (weak, nonatomic) IBOutlet UISlider *rangeOfPeople;
@property (weak, nonatomic) IBOutlet UILabel *amountOfBillForEachPerson;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateSplitAmount:(id)sender {
    
    NSNumberFormatter *currencyFormat= [[NSNumberFormatter alloc ]init];
    currencyFormat.numberStyle= NSNumberFormatterDecimalStyle;
    
    NSNumber *billtotal=[currencyFormat numberFromString:self.totalBillEntered.text];
    
    if (billtotal == nil ) {
        self.amountOfBillForEachPerson.text= @"Please enter a valid number";
    }
    else {
        double billAmountEntered= [billtotal doubleValue];
        int numberOfPeople= self.rangeOfPeople.value;
        double amountPerPerson= billAmountEntered / numberOfPeople;
        NSString *amountInString= [NSString stringWithFormat:@"$%0.1f", amountPerPerson];
        self.amountOfBillForEachPerson.text= amountInString;
    }
    
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}




@end
