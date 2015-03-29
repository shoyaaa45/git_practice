#奥行き X, 横幅 Y, 高さ Z

#立体取得
ri = gets.chomp.split("")
model = {x: ri[0].to_i , y: ri[1].to_i , z: ri[2].to_i}
#p model

hako = Array.new

#高さ分*奥行き回入力を行う
0.upto(model[:z]-1){|high|
  hei = Array.new

  #奥行き回数分繰り返す
  0.upto(model[:x]){|dep|
    
    input = gets.chomp.split("")
    if input.join != "--" then
      hei[dep] = input 
    else
      inpnothing = Array.new(model[:y],'.')
      dep.upto(model[:x]){|i|
        hei[i] = inpnothing
      }
      break
    end
  }
  hako[high] = hei 
}


#形出力
hako.reverse_each{|hei|
  if hei != nil then
    1.upto(model[:y]){|i|
      pflg = false  
      hei.each{|dep| 
        next if dep == nil
        if dep[i-1] == "#"
          print "#"
          pflg = true
          break
        end
      }
      print "." if pflg == false
      pflg = false
    }
  end 
  puts ""
}
