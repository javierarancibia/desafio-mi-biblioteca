class HomeController < ApplicationController
    def index
        @books = Books.published
        end
    end