class Room < ApplicationRecord
  validates_uniqueness_of :name
  scope :public_rooms, -> { where(is_private: false) }
  scope :private_rooms, -> (current_user) {
                              where(is_private: true)
                              .filter { |private_room|
                                private_room.participant?(current_user) } }
  after_create_commit { broadcast_if_public }
  has_many :messages
  has_many :participants, dependent: :destroy

  def broadcast_if_public
    broadcast_append_to "rooms" unless self.is_private
  end

  def self.create_private_room(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id)
    end
    single_room
  end

  def participant?(user)
    participants.where(user: user).exists?
  end

  def other_participant(user)
    other = participants.where.not(user_id: user.id).first
    User.find(other.user_id)
  end
end
