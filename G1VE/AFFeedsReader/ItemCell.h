//
//  ItemCell.h
//  AFFeedsReader
//
//  Created by Jules Gueye on 10/03/13.
//
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell{
    IBOutlet UIImageView *imageItem;
     IBOutlet UILabel *titre;
}
@property (strong, nonatomic) IBOutlet UILabel *titre;


@end
