require 'rails_helper'

describe "links/index" do
  before(:each) do
    assign(:links, [
      stub_model(Link,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :source => "Source",
        :user_id => 1,
        :domain_id => "Domain"
      ),
      stub_model(Link,
        :title => "Title",
        :url => "Url",
        :description => "MyText",
        :source => "Source",
        :user_id => 1,
        :domain_id => "Domain"
      )
    ])
  end
end
