class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		u = User.where(email: params[:session][:email]).take
		if u.nil?
			flash[:notice] = 'Usuario invalido, vuelve a intentarlo'
			render 'new'
		else
			if u[:password] != params[:session][:password]
				flash[:notice] = 'Contrasena incorrecta, vuelve a intentarlo'
				render 'new'
			else
				current_user = u
				flash[:notice] = 'Iniciado sesion con exito'
				redirect_to '/users/' + u[:id].to_s
			end
		end
	end

	def destroy
		#complete this method
		@current_user = nil
    	redirect_to root_url
	end
end
