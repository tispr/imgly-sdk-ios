//
//  IMGLYDefines.h
//  imglyKit
//
//  Created by Manuel Binna on 28.06.13.
//  Copyright (c) 2013 9elements GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IMGLYEqualDoubles(a, b) (fabs((a) - (b)) < DBL_EPSILON)
#define IMGLYEqualFloats(a, b) (fabsf((a) - (b)) < FLT_EPSILON)

#define IMGLYIs4InchScreen() ([UIScreen mainScreen].bounds.size.height == 568.0f)
