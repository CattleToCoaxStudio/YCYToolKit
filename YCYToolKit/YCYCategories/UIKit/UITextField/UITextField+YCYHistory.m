//
//  UITextField+History.m
//  Demo
//
//  Created by DamonDing on 15/5/26.
//  Copyright (c) 2015年 morenotepad. All rights reserved.
//

#import "UITextField+YCYHistory.h"
#import <objc/runtime.h>

#define ycy_history_X(view) (view.frame.origin.x)
#define ycy_history_Y(view) (view.frame.origin.y)
#define ycy_history_W(view) (view.frame.size.width)
#define ycy_history_H(view) (view.frame.size.height)

static char kTextFieldIdentifyKey;
static char kTextFieldHistoryviewIdentifyKey;

#define ycy_ANIMATION_DURATION 0.3f
#define ycy_ITEM_HEIGHT 40
#define ycy_CLEAR_BUTTON_HEIGHT 45
#define ycy_MAX_HEIGHT 300


@interface UITextField ()<UITableViewDataSource,UITableViewDelegate>

@property (retain, nonatomic) UITableView *ycy_historyTableView;

@end


@implementation UITextField (YCYHistory)

- (NSString*)ycy_identify {
    return objc_getAssociatedObject(self, &kTextFieldIdentifyKey);
}

- (void)setYcy_identify:(NSString *)identify {
    objc_setAssociatedObject(self, &kTextFieldIdentifyKey, identify, OBJC_ASSOCIATION_RETAIN);
}

- (UITableView*)ycy_historyTableView {
    UITableView* table = objc_getAssociatedObject(self, &kTextFieldHistoryviewIdentifyKey);
    
    if (table == nil) {
        table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITextFieldHistoryCell"];
        table.layer.borderColor = [UIColor grayColor].CGColor;
        table.layer.borderWidth = 1;
        table.delegate = self;
        table.dataSource = self;
        objc_setAssociatedObject(self, &kTextFieldHistoryviewIdentifyKey, table, OBJC_ASSOCIATION_RETAIN);
    }
    
    return table;
}

- (NSArray*)ycy_loadHistroy {
    if (self.ycy_identify == nil) {
        return nil;
    }

    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    NSDictionary* dic = [def objectForKey:@"UITextField+YCYHistory"];
    
    if (dic != nil) {
        return [dic objectForKey:self.ycy_identify];
    }

    return nil;
}

- (void)ycy_synchronize {
    if (self.ycy_identify == nil || [self.text length] == 0) {
        return;
    }
    
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    NSDictionary* dic = [def objectForKey:@"UITextField+YCYHistory"];
    NSArray* history = [dic objectForKey:self.ycy_identify];
    
    NSMutableArray* newHistory = [NSMutableArray arrayWithArray:history];
    
    __block BOOL haveSameRecord = false;
    __weak typeof(self) weakSelf = self;
    
    [newHistory enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([(NSString*)obj isEqualToString:weakSelf.text]) {
            *stop = true;
            haveSameRecord = true;
        }
    }];
    
    if (haveSameRecord) {
        return;
    }
    
    [newHistory addObject:self.text];
    
    NSMutableDictionary* dic2 = [NSMutableDictionary dictionaryWithDictionary:dic];
    [dic2 setObject:newHistory forKey:self.ycy_identify];
    
    [def setObject:dic2 forKey:@"UITextField+ycyHistory"];
    
    [def synchronize];
}

- (void) ycy_showHistory; {
    NSArray* history = [self ycy_loadHistroy];
    
    if (self.ycy_historyTableView.superview != nil || history == nil || history.count == 0) {
        return;
    }
    
    CGRect frame1 = CGRectMake(ycy_history_X(self), ycy_history_Y(self) + ycy_history_H(self) + 1, ycy_history_W(self), 1);
    CGRect frame2 = CGRectMake(ycy_history_X(self), ycy_history_Y(self) + ycy_history_H(self) + 1, ycy_history_W(self), MIN(ycy_MAX_HEIGHT, ycy_ITEM_HEIGHT * history.count + ycy_CLEAR_BUTTON_HEIGHT));
    
    self.ycy_historyTableView.frame = frame1;
    
    [self.superview addSubview:self.ycy_historyTableView];
    
    [UIView animateWithDuration:ycy_ANIMATION_DURATION animations:^{
        self.ycy_historyTableView.frame = frame2;
    }];
}

- (void) ycy_clearHistoryButtonClick:(UIButton*) button {
    [self ycy_clearHistory];
    [self ycy_hideHistroy];
}

- (void)ycy_hideHistroy; {
    if (self.ycy_historyTableView.superview == nil) {
        return;
    }

    CGRect frame1 = CGRectMake(ycy_history_X(self), ycy_history_Y(self) + ycy_history_H(self) + 1, ycy_history_W(self), 1);
    
    [UIView animateWithDuration:ycy_ANIMATION_DURATION animations:^{
        self.ycy_historyTableView.frame = frame1;
    } completion:^(BOOL finished) {
        [self.ycy_historyTableView removeFromSuperview];
    }];
}

- (void) ycy_clearHistory; {
    NSUserDefaults* def = [NSUserDefaults standardUserDefaults];
    
    [def setObject:nil forKey:@"UITextField+ycyHistory"];
    [def synchronize];
}


#pragma mark tableview datasource
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView; {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; {
    return [self ycy_loadHistroy].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath; {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"UITextFieldHistoryCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITextFieldHistoryCell"];
    }
    
    cell.textLabel.text = [self ycy_loadHistroy][indexPath.row];
    
    return cell;
}
#pragma clang diagnostic pop

#pragma mark tableview delegate
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section; {
    UIButton* clearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(ycy_clearHistoryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return clearButton;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; {
    return ycy_ITEM_HEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section; {
    return ycy_CLEAR_BUTTON_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath; {
    self.text = [self ycy_loadHistroy][indexPath.row];
    [self ycy_hideHistroy];
}

@end
