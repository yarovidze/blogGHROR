class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :update, :destroy, :edit, :new]

  def index
    @comment = Comment.new
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end


  def new
    @comment = @post.comments.build
  end

  def update
    @comment = @post.comments.find(params[:id])
    @comment.update(comments_params)
    @comment.edited_at = Time.now
    redirect_to @post, notice: "Comment was updated!"
  end

  def create
    @comment = @post.comments.build(comments_params)
    @comment.author_id = current_author.id
    if @comment.save
      render template: ('comments/post_comment')
    else
      parent_id = @comment.parent ? @comment.parent: nil
      redirect_to @post, flash: { comment_error: @comment.errors.full_messages.join(". "), comment_id: parent_id}
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    render 'destroy'
  end

  def publish
    @comment.update(comments_params)
    redirect_to @post, notice: "Comment was published!."
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comments_params
    params.require(:comment).permit(:author_id, :body, :parent_id)
  end
end