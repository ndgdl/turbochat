class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :all_except, -> (user) { where.not(id: user) }
  after_create_commit { broadcast_append_to 'users' }
  after_update_commit { broadcast_update }
  has_many :messages

  enum status: %i[offline away online]

  def broadcast_update
    broadcast_replace_to 'user_status', partial: 'users/status', user: self
  end

  def status_to_css
    case status
    when 'online' then 'bg-success'
    when 'away' then 'bg-warning'
    when 'offline' then 'bg-secondary'
    else
      'bg-dark'
    end
  end
end
