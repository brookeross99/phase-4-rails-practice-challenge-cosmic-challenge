class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, presence: true
  validates :scientist, uniqueness: {scope: :name}
  # must not allow a scientist to join the same mission twice
end
