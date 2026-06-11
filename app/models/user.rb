class User < ApplicationRecord
  # Devise 기본 기능 활성화
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 💡 필수 입력값 검사
  validates :nickname,        presence: true
  validates :birthday,        presence: true

  # 💡 비밀번호 유효성 검사 추가 (영숫자 혼합 필수)
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  # 일본어 이름(한자, 히라가나, 전각 카타카나)
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
  # 이름 카나(전각 카타카나만)
  VALID_KANA_REGEX = /\A[ァ-ン]+\z/

  validates :last_name,       presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name,      presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana,  presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
end
