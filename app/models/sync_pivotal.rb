class SyncPivotal

  def initialize(user)
    @user = user
    PivotalTracker::Client.token = @user.pivotal_token
  end

  def sync_projects
    projects = PivotalTracker::Project.all
    projects.each do |project|
      attributes = { :pivotal_id => project.id, :name => project.name, :account => project.account }
      p = Project.find_by_pivotal_id(project.id)
      if p
        p.update_attributes(attributes)
      else
        p = Project.create(attributes)
      end
      sync_project_stories(project, p.id)
    end
    return nil
  end

  def sync_project_stories(pivotal_project, project_id)
    stories = pivotal_project.stories.all
    stories.each do |story|
      attributes = { :pivotal_id => story.id, :project_id => project_id, :name => story.name,
                     :description => story.description, :story_type => story.story_type,
                     :estimate => story.estimate, :current_state => story.current_state,
                     :requested_by => story.requested_by, :owned_by => story.owned_by,
                     :labels => story.labels, :accpeted_at => story.accepted_at }

      attributes[:user_id] = @user.id if story.owned_by.eql?(@user.full_name)

      unless story.labels.blank?
        attributes[:client_no], attributes[:job_no] = *(story.labels.split("-").map { |l| l.strip })
      end

      if s = Story.find_by_pivotal_id(story.id)
        s.update_attributes(attributes)
      else
        Story.create(attributes)
      end
    end
  end

end
