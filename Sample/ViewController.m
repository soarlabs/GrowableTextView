//
//  ViewController.m
//  Sample
//
//  Created by M Usman Saeed on 14/05/2017.
//  Copyright © 2017 M Usman Saeed. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView.contentInset = UIEdgeInsetsMake(5, 5, 5, 2);
    _textView.returnKeyType = UIReturnKeyDefault;
    _textView.font = [UIFont systemFontOfSize:15.0f];
    _textView.delegate = self;
    _textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}


-(void) keyboardWillShow:(NSNotification *)note{
    
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    CGRect containerFrame = _containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + containerFrame.size.height);
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    _containerView.frame = containerFrame;
    
    [UIView commitAnimations];
}

-(void) keyboardWillHide:(NSNotification *)note{
    
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    CGRect containerFrame = _containerView.frame;
    containerFrame.origin.y = self.view.bounds.size.height - containerFrame.size.height;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    _containerView.frame = containerFrame;
    
    [UIView commitAnimations];
}

- (void)growingTextView:(TextField *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
    CGRect r = _containerView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
    _containerView.frame = r;
}


- (BOOL)growingTextViewShouldBeginEditing:(TextField *)growingTextView;{
    
    return YES;
}

- (BOOL)growingTextViewShouldEndEditing:(TextField *)growingTextView;{
    
    return YES;
}

- (void)growingTextViewDidBeginEditing:(TextField *)growingTextView;{
    
}

- (void)growingTextViewDidEndEditing:(TextField *)growingTextView;{
    
}

- (BOOL)growingTextView:(TextField *)growingTextView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;{
    return YES;
}

- (void)growingTextViewDidChange:(TextField *)growingTextView;{
    
}

- (void)growingTextView:(TextField *)growingTextView didChangeHeight:(float)height;{
    
}

- (void)growingTextViewDidChangeSelection:(TextField *)growingTextView;{
    
}
- (BOOL)growingTextViewShouldReturn:(TextField *)growingTextView;{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    
}

- (IBAction)btnDone:(id)sender {
    [_textView resignFirstResponder];
}


@end
