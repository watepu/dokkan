class BooksController < ApplicationController
  before_action :ensure_correct_user, {only: %i[ edit update destroy ]}
  before_action :set_book, {only: %i[ edit update destroy ]}

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def index
    @search = Book.ransack(params[:q])
    @books = @search.result
    @title_menu = @books.where(user_id: current_user.id).pluck(:title).uniq
    @headline_menu = @books.where(user_id: current_user.id).pluck(:headline).uniq
  end

  def title
    @title = params[:title]
    @books = Book.all
    @table = @books.where(user_id: current_user.id).where(title: @title)
  end

  def headline
    @headline = params[:headline]
    @books = Book.all
    @table = @books.where(user_id: current_user.id).where(headline: @headline)
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: '編集しました'
    else
      flash[:alert] = '編集に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: '削除しました'
  end

  def confirm
    @book = current_user.books.build(book_params)
    render :new if @book.invalid?
  end

  private

  def book_params
    params.require(:book).permit(:title, :headline, :content)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path, alert: '権限がありません'
    end
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
