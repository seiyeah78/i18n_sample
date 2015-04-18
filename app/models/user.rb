# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  age        :integer
#  weight     :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  translates :name, :description
  globalize_accessors

  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  I18n.available_locales.each do |locale|
    validates :"name_#{locale}", presence: true, length: { maximum: 32 }
    validates :"description_#{locale}", length: { maximum: 200 }
  end

end
