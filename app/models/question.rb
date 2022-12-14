class Question < ApplicationRecord
  belongs_to :topic
  validates :title, :mcq, :answer, :explanation, presence: true
end
