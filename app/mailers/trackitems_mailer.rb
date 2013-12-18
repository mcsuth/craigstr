class TrackitemsMailer < ActionMailer::Base
  default :from => "alertminow@gmail.com"

  def trackitems_mail(user)
    @user = user.email
    @item = user.tracks.last
    @daily_parser = Nokogiri::HTML(open(@item.url)).css('.pl a')
    titles = []
    @daily_parser.each do |title|
      titles << title.text
    end
    hrefs = []
    @daily_parser.each do |href|
      if href.to_s.include?('http')
        url_end = href.attr('href')
        hrefs << url_end
      else
        newHrefs = "http://#{@item.location}.craigslist.org/#{url_end}"
        hrefs << newHrefs
      end
    end
    @hashMe = Hash[titles.zip hrefs]

    mail(:to => @user, :subject => "ALERTMINOW - Check These Items Out!")
  end

end