class Api::V1::ItemsController < ApiController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params), status: 201
  end

  def destroy
    render json: Item.find(params[:id]).delete, status: 204
  end

  private
    def item_params
      params.permit(:name, :description, :image_url)
    end
end
