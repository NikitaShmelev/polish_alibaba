class SubCategoriesController < ApplicationController
    def show
        
        @sub_category = SubCategory.find(params[:id])
        @products = []
        Product.all.each do |product|

        if product.sub_category_id == params[:id].to_i
          @products.append(product)
        end
      end
    end

    def new
        @sub_category = SubCategory.new()
        # binding.pry
    end

    def create
        @sub_category = SubCategory.new(sub_category_params)
        respond_to do |format|
            if @sub_category.save
              format.html { redirect_to @sub_category, notice: "Category was successfully created." }
              format.json { render :show, status: :created, location: @sub_category }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @sub_category.errors, status: :unprocessable_entity }
            end
        end
    end


    private
    def sub_category_params
      params.require(:sub_category).permit(:name, :category_id)
    end
end
