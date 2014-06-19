class ListViewController < UITableViewController
  attr_reader :articles
  BEIGE = BubbleWrap.rgb_color(249, 241, 226)

  def init
    @articles = []
    super.tap do |c|
      c.title = "Briefly"
    end
  end

  def viewDidLoad
    super
    logo = UIImage.imageNamed 'logo.png'
    imageView = UIImageView.alloc.initWithImage logo
    self.navigationItem.titleView = imageView

    fetchArticles
    @refreshControl = UIRefreshControl.alloc.init
    self.tableView.addSubview(@refreshControl)
    self.tableView.backgroundColor = BubbleWrap.rgb_color(249, 241, 226)
    @refreshControl.addTarget(self, action: 'fetchArticles', forControlEvents: UIControlEventValueChanged)
  end

  def fetchArticles
    BW::NetworkIndicator.show
    AFMotion::JSON.get('http://api.briefly.co.nz/v1/articles.json') do |result|
      @articles = Article.load_from_json(result.object)
      @refreshControl.endRefreshing
      self.tableView.reloadData
      BW::NetworkIndicator.hide
    end
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @articles.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_id = 'cell'
    cell = tableView.dequeueReusableCellWithIdentifier cell_id

    if cell.nil?
      cell = BRFTableViewCell.alloc.initWithStyle UITableViewCellStyleSubtitle, reuseIdentifier: cell_id
    end

    article = @articles[indexPath.row]

    cell.image_view.url = article.image
    cell.replace_label_contents(article.title)

    cell
  end

  def tableView(tableView, heightForRowAtIndexPath: indexPath)
    170
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    article_controller = ArticleController.new(@articles[indexPath.row])
    self.navigationController.pushViewController(article_controller, animated: true)
  end

end
