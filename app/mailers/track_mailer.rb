class TrackMailer < ActionMailer::Base
  default :from => "alertminow@gmail.com"

  def track_confirmation(user)
    @user = user.email
    @item = user.tracks.where(user_id: user.id)
    mail(:to => @user, :subject => "ALERTMINOW - Tracked: #{}")
  end

  def in_the_future


  end
  # handle_asynchronously :in_the_future, :run_at => Proc.new { 5.minutes.from_now }
end