class AppDelegate
  BEIGE = BubbleWrap.rgb_color(249, 241, 226)
  RED = BubbleWrap.rgb_color(198, 78, 57)

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Carnival.startEngine(ENV['CARNIVAL_KEY'],
                         andNotificationTypes:(UIRemoteNotificationTypeBadge|
                                               UIRemoteNotificationTypeSound|
                                               UIRemoteNotificationTypeAlert))
    UINavigationBar.appearance.tap do |o|
      o.barTintColor = BEIGE
      o.tintColor = RED

      o.setTitleTextAttributes({
        UITextAttributeTextColor => RED
      })
    end
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = BEIGE
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(ListViewController.new)
    @window.makeKeyAndVisible
    true
  end
end
