class AsignBooksController < ApplicationController
  before_action :set_assign_book, only: [:edit, :show, :update, :find, :destroy]
  def index
    @assign_books = AsignBook.all
  end

  def show; end

  def new
    @assign_book = AsignBook.new
  end

  def edit
  end

  def find; end

  def create
  end

  def update
  end

  def destroy
    @assign_book.destroy
    flash[:success] = "Asignación de libro eliminada correctamente."
  end

  private
  def asign_book_params
  end

  def set_assign_book
    @assign_book = AsignBook.find(params[:id])
  end
end