class HomeController < ApplicationController
    def index
        @products = Product.all
        @categories = Category.all
        @sub_categories = SubCategory.all
    end
end
