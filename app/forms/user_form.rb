# app/forms/user_form.rb

class UserForm
    include ActiveModel::Model

    attr_accessor :name, :email, :password

    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true

    def save
        return false unless valid?
        user = User.new(name: name, email: email, password: password)
        user.save
    end
end
  