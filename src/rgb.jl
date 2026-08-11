# 1. Raw color list matching the exact groupings of the original MATLAB code
const RAW_COLORS = [
    # White colors
    ("FF","FF","FF", "White"), ("FF","FA","FA", "Snow"), ("F0","FF","F0", "Honeydew"),
    ("F5","FF","FA", "MintCream"), ("F0","FF","FF", "Azure"), ("F0","F8","FF", "AliceBlue"),
    ("F8","F8","FF", "GhostWhite"), ("F5","F5","F5", "WhiteSmoke"), ("FF","F5","EE", "Seashell"),
    ("F5","F5","DC", "Beige"), ("FD","F5","E6", "OldLace"), ("FF","FA","F0", "FloralWhite"),
    ("FF","FF","F0", "Ivory"), ("FA","EB","D7", "AntiqueWhite"), ("FA","F0","E6", "Linen"),
    ("FF","F0","F5", "LavenderBlush"), ("FF","E4","E1", "MistyRose"),
    # Grey colors
    ("80","80","80", "Gray"), ("DC","DC","DC", "Gainsboro"), ("D3","D3","D3", "LightGray"),
    ("C0","C0","C0", "Silver"), ("A9","A9","A9", "DarkGray"), ("69","69","69", "DimGray"),
    ("77","88","99", "LightSlateGray"), ("70","80","90", "SlateGray"), ("2F","4F","4F", "DarkSlateGray"),
    ("00","00","00", "Black"),
    # Red colors
    ("FF","00","00", "Red"), ("FF","A0","7A", "LightSalmon"), ("FA","80","72", "Salmon"),
    ("E9","96","7A", "DarkSalmon"), ("F0","80","80", "LightCoral"), ("CD","5C","5C", "IndianRed"),
    ("DC","14","3C", "Crimson"), ("B2","22","22", "FireBrick"), ("8B","00","00", "DarkRed"),
    # Pink colors
    ("FF","C0","CB", "Pink"), ("FF","B6","C1", "LightPink"), ("FF","69","B4", "HotPink"),
    ("FF","14","93", "DeepPink"), ("DB","70","93", "PaleVioletRed"), ("C7","15","85", "MediumVioletRed"),
    # Orange colors
    ("FF","A5","00", "Orange"), ("FF","8C","00", "DarkOrange"), ("FF","7F","50", "Coral"),
    ("FF","63","47", "Tomato"), ("FF","45","00", "OrangeRed"),
    # Yellow colors
    ("FF","FF","00", "Yellow"), ("FF","FF","E0", "LightYellow"), ("FF","FA","CD", "LemonChiffon"),
    ("FA","FA","D2", "LightGoldenrodYellow"), ("FF","EF","D5", "PapayaWhip"), ("FF","E4","B5", "Moccasin"),
    ("FF","DA","B9", "PeachPuff"), ("EE","E8","AA", "PaleGoldenrod"), ("F0","E6","8C", "Khaki"),
    ("BD","B7","6B", "DarkKhaki"), ("FF","D7","00", "Gold"),
    # Brown colors
    ("A5","2A","2A", "Brown"), ("FF","F8","DC", "Cornsilk"), ("FF","EB","CD", "BlanchedAlmond"),
    ("FF","E4","C4", "Bisque"), ("FF","DE","AD", "NavajoWhite"), ("F5","DE","B3", "Wheat"),
    ("DE","B8","87", "BurlyWood"), ("D2","B4","8C", "Tan"), ("BC","8F","8F", "RosyBrown"),
    ("F4","A4","60", "SandyBrown"), ("DA","A5","20", "Goldenrod"), ("B8","86","0B", "DarkGoldenrod"),
    ("CD","85","3F", "Peru"), ("D2","69","1E", "Chocolate"), ("8B","45","13", "SaddleBrown"),
    ("A0","52","2D", "Sienna"), ("80","00","00", "Maroon"),
    # Green colors
    ("00","80","00", "Green"), ("98","FB","98", "PaleGreen"), ("90","EE","90", "LightGreen"),
    ("9A","CD","32", "YellowGreen"), ("AD","FF","2F", "GreenYellow"), ("7F","FF","00", "Chartreuse"),
    ("7C","FC","00", "LawnGreen"), ("00","FF","00", "Lime"), ("32","CD","32", "LimeGreen"),
    ("00","FA","9A", "MediumSpringGreen"), ("00","FF","7F", "SpringGreen"), ("66","CD","AA", "MediumAquamarine"),
    ("7F","FF","D4", "Aquamarine"), ("20","B2","AA", "LightSeaGreen"), ("3C","B3","71", "MediumSeaGreen"),
    ("2E","8B","57", "SeaGreen"), ("8F","BC","8F", "DarkSeaGreen"), ("22","8B","22", "ForestGreen"),
    ("00","64","00", "DarkGreen"), ("6B","8E","23", "OliveDrab"), ("80","80","00", "Olive"),
    ("55","6B","2F", "DarkOliveGreen"), ("00","80","80", "Teal"),
    # Blue colors
    ("00","00","FF", "Blue"), ("AD","D8","E6", "LightBlue"), ("B0","E0","E6", "PowderBlue"),
    ("AF","EE","EE", "PaleTurquoise"), ("40","E0","D0", "Turquoise"), ("48","D1","CC", "MediumTurquoise"),
    ("00","CE","D1", "DarkTurquoise"), ("E0","FF","FF", "LightCyan"), ("00","FF","FF", "Cyan"),
    ("00","FF","FF", "Aqua"), ("00","8B","8B", "DarkCyan"), ("5F","9E","A0", "CadetBlue"),
    ("B0","C4","DE", "LightSteelBlue"), ("46","82","B4", "SteelBlue"), ("87","CE","FA", "LightSkyBlue"),
    ("87","CE","EB", "SkyBlue"), ("00","BF","FF", "DeepSkyBlue"), ("1E","90","FF", "DodgerBlue"),
    ("64","95","ED", "CornflowerBlue"), ("41","69","E1", "RoyalBlue"), ("00","00","CD", "MediumBlue"),
    ("00","00","8B", "DarkBlue"), ("00","00","80", "Navy"), ("19","19","70", "MidnightBlue"),
    # Purple colors
    ("80","00","80", "Purple"), ("E6","E6","FA", "Lavender"), ("D8","BF","D8", "Thistle"),
    ("DD","A0","DD", "Plum"), ("EE","82","EE", "Violet"), ("DA","70","D6", "Orchid"),
    ("FF","00","FF", "Fuchsia"), ("FF","00","FF", "Magenta"), ("BA","55","D3", "MediumOrchid"),
    ("93","70","DB", "MediumPurple"), ("99","66","CC", "Amethyst"), ("8A","2B","E2", "BlueViolet"),
    ("94","00","D3", "DarkViolet"), ("99","32","CC", "DarkOrchid"), ("8B","00","8B", "DarkMagenta"),
    ("6A","5A","CD", "SlateBlue"), ("48","3D","8B", "DarkSlateBlue"), ("7B","68","EE", "MediumSlateBlue"),
    ("4B","00","82", "Indigo"),
    # Grey colors (Alternative spelling)
    ("80","80","80", "Grey"), ("D3","D3","D3", "LightGrey"), ("A9","A9","A9", "DarkGrey"),
    ("69","69","69", "DimGrey"), ("77","88","99", "LightSlateGrey"), ("70","80","90", "SlateGrey"),
    ("2F","4F","4F", "DarkSlateGrey"),
    # EPFL colors
    ("A6","A6","A6", "EPFLgray"), ("ED","1C","24", "EPFLred"), ("17","37","5E", "EPFLblue"),
    ("B5","1F","1F", "groseille"), ("00","A7","9F", "leman"), ("00","74","80", "canard"),
    ("41","3D","3A", "ardoise"), ("45","3A","4C", "taupe"), ("CA","C7","C7", "perle"),
    ("F3","98","69", "montrose"), ("C2","DD","B0", "vertdeau"), ("ED","6E","9C", "rose"),
    ("4F","8F","CC", "acier"), ("FB","EE","66", "soufre"), ("EC","66","08", "carotte"),
    ("5C","24","83", "zinzolin"), ("C8","D3","00", "chartreuse"), ("5B","34","28", "marron")
]

# 2. Conversion and State Initialization
function hex_to_rgb_aesthetic(hex_str::String)
    val = parse(Int, hex_str, base=16)
    # Replicating the aesthetic math: interpolate F0--FF linearly from 240/256 to 1.0
    if val < 240
        return val / 256.0
    else
        return ((val - 240) / 15.0 + 15.0) / 16.0
    end
end

const COLOR_DICT = Dict{String, NTuple{3, Float64}}()
const COLOR_LIST = Vector{NamedTuple{(:name, :rgb), Tuple{String, NTuple{3, Float64}}}}()

# Populate the dictionary and list exactly once
for (r, g, b, name) in RAW_COLORS
    rgb_tuple = (hex_to_rgb_aesthetic(r), hex_to_rgb_aesthetic(g), hex_to_rgb_aesthetic(b))
    COLOR_DICT[lowercase(name)] = rgb_tuple
    push!(COLOR_LIST, (name=name, rgb=rgb_tuple))
end


# 3. Main lookup function
"""
    rgb(s::String)

Returns the (r, g, b) tuple corresponding to the color named `s`.
If `s` is "chart", it will render a Makie figure showing all colors.
"""
function rgb(s::String)
    s_lower = lowercase(s)
    if s_lower == "chart"
        return showcolors()
    elseif haskey(COLOR_DICT, s_lower)
        return COLOR_DICT[s_lower]
    else
        error("Unknown color: $s")
    end
end


# 4. Makie Chart function
function showcolors()
    # Identical structural groups to the MATLAB file
    group_names = ["White", "Gray", "Red", "Pink", "Orange", "Yellow", "Brown", 
                   "Green", "Blue", "Purple", "Grey", "EPFLgray"]
    
    # Locate the starting index of each group
    indices = Int[]
    for g in group_names
        idx = findfirst(c -> lowercase(c.name) == lowercase(g), COLOR_LIST)
        push!(indices, idx)
    end
    push!(indices, length(COLOR_LIST) + 1) 
    
    # Define columns by combining group indices
    col_breaks = [1, 3, 6, 8, 9, 10, 11, 13] 
    
    fig = Figure(size = (1200, 800))
    ax = Axis(fig[1, 1], aspect = DataAspect())
    hidedecorations!(ax)
    hidespines!(ax)
    
    # Find the maximum column depth to normalize heights
    N_max = 0
    for i in 1:(length(col_breaks)-1)
        items_in_col = indices[col_breaks[i+1]] - indices[col_breaks[i]] + (col_breaks[i+1] - col_breaks[i]) * 1.5
        N_max = max(N_max, ceil(Int, items_in_col))
    end
    
    h = 1.0 / N_max
    w = 1.0 / (length(col_breaks) - 1)
    d = w / 30.0
    
    x = 0.0
    for col in 1:(length(col_breaks)-1)
        y = 1.0 - h
        
        for i in col_breaks[col]:(col_breaks[col+1]-1)
            group_title = group_names[i] == "EPFLgray" ? "EPFL colors" : "$(group_names[i]) colors"
            
            # Group Header
            text!(ax, Point2f(x + w/2, y + h/10); text = group_title, 
                  align = (:center, :bottom), font = :bold, fontsize = 14)
            y -= h
            
            # Iterate through colors
            for k in indices[i]:(indices[i+1]-1)
                c_name = COLOR_LIST[k].name
                c_rgb = COLOR_LIST[k].rgb
                
                # Dynamic text color thresholding based on background luminosity
                bright = (c_rgb[1] + 2*c_rgb[2] + c_rgb[3]) / 4.0
                txtcolor = bright < 0.5 ? :white : :black
                
                # Draw the color block and label
                poly!(ax, Rect2f(x + d, y, w - 2*d, h), color = c_rgb)
                text!(ax, Point2f(x + w/2, y + h/2); text = c_name, color = txtcolor,
                      align = (:center, :center), fontsize = 11)
                
                y -= h
            end
            y -= 0.3 * h # Margins between groups
        end
        x += w
    end
    
    xlims!(ax, 0, 1)
    ylims!(ax, 0, 1)
    
    return fig
end