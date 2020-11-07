class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.comments.new(comment_params)
    @comment.book_id = @book.id
    if @comment.save
      flash[:success] = "Comment was successfully created."
    end
    redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = current_user.comments.find_by(id: params[:id], book_id: @book.id)
    comment.destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
