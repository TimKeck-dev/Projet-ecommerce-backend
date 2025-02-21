class Api::V1::ProductsController < Api::V1::BaseController
  def index
    @products = policy_scope(Product)
    render :index, formats: :json
  end

  def show
    @product = Product.find(params[:id])
    render :show, formats: :json
  end
end
