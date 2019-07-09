"""
    planepoint(point::Point, triangle::Polygon)

Take a triangular plane as a Polygon and a Point within that triangle
and returns the z-value at that point.
"""
function planepoint(point::Point, triangle::Polygon)
    pCoords = point.coordinates
    tCoords = triangle.coordinates

    outer = tCoords[1]
    length(outer) < 4 && throw(error("The outer ring of a Polygon must have 4 or more Points."))

    x = pCoords[1]
    y = pCoords[2]

    x1 = outer[1][1]
    y1 = outer[1][2]
    z1 = outer[1][3]

    x2 = outer[2][1]
    y2 = outer[2][2]
    z2 = outer[2][3]

    x3 = outer[3][1]
    y3 = outer[3][2]
    z3 = outer[3][3]

    return (z3 * (x - x1) * (y - y2) + z1 * (x - x2) * (y - y3) + z2 * (x - x3) * (y - y1) -
            z2 * (x - x1) * (y - y3) - z3 * (x - x2) * (y - y1) - z1 * (x - x3) * (y - y2)) /
           ((x - x1) * (y - y2) + (x - x2) * (y - y3) + (x - x3) * (y - y1) -
           (x - x1) * (y - y3) - (x - x2) * (y - y1) - (x - x3) * (y - y2))
end
