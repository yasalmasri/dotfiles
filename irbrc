include FactoryGirl::Syntax::Methods
include ActionDispatch::TestProcess

require "awesome_print"
AwesomePrint.irb!

IRB.conf[:SAVE_HISTORY] = 100000
