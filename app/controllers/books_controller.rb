class BooksController < ApplicationController


  def index

    @lists = Book.all
    @list = Book.new
  end

	def create
        # ストロングパラメーターを使用
	     @list = Book.new(list_params)
	    # DBへ保存する
	     if @list.save
            flash[:notice] ="successfully"
	   		redirect_to book_path(@list.id) # 詳細画面へリダイレクト
		else
            flash[:notice] ="can't be blank"
			@lists = Book.all
			render "index"
		end
    end

     def show
      @list = Book.find(params[:id])
      end
    def edit
        @list =  Book.find(params[:id])
    end
    def update
        list =  Book.find(params[:id])
        list.update(list_params)
        flash[:notice] ="successfully"
        redirect_to book_path(list.id)

    end
    def destroy
        list =  Book.find(params[:id]) #データ(レコード)を1件取得
        list.destroy #データ（レコード）を削除
        redirect_to books_path #List一覧画面へリダイレクト
    end

    private
    def list_params
        params.require(:book).permit(:title, :body)
    end

end




