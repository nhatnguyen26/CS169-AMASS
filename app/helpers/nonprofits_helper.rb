module NonprofitsHelper
  def active_projects_count(nonprofit)
    Project.where(status: 'active', nonprofit_id: nonprofit.id).count
  end

  def completed_projects_count(nonprofit)
    Project.where(status: 'completed', nonprofit_id: nonprofit.id).count
  end
end
