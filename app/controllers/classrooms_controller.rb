class ClassroomsController < ApplicationController
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
  end

  def destroy
    p params
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to "/teachers/#{params[:teacher_id]}"
  end
end
