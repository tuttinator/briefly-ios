class BRFTableViewCell < UITableViewCell
  def layoutSubviews
    super
    self.textLabel.backgroundColor = BubbleWrap.rgba_color(198, 78, 57, 0.6)
    self.detailTextLabel.backgroundColor = BubbleWrap.rgba_color(198, 78, 57, 0.6)
  end
end
