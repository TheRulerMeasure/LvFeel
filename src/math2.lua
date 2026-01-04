-- math2 --

local aabbOverlap = function (x1, y1, w1, h1, x2, y2, w2, h2)
    return not (x1 > x2+w2 or x1+w1 < x2 or y1 > y2+h2 or y1+h1 < y2)
end

local rectOverlap = function (r1, r2)
    return aabbOverlap(r1.x, r1.y, r1.width, r1.height, r2.x, r2.y, r2.width, r2.height)
end

return {
    aabbOverlap = aabbOverlap,
    rectOverlap = rectOverlap,
}
