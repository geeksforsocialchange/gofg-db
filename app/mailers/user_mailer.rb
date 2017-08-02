class UserMailer < ApplicationMailer
   def invitation_email(user)
     @user = user
     @url = setup_user_url(@user, token: @user.confirmation_token)
     mail(to: @user.email, subject: 'You have been invited to create an account on GOFG')
   end
end
