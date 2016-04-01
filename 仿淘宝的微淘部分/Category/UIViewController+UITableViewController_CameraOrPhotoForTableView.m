//
//  UIViewController+UITableViewController_CameraOrPhotoForTableView.m
//  JiuLongGang
//
//  Created by 付林汀 on 15/11/10.
//  Copyright © 2015年 李怀泰. All rights reserved.
//

#import "UIViewController+UITableViewController_CameraOrPhotoForTableView.h"

@implementation UIViewController (UITableViewController_CameraOrPhotoForTableView)

- (void)showActionSheet{
    double version = [[UIDevice currentDevice].systemVersion doubleValue];//判定系统版本。
    if(version >= 8.0f){
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self useCamera];
        }];
        UIAlertAction *addPhoneAction = [UIAlertAction actionWithTitle:@"从相薄选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self usePhoto];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [actionSheet addAction:photoAction];
        [actionSheet addAction:addPhoneAction];
        [actionSheet addAction:cancelAction];
        [self presentViewController:actionSheet animated:true completion:nil];
    }
    else{
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相薄选择", nil];
        actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        [actionSheet showInView:self.view];
    }
}


-(void)useCamera{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:^{
    }];
}

-(void)usePhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:^{
    }];
}

//选择相机时actionSheet点击事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //调用相机
    if (buttonIndex == 0)
    {
        [self useCamera];
    }
    else if (buttonIndex == 1)
    {
        [self usePhoto];
    }
}

- (void) showMessage:(NSString*)message{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [alert show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissWithClickedButtonIndex:alert.cancelButtonIndex animated:YES];
    });
}

@end
