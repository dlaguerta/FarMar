require_relative 'spec_helper'
module FarMar
 describe Product do
   describe "#initialize" do

     let(:product) { Product.new(23, "milk", 112) }
     it "should create an instance of a product" do
       product.must_be_instance_of(Product)
     end #end initialize method
   end
   describe "self.all" do
       let(:products) { Product.all }

     it "should create an array of instances of markets through the CSV file" do
      Product.all.must_be_kind_of(Hash)
     end

     #Should i write a test here to make sure it's returning the right information? exam make sure vendor_id returns number,not nil?
   end

   describe "self.find(id)" do
     let(:foots) { Product.find(12) }
     it "should return instance of a product by its product id" do
       foots.id.must_equal(12)
     end
   end #end self.find method

   describe "#vendor" do
     let (:heavy_chicken) {Product.find(3)}
     it "should return the vendor instance that matches the product's vendor id" do
       heavy_chicken.vendor.id.must_equal(2)
     end
   end #end vendor spec

  #  describe "#sales" do
  #    let
  #    it "should return a collection of sales instances for the specific product" do
   #
  #    end
  #  end #end sales spec


 end #end Product
end #end module
