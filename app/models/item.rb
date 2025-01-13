class Item < ApplicationRecord
  after_save :check_list_status

  belongs_to :list

  validates :description, presence: true

  private

  def check_list_status
    list.update_status!
  end
end
