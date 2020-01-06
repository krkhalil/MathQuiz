//
//  QuizVC.h
//  MathQuiz
//
//  Created by Macbook on 25/07/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuizVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *questionCount;
@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UIButton *b1;
@property (weak, nonatomic) IBOutlet UIButton *b2;
@property (weak, nonatomic) IBOutlet UIButton *b3;
@property (weak, nonatomic) IBOutlet UIButton *b4;
@property (weak, nonatomic) IBOutlet UILabel *timeLeft;


@property NSString * type;


@property (weak, nonatomic) IBOutlet UIView *resultView;


@property (weak, nonatomic) IBOutlet UILabel *resultScoreLabel;


@end

NS_ASSUME_NONNULL_END
