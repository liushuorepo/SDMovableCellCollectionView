//
//  SDMovableCell.m
//  SDMovableCellCollectionView_Example
//
//  Created by liushuo on 2023/3/22.
//  Copyright © 2023 liushuo. All rights reserved.
//

#import "SDMovableCell.h"

@implementation SDMovableCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    
    self.title.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    [self.contentView addSubview:self.title];
}

- (UILabel *)title {
    if (!_title) {
        _title = [UILabel new];
        _title.font = [UIFont boldSystemFontOfSize:16];
        _title.textColor = [UIColor blackColor];
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
}

@end
