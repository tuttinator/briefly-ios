class ListViewController < UITableViewController
  attr_reader :articles
  BEIGE = BubbleWrap.rgb_color(249, 241, 226)

  def init
    super.tap do |c|
      c.title = "Briefly"
    end
  end

  def viewDidLoad
    super
    @articles = []
    BW::NetworkIndicator.show
    AFMotion::JSON.get('http://api.briefly.co.nz/v1/articles.json') do |result|
      @articles = Article.load_from_json(result.object)
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

    cell.textLabel.text = article.title
    setup_label cell.textLabel

    cell.detailTextLabel.text = article.summary
    setup_label cell.detailTextLabel

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    image_view = UIImageView.alloc.initWithFrame CGRectMake(0, 0, 330, 120)
    image_view.url = article.image
    cell.backgroundView = image_view
    cell
  end

  def tableView(tableView, heightForRowAtIndexPath: indexPath)
    180
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    article_controller = ArticleController.new(@articles[indexPath.row])
    self.navigationController.pushViewController(article_controller, animated: true)
  end

  private

  def setup_label(label)
    label.textColor = BEIGE
    label.numberOfLines = 0
    label.sizeToFit
    label.lineBreakMode = UILineBreakModeWordWrap
  end
end
