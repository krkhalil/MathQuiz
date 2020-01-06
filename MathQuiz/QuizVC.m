//
//  QuizVC.m
//  MathQuiz
//
//  Created by Macbook on 25/07/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "QuizVC.h"

@interface QuizVC ()
{
    int sco;
    int questionCounter;
    NSMutableArray * questionsArray;
    
    NSDictionary * selected;
    
    
    int timer;
    NSTimer *t;
    
}

@end

@implementation QuizVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    sco = 0;
    questionCounter = 0;
    
    _resultView.hidden = true;
    
    questionsArray = [[NSMutableArray alloc] init];
    
    if ([_type isEqualToString:@"addition"])
    {
        [self setAdditionQuesitions];
    }
    else if ([_type isEqualToString:@"subtraction"])
    {
        [self setSubtractionQuesitions];
    }
    else if ([_type isEqualToString:@"multiplication"])
    {
        [self setMultiplicationQuesitions];
    }
    else if ([_type isEqualToString:@"division"])
    {
        [self setDivisionQuesitions];
    }
    else if ([_type isEqualToString:@"mix"])
    {
        [self setMixQuesitions];
    }
    
    [self setScreen];
    
    
    timer = 10;
    
    t = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                         target: self
                                       selector:@selector(timerLabel:)
                                       userInfo: nil repeats:YES];
    
    self.navigationController.navigationBar.hidden = false;
    
}


- (IBAction)b1:(id)sender
{
    if ([_b1.titleLabel.text isEqualToString:[selected valueForKey:@"result"]])
    {
        [_b1 setBackgroundColor:[UIColor greenColor]];
        [self performSelector:@selector(setScreen) withObject:nil afterDelay:2.0 ];
        
        sco = sco + 100;
    }
    else
    {
        [_b1 setBackgroundColor:[UIColor redColor]];
        [self performSelector:@selector(setScreen) withObject:nil afterDelay:2.0 ];
    }
    [self disableButtons];
}

- (IBAction)b2:(id)sender
{
    if ([_b2.titleLabel.text isEqualToString:[selected valueForKey:@"result"]])
    {
        [_b2 setBackgroundColor:[UIColor greenColor]];
        [self performSelector:@selector(setScreen) withObject:nil afterDelay:2.0 ];
        
        sco = sco + 100;
    }
    else
    {
        [_b2 setBackgroundColor:[UIColor redColor]];
        [self performSelector:@selector(setScreen) withObject:nil afterDelay:2.0 ];
    }
    [self disableButtons];
}

- (IBAction)b3:(id)sender
{
    if ([_b3.titleLabel.text isEqualToString:[selected valueForKey:@"result"]])
    {
        [_b3 setBackgroundColor:[UIColor greenColor]];
        [self performSelector:@selector(setScreen) withObject:nil afterDelay:2.0 ];
        
        sco = sco + 100;
    }
    else
    {
        [_b3 setBackgroundColor:[UIColor redColor]];
        [self performSelector:@selector(setScreen) withObject:nil afterDelay:2.0 ];
    }
    [self disableButtons];
}

- (IBAction)b4:(id)sender
{
    if ([_b4.titleLabel.text isEqualToString:[selected valueForKey:@"result"]])
    {
        [_b4 setBackgroundColor:[UIColor greenColor]];
        [self performSelector:@selector(setScreen) withObject:nil afterDelay:2.0 ];
        
        sco = sco + 100;
    }
    else
    {
        [_b4 setBackgroundColor:[UIColor redColor]];
        [self performSelector:@selector(setScreen) withObject:nil afterDelay:2.0 ];
    }
    [self disableButtons];
}


-(void) setFirstScreen
{
    
}


-(void)setScreen
{
    if (questionCounter < 10)
    {
        timer = 10;
        
        questionCounter = questionCounter + 1;
        
        _questionCount.text = [NSString stringWithFormat:@"%d", questionCounter];
        
        _score.text = [NSString stringWithFormat:@"%d", sco];
        
        NSDictionary * d = [questionsArray objectAtIndex:arc4random()%questionsArray.count ];
        
        selected = d;
        _question.text = [d objectForKey:@"question"];
        
        [_b1 setTitle:[d objectForKey:@"a1"] forState:UIControlStateNormal ];
        [_b2 setTitle:[d objectForKey:@"a2"] forState:UIControlStateNormal ];
        [_b3 setTitle:[d objectForKey:@"a3"] forState:UIControlStateNormal ];
        [_b4 setTitle:[d objectForKey:@"a4"] forState:UIControlStateNormal ];
        
        [_b1 setBackgroundColor:[UIColor whiteColor]];
        [_b2 setBackgroundColor:[UIColor whiteColor]];
        [_b3 setBackgroundColor:[UIColor whiteColor]];
        [_b4 setBackgroundColor:[UIColor whiteColor]];
        
        [self enableButtons];
    }
    else
    {
        _score.text = @"0";
        
        
        _resultScoreLabel.text = [NSString stringWithFormat:@"%d", sco];
        _resultView.hidden = false;
    }
}


-(void)disableButtons
{
    _b1.enabled = false;
    _b2.enabled = false;
    _b3.enabled = false;
    _b4.enabled = false;
    
}

-(void) enableButtons
{
    _b1.enabled = true;
    _b2.enabled = true;
    _b3.enabled = true;
    _b4.enabled = true;

}

-(void) setAdditionQuesitions
{
    NSMutableDictionary * d;
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"5 + 5" forKey:@"question"];
    [d setObject:@"5" forKey:@"a1"];
    [d setObject:@"10" forKey:@"a2"];
    [d setObject:@"15" forKey:@"a3"];
    [d setObject:@"20" forKey:@"a4"];
    [d setObject:@"10" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"15 + 5" forKey:@"question"];
    [d setObject:@"15" forKey:@"a1"];
    [d setObject:@"20" forKey:@"a2"];
    [d setObject:@"15" forKey:@"a3"];
    [d setObject:@"25" forKey:@"a4"];
    [d setObject:@"20" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"15 + 15" forKey:@"question"];
    [d setObject:@"15" forKey:@"a1"];
    [d setObject:@"20" forKey:@"a2"];
    [d setObject:@"15" forKey:@"a3"];
    [d setObject:@"30" forKey:@"a4"];
    [d setObject:@"30" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"10 + 14" forKey:@"question"];
    [d setObject:@"14" forKey:@"a1"];
    [d setObject:@"24" forKey:@"a2"];
    [d setObject:@"15" forKey:@"a3"];
    [d setObject:@"30" forKey:@"a4"];
    [d setObject:@"24" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"13 + 14" forKey:@"question"];
    [d setObject:@"14" forKey:@"a1"];
    [d setObject:@"24" forKey:@"a2"];
    [d setObject:@"27" forKey:@"a3"];
    [d setObject:@"30" forKey:@"a4"];
    [d setObject:@"27" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"21 + 14" forKey:@"question"];
    [d setObject:@"14" forKey:@"a1"];
    [d setObject:@"24" forKey:@"a2"];
    [d setObject:@"27" forKey:@"a3"];
    [d setObject:@"35" forKey:@"a4"];
    [d setObject:@"35" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"13 + 24" forKey:@"question"];
    [d setObject:@"14" forKey:@"a1"];
    [d setObject:@"37" forKey:@"a2"];
    [d setObject:@"27" forKey:@"a3"];
    [d setObject:@"30" forKey:@"a4"];
    [d setObject:@"37" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"23 + 24" forKey:@"question"];
    [d setObject:@"14" forKey:@"a1"];
    [d setObject:@"37" forKey:@"a2"];
    [d setObject:@"27" forKey:@"a3"];
    [d setObject:@"47" forKey:@"a4"];
    [d setObject:@"47" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"23 + 52" forKey:@"question"];
    [d setObject:@"75" forKey:@"a1"];
    [d setObject:@"77" forKey:@"a2"];
    [d setObject:@"27" forKey:@"a3"];
    [d setObject:@"47" forKey:@"a4"];
    [d setObject:@"75" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"43 + 12" forKey:@"question"];
    [d setObject:@"75" forKey:@"a1"];
    [d setObject:@"77" forKey:@"a2"];
    [d setObject:@"55" forKey:@"a3"];
    [d setObject:@"45" forKey:@"a4"];
    [d setObject:@"75" forKey:@"result"];
    [questionsArray addObject:d];
    
    
    
    
}

-(void) setSubtractionQuesitions
{
    NSMutableDictionary * d;
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"5 - 5" forKey:@"question"];
    [d setObject:@"5" forKey:@"a1"];
    [d setObject:@"0" forKey:@"a2"];
    [d setObject:@"15" forKey:@"a3"];
    [d setObject:@"20" forKey:@"a4"];
    [d setObject:@"0" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"15 - 5" forKey:@"question"];
    [d setObject:@"15" forKey:@"a1"];
    [d setObject:@"10" forKey:@"a2"];
    [d setObject:@"15" forKey:@"a3"];
    [d setObject:@"25" forKey:@"a4"];
    [d setObject:@"10" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"15 - 10" forKey:@"question"];
    [d setObject:@"5" forKey:@"a1"];
    [d setObject:@"2" forKey:@"a2"];
    [d setObject:@"15" forKey:@"a3"];
    [d setObject:@"3" forKey:@"a4"];
    [d setObject:@"5" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"15 - 14" forKey:@"question"];
    [d setObject:@"4" forKey:@"a1"];
    [d setObject:@"2" forKey:@"a2"];
    [d setObject:@"1" forKey:@"a3"];
    [d setObject:@"3" forKey:@"a4"];
    [d setObject:@"1" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"23 - 10" forKey:@"question"];
    [d setObject:@"14" forKey:@"a1"];
    [d setObject:@"13" forKey:@"a2"];
    [d setObject:@"37" forKey:@"a3"];
    [d setObject:@"30" forKey:@"a4"];
    [d setObject:@"13" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"21 - 14" forKey:@"question"];
    [d setObject:@"14" forKey:@"a1"];
    [d setObject:@"4" forKey:@"a2"];
    [d setObject:@"7" forKey:@"a3"];
    [d setObject:@"5" forKey:@"a4"];
    [d setObject:@"7" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"33 - 24" forKey:@"question"];
    [d setObject:@"9" forKey:@"a1"];
    [d setObject:@"8" forKey:@"a2"];
    [d setObject:@"7" forKey:@"a3"];
    [d setObject:@"10" forKey:@"a4"];
    [d setObject:@"9" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"23 - 4" forKey:@"question"];
    [d setObject:@"19" forKey:@"a1"];
    [d setObject:@"18" forKey:@"a2"];
    [d setObject:@"17" forKey:@"a3"];
    [d setObject:@"47" forKey:@"a4"];
    [d setObject:@"19" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"33 - 22" forKey:@"question"];
    [d setObject:@"12" forKey:@"a1"];
    [d setObject:@"11" forKey:@"a2"];
    [d setObject:@"13" forKey:@"a3"];
    [d setObject:@"17" forKey:@"a4"];
    [d setObject:@"11" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"43 - 12" forKey:@"question"];
    [d setObject:@"31" forKey:@"a1"];
    [d setObject:@"22" forKey:@"a2"];
    [d setObject:@"21" forKey:@"a3"];
    [d setObject:@"32" forKey:@"a4"];
    [d setObject:@"31" forKey:@"result"];
    [questionsArray addObject:d];
}

-(void) setMultiplicationQuesitions
{
    NSMutableDictionary * d;
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"5 * 5" forKey:@"question"];
    [d setObject:@"25" forKey:@"a1"];
    [d setObject:@"10" forKey:@"a2"];
    [d setObject:@"15" forKey:@"a3"];
    [d setObject:@"20" forKey:@"a4"];
    [d setObject:@"25" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"15 * 5" forKey:@"question"];
    [d setObject:@"75" forKey:@"a1"];
    [d setObject:@"70" forKey:@"a2"];
    [d setObject:@"65" forKey:@"a3"];
    [d setObject:@"25" forKey:@"a4"];
    [d setObject:@"75" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"15 * 15" forKey:@"question"];
    [d setObject:@"225" forKey:@"a1"];
    [d setObject:@"220" forKey:@"a2"];
    [d setObject:@"215" forKey:@"a3"];
    [d setObject:@"230" forKey:@"a4"];
    [d setObject:@"225" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"10 * 14" forKey:@"question"];
    [d setObject:@"140" forKey:@"a1"];
    [d setObject:@"240" forKey:@"a2"];
    [d setObject:@"150" forKey:@"a3"];
    [d setObject:@"300" forKey:@"a4"];
    [d setObject:@"140" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"13 * 14" forKey:@"question"];
    [d setObject:@"142" forKey:@"a1"];
    [d setObject:@"242" forKey:@"a2"];
    [d setObject:@"272" forKey:@"a3"];
    [d setObject:@"182" forKey:@"a4"];
    [d setObject:@"182" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"21 * 14" forKey:@"question"];
    [d setObject:@"294" forKey:@"a1"];
    [d setObject:@"224" forKey:@"a2"];
    [d setObject:@"227" forKey:@"a3"];
    [d setObject:@"235" forKey:@"a4"];
    [d setObject:@"294" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"13 * 24" forKey:@"question"];
    [d setObject:@"314" forKey:@"a1"];
    [d setObject:@"337" forKey:@"a2"];
    [d setObject:@"312" forKey:@"a3"];
    [d setObject:@"330" forKey:@"a4"];
    [d setObject:@"312" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"23 * 24" forKey:@"question"];
    [d setObject:@"514" forKey:@"a1"];
    [d setObject:@"552" forKey:@"a2"];
    [d setObject:@"527" forKey:@"a3"];
    [d setObject:@"547" forKey:@"a4"];
    [d setObject:@"552" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"23 * 52" forKey:@"question"];
    [d setObject:@"1175" forKey:@"a1"];
    [d setObject:@"1177" forKey:@"a2"];
    [d setObject:@"1196" forKey:@"a3"];
    [d setObject:@"1147" forKey:@"a4"];
    [d setObject:@"1196" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"43 * 12" forKey:@"question"];
    [d setObject:@"575" forKey:@"a1"];
    [d setObject:@"757" forKey:@"a2"];
    [d setObject:@"555" forKey:@"a3"];
    [d setObject:@"516" forKey:@"a4"];
    [d setObject:@"516" forKey:@"result"];
    [questionsArray addObject:d];
}

-(void) setDivisionQuesitions
{
    NSMutableDictionary * d;
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"5 / 5" forKey:@"question"];
    [d setObject:@"1" forKey:@"a1"];
    [d setObject:@"10" forKey:@"a2"];
    [d setObject:@"5" forKey:@"a3"];
    [d setObject:@"0" forKey:@"a4"];
    [d setObject:@"1" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"15 / 5" forKey:@"question"];
    [d setObject:@"5" forKey:@"a1"];
    [d setObject:@"2" forKey:@"a2"];
    [d setObject:@"3" forKey:@"a3"];
    [d setObject:@"8" forKey:@"a4"];
    [d setObject:@"3" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"15 / 10" forKey:@"question"];
    [d setObject:@"1.5" forKey:@"a1"];
    [d setObject:@"2.0" forKey:@"a2"];
    [d setObject:@"1.9" forKey:@"a3"];
    [d setObject:@"3.0" forKey:@"a4"];
    [d setObject:@"1.5" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"10 / 14" forKey:@"question"];
    [d setObject:@"0.714" forKey:@"a1"];
    [d setObject:@"0.224" forKey:@"a2"];
    [d setObject:@"0.125" forKey:@"a3"];
    [d setObject:@"0.340" forKey:@"a4"];
    [d setObject:@"0.714" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"13 / 14" forKey:@"question"];
    [d setObject:@"0.929" forKey:@"a1"];
    [d setObject:@"0.924" forKey:@"a2"];
    [d setObject:@"0.934" forKey:@"a3"];
    [d setObject:@"0.830" forKey:@"a4"];
    [d setObject:@"0.929" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"21 / 14" forKey:@"question"];
    [d setObject:@"1.4" forKey:@"a1"];
    [d setObject:@"2.4" forKey:@"a2"];
    [d setObject:@"1.5" forKey:@"a3"];
    [d setObject:@"3.5" forKey:@"a4"];
    [d setObject:@"1.5" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"13 / 24" forKey:@"question"];
    [d setObject:@"0.514" forKey:@"a1"];
    [d setObject:@"0.535" forKey:@"a2"];
    [d setObject:@"0.566" forKey:@"a3"];
    [d setObject:@"0.542" forKey:@"a4"];
    [d setObject:@"0.542" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"25 / 24" forKey:@"question"];
    [d setObject:@"1.014" forKey:@"a1"];
    [d setObject:@"1.237" forKey:@"a2"];
    [d setObject:@"1.027" forKey:@"a3"];
    [d setObject:@"1.047" forKey:@"a4"];
    [d setObject:@"1.014" forKey:@"result"];
    [questionsArray addObject:d];
    
    d = [[NSMutableDictionary alloc] init];
    [d setObject:@"43 / 12" forKey:@"question"];
    [d setObject:@"3.75" forKey:@"a1"];
    [d setObject:@"3.77" forKey:@"a2"];
    [d setObject:@"3.55" forKey:@"a3"];
    [d setObject:@"3.583" forKey:@"a4"];
    [d setObject:@"3.583" forKey:@"result"];
    [questionsArray addObject:d];
}

-(void) setMixQuesitions
{
    [self setAdditionQuesitions];
    [self setMultiplicationQuesitions];
    [self setSubtractionQuesitions];
    [self setDivisionQuesitions];
}


-(void)timerLabel:(NSTimer *)timer1
{
    NSDictionary *dic=[timer1 observationInfo];
    timer=timer-1;
    _timeLeft.text = [NSString stringWithFormat:@"%d",timer];
    
    if(timer==0 && questionCounter < 10)
    {
        
        [self setScreen];
    }
}
- (IBAction)menuButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
