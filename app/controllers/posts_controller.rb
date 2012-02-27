class PostsController < ApplicationController
  def new
    @post = Post.new
    
    respond_to do |format|
      format.html
      format.json{ render json:@post }
    end
  end
  
  def create
    @post = Post.new(params[:post])
    
    respond_to do |format|
      if @post.save
        format.html{ redirect_to @post }
        format.json{ render json: @post, status: :created, location: @post }
      else
        format.html{ render action: "new"}
        format.json{ render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @post = Post.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json{ render json: @post}
    end
  end
  
  def index
    @post = Post.all
    respond_to do |format|
      format.html
      format.json{ render json: @post}
    end
  end
  
end
