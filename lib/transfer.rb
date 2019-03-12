class Transfer
  attr_accessor :amount, :sender, :receiver, :status
  
  def initialize(sender, receiver, amount)
    @amount = amount 
    @sender = sender   #setting @sender to represent a bank account object 
    @receiver = receiver #setting @recevier to represent a bank account object 
    @status = 'pending'
  end
  
  def valid? 
    @sender.valid? == true &&  @receiver.valid? == true &&  @sender.balance >= @amount
  end
  
  # def valid? 
  #   # check sender's bank account to make sure there is enough money
  #   # check sender & receiver have valid bank accounts
  #   if @sender.valid? == true &&  @receiver.valid? == true &&  @sender.balance >= @amount
  #     true 
  #   else 
  #     false 
  #   end
  # end
  
  def execute_transaction
    if self.valid? == false || @status == 'complete'
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
   else 
      # transfer sender's amount to the receiver's bank account 
      # subtract the amount from the sender's bank account
        @sender.balance -= @amount 
      # add the amount to the receiver's bank account 
        @receiver.balance += @amount 
        @status = 'complete'
    end
    
    # if self.valid? == true && @status == 'pending'
    #   # transfer sender's amount to the receiver's bank account 
    #   # subtract the amount from the sender's bank account
    #     @sender.balance -= @amount 
    #   # add the amount to the receiver's bank account 
    #     @receiver.balance += @amount 
    #     @status = 'complete'
    #   else 
    #     @status = 'rejected'
    #     "Transaction rejected. Please check your account balance."
    # end
  end
  
  def reverse_transfer
    if @status == 'complete'
      #return the money
      @sender.balance += @amount 
      @receiver.balance -= @amount 
      @status = "reversed"
    end
  end

end
