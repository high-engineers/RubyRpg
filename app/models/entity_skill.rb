class EntitySkill < ApplicationRecord
    self.table_name = "EntitySkills"
    belongs_to :entity, primary_key: "Id", foreign_key: "EntityId"
    belongs_to :skill, primary_key: "Id", foreign_key: "SkillId"
end
