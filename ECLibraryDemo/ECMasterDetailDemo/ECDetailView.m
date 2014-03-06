//
//  RCDetailView.m
//  RCLibrary
//
//  Created by Ryan Crosby on 10/1/12.
//  Copyright (c) 2012 Ryan Crosby. All rights reserved.
//

#import "ECDetailView.h"

#define kMargin                         2.0f

@implementation ECDetailView

@synthesize productImageContainer       = _productImageContainer;
@synthesize productTitleLabel           = _productTitleLabel;
@synthesize productPriceLabel           = _productPriceLabel;
@synthesize productDescriptionLabel     = _productDescriptionLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.autoresizesSubviews = YES;
        self.backgroundColor = [UIColor lightGrayColor];
        
        // we will consistently use some measurements, save them here
        CGFloat widthOfChildren = (CGRectGetWidth(frame) - (kMargin * 2));
        CGFloat lastYPoint = 0.0f;
        CGFloat heightOfSingleLineLabel = 22.0f;
        
        // Create the image container
        UIView *imageContainer = [[UIView alloc] initWithFrame:CGRectMake(kMargin, kMargin, widthOfChildren, 150.0f)];
        imageContainer.backgroundColor = [UIColor grayColor];
        imageContainer.autoresizingMask = (UIViewAutoresizingFlexibleWidth);
        [self addSubview:imageContainer];
        
        self.productImageContainer = imageContainer;
        
        lastYPoint = CGRectGetMaxY(_productImageContainer.frame);
        
        // Add a title under it
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMargin, lastYPoint + kMargin, widthOfChildren, heightOfSingleLineLabel)];
        titleLabel.text = @"Product Title";
        titleLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth);
        [self addSubview:titleLabel];
        
        self.productTitleLabel = titleLabel;

        lastYPoint = CGRectGetMaxY(_productTitleLabel.frame);

        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMargin, lastYPoint + kMargin, widthOfChildren, heightOfSingleLineLabel)];
        priceLabel.text = @"$199.99";
        priceLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth);
        [self addSubview:priceLabel];
        
        self.productPriceLabel = priceLabel;
        
        lastYPoint = CGRectGetMaxY(_productPriceLabel.frame);
        
        NSString *exampleDescription = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?";
        
        UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMargin, lastYPoint + kMargin, widthOfChildren, heightOfSingleLineLabel)];
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        descriptionLabel.adjustsFontSizeToFitWidth = NO;
        descriptionLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth);

        
        CGSize descriptionSize = [exampleDescription sizeWithFont:descriptionLabel.font
                                                constrainedToSize:CGSizeMake(widthOfChildren, MAXFLOAT)
                                                    lineBreakMode:NSLineBreakByWordWrapping];

        descriptionLabel.frame = CGRectMake(kMargin, lastYPoint + kMargin, widthOfChildren, descriptionSize.height);
        descriptionLabel.text = exampleDescription;
        
        [self addSubview:descriptionLabel];
        
        self.productDescriptionLabel = descriptionLabel;
        
        lastYPoint = CGRectGetMaxY(_productDescriptionLabel.frame);
        
        self.contentSize = CGSizeMake(widthOfChildren, lastYPoint);
        
        // Make a background view
        UIView *newBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, lastYPoint)];
        newBackgroundView.backgroundColor = [UIColor lightGrayColor];
        newBackgroundView.autoresizingMask = (UIViewAutoresizingFlexibleWidth);
        [self addSubview:newBackgroundView];
        [self sendSubviewToBack:newBackgroundView];
        
        self.backgroundView = newBackgroundView;

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat newWidth = CGRectGetWidth(self.frame);
    
    CGRect oldDescriptionFrame = _productDescriptionLabel.frame;
    
    // Adjust the description
    CGSize descriptionSize = [_productDescriptionLabel.text sizeWithFont:_productDescriptionLabel.font
                                                       constrainedToSize:CGSizeMake(newWidth, MAXFLOAT)
                                                           lineBreakMode:NSLineBreakByWordWrapping];
    
    _productDescriptionLabel.frame = CGRectMake(kMargin, CGRectGetMinY(oldDescriptionFrame), newWidth, descriptionSize.height);
    
    CGSize oldScrollContentSize = self.contentSize;
    
    self.contentSize = CGSizeMake(newWidth, oldScrollContentSize.height);
    
}
@end
