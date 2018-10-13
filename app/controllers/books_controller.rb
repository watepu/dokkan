class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def index
    @books = Book.all
  end

  def title
    @title = params[:title]
    @books = Book.all
  end

  def headline
    @headline = params[:headline]
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "編集しました"
      redirect_to books_path
    else
      flash[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "削除しました"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :headline, :content)
  end


end
