class Classified < ActiveRecord::Base
  attr_accessible :content, :headline, :email, :user_id
  has_many :subscribers
  accepts_nested_attributes_for :subscribers
  has_many :feed_entries
  
end
