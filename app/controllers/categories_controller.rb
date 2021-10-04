class CategoriesController < ApplicationController
    before_action :set_category, only: [:show]
    def show
    
      @products = []
      Product.all.each do |product|

        if product.category_id == params[:id].to_i
          @products.append(product)
        end
      end
      

    end



    private
    def set_category
      @category = Category.find(params[:id])
    end
end
