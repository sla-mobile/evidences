class User < ActiveRecord::Base
  attr_accessible :login, :password

  has_and_belongs_to_many :projects
end
