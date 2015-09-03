class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @client = params
    @name = @client["first_name"] + " " + @client["last_name"]
    @grand_total = session["cart"]["grand_total"]
    @address = @client["address"]
    @city = @client["city"]
    @state = @client["state"]
    @country = "US"
    @zip = @client["postal_code"]
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @grand_total = session["cart"]["grand_total"]
    @order = Order.new(order_params, @grand_total)
    @order.ip_address = request.remote_ip
    @order.grand_total(@grand_total)
    

    if @order.save
      if @order.purchase
        render :action => "success"
        puts "Purchase complete!"
      else
        render :action => "failure"
        puts "Error: #{response.message}"
      end
    else
      render :action => 'new'
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:new, :cart_id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on, :card_number, :card_verification)
    end
end
