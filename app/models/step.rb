# == Schema Information
#
# Table name: steps
#
#  id          :uuid             not null, primary key
#  title       :string(50)       not null
#  description :text             not null
#  lesson_id   :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Step < ApplicationRecord
  belongs_to :lesson
  has_many :ticked_steps, dependent: :destroy
  has_many :understanding_user, through: :ticked_steps, source: :user

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 300 }

  #   def understanding_users(classroom)
  #     ticked_steps = self.ticked_steps.select{ |item| item.classroom == classroom }.map(&:user_id)
  #     User.where(id: ticked_steps)
  #   end
  def completness_percentage(classroom)
    if classroom.students.count.positive?
      classroom.ticked_steps.where(step: self).count / classroom.students.count * 100
    else
      0
    end
  end
end
