class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy toggle_status]
  access all: [:show, :index], user: :all, site_admin: :all
  layout "post"
  # GET /posts or /posts.json
  def index
    @posts = Post.published
    @page_title = "Posts"
  end

  # GET /posts/1 or /posts/1.json
  def show
    @page_title = @post.title
  end

  # GET /posts/new
  def new
    @post = Post.new
    3.times { @post.forwards.build }
  
  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    #@post = Post.new(params.require(:post).permit(:title, :body, users_attributes: [:user_id]))
    #@post = Post.new(params.require(:post).permit(:title, :body)
    @post = Post.new(post_params)
    respond_with Post.create(post_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @post.draft?
      @post.published!
    elsif @post.published?
      @post.draft!
    end
    redirect_to posts_url
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, forwards_attributes: [:user_id])
    end
end
