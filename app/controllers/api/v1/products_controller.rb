class Api::V1::ProductsController < Api::V1::BaseController
  before_action :set_product, only: [:show]

  def index
    @products = policy_scope(Product)
    render json: @products
  end

  def show
    authorize @product
    render json: @product
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
