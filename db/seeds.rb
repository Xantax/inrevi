# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

podcast_categories = PodcastCategory.create([{ name: 'vogo' }, { name: 'Johnny' }, { name: 'Smart' }, { name: 'Tenty' }])

PodcastSubCategory.create(name: 'Hyberbeard', podcast_category: podcast_categories.first)
PodcastSubCategory.create(name: 'dfgdfggggg', podcast_category: podcast_categories.second)
PodcastSubCategory.create(name: 'cvcxfgdfgd', podcast_category: podcast_categories.third)
PodcastSubCategory.create(name: 'vbnfghfghe', podcast_category: podcast_categories.fourth)

