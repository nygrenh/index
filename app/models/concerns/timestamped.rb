module Timestamped
  extend ActiveSupport::Concern

  def timestamp
    diff = Time.now.to_i - created_at.to_i
    case
    when diff >= 1.year then created_at.strftime('%B %-d %Y')
    when diff >= 1.day then created_at.strftime('%B %-d')
    when diff >= 1.hour then time_s(diff, 1.hour, 'hour')
    when diff >= 1.minute then time_s(diff, 1.minute, 'minute')
    else 'just now'
    end
  end
end
