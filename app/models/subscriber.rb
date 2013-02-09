class Subscriber < ActiveRecord::Base
  attr_accessible :email, :site_id
  validates_format_of :email, with: /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_uniqueness_of :email
end
