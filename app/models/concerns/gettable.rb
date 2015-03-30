module Gettable
  extend ActiveSupport::Concern

  def get(name, user_id)
    object = table.where('lower(name) = ?', name.downcase).find_by(user_id: user_id)
    object || table.create(name: name, user_id: user_id)
  end

  private

  def table
    self.class.const_get(name)
  end
end
