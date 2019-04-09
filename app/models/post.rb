class Post < ActiveRecord::Base

  belongs_to :author

  # this is called before things go into the db; if false, it fails and things dont go
  validate :is_title_case 

  # this will force titlecase on anything before it gets validated / stored in the db
  before_validation :make_title_case

  # before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
