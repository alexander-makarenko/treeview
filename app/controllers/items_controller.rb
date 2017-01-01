class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
      redirect_to root_path, success: 'Item added'
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      redirect_to root_path, success: 'Item updated'
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy    
    flash.now[:success] = 'Item removed'

    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  private
  
    def item_params
      params.require(:item).permit(:name, :parent_id)
    end
end