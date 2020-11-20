FactoryBot.define do
	factory :task do
		name {'テストを書く'}
		description { 'Rspec&Capybaraの準備' }
		user
	end
end