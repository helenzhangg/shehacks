class Candidate < ActiveRecord::Base
	belongs_to :first_preference
    belongs_to :second_preference
    has_and_belongs_to_many :interests
    has_and_belongs_to_many :aspirations
    has_and_belongs_to_many :themes
	def name
		return self.firstname + " " + self.lastname
	end

	def skill_level
		return self.experience
	end

	def skill
		return self.experience
	end

	def first
		return self.first_preference
	end

	def second
		return self.second_preference
	end
end
