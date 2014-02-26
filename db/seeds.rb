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

PodcastSubCategory.create(name: 'Design', podcast_category: podcast_categories.first)
PodcastSubCategory.create(name: 'Fashion & Beauty', podcast_category: podcast_categories.first)
PodcastSubCategory.create(name: 'Food', podcast_category: podcast_categories.first)
PodcastSubCategory.create(name: 'Literature', podcast_category: podcast_categories.first)
PodcastSubCategory.create(name: 'Performing Arts', podcast_category: podcast_categories.first)
PodcastSubCategory.create(name: 'Visual Arts', podcast_category: podcast_categories.first)

PodcastSubCategory.create(name: 'Business News', podcast_category: podcast_categories.second)
PodcastSubCategory.create(name: 'Careers', podcast_category: podcast_categories.second)
PodcastSubCategory.create(name: 'Investing', podcast_category: podcast_categories.second)
PodcastSubCategory.create(name: 'Management & Marketing', podcast_category: podcast_categories.second)
PodcastSubCategory.create(name: 'Shopping', podcast_category: podcast_categories.second)

PodcastSubCategory.create(name: 'Education', podcast_category: podcast_categories.fourth)
PodcastSubCategory.create(name: 'Education Technology', podcast_category: podcast_categories.fourth)
PodcastSubCategory.create(name: 'Higher Education', podcast_category: podcast_categories.fourth)
PodcastSubCategory.create(name: 'K-12', podcast_category: podcast_categories.fourth)
PodcastSubCategory.create(name: 'Language Courses', podcast_category: podcast_categories.fourth)
PodcastSubCategory.create(name: 'Training', podcast_category: podcast_categories.fourth)

PodcastSubCategory.create(name: 'Automotive', podcast_category: podcast_categories.fifth)
PodcastSubCategory.create(name: 'Aviation', podcast_category: podcast_categories.fifth)
PodcastSubCategory.create(name: 'Hobbies', podcast_category: podcast_categories.fifth)
PodcastSubCategory.create(name: 'Other Games', podcast_category: podcast_categories.fifth)
PodcastSubCategory.create(name: 'Video Games', podcast_category: podcast_categories.fifth)

PodcastSubCategory.create(name: 'Local', podcast_category: podcast_categories[5])
PodcastSubCategory.create(name: 'National', podcast_category: podcast_categories[5])
PodcastSubCategory.create(name: 'Non-Profit', podcast_category: podcast_categories[5])
PodcastSubCategory.create(name: 'Regional', podcast_category: podcast_categories[5])

PodcastSubCategory.create(name: 'Alternative Health', podcast_category: podcast_categories[6])
PodcastSubCategory.create(name: 'Fitness & Nutrition', podcast_category: podcast_categories[6])
PodcastSubCategory.create(name: 'Self-Help', podcast_category: podcast_categories[6])
PodcastSubCategory.create(name: 'Sexuality', podcast_category: podcast_categories[6])

PodcastSubCategory.create(name: 'Buddhism', podcast_category: podcast_categories[10])
PodcastSubCategory.create(name: 'Christianity', podcast_category: podcast_categories[10])
PodcastSubCategory.create(name: 'Hinduism', podcast_category: podcast_categories[10])
PodcastSubCategory.create(name: 'Islam', podcast_category: podcast_categories[10])
PodcastSubCategory.create(name: 'Judaism', podcast_category: podcast_categories[10])
PodcastSubCategory.create(name: 'Other', podcast_category: podcast_categories[10])
PodcastSubCategory.create(name: 'Spirituality', podcast_category: podcast_categories[10])

PodcastSubCategory.create(name: 'Medicine', podcast_category: podcast_categories[11])
PodcastSubCategory.create(name: 'Natural Sciences', podcast_category: podcast_categories[11])
PodcastSubCategory.create(name: 'Social Sciences', podcast_category: podcast_categories[11])

PodcastSubCategory.create(name: 'History', podcast_category: podcast_categories[12])
PodcastSubCategory.create(name: 'Personal Journals', podcast_category: podcast_categories[12])
PodcastSubCategory.create(name: 'Philosophy', podcast_category: podcast_categories[12])
PodcastSubCategory.create(name: 'Places & Travel', podcast_category: podcast_categories[12])

PodcastSubCategory.create(name: 'Amateur', podcast_category: podcast_categories[13])
PodcastSubCategory.create(name: 'College & High School', podcast_category: podcast_categories[13])
PodcastSubCategory.create(name: 'Outdoor', podcast_category: podcast_categories[13])
PodcastSubCategory.create(name: 'Professional', podcast_category: podcast_categories[13])

PodcastSubCategory.create(name: 'Gadgets', podcast_category: podcast_categories[14])
PodcastSubCategory.create(name: 'Tech News', podcast_category: podcast_categories[14])
PodcastSubCategory.create(name: 'Podcasting', podcast_category: podcast_categories[14])
PodcastSubCategory.create(name: 'Software How-To', podcast_category: podcast_categories[14])

podcast_languages = PodcastLanguage.create([{ name: 'English' }, { name: 'Spanish' }, { name: 'Portuguese' }, { name: 'German' },
  { name: 'Russian' }, { name: 'French' }, { name: 'Other' }])

