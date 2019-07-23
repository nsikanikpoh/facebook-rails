class LikesController < ApplicationController

  # POST /likes
  # POST /likes.json
  def create
    @like = current_user.likes.build(like_params)
    if @like.save
       redirect_to root_url, notice: 'You liked this post!'
    else
       redirect_to root_url, notice: 'Like did not work'
    end
  end



  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_url, notice: 'Like was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:post_id)
    end
end
