task :load_categories => :environment do
  ProductCategory.init_categories :computer
  ProductCategory.init_categories :camera
end