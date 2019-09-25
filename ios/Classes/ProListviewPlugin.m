#import "ProListviewPlugin.h"
#import <pro_listview/pro_listview-Swift.h>

@implementation ProListviewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftProListviewPlugin registerWithRegistrar:registrar];
}
@end
