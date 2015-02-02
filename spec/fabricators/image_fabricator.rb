Fabricator(:image) do
  name { Faker::App.name }
  file { Faker::Hacker.noun }
end
