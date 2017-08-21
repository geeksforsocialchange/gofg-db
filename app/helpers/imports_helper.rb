module ImportsHelper

  def review_tab(attribute, number, active=false)
    content_tag(:li, role: "presentation", class: ("active" if active)) do
      link_to("##{attribute}", 'aria-controls' => "#{attribute}", role: "tab", 'data-toggle' => "tab") do 
        concat attribute.humanize.titleize
        concat ' '
        concat content_tag(:span, number, class: "badge")
      end
   end
  end
end
