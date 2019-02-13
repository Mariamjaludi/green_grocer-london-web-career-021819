require 'pry'
def consolidate_cart(cart)
  # code here
  hash = {}
  i = 0
  array = cart.uniq

  while i < array.length
    array[i].each do |key, val|
      hash[key] = val
      count = 0
      cart.each do |v2|
        if v2 == array[i]
          count += 1
        end
        hash[key][:count] = count
      end
    end
    i += 1
  end
  #binding.pry
  hash
end

def apply_coupons(cart, coupons)
  # code here
  checkout_hash = {}
  cart.each do |item, attributes|
    if item == coupons[:item]
      temp = attributes[:count] - coupons[:num]
      checkout_hash["#{item} W/COUPON"] = {
        :price => attributes[:price],
        :clearance => attribute[:clearance],
        :count => 1
      }
    end
    if temp != 0
      checkout_hash[item] = attributes
      checkout_hash[item][:count] = temp
    end
  end

end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
