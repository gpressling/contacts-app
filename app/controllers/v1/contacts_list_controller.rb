class V1::ContactsListController < ApplicationController
  def first_contact
    contact = Contact.first
    render json: {
      first_name: contact.first_name,
      last_name: contact.last_name,
      email: contact.email,
      phone_number: contact.phone_number
    }
  end
  def second_contact
    contact = Contact.second
    render json: {
      first_name: contact.first_name,
      last_name: contact.last_name,
      email: contact.email,
      phone_number: contact.phone_number
    }
  end
  def third_contact
    contact = Contact.third
    render json: {
      first_name: contact.first_name,
      last_name: contact.last_name,
      email: contact.email,
      phone_number: contact.phone_number
    }
  end
end
