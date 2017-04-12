# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  house_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ActiveRecord::Base 
  validates :name, :house_id, :presence => true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House

end
