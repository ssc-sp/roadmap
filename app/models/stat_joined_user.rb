# frozen_string_literal: true

# == Schema Information
#
# Table name: stats
#
#  id         :integer          not null, primary key
#  count      :bigint(8)        default(0)
#  date       :date             not null
#  details    :text
#  filtered   :boolean          default(FALSE)
#  type       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  org_id     :integer
#

# Object that represents a Nbr of Users created usage statistic
class StatJoinedUser < Stat
  class << self
    def to_csv(joined_users)
      Stat.to_csv(joined_users)
    end
  end
end
