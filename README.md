# GTest

## SwiftUI and Firebase Google Login sample

Please replace GoogleService-Info.plist.

This sample has a couple of error.


When attempt sign in: <br>

`
  Keyboard cannot present view controllers (attempted to present <SFAuthenticationViewController: 0x7facb4821e00>)
`

When re-attemp sign after once sign-in -> sign-out.

`
[View] First responder error: non-key window attempting reload - allowing due to manual keyboard (first responder window is <UIRemoteKeyboardWindow: 0x7facb505d800; frame = (0 0; 414 896); opaque = NO; autoresize = W+H; layer = <UIWindowLayer: 0x6000035f07e0>>, key window is <UIWindow: 0x7facb5a118f0; frame = (0 0; 414 896); gestureRecognizers = <NSArray: 0x600003bc5dd0>; layer = <UIWindowLayer: 0x60000358c420>>)

`
