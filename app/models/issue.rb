class Issue < ActiveRecord::Base
  attr_accessible :details, :recommendation, :risk, :title, :status, :project
  belongs_to :project

  has_many :comments, :as => :parent
  has_many :attachments 
end
