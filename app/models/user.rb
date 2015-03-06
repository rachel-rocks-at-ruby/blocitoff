class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one :list, dependent: :destroy
  has_many :todos, dependent: :destroy

	def has_list?
		list = self.list
		list != nil
	end
end
