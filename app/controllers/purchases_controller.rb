class PurchasesController < ApplicationController
  def index
    set_item
    @purchase_address = PurchaseAddress.new
  end

  def create
    set_item
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_address).permit(
      :post_number, :prefecture_id, :city,
      :house_number, :building_name, :phone_number
    ).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
