class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :first_name_kanji, presence: true
  validates :first_name_kana,  presence: true
  validates :last_name_kanji,  presence: true
  validates :last_name_kana,   presence: true
  validates :birthday,         presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :encrypted_password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end