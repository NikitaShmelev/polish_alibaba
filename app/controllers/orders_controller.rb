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
        
        used_campaigns_ids = []
        orders = []
        @current_cart.line_items.each do |item|
            if used_campaigns_ids.include?(item.product.campaign_id)
                orders.each do |order|
                    if order.seller_id == item.product.campaign_id and order.buyer_id == current_user.id
                        binding.pry
                        item.update(order_id: order.id)
                        order.line_items << item
                        break
                    end
                end
            else
                @order = Order.new(order_params)
                used_campaigns_ids << item.product.campaign_id
                @order.seller_id = item.product.campaign_id
                # @order.product_id = item.product.id
                # @order.quantity = item.quantity
                @order.buyer_id = current_user.id
                @order.line_items << item
                
                @order.status = 'Pending'
                @order.save
                orders << @order
                # binding.pry
            end
            
            # binding.pry
            item.cart_id = nil
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
        @order = set_order
        if current_user
            if @order.buyer_id == current_user.id
                return @order
            else
                redirect_to root_path, notice: 'You have no access to this page'
            end
            
        elsif current_campaign
            if current_campaign.id == @order.seller_id
                return @order
            else
                redirect_to root_path, notice: 'You have no access to this page'
            end
        end
    end

    def cancel
        @order = set_order
        @order.update(status: 'Cancelled')
        redirect_to @order
    end
    
    def change_payment
        if current_campaign
            @order = set_order
            if current_campaign.id == @order.seller_id
                @order.update(paid: params[:paid].to_i)
                redirect_to @order
            else
                redirect_to root_path, notice: 'You have no access to this page'
            end
        end
    end


    def change_status
        if current_campaign
            @order = set_order
            if current_campaign.id == @order.seller_id
                @order.update(status: params[:status])
                redirect_to @order
            else
                redirect_to root_path, notice: 'You have no access to this page'
            end
        end
        
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
                    )
    end
end
