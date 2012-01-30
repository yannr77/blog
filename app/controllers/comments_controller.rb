class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    unauthorized! if cannot? :create, @post
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    unauthorized! if cannot? :destroy, @post
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
