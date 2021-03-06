require 'CSV'

module FarMar
  class Sale
    attr_reader :id, :amount, :purchase_time, :vendor_id,
    :product_id

    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id.to_i
      @amount = amount.to_i
      @purchase_time = purchase_time
      @vendor_id = vendor_id.to_i
      @product_id = product_id.to_i

    end

    def self.all
      sales_hash = {}
      CSV.read("./support/sales.csv").each do |line|
        id = line[0].to_i
        amount = line[1]
        purchase_time = DateTime.parse(line[2])
        vendor_id = line[3]
        product_id = line[4]
        sales_hash[id] = self.new(id, amount, purchase_time, vendor_id, product_id)
      end
      return sales_hash
    end

    def self.find(id)
      return self.all[id]
    end

    def vendor
      all_vendors = FarMar::Vendor.all
      all_vendors.select do |vendor, vendor_values|
         vendor_values.id == @vendor_id
          return vendor_values
      end
    end

    def product
      all_products = FarMar::Product.all
      all_products.select do |product, product_values|
        product_values.id == @product_id
        return product_values
      end
    end

    def self.between(beginning_time, end_time) #assuming beginning and end times are given in DateTime format

      between_times = []
      self.all.select do |key, value|
        value.purchase_time >= beginning_time && value.purchase_time <= end_time
          between_times << value
      end
      return between_times
    end

  end
end
