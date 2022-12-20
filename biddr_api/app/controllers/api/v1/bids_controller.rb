class Api::V1::BidsController < ApplicationController

    before_action :find_bid, only: [:destroy]
    before_action :authenticate_user!

    def create
      @bid = Bid.new bid_params
      @item = Item.find_by_id(params[:item_id])
      @bid.user = current_user
      @bid.save!
      render json: { id: @bid.id }
    end

    def destroy
      @bid.destroy
      render(json: { status: 200 }, status: 200)
    end

    private

    def find_bid
      @bid ||= Bid.find params[:id]
    end

    def bid_params
      p params
      params.permit(:amount, :item_id)
    end




end
