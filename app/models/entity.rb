class Entity < ApplicationRecord
    self.table_name = "Entities"
    belongs_to :race, foreign_key: "RaceId"
    belongs_to :condition, foreign_key: "ConditionId"
    belongs_to :statistic, foreign_key: "StatisticsId"

    has_many :entity_skill, foreign_key: "EntityId"
    has_many :skill, through: :entity_skill, foreign_key: "EntityId"
end
