class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user

  has_one_attached :image, dependent: :destroy

  has_one :order

  validates :image,       presence: true
  validates :name,        presence: true
  validates :description, presence: true
  validates :price,       presence: true

  validates :price, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999
  }

  validates :category_id,            numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,           numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,        numericality: { other_than: 1, message: "can't be blank" }

  has_many :comments, dependent: :destroy

  def previous
    Item.where('id < ?', id).order(id: :desc).first
  end

  def next
    Item.where('id > ?', id).order(id: :asc).first
  end
end
