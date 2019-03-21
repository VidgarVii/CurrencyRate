require 'rails_helper'

RSpec.describe Currency, type: :model do
  it { should have_many :currency_pairs }

  it { should validate_presence_of :name }
  it { should validate_presence_of :sign }
  it { should validate_presence_of :code }

end
