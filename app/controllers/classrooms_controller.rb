class ClassroomsController < ApplicationController
  helper_method :true_random_student
  def index
  end

  def create
    @classroom = Classroom.new(teacher_id: params[:teacher_id], name: params[:name])
    if @classroom.save
      redirect_to "/teachers/#{params[:teacher_id]}"
    end
  end

  def show
    @classroom = Classroom.find(params[:id])
    if request.xhr?
      p "hiddddfanwoefinaweionawoe  inafweoin"
      render template: 'classrooms/_true_random.html.erb', layout: false
    end
  end

  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to "/teachers/#{params[:teacher_id]}"
  end

  private

  def true_random_student
    @classroom.students.sample.name
  end
end
