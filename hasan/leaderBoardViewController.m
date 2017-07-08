//
//  leaderBoardViewController.m
//  hasan
//
//  Created by Hasan Nihro Hasan Gharaibeh on 18/5/17.
//  Copyright © 2017 Hasan Nihro Hasan Gharaibeh. All rights reserved.
//

#import "leaderBoardViewController.h"
#import "MainMenuViewController.h"
#import "gameConfigration.h"


@interface leaderBoardViewController ()

@end

@implementation leaderBoardViewController
gameConfigration *conf;
NSMutableDictionary *Temp;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    conf = [gameConfigration sharedInstance];
    Temp = [[NSMutableDictionary alloc]init];
    
    
    
    NSMutableArray *sortedArray = [NSMutableArray arrayWithArray:conf.gameLeaderboard.allKeys];
     [sortedArray sortUsingSelector:@selector(localizedStandardCompare:)];
    
     int lenArray= (int)[sortedArray count];
    
    NSMutableArray *reverseString=[[NSMutableArray alloc]initWithCapacity:lenArray];
    
    for (int i = lenArray-1; i >= 0; i--) {
        [reverseString addObject:sortedArray[i]];
    }
    
    for (id key in reverseString   ) {

        id value = [conf.gameLeaderboard valueForKey:key];
        [Temp setValue:key forKey:value];
        NSLog(@"view load       %@ -->  %@",value, key);

    }
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [conf.gameLeaderboard count];
    
}
    
    

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [_TBLVIEWOUTLET dequeueReusableCellWithIdentifier:@"cell"];
   // cell.textLabel.text = [NSString stringWithFormat:@"%@     %@",@"A",@"B"];
    /*cell.textLabel.text = [NSString stringWithFormat:@"%@     %@",
                           Temp.allValues [[Temp count]-indexPath.row-1],
                           Temp.allKeys   [[Temp count]-indexPath.row-1]] ;*/

    
    cell.textLabel.text = [NSString stringWithFormat:@"%@                          %@",
                          Temp.allValues[indexPath.row],Temp.allKeys[indexPath.row]];
    
   // NSLog(@"-----the key and value are : %@    %@", Temp.allValues[indexPath.row],Temp.allKeys[indexPath.row]);
    return cell;
}


- (IBAction)backToMenu:(id)sender {
    
    
    UIStoryboard *storyboard = self.storyboard;
    MainMenuViewController *mainMenu = [storyboard instantiateViewControllerWithIdentifier:@"MainMenu"];
    [self presentViewController:mainMenu animated:YES completion:nil];
    
    

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
