class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    Carnival.startEngine(ENV['CARNIVAL_KEY'],
                         andNotificationTypes:(UIRemoteNotificationTypeBadge|
                                               UIRemoteNotificationTypeSound|
                                               UIRemoteNotificationTypeAlert))
    UINavigationBar.appearance.tap do |o|
      o.barTintColor = BubbleWrap.rgb_color(98, 95, 89)
      o.tintColor = BubbleWrap.rgb_color(78, 31, 22)

      o.setTitleTextAttributes({
        UITextAttributeTextColor => BubbleWrap.rgb_color(78, 31, 22)
      })
    end
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(ListViewController.new)
    @window.makeKeyAndVisible
    true
  end
end
