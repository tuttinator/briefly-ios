class ListViewController < UITableViewController
  attr_reader :articles

  def viewDidLoad
    super
    @articles = []
    view.backgroundColor = UIColor.grayColor
    AFMotion::JSON.get('http://api.briefly.co.nz/v1/articles.json') do |result|
      @articles = Article.load_from_json(result.object)
      self.tableView.reloadData
    end
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @articles.count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell_id = 'cell'
    cell = tableView.dequeueReusableCellWithIdentifier cell_id
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle UITableViewCellStyleDefault, reuseIdentifier:cell_id
    end

    article = @articles[indexPath.row]
    cell.textLabel.text = article.title
    cell
  end
end
