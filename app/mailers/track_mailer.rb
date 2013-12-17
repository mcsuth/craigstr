class TrackMailer < ActionMailer::Base
  default :from => "alertminow@gmail.com"

  def track_confirmation(user)
    mail(:to => user, :subject => "Item to be Tracked")
  end
end