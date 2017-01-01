namespace :db do
  desc 'Populate database with sample data'

  task populate: :environment do

    def some_name
      Faker::Lorem.words(4, true).join(' ').capitalize
    end

    10.times { |n| Item.create!(name: some_name) }
    3.times  { |n| Item.create!(name: some_name, parent_id: 5) }
    11.times { |n| Item.create!(name: some_name, parent_id: 10) }
    7.times  { |n| Item.create!(name: some_name, parent_id: 17) }
    3.times  { |n| Item.create!(name: some_name, parent_id: 21) }
  end
end