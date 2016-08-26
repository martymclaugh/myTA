class TeamsController < ApplicationController
  def create
    @number = params[:teams].to_i
    @students = []
    Classroom.find(params[:classroom]).students.each do |student|
      @students << student.name
    end
    @teams = @students.shuffle.in_groups(@number)
    @teams.each do |team|
      t = Team.create(name: Faker::Team.creature.capitalize)
      team.each do |student|
        StudentTeam.create(student_id: student.id, team_id: t.id)
      end
    end
  end
end
