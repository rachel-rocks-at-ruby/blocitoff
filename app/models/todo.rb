class Todo < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  def time_left
    days_ago_created = ((Time.now - self.created_at)/84600).round
    time_left = 7 - days_ago_created
  end
end
