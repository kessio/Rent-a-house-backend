require 'rails_helper'

RSpec.describe House, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title).with_message("can't be blank") }
    it { should validate_presence_of(:description).with_message("can't be blank") }
    it {
      should validate_length_of(:description)
        .is_at_least(10)
        .is_at_most(500)
        .with_message 'must be between 10 and 500 characters'
    }
    it { should validate_presence_of(:price).with_message("can't be blank") }
    it {
      should validate_numericality_of(:price).is_greater_than_or_equal_to(0).with_message('must be a positive number')
    }
    it { should validate_presence_of(:image) }
  end
end
