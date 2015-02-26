class Event < ActiveRecord::Base
  validates :name, presence: true
  validates :venue, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
