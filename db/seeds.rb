# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

podcast_languages = PodcastLanguage.create([{ name: 'English' }, { name: 'Spanish' }, { name: 'Portuguese' }, 
  { name: 'German' }, { name: 'Russian' }, { name: 'French' },  { name: 'Chinese' }, { name: 'Other' }])

