#DBRS class PostsController < ApplicationController
class Members::PostsController < ApplicationController
  before_action :set_member
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index

    #    @members = Post.all
    @posts = @member.posts
  end

  # GET /members/1 or /members/1.json
  def show
    # @post = Post.find(session[:post_id])
    #@post = Post.find params[:id]
  end
  # GET /members/new
  def new
    #    @post = Post.new
    @post = @member.posts.build
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    #    @post = Post.new(post_params)
    @post = @member.posts.build(post_params)

    respond_to do |format|
      if @post.save
        #        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.html { redirect_to [@member, @post], notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        p "post_params"
        #        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.html { redirect_to [@member, @post], notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      #      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.html { redirect_to [@member, :posts], notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:member_id])
  end
  def set_post
    #   @post = Post.find(params[:id])
      @post = @member.posts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      #  params.require(:post).permit(:title, :member_id)
      params.require(:post).permit(:title, :contents)
    end
end
