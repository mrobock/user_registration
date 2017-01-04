class UsersController < ApplicationController
  def index
  end

  def register
    @user = User.new(
      name: params[:name],
      address: params[:address],
      city: params[:city],
      state: params[:state],
      zip: params[:zip],
      country: params[:country],
      email: params[:email],
      user_id: params[:user_id],
      password: params[:password]
    )
    if @user.save
      flash[:register] = "Congrats!"
      render
    else
      flash[:register] = "Registration failed, please try again, ass."
      redirect_to '/'
    end
  end

  def login
    # if !params[:l_user_id].nil? && !params[:l_password].nil? && !params[:l_user_id].empty? && !params[:l_password].empty? && session[:user_id].nil?

      @user = User.find_by(user_id: params[:l_user_id])

      if !@user.nil? && @user.password == params[:l_password]
        if @user.phones.length == 0
          flash[:user_phones] = "No phone."
        end
      session[:user_id] = @user.id
      render
      else
        flash[:login] = "Login failed"
        redirect_to '/'
      end

    # elsif !session[:user_id].nil?
    #   @user = User.find_by(id: session[:user_id])
    #     if @user.phones.length == 0
    #       flash[:user_phones] = "No phone."
    #     end
    #   render

    # else
    #   flash[:login] = "Login failed"
    #   redirect_to '/'
    # end
  end

  def update
  end

  def delete
  end

  def logout
    session.delete :user_id
    reset_session
    redirect_to '/'
  end

  def add_phone
    @user = User.find_by(id:session[:user_id])
    @phone = Phone.new(number: params[:number], user_id: session[:user_id])
    if @phone.save
      flash[:phone] = "Phone added succesfully!"
      render 'login.html.erb'
    else
      flash[:phone] = 'Invalid phone # or too many phones'
      render 'login.html.erb'
    end
  end

end
