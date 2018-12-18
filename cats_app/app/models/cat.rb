class Cat < ApplicationRecord
  validates :birth_date, :name, :color, :sex, :description,  presence: true
  validates :color, inclusion: { in: ['red', 'blue', 'yellow', 'green'] }
  validates :sex, inclusion: { in: ['F', 'M'] }

  has_many :rental_requests,  
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age 
    now = Time.now.utc.to_date
    years = now.year - self.birth_date.year 
    
    unless ((now.month > birth_date.month) || 
      (now.month == birth_date.month && 
      now.day >= birth_date.day))
      years - 1
    end
    years
  end
end