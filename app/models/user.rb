class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  # VALID_YOUTUBE_URL_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  #   validates :password, presence: true, format: { with: VALID_YOUTUBE_URL_REGEX }
  
  # with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
  #     validates :miyoji
  #     validates :namae
  #   end

  # with_options presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ } do
  #     validates :kana_miyoji
  #     validates :kana_namae
  #   end
end

