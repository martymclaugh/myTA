class SessionsController < ApplicationController
  def new
  end
  def create
    teacher = Teacher.find_by_email(params[:email])
    if teacher && teacher.authenticate(params[:password])
      session[:id] = teacher.id
    end
  end

  def destroy
    session[:id] = nil
    redirect_to '/'
  end

end
