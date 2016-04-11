class Rent < ActiveRecord::Base
  belongs_to :user
  belongs_to :district
  belongs_to :type
  has_attached_file :avatar,
  styles: { thumb: '100x100>', medium:'300x300>'},
  default_utl: '/images/:style/missing.png'
  validates_attachment :avatar,
  content_type:{ content_type:['image/jpeg','image/png','image/gif']}
  
  def district_name    
     self.district.name  
  end
  def type_name
      self.type.name
  end

end
