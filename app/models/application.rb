class Application < ActiveRecord::Base
	belongs_to :user
	attr_accessor :temp_state
	include AASM

	aasm do
		state :started, :initial => true
		state :applied
		state :accepted
		state :rejected

		event :apply do
			transitions :from => :started, :to => :applied
		end

		event :accept do
			transitions :from => :applied, :to => :accepted
		end

		event :reject do
			transitions :from => :applied, :to => :rejected
		end
	end

	validates :company_name, :presence => true, :on => :update, :if => :applied?, length: { maximum: 20}
	validates :company_description, :presence => true, :on => :update, :if => :applied?, length: { maximum: 2000}
	validates :website_url, :presence => true, :on => :update, :if => :applied?
	validates :nif, :presence => true, numericality: { only_integer: true }, length: { maximum: 9, minimum: 9 }, :on => :update, :if => :applied?
	validates :founding_team, :presence => true, :on => :update, :if => :applied?, length: { maximum: 200}
	validates :team_description, :presence => true, :on => :update, :if => :applied?, length: { maximum: 2500}
	validates :email, :presence => true, email: true, :on => :update, :if => :applied?
	validates :founding_date, :presence => true, :on => :update, :if => :applied?
	validates :funding_to_date, :presence => true, :on => :update, :if => :applied?
	validates :product_description, :presence => true, :on => :update, :if => :applied?, length: { maximum: 1500}
	validates :customers, :presence => true, :on => :update, :if => :applied?, length: { maximum: 1000}
	validates :future, :presence => true, :on => :update, :if => :applied?, length: { maximum: 1500}
	validates :pitch_url, :presence => true, :on => :update, :if => :applied?

	def applied?
	  temp_state == "Apply"
	end

end