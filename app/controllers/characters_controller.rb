class CharactersController < ApplicationController
  def index
    @characters = Entity.joins(:race).all
  end
  def show
    @character = Entity.find(params[:id])
  end
  def new
  end
  def create
    @race = Race.where(["Name = ?", params[:character][:race]]).first

    params.permit!
    @statistics = Statistic.new(:Strength => params[:character][:strength],
                                :Dexterity => params[:character][:dexterity],
                                :Inteligence => params[:character][:inteligence],
                                :Wisdom => params[:character][:wisdom],
                                :Luck => params[:character][:luck],
                                :Charisma => params[:character][:charisma])
    
    @statistics.save                          
                                
    @condition = Condition.new(:Health => (params[:character][:strength].to_i * 2),
                                  :MaxHealth => (params[:character][:strength].to_i * 2),
                                  :Mana => (params[:character][:inteligence].to_i * 2),
                                  :MaxMana => (params[:character][:inteligence].to_i * 2),
                                  :Experience => 0,
                                  :MaxExperience => 1000)
    
    @condition.save
                                  
    @entity = Entity.new(:Name => params[:character][:name],
                            :Age => params[:character][:age],
                            :Level => 1,
                            :Story => params[:character][:story],
                            :Quote => params[:character][:quote],
                            :Sex => params[:character][:sex],
                            :ConditionId => @condition.id,
                            :RaceId => @race.id,
                            :StatisticsId => @statistics.id)

    @entity.save

    @character = Character.new(:EntityId => @entity.id)
    
    @character.save
    
  end
end
