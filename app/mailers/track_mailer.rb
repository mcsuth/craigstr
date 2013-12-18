class TrackMailer < ActionMailer::Base
  default :from => "alertminow@gmail.com"

  def track_confirmation(user)
    @user = user.email
    @item = user.tracks.last
    mail(:to => @user, :subject => "ALERTMINOW - Tracked: #{@item.title.upcase}")
  end
end