class AccountsController < ApplicationController

  before_filter :login_user
  before_filter :check_current_user

  def new
    @project = current_user.projects.find(params[:project_id])
    @account_verify = AccountVerify.new()
  end

  def create
    @project = current_user.projects.find(params[:project_id])
    @account_verify = AccountVerify.new(params[:account_verify])
    if @account_verify.valid?
      random_token = SecureRandom.urlsafe_base64(nil, false)
      current_user.update_attribute('account_token', random_token)
      UserMailer.verify_account(params, current_user).deliver
      redirect_to checklist_project_path @project.id
    else
      render :new
    end
  end
  
  def verification
    user = User.where(:account_token => params[:token]).first
    if user
      user.update_attribute(:identity_verified, true)
      flash[:message] = "Account verified"
    else
      flash[:error] = "Invalid url"
    end
    redirect_to root_url
  end


  private

  def check_current_user
    redirect_to "/static_pages/login" unless current_user
  end


end
