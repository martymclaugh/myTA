class TeamsController < ApplicationController
  def index
    @classroom = Classroom.find(params[:classroom_id])
  end
  def create
    p params
    @number = params[:teams].to_i
    @students = []
    params[:form][:student_ids].each do |student|
      @students << Student.find(student)
    end
    @teams = @students.shuffle.in_groups(@number)
    @t = []
    @teams.each do |team|
      t = Team.create(name: Faker::Team.creature.capitalize, classroom_id: params[:classroom])
      team.each do |student|
        if t.present? && student.present?
          StudentTeam.create(student_id: student.id, team_id: t.id)
        else
          break
        end
      end
      @t << t
    end
    redirect_to "/teachers/#{params[:teacher_id]}/classrooms/#{params[:classroom]}/teams"
  end

  def destroy
    @classroom = Classroom.find(params[:classroom_id])
    @classroom.teams.each do |team|
      team.destroy
    end
    redirect_to "/teachers/#{params[:teacher_id]}/classrooms/#{params[:classroom_id]}"
  end
end
