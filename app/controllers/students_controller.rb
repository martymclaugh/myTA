class StudentsController < ApplicationController
  def create
    p params
    @student = Student.new(name: params[:name])
    if @student.save
      ClassroomStudent.create(student_id: @student.id, classroom_id: params[:classroom_id])
      redirect_to "/teachers/#{params[:teacher_id]}/classrooms/#{params[:classroom_id]}"
    end
  end
end
