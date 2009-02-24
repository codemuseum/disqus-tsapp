class Setup < ActiveRecord::Base
  
  named_scope :for_site, lambda { |site_uid| {
    :conditions => { :site_uid => site_uid }
  }}
  
  attr_protected :site_uid
  validates_presence_of :site_uid
  validates_uniqueness_of :site_uid
  
  def self.new_for_site(st_uid, attrs = {})
    returning new(attrs) do |s|
      s.site_uid = st_uid
    end
  end
  
  def self.new_default
    new :avatar_size => 32,
        :color => 'grey',
        :num_items => 20,
        :show_powered_by => true
  end
  
  # For form
  def edited_setup
    true
  end
  
  def account?
    !self.account.blank?
  end
  
  def prepare
    Disqus::defaults[:account] = self.account unless self.account.blank?
    Disqus::defaults[:api_key] = self.api_key unless self.api_key.blank?
  end
  
  def build_options
    prepare
    returning Hash.new do |h|
      h[:avatar_size] = self.avatar_size unless self.avatar_size.blank?
      h[:color] = self.color unless self.color.blank?
      h[:num_items] = self.num_items unless self.num_items.blank?
      h[:show_powered_by] = self.show_powered_by unless self.show_powered_by.nil?
    end
  end
  
end
