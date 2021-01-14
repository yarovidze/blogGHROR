class LikesController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @user = current_author.id
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @comment.likes.create!(author: current_author, vote_value: 1)
      render 'likes'
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @user = current_author.id
    if already_liked?
      flash[:notice] = "You can't dislike more than once"
    else
      @comment.likes.create!(author: current_author, vote_value: -1)
      render 'likes'
    end
    redirect_to post_path(@post)
  end

  def already_liked?
    Like.where(author_id: current_author.id, comment_id:
        @comment.id).exists?
  end

  private

  def find_like
    @like = @comment.likes.find(params[:id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
