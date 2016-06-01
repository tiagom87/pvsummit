class UserMailer < ApplicationMailer
	default from: "communication@portugalventures.pt"

  def application_applied(user)
    @user = user
    mail(to: @user.email, subject: 'Application sent')
  end

  def application_accepted(user)
    @user = user
    mail(to: @user.email, subject: 'Application accepted')
  end

  def application_rejected(user)
    @user = user
    mail(to: @user.email, subject: 'Application rejected')
  end

  def pv_application_accepted
    mail(to: "communication@portugalventures.pt", subject: 'New application')
  end
end
