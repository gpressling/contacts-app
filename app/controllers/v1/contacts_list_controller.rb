class V1::ContactsListController < ApplicationController
  def index
    contacts = Contact.all

    search_terms = params[:query]
    if search_terms
      contacts = contacts.where("first_name ILIKE ? 
        OR last_name ILIKE ? 
        OR email ILIKE ?""%#{search_terms}%", "%#{search_terms}%", 
        "%#{search_terms}%" )
    end

    render json: contacts.as_json
  end

  def create
    contact = Contact.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    phone_number: params[:phone_number]
    )
    contact.save
    render json: contact.as_json
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact.as_json
  end
  def update
    contact = Contact.find_by(id: params[:id])
    contact.first_name = params[:name] || contact.first_name
    contact.last_name = params[:last_name] || contact.last_name
    contact.email = params[:email] || contact.email
    contact.phone_number = params[:phone_number] || contact.phone_number
    contact.save
    render json: contact.as_json
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy
    render json:{message: "Contact successfully destroyed."}
  end
end
