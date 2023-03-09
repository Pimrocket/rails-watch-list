class ListsController < ApplicationController
  before_action :set_list, only: [:destroy, :show]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end
  def create
    @list = List.new(list_params)
    if @list.save
      # redirect_to lists_path # If you want to go back to the lists overview page
      redirect_to list_path(@list) # If you want to go to the created list directly
    else
      render new_list_path, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  def show
    # raise
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
