class ContactsController < ApplicationController
  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.create(contacts_params)
    if @contact.save
#      redirect_to new_contact_path, notice: "お問い合わせありがとうございました！"
      redirect_to root_path, notice: "お問い合わせが完了しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end

  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
