class Classified < ActiveRecord::Base
  attr_accessible :content, :headline, :email
  has_many :subscribers
  accepts_nested_attributes_for :subscribers
  
end
