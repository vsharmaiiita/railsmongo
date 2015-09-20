Mongoid.load!(Rails.root.join("config", "mongoid.yml"))
class Bird
  include Mongoid::Document
  field :name, type: String
  field :family, type: String
  field :continents, type: Array
  field :added, type: String
  field :visible, type: Boolean
end
