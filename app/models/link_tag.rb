class LinkTag < ActiveRecord::Base
  belongs_to :link
  belongs_to :tag, counter_cache: :links_count
end
