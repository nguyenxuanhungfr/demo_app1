class EntriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @entry = current_user.entries.new(params.require(:entry).permit(:title, :content))
    if @entry.save
      flash.now[:success] = t "create_entry"
      redirect_to root_url
    else
      render "static_pages/home"
    end
  end
end
