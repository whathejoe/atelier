class OrdersController < ApplicationController

  def new
    @grand_total = session["cart"]["grand_total"]

    if !params["token"].blank?
      @order = Order.new(:express_token => params["token"] )
    else
      @order = Order.new()
      @client = params
      @name = "#{@client["first_name"]} #{@client["last_name"]}"
      @address = @client["address"]
      @city = @client["city"]
      @state = @client["state"]
      @country = "US"
      @zip = @client["postal_code"]
    end
  end

  def express
    @price = (session["cart"]["grand_total"]*100)
    response = EXPRESS_GATEWAY.setup_purchase( @price,
      :ip                => request.remote_ip,
      :return_url        => payment_url,
      :cancel_return_url => cart_url
    )
    puts @price
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    #Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:new, 
        :cart_id, 
        :ip_address, 
        :first_name, 
        :last_name, 
        :card_type, 
        :card_expires_on, 
        :card_number, 
        :card_verification, 
        :express_token, 
        :express_payer_id,
        )
    end
end
