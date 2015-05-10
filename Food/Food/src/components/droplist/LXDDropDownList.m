//
//  LXDDropDownList.m
//  Food
//
//  Created by zVCTz on 5/10/15.
//  Copyright (c) 2015 vn. All rights reserved.
//

#import "LXDDropDownList.h"

@interface LXDDropDownList ()

@end

@implementation LXDDropDownList

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layer.cornerRadius = 2.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)showAtRect:(CGRect)frame withData:(NSMutableArray *)data {
    self.tableView.frame = CGRectMake(frame.origin.x - self.tableView.frame.size.width + frame.size.width, frame.origin.y + frame.size.height, self.tableView.frame.size.width, self.tableView.frame.size.height);
}

- (IBAction)closeView:(id)sender {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
    }
    // Configure the cell...
    cell.textLabel.text = @"Hello there!";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row pressed!!");
}

@end
