class OrdersController < ApplicationController

    def index
    end

    def new
        if current_user
            @order = Order.new()
            @order.product_id = params[:product_id]
            @order.product_name = params[:product_name]
            @order.seller_id = params[:seller_id]
            @order.buyer_id = current_user.id
            @product = Product.find(params[:product_id])
        else
            redirect_to :back, notice: 'Log in before this action'
        end
        
    end
    
    def create
        @order = Order.new(order_params)
        binding.pry
        
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
    
    def edit
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
                    :seller_id, :seller_name, :price, :delivery_adress
                    )
    end
end
