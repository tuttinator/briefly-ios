class AppDelegate
  BEIGE = BubbleWrap.rgb_color(249, 241, 226)
  RED = BubbleWrap.rgb_color(198, 78, 57)
  attr_reader :list_view_controller

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

    @list_view_controller = ListViewController.new

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.backgroundColor = BEIGE
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(@list_view_controller)
    @window.makeKeyAndVisible

    application.applicationIconBadgeNumber = 0

    true
  end

  def applicationDidBecomeActive(application)
    @list_view_controller.fetchArticles
  end

  def shouldAutorotate
    false
  end
end
