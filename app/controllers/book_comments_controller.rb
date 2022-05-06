class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = BookComment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    if @comment.save
      render :book_comments
    else
      @book_new = Book.new
      @comments = @book.comments
      redirect_to new_post_path
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = BookComment.find(params[:id])
    @comment.destroy
    render :book_comments
  end

  private

  def comment_params
    params.require(:book_comment).permit(:comment)
  end
end
