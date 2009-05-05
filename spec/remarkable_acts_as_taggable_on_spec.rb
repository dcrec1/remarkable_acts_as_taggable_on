require File.join(File.dirname(__FILE__), "spec_helper.rb")

class Person < ActiveRecord::Base
end

describe Remarkable::Acts::TaggableOn do
  it "should confirm a model is acting as taggable on an attribute" do
    Person.stub!(:categories)
    Person.stub!(:category_list)
    act_as_taggable_on(:categories).matches?(Person).should be_true
  end
  
  it "should confirm a model is not acting as taggable on an attribute" do
    act_as_taggable_on(:members).matches?(Person).should be_false
  end
  
  it "should confirm multiple tagging attributes at once" do
    Person.stub!(:categories)
    Person.stub!(:category_list)
    Person.stub!(:tags)
    Person.stub!(:tag_list)
    act_as_taggable_on(:categories, :tags).matches?(Person).should be_true
  end
end
