//
//  UIApplication+YCYPermissions.h
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//



///NSLog(@"Access to Location: %d", [[UIApplication sharedApplication] hasAccessToLocation]);

/*[[UIApplication sharedApplication] requestAccessToContactsWithSuccess:^{
 NSLog(@"Access Granted");
 } andFailure:^{
 NSLog(@"Access Denied");
 }];
 */

#import <UIKit/UIKit.h>


#import <CoreLocation/CoreLocation.h>

typedef enum {
    YCYPermissionTypeBluetoothLE,
    YCYPermissionTypeCalendar,
    YCYPermissionTypeContacts,
    YCYPermissionTypeLocation,
    YCYPermissionTypeMicrophone,
    YCYPermissionTypeMotion,
    YCYPermissionTypePhotos,
    YCYPermissionTypeReminders,
} YCYPermissionType;

typedef enum {
    YCYPermissionAccessDenied, //User has rejected feature
    YCYPermissionAccessGranted, //User has accepted feature
    YCYPermissionAccessRestricted, //Blocked by parental controls or system settings
    YCYPermissionAccessUnknown, //Cannot be determined
    YCYPermissionAccessUnsupported, //Device doesn't support this - e.g Core Bluetooth
    YCYPermissionAccessMissingFramework, //Developer didn't import the required framework to the project
} YCYPermissionAccess;
@interface UIApplication (YCYPermissions)
//Check permission of service. Cannot check microphone or motion without asking user for permission
-(YCYPermissionAccess)ycy_hasAccessToBluetoothLE;
-(YCYPermissionAccess)ycy_hasAccessToCalendar;
-(YCYPermissionAccess)ycy_hasAccessToContacts;
-(YCYPermissionAccess)ycy_hasAccessToLocation;
-(YCYPermissionAccess)ycy_hasAccessToPhotos;
-(YCYPermissionAccess)ycy_hasAccessToReminders;

//Request permission with callback

/**
 各类隐私许可

 @param accessGranted success
 @param accessDenied failure
 */
-(void)ycy_requestAccessToCalendarWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
-(void)ycy_requestAccessToContactsWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
-(void)ycy_requestAccessToMicrophoneWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
-(void)ycy_requestAccessToPhotosWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;
-(void)ycy_requestAccessToRemindersWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;

//Instance methods
-(void)ycy_requestAccessToLocationWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied;

//No failure callback available
-(void)ycy_requestAccessToMotionWithSuccess:(void(^)())accessGranted;
@end
