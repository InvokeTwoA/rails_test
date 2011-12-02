class MessagesController < ApplicationController

  USERNAME = "poke"
  PASSWORD = "mon"

  before_filter :get_login_name
  skip_before_filter :get_login_name, :only => [:test, :new]
  before_filter :basic_pokemon, :only => [:test]
  helper_method :hello_buhibuhi

	def index
		@messages = Message.all
	end
	def recent 
		@messages = Message.recent 
		render :index
	end
	def old 
		@messages = Message.old 
		render :index
	end
	def hot 
		@messages = Message.hot
    render :index
	end
	def new 
		@message = Message.new
	end
	def create 
		@message = Message.new params[:message] 
		if @message.save
	    redirect_to messages_path , :notice => 'msg comp' 
		else
			render :new
		end
	end
	def show
		@message = Message.find_by_id( params[:id] ) 
    unless @message then
      render :notfound
    end
	end
	def edit 
		@message = Message.find( params[:id] ) 
	end
	def update 
		@message = Message.find( params[:id] ) 
		@message.attributes = params[:messages]
		@message.save
		redirect_to messages_path , :notice => 'update comp' 
	end
	def destroy 
    begin
		  @message = Message.find( params[:id] ) 
		  @message.destroy
		  redirect_to messages_path, :notice => 'delete comp'
    rescue => ex
      render :notfound
    end
	end
	def search
	end
  def basic_pokemon 
    authenticate_or_request_with_http_basic do |name,password|
      (@name = name) == USERNAME && password == PASSWORD
    end
  end
  private
  def hello_buhibuhi
    Message.find(3)
  end
  private
  def get_login_name
    @login_name = "nito"
  end
	def test 
    @message = Message.find(3)
    #render :xml => @messages
    #render :text => "error 発生", :statis => :internal_server_error
    #render :text => "hello pikachu"
    render :template => "comments/test"
	end
end
