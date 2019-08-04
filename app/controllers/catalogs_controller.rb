# Description/Explanation of Person class
class CatalogsController < ApplicationController
  before_action :set_catalog, only: [:edit, :show, :update, :destroy, :find]

  include WordsHelper
  def index
    @class_name = params[:class_name]
    object = Kernel.const_get(@class_name)
    @objects = if @class_name == "Store"
                 object.order(:codename).page(params[:page])
               else
                 object.order(:title).page(params[:page])
               end
    @columns = object.get_index_columns
  end

  def show
    @render = @class_name.underscore.pluralize.downcase + "/show"
  end

  def new
    @class_name = params[:class_name]
    @render = @class_name.underscore.pluralize.downcase + "/form"
    @object = Kernel.const_get(@class_name).new
  end

  def edit
    @render = @class_name.underscore.pluralize.downcase + "/form"
  end

  def find
    @object = Kernel.const_get(@class_name).find(params[:id])
  end

  def create
    @class_name = params[:class_name]
    @render = @class_name.pluralize.downcase + "/form"
    @object = Kernel.const_get(@class_name).new(catalog_params)
    @create = false
    translate_word = t("activerecord.model." + @class_name.downcase + ".one")
    if @object.save
      @create = true
      flash[:success] = "#{translate_word} #{change_word('create', translate_word)} exitosamente."
    end
  end

  def update
    @render = @class_name.underscore.pluralize.downcase + "/form"
    @create = false
    translate_word = t("activerecord.model." + @class_name.downcase + ".one")
    if @object.update(catalog_params)
      @create = true
      flash[:success] = "#{translate_word} #{change_word('update', translate_word)} correctamente."
    end
  end

  def destroy
    @object.destroy
    translate_word = t("activerecord.model." + @class_name.downcase + ".one")
    flash[:success] = "#{translate_word} #{change_word('destroy', translate_word)} correctamente."
  end

  private
  def catalog_params
    class_name = params[:class_name]
    object = Kernel.const_get(class_name)
    columns = object.column_names
    exclude_columns  = %w[id created_at update_at]
    columns -= exclude_columns
    params.require(class_name.downcase).permit(columns)
  end

  def set_catalog
    @class_name = params[:class_name]
    @object = Kernel.const_get(@class_name).find(params[:id])
  end
end