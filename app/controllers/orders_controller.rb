class OrdersController < ApplicationController
    
    def index
        @orders = Order.all
    end

    def new
        if current_user
            @order = Order.new()
            return @order
        else
            redirect_to root_url, notice: 'Log in before this action'
        end
        
    end
    
    def create
        
        used_ids = []
        orders = []
        @current_cart.line_items.each do |item|
            if used_ids.include?(item.product.id)
                puts 'OK'
            else
                @order = Order.new(order_params)
                
                used_ids << item.product.campaign_id
            end
            @order.seller_id = item.product.campaign_id
            @order.buyer_id = current_user.id
            @order.line_items << item
            item.cart_id = nil
            orders << @order
        end
        
        orders.each do |order|
            order.save
        end
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to root_path

        # respond_to do |format|
        #     if @order.save
                
        #         format.html { redirect_to @order, notice: "Order was successfully created." }
        #         format.json { render :show, status: :created, location: @order }
        #     else
        #         format.html { render :new, status: :unprocessable_entity }
        #         format.json { render json: @order.errors, status: :unprocessable_entity }
        #     end
        # end
    end
    
    def show
        set_order
    end

    def cansel
    end
    
    
    def update
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(
                    :buyer_id,
                    :adress, 
                    :status
                    )
    end
end
