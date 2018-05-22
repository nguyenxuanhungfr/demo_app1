class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @entry = current_user.entries.new
    @comment = current_user.comments.new
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: 5)
    end
  end

  def help; end

  def about; end

  def contact; end
end
