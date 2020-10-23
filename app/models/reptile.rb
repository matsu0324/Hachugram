class Reptile < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  with_options presence: true do
     validates :title
     validates :body
     validates :image
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Reptile.where(title: content)
    elsif method == 'forward'
      Reptile.Where("title LIKE ?", content + "%")
    elsif method == "backward"
      Reptile.where("title LIKE ?", "%" + content)
    else
      Reptile.where("title LIKE ?", '%' + content + '%')
    end
  end

end
