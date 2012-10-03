//
//  RCDetailView.h
//  RCLibrary
//
//  Created by Ryan Crosby on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCDetailView : UIScrollView

@property (nonatomic, retain)   UIView                  *backgroundView;
@property (nonatomic, retain)   UIView                  *productImageContainer;
@property (nonatomic, retain)   UILabel                 *productTitleLabel;
@property (nonatomic, retain)   UILabel                 *productPriceLabel;
@property (nonatomic, retain)   UILabel                 *productDescriptionLabel;

@end
