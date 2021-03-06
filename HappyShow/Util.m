//
//  Util.m
//  VideoShow
//
//  Created by Jerry Chen  on 14-7-23.
//  Copyright (c) 2014年 energy. All rights reserved.
//

#import "Util.h"
//#import "qxTimeline+Util.h"
//#import "VideoDraft.h"
//#import <Social/Social.h>
//#import <Accounts/Accounts.h>
//#import "MBProgressHUD.h"
//#import "FileHandle.h"
//#import "AppMacros.h"
//#import "ExportVideo+CoreData.h"
//#import "qxMediaObject+Util.h"
//#import "qxStickerObject.h"
////#import <FacebookSDK/FacebookSDK.h>
//#import "Toast+UIView.h"
//#import "qxTrack+Util.h"
//#import "NSString+Util.h"

@implementation Util
//
///** 相对沙盒目录的documents路径 */
//+ (NSString *) relativeSandboxDocPath:(NSString *)srcPath
//{
//    NSString * docPath = [FileHandle getDocumentDir];
//    //找到第一个Documents目录之前的路径,移除之后添加新的documents路径---一定不能出现常规的变量路径
//    NSRange range = [srcPath rangeOfString:@"Documents/" options:NSLiteralSearch];//区分大小写
//    NSString * relativePath = srcPath;
//    if (range.location != NSNotFound) {
//        relativePath = [srcPath substringFromIndex:range.location+range.length];
//    }
//    NSString * filePath = [docPath stringByAppendingPathComponent:relativePath];
//    return filePath;
//}
//
///** sticker旋转时的转角转化成在屏幕中的转动角度---以45度为一个计算点---转换到45度以内 */
//+(float) ABSConvertTo45:(float)radianp
//{
//    float newradian=ABS(radianp);
//    if (newradian>M_PI/4*3) {//135
//        newradian=M_PI-newradian;
//    }else if(newradian>M_PI/2){//90
//        newradian=newradian-M_PI/2;
//    }else if(newradian>M_PI/4){//45
//        newradian=M_PI/2-newradian;
//    }
//    
//    return newradian;
//}
//
///** 创建一个临时的录音文件 */
//+ (NSString *) createRecordFile {
//    NSString *recordDir = [Util recordDir];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    if(![fileManager fileExistsAtPath:recordDir]){
//        [fileManager createDirectoryAtPath:recordDir withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    long long time = [[NSDate date] timeIntervalSince1970] * 1000;
//    NSString * recordCache = [recordDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%lld%@",@"rec_",time,@".caf"]];
//    return recordCache;
//}
//
//+ (NSString*)instagramAccessToken
//{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    return [defaults stringForKey:@"InstagramAccessToken"];
//}
//
//+ (void)saveInstagramAccessToken:(NSString*)accessToken
//{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:accessToken forKey:@"InstagramAccessToken"];
//}
//
///** 将时长处理成时间字符串显示 */
//+ (NSString*)stringWithSeconds:(long)duration
//{
//    NSString *res = @"00 : 00";
//    if(0 < duration && duration < 60){
//        
//        res = [NSString stringWithFormat:@"00 : %@",[self formatSingleTimeValue:duration]];
//        
//    }else if(60 <= duration && duration < 3600){
//        
//        res = [NSString stringWithFormat:@"%@ : %@",[self formatSingleTimeValue:duration/60],[self formatSingleTimeValue:duration%60]];
//        
//    }else if (duration >= 3600){
//        
//        int hour = (int)(duration/3600);
//        int other = duration%3600;
//        res = [NSString stringWithFormat:@"%d : %@ : %@",hour,[self formatSingleTimeValue:other/60],[self formatSingleTimeValue:other%60]];
//        
//    }
//    return res;
//}
//
//+ (NSString*)formatSingleTimeValue:(long)value
//{
//    [NSString stringWithFormat:@"%ld",value];
//    NSString *res = [NSString stringWithFormat:@"%ld",value];
//    if(0 <= value && value < 10){
//        res = [NSString stringWithFormat:@"0%ld",value];
//    }
//    return res;
//}
//
+(UIAlertView *) showAlert:(NSString *)message title:(NSString *)title tag:(int) tag
{
    UIAlertView *alert =[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    alert.tag=tag;
    [alert show];
    return  alert;
}
//
//+(BOOL)deleteFile:(NSString*)filepath
//{
//    if(filepath){
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        if([fileManager fileExistsAtPath:filepath]){
//            NSError *error;
//            [fileManager removeItemAtPath:filepath error:&error];
//            if(error){
//                NSLog(@"delete file error : %@ , %@",filepath,error.description);
//            }else{
//                NSLog(@"delete file success : %@",filepath);
//                return YES;
//            }
//        }else{
//            NSLog(@"delete file not exist : %@",filepath);
//        }
//        
//    }
//    return NO;
//}
//
//+(void)saveVideo:(NSURL *)videoURL  toAlbum:(NSString *)customAlbumName  completionBlock:(void (^)(NSURL *videoUrl))completionBlock  failureBlock:(void (^)(NSError *error))failureBlock
//{
//    ALAssetsLibrary *assetsLibrary = [self defaultAssetsLibrary];
//    [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:videoURL completionBlock:^(NSURL *assetURL, NSError *error){
//        ExportVideo * export=[ExportVideo saveExport:assetURL.absoluteString];
//        if (export) {
//            completionBlock(assetURL);
//        }else{
//            if(completionBlock){
//                completionBlock(assetURL);
//            }
//        }
//    }];
//}
//
/** 返回单例---如果使用不同的对象会发出警告 */
+ (ALAssetsLibrary *)defaultAssetsLibrary
{
    //创建后会一直保留着引用
    static ALAssetsLibrary * assetsLibrary = nil;
    
    static dispatch_once_t onceToken;
    // 保证代码只执行一次
    dispatch_once(&onceToken, ^{
        assetsLibrary = [[ALAssetsLibrary alloc] init];
        [assetsLibrary writeImageDataToSavedPhotosAlbum:nil metadata:nil completionBlock:^(NSURL *assetURL, NSError *error){}];
    });
    
    return assetsLibrary;
}
//
//+(NSString*)overlayImgDir
//{
//    NSArray *documents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentPath=[documents objectAtIndex:0];
//    NSString *dir = [documentPath stringByAppendingPathComponent:DOCUMENT_OVERLAYS];
//    if(![self fileExists:dir]){
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        BOOL ret = [fileManager createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
//        if(!ret){
//            dir = nil;
//        }
//    }
//    return dir;
//}
//
//+(NSString*)recordDir
//{
//    NSArray *documents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentPath=[documents objectAtIndex:0];
//    return [documentPath stringByAppendingPathComponent:DOCUMENT_RECORD];
//}
//
//+(NSString*)draftDir
//{
//    NSArray *documents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentPath=[documents objectAtIndex:0];
//    return [documentPath stringByAppendingPathComponent:DOCUMENT_DRAFTS];
//}
//
//+(NSString*)tmpUploadDir
//{
//    NSArray *documents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentPath=[documents objectAtIndex:0];
//    return [documentPath stringByAppendingPathComponent:DOCUMENT_UPLOAD];
//}
//
//+(NSString*)createDraftDirIfNotExists
//{
//    NSString *draftPath = [self draftDir];
//    if(![self fileExists:draftPath]){
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        BOOL ret = [fileManager createDirectoryAtPath:draftPath withIntermediateDirectories:YES attributes:nil error:nil];
//        if(!ret){
//            draftPath = nil;
//        }
//    }
//    return draftPath;
//}
//
//+(NSString *)archiveDraft:(VideoDraft*)draft
//{
//    NSString * archivePath=nil;
//    if(draft && draft.timeline){
//        NSString *draftDir = [self createDraftDirIfNotExists];
//        if(draftDir){//Draft dir exists
//            long long time = [[NSDate date] timeIntervalSince1970] * 1000;
//            archivePath = [draftDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%lld%@",time,@".archive"]];
//            NSFileManager *fileManager = [NSFileManager defaultManager];
//            if([fileManager fileExistsAtPath:archivePath]==NO){
//                BOOL ret = [fileManager createFileAtPath:archivePath contents:nil attributes:nil];
//                if(!ret){
//                    archivePath = nil;
//                }
//            }
//            if(archivePath){//Draft file exists
//                BOOL result = [NSKeyedArchiver archiveRootObject:draft toFile:archivePath];
//                if (result==NO) {
//                    archivePath = nil;
//                }
//            }
//        }
//    }
//    return archivePath;
//}
//
///** 将归档文件处理成对象---这里对timeline进行了重新初始化 */
//+(VideoDraft*)unArchiveDraft:(NSString*)draftFile
//{
//    VideoDraft *draft = nil;
//    if(draftFile){
//        draft = [NSKeyedUnarchiver unarchiveObjectWithFile:draftFile];
//        if(draft){
//            qxTimeline * timeline = [qxTimeline createTimelineForTimeline:draft.timeline];
//            if (timeline==nil) {
//                return nil;
//            }
//            draft.timeline=timeline;
//        }
//    }
//    return draft;
//}
//
//+(BOOL)fileExists:(NSString*)file
//{
//    BOOL exists = NO;
//    if(file && ![file isEqualToString:@""]){
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        exists = [fileManager fileExistsAtPath:file];
//    }
//    return exists;
//}
//
//
////清理图片或者指定栈中的图片
//+(void)clearPhotoTrack:(qxTrack*)track
//{
//    if(track && track.mpMediaObjArray.count > 0){
//        for(qxMediaObject *obj in track.mpMediaObjArray){
//            if(obj && (obj.eType == eMT_Photo || obj.eType == eMT_Overlay)){
//                [obj clearPhoto];
//            }
//        }
//    }
//}
//
///** 删除草稿相关联的文件 */
//+ (BOOL)deleteDraft:(NSString*)filename
//{
//    VideoDraft *draft = [NSKeyedUnarchiver unarchiveObjectWithFile:filename];
//    if(draft){
//        qxTimeline *tmpTimeline = draft.timeline;
//        if(tmpTimeline && tmpTimeline.getTrackCount == 4){
//            //overlay
//            qxTrack *subtitleTrack = [tmpTimeline getTrackFromTimeline:3];
//            if(subtitleTrack && subtitleTrack.mpMediaObjArray){
//                // 经常出现字幕和sticker不见了,就是由于保存的多个草稿共用了同一个文件
////                for(qxMediaObject *obj in subtitleTrack.mpMediaObjArray){
////                    [Util deleteFile:[obj.strFilePath relativeSandboxDocPath]];
////                }
//            }
//            //audio
//            qxTrack *audioTrack = [tmpTimeline getTrackFromTimeline:2];
//            if(audioTrack && audioTrack.mpMediaObjArray){
////                for(qxMediaObject *obj in audioTrack.mpMediaObjArray){
////                    [Util deleteFile:[obj.strFilePath relativeSandboxDocPath]];
////                }
//            }
//        }
//    }
//    return [Util deleteFile:filename];
//}
//
//+ (NSString*)generateTempFileFromALAsset:(ALAsset*)asset
//{
//    NSString *file = nil;
//    if(asset){
//        file = [NSTemporaryDirectory() stringByAppendingPathComponent:@"tempVideo.mp4"];
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        if(![fileManager fileExistsAtPath:file]){
//            [fileManager createFileAtPath:file contents:nil attributes:nil];
//        }
//        NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:file];
//        [fileHandle seekToFileOffset:0];
//        ALAssetRepresentation *rep = [asset defaultRepresentation];
//        NSUInteger size = 1024 * 1024;
//        Byte *buffer = (Byte*)malloc((long)size);
//        NSUInteger buffered = 0;
//        NSData *data = nil;
//        long long totalSize = 0;
//        do {
//            buffered = [rep getBytes:buffer fromOffset:totalSize length:size error:nil];
//            data = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:NO];
//            [fileHandle writeData:data];
//            totalSize += buffered;
//            bzero(buffer, size);
//            if(data){
//                
//            }
//        } while (buffered > 0);
//        free(buffer);
//        [fileHandle closeFile];
//    }
//    return file;
//}
//
//+(NSMutableArray*)rgbValueFromColor:(UIColor*)color
//{
//    NSMutableArray *rgbValueArr = [[NSMutableArray alloc] init];
//    NSString *rgbValue = [NSString stringWithFormat:@"%@",color];
//    NSArray *rgbArr = [rgbValue componentsSeparatedByString:@" "];
//    float r = [rgbArr[1] floatValue] * 255;
//    [rgbValueArr addObject:[NSNumber numberWithFloat:r]];
//    float g = [rgbArr[2] floatValue] * 255;
//    [rgbValueArr addObject:[NSNumber numberWithFloat:g]];
//    float b = [rgbArr[3] floatValue] * 255;
//    [rgbValueArr addObject:[NSNumber numberWithFloat:b]];
//    float a = [rgbArr[4] floatValue];
//    [rgbValueArr addObject:[NSNumber numberWithFloat:a]];
//    return rgbValueArr;
//}
//
//+ (NSString*)preferredLanguage
//{
//    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
//    NSArray * allLanguages = [defaults objectForKey:@"AppleLanguages"];
//    NSString * preferredLang = [allLanguages objectAtIndex:0];
//    return preferredLang;
//}
//
//+ (NSString*)rootDownloadPath
//{
//    NSArray *documents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *path=[documents objectAtIndex:0];
//    path = [path stringByAppendingPathComponent:DOCUMENT_STICKER];
//    return path;
//}
//
//+ (NSString*)stickerDownloadFile:(int)stickerID
//{
//    NSString *file = nil;
//    NSString *path = [[Util rootDownloadPath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%d",stickerID]];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    if(![Util fileExists:path]){
//        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//    file = [path stringByAppendingPathComponent:@"sticker.zip"];
//    if(![Util fileExists:file]){
//        [fileManager createFileAtPath:file contents:nil attributes:nil];
//    }
//    return file;
//}
//
//+ (NSString*)stickerPath:(int)stickerID
//{
//    NSString *tmp = [self stickerDownloadFile:stickerID];
//    tmp = [tmp substringToIndex:[tmp rangeOfString:@".zip"].location];
//    return tmp;
//}
//
//+(NSString *) stringWithVersion
//{
//    NSBundle *bundle=[NSBundle mainBundle];
//    NSString * versionCode=[bundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
//    NSString * buildCode=[bundle objectForInfoDictionaryKey:@"CFBundleVersion"];
//    NSString * version = [NSString stringWithFormat:@"V%@ (%@)",versionCode,buildCode];
//    return version;
//}
//
///** 获取app当前语言  zh-Hans---代表中文 */
//+(NSString *) currentLanguage
//{
//    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
//    NSArray * languages = [defaults objectForKey:@"AppleLanguages"];
//    NSString * lan = [languages objectAtIndex:0];
//    return lan;
//}
//
//+(BOOL) currentLanguageIszhCN
//{
//    NSString * curLanguage = [Util currentLanguage];
//    return [curLanguage isEqualToString:@"zh-Hans-CN"] || [curLanguage isEqualToString:@"zh-Hans"];
//}
//
///** 用于添加配乐和添加配音 1-music 2-audio -1时间太短 -2底层库问题 0 添加成功 flag=YES 系统音乐库中的音乐*/
//+ (int)addAudio:(qxMediaObject*)audioObj WithTrack:(qxTrack*)track startTime:(float)second duration:(CMTime)duration flag:(BOOL)flag
//{
//    NSURL * fileURL = nil;
//    if(flag){
//        fileURL = [NSURL URLWithString:audioObj.strFilePath];
//    }else{
//        fileURL = [NSURL fileURLWithPath:audioObj.strFilePath];
//    }
//    AVURLAsset * asset=[AVURLAsset URLAssetWithURL:fileURL options:@{AVURLAssetPreferPreciseDurationAndTimingKey : @YES}];
//    int dura=CMTimeGetSeconds(asset.duration)*1000;
//    //NSLog(@"add duration===%d",dura);
//    if (dura<500) {//不允许少于0.5秒---
//        return -1;
//    }
//    
//    if(audioObj && track && audioObj.eType == eMT_Audio && track.eType == eMT_Audio){
//        float startTime = second;
//        
//        Float64 audioDuration = CMTimeGetSeconds(audioObj.actualTimeRange.duration);
//        Float64 availVideoDuration = CMTimeGetSeconds(duration) - startTime;
//        //NSLog(@"audio=%f  video duration=%f",audioDuration,availVideoDuration);
//        qxMediaObject *nearestAudioObj = [track findNearestAudioObjAfterTime:startTime];
//        if(nearestAudioObj){
//            availVideoDuration = CMTimeGetSeconds(nearestAudioObj.startTimeOfTrack) - startTime;
//        }
//        
//        if(audioDuration >= availVideoDuration){
//            Float64 leftTrim = CMTimeGetSeconds(audioObj.actualTimeRange.start);
//            Float64 rightTrim = CMTimeGetSeconds(audioObj.mediaOriginalDuration) -  availVideoDuration - leftTrim;
//            if(nearestAudioObj && startTime + availVideoDuration >= CMTimeGetSeconds(nearestAudioObj.startTimeOfTrack)){
//                rightTrim += startTime + availVideoDuration - CMTimeGetSeconds(nearestAudioObj.startTimeOfTrack);
//            }
//            [audioObj setTrim:ceil(leftTrim*1000)  withRight:ceil(rightTrim * 1000)];
//        }
//        if([track addMediaObject:audioObj]){
//            CMTime startSec=CMTimeMakeWithSeconds(startTime, duration.timescale);
//            if (![track updateTimeAtIndex:((int)track.mpMediaObjArray.count - 1)
//                                startTime:startSec]) {
//                [track delMediaObject:((int)track.mpMediaObjArray.count - 1)];
//                return -2;
//            }
//            return 0;
//        }
//    }
//    
//    return -2;
//}

//+ (void)uploadVideoALAssetToFacebook:(NSString*)videoPath forView:(UIView *)view
//{
//    [MBProgressHUD showHUDAddedTo:view animated:YES];
//    if(!videoPath){
//        [MBProgressHUD hideAllHUDsForView:view animated:YES];
//        [view makeToast:NSLocalizedString(@"Upload Failed", nil)];
//        return;
//    }
//    NSData *videoData = [NSData dataWithContentsOfFile:videoPath];
//    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                   videoData, @"video.mp4",
//                                   @"video/quicktime", @"contentType",
//                                   @"#VideoShow#", @"name",
//                                   @"", @"description",
//                                   nil];
//    
//    if (FBSession.activeSession.isOpen)
//    {
//        [FBRequestConnection startWithGraphPath:@"me/videos"
//                                     parameters:params
//                                     HTTPMethod:@"POST"
//                              completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                                  [Util deleteFile:videoPath];
//                                  dispatch_async(dispatch_get_main_queue(), ^{
//                                      [MBProgressHUD hideAllHUDsForView:view animated:YES];
//                                      if(error){
//                                          [view makeToast:NSLocalizedString(@"Upload Failed", nil) duration:2.0 position:@"bottom"];
//                                      }else{
//                                          [view makeToast:NSLocalizedString(@"Upload Success", nil) duration:2.0 position:@"bottom"];
//                                      }
//                                  });
//                              }];
//    }else{
//        NSArray *permissions = [[NSArray alloc] initWithObjects:@"publish_stream",@"publish_actions",nil];
//        [FBSession openActiveSessionWithPublishPermissions:permissions defaultAudience:FBSessionDefaultAudienceNone  allowLoginUI:YES
//                                         completionHandler:^(FBSession *session,
//                                                             FBSessionState status,
//                                                             NSError *error) {
//                                             if (error){
//                                                 dispatch_async(dispatch_get_main_queue(), ^{
//                                                      [Util deleteFile:videoPath];
//                                                     [MBProgressHUD hideAllHUDsForView:view animated:YES];
//                                                     [view makeToast:NSLocalizedString(@"Login Fail", nil) duration:2.0 position:@"bottom"];
//                                                 });
//                                             }else if (FB_ISSESSIONOPENWITHSTATE(status)){
//                                                 [FBRequestConnection startWithGraphPath:@"me/videos"
//                                                                              parameters:params
//                                                                              HTTPMethod:@"POST"
//                                                                       completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                                                                           [Util deleteFile:videoPath];
//                                                                           dispatch_async(dispatch_get_main_queue(), ^{
//                                                                               [MBProgressHUD hideAllHUDsForView:view animated:YES];
//                                                                               if(error){
//                                                                                   [view makeToast:NSLocalizedString(@"Upload Failed", nil) duration:2.0 position:@"bottom"];
//                                                                               }else{
//                                                                                   [view makeToast:NSLocalizedString(@"Upload Success", nil) duration:2.0 position:@"bottom"];
//                                                                               }
//                                                                           });
//                                                                       }];
//                                             }
//                                         }];
//    }
//}

@end
