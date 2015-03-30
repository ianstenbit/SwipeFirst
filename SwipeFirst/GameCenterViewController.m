//
//  GameCenterViewController.m
//  SwipeFirst
//
//  Created by Jared Weinstein on 3/28/15.
//  Copyright (c) 2015 CCHS. All rights reserved.
//

#import "GameCenterViewController.h"

@interface GameCenterViewController ()

@end

@implementation GameCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showLeaderboardAndAchievements:YES];
    
    GKScore *score;
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if([prefs doubleForKey: [NSString stringWithFormat:@"HS%d",0]] != 0){
        score.value = [prefs doubleForKey: [NSString stringWithFormat:@"HS%d",0]];
    }
    // Do any additional setup after loading the view.
    //[self showLeaderboardAndAchievements:YES];
}

-(void)showLeaderboardAndAchievements:(BOOL)shouldShowLeaderboard{
    GKGameCenterViewController *gcViewController = [[GKGameCenterViewController alloc] init];
    
    gcViewController.gameCenterDelegate = self;
    
    if (shouldShowLeaderboard) {
        gcViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
        //gcViewController.leaderboardIdentifier = _leaderboardIdentifier;
    }
    else{
        gcViewController.viewState = GKGameCenterViewControllerStateAchievements;
    }
    
    [self presentViewController:gcViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
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