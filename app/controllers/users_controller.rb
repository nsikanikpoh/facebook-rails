class UsersController < ApplicationController

  def index
    @users = User.where('id != ?' , current_user.id)
  end

  def search
  if params[:search].blank?
    redirect_to(root_path, alert: "Empty field!") and return
  else
    @users = User.search(params[:search].downcase)
    @search = params[:search]
  end
end

end
