class Room < ApplicationRecord
    validates :title, :short_description, :size, :view, :bed, :price, :opacity, presence: true
    validates :description, presence: true, length: {:minimum => 5} 

    belongs_to :user 
    has_many :enrollments

    has_one_attached :avatar

    def to_s 
        title
    end
    has_rich_text :description

    extend FriendlyId
    friendly_id :title, use: :slugged
    # friendly_id :generated_slug, use: :slugged
    # def generated_slug
    #     require 'securerandom'
    #     @random_slug ||= persisted? ? friendly_id : SecureRandom.hex(4)
    # end

    # def to_s 
    #     slug 
    # end
    BEDS = [:"1", :"2", :"3", :"4"]
    def self.beds 
        BEDS.map{|bed| [bed, bed]}
    end

    OPACITYS = [:"1", :"2", :"3", :"4", :"5", :"6"]
    def self.opacitys 
        OPACITYS.map{|opacity| [opacity, opacity]}
    end

    include PublicActivity::Model
    tracked owner: Proc.new{|controller, model| controller.current_user}
end
