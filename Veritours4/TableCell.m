//
//  TableCell.m
//  Veritours4
//
//  Created by Yuan Jiang on 1/24/14.
//  Copyright (c) 2014 Shannon Lytle. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

@synthesize nameLabel = _nameLabel;
@synthesize imageFull = _imageFull;


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
