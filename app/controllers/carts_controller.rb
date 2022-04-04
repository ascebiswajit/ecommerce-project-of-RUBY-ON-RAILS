class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]

  def add_to_cart
    id = params[:id].to_i
    session[:product] << id unless session[:product].include?(id)
    redirect_to carts_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:product].delete(id)
    redirect_to carts_path
  end

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
    # @order_item = current_order.order_items.new
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
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
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #this  section is used to permit the data of title ,description and price data to perform actions
    def cart_params
      params.require(:cart).permit(:title,:description,:price,:avatar)
      # @cart.avatar.attach(params[])
      
    end
end
