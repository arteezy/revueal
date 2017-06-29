class Message < ApplicationRecord
  after_create_commit do
    MessageBroadcastJob.perform_later(self)
  end

  validates :content, presence: true
end
