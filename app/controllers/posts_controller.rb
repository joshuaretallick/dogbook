# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.all
    @comment = @post.comments.build
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    if @post.user != current_user
      redirect_to @post, alert: 'You can only edit your own barks'
    elsif exceed_time_limit
      redirect_to @post, alert: 'Edit time limit exceeded!'
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Your bark was heard all around the Park!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Bark was pawfectly pupdated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.user != current_user
      redirect_to @post, alert: 'You can only chew your own posts'
    else
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Bark was chewed. Gone but not furgotten' }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:description, :picture)
  end

  def exceed_time_limit
    a = Time.now.to_s
    current_time = Time.parse(a)
    b = @post.created_at.to_s
    post_time = Time.parse(b)
    current_time - post_time > 600
  end
end
