//
//  Macro.h
//  SocialApp
//
//  Created by yangchengyou on 17/2/22.
//  Copyright © 2017年 NULLS. All rights reserved.
//

#ifndef YCYMacro_h
#define YCYMacro_h
//头像
#define YCYDefaultImage YCYImage(DefaultImageName)
#define YCYDefaultImageName @"defaultImage"

//Debug
#define YCYLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
//ui布局frame打印
#define YCYLogCGRect(rect)    NSLog(@"类别: %@  \n方法: %@ \n行号:%d \n CGRect: x = %.0f  and  y = %.0f-------width = %.0f and height = %.0f \n",self,NSStringFromSelector(_cmd), __LINE__, rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
#define YCYLogCGPoint(point)   NSLog(@"类别: %@  \n方法: %@ \n行号:%d \n CGPoint:  x = %.0f  and  y = %.0f \n",self,NSStringFromSelector(_cmd), __LINE__,point.x,point.y);
#define YCYLogCGSize(size)     NSLog(@"类别: %@  \n方法: %@ \n行号:%d \n CGSize:  width = %.0f  and  height = %.0f \n",self, NSStringFromSelector(_cmd), __LINE__,size.width,size.height);
//导航栏颜色
#define YCYBackGroundColor [UIColor whiteColor]
#define YCYNavigationTextColor [UIColor whiteColor]
//字体颜色hexcolor
#define YCYHexColor(colorStr) [UIColor ycy_colorWithHexString:[NSString stringWithFormat:@"%@",colorStr]]
//屏幕尺寸
#define YCYScreen_Width                 ([UIScreen mainScreen].bounds.size.width)
#define YCYScreen_Height                ([UIScreen mainScreen].bounds.size.height)
#define YCYWindow  ((UIWindow*)[[[UIApplication sharedApplication] windows] objectAtIndex:0])
#define YCYRootViewController (UIViewController *)[[UIApplication sharedApplication] keyWindow].rootViewController;
#define AUTOSIZE375(height) (Screen_Width/375)*height
//以414（plus）等比计算其他尺寸
#define AUTOSIZE414(height) (Screen_Width/414.0)*height
//初始化控件
#define YCYFont(fontsize) [UIFont systemFontOfSize:fontsize]

#define YCYImage(imageNamestr) [UIImage imageNamed:imageNamestr]
#define YCYImageURL(urlStr) [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",MainURL,urlStr]]
#define YCYImageURLStr(imgStr) [NSString stringWithFormat:@"%@/%@",MainURL,imgStr]
#define YCYURL(urlStr) [NSURL URLWithString:urlStr]

//常用
#define WeakObject(object) __weak typeof(object) weak##object = object;
#define WeakSelf __weak typeof(self) weakSelf = self;

#define StringValue(integer) [NSString stringWithFormat:@"%lu",integer]
#define YCYAppendString(str1,str2) [NSString stringWithFormat:@"%@%@",str1,str2]
//本地存储
#define PUTNSUserDefault(key,value) [[NSUserDefaults standardUserDefaults] setValue:value forKey:key]
#define GETNSUserDefault(key) [[NSUserDefaults standardUserDefaults] valueForKey:key]
#define REMOVENSUserDefault(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]


//系统定位信息
#define Longitude [NSString stringWithFormat:@"%@",[NSNumber numberWithDouble:[LocationManager sharedInstance].currentLocation.coordinate.longitude]]
#define Latitude [NSString stringWithFormat:@"%@",[NSNumber numberWithDouble:[LocationManager sharedInstance].currentLocation.coordinate.latitude]]
//ex:@"x,y"
#define Coordinate [NSString stringWithFormat:@"%@,%@",[NSNumber numberWithDouble:[LocationManager sharedInstance].currentLocation.coordinate.longitude], [NSNumber numberWithDouble:[LocationManager sharedInstance].currentLocation.coordinate.latitude]]

//百度地图定位
#define BaiduLatitude [NSString stringWithFormat:@"%.6lf",[BaiDuLocation sharedInstance].currentLocation.coordinate.latitude]
#define BaiduLongitude [NSString stringWithFormat:@"%.6lf",[BaiDuLocation sharedInstance].currentLocation.coordinate.longitude]

//刷新动图组

#define RefreshStateIdle(imageName) NSArray *startImages;if (Screen_Width == 320 || Screen_Width == 640) {startImages = @[YCYImage(imageName)];}else if (Screen_Width == 750){startImages = @[YCYImage(imageName)];}else{startImages = @[YCYImage(imageName)];}
#define RefreshImages(imageName,imageCount) NSMutableArray *images = [NSMutableArray array];if (Screen_Width == 320 || Screen_Width == 640) {for (int i = 1; i <= imageCount ; i ++) {NSString *imageStr = [NSString stringWithFormat:@"%@%d",imageName,i];UIImage *image = YCYImage(imageStr);[images addObject:image];}}else if (Screen_Width == 750){for (int i = 1; i <= imageCount ; i ++) {NSString *imageStr = [NSString stringWithFormat:@"%@%d",imageName,i];UIImage *image = YCYImage(imageStr);[images addObject:image];}}else{for (int i = 1; i <= imageCount ; i ++) {NSString *imageStr = [NSString stringWithFormat:@"%@%d",imageName,i];UIImage *image = YCYImage(imageStr);[images addObject:image];}}
#endif /* Macro_h */
