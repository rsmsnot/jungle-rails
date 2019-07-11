class UserMailerPreview < ActionMailer::Preview
    def email_receipt
      UserMailer.email_receipt(user: User.first, order: Order.first)
    end
  end