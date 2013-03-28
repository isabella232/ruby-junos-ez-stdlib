Junos::Facts::Keeper.define( :personality ) do
  
  model = uses :hardwaremodel  
      
  @facts[:personality] = case model   
  when /^(EX)|(QFX)/
    :SWITCH
  when /^MX/
    :MX
  when /^vMX/
    @facts[:virtual] = true
    :MX
  when /SRX(\d){3}/
    :SRX_BRANCH
  when /junosv-firefly/
    @facts[:virtual] = true
    :SRX_BRANCH
  when /SRX(\d){4}/
    :SRX_HIGHEND
  end
  
end
