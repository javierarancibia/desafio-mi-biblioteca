class BooksController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @books = Book.all
    end

    def new
        @book = Book.new 
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path, notice: '¡El libro fue creado con exito!'
        else
            flash.now[:alert] = 'Lamentablemente el libro no pudo ser creado'
            render :new
        end
    end

    private
    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :description, :author, :status, :date_out, :date_back)
    end

end