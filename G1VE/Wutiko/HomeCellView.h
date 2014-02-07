//
//  HomeCellView.h
//  Wutiko
//
//  Created by Jules Gueye on 30/01/2014.
//  Copyright (c) 2014 wutiko.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeCellView : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titre;
@property (strong, nonatomic) IBOutlet UILabel *details;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewCompany;
@property (strong, nonatomic) IBOutlet UILabel *date;

@property (strong, nonatomic) IBOutlet UILabel *nbVues;
@property (strong, nonatomic) IBOutlet UILabel *region;
@property (strong, nonatomic) IBOutlet UIImageView *flag;


@end
