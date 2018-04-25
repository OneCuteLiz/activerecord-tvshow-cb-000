class Show < ActiveRecord::Base

  def self.highest_rating
    self.maximum("rating")
  end

  def self.most_popular_show
    rating = self.highest_rating
    self.find_by(rating: rating)
    # .find_by returns a model object, .where returns an
    # ActiveRecord::Relation object
    # http://comedyofexceptions.blogspot.com/2016/03/findby-vs-where.html
  end

  def self.lowest_rating
    self.minimum(:rating)
  end

  def self.least_popular_show
    rating = self.lowest_rating
    self.find_by(rating: rating)
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_shows
    self.where("rating > 5")
  end

  def self.shows_by_alphabetical_order
    self.order(:name)
  end

end
