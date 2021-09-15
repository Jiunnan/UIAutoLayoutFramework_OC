//
//  UIAutoLayoutParams.h
//  UIAutoLayoutFramework_OC
//
//  Created by 林俊男 on 2021/09/15.
//

#ifndef UIAutoLayoutParams_h
#define UIAutoLayoutParams_h

#define FrameworkVersion @"1.1.3"
#define kscreenWidth [UIScreen mainScreen].bounds.size.width
#define kscreenHeight [UIScreen mainScreen].bounds.size.height
#define calValue(e) e*kscreenWidth/(kscreenHeight>800?375.0:320.0)

#endif /* UIAutoLayoutParams_h */
