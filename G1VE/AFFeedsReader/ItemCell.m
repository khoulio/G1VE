//
//  ItemCell.m
//  AFFeedsReader
//
//  Created by Jules Gueye on 10/03/13.
//
//

#import "ItemCell.h"

@implementation ItemCell
@synthesize titre=_titre;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
