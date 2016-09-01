class AbsencesController < ApplicationController
  def index
    p params
    @student = Student.find(params[:student_id])
    @student.absences.last.update(absence: false)
    redirect_to "/teachers/#{params[:teacher_id]}/classrooms/#{params[:classroom_id]}"
  end
  def create
    @student = Student.find(params[:student_id])
    if @student.absences.last.absence == false
      @student.absences.last.update(absence: true)
    else
      @student.absences.last.update(absence: false)
    end
  end
end
