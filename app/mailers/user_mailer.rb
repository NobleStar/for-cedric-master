class UserMailer < ActionMailer::Base

  default from: 'notifications@example.com'

    def verify_account(account_info, user)
      @user = user
      mail(to: account_info["email"], subject: 'Verify Your Account')
    end
    
end
