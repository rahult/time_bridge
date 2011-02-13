require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should "be valid" do
    assert Project.new.valid?
  end
end
