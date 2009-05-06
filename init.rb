require 'remarkable_activerecord'

require File.join(File.dirname(__FILE__), "lib", "remarkable_acts_as_taggable_on")

Remarkable.include_matchers!(Remarkable::Acts::TaggableOn, Spec::Rails::Example::ModelExampleGroup)