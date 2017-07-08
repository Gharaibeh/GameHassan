//
//  MainMenuViewController.m
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import "MainMenuViewController.h"
#import "InputValidator.h"
#import "gameCounterViewController.h"
#import "gameConfigration.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController
gameConfigration *con;
@synthesize inputText;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
 
    con = [gameConfigration sharedInstance];
   
}

 




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)pressPlay:(id)sender {
    
    InputValidator *userInput = [[InputValidator alloc]init];
     if(![userInput checkInput:inputText.text])
    {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"please type your name" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *btnAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){}];
        [alert addAction:btnAction ];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    else
    {
        con.userName = self.inputText.text;
        UIStoryboard *storyboard = self.storyboard;
        gameCounterViewController *counter = [storyboard instantiateViewControllerWithIdentifier:@"Timer"];
        [self presentViewController:counter animated:YES completion:nil];

        
    }
    
}

@end
