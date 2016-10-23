class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

  validate :title_is_clickbait?, unless: "title.nil?"

  def title_is_clickbait?
    unless title.include?("Won't Believe" || "Secret" || "Top 10" || "Guess")
      errors.add(:title, "is not click-bait.")
    end
  end

end
