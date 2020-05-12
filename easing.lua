-- easing functions
-- doc_robs

-- easing(t,b,c,d)
-- t = current time
-- b = starting location
-- c = change in location
-- d = total time to finish

function linear_easing(t,b,c,d)
 return c * t / d + b
end

function quad_in(t,b,c,d)
 t /= d
    return c*t*t + b
end

function quad_out(t,b,c,d)
 t /= d
    return -c * t*(t-2) + b
end

function quad_in_out(t,b,c,d)
 t /= d/2
    if (t < 1) return c/2*t*t + b
    t-=1
    return -c/2 * (t*(t-2) - 1) + b
end

function cubic_in(t,b,c,d)
 t /= d
    return c*t*t*t + b
end

function cubic_out(t,b,c,d)
 t /= d
    t-=1
    return c*(t*t*t + 1) + b
end

function cubic_in_out(t,b,c,d)
 t /= d/2
    if (t < 1) return c/2*t*t*t + b
    t-=2
    return c/2*(t*t*t + 2) + b
end

function circular_in(t,b,c,d)
 t /= d
    return -c * (sqrt(1 - t*t) - 1) + b
end

function circular_out(t,b,c,d)
 t /= d
    t-=1
    return c * sqrt(1 - t*t) + b
end

function circular_in_out(t,b,c,d)
 t /= d/2
    if (t < 1) return -c/2 * (sqrt(1 - t*t) - 1) + b
    t-=2
    return c/2 * (sqrt(1 - t*t) + 1) + b
end

function bounce_out(t,b,c,d)
    t/=d
    if t < (1/2.75) then
        return c*(7.5625*t*t) + b
    elseif (t < (2/2.75)) then
        t-=(1.5/2.75)
        return c*(7.5625*t*t + 0.75) + b
    elseif (t < (2.5/2.75)) then
     t-=(2.25/2.75)
        return c*(7.5625*t*t + 0.9375) + b
    else 
        t-=(2.625/2.75)
        return c*(7.5625*t*t + 0.984375) + b
    end
end

function elastic_out(t,b,c,d)
    t/=d
    local ts = t * t
 local tc = ts*t
 return b+c*(33*tc*ts + -106*ts*ts + 126*tc + -67*ts + 15*t)
end

function elastic_in_out(t,b,c,d)
    t/=d
    local ts = t * t
 local tc = ts*t
 if t<0.3 then
     return b+c*(56*tc*ts + -105*ts*ts + 60*tc + -10*ts + 0*t)
 elseif t>0.7 then
  return b+c*(56*tc*ts + -175*ts*ts + 200*tc + -100*ts + 20*t)
 else
        lt=(t-0.3)/0.4   
        lc=0.98884*c       
        lb=b+lc*(0.00558)
     return lc * lt + lb
 end
end