//
//  UIViewController+UITableViewController_CameraOrPhotoForTableView.h
//  JiuLongGang
//
//  Created by 付林汀 on 15/11/10.
//  Copyright © 2015年 李怀泰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UITableViewController_CameraOrPhotoForTableView)<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>

- (void)showActionSheet;

@end
