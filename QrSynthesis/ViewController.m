//
//  ViewController.m
//  QrSynthesis
//
//  Created by 马少洋 on 16/6/2.
//  Copyright © 2016年 马少洋. All rights reserved.
//

#import "ViewController.h"
#import "QRCodeGenerator.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonDidCliked:(UIButton *)sender {
    [self.textField resignFirstResponder];
    if ([sender.titleLabel.text isEqualToString:@"生成"]) {
        [sender setTitle:@"保存" forState:UIControlStateNormal];
        self.imageView.image = [QRCodeGenerator qrImageForString:self.textField.text imageSize:300];
        return;
    }
    [sender setTitle:@"生成" forState:UIControlStateNormal];
    if (self.imageView.image) {
        UIImageWriteToSavedPhotosAlbum(self.imageView.image, self, @selector(showMess:error:contextInfo:), nil);
    }

}
- (void)showMess:(UIImage *)image error:(NSError *)error contextInfo:(id)contextInfo{
    NSLog(@"保存");
}


@end
