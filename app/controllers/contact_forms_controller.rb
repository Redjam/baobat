class ContactFormsController < ApplicationController
  def new
    @contact = ContactForm.new
  end

  def create
    @contact = ContactForm.new(contact_form_params)
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Merci pour votre message. Nous vous contacterons très prochainement !'
      redirect_to root_path
    else
      flash[:error] = 'Le message de peut être envoyé.'
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :sujet, :message)
  end
end