//
//  SDViewController.m
//  SDMovableCellCollectionView
//
//  Created by liushuo on 03/22/2023.
//  Copyright (c) 2023 liushuo. All rights reserved.
//

#import "SDViewController.h"
#import "SDMovableCellCollectionView.h"
#import "SDMovableCell.h"

@interface SDViewController () <SDMovableCellCollectionViewDelegate, SDMovableCellCollectionViewDataSource>

@property (nonatomic, strong) SDMovableCellCollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    self.collectionView.frame = self.view.frame;
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        for (int i = 0; i < 60; i++) {
            NSString *title = [NSString stringWithFormat:@"第%d个item", i];
            [_dataArray addObject:title];
        }
    }
    return _dataArray;
}

#pragma mark - UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SDMovableCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SDMovableCell class]) forIndexPath:indexPath];
    cell.title.text = self.dataArray[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //
}

// 是否可以高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// 高亮时调用
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.alpha = 0.7;
}

// 高亮结束调用
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.alpha = 1.0;
}

#pragma mark - SDMovableCellTableViewDelegate, SDMovableCellTableViewDataSource
/// 数据源
- (NSMutableArray<NSMutableArray *> *)dataSourceArrayInCollectionView:(SDMovableCellCollectionView *)collectionView {
    return self.dataArray;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(SDMovableCellCollectionView *)collectionView didMoveCellFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    //only one section, and all screen list
    //[self.dataArray exchangeObjectAtIndex:fromIndexPath.item withObjectAtIndex:toIndexPath.item];
    NSString *title = self.dataArray[fromIndexPath.row];
    [self.dataArray removeObject:title];
    [self.dataArray insertObject:title atIndex:toIndexPath.row];
    [collectionView moveItemAtIndexPath:fromIndexPath toIndexPath:toIndexPath];
}

#pragma mark - 懒加载
- (SDMovableCellCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(120, 60);
        layout.sectionInset = UIEdgeInsetsMake(10, 16, 0, 16);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        
        _collectionView = [[SDMovableCellCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.canFeedback = YES;
        _collectionView.canHintWhenCannotMove = YES;
        [_collectionView registerClass:[SDMovableCell class] forCellWithReuseIdentifier:NSStringFromClass([SDMovableCell class])];
    }
    return _collectionView;
}

@end
