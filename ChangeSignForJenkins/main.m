//
//  main.m
//  ChangeSignForJenkins
//
//  Created by zhouchengyu on 2017/12/16.
//  Copyright © 2017年 zhouchengyu. All rights reserved.
//

#import <Foundation/Foundation.h>
void process (NSString * filePath) {
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    if (!dic) {
        return;
    }
    NSMutableDictionary *configDic = [dic[@"objects"] objectForKey:@"F22E979C1FE1366F004B8C91"];
    if (configDic) {
        configDic [@"attributes"] [@"TargetAttributes"] [@"F22E97A31FE1366F004B8C91"][@"ProvisioningStyle"] = @"Manual";
    }
    configDic = [dic[@"objects"] objectForKey:@"F22E97D41FE1366F004B8C91"];
    if (configDic) {
        configDic[@"buildSettings"][@"CODE_SIGN_STYLE"] = @"Manual";
        configDic[@"buildSettings"][@"CODE_SIGN_IDENTITY[sdk=iphoneos*]"] = @"iPhone Developer: Brian Lin (7XX974NDLV)";
        //configDic[@"buildSettings"][@"PROVISIONING_PROFILE"] = @"4940b45f-c196-4c6f-b334-5edaaffdc633";
        configDic[@"buildSettings"][@"PROVISIONING_PROFILE_SPECIFIER"] = @"omi_ios_dev_0601_provision";
        configDic[@"buildSettings"][@"ENABLE_BITCODE"] = @"NO";

    }
    
    configDic = [dic[@"objects"] objectForKey:@"F22E97D51FE1366F004B8C91"];
    if (configDic) {
        configDic[@"buildSettings"][@"CODE_SIGN_STYLE"] = @"Manual";
        configDic[@"buildSettings"][@"CODE_SIGN_IDENTITY[sdk=iphoneos*]"] = @"iPhone Distribution: Brian Lin (V332RPGP8U)";
        configDic[@"buildSettings"][@"PROVISIONING_PROFILE_SPECIFIER"] = @"omi_adhoc_06_01_provision";
        //configDic[@"buildSettings"][@"PROVISIONING_PROFILE"] = @"cb6a8529-8d15-480e-9a05-441091f9887a";
        configDic[@"buildSettings"][@"ENABLE_BITCODE"] = @"NO";

    }
  
    configDic = [dic[@"objects"] objectForKey:@"BFF3DD5520BD785900444D44"];
    if (configDic) {
      configDic[@"buildSettings"][@"CODE_SIGN_STYLE"] = @"Manual";
      configDic[@"buildSettings"][@"CODE_SIGN_IDENTITY[sdk=iphoneos*]"] = @"iPhone Developer: Brian Lin (7XX974NDLV)";
      configDic[@"buildSettings"][@"PROVISIONING_PROFILE_SPECIFIER"] = @"omi_ios_dev_0601_provision";
      //configDic[@"buildSettings"][@"PROVISIONING_PROFILE"] = @"cb6a8529-8d15-480e-9a05-441091f9887a";
        configDic[@"buildSettings"][@"ENABLE_BITCODE"] = @"NO";

    }
    [dic writeToFile:filePath atomically:YES];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        if (argc >= 2) {
            NSString *filePath = [NSString stringWithUTF8String:argv[1]];
            process(filePath);
            NSLog(@"procecc finished");
        }else {
            NSLog(@"please input the project file path");
        }
    }
    return 0;
}

