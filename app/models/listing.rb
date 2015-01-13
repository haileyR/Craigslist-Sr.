class Listing < ActiveRecord::Base

  belongs_to :category
  validates :owner_email, :title, presence: :true
  validates :edit_key, uniqueness: :true
  before_create :generate_edit_key
  after_create :send_welcome_mail

  def generate_edit_key
    self.edit_key = (0...4).map { (65 + rand(26)).chr }.join(rand(9).to_s)
  end

  def send_welcome_mail
    Pony.mail(
      :to => self.owner_email,
      :subject => "Your new craigslist SENIOR ;) listing",
      :body => "Go to http://localhost:3000/listings/" + self.id.to_s + "/edit/" + self.edit_key + " to edit and delete.")
  end
end
