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

@interface SpaceWarCopyWechatViewController ()
@property (weak, nonatomic) IBOutlet SKView *skView;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;

@property (weak, nonatomic) IBOutlet UIView *setBgView; 
@property (weak, nonatomic) IBOutlet UIButton *restartOneBtn; // 重新开始
@property (weak, nonatomic) IBOutlet UIButton *musicBtn; // 音乐开关
@property (weak, nonatomic) IBOutlet UIButton *continueBtn; //继续
@property (weak, nonatomic) IBOutlet UILabel *fractionLab; //最高分数
@property (weak, nonatomic) IBOutlet UILabel *timeLab; // 所用时间
@property (weak, nonatomic) IBOutlet UIView *gameOverBgView;
@property (weak, nonatomic) IBOutlet UIButton *restartTwoBtn; // 重新开始

@end

@implementation SpaceWarCopyWechatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.skView.showsFPS = YES;
    self.skView.showsNodeCount = YES;
    
    self.setBgView.hidden = YES;
    self.gameOverBgView.hidden = YES;
    [self showSetBgView];
    // Do any additional setup after loading the view.
}

- (void)showSetBgView{
    self.setBgView.hidden = NO;
    self.setBgView.alpha = 0.0;
    self.setBgView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.300];
    [UIView animateWithDuration:0.3 animations:^{
        self.setBgView.alpha = 1.0;
    }];
}
//暂停
- (IBAction)stopBtn:(id)sender {
}

//重新开始
- (IBAction)restartAction:(id)sender {
}
//音乐开或者关
- (IBAction)musicAction:(id)sender {
}
//继续
- (IBAction)continueAction:(id)sender {
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
