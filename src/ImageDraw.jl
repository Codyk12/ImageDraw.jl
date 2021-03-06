module ImageDraw

# package code goes here
using ImageCore, Distances

include("core.jl")
include("line2d.jl")
include("ellipse2d.jl")
include("circle2d.jl")
include("paths.jl")
include("cross.jl")
include("imagemap.jl")

if v"1.0" <= VERSION < v"1.1"
    isnothing(x) = x===nothing
end

#export methods
export
	draw,
	draw!,
	generatecanvas,
	bresenham,
	xiaolin_wu

#export types
export
	#Drawable
	Drawable,

	#backgrounds
	SolidBackground,
	StripedBackground,

	#Point
	Point,

	#Lines
	LineNormal,
	LineTwoPoints,

	#LineSegment
	LineSegment,

	#Ellipse
	Ellipse,

	#Circles
	CirclePointRadius,
	CircleThreePoints,

	#Path
	Path,

	#Polygons
	Polygon,
	RegularPolygon,

	#Cross
	Cross,

	# Map of image
	ImageMap


end # module
