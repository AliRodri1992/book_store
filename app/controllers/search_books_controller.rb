class SearchBooksController < ApplicationController
  def search
    unless params[:term].blank?
      @books = Book.search(params[:term]).page(params[:page]).per(10)
      puts "Size: #{@books.size}"
    else
      @books = Book.all.page(params[:page]).per(9)
      puts "Size: #{@books.size}"
    end
  end
end