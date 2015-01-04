Rails.application.routes.draw do

  mount StatusShowPlugin::Engine => "/status_show_plugin"
end
