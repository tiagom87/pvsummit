class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /applications/1
  # GET /applications/1.json
  def index
    if current_user.admin == true
      @users = User.order("created_at DESC")
    else
      redirect_to root_path
    end
  end
end
