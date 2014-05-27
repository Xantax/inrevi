SEM3 = Semantics3::Products.new(ENV["SEMANTICS3_KEY"], ENV["SEMANTICS3_SECRET"])

CategoryStruct = Struct.new(:name, :cat_id, :parent_cat_id)