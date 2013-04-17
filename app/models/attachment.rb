class Attachment < ActiveRecord::Base
  attr_accessible :filename, :issue_id, :name
  belongs_to :issue
end
