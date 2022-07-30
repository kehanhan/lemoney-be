class Session
    include ActiveModel::Model
    attr_accessor :email, :password, :user

    validates :email, presence: true, format: /@/
    validates :password, presence: true, length: 6..20

    validate :authenticate, if: Proc.new { |s| s.email.present? and s.password.present?}

    def authenticate
        @user ||= User.find_by_email email 
        if user.nil?
            errors.add(:email, :not_found)
        else
            errors.add(:password, :mismatch) unless user.authenticate(password)
        end
    end
end