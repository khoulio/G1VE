//
//  ReaderVC.h
//  AFFeedsReader
//
//  Created by Álvaro Franco on 17/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface ReaderVC : UIViewController <MBProgressHUDDelegate, UIGestureRecognizerDelegate, UIWebViewDelegate> {
    
    MBProgressHUD *HUD;
    UIWebView *post;
    UISwipeGestureRecognizer *back;
    NSString *urlFeeds;
    NSString *siteName;
}

@property (strong, nonatomic) NSString *siteName;
@property (strong, nonatomic) NSString *urlFeeds;
@property (strong, nonatomic) NSMutableArray *parseResults;
@property (nonatomic) int sharedIndex;

-(void)showLoadingView;
-(void)back;

@end
