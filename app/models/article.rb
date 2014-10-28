class Article < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates :name, presence: true
  validates :content, presence: true
end
