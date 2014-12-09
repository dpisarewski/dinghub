module Cardtec::ActiveNode
  extend ActiveSupport::Concern
  include GlobalID::Identification

  included do
    include Neo4j::ActiveNode
    extend ClassMethods

    property  :title,       type: String
    property  :body,        type: String
    property  :image_url,   type: String
    property  :ident,       type: String
    property  :created_at
    property  :updated_at
  end

  def to_cardtec_node
    node = persisted? ? neo4j_obj : Cardtec::Node::NullNode.new
    @cardtec_node ||= Cardtec::Node.new(node, self.class)
  end
  alias :ctn :to_cardtec_node




  def relationship_methods
    methods.grep(/_rels$/)
  end

  def related_methods
    relationship_methods.map { |m| m.to_s.gsub(/_rels$/,'').to_sym }
  end

  def related_nodes
    Struct.new(*related_methods).new(*related_methods.map { |m| send(m).to_a } )
  end




  module ClassMethods
    def to_cardtec_node
      Cardtec::Node::ActiveNodeClassMethodProxy.new(self)
    end
    alias :ctn :to_cardtec_node
  end

end









# module Extensions::Neo4jCommon

#   module ClassMethods

#     def reflect_on_association(reflection)
#       _decl_rels[reflection.to_sym].source_class
#     end

#     def collection?
#       true
#     end

#   end


#   module InstanceMethods
#     def to_param
#       uuid
#     end

#     def set_uuid
#       self.uuid = java.util.UUID.randomUUID.to_s if uuid.blank?
#     end

#     def formatted_created_at
#       I18n.l(created_at)
#     end

#     def formatted_updated_at
#       I18n.l(updated_at)
#     end


#   end


#   def self.included(base)
#     base.extend         ClassMethods
#     base.send :include, InstanceMethods
#     base.send :include, Draper::Decoratable if defined?(::Draper)

#     base.class_eval do
#       property :created_at, type: DateTime
#       property :updated_at, type: DateTime
#       property :uuid,       type: String, index: :exact

#       before_create :set_uuid
#     end
#   end

# end