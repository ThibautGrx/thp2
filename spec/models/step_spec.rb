# == Schema Information
#
# Table name: steps
#
#  id          :uuid             not null, primary key
#  title       :string
#  description :text
#  lesson_id   :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Step, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end