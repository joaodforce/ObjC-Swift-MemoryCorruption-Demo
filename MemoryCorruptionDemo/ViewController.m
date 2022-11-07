//
//  ViewController.m
//  MemoryCorruptionDemo
//
//  Created by João Eduardo on 07/11/22.
//

#import "ViewController.h"

#import "MemoryCorruptionDemo-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[ObsMocks asyncTask] then:^id _Nullable(NSString * _Nullable value) {
       // Async task is done
        
        UIAlertController *al = [UIAlertController alertControllerWithTitle:nil message:value preferredStyle:(UIAlertControllerStyleAlert)];
        
        [al addAction:[UIAlertAction actionWithTitle:@"Ok" style:(UIAlertActionStyleDefault) handler:nil]];
        
        [self presentViewController:al animated:true completion:nil];
        return nil;
    }];
}


@end
