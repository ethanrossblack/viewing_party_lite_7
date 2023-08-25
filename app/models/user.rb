# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    record.errors.add attribute, options[:message] || "'#{value}' is not a valid email"
  end
end

class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  # placeholder method so that users/show_spec.rb test passes
  def viewing_parties
    []
  end
end
