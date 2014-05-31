class Article
  attr_accessor :stored_id, :title, :summary, :link, :image

  def initialize(options = {})
    options.each_pair do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.load_from_json(response)
    response.map do |json|
      new(stored_id: json['id'], title: json['title'], summary: json['summary'], link: json['link'], image: json['image'])
    end
  end
end
