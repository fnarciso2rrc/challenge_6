class Customer < ApplicationRecord
    validates :full_name, :phone_number, :email_address, presence: true
    validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP } 

    has_one_attached :image

    def self.ransackable_associations(auth_object = nil)
        ["image_attachment", "image_blob"]
      end

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "email_address", "full_name", "id", "notes", "phone_number", "updated_at"]
    end
end
