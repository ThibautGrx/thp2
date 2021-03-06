# == Schema Information
#
# Table name: lessons
#
#  id          :uuid             not null, primary key
#  title       :string(50)       not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :uuid
#  user_id     :integer
#

require 'rails_helper'

RSpec.describe Lesson, type: :model do
  it "is creatable" do
    lesson = create(:lesson)
    first_lesson = Lesson.first
    expect(first_lesson.title).to eq(lesson.title)
    expect(first_lesson.description).to eq(lesson.description)
  end

  it "follows creator link" do
    lesson = create(:lesson).reload
    expect(lesson.creator.lessons.first).to eq(lesson)
  end

  it "follow classroom link" do
    lesson = create(:lesson, :with_classrooms).reload
    expect(lesson.classrooms.first.lesson).to eq(lesson)
  end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }

  it { is_expected.to validate_length_of(:title).is_at_most(50) }
  it { is_expected.to validate_length_of(:description).is_at_most(300) }
end
