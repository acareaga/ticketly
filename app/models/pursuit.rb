class Pursuit < ActiveRecord::Base
  belongs_to :activity
  has_many :ordered_trips
  has_many :orders, through: :ordered_trips

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  def retire
    self.update(status: "retired")
  end

  def retired?
    status == "retired"
  end
end
