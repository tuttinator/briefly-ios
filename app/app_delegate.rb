class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Carnival.startEngine(ENV['CARNIVAL_KEY'],
                         andNotificationTypes:(UIRemoteNotificationTypeBadge|
                                               UIRemoteNotificationTypeSound|
                                               UIRemoteNotificationTypeAlert))
    UINavigationBar.appearance.tap do |o|
      o.barTintColor = BubbleWrap.rgb_color(249, 241, 226)
      o.tintColor = BubbleWrap.rgb_color(198, 78, 57)

      o.setTitleTextAttributes({
        UITextAttributeTextColor => BubbleWrap.rgb_color(198, 78, 57)
      })
    end
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = BubbleWrap.rgb_color(198, 78, 57)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(ListViewController.new)
    @window.makeKeyAndVisible
    true
  end
end
