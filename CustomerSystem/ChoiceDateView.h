//
//  ChoiceDateView.h
//  UIMenuBarDemo
//
//  Created by 文正光 on 13-6-20.
//
//

#import <UIKit/UIKit.h>
@interface QueryDate : NSObject
@property int year,quarterly,month;
-(id)initWithYear:(int)year quarterly:(int)quarterly month:(int)month;
@end

@interface ChoiceDateView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>
@property (retain, nonatomic) IBOutlet UIPickerView *pickView;
@property (retain, nonatomic) IBOutlet UIView *titleBgView;
@property (retain, nonatomic) IBOutlet UISegmentedControl *segControl;
@property (nonatomic,retain) QueryDate *querydate;
- (IBAction)choiceDate:(id)sender;
- (void)show;
- (void)dismiss;
@end