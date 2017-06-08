//
//  YGStyleDefine.h
//  YGOrderReceiving
//
//  Created by 黄德玉 on 2017/3/17.
//
//

#ifndef YGStyleDefine_h
#define YGStyleDefine_h


#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define RGBCOLOR(r, g, b) [UIColor colorWithRed : (r) / 255.0 green : (g) / 255.0 blue : (b) / 255.0 alpha : 1]

#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed : (r) / 255.0 green : (g) / 255.0 blue : (b) / 255.0 alpha : (a)]

// 一个像素
#define onePix (1.0 / [UIScreen mainScreen].scale)

// pix转化为point
#define PixToPoint(pixValue) ceil((pixValue) / 3.0 * __FitWidthScale_FOR_414)

//屏幕适配系数比例
#define __FitWidthScale_FOR_414  (SCREEN_WIDTH / 414.0f)


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define NAVIGATION_HEIGHT 64

#define TABBAR_HEIGHT 49

#define STATUSBAR_HEIGHT 20




#endif /* YGStyleDefine_h */
