class Status < ActiveRecord::Base
  belongs_to :user
  acts_as_likeable
  paginates_per 10
  acts_as_commentable
  include PublicActivity::Model
  tracked
  
end
