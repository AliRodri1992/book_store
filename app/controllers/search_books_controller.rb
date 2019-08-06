class SearchBooksController < ApplicationController
  def search
    unless params[:term].blank?
      @books = Book.search(params[:term])
      puts "Size: #{@books.size}"
    else
      @books = Book.all
      puts "Size: #{@books.size}"
    end
  end
end