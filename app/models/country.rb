class Country < ApplicationRecord
	has_many :orders

	def self.create_country(params)
		country = Country.find_by(name: params['country'])
		country ? country : Country.create(name: params['country'])
	end
end
