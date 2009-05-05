module Remarkable
  module Acts
    module TaggableOn
      module Matchers
        class ActAsTaggableOnMatcher < Remarkable::ActiveRecord::Base
          arguments :collection => :attributes, :as => :attribute
          collection_assertion :acts_as_taggable?

          protected

            def acts_as_taggable?
              @subject.respond_to? @attribute and @subject.respond_to? "#{@attribute.to_s.singularize}_list"
            end
        end

        def act_as_taggable_on(*args)
          ActAsTaggableOnMatcher.new(*args).spec(self)
        end
      end
    end
  end
end
