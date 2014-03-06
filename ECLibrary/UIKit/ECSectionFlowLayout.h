//
//  ECGameLayout.h
//  GameKit
//
//  Created by Ryan Crosby on 2/22/14.
//  Copyright (c) 2014 EclecticCoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ECSectionFlowLayoutDataSource <NSObject>

@end

@interface ECSectionFlowLayout : UICollectionViewLayout

@property (nonatomic, weak) id<ECSectionFlowLayoutDataSource> dataSource;

@end
