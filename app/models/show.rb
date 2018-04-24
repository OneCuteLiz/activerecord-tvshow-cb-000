class Show < ActiveRecord::Base

  def self.highest_rating
    self.maximum("rating")
  end

  def self.most_popular_show
    rating = self.highest_rating
    self.where("rating = ?", rating)
    self.name
  end


end
