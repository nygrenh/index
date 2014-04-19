require 'spec_helper'

describe User do
  it "should have a unique name" do 
    User.create name:"admin", password:"a", password_confirmation:"a"
    user = User.create name:"admin", password:"a", password_confirmation:"a"
    expect(user).not_to be_valid
  end
end
