class Description < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :document

  validate :user_limit
  
  def user_limit
    if self.class.where(user_id: self.user_id).count >= 1
      msg = "You have reached your limit"
      self.errors.add(:user_id, msg)
    end
  end
end
