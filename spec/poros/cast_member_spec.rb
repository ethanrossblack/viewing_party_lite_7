# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movie' do
  it 'exists and has attributes' do
    cast_member_data = {
      name: 'Marlon Brando',
      character: 'Don Vito Corleone'
    }

    cast_member = CastMember.new(cast_member_data)

    expect(cast_member).to be_a CastMember

    expect(cast_member.name).to eq('Marlon Brando')
    expect(cast_member.character).to eq('Don Vito Corleone')
  end
end
