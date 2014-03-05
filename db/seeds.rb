# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

podcast_categories = PodcastCategory.create([{ name: 'Arts' }, { name: 'Business' }, { name: 'Comedy' }, { name: 'Education' }, 
  { name: 'Games & Hobbies' }, { name: 'Government & Organizations' }, { name: 'Health' }, { name: 'Kids & Family' },
  { name: 'Music' }, { name: 'News & Politics' }, { name: 'Religion & Spirituality' }, { name: 'Science & Medicine' },
  { name: 'Society & Culture' }, { name: 'Sports & Recreation' }, { name: 'Technology' }, { name: 'TV & Film' }])

podcast_languages = PodcastLanguage.create([{ name: 'English' }, { name: 'Spanish' }, { name: 'Portuguese' }, { name: 'German' },
  { name: 'Russian' }, { name: 'French' }, { name: 'Other' }])

