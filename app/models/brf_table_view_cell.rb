class BRFTableViewCell < UITableViewCell
  attr_accessor :image_view

  BEIGE = BubbleWrap.rgb_color(249, 241, 226)

  def initWithStyle(style, reuseIdentifier: identifier)
    super.tap do
      setup_image_view
      setup_text_view

      self.backgroundColor = BEIGE
      self.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    end
  end

  def replace_label_contents(contents)
    @title_label.removeFromSuperview
    @title_label = UILabel.alloc.initWithFrame CGRectMake(0, 0, 300, 40)
    @title_label.text = contents
    setup_label(@title_label)
    @title_view.addSubview(@title_label)
  end

  private

  def setup_image_view
    @image_view = UIImageView.alloc.initWithFrame CGRectMake(0, 0, 320, 116)
    self.addSubview(@image_view)
  end

  def setup_text_view
    @title_view = UIView.alloc.initWithFrame CGRectMake(6, 121, 320, 60)
    @title_label = UILabel.alloc.initWithFrame CGRectMake(0, 0, 300, 40)
    self.addSubview(@title_view)
  end

  def setup_label(label)
    label.textColor = BubbleWrap.rgb_color(80, 80, 80)
    label.numberOfLines = 0
    label.sizeToFit
    label.lineBreakMode = UILineBreakModeWordWrap
  end
end
