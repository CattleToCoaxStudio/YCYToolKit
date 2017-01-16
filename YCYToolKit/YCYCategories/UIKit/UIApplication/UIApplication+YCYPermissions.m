//
//  UIApplication+YCYPermissions.m
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "UIApplication+YCYPermissions.h"
#import <objc/runtime.h>

//Import required frameworks
#import <AddressBook/AddressBook.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import <EventKit/EventKit.h>

typedef void (^YCYLocationSuccessCallback)();
typedef void (^YCYLocationFailureCallback)();

static char YCYPermissionsLocationManagerPropertyKey;
static char YCYPermissionsLocationBlockSuccessPropertyKey;
static char YCYPermissionsLocationBlockFailurePropertyKey;
@interface UIApplication () <CLLocationManagerDelegate>
@property (nonatomic, retain) CLLocationManager *ycy_permissionsLocationManager;
@property (nonatomic, copy) YCYLocationSuccessCallback ycy_locationSuccessCallbackProperty;
@property (nonatomic, copy) YCYLocationFailureCallback ycy_locationFailureCallbackProperty;
@end

@implementation UIApplication (YCYPermissions)

#pragma mark - Check permissions
-(YCYPermissionAccess)ycy_hasAccessToBluetoothLE {
    switch ([[[CBCentralManager alloc] init] state]) {
        case CBCentralManagerStateUnsupported:
            return YCYPermissionAccessUnsupported;
            break;
            
        case CBCentralManagerStateUnauthorized:
            return YCYPermissionAccessDenied;
            break;
            
        default:
            return YCYPermissionAccessGranted;
            break;
    }
}

-(YCYPermissionAccess)ycy_hasAccessToCalendar {
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent]) {
        case EKAuthorizationStatusAuthorized:
            return YCYPermissionAccessGranted;
            break;
            
        case EKAuthorizationStatusDenied:
            return YCYPermissionAccessDenied;
            break;
            
        case EKAuthorizationStatusRestricted:
            return YCYPermissionAccessRestricted;
            break;
            
        default:
            return YCYPermissionAccessUnknown;
            break;
    }
}

-(YCYPermissionAccess)ycy_hasAccessToContacts {
    switch (ABAddressBookGetAuthorizationStatus()) {
        case kABAuthorizationStatusAuthorized:
            return YCYPermissionAccessGranted;
            break;
            
        case kABAuthorizationStatusDenied:
            return YCYPermissionAccessDenied;
            break;
            
        case kABAuthorizationStatusRestricted:
            return YCYPermissionAccessRestricted;
            break;
            
        default:
            return YCYPermissionAccessUnknown;
            break;
    }
}

-(YCYPermissionAccess)ycy_hasAccessToLocation {
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusAuthorized:
            return YCYPermissionAccessGranted;
            break;
            
        case kCLAuthorizationStatusDenied:
            return YCYPermissionAccessDenied;
            break;
            
        case kCLAuthorizationStatusRestricted:
            return YCYPermissionAccessRestricted;
            break;
            
        default:
            return YCYPermissionAccessUnknown;
            break;
    }
    return YCYPermissionAccessUnknown;
}

-(YCYPermissionAccess)ycy_hasAccessToPhotos {
    switch ([ALAssetsLibrary authorizationStatus]) {
        case ALAuthorizationStatusAuthorized:
            return YCYPermissionAccessGranted;
            break;
            
        case ALAuthorizationStatusDenied:
            return YCYPermissionAccessDenied;
            break;
            
        case ALAuthorizationStatusRestricted:
            return YCYPermissionAccessRestricted;
            break;
            
        default:
            return YCYPermissionAccessUnknown;
            break;
    }
}

-(YCYPermissionAccess)ycy_hasAccessToReminders {
    switch ([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder]) {
        case EKAuthorizationStatusAuthorized:
            return YCYPermissionAccessGranted;
            break;
            
        case EKAuthorizationStatusDenied:
            return YCYPermissionAccessDenied;
            break;
            
        case EKAuthorizationStatusRestricted:
            return YCYPermissionAccessRestricted;
            break;
            
        default:
            return YCYPermissionAccessUnknown;
            break;
    }
    return YCYPermissionAccessUnknown;
}


#pragma mark - Request permissions
-(void)ycy_requestAccessToCalendarWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}

-(void)ycy_requestAccessToContactsWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
    if(addressBook) {
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (granted) {
                    accessGranted();
                } else {
                    accessDenied();
                }
            });
        });
    }
}

-(void)ycy_requestAccessToMicrophoneWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    AVAudioSession *session = [[AVAudioSession alloc] init];
    [session requestRecordPermission:^(BOOL granted) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}

-(void)ycy_requestAccessToMotionWithSuccess:(void(^)())accessGranted {
    CMMotionActivityManager *motionManager = [[CMMotionActivityManager alloc] init];
    NSOperationQueue *motionQueue = [[NSOperationQueue alloc] init];
    [motionManager startActivityUpdatesToQueue:motionQueue withHandler:^(CMMotionActivity *activity) {
        accessGranted();
        [motionManager stopActivityUpdates];
    }];
}

-(void)ycy_requestAccessToPhotosWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        accessGranted();
    } failureBlock:^(NSError *error) {
        accessDenied();
    }];
}

-(void)ycy_requestAccessToRemindersWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    EKEventStore *eventStore = [[EKEventStore alloc] init];
    [eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (granted) {
                accessGranted();
            } else {
                accessDenied();
            }
        });
    }];
}


#pragma mark - Needs investigating
/*
 -(void)requestAccessToBluetoothLEWithSuccess:(void(^)())accessGranted {
 //REQUIRES DELEGATE - NEEDS RETHINKING
 }
 */

-(void)ycy_requestAccessToLocationWithSuccess:(void(^)())accessGranted andFailure:(void(^)())accessDenied {
    self.ycy_permissionsLocationManager = [[CLLocationManager alloc] init];
    self.ycy_permissionsLocationManager.delegate = self;
    
    self.ycy_locationSuccessCallbackProperty = accessGranted;
    self.ycy_locationFailureCallbackProperty = accessDenied;
    [self.ycy_permissionsLocationManager startUpdatingLocation];
}


#pragma mark - Location manager injection
-(CLLocationManager *)ycy_permissionsLocationManager {
    return objc_getAssociatedObject(self, &YCYPermissionsLocationManagerPropertyKey);
}

-(void)setycy_permissionsLocationManager:(CLLocationManager *)manager {
    objc_setAssociatedObject(self, &YCYPermissionsLocationManagerPropertyKey, manager, OBJC_ASSOCIATION_RETAIN);
}

-(YCYLocationSuccessCallback)locationSuccessCallbackProperty {
    return objc_getAssociatedObject(self, &YCYPermissionsLocationBlockSuccessPropertyKey);
}

-(void)setycy_locationSuccessCallbackProperty:(YCYLocationSuccessCallback)locationCallbackProperty {
    objc_setAssociatedObject(self, &YCYPermissionsLocationBlockSuccessPropertyKey, locationCallbackProperty, OBJC_ASSOCIATION_COPY);
}

-(YCYLocationFailureCallback)locationFailureCallbackProperty {
    return objc_getAssociatedObject(self, &YCYPermissionsLocationBlockFailurePropertyKey);
}

-(void)setycy_locationFailureCallbackProperty:(YCYLocationFailureCallback)locationFailureCallbackProperty {
    objc_setAssociatedObject(self, &YCYPermissionsLocationBlockFailurePropertyKey, locationFailureCallbackProperty, OBJC_ASSOCIATION_COPY);
}


#pragma mark - Location manager delegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorized) {
        self.locationSuccessCallbackProperty();
    } else if (status != kCLAuthorizationStatusNotDetermined) {
        self.locationFailureCallbackProperty();
    }
}

@end
