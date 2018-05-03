class WsusersController < ApplicationController
  soap_service namespace: 'urn:WashOutUser', camelize_wsdl: :lower

  soap_action "checkUser",
                :args => { :userId => :integer},
                :return => { :userValid => :boolean, :userName => :string,  :userEmail => :string , :userAge => :integer}
  def checkUser
      if (User.exists?(id: params[:userId]))
          @user = User.find(params[:userId])
          name = @user.name
          email = @user.email
          age = @user.age
          render :soap => { :userValid => true, :userName => name,  :userEmail => email , :userAge => age}
      else
          render :soap => { :userValid => false, :userName => "",  :userEmail => "" , :userAge => 0}
      end
  end

end
