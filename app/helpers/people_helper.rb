module PeopleHelper

  def path_for_new_person
    controller_class = controller_name.classify

    if Person.types.include?(controller_class)
      new_person_path(type: controller_class)
    else
      new_person_path
    end
  end
end
