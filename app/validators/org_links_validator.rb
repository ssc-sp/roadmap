# frozen_string_literal: true

# Validation for the format of the JSON for Org links
class OrgLinksValidator < ActiveModel::Validator
  include JSONLinkValidator
  def validate(record)
    links = record.links
    if links.is_a?(Hash)
      unless links.with_indifferent_access.key?('org')
        record.errors[:links] << (format(_('A key "org" is expected for links hash'), key: k))
      end
    else
      record.errors[:links] << _('A hash is expected for links')
    end
  end
end
