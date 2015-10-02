class TimelinesController < ApplicationController
  def index
    @status = Status.order(:created_at).page params[:page]
    @stat = current_user.status.new()
    @comment = Comment.new
    @activities = PublicActivity::Activity.order(:created_at)
  end

  def create_status
    @status = current_user.status.new(description: params[:status][:description])
    if @status.save
      redirect_to :back, notice: "Status Has Published"
    else
      redirect_to :back, notice: "Status Can't Published"
    end
  end

  def create_comment
    @status = Status.find(params[:comment][:stat_id])
    @comment = Comment.build_from( @status, current_user.id, params[:comment][:body] )
    if @comment.save
      redirect_to :back, notice: "Comment Has Published"
    else
      redirect_to :back, notice: "Comment Can't Published"
    end
  end

  def toggle_likes
    if params[:type] == "stat"
      @obj = Status.find(params[:id])
    else
      @obj = Comment.find(params[:id])
    end
    current_user.toggle_like!(@obj)
    redirect_to :back, notice: "Success"
    
  end
  
end
