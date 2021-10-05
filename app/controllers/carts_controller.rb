class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart


  # GET /carts/1 or /carts/1.json
  def show
    if @cart.id == session[:cart_id]
      return @cart
    else
      invalid_cart
    end
  end


  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html do
          redirect_to @cart, notice: 'Cart was successfully created.'
        end
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html do
          redirect_to @cart, notice: 'Cart was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html do
        redirect_to store_index_url, notice: 'Your cart is currently empty'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error "Attempt to acess invalid cart #{params[:id]}"
    redirect_to store_index_url, notice: 'Invalid Cart'
  end
end
