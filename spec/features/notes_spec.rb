require 'rails_helper'
include LoginHelper

describe Note do
  it_behaves_like 'a private resource'
end
