class Watch < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 10}
  validates :price, presence: true
  validates :view_url, presence: true, length: {minimum: 5}

  scope :watches_search, -> (watch_name, category_id, price_min, price_max) {
    where("lower(name) || '' LIKE ?", "%" + (watch_name.downcase) + "%").and(
      where(category_id: category_id)).and(
      where("price >= ? AND price <= ?", price_min, price_max))}

  scope :sorted_by_special_price_asc_msrp_asc, -> () { :order => 'special_price asc,msrp asc' }

  def formatted_created_at
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

  #for activeadmin
  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
  #for activeadmin
  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "id_value", "name", "price", "updated_at", "view_url"]
  end

end
