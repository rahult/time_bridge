require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  should "be valid" do
    assert Story.new.valid?
  end
end
