class User < ActiveRecord::Base

	has_secure_password
	validates :firstname, presence: true, length: {minimum: 2}
	validates :lastname, presence: true, length: {minimum: 2}
	validates :username, presence: true, uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: { minimum: 8, maximum: 30 },

	 confirmation: true,
  if: :password
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum:105 },
			   uniqueness: {case_sensitive: false },
			   format: { with: VALID_EMAIL_REGEX }

	def name
		return self.firstname + " " + self.lastname
	end

	# Get access level. Used to authorize appropriate access.
	def access
		return self.access_level
	end
end
