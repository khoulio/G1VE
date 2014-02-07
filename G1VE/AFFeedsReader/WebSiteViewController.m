//
//  WebSiteViewController.m
//  JT Rappé Sénégal
//
//  Created by Jules Gueye on 19/06/13.
//  Copyright (c) 2013 Souleymane Gueye. All rights reserved.
//

#import "WebSiteViewController.h"
#define facebook_url @"http://www.facebook.com/give1project"
#define twitter_url @"http://twitter.com/Give1Project"
#define youtube_url @"http://www.youtube.com/user/Thioneniang"


@interface WebSiteViewController ()

@end

@implementation WebSiteViewController
@synthesize chargement=_chargement;
@synthesize website=_website;
@synthesize url=_url;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    // Do any additional setup after loading the view.
    
    // self.title=self.site;
    
    
    [super viewDidLoad];
    
    [self loadSite:facebook_url];
	
    
}

-(void)loadSite:(NSString *) urlSite{
    NSURL *host = [NSURL URLWithString:urlSite];
	NSURLRequest *requestObject =[NSURLRequest requestWithURL:host];
    
    [_website loadRequest:requestObject];
	
    //  NSLog(@"%@",self.url);
    
    
    timer=[ NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(tink) userInfo:nil repeats:YES];
    
    
    

}
-(void)tink{
    if (!_website.loading) {
        [_chargement stopAnimating];
    }
}

- (void)viewDidUnload
{
    [self setWebsite:nil];
    [self setUrl:nil];
    
    [self setChargement:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fermer:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)openUrl:(id)sender {
    switch (_socialChoice.selectedSegmentIndex) {
        case 0:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:facebook_url]];
            break;
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:twitter_url]];
            break;
        case 2:
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:youtube_url]];
            break;
            
        default:
            break;
    }

    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_url]];
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}
- (IBAction)changerSite:(id)sender {
    switch (_socialChoice.selectedSegmentIndex) {
        case 0:
            [self loadSite:facebook_url];
            break;
        case 1:
            [self loadSite:twitter_url];
            break;
        case 2:
            [self loadSite:youtube_url];
            break;
            
        default:
            break;
    }
}
@end
