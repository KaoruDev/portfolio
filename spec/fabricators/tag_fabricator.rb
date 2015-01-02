Fabricator(:tag) do
  name { Faker::Hacker.abbreviation }
  taggable { Fabricate(:post) }
end
