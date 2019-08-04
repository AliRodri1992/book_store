# Description/Explanation of Person class
class CatalogsController < ApplicationController
  include WordsHelper
  def index
    @class_name = params[:class_name]
    object = Kernel.const_get(@class_name)
    @objects = if @class_name == "Store"
                 object.order(:codename)
               else
                 object.order(:title)
               end
    @columns = object.get_index_columns
  end

  def new
    @class_name = params[:class_name]
    @render = @class_name.underscore.pluralize.downcase + "/form"
    @object = Kernel.const_get(@class_name).new
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

  private
  def catalog_params
    class_name = params[:class_name]
    object = Kernel.const_get(class_name)
    columns = object.column_names
    exclude_columns  = %w[id created_at update_at]
    columns -= exclude_columns
    params.require(class_name.downcase).permit(columns)
  end
end