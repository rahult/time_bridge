require 'test_helper'

class TimeLogTest < ActiveSupport::TestCase
  should "be valid" do
    assert TimeLog.new.valid?
  end
end
