module ApplicationHelper
  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def render_nav_conditionally
  	if user_signed_in?
  		render 'layouts/user_navigation'
  	else 
  		render 'layouts/navigation'
  	end
  end
  
  def link_to_add_fields(name, f, association)
      new_object = f.object.send(association).klass.new
      id = new_object.object_id
      fields = f.fields_for(association, new_object, child_index: id) do |builder|
        render(association.to_s.singularize + "_fields", f: builder)
      end
      return [id, fields]
  end
  
end
