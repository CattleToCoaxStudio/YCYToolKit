//
//  UIControl+YCYSound.m
//  Category
//
//  Created by yangchengyou on 16/12/30.
//  Copyright © 2016年 NULLS. All rights reserved.
//

#import "UIControl+YCYSound.h"
#import <objc/runtime.h>
#import <AVFoundation/AVFoundation.h>
// Key for the dictionary of sounds for control events.
static char const * const ycy_kSoundsKey = "YCY_kSoundsKey";
@implementation UIControl (YCYSound)
- (void)ycy_setSoundNamed:(NSString *)name forControlEvent:(UIControlEvents)controlEvent
{
    // Remove the old UI sound.
    NSString *oldSoundKey = [NSString stringWithFormat:@"%lu", controlEvent];
    AVAudioPlayer *oldSound = [self ycy_sounds][oldSoundKey];
    [self removeTarget:oldSound action:@selector(play) forControlEvents:controlEvent];
    
    // Set appropriate category for UI sounds.
    // Do not mute other playing audio.
    [[AVAudioSession sharedInstance] setCategory:@"AVAudioSessionCategoryAmbient" error:nil];
    
    // Find the sound file.
    NSString *file = [name stringByDeletingPathExtension];
    NSString *extension = [name pathExtension];
    NSURL *soundFileURL = [[NSBundle mainBundle] URLForResource:file withExtension:extension];
    
    NSError *error = nil;
    
    // Create and prepare the sound.
    AVAudioPlayer *tapSound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    NSString *controlEventKey = [NSString stringWithFormat:@"%lu", controlEvent];
    NSMutableDictionary *sounds = [self ycy_sounds];
    [sounds setObject:tapSound forKey:controlEventKey];
    [tapSound prepareToPlay];
    if (!tapSound) {
        NSLog(@"Couldn't add sound - error: %@", error);
        return;
    }
    
    // Play the sound for the control event.
    [self addTarget:tapSound action:@selector(play) forControlEvents:controlEvent];
}


#pragma mark - Associated objects setters/getters

- (void)setycy_sounds:(NSMutableDictionary *)sounds
{
    objc_setAssociatedObject(self, ycy_kSoundsKey, sounds, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)ycy_sounds
{
    NSMutableDictionary *sounds = objc_getAssociatedObject(self, ycy_kSoundsKey);
    
    // If sounds is not yet created, create it.
    if (!sounds) {
        sounds = [[NSMutableDictionary alloc] initWithCapacity:2];
        // Save it for later.
        [self setycy_sounds:sounds];
    }
    
    return sounds;
}
@end
