class List < ActiveRecord::Base
  has_many :todos
  belongs_to :user

  scope :visible_to, -> (user) { user ? all : where(public: true) }
end
