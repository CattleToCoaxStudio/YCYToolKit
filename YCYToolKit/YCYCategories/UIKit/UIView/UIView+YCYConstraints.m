//
//  UIView+YCYConstraints.m
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIView+YCYConstraints.h"

@implementation UIView (YCYConstraints)
-(NSLayoutConstraint *)ycy_constraintForAttribute:(NSLayoutAttribute)attribute {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *constraintArray = [self.superview constraints];
    
    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }
    
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

- (NSLayoutConstraint *)ycy_leftConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *)ycy_rightConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeRight];
}

- (NSLayoutConstraint *)ycy_topConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeTop];
}

- (NSLayoutConstraint *)ycy_bottomConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *)ycy_leadingConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeLeading];
}

- (NSLayoutConstraint *)ycy_trailingConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeTrailing];
}

- (NSLayoutConstraint *)ycy_widthConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *)ycy_heightConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *)ycy_centerXConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *)ycy_centerYConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeCenterY];
}

- (NSLayoutConstraint *)ycy_baseLineConstraint {
    return [self ycy_constraintForAttribute:NSLayoutAttributeBaseline];
}
@end
