//
//  Controller.m
//  ObjcRequest
//
//  Created by Angelos Staboulis on 6/11/23.
//

#import "Controller.h"
#import "GenderModel.h"
@implementation Controller
-(void) createRequest:(NSString*) nameString : (Completion) blockCompletion {
    NSString  *parameter = [NSString stringWithFormat:@"https://api.genderize.io/?name=%@",nameString];
    NSURL *urlMain = [[NSURL alloc] initWithString:parameter];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:urlMain];
    NSURLSession *session = [NSURLSession sharedSession];
    GenderModel *model = [[GenderModel alloc] init];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        self->_json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
        [model setName:self->_json[@"name"]];
        [model setGender:self->_json[@"gender"]];
        [model setProbability:self->_json[@"probability"]];
        blockCompletion(model);
    }];
    [dataTask resume];
}
@end
