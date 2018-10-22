class BooksController < ApplicationController
  before_action :ensure_correct_user, {only: %i[ edit update destroy ]}
  before_action :set_book, {only: %i[ edit update destroy ]}

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
    @search = Book.ransack(params[:q])
    @books = @search.result
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
  end

  def update
    if @book.update(book_params)
      flash[:notice] = '編集しました'
      redirect_to books_path
    else
      flash[:danger] = '編集に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = '削除しました'
    redirect_to books_path
  end

  def confirm
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    render :new if @book.invalid?
  end

  private

  def book_params
    params.require(:book).permit(:title, :headline, :content)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      flash[:danger] = "権限がありません"
      redirect_to books_path
    end
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
