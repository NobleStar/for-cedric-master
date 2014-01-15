class OwnerInfosController < ApplicationController
  
  before_filter :login_user
  before_filter :check_current_user
  
  def new
    @project = current_user.projects.find(params[:project_id])
    @owner_info = OwnerInfo.new()
  end
  
  def create
    @project = current_user.projects.find(params[:project_id])
    @owner_info = OwnerInfo.new(params[:owner_info])
    @owner_info.project = @project
    @owner_info.user = current_user
    if @owner_info.valid?
      @owner_info.save
      redirect_to new_project_account_verify_path @project
    else
      render :new
    end
  end
  
  def edit
    @project = current_user.projects.find(params[:project_id])
    @owner_info = @project.owner_info
    render :new
  end
  
  def update
    @owner_info = OwnerInfo.find(params[:id])
    @owner_info.update_attributes (params[:owner_info])
    redirect_to new_project_account_verify_path @owner_info.project
  end
  
  def preview
    owner_info = OwnerInfo.new(:video_url => params[:videourl])
    respond_to do |format|
      format.json {render :json => owner_info.video_url_html}
    end
  end
  
  private
  
  def check_current_user
    redirect_to "/static_pages/login" unless current_user
  end
  
  
end
