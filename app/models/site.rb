class Site < ActiveRecord::Base
  attr_accessible :name, :hero_unit, :call_to_subscribe, :side_box_1_title, :side_box_1_text, :side_box_2_title, :side_box_2_text
  has_many :subscribers
  accepts_nested_attributes_for :subscribers
  has_many :feed_entries
  has_many :classifieds
end
