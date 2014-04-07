class Project < ActiveRecord::Base
  VALID_NAME_REGEX = /(\A[\w ]+)/
  VALID_URL_REGEX = URI::regexp(["http", "https"])

	validates :name, :presence => true,
	                 :uniqueness => true,
                   :length => {
                      :maximum => 24
                   },
	                 :format => {
	                 		:with => VALID_NAME_REGEX,
							        :message => "Only allow numbers letters hyphens and underscores"
							     }

	validates :link, :presence => true,
	                 :uniqueness => true,
                   :format => {
                      :with => VALID_URL_REGEX,
                      :message => "has to be a valid URL (Try including http://)"
                   }

	validates :year, :presence => true,
	                 :numericality => {
	                 	               :only_integer => true,
                                   :greater_than => 2012,
                                   :less_than => 2015
                   }
end