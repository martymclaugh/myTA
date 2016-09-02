class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
    @classrooms = @teacher.classrooms
  end

  def create
    if params[:password] == params[:password2]
      teacher = Teacher.new(name: params[:name], email: params[:email], password: params[:password])
    end

    if teacher.save
      session[:teacher_id] = teacher.id
      redirect_to '/'
    end
  end
end
