class List < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy, inverse_of: :list
  accepts_nested_attributes_for :items, allow_destroy: true

  enum category: { todo: 0, compras: 1, desejos: 2, filmes: 3, livros: 4, musica: 5, jogos: 6, outros: 7 }
  enum status: { em_progresso: 0, sucesso: 1, falha: 2 }

  validates :title, presence: true
  validates :status, inclusion: { in: statuses.keys }
  validates :category, inclusion: { in: categories.keys }
  validates :repeat, inclusion: { in: [true, false] }
  validate :deadline_cannot_be_in_the_past

  def update_status!
    if items.any? && items.all?(&:checked)
      self.status = :sucesso
    else
      self.status = :em_progresso
    end
    save!
  end

  def lista_failed
    list.update(status: :falha) if Date.today > self.deadline && self.status != :sucesso
  end

  def sucesso?
    self.status == "sucesso"
  end

  def falha?
    self.status == "falha"
  end

  def em_progresso?
    self.status == "em_progresso"
  end

  def category_class
    "category-#{category}"
  end

  private
  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < DateTime.current-1.day
      errors.add(:deadline, "não pode ser menor que a data atual")
    end
  end
end
