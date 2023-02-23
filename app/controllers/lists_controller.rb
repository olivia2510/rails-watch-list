class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @lists = List.new
  end

  def show; end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def find_list
    @list = List.find(params[:id])
  end

end
