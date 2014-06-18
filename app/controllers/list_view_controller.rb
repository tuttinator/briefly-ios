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

    # image view at the top of the cell
    image_area = UIView.alloc.initWithFrame CGRectMake(0, 0, 320, 116)
    image = UIImageView.alloc.initWithFrame CGRectMake(0, 0, 320, 116)
    image.url = article.image
    image_area.addSubview(image)

    cell.addSubview(image_area)

    # text view at the bottom of the cell
    text_area = UIView.alloc.initWithFrame CGRectMake(6, 121, 320, 60)
    title = UILabel.alloc.initWithFrame CGRectMake(0, 0, 300, 40)
    title.text = article.title
    setup_label(title)

    text_area.addSubview(title)

    cell.addSubview(text_area)

    cell.backgroundColor = BEIGE
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell
  end

  def tableView(tableView, heightForRowAtIndexPath: indexPath)
    170
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    article_controller = ArticleController.new(@articles[indexPath.row])
    self.navigationController.pushViewController(article_controller, animated: true)
  end

  private

  def setup_label(label)
    label.textColor = BubbleWrap.rgb_color(80, 80, 80)
    label.numberOfLines = 0
    label.sizeToFit
    label.lineBreakMode = UILineBreakModeWordWrap
  end
end
