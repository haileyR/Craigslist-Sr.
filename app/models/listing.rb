class Listing < ActiveRecord::Base
  belongs_to :category
  validates :owner_email, :title, presence: :true
  validates :edit_key, uniqueness: :true
  before_create :generate_edit_key

  def generate_edit_key
    self.edit_key = (0...4).map { (65 + rand(26)).chr }.join(rand(9).to_s)
  end
end
