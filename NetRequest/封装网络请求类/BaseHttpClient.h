//
//  BaseHttpClient.h
//  NetRequest
//
//  Created by G.Z on 16/4/25.
//  Copyright © 2016年 GZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ISNull.h"

typedef enum:NSUInteger{
    
    GET = 1,
    POST,
    PUT,
    DELETE,
    
    
}BaseHttpType;


typedef void (^httpSuccessBlock)(NSURL *url,id data);
//请求成功的block
typedef void (^httpFailBlock)(NSURL *url, NSError * error);
//请求失败的block


@interface BaseHttpClient : NSObject


@property (nonatomic, strong) NSString * baseURL ;
//服务器的地址“头”

@property (nonatomic, strong)AFHTTPSessionManager * manager;
//请求manager


+ (BaseHttpClient *)sharedClient;
//当前类的单例方法

+ (NSURL *)httpType:(BaseHttpType)requestType  andUrl:(NSString *)url andParam:(NSDictionary *)param andSuccessBlock:(httpSuccessBlock)sucHandler andFailBlock:(httpFailBlock)errorHandler;
//公共的请求方法

+ (void)cancelHTTPOperations;
//取消所有请求

@end
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "ISNull.h"

typedef enum:NSUInteger{
    
    GET = 1,
    POST,
    PUT,
    DELETE,
    
    
}BaseHttpType;


typedef void (^httpSuccessBlock)(NSURL *url,id data);
//请求成功的block
typedef void (^httpFailBlock)(NSURL *url, NSError * error);
//请求失败的block


@interface BaseHttpClient : NSObject


@property (nonatomic, strong) NSString * baseURL ;
//服务器的地址“头”

@property (nonatomic, strong)AFHTTPSessionManager * manager;
//请求manager


+ (BaseHttpClient *)sharedClient;
//当前类的单例方法

+ (NSURL *)httpType:(BaseHttpType)requestType  andUrl:(NSString *)url andParam:(NSDictionary *)param andSuccessBlock:(httpSuccessBlock)sucHandler andFailBlock:(httpFailBlock)errorHandler;
//公共的请求方法

+ (void)cancelHTTPOperations;
//取消所有请求

@end

