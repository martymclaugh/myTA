class SessionsController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def create
    teacher = Teacher.find_by_email(params[:email])
    if teacher && teacher.authenticate(params[:password])
      session[:teacher_id] = teacher.id
      p session[:teacher_id]
      redirect_to '/'
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to '/'
  end

end
