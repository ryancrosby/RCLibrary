//
//  ECGameLayout.m
//  GameKit
//
//  Created by Ryan Crosby on 2/22/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import "ECSectionFlowLayout.h"

@interface ECSectionFlowLayout ()

- (CGFloat)columnWidth;
- (CGFloat)rowHeight;
- (NSInteger)totalColumns;
- (NSInteger)totalRows;
- (NSInteger)visibleColumnCount;
- (NSInteger)visibleRowCount;

@end

@implementation ECSectionFlowLayout

- (CGSize)collectionViewContentSize {
    CGFloat width = [self columnWidth] * [self totalColumns];
    CGFloat height = [self rowHeight] * [self totalRows];
    return CGSizeMake(ceilf(width), ceilf(height));
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *layoutAttributes = [NSMutableArray array];
    
    NSInteger firstSection = CGRectGetMinX(rect) / [self columnWidth];
    NSInteger lastSection = CGRectGetMaxX(rect) / [self columnWidth];
    
    return @[];
}

#pragma mark - ECGameLayoutHelpers

- (NSInteger)totalColumns {
    NSInteger totalSections = [self.collectionView numberOfSections];
    return totalSections == 0 ? 0 : totalSections / [self visibleRowCount];
}

- (NSInteger)totalRows {
    return [self visibleRowCount];
}

- (CGFloat)columnWidth {
    return [self visibleColumnCount] > 0 ? ceilf((CGRectGetWidth(self.collectionView.bounds) / (CGFloat)[self visibleColumnCount])) : 0.f;
}

- (CGFloat)rowHeight {
    if ([self visibleColumnCount] == 0) return 0;
    
    return ceilf((CGRectGetHeight(self.collectionView.bounds) / (CGFloat)[self visibleRowCount]));
}

- (NSInteger)visibleColumnCount {
    return ([self.collectionView numberOfSections] > 4) ? 4 : [self.collectionView numberOfSections];
}

- (NSInteger)visibleRowCount {
    if ([self visibleColumnCount] == 0) return 0;
    
    return ([self.collectionView numberOfSections] > [self visibleColumnCount]) ? 2 : 1;
}

@end
