class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  # before_action :authenticate_campaign!, only: [:show]
  # GET /products or /products.json
  def index
    if current_campaign
      @products = Product.all
    else
      redirect_to root_path, alert: 'You have no access to this page'
    end
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    if current_campaign
      @product = Product.new
      @categories = Category.all
      @sub_categories = SubCategory.all
      
    else
      redirect_to root_path, alert: "Log in before this action"
    end
  end

  # GET /products/1/edit
  def edit
  end

  
  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    sub_category_id = params[:product][:sub_category_id]
    # if sub_category_id.nil?
      @product.sub_category_id = sub_category_id
      
      @product.category_id = SubCategory.find(params[:product][:sub_category_id]).category_id
      
      @product.campaign_id = current_campaign.id
      respond_to do |format|
        if @product.save
          format.html { redirect_to @product, notice: "Product was successfully created." }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    # else
    #   render :new
    # end

  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(
                    :title, :description, :short_description, 
                    :price, :quantity, :campaign_id,
                    :image_url
                    )
    end
end
