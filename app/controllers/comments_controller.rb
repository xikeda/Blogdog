class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @comment = current_user.comments.build
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

        def comment_params
            params.require(:comment).permit(:name, :body)
        end

        def find_comment
            @post = Post.find(params[:post_id])
        end
end
