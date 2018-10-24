class Candidate < ActiveRecord::Base
	belongs_to :first_preference
        belongs_to :second_preference
	def name
		return self.firstname + " " + self.lastname
	end

	def first
		return self.first_preference
	end

	def second
		return self.second_preference
	end
end
