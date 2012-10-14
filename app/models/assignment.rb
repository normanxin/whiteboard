# Assignment is the task/deliverable on which the professor grades for students.
# Generally, a course has many assignments, and each assignments contains many student grades(grade_books)
#
# * Professor can create an assignment on course assignments index page by clicking the "New Assignment" link. 
# * Assignment can be grouped by task_number.
# * Assignment has default scoe to ordered based on task_number and assignment_order
# * assignment_order is auto generated by system, professor cannot directly specify the number of assignment_order. Instead, they can use drag-drop function to reorder them.
# * task_number, due_date, name can be blank
# * Professor should give a maximum score (>=0 ) for each assignment.  
# * is_team_deliverable tells the assignment is a team deliverable or individual deliverable
# * is_submittable is designed for those assignment that don't required any submission, e.g., course participation, effort log. 
#
 
class Assignment < ActiveRecord::Base
  attr_accessible :name, :course_id, :maximum_score, :is_team_deliverable, :due_date, :assignment_order, :task_number, :is_submittable
  validates :maximum_score , :presence=>true,  :numericality =>{ :greater_than_or_equal_to=>0}
  validates_presence_of :course_id

  belongs_to :course

  has_many :grade_books

  acts_as_list :column=>"assignment_order", :scope => [:course_id, :task_number]


  default_scope :order => 'task_number ASC, assignment_order ASC'

end
