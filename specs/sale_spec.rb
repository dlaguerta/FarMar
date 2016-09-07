require_relative 'spec_helper'
module FarMar
  describe "Sale" do
    describe "#initialize" do
      before(:all) do
        sales_hash = {
          id:  23,
          amount: 200,
          purchase_time: 112,
          vendor_id: 1,
          market_id: 12
        }
      @sale = Sale.new(sales_hash)
      end

      it "should create an instance of a sale" do
        @sale.must_be_instance_of(Sale)
      end
    end
  end #end sale
end #end module
