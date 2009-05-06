require File.join(File.dirname(__FILE__), "spec_helper.rb")

class Person < ActiveRecord::Base
end

describe Remarkable::Acts::TaggableOn do
  it "should confirm a model is acting as taggable on an attribute" do
    person = mock(Person, :categories => false,
                          :category_list => false)
    act_as_taggable_on(:categories).matches?(person).should be_true
  end
  
  it "should confirm a model is not acting as taggable on an attribute" do
    act_as_taggable_on(:members).matches?(mock(Person)).should be_false
  end
  
  it "should confirm multiple tagging attributes at once" do
    person = mock(Person, :categories => false,
                          :category_list => false,
                          :tags => false,
                          :tag_list => false)
    act_as_taggable_on(:categories, :tags).matches?(person).should be_true
  end
end