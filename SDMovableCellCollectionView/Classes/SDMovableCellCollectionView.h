//
//  SDMovableCellCollectionView.h
//  NPC
//
//  Created by liushuo on 2023/2/25.
//  Copyright © 2023 NPC.work. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SDMovableCellCollectionView;

@protocol SDMovableCellCollectionViewDataSource <UICollectionViewDataSource>

@required
/**
 *  Get the data source array of the collectionView, each time you start the call to get the latest data source.
 *  The array in the data source must be a mutable array, otherwise it cannot be exchanged
 *  The format of the data source:@[@[sectionOneArray].mutableCopy, @[sectionTwoArray].mutableCopy, ....].mutableCopy
 *  Even if there is only one section, the outermost layer needs to be wrapped in an array, such as:@[@[sectionOneArray].mutableCopy].mutableCopy
 *  数据源约束: 多组数组嵌套且为可变数组
 */
- (NSMutableArray <NSMutableArray *> *)dataSourceArrayInCollectionView:(SDMovableCellCollectionView *)collectionView;

@optional
/**
 * 返回自定义截图的部分
 */
- (UIView *)snapshotViewWithCell:(UICollectionViewCell *)cell;

@end

@protocol SDMovableCellCollectionViewDelegate <UICollectionViewDelegate>
@optional
/**
 *  The cell that will start moving the indexPath location
 *  长按拖拽cell将要开始移动
 */
- (void)collectionView:(SDMovableCellCollectionView *)collectionView willMoveCellAtIndexPath:(NSIndexPath *)indexPath;
/**
 *  Move cell `fromIndexPath` to `toIndexPath` completed
 *  移动cell换了位置下标
 */
- (void)collectionView:(SDMovableCellCollectionView *)collectionView didMoveCellFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath;
/**
 *  Move cell ended
 *  移动cell结束
 */
- (void)collectionView:(SDMovableCellCollectionView *)collectionView endMoveCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  The user tries to move a cell that is not allowed to move. You can make some prompts to inform the user.
 *  尝试长按拖拽不能移动的cell 这个代理方法可以加个toast或者其他处理 与设置`canHintWhenCannotMove`不冲突
 */
- (void)collectionView:(SDMovableCellCollectionView *)collectionView tryMoveUnmovableCellAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  Customize the screenshot style of the movable cell
 *  自定义移动的cell截图的样式 加阴影啥的
 */
- (void)collectionView:(SDMovableCellCollectionView *)collectionView customizeMovalbeCell:(UIImageView *)movableCellsnapshot;

/**
 *  Custom start moving cell animation
 *  自定义cell拖拽移动的动画
 */
- (void)collectionView:(SDMovableCellCollectionView *)collectionView customizeStartMovingAnimation:(UIImageView *)movableCellsnapshot fingerPoint:(CGPoint)fingerPoint;

@end


@interface SDMovableCellCollectionView : UICollectionView

@property (nonatomic, weak) id<SDMovableCellCollectionViewDataSource> dataSource;
@property (nonatomic, weak) id<SDMovableCellCollectionViewDelegate> delegate;
@property (nonatomic, strong, readonly) UILongPressGestureRecognizer *longPressGesture;
/**
 *  Whether to allow dragging to the edge of the screen, turn on edge scrolling, default YES
 *  是否允许拖动到屏幕边缘，启用边缘滚动，默认为YES
 */
@property (nonatomic, assign) BOOL canEdgeScroll;

/**
 *  Edge scroll trigger range, default 150, the faster the edge is closer to the edge
 *  边缘滚动触发范围，默认为150，越靠近边缘滚得越快
 */
@property (nonatomic, assign) CGFloat edgeScrollTriggerRange;

/**
 *  When the CADisplayLink callback, self.contentOffsetY can scroll max speed, default 20. the faster the edge closer
 *  当CADisplayLink回调时，self.contentOffsetY可以滚动的最大速度，默认为20 帧/s。
 */
@property (nonatomic, assign) CGFloat maxScrollSpeedPerFrame;

/**
 * 当cell不允许被移动的时候，长按时是否提示。默认为YES。
 */
@property (nonatomic, assign) BOOL canHintWhenCannotMove;

/**
 * 是否允许震动反馈。默认为NO。
 */
@property (nonatomic, assign) BOOL canFeedback NS_AVAILABLE_IOS(10_0);

@end

NS_ASSUME_NONNULL_END
