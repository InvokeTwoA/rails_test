class Message < ActiveRecord::Base
  has_many :comments
  
  validates_presence_of :name, :comment 

	validates :name, :length => 3..100
	validates :comment, :length => 3..100

	#scope
	scope :recent, order( "id DESC" )
	scope :old,    order( "id" )
	scope :detail_list,  order( "id" )
	scope :hot,  order( "id" )

  def test
   redirect_to new_messages_path 
  end

end
