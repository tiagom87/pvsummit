class UserMailer < ApplicationMailer
	default from: "communication@portugalventures.pt"

  def application_applied(application)
    mail(to: application.email, subject: 'Application sent')
  end

  def application_accepted(application)
    mail(to: application.email, subject: 'Application accepted')
  end

  def application_rejected(application)
    mail(to: application.email, subject: 'Application rejected')
  end

  def pv_application_accepted
    mail(to: "communication@portugalventures.pt", subject: 'New application')
  end
end
