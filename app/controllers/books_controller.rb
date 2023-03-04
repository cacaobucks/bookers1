class BooksController < ApplicationController
  def new
  # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成(2023/02/22 17:13)
  #@list = List.new
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice:'Book was successfully created.'
    #else
    #render :new
    else  
    @books = Book.all  # 投稿一覧を再取得する
    render :index  # 投稿一覧と新規投稿フォームを表示する
    end
  end

  def index
    @books = Book.all
    @book = Book.new #変更前は.new
    #@list = List.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


 # def update
 #  book = Book.find(params[:id])
 #   if
 #    book.update(book_params)
 #    redirect_to book_path(book.id), notice: "Book was successfully created."
 #    
 #   else
 #    @books = Book.all
 #    render :index
 #   end
 # end


def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to book_path, notice: "Book was successfully creatred."
  else
    render :edit
  end
end



  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to "/books"  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
