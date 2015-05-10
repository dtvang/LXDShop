//
//  LXDDropDownList.h
//  Food
//
//  Created by zVCTz on 5/10/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXDDropDownList : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;
- (void)showAtRect:(CGRect)frame withData:(NSMutableArray *)data;
- (IBAction)closeView:(id)sender;
@end
