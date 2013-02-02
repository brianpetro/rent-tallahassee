class Classified < ActiveRecord::Base
  attr_accessible :content, :headline, :email, :user_id

  
  def to_param
  	"#{id}-#{headline}".parameterize
  end
end
