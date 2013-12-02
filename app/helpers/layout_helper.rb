module LayoutHelper
  
  def main_title
    if params[:tag]
      if params[:users_only]
        "My favorite zseflows tagged with ##{params[:tag]}"
      else
        "Useflows tagged with ##{params[:tag]}"
      end
    elsif params[:users_only]
      "My Favorite Useflows"
    else 
      "All useflows"
    end
  end

end