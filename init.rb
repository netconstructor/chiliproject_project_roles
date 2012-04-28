require 'redmine'

Dispatcher.to_prepare :project_roles_plugin do

  require_dependency 'project'
  unless Project.included_modules.include? ProjectRolesPlugin::ProjectPatch
    Project.send(:include, ProjectRolesPlugin::ProjectPatch)
  end

  require_dependency 'projects_helper'
  unless ProjectsHelper.included_modules.include? ProjectRolesPlugin::ProjectsHelperPatch
    ProjectsHelper.send(:include, ProjectRolesPlugin::ProjectsHelperPatch)
  end

  require_dependency 'projects_controller'
  unless ProjectsController.included_modules.include? ProjectRolesPlugin::ProjectsControllerPatch
    ProjectsController.send(:include, ProjectRolesPlugin::ProjectsControllerPatch)
  end

  require_dependency 'roles_controller'
  unless RolesController.included_modules.include? ProjectRolesPlugin::RolesControllerPatch
    RolesController.send(:include, ProjectRolesPlugin::RolesControllerPatch)
  end

  require_dependency 'role'
  unless Role.included_modules.include? ProjectRolesPlugin::RolePatch
    Role.send(:include, ProjectRolesPlugin::RolePatch)
  end
end
Redmine::Plugin.register :chiliproject_project_roles do
  name 'Chiliproject Project Roles plugin'
  author 'Jan Vlnas'
  description 'Provides per-project roles and workflows'
  version '0.0.1'
  url 'https://github.com/jnv/chiliproject_project_roles'
  author_url 'https://github.com/jnv'

  #permission :manage_project_roles
  permission :manage_project_roles, {:local_roles => [:show, :new, :edit, :create, :update, :destroy, :report]}, :require => :member


end
