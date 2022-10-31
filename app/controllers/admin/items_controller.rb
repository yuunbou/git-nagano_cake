class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @genre = @item.genres
    @item.save
    redirect_to admin_item_path
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @genre = @item.genres
  end

  def edit
    @item = Item.find(params[:id])
    @genre = @item.genres
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item.params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end

end
