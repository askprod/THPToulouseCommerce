class UserMailer < ApplicationMailer

  def order_email(user)
  	@user = user

  	headers['X-MJ-CustomID'] = 'rubyPR_Test_ID_1469790724'
	headers['X-MJ-EventPayload'] = 'rubyPR_Test_Payload'
	headers['X-MJ-TemplateLanguage'] = 'true'

     mail(from: "cyptokittiesgang@gmail.com", to: @user.email,
          subject: "Welcome to the cryptokittiesgang, GANG")
   end
end
