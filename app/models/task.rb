class Task < ApplicationRecord
  acts_as_list
  belongs_to :project
  validates_presence_of :name
end
