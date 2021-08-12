class ShoutsController < ApplicationController
  def create
    shout = User.find(current_user.id).shouts.create(shouts_params)
    redirect_to dashboard_path, redirect_options_for(shout)
  end

  def destroy
    shout = Shout.find(params[:id])
    if shout.destroy
      redirect_to root_path
    end
  end

  def destroy_all
    Shout.where(user_id: current_user.id).destroy_all
    redirect_to root_path
  end

  private

  def shouts_params
    { content: content_from_params }
  end
  
  def content_from_params
    params[:content_type].new(content_params)
  end
  
  def content_params
    params.require(:shout).require(:content).permit!
  end
  def redirect_options_for(shout)
    if shout.persisted?
      { notice: "Shout created!"}
    else 
      { alert: "Shout couldn't be created "}
    end
  end

end
