class Skill < ApplicationRecord
    self.table_name = "Skills"    
    
    has_many :entity_skill, foreign_key: "EntityId"
    has_many :entity, through: :entity_skill, foreign_key: "EntityId"
end
