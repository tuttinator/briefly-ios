class ArticleController < UIViewController
  def initialize(article)
    @article = article
  end

  def viewDidLoad
    super
    self.title = @article.title
    @web_view = UIWebView.alloc.initWithFrame(view.frame)
    view.addSubview(@web_view)
    @web_view.loadRequest(NSURLRequest.requestWithURL(NSURL.URLWithString(@article.link)))
  end

  def viewWillAppear(animated)
    super
    @web_view.delegate = self
  end

  def viewWillDisappear(animated)
    super
    @web_view.stopLoading
    @web_view.delegate = nil
    UIApplication.sharedApplication.networkActivityIndicatorVisible = false
  end

  #pragma mark - UIWebViewDelegate

  def webViewDidStartLoad(webView)
    # starting the load, show the activity indicator in the status bar
    UIApplication.sharedApplication.networkActivityIndicatorVisible = true
  end

  def webViewDidFinishLoad(webView)
    # finished loading, hide the activity indicator in the status bar
    UIApplication.sharedApplication.networkActivityIndicatorVisible = false;
  end

  def webView(webView, didFailLoadWithError: error)
    # load error, hide the activity indicator in the status bar
    UIApplication.sharedApplication.networkActivityIndicatorVisible = false

    # report the error inside the webview
    error_string = NSString.stringWithFormat("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><html><head><meta http-equiv='Content-Type' content='text/html;charset=utf-8'><title></title></head><body><div style='width: 100%%; text-align: center; font-size: 36pt; color: red;'>An error occurred:<br>%@</div></body></html>", error.localizedDescription)
    @web_view.loadHTMLString(error_string, baseURL: nil)
  end

end
