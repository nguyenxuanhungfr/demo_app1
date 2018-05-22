class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find params[:user_id]
    if (current_user?(user)) || (current_user.following? user)
      entry = Entry.find params[:entry_id]
      @comment = entry.comments.new(params.require(:comment).permit(:content))
      @comment.user = current_user
      if @comment.save
        respond_to do |format|
          format.html{redirect_to request.referrer}
          format.js
        end
      end
    else
      flash[:warning] = t "follow"
      redirect_to request.referrer
    end
  end
end
