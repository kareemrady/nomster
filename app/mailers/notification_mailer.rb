class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomsterapp.com"

  def comment_added
  	mail(to: "kareem_rady@yahoo.com", subject: "A new comment added")
  end
end
