class Admin::CategoriesController < Admin::AdminController
    

    def new
        @category = Category.new
        @sub_category = SubCategory.new
    end

    def create
        @category = Category.new(category_params)
        
        respond_to do |format|
            if @category.save
              format.html { redirect_to new_admin_category_path, notice: "Category was successfully created." }
              format.json { render :show, status: :created, location: @category }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @category.errors, status: :unprocessable_entity }
            end
        end
    end


    private
    def category_params
      params.require(:category).permit(:name, :image_url)
    end
end
