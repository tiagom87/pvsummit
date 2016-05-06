class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  after_create :create_application
  has_one :application, dependent: :destroy

  def create_application
  	a = Application.new(id: self.id, user_id: self.id, email: self.email)
  	a.save
  end
end
