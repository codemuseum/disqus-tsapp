class PageObject < ActiveRecord::Base
  include ThriveSmartObjectMethods

  self.caching_default = :any_page_object_update 
  #[in :forever, :page_object_update, :any_page_object_update, 'data_update[datetimes]', :never, 'interval[5]']
  
  before_save :save_setup
  
  def validate
    if @setup_updated
      errors.add_to_base('value missing') unless @setup.valid?
    end
  end
  
  def setup?
    self.setup && self.setup.account?
  end
  
  def setup
    @setup ||= Setup.for_site(self.site_uid).first
  end

  def settings=(hash)
    edited_setup = hash.delete(:edited_setup)
    if !setup
      @setup = Setup.new_for_site(self.site_uid, hash)
      @setup_updated = true
    else
      if edited_setup == 'true' || edited_setup == '1'
        @setup.attributes = hash
        @setup_updated = true
      end
    end
  end
  
  protected
    def save_setup
      @setup.save if @setup_updated
    end
end
