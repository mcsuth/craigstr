class TrackMailer < ActionMailer::Base
  default :from => "alertminow@gmail.com"

  def track_confirmation(user)
    @user = user.email
    @item = user.tracks.last
    mail(:to => @user, :subject => "ALERTMINOW - Tracked: #{@item.title.upcase}")
  end

  def in_the_future


  end
  # handle_asynchronously :in_the_future, :run_at => Proc.new { 5.minutes.from_now }
end