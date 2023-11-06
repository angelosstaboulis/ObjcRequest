//
//  Controller.h
//  ObjcRequest
//
//  Created by Angelos Staboulis on 6/11/23.
//

#import <Foundation/Foundation.h>
#import "GenderModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface Controller : NSObject
typedef void (^Completion)(GenderModel *dict);
-(void) createRequest:(NSString*) nameString : (Completion) blockCompletion;
@property NSDictionary *json;

@end

NS_ASSUME_NONNULL_END
