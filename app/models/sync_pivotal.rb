class SyncPivotal

  def initialize(user)
    @user = user
    PivotalTracker::Client.token ||= @user.pivotal_token
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
      sync_project_stories(project.id, p.id)
    end
  end

  def sync_project_stories(pivotal_id, project_id)
    stories = PivotalTracker::Project.find(pivotal_id).stories.all

    threads = []

    stories.each do |story|

      threads << Thread.new(page) do |thread_story|

        attributes = { :pivotal_id => thread_story.id, :project_id => project_id, :name => thread_story.name,
                       :description => thread_story.description, :thread_story.type => thread_story.thread_story.type,
                       :estimate => thread_story.estimate, :current_state => thread_story.current_state,
                       :requested_by => thread_story.requested_by, :owned_by => thread_story.owned_by,
                       :labels => thread_story.labels, :accpeted_at => thread_story.accepted_at }

        attributes[:user_id] = @user.id if thread_story.owned_by.eql?(@user.full_name)

        unless thread_story.labels.blank?
          attributes[:client_no], attributes[:job_no] = *(thread_story.labels.split("-").map { |l| l.strip })
        end

        if s = Story.find_by_pivotal_id(thread_story.id)
          s.update_attributes(attributes)
        else
          Story.create(attributes)
        end
      end

      threads.each { |thread| thread.join }
    end
  end

end
