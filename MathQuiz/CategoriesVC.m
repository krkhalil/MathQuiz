//
//  CategoriesVC.m
//  MathQuiz
//
//  Created by Macbook on 25/07/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "CategoriesVC.h"
#import "QuizVC.h"

@interface CategoriesVC ()

@end

@implementation CategoriesVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = true;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = true;
}

- (IBAction)addition:(id)sender
{
    QuizVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"QuizVC"];
    v.type = @"addition";
    [self.navigationController pushViewController:v animated:YES];
}

- (IBAction)subtraction:(id)sender
{
    QuizVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"QuizVC"];
    v.type = @"subtraction";
    [self.navigationController pushViewController:v animated:YES];
}

- (IBAction)multiplication:(id)sender
{
    QuizVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"QuizVC"];
    v.type = @"multiplication";
    [self.navigationController pushViewController:v animated:YES];
}

- (IBAction)division:(id)sender
{
    QuizVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"QuizVC"];
    v.type = @"division";
    [self.navigationController pushViewController:v animated:YES];
}

- (IBAction)mix:(id)sender
{
    QuizVC * v = [self.storyboard instantiateViewControllerWithIdentifier:@"QuizVC"];
    v.type = @"mix";
    [self.navigationController pushViewController:v animated:YES];
}

@end
