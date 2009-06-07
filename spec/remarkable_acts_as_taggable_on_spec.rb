require File.join(File.dirname(__FILE__), "spec_helper.rb")

class Person
  def self.is_tagger?; true; end
end

class User
  def categories; end;
  def category_list; end;
  def tags; end;
  def tag_list; end;
end

describe Remarkable::Acts::TaggableOn do
  before :each do
    @person = Person.new
    @user = User.new
  end
  
  it "should confirm a model is acting as taggable on an attribute" do
    act_as_taggable_on(:categories).matches?(@user).should be_true
  end
  
  it "should confirm a model is not acting as taggable on an attribute" do
    act_as_taggable_on(:members).matches?(@person).should be_false
  end
  
  it "should confirm multiple tagging attributes at once" do
    act_as_taggable_on(:categories, :tags).matches?(@user).should be_true
  end
  
  it "should confirm a model is acting as tagger" do
    act_as_tagger.matches?(@person).should be_true
  end
  
  it "should confirm a model is not acting as tagger" do
    act_as_tagger.matches?(@user).should be_false
  end
end