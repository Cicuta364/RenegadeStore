class ReviewController < ApplicationController
	load_and_authorize_resource

  def create
  	@product = Product.find(params[:post_id])
  	@reviews = @product.reviews


  	@reviews = @product.reviews.build(review_params)
    @reviews.user = current_user if user_signed_in?
  	@reviews.save

  	redirect_to @product
  end

  def destroy
    @review.destroy
    redirect_to product_path(@product), notice: 'Se ha eliminado tu comentario.'
  end

  def like
    @product = Product.find(params[:post_id])
    @review = Review.find(params[:id])
    @like = @review.likes.build(user: current_user)

    if @review.liked_by? current_user
      @review.remove_like current_user
      redirect_to @product, notice: 'Ya no te gusta'
    elsif @review.save
      redirect_to @product, notice: 'Gracias por el me gusta'
    else
      redirect_to @product, notice: 'Ha ocurrido un error tu like no fue guardado'
    end
  end

	private

		def review_params
			params.require(:review).permit(:content)
		end
	end
end
