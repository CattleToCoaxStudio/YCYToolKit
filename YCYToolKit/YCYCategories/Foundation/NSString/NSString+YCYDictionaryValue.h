//
//  NSString+YCYDictionary.h


#import <Foundation/Foundation.h>

@interface NSString (YCYDictionaryValue)
/**
 *  @brief  JSON字符串转成NSDictionary
 *
 *  @return NSDictionary
 */
-(NSDictionary *)ycy_dictionaryValue;
@end
