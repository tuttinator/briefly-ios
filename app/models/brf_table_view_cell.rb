class BRFTableViewCell < UITableViewCell
  RED = BubbleWrap.rgb_color(198, 78, 57)

  def layoutSubviews
    super
    self.textLabel.backgroundColor = RED
    self.detailTextLabel.backgroundColor = RED
  end
end
