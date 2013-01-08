# == Schema Information
#
# Table name: photoposts
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#

require 'spec_helper'

describe Photopost do
  pending "add some examples to (or delete) #{__FILE__}"
end
