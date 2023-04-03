class BookCommentsController < ApplicationController

def create
  @book = Book.find(params[:book_id])
  @book_comment = current_user.book_comments.new(book_comment_params)
  @book_comment.book_id = @book.id
  @book_comment.save
end

  def destroy
    book_comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    if book_comment
      book_comment.destroy
      flash.now[:alert] = '投稿を削除しました'
    else
      flash.now[:alert] = '投稿が見つかりませんでした'
    end
    @book = Book.find(params[:book_id])
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
