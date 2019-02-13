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
  result = {}

  cart.each do |key, val|
    coupons.each do |coupon|
      if key == coupon[:item] && val[:count] >= coupon[:num]
        val[:count] -= coupon[:num]
        if result["#{key} W/COUPON"]
          result["#{key} W/COUPON"][:count] += 1
        else
          result["#{key} W/COUPON"] = {
            :price => coupon[:cost],
            :clearance => val[:clearance],
            :count => 1
          }
        end
      end
    end
    result[key] = val
  end
  result
end

def apply_clearance(cart)
  # code here
  cart.each do |item, attributes|
    #binding.pry
    if attributes[:clearance] == true
      attributes[:price] = attributes[:price] * 4/5
    end
  end
  #binding.pry
  cart
end

def checkout(cart, coupons)
  # code here
  cart = consolidate_cart(cart: cart)
  binding.pry
  cart = apply_coupons(cart: cart, coupons: coupons)
  cart = apply_clearance(cart: cart)
  total = 0
  cart.each do |item, attributes|
    total = total + attributes[:cost] * attributes[:count]
  end
  if total > 100
    total = total * 9/10
  end
  total
end
