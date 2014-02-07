//
//  HomeViewController.h
//  Wutiko
//
//  Created by Jules Gueye on 29/01/2014.
//  Copyright (c) 2014 wutiko.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDLocationsMapViewController.h"
#import "Sector.h"

@interface HomeViewController : UITableViewController <PDLocationsMapDataSource, PDLocationsMapDelegate>
- (IBAction)typeRecherche:(id)sender;
- (IBAction)nextDataToLoad:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *butonMap;
@property (strong, nonatomic) IBOutlet UIButton *butonNext;

- (IBAction)showLocations:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedController;
@property (strong, nonatomic) IBOutlet Sector *secto;
-(void)setCompany;
@end
