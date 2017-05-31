module EventsHelper
  def path_for_new_event
    controller_class = controller_name.classify

    if Event.types.include?(controller_class)
      new_event_path(type: controller_class)
    else
      new_event_path
    end
  end
end
