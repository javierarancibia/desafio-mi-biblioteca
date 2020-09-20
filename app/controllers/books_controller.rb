class BooksController < ApplicationController
    before_Action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        @books = Book.all
    end

    private
    def set_book
        @book = Book.find(params[:id])
    end

end