class Api::RegistrationsController < Devise::RegistrationsController  
  clear_respond_to
  respond_to :json

  #def create
    #resource = User.new(sign_up_params)

    #if resource.save
      #if resource.active_for_authentication?
        #respond_to do |format|
          #format.html {
            #set_flash_message :notice, :signed_up if is_navigational_format?
            #sign_up(resource_name, resource)
            #respond_with resource, :location => after_sign_up_path_for(resource)
          #}
          #format.json {render json: {success: true}.merge(resource.as_json)}
        #end
      #else
        #respond_to do |format|
          #format.json {render json: {success: true}}
        #end
      #end
    #else
      #clean_up_passwords resource
      #respond_to do |format|
        #format.json { render json: {success: false, :errors => resource.errors}, status: :ok }
      #end
    #end
  #end

  #private

  #def sign_up_params
    #params.require(:user).permit(:email, :password)
  #end
end  
