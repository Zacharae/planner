class UserTask < ActiveRecord::Base
	belongs_to :UserTask

	validates_presence_of :description, :due
end
