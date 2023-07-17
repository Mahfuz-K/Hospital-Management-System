# frozen_string_literal: true

# This is factory
FactoryBot.define do
  factory :user do
    username { 'jabra ram' }
    email { 'jrchoudhary@gmail.com' }
    password { 'password' }
    role
  end
end
