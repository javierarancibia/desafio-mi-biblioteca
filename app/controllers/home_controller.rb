class HomeController < ApplicationController
    def index
        @books = Book.out
        end
    end