class AsignBooksController < ApplicationController
  before_action :set_assign_book, only: [:edit, :show, :update, :find, :destroy]
  def index
    @assign_books = AsignBook.all
  end

  def show; end

  def new
    @assign_book = AsignBook.new
    @books = Book.order(:title)
    @stores = Store.order(:codename)
  end

  def edit
    @books = Book.order(:title)
    @stores = Store.order(:codename)
  end

  def find; end

  def create
    @assign_book = AsignBook.new(asign_book_params)
    @create = false
    @books = Book.order(:title)
    @stores = Store.order(:codename)
    if @assign_book.save
      @create = true
      flash[:success] = "Asignación de libro creada correctamente."
    end
  end

  def update
    @create = false
    @books = Book.order(:title)
    @stores = Store.order(:codename)
    if @assign_book.update(asign_book_params)
      @create = true
      flash[:success] = "Asignación de libro actualizada correctamente."
    end
  end

  def destroy
    @assign_book.destroy
    flash[:success] = "Asignación de libro eliminada correctamente."
  end

  private
  def asign_book_params
    params.require(:asign_book).permit(:book_id, :store_id, :quantity)
  end

  def set_assign_book
    @assign_book = AsignBook.find(params[:id])
  end
end