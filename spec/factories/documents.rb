# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    name { 'MyString' }
    content { 'MyText' }
    folder { nil }
  end
end
