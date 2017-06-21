module ApplicationHelper
  # Devise Helpers to map resource to user
  def resource_name
    :user
  end

  def nav_link(text, path)
    options = {class: 'nav-item'}
    if current_page?(path)
      options[:class] = options[:class] + " active"
      text = text + " <span class='sr-only'>(current)</span>"
    end

    content_tag(:li, options) do
      link_to raw(text), path, class: 'nav-link'
    end
  end

  def resource
    @user ||= User.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
