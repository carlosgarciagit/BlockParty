# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

interests = ['Affordable Housing', 'Animal Welfare', 'Biking', 'Childcare', 'Diversity and Inclusion', 'Education', 'Environmental/Sustainability', 'Homelessness', 'Immigration', 'Inequality', 'International Development', 'Job/Employment', 'LGBT', 'Mentorship', 'Public Health', 'Public Safety', 'Public Spaces', 'Science and Innovation', 'Transportation', 'Urban Development']
interests.each do |i|
  it_exists = Interest.find_by(name: i).present?
  unless it_exists
    Interest.create(name: i)
  end
end
