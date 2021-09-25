class OrdersController < ApplicationController

    def index
        @orders = Order.all
    end

    def new
        if current_user
            @order = Order.new()
            @order.product_id = params[:product_id]
            @order.product_name = params[:product_name]
            @order.seller_id = params[:seller_id]
            @order.buyer_id = current_user.id
            @product = Product.find(params[:product_id])
            @order.price = @product.price
            @order.seller_name = Campaign.all.find(params[:seller_id]).campaign_name
        else
            redirect_to root_url, notice: 'Log in before this action'
        end
        
    end
    
    def create
        @order = Order.new(order_params)
        # @order.status = 'Pending'
        
        respond_to do |format|
        if @order.save
            format.html { redirect_to @order, notice: "Order was successfully created." }
            format.json { render :show, status: :created, location: @order }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @order.errors, status: :unprocessable_entity }
        end
        end
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
                    :product_name, :product_id, :buyer_id,
                    :seller_id, :seller_name, :price, :delivery_adress, 
                    :status
                    )
    end
end
