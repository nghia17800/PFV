class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validate :full_name, length: { maximum: 100 }
  validate :email, presence: true, uniqueness: true, length: { maximum: 150 }
  validate :address, length: { maximum: 200 }
  enum role: [:commom, :admin, :super_admin]
  enum job: [:student, :teacher, :programmer]
end
