class ProjectsController < ApplicationController
  
  before_filter :login_user
  before_filter :check_current_user
  
  def new
    @project = Project.new
    @project.donation_rewards << DonationReward.new(:amount => "$1")
    @project.donation_rewards << DonationReward.new(:amount => "$2")
    @project.donation_rewards << DonationReward.new(:amount => "$5")
    @project.donation_rewards << DonationReward.new(:amount => "$20")
    @project.donation_rewards << DonationReward.new(:amount => "$50")
  end
  
  def create
    @project = Project.new(params[:project])
    @project.user = current_user    
    if @project.valid?
      @project.private_code = Array.new(16){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join if ['United States - Private', 'United Kingdom - Private'].include?(session[:project_country])
      session[:project_country] = nil
      @project.save
      redirect_to new_project_owner_info_path @project
    else
      render :new
    end
  end
  
  def edit
    @project = Project.find(params[:id])
    render :new
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    if @project.owner_info.nil? 
      redirect_to new_project_owner_info_path @project
    else
      redirect_to edit_project_owner_info_path @project
    end
  end
  
  def account_verify
    random_token = SecureRandom.urlsafe_base64(nil, false)
    current_user.update_attribute('account_token', random_token)
    #UserMailer.verify_account(params, current_user).deliver
    redirect_to project_checklist_path
  end
  
  def save_country
    session[:project_country] = params["project_country"]
    redirect_to static_pages_getting_started_path
  end
  
  def checklist
    @project = current_user.projects.find(params[:id])
  end
  
  def start_preview
    @project = current_user.projects.find(params[:id])
    @project.update_attribute(:is_submitted, true)
    @owner_info = @project.owner_info
    @rewards = @project.donation_rewards
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:message] = "Project get deleted successfully"
    redirect_to root_path
  end
  
  def getting_started
    @project = current_user.projects.find(params[:id])
    render 'static_pages/getting_started'
  end
    
  private
  
  def check_current_user
    redirect_to "/static_pages/login" unless current_user
  end
  
end
