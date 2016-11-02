class Api::V1::ItemsController < ApiController
  def index
    render json: Item.all
  end

  def show
    render json:
  end
end
