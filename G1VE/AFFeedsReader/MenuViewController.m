//
//  MenuViewController.m
//  MySlideMenuApp
//
//  Created by Jules Gueye on 07/03/13.
//  Copyright (c) 2013 Julux. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "MenuViewController.h"
#import "MenuCell.h"
#import "DarkViewController.h"
#import "LightViewController.h"
#import "MainVC.h"
@interface MenuViewController (){
    NSString *urlFeeds;
}

@end

@implementation MenuViewController-(id) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        // Assign self to the slideMenuDataSource because self will implement SASlideMenuDatSource
        self.slideMenuDataSource = self;
        self.slideMenuDelegate = self;
    }
    return self;
}

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        // Assign self to the slideMenuDataSource because self will implement SASlideMenuDataSource
        self.slideMenuDataSource = self;
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return YES;
}


#pragma mark -
#pragma mark SASlideMenuDataSource
// The SASlideMenuDataSource is used to provide the initial segueid that represents the initial visibile view controller and to provide eventual additional configuration to the menu button

// This is the indexPath selected at start-up
-(NSIndexPath*) selectedIndexPath{
    return [NSIndexPath indexPathForRow:0 inSection:0];
}

-(NSString*) segueIdForIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return @"senenews.com";
    }else if (indexPath.row == 1){
        return @"wiwsport.com";
    }else{
        return @"leral.net";
    }
}

-(Boolean) allowContentViewControllerCachingForIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(Boolean) disablePanGestureForIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        return YES;
    }
    return NO;
}

// This is used to configure the menu button. The beahviour of the button should not be modified
-(void) configureMenuButton:(UIButton *)menuButton{
    menuButton.frame = CGRectMake(0, 0, 40, 29);
    [menuButton setImage:[UIImage imageNamed:@"menuicon.png"] forState:UIControlStateNormal];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"menuhighlighted.png"] forState:UIControlStateHighlighted];
    [menuButton setAdjustsImageWhenHighlighted:NO];
    [menuButton setAdjustsImageWhenDisabled:NO];
}

-(void) configureSlideLayer:(CALayer *)layer{
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOpacity = 0.3;
    layer.shadowOffset = CGSizeMake(-15, 0);
    layer.shadowRadius = 10;
    layer.masksToBounds = NO;
    layer.shadowPath =[UIBezierPath bezierPathWithRect:layer.bounds].CGPath;
}

-(CGFloat) leftMenuVisibleWidth{
    return 280;
}
-(void) prepareForSwitchToContentViewController:(UINavigationController *)content{
    UIViewController* controller = [content.viewControllers objectAtIndex:0];
    if ([controller isKindOfClass:[MainVC class]]) {
         MainVC *mainVC = (MainVC*)controller;
        [mainVC setSiteName:urlFeeds];
        if([urlFeeds isEqualToString:@"senenews.com"]){
            mainVC.urlFeeds=@"http://www.senenews.com/feed";
        }
        if([urlFeeds isEqualToString:@"wiwsport.com"]){
            mainVC.urlFeeds=@"http://www.wiwsport.com/rss/fluxrss.xml";
        }
        if([urlFeeds isEqualToString:@"seneweb.com"]){
            mainVC.urlFeeds=@"http://www.seneweb.com/dynamic/modules/news/rss/syndication.php";
        }
        if([urlFeeds isEqualToString:@"rewmi.com"]){
            mainVC.urlFeeds=@"http://feeds.feedburner.com/Rewmi";
            
        }
        if([urlFeeds isEqualToString:@"leral.net"]){
            mainVC.urlFeeds=@"http://leral.net/xml/syndication.rss";
        }
        if([urlFeeds isEqualToString:@"nettali.net"]){
            mainVC.urlFeeds=@"http://www.nettali.net/spip.php?page=backend";
        }
        if([urlFeeds isEqualToString:@"ndamli.sn"]){
            mainVC.urlFeeds=@"http://ndamli.sn/index.php?format=feed&type=rss";
        }
        if([urlFeeds isEqualToString:@"senesport.info"]){
            mainVC.urlFeeds=@"http://senesport.info/main/?feed=rss2";
        }
        if([urlFeeds isEqualToString:@"dakaractu.com"]){
            mainVC.urlFeeds=@"http://www.dakaractu.com/xml/syndication.rss";
        }
        if([urlFeeds isEqualToString:@"xibar.net"]){
            mainVC.urlFeeds=@"http://www.xibar.net/xml/syndication.rss";
        }
        if([urlFeeds isEqualToString:@"senxibar.com"]){
            mainVC.urlFeeds=@"http://www.senxibar.com/xml/syndication.rss";
        }
        if([urlFeeds isEqualToString:@"facedakar.com"]){
            mainVC.urlFeeds=@"http://www.facedakar.com/feed";
        }
        if([urlFeeds isEqualToString:@"senego.net"]){
            mainVC.urlFeeds=@"http://senego.net/feed";
        }
    
    
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    urlFeeds=segue.identifier;
    
}
#pragma mark -
#pragma mark SASlideMenuDelegate

-(void) slideMenuWillSlideIn{
    NSLog(@"slideMenuWillSlideIn");
}
-(void) slideMenuDidSlideIn{
    NSLog(@"slideMenuDidSlideIn");
}
-(void) slideMenuWillSlideToSide{
    NSLog(@"slideMenuWillSlideToSide");
}
-(void) slideMenuDidSlideToSide{
    NSLog(@"slideMenuDidSlideToSide");
    
}
-(void) slideMenuWillSlideOut{
    NSLog(@"slideMenuWillSlideOut");
    
}
-(void) slideMenuDidSlideOut{
    NSLog(@"slideMenuDidSlideOut");
}

@end
