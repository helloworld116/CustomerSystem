//
//  ChoiceDateView.m
//  UIMenuBarDemo
//
//  Created by 文正光 on 13-6-20.
//
//

#import "ChoiceDateView.h"
#import <QuartzCore/QuartzCore.h>

#define kSemiModalAnimationDuration 0.3f
@interface ChoiceDateView()
@property (nonatomic,retain) NSMutableArray *years;
@property (nonatomic,retain) NSArray *quarterlies;
@property (nonatomic,retain) NSArray *months;
@end

@implementation ChoiceDateView

- (id)initWithFrame:(CGRect)frame
{
//    self = [super initWithFrame:frame];
    self = (ChoiceDateView *)[[[NSBundle mainBundle] loadNibNamed:@"ChoiceDateView" owner:self options:nil] objectAtIndex:0];
    if (self) {
        // Initialization code
        self.years = [[NSMutableArray alloc] initWithCapacity:200];
        for (int i=1900; i<2100; i++) {
            [self.years addObject:[NSString stringWithFormat:@"%d年",i]];
        }
        self.quarterlies = [NSArray arrayWithObjects:@"1季度",@"2季度",@"3季度",@"4季度",nil];
        self.months = [NSArray arrayWithObjects:@"1月份",@"2月份",@"3月份",@"4月份",@"5月份",@"6月份",@"7月份",@"8月份",@"9月份",@"10月份",@"11月份",@"12月份", nil];
        [self.segControl addTarget:self
                             action:@selector(changePickerViewData:)
                   forControlEvents:UIControlEventValueChanged];
        self.pickView.dataSource = self;
        self.pickView.delegate = self;
    }
    return self;
}

-(void)changePickerViewData:(id)sender{
    [self.pickView reloadAllComponents];
    if (self.segControl.selectedSegmentIndex==0) {
        [self.pickView selectRow:100 inComponent:0 animated:NO];
    }else if (self.segControl.selectedSegmentIndex==1){
        [self.pickView selectRow:100 inComponent:0 animated:NO];
        [self.pickView selectRow:2 inComponent:1 animated:NO];
    }else{
        [self.pickView selectRow:100 inComponent:0 animated:NO];
        [self.pickView selectRow:2 inComponent:1 animated:NO];
    }
}

- (void)_presentModelView
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    if (![keywindow.subviews containsObject:self]) {
        // Calulate all frames
        CGRect sf = self.frame;
        CGRect vf = keywindow.frame;
        CGRect f  = CGRectMake(0, vf.size.height-sf.size.height, vf.size.width, sf.size.height);
        CGRect of = CGRectMake(0, 0, vf.size.width, vf.size.height-sf.size.height);
        
        // Add semi overlay
        UIView * overlay = [[UIView alloc] initWithFrame:keywindow.bounds];
        overlay.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.6];
        
        UIView* ss = [[UIView alloc] initWithFrame:keywindow.bounds];
        [overlay addSubview:ss];
        [keywindow addSubview:overlay];
        
        UIControl * dismissButton = [[UIControl alloc] initWithFrame:CGRectZero];
        [dismissButton addTarget:self action:@selector(_dismissModalView) forControlEvents:UIControlEventTouchUpInside];
        dismissButton.backgroundColor = [UIColor clearColor];
        dismissButton.frame = of;
        [overlay addSubview:dismissButton];
        
        // Begin overlay animation
        [UIView animateWithDuration:kSemiModalAnimationDuration animations:^{
            ss.alpha = 0.5;
        }];
        
        // Present view animated
        self.frame = CGRectMake(0, vf.size.height, vf.size.width, sf.size.height);
        [keywindow addSubview:self];
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowOffset = CGSizeMake(0, -2);
        self.layer.shadowRadius = 5.0;
        self.layer.shadowOpacity = 0.8;
        [UIView animateWithDuration:kSemiModalAnimationDuration animations:^{
            self.frame = f;
        }];
    }
}

- (void)_dismissModalView
{
    UIWindow * keywindow = [[UIApplication sharedApplication] keyWindow];
    UIView * modal = [keywindow.subviews objectAtIndex:keywindow.subviews.count-1];
    UIView * overlay = [keywindow.subviews objectAtIndex:keywindow.subviews.count-2];
    [UIView animateWithDuration:kSemiModalAnimationDuration animations:^{
        modal.frame = CGRectMake(0, keywindow.frame.size.height, modal.frame.size.width, modal.frame.size.height);
    } completion:^(BOOL finished) {
        [overlay removeFromSuperview];
        [modal removeFromSuperview];
    }];
    
    // Begin overlay animation
    UIImageView * ss = (UIImageView*)[overlay.subviews objectAtIndex:0];
    [UIView animateWithDuration:kSemiModalAnimationDuration animations:^{
        ss.alpha = 1;
    }];
}

- (IBAction)choiceDate:(id)sender {
}

- (void)show{
    
    [self _presentModelView];
}
- (void)dismiss{
    [self _dismissModalView];
}

#pragma mark uipickview datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if (self.segControl.selectedSegmentIndex==0) {
        return 1;
    }else{
        return 2;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (self.segControl.selectedSegmentIndex==0) {
        return self.years.count;
    }else if (self.segControl.selectedSegmentIndex==1){
        if (component==0) {
            return self.years.count;
        }else{
            return self.quarterlies.count;
        }
    }else{
        if (component==0) {
            return self.years.count;
        }else{
            return self.months.count;
        }
    }
}

#pragma mark uipickview delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40.f;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (self.segControl.selectedSegmentIndex==0) {
        return 320.f;
    }else{
        return 160;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    //取得指定列的宽度
    CGFloat width=[self pickerView:pickerView widthForComponent:component];
    //取得指定列，行的高度
    CGFloat height=[self pickerView:pickerView rowHeightForComponent:component];
    //定义一个视图
    UIView *myView=[[UIView alloc] init];
    //指定视图frame
    myView.frame=CGRectMake(0, 0, width, height);
    UILabel *labelOnComponent=[[UILabel alloc] init];
    labelOnComponent.backgroundColor = [UIColor clearColor];
    labelOnComponent.textAlignment = UITextAlignmentCenter;
    CGRect viewRect = myView.frame;
    viewRect.size.width = 60;
    if (self.segControl.selectedSegmentIndex==0) {
        viewRect.origin.x = 130;
        labelOnComponent.text = [self.years objectAtIndex:row];
    }else if (self.segControl.selectedSegmentIndex==1){
        viewRect.origin.x = 50;
        if (component==0) {
            labelOnComponent.text = [self.years objectAtIndex:row];
        }else{
            labelOnComponent.text = [self.quarterlies objectAtIndex:row];
        }
    }else{
        viewRect.origin.x = 50;
        if (component==0) {
            labelOnComponent.text = [self.years objectAtIndex:row];
        }else{
            labelOnComponent.text = [self.months objectAtIndex:row];
        }
    }
    labelOnComponent.frame = viewRect;
    [myView addSubview:labelOnComponent];
    return myView;
}

//选项默认值
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated{
    return;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

}

@end
