require 'redmine'

Redmine::Plugin.register :chiliproject_project_roles do
  name 'Chiliproject Project Roles plugin'
  author 'Jan Vlnas'
  description 'Provides per-project roles and workflows'
  version '0.0.1'
  url 'https://github.com/jnv/chiliproject_project_roles'
  author_url 'https://github.com/jnv'


  require_dependency 'projects_helper'
  unless ProjectsHelper.included_modules.include? ProjectRolesPlugin::ProjectsHelperPatch
    ProjectsHelper.send(:include, ProjectRolesPlugin::ProjectsHelperPatch)
  end
end
