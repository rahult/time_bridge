# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :story do |f|
  f.accpeted_at "2011-02-13 11:35:31"
  f.project_id 1
  f.name "MyString"
  f.description "MyText"
  f.story_type "MyString"
  f.estimate 1
  f.current_state "MyString"
  f.requested_by "MyString"
  f.owned_by "MyString"
  f.labels "MyText"
  f.user_id 1
end