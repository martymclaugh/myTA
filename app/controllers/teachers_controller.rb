class TeachersController < ApplicationController
  def index
  end
  
  def create
    if params[:teacher][:password] == params[:teacher][:password_confirmation]
      teacher = Teacher.new(teacher_params)
    end
    if teacher.save
      session[:id] = teacher.id
    end
  end

  protected

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end
end
