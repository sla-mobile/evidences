class Project < ActiveRecord::Base
  attr_accessible :details, :name

  has_many :issues
  has_many :comments, :as => :parent

  has_and_belongs_to_many :users
end
