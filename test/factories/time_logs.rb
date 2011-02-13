# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :time_log do |f|
  f.story_id 1
  f.start_time "2011-02-13 16:58:47"
  f.end_time "2011-02-13 16:58:47"
  f.notes "MyText"
end