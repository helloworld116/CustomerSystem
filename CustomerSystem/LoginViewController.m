//
//  LoginViewController.m
//  CustomerSystem
//
//  Created by wzg on 13-4-22.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()
@property (nonatomic,copy) NSString *uname;
@property (nonatomic,copy) NSString *pword;
@property BOOL keyboardWasShown;
@property CGRect inputElementFrame;
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setBackground{
    self.scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_background.png"]];
    self.continerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"body.png"]];
    self.titleImgView.image = [UIImage imageNamed:@"title.png"];
    self.username.background = [UIImage imageNamed:@"username.png"];
    self.password.background = [UIImage imageNamed:@"password.png"];
    self.username.background = [UIImage imageNamed:@"username.png"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setBackground];
    self.navigationController.navigationBarHidden = YES;
    self.username.delegate = self;
    self.password.delegate = self;
    self.username.text = @"646767424@qq.com";
    self.password.text = @"123456";
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHiden:) name:UIKeyboardWillHideNotification object:nil];
//    [self registerForKeyboardNotifications];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setUsername:nil];
    [self setPassword:nil];
    [self setPassword:nil];
  
    self.uname = nil;
    self.pword = nil;
    [self removeForKeyboardNotifications];
    [self setScrollView:nil];
    [self setContinerView:nil];
    [self setTitleImgView:nil];
    [self setBtnLogin:nil];
    [super viewDidUnload];
}

- (IBAction)doLogin:(id)sender {
    if([self validate]){
        self.request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:kLoginURL]];
        [self.request setUseCookiePersistence:YES];
        [self.request setPostValue:self.uname forKey:@"username"];
        [self.request setPostValue:self.pword forKey:@"password"];
        [self.request setDelegate:self];
        [self.request setDidFailSelector:@selector(requestFailed:)];
        [self.request setDidFinishSelector:@selector(requestLogin:)];
        [self.request startAsynchronous];
        [SVProgressHUD showWithStatus:@"正在登录..."];
    }
}

-(BOOL)validate{
    //键盘缩回
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    //过滤左右空格
    self.uname = [self.username.text stringByTrimmingCharactersInSet:
    [NSCharacterSet whitespaceCharacterSet]];
    self.pword = [self.password.text stringByTrimmingCharactersInSet:
    [NSCharacterSet whitespaceCharacterSet]];
    if (self.uname == nil || [@"" isEqualToString:self.uname]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"用户名不能为空";
        hud.margin = 10.f;
        hud.yOffset = 180.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return NO;
    }
    if (self.pword ==nil || [@"" isEqualToString:self.pword]) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"密码不能为空";
        hud.margin = 10.f;
        hud.yOffset = 180.f;
        hud.removeFromSuperViewOnHide = YES;
        [hud hide:YES afterDelay:2];
        return NO;
    }
    return YES;
}

- (IBAction)backgroundTouch:(id)sender {
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
}

-(void) requestFailed:(ASIHTTPRequest *)request{
    [SVProgressHUD dismissWithError:@"网络请求出错"];
    self.password.text = nil;
}

-(void)requestLogin:(ASIHTTPRequest *)request{
    debugLog(@"the string is %@",request.responseString);
    NSDictionary *dict = [Tool stringToDictionary:request.responseString];
    if ([[dict objectForKey:@"error"] intValue]==0) {
        [SVProgressHUD dismissWithSuccess:@"登录成功"];
        kSharedApp.accessToken = [[dict objectForKey:@"data"] objectForKey:@"accessToken"];
        kSharedApp.factoryId = [[dict objectForKey:@"data"] objectForKey:@"factoryId"];
        UITabBarController *tab = [kSharedApp.storyboard instantiateViewControllerWithIdentifier:@"tab"];
        [tab.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar.png"]];
        CATransition *animation = [CATransition animation];
        [animation setDuration:1.0];
        [animation setType: kCATransitionFade];
        [animation setSubtype: kCATransitionFromTop];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        [self.navigationController pushViewController:tab animated:NO];
        [self.navigationController.view.layer addAnimation:animation forKey:nil];
    }else{
        self.password.text = nil;
        NSString *msg = [dict objectForKey:@"description"];
        [SVProgressHUD dismissWithSuccess:msg];
    }

//    [SVProgressHUD dismissWithSuccess:@"登录成功"];
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    UITabBarController *tab = [app.storyboard instantiateViewControllerWithIdentifier:@"tab"];
//    [tab.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar.png"]];
//    CATransition *animation = [CATransition animation];
//    [animation setDuration:1.0];
//    [animation setType: kCATransitionFade];
//    [animation setSubtype: kCATransitionFromTop];
//    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
//    [self.navigationController pushViewController:tab animated:NO];
//    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}


- (void) registerForKeyboardNotifications{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
    
}

- (void) removeForKeyboardNotifications{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}


- (void) keyboardWasShown:(NSNotification *) notif{
    if (!self.keyboardWasShown) {
        NSDictionary *info = [notif userInfo];
        
        NSValue *value = [info objectForKey:UIKeyboardBoundsUserInfoKey];
        CGSize keyboardSize = [value CGRectValue].size;
        
        CGRect scrollViewFrame= [self.scrollView frame];
        scrollViewFrame.size.height -= keyboardSize.height;
        self.scrollView.frame = scrollViewFrame;
        [self.scrollView scrollRectToVisible:self.inputElementFrame animated:YES];
        self.keyboardWasShown = YES;
    }
}

- (void) keyboardWasHidden:(NSNotification *) notif{
    if (!self.keyboardWasShown) {
        NSDictionary *info = [notif userInfo];
        
        NSValue *value = [info objectForKey:UIKeyboardBoundsUserInfoKey];
        CGSize keyboardSize = [value CGRectValue].size;
        
        CGRect scrollViewFrame= [self.scrollView frame];
        scrollViewFrame.size.height += keyboardSize.height;
        self.scrollView.frame = scrollViewFrame;
        self.keyboardWasShown = NO;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    self.keyboardWasShown = NO;
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    self.inputElementFrame = frame;
}
@end