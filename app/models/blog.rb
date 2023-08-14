# app/models/blog.rb

class Blog < ApplicationRecord
    # Callbacks
    before_save :do_something_before_save
    after_create :send_notification
  
    # Validations
    validates :title, presence: true
    validates :content, presence: true
    validate :custom_validation_method
  
    # Callback method
    def do_something_before_save
      # Perform actions before saving
    end
  
    def send_notification
      # Perform actions after creation
    end
  
    # Custom validation method
    def custom_validation_method
      if title.blank? && content.blank?
        errors.add(:base, "Title and content can't be both blank")
      end
    end
  end
  