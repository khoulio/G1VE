//
//  WebSiteViewController.h
//  JT Rappé Sénégal
//
//  Created by Jules Gueye on 19/06/13.
//  Copyright (c) 2013 Souleymane Gueye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebSiteViewController : UIViewController{

NSString *url;

IBOutlet UIActivityIndicatorView *chargement;
NSTimer *timer;

}
- (IBAction)fermer:(id)sender;
@property (retain, nonatomic) IBOutlet UIWebView *website;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *chargement;
@property (retain, nonatomic)  NSString *url;
- (IBAction)openUrl:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *socialChoice;
- (IBAction)changerSite:(id)sender;

@end
