"""

Places an smaller image on the given image, only places pixels with in the image.
"""

ImageDraw.draw!(img::AbstractArray{T,2}, map::ImageMap) where {T<: Colorant} = draw!(img::AbstractArray{T,2}, map::ImageMap, oneunit(T))

function ImageDraw.draw!(img::AbstractArray{T,2}, map::ImageMap, color::R; mask::Bool=false) where {R,T<:Colorant}
    size(img) < size(map.image) && error("BitMap must have a smaller image than the canvas image.")
    n_, m_ = size(map.image)
    n, m = size(img)

    x = map.x
    y = map.y

    (x <=0 || y <= 0) && error("Position needs to be positive")
    (x + n_ > n || y + m_ > m) && error("BitMap is not contained within the Image")

    mask ? (img[x:x+n_,y:y+m_] .= color; return img) : nothing

    img[x:x+n_,y:y+m_] = map.image
    img
end
