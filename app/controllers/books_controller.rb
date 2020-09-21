class BooksController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true)
    end

    def new
        @book = Book.new 
    end

    def show

    end
    
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to books_path, notice: '¡El libro fue creado con exito!'
        else
            flash.now[:alert] = 'Lamentablemente el libro no pudo ser creado'
            render :new
        end
    end

    def edit; end

    def update
        if @book.update(book_params)
            redirect_to books_path, notice: 'El libro fue actualizado con exito'
        else
            flash.now[:alert] = 'El libro no puede ser actualizado'
            render :edit
        end
    end

    def destroy
        @book.destroy
            redirect_to books_url, notice: 'El libro fue borrado con exito'
    end

    private
    def set_post
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :description, :author, :status, :date_out, :date_back)
    end

end