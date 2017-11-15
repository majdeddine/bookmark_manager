# Tag class for Bookmark Manager
# require 'data_mapper'
# require 'dm-migrations'
# require 'dm-postgres-adapter'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, String


  # has n, :links, through: Resource


end

# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
# DataMapper.finalize
# Tag.auto_upgrade!
