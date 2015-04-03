module Timestamped
  extend ActiveSupport::Concern
  include ActionView::Helpers::TextHelper

  def timestamp
    diff = Time.now.to_i - created_at.to_i
    case diff
    when under(1.minute) then 'just now'
    when under(1.hour) then minutes_ago(diff)
    when under(1.day) then hours_ago(diff)
    when under(1.year) then date_and_month
    else full_date
    end
  end

  private

  def under(time)
    Range.new(0, time - 1.second)
  end

  def date_and_month
    created_at.strftime('%B %-d')
  end

  def full_date
    created_at.strftime('%B %-d %Y')
  end

  def minutes_ago(diff)
    time_s(diff, 1.minute, 'minute')
  end

  def hours_ago(diff)
    time_s(diff, 1.hour, 'hour')
  end

  def time_s(diff, divisor, word)
    pluralize(diff / divisor, word) + ' ago'
  end
end
