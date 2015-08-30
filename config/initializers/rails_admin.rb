RailsAdmin.config do |config|

  config.authorize_with do
    redirect_to main_app.login_path unless current_user && current_user.is_admin?
  end
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    config.current_user_method(&:current_user)  # logout button using logout_path

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

end
