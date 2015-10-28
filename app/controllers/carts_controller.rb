class CartsController < ApplicationController
  def show
  	user = User.find(params[:user_id])
  	@carts = user.carts
  end

  def destroy
  	@cart.destroy
  	respond_to do |format|
  		format.html {redirect_to :back, notice: 'Se ha eliminado del carro'}
  		format.json {head :no_content}
  end
end

private

	def set_cart
		@cart = Cart.find(params[:id])
	end
