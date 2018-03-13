class Contact < ApplicationRecord
  def first_name_list
    first_name.split(", ")
  end

  def directions_list
    last_name.split(", ")
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
      directions: directions_list,
      created_at: friendly_created_at,
    }
  end
end
