class Subscriber < ActiveRecord::Base

  has_and_belongs_to_many :newsletters

#   Status Values
#   Newslettered - when not registered but newsletter is sent
#   Registered - when registered but not yet verified
#   Verified - when registered and verified

end
