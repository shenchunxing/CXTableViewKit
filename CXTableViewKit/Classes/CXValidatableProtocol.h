//
//  CXValidatableProtocol.h
//  Pods
//
//  Created by 沈春兴 on 2021/9/25.
//

#ifndef CXValidatableProtocol_h
#define CXValidatableProtocol_h



/**
 校验block
 
 @param value 校验对象
 @return 成功 YES  失败NO
 */
typedef BOOL (^CXFormatValidBlock)(id value);

/**
 实时过滤block

 @param value 过滤对象
 @return 通过 YES 不通过 NO
 */
typedef BOOL(^CXFilterBlock)(id value);

@protocol CXValidatableProtocol <NSObject>
@required

//验证是否为空
- (BOOL)valid;

- (NSString *)validatedTitle;
@end


/**
 格式验证
 */
@protocol CXFormatValidatableProtocol <CXValidatableProtocol>
@required

/** 校验对象 */
- (id)validatedObject;

/** 校验block */
- (void)setFormatValidBlock:(CXFormatValidBlock)formatValidBlock;
- (CXFormatValidBlock)formatValidBlock;

@optional
- (void)setFilterBlock:(CXFilterBlock)filerBlock;
- (CXFilterBlock)filterBlock;
/**
 校验信息（优先级比validatedTitle高）
 校验出错时显示
 */
- (NSString *)validatedMessage;
- (void)setValidatedMessage:(NSString *)validatedMessage;
@end

#endif /* CXValidatableProtocol_h */
