//
//  ViewController.m
//  MathQuiz
//
//  Created by Macbook on 24/07/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "ViewController.h"
#import "CategoriesVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = true;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = true;
}

- (IBAction)startButton:(id)sender
{
    CategoriesVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"CategoriesVC"];
    [self.navigationController pushViewController:v animated:YES];
}



@end
