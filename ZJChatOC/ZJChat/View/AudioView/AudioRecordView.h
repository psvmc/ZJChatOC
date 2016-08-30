#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AudioRecordViewTouchState) {
    AudioRecordViewTouchStateInside,
    AudioRecordViewTouchStateOutside
};

@protocol AudioRecordViewDelegate;

@interface AudioRecordView : UIControl

@property (nonatomic, assign, readonly) BOOL isRecording;
@property (nonatomic, weak) id<AudioRecordViewDelegate> delegate;

@end

@protocol AudioRecordViewDelegate <NSObject>

@optional

- (void)recordViewRecordStarted:(AudioRecordView *)recordView;
- (void)recordViewRecordFinished:(AudioRecordView *)recordView file:(NSString *)file duration:(NSTimeInterval)duration;
- (void)recordView:(AudioRecordView *)recordView touchStateChanged:(AudioRecordViewTouchState)touchState;
- (void)recordView:(AudioRecordView *)recordView volume:(double)volume;
- (void)recordViewRecord:(AudioRecordView *)recordView err:(NSError *)err;

@end