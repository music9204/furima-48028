class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :last_name,          presence: true
  validates :first_name,         presence: true
  validates :last_name_kana,     presence: true
  validates :first_name_kana,    presence: true
  validates :birthday,           presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }

  VALID_NAME_REGEX = /\A[𠮷-🧻々〇㐀-䶵一-龥ぁ-んァ-ヶ]+\z/
  validates :last_name,  format: { with: VALID_NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, format: { with: VALID_NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }

  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :last_name_kana,  format: { with: VALID_NAME_KANA_REGEX, message: 'は全角（カタカナ）で入力してください' }
  validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: 'は全角（カタカナ）で入力してください' }
end