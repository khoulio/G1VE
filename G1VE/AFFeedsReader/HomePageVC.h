//
//  MainVC.h
//  AFFeedsReader
//
//  Created by Álvaro Franco on 17/09/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMXMLParser.h"

@interface HomePageVC : UITableViewController <KMXMLParserDelegate> {
    
    UIImageView *postImage;
    NSString *urlFeeds;
    NSString *siteName;
}
@property (strong, nonatomic) IBOutlet UIButton *logo;

@property (strong, nonatomic) NSMutableArray *parseResults;
@property (strong, nonatomic) NSString *urlFeeds;
@property (strong, nonatomic) NSString *siteName;

@end 
