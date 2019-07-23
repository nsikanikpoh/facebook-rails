class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_if_author, only: [:edit, :update, :destroy]
  before_action :new_post, only: [:new, :index]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.friends_posts(current_user).paginate(page: params[:page], per_page: 5)
    new_comment
  end
  def privacy
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
    new_comment
  end
  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url, notice: 'Post was successfully created.'
    else
      redirect_to root_url, notice: 'Failure creating post.'
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to root_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def new_comment
      @comment = Comment.new
    end

    def new_post
      @post = Post.new
    end

    def check_if_author
      @user = set_post.user
      redirect_to(root_url) unless @user == current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :image)
    end
end
