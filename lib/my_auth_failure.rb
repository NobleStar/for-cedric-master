class MyAuthFailure < Devise::FailureApp

  # add different cases here for diff scopes.
  def redirect_url 

    static_pages_login_path 

#    if warden_options[:scope] == :user 
#      static_pages_login_path 
#    elsif warden_options[:scope] == :admin 
 #     admin_root_path 
#    end 
  end 

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end  
end