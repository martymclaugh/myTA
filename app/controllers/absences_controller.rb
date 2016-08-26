class AbsencesController < ApplicationController
  def index
    @student = Student.find(params[:student_id])
    @student.absences.last.update(absence: false)
    redirect_to "/teachers/#{params[:teacher_id]}/classrooms/#{params[:classroom_id]}"
  end
end
