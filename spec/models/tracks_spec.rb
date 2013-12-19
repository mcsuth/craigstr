require "spec_helper"

describe Track do
  it "should have a title" do
    track = Track.create(location: "sfbay", high_cost: "100", low_cost: "0", title: "honda", user_id: "1", url: "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=1&minAsk=0&query=honda")
    track.should respond_to(:title)
    track.title.should_not == nil
  end

  it "should have a location" do
    track = Track.create(location: "sfbay", high_cost: "100", low_cost: "0", title: "honda", user_id: "1", url: "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=1&minAsk=0&query=honda")
    track.should respond_to(:location)
    track.location.should_not == nil
  end

  it "should have a low price range" do
    track = Track.create(location: "sfbay", high_cost: "100", low_cost: "0", title: "honda", user_id: "1", url: "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=1&minAsk=0&query=honda")
    track.should respond_to(:low_cost)
    track.low_cost.should_not == nil
  end

  it "should have a high price range" do
    track = Track.create(location: "sfbay", high_cost: "100", low_cost: "0", title: "honda", user_id: "1", url: "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=1&minAsk=0&query=honda")
    track.should respond_to(:high_cost)
    track.high_cost.should_not == nil
  end

  it "should have a user assigned to it" do
    track = Track.create(location: "sfbay", high_cost: "100", low_cost: "0", title: "honda", user_id: "1", url: "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=1&minAsk=0&query=honda")
    track.should respond_to(:user_id)
    track.user_id.should_not == nil
  end

  it "should have a url generated" do
    track = Track.create(location: "sfbay", high_cost: "100", low_cost: "0", title: "honda", user_id: "1", url: "http://sfbay.craigslist.org/search/sss?sort=priceasc&catAbb=sss&maxAsk=1&minAsk=0&query=honda")
    track.should respond_to(:url)
    track.url.should_not == nil
  end
end