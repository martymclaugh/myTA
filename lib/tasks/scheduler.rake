desc 'reset absences'
task reset_absences: :environment do
  puts "working"
  Student.all.each do |student|
    a = Absence.create(absence: true)
    AbsenceStudent.create(student_id: student.id, absence_id: a.id)
    puts "done"
  end
end
