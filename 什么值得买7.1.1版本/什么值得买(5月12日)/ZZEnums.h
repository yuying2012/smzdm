//
//  ZZEnums.h
//  什么值得买
//
//  Created by Wang_ruzhou on 16/9/15.
//  Copyright © 2016年 Wang_ruzhou. All rights reserved.
//

#ifndef ZZEnums_h
#define ZZEnums_h


typedef NS_ENUM(NSUInteger, DetailBottomBarStyle) {
    DetailBottomBarStyleHaoWu,
    DetailBottomBarStyleYuanChuang,
    DetailBottomBarStyleHaiTao,
    DetailBottomBarStyleYouHui = DetailBottomBarStyleHaiTao,
    DetailBottomBarStyleHuaTi,
    DetailBottomBarStyleZiXun,
    DetailBottomBarStylePingCe = DetailBottomBarStyleZiXun,
};

typedef NS_ENUM(NSUInteger, ZDMPromotionType) {
    ZDMPromotionTypeZero        = 0,    //普通(包含原创类型的)
    ZDMPromotionTypeOne         = 1,    //广告类
    ZDMPromotionTypeTwo         = 2,    //暂时未找到
    ZDMPromotionTypeThree       = 3,    //一张图片, 一个标题, 一句简介的那种
    ZDMPromotionTypeEight       = 8,    //一张图片, 一个标题, 一句简介的那种
    ZDMPromotionTypeSeventeen   = 17,    //一张图片, 一个标题, 一句简介的那种
};


typedef NS_ENUM(NSUInteger, ZDMChannelId) {
    ZDMChannelIdOne         = 1,    //国内
    ZDMChannelIdTwo         = 2,    //
    ZDMChannelIdFive        = 5,    //海淘
    ZDMChannelIdSix         = 6,    //资讯
    ZDMChannelIdEight       = 8,    //众测
    ZDMChannelIdEleven      = 11,   //原创
    ZDMChannelIdFourteen    = 14,   //话题
};



#endif /* ZZEnums_h */
