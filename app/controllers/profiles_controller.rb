class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @posts = @profile.user.posts.paginate(page: params[:page], per_page: 5)
    @comment = Comment.new
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    if @profile.update_attributes(profile_params)
       redirect_to @profile, notice: "Your profile has been updated"
    else
      render :edit
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile ||= Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:birthday, :gender, :location, :bio, :avatar, :cover)
    end
end
