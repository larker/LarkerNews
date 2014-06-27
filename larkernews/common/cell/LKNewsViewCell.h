//
//  LKNewsViewCell.h
//  larkernews
//
//  Created by cns on 14-6-26.
//  Copyright (c) 2014年 larkersos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LKNewsViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@end
