class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.create(comment_params)
    @comment.user = current_user
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @event, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :event_id)
  end

  # PUT /comments/1
  # PUT /comments/1.json
  end