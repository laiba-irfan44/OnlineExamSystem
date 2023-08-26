class ExamPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else user.teacher?
        scope.where(teacher_id: user.id)
      end
  
   end
  end

 def show?
    user.admin? || user.teacher? || user.exams.include?(record)
  end

  def create?
    user.teacher?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.teacher? && user.exams.include?(record)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
  def cancel?
    user.admin? && record.upcoming? # Admin can cancel only upcoming exams
  end

  def review_scores?
    user.teacher? && record.status == "completed"
  end

   def schedule_dates?
    user.teacher?
  end

  def admin_view?
  user.admin?
end

end

