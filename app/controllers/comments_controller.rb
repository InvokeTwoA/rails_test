class CommentsController < ApplicationController
  layout "comment"

  def new
    @message = Message.find( params[:message_id] )
    @comment = Comment.new( "message_id" => params[:message_id] )
  end
  def create
    @message = Message.find( params[:message_id] )
    #@comment = Comment.new(params[:comment] )
    #@comment.message_id = @message.id
    if @message.comments.create( params[:comment] )
    # if @comment.save
			redirect_to message_path @message.id 
    else
      render :new
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to messages_path 
  end
end
