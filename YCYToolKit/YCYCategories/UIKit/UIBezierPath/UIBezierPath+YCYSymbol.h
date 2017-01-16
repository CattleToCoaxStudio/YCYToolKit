//
//  UIBezierPath+Symbol.h
//  YeNom
//
//  Created by Kaijie Yu on 6/29/12.
//  Copyright (c) 2012 Kjuly. All rights reserved.
//https://github.com/Kjuly/UIBezierPath-Symbol


#import <UIKit/UIKit.h>
// Direction
typedef enum {
  kUIBezierPathArrowDirectionNone  = 0,
  kUIBezierPathArrowDirectionRight = 1 << 0,
  kUIBezierPathArrowDirectionLeft  = 1 << 1,
  kUIBezierPathArrowDirectionUp    = 1 << 2,
  kUIBezierPathArrowDirectionDown  = 1 << 3
}YCYUIBezierPathArrowDirection;

@interface UIBezierPath (YCYSymbol)

+ (UIBezierPath *)ycy_customBezierPathOfPlusSymbolWithRect:(CGRect)rect   // plus
                                                 scale:(CGFloat)scale;
+ (UIBezierPath *)ycy_customBezierPathOfMinusSymbolWithRect:(CGRect)rect  // minus
                                                  scale:(CGFloat)scale;
+ (UIBezierPath *)ycy_customBezierPathOfCheckSymbolWithRect:(CGRect)rect  // check
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick;
+ (UIBezierPath *)ycy_customBezierPathOfCrossSymbolWithRect:(CGRect)rect  // cross
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick;
+ (UIBezierPath *)ycy_customBezierPathOfArrowSymbolWithRect:(CGRect)rect  // arrow
                                                  scale:(CGFloat)scale
                                                  thick:(CGFloat)thick
                                              direction:(YCYUIBezierPathArrowDirection)direction;
+ (UIBezierPath *)ycy_customBezierPathOfPencilSymbolWithRect:(CGRect)rect // pencil
                                                   scale:(CGFloat)scale
                                                   thick:(CGFloat)thick;

@end
