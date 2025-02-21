def remove_product
  product = Product.find(params[:product_id])
  authorize @cart
  @cart.remove_product(product)
  render json: @cart
end

private

def set_cart
  @cart = current_user.cart
  authorize @cart
end
end
