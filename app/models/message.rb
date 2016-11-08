class Message < ApplicationRecord
  after_create_commit {MessageBroadcastJab.perform_later self}
end
