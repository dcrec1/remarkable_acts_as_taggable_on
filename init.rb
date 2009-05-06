if RAILS_ENV == "test"

  require 'remarkable_activerecord'

  require File.join(File.dirname(__FILE__), "lib", "remarkable_acts_as_taggable_on")

  require 'spec'
  require 'spec/rails'

  Remarkable.include_matchers!(Remarkable::Acts::TaggableOn, Spec::Rails::Example::ModelExampleGroup)

end