//
//  YGColorDefine.h
//  BookwormFramework
//
//  Created by 黄德玉 on 2017/2/16.
//  Copyright © 2017年 黄德玉. All rights reserved.
//

#ifndef YGColorDefine_h
#define YGColorDefine_h


#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define RGBCOLOR(r, g, b) [UIColor colorWithRed : (r) / 255.0 green : (g) / 255.0 blue : (b) / 255.0 alpha : 1]

#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed : (r) / 255.0 green : (g) / 255.0 blue : (b) / 255.0 alpha : (a)]


#define COLOR_NAV_RED           HexRGB(0xea5251)
#define COLOR_DEFAULT           HexRGB(0x333333)
#define COLOR_BG_DEFALUT        RGBCOLOR(240, 240, 240)
#define COLOR_LINE_DEFAULT      HexRGB(0xc9c9c9)
#define COLOR_LINE              RGBCOLOR(229, 229, 234)
#define COLOR_CUSTOM_LightGray  HexRGB(0x999999)
#define COLOR_CUSTOM_F2         HexRGB(0xf2f2f2)
#define COLOR_CUSTOM_BLUE       HexRGB(0x2b94ff)
#define COLOR_CUSTOM_LIGHTRED   HexRGB(0xfdefef)


#endif /* YGColorDefine_h */
