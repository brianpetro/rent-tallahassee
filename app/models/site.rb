class Site < ActiveRecord::Base
  attr_accessible :name
  has_many :subscribers
  accepts_nested_attributes_for :subscribers
  has_many :feed_entries
  has_many :classifieds
end
