function ImageDraw.draw!(img::AbstractArray{T,2}, map::ImageMap, color::T=oneunit(T); mask::Bool=false) where {R,T<:Colorant}
    map_center = (map.x, map.y)
    half_map_size, maybe_extra_pixel = zip(divrem.(size(map.image), 2)...)
    map_offset = CartesianIndex(map_center .- half_map_size)

    p1 = max.(first.(axes(img)), first.(axes(img)) .+ map_offset.I)
    p2 = min.(last.(axes(img)), first.(axes(img)) .+ map_offset.I .+ size(map.image) .- (1, 1))

    rng = CartesianIndices((p1[1]:p2[1], p1[2]:p2[2]))
    copyto!(img, rng, map.image, rng .- map_offset)
    return img
end
