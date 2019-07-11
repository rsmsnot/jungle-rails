class UserMailer < ApplicationMailer

    def email_receipt(params)
    @order = params[:order]
    @user = params[:user]
    mail(to: @user.email, subject: 'Jungle: ref no. {@order.id}')
    end

end
