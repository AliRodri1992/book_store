# Description/Explanation of Person class
class CatalogsController < ApplicationController
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
end