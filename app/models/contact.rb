class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  
  def full_name
    "#{last_name}, #{first_name}"
  end

  def friendly_updated_time
    updated_at.strftime("%B %e, %Y")
  end

  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def as_json
    {
      first_name: first_name,
      last_name: last_name,
      email: email,
      phone_number: phone_number,
      full_name: full_name,
      updated_at: friendly_updated_time,
      created_at: friendly_created_at,
    }
  end
end
