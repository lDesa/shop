class Admin::ItemsController < Admin::BaseController

	private 
    def item_params
      params.require(:item).permit(:name, :description, :price,
                                   :image, :user_id, :shop_id, :category_id )
    end
end

