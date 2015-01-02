Fabricator(:post) do
  title { Faker::App.name }
  body { Faker::Lorem.paragraph(5) }
  author { Fabricate(:user) }
end
