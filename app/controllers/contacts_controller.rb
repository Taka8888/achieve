class ContactsController < ApplicationController
  before_action :set_blog, only: [:creat]
  
  def new
    if params[:back]
    @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
   
  def create
    @contact = Contact.create(contacts_params)
    if @contact.save
      redirect_to root_path, notice:"お問い合わせ完了しました！" 
      #"お問い合わせありがとうございました。\n改めて担当者よりご連絡をさせていただきます。"
    else 
      render 'new'
    end
  end
   
  private
   def contacts_params
     params.require(:contact).permit(:name, :email, :content)
   end
end
