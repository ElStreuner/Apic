class UserMailer < ApplicationMailer
  default from: "a.louis@zeppelin-university.net"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'a.louis@zeppelin-university.net',
        :subject => "A new contact form message from #{name}")
  end
  def welcome(user)
  @appname = "Apic"
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
	end
		end