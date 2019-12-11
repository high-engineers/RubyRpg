class SkillsController < ApplicationController
    def index
        @available_skills_ids = EntitySkill.where(["EntityId = ?", params[:character_id]]).pluck(:SkillId)
        @user_skills = Skill.where(["Skills.Id IN (?, ?)", @available_skills_ids.first, @available_skills_ids.last])
        @available_skills = Skill.where(["Skills.Id NOT IN (?, ?)", @available_skills_ids.first, @available_skills_ids.last])
    end
    def show
        @skill = Skill.find(params[:id])
    end
    def create
        @params = params[:skill]
     
        params.permit!
        @skill = Skill.new(:Name => params[:skill][:name],
                            :Description => params[:skill][:description],
                            :ManaCost => params[:skill][:mana_cost],
                            :Damage => params[:skill][:damage],
                            :Multiplier => params[:skill][:multiplier])

        @skill.save                          
      end
    def update
    end
end
