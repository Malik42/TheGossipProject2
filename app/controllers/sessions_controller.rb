class SessionsController < ApplicationController
    def create
        # cherche s'il existe un utilisateur en base avec l’e-mail
        @user = User.find_by(params[:email])
      
        # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
        if user && user.authenticate(params[:password_digest])
          session[:user_id] = user.id
          # redirige où tu veux, avec un flash ou pas
      
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end

        def destroy
            session.delete(:user_id)
          end
end
