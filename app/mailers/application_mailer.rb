# frozen_string_literal: true

# this is a helper
# this is an action-mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
