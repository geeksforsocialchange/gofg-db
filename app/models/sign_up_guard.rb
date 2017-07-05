class SignUpGuard < Clearance::SignInGuard

  def call
   if incomplete?
     failure("Please check your email to complete the sign up process")
   else
     next_guard
   end
  end

  def incomplete?
    signed_in? && !current_user.accepted_at
  end
end
