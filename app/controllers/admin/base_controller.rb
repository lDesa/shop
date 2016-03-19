class Admin::BaseController < ApplicationController
   
  include BaseControllerHelper

  layout 'admin'


  # before_action :signed_in_user
  # before_action :admin_user
  before_action :set_resource, only: [ :show, :edit, :update, :destroy]


  def index
  	plural_resource_name = "@#{resource_name.pluralize}"
    resources = resource_class.all
    instance_variable_set(plural_resource_name, resources)
  end

  def new
  	set_resource(resource_class.new)
  	get_resource
  end

  def create
    set_resource(resource_class.new(resource_params))

    if get_resource.save
      flash[:success] = "#{resource_name_capi} is created!"
      redirect_to send(admin_resourse_path)
    else
      flash.now[:danger] = "#{resource_name_capi} isn't create!" 
      render 'new'
    end

  end


  def update

       
    if get_resource.update_attributes(resource_params)
    	flash[:success] = "#{resource_name_capi} is success edit!"
      redirect_to send(admin_resourse_path)
    else
      flash.now[:danger] = "#{resource_name_capi} isn't edit!"
      render 'edit'
    end



  end

  def destroy
    get_resource.destroy
    flash[:success] = "#{resource_name_capi} is deleted!"
    redirect_to send(admin_resourse_path)
  end
  
  private 
    # return String
    def resource_name_capi
    	 resource_name.capitalize
    end
      
    # return String
    def admin_resourse_path
    	'admin_' + resource_name.pluralize + '_path'
    end

end



