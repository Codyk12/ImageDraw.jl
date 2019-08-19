"""

Places an smaller image on the given image, only places pixels with in the image.
"""

ImageDraw.draw!(img::AbstractArray{T,2}, map::ImageMap) where {T<: Colorant} = draw!(img::AbstractArray{T,2}, map::ImageMap, oneunit(T))

function ImageDraw.draw!(img::AbstractArray{T,2}, map::ImageMap, color::R, mask::Bool=false) where {R,T<:Colorant}
    size(img) < size(map.image) && error("ImageMap must have a smaller image than the canvas image.")
    s = size(map.image)
    n = size(img)[1]
    x = map.x - div(s[1], 2)
    y = map.y - div(s[2], 2)

    x_start = max(x, 1)
    y_start = max(y, 1)

    x_end = min(x+s[1]-1, n)
    y_end = min(y+s[2]-1, n)

    mask ? (img[x_start:x_end,y_start:y_end] .= color; return img) : nothing

    m_x_start = x_start == 1 ? x_start - x + 1 : 1
    m_y_start = y_start == 1 ? y_start - y + 1 : 1

    m_x_end = x_end == n ? x+s[1]-1 - n : 0
    m_y_end = y_end == n ? y+s[2]-1 - n : 0

    img[x_start:x_end,y_start:y_end] = map.image[m_x_start:end-m_x_end,m_y_start:end-m_y_end]

    img
end
