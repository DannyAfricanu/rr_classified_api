class ItemsController < ApplicationController

  def index
    render json: banned_items_filter(Item.all)
  end

  def show
    render json: banned_item_filter(Item.find(params[:id]))
  end

  def category
    render json: banned_items_filter(Item.where("category = ?", params[:category]))
  end

  def seller_status
    render json: banned_items_filter(Item.where("seller_name = ? AND status = ?", params[:seller], params[:status]))
  end

private
  def banned_items_filter(items)
    items.each do |item| 
      banned_item_filter(item)
    end
  end

  def banned_item_filter(item)
      if item.banned?
        item["seller_name"] = nil
        item["published_date"] = nil
      end
      return item
  end

end
