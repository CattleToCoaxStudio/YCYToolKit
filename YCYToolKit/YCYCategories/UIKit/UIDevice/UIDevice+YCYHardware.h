//
//  UIDevice+YCYHardware.h


#import <UIKit/UIKit.h>


@interface UIDevice (YCYHardware)
+ (NSString *)ycy_platform;
+ (NSString *)ycy_platformString;


+ (NSString *)ycy_macAddress;

//Return the current device CPU frequency
+ (NSUInteger)ycy_cpuFrequency;
// Return the current device BUS frequency
+ (NSUInteger)ycy_busFrequency;
//current device RAM size
+ (NSUInteger)ycy_ramSize;
//Return the current device CPU number
+ (NSUInteger)ycy_cpuNumber;
//Return the current device total memory

/// 获取iOS系统的版本号
+ (NSString *)ycy_systemVersion;
/// 判断当前系统是否有摄像头
+ (BOOL)ycy_hasCamera;
/// 获取手机内存总量, 返回的是字节数
+ (NSUInteger)ycy_totalMemoryBytes;
/// 获取手机可用内存, 返回的是字节数
+ (NSUInteger)ycy_freeMemoryBytes;

/// 获取手机硬盘空闲空间, 返回的是字节数
+ (long long)ycy_freeDiskSpaceBytes;
/// 获取手机硬盘总空间, 返回的是字节数
+ (long long)ycy_totalDiskSpaceBytes;
@end
