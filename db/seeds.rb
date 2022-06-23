# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
  { tag_name: '友人' },
  { tag_name: '夫婦、恋人' },
  { tag_name: '家族' },
  { tag_name: '一人旅' }
  ])