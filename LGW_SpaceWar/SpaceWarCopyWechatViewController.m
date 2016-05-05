//
//  SpaceWarCopyWechatViewController.m
//  LGW_SpaceWar
//
//  Created by Lilong on 16/4/19.
//  Copyright © 2016年 第七代目. All rights reserved.
//

#import "SpaceWarCopyWechatViewController.h"

#import <SpriteKit/SpriteKit.h>
#import <SpriteKit/SpriteKitBase.h>
#import <MediaPlayer/MediaPlayer.h>  

#import "SKMainScene.h"

@interface SpaceWarCopyWechatViewController ()
@property (weak, nonatomic) IBOutlet SKView *skView;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
@property (weak, nonatomic) IBOutlet UIView *setBgView; 
@property (weak, nonatomic) IBOutlet UIButton *restartOneBtn; // 重新开始
@property (weak, nonatomic) IBOutlet UIButton *continueBtn; //继续
@property (weak, nonatomic) IBOutlet UILabel *fractionLab; //最高分数
@property (weak, nonatomic) IBOutlet UILabel *timeLab; // 所用时间
@property (weak, nonatomic) IBOutlet UIView *gameOverBgView;
@property (weak, nonatomic) IBOutlet UIButton *restartTwoBtn; // 重新开始
@property (strong, nonatomic) NSTimer *timer;
@property (assign, nonatomic) NSInteger times;
@end

@implementation SpaceWarCopyWechatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
    
    self.setBgView.hidden = YES;
    self.gameOverBgView.hidden = YES;

    [self setLocalizations];
    // Create and configure the scene.
    SKScene * scene = [SKMainScene sceneWithSize:self.skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    self.times = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    // Present the scene.
    [self.skView presentScene:scene];
    
    [self setAllTimeHigh];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gameOver) name:@"gameOverNotification" object:nil];
    
}

- (void)setLocalizations{
    [self.restartOneBtn setTitle:NSLocalizedString(@"restarting",@"这是一句注解，根据情况写") forState:UIControlStateNormal];
    [self.restartTwoBtn setTitle:NSLocalizedString(@"restarting",@"这是一句注解，根据情况写") forState:UIControlStateNormal];
    [self.continueBtn setTitle:NSLocalizedString(@"continue",@"这是一句注解，根据情况写") forState:UIControlStateNormal];
}

- (void)updateTimer:(NSTimer *)sender{
    self.times = self.times + 1;
}

- (void)setAllTimeHigh{
    //保存历史最高分数和时间
     NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"AllTimeHigh"];
    NSString *score = dict[@"score"];
    NSString *times = dict[@"time"];
    if (score.length < 1) {
        self.fractionLab.text = NSLocalizedString(@"highestScoreNO",@"");
    }else{
      self.fractionLab.text = [NSString stringWithFormat:@"%@：%@ %@",NSLocalizedString(@"highestScore",@""),dict[@"score"],NSLocalizedString(@"points",@"")];
    }
    if (times.length < 1) {
       self.timeLab.text = NSLocalizedString(@"useTimeNO",@"");
    }else{
        self.timeLab.text = [NSString stringWithFormat:@"%@：%@ %@",NSLocalizedString(@"useTime",@""),dict[@"time"],NSLocalizedString(@"seconds",@"")];
    }
}


- (void)showSetBgView{
    self.setBgView.hidden = NO;
    self.setBgView.alpha = 0.0;
    self.setBgView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.300];
    [UIView animateWithDuration:0.3 animations:^{
        self.setBgView.alpha = 1.0;
    }];
    self.gameOverBgView.hidden = YES;
}
- (void)showGameOverBgView{
    self.setBgView.hidden = YES;
    self.gameOverBgView.hidden = NO;
    self.gameOverBgView.alpha = 0.0;
    self.gameOverBgView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.300];
    [UIView animateWithDuration:0.3 animations:^{
        self.gameOverBgView.alpha = 1.0;
    }];
}

- (void)showGameView{
    self.setBgView.hidden = YES;
    self.gameOverBgView.hidden = YES;
    self.skView.paused = NO;
}

- (void)gameOver{
    //关闭定时器
    [self.timer setFireDate:[NSDate distantFuture]];
    [self showGameOverBgView];
    
    //所用时间  秒
    NSString *useTimes = [NSString stringWithFormat:@"%ld",(long)self.times];
    [[NSUserDefaults standardUserDefaults] setObject:useTimes forKey:@"useTimes"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self setAllTimeHigh];
    self.times = 0;
}

//暂停
- (IBAction)stopBtn:(id)sender {
    //关闭定时器
    [self.timer setFireDate:[NSDate distantFuture]];
    self.skView.paused = YES;
    [self showSetBgView];
    [self setAllTimeHigh];
}

//重新开始
- (IBAction)restartAction:(id)sender {
    self.times = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    [self showGameView];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"restartNotification" object:nil];
}

//继续
- (IBAction)continueAction:(id)sender {
    //开启定时器
    [self.timer setFireDate:[NSDate distantPast]];
    [self showGameView];
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

@end
