class Comment < ActiveRecord::Base
  attr_accessible :details, :parent_id, :parent_type, :title

  belongs_to :parent,  :polymorphic => true
end
