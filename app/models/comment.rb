class Comment < ActiveRecord::Base
  belongs_to :message

  #FIXME validae
  validates_presence_of :name, :comment 
	validates :name, :length => 3..100
	validates :comment, :length => 3..100

	#FIXME scope
end
