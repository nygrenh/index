require 'rails_helper'
include LoginHelper

describe Tag do
  it_behaves_like 'a private resource'
end
