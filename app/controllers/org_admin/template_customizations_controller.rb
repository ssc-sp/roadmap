# frozen_string_literal: true

module OrgAdmin
  # Controller that handles customizing a template
  class TemplateCustomizationsController < ApplicationController
    include Paginable
    include Versionable
    after_action :verify_authorized

    # POST /org_admin/templates/:id/customize
    # rubocop:disable Metrics/AbcSize
    def create
      @template = Template.find(params[:template_id])
      authorize(@template, :customize?)
      if @template.customize?(current_user.org)
        begin
          @customisation = @template.customize!(current_user.org)
          redirect_to org_admin_template_path(@customisation)
          return
        rescue ArgumentError
          flash[:alert] = _('Unable to customize that template.')
        end
      else
        flash[:notice] = _('That template is not customizable.')
      end
      redirect_back(fallback_location: org_admin_templates_path)
    end
    # rubocop:enable Metrics/AbcSize
  end
end
