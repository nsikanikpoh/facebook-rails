class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :check_if_author, only: [:edit, :update, :destroy]

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
       redirect_to Post.find(@comment.post_id), notice: 'Comment was successfully Posted.'
    else
       redirect_to root_url, notice: 'Comment was not Posted.'
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    if @comment.update_attributes(comment_params)
       redirect_to Post.find(@comment.post_id), notice: 'Comment was successfully updated.'
    else
       render :edit
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    redirect_to root_url, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def check_if_author
      @user = set_comment.user
      redirect_to(root_url) unless @user == current_user
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
