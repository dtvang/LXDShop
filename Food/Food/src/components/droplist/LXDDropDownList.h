//
//  LXDDropDownList.h
//  Food
//
//  Created by zVCTz on 5/10/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    COUNTRY = 0,
    DISTRICT = 1,
    PROVINCE = 2,
    BUSINESS_MEHTOD = 3
}TYPE_DATA;

@protocol LXDDropDownListDelegate;
@interface LXDDropDownList : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *data;
@property (weak, nonatomic) id<LXDDropDownListDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnClose;

- (void) presentPopoverFromRect:(CGRect)rect inViewController:(UIViewController *)controller withType:(TYPE_DATA)type andData:(NSMutableArray *)data;
- (IBAction)closeView:(id)sender;
@end

@protocol LXDDropDownListDelegate <NSObject>

@optional
- (void) selected:(LXDDropDownList *)source withData:(NSString *)text ofType:(TYPE_DATA)type;

@end
