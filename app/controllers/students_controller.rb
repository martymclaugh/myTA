class StudentsController < ApplicationController
  def create
    @student = Student.new(name: params[:name])
    if @student.save
      ClassroomStudent.create(student_id: @student.id, classroom_id: params[:classroom_id])
      @absence = Absence.create(absence: true)
      AbsenceStudent.create(student_id: @student.id, absence_id: @absence.id)
      redirect_to "/teachers/#{params[:teacher_id]}/classrooms/#{params[:classroom_id]}"
    end
  end
  def index
    @classroom = Classroom.find(params[:classroom_id])
    @students = []
    @classroom.students.each do |student|
      @students << student.name
    end
    @students = @students.shuffle
    @student = @students[0]
    @students.delete(@student)
    p @students
    if request.xhr?
      render template: 'classrooms/_cyclic_random.html.erb', layout: false
    end
  end
end
