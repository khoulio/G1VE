//
//  MainVC.m
//  AMSlideMenu
//
//  Created by Artur Mkrtchyan on 12/24/13.
//  Copyright (c) 2013 Artur Mkrtchyan. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end

@implementation MainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    //view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"colorWutiko.png"]];
    view.backgroundColor = [self colorFromHexString:@"#009900"];
    [self fixStatusBarWithView:view];
}
                            
                            // Assumes input like "#00FF00" (#RRGGBB).
                        - (UIColor *)colorFromHexString:(NSString *)hexString {
                                unsigned rgbValue = 0;
                                NSScanner *scanner = [NSScanner scannerWithString:hexString];
                                [scanner setScanLocation:1]; // bypass '#' character
                                [scanner scanHexInt:&rgbValue];
                                return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
                            }
/*----------------------------------------------------*/
#pragma mark - Overriden Methods -
/*----------------------------------------------------*/

- (NSString *)segueIdentifierForIndexPathInLeftMenu:(NSIndexPath *)indexPath
{
    NSString *identifier = @"";
    if (indexPath.section==0) {
    
    
    switch (indexPath.row) {
        case 0:
            identifier = @"home";
            break;
        case 7:
            identifier = @"social";
            break;
        
    }
    }
    if (indexPath.section==3) {
        
        
        switch (indexPath.row) {
            case 0:
                identifier = @"home";
                break;
            case 1:
                identifier = @"social";
                break;
                
        }
    }
    if (indexPath.section==2) {
        
        
        switch (indexPath.row) {
            case 0:
                identifier = @"home";
                break;
            case 7:
                identifier = @"social";
                break;
                
        }
    }
    
    
    
    return identifier;
}

/*- (NSString *)segueIdentifierForIndexPathInRightMenu:(NSIndexPath *)indexPath
{
    NSString *identifier = @"";
    switch (indexPath.row) {
        case 0:
            identifier = @"firstRow";
            break;
        case 1:
            identifier = @"secondRow";
            break;
    }
    
    return identifier;
}
*/
- (CGFloat)leftMenuWidth
{
    return 250;
}

- (CGFloat)rightMenuWidth
{
    return 250;
}

- (void)configureLeftMenuButton:(UIButton *)button
{
    CGRect frame = button.frame;
    frame = CGRectMake(0, 0, 25, 13);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    [button setImage:[UIImage imageNamed:@"simpleMenuButton"] forState:UIControlStateNormal];
}

- (void)configureRightMenuButton:(UIButton *)button
{
    CGRect frame = button.frame;
    frame = CGRectMake(0, 0, 25, 13);
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    [button setImage:[UIImage imageNamed:@"simpleMenuButton"] forState:UIControlStateNormal];
}

- (void) configureSlideLayer:(CALayer *)layer
{
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 1;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowRadius = 5;
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:layer.bounds].CGPath;
}

- (AMPrimaryMenu)primaryMenu
{
    return AMPrimaryMenuLeft;
}


// Enabling Deepnes on left menu
- (BOOL)deepnessForLeftMenu
{
    return YES;
}

// Enabling Deepnes on left menu
- (BOOL)deepnessForRightMenu
{
    return YES;
}

@end
