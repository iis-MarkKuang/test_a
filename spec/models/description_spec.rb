require 'spec_helper'

describe Description do 

  it { should belong_to :user }
  it { should belong_to :product }
  it { should belong_to :document }

end
