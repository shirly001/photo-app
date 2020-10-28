class Payment < ActiveRecord::Base
  #we are not going to save this attributes to database
  #but to read it, modify it, delete it we need to store it in class
  #let mentioned attributes become accessible (be able to get and set)
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
  belongs_to :user
  
  def self.month_options
     #selecting the option for month during credit card info filling
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end
  
  def self.year_options
    #selecting the option for year during credit card info filling
    #display 10 years before and after from this date
    (Date.today.year..(Date.today.year+10)).to_a
  end
  
  def process_payment
    customer = Stripe::Customer.create email: email, card: token
    
    Stripe::Charge.create customer: customer.id, 
                          amount: 1000, 
                          description: 'Premium', 
                          currency: 'usd'
  end
  
end
