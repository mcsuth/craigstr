require "spec_helper"

describe User do
  it "should have a id" do
    user = User.create(email: 'd@demo.com', password: "demodemo")
    user.should respond_to(:id)
    user.id.should_not == nil
  end

  it "should have an email" do
    user = User.create(email: 'd@demo.com', password: "demodemo")
    user.should respond_to(:email)
    user.email.should_not == nil
  end

  it "should have a password" do
    user = User.create(email: 'd@demo.com', password: "demodemo")
    user.should respond_to(:password)
    user.password.should_not == nil
  end

  it "should have a password confirm" do
    user = User.create(email: 'd@demo.com', password: "demodemo", password_confirmation: "demodemo")
    user.should respond_to(:password_confirmation)
    user.password_confirmation.should_not == nil
  end

  it "should have a password with minimum of 8 characters" do
    user = User.create(email: 'd@demo.com', password: "demo")
    user.should respond_to(:password)
    user.password_confirmation.should == nil
  end

  it "should have a password with minimum of 8 characters" do
    user = User.create(email: 'd@demo.com', password: "demodemo")
    user.should respond_to(:password)
    user.password.should_not == nil
  end
end