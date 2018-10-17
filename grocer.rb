require 'pry'

def consolidate_cart(cart)
  out = {}
  cart.each do |item|
    key = item.keys[0]
    # binding.pry
    
    if out.has_key?(key)
      out[key][:count] += 1
    else
      out[key] = item[key]
      out[key][:count] = 1
    end
  end

  out
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.has_key?(coupon[:item])
      cart[coupon[:item]][:count] -= coupon[:num]
      if !cart.has_key?(coupon[:item] + " W/COUPON")
        cart[coupon[:item] + " W/COUPON"] = {
          price: coupon[:cost],
          clearance: cart[coupon[:item]][:clearance],
          count: 1
        }
      else
        cart[coupon[:item] + " W/COUPON"][:count] += 1
      end
    end
  end
  
  cart
end

def apply_clearance(cart)
  cart.each do |key, val|
    if val[:clearance]
      val[:price] -= (val[:price] * .2)
    end
  end
end

def checkout(cart, coupons)
  # code here
end

# consolidate_cart([
#   {"AVOCADO" => {:price => 3.0, :clearance => true }},
#   {"AVOCADO" => {:price => 3.0, :clearance => true }},
#   {"KALE"    => {:price => 3.0, :clearance => false}}
# ])
