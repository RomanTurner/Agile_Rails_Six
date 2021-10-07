class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[create destroy edit index]
  before_action :set_line_item, only: %i[show edit update destroy]

  # GET /line_items or /line_items.json
  def index
    redirect_to cart_url(@cart)
  end

  # GET /line_items/1 or /line_items/1.json
  def show
    id = @line_item.product_id
    redirect_to product_path(id)
  end

  # GET /line_items/1/edit
  def edit
    @line_item.quantity -= 1
    @line_item.save
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Item sucessfully removed' }
      format.js { @current_item = @line_item }
      format.json { render :show, status: :created, location: @line_item }
    end
  end

  # POST /line_items or /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        session[:counter] = 0
        format.html { redirect_to root_url }
        format.js { @current_item = @line_item }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json do
          render json: @line_item.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html do
          redirect_to @line_item, notice: 'Line item was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @line_item.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.js 
      format.html { redirect_to root_path, notice: 'Item removed from cart' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def line_item_params
    params.require(:line_item).permit(:product_id, :price)
  end
end
