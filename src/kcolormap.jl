using Colors

# Helper function to replicate MATLAB's 1D linear interpolation
function interp1(x, y, xi)
    yi = zeros(length(xi))
    for (i, xv) in enumerate(xi)
        if xv <= x[1]
            yi[i] = y[1]
        elseif xv >= x[end]
            yi[i] = y[end]
        else
            idx = searchsortedlast(x, xv)
            t = (xv - x[idx]) / (x[idx+1] - x[idx])
            yi[i] = y[idx] + t * (y[idx+1] - y[idx])
        end
    end
    return yi
end

"""
    kcolormap(args...)

Generates a custom interpolated colormap from a list of strings, RGB vectors, 
or an Nx3 matrix, and sets it as the default CairoMakie colormap.
"""
function kcolormap(args...)
    ncolors = length(args)
    w = false
    wj = 0
    
    # Parse inputs into a parulacolor matrix[cite: 2]
    if ncolors == 1 && (args[1] isa AbstractMatrix || args[1] isa AbstractVector)
        arg = args[1]
        ncolors = size(arg, 1)
        parulacolor = zeros(ncolors, 3)
        for j in 1:ncolors
            if arg isa AbstractMatrix
                parulacolor[j, :] .= arg[j, 1:3]
            else
                parulacolor[j, :] .= arg[j]
            end
            
            # Check for pure white[cite: 2]
            if parulacolor[j, :] ≈ [1.0, 1.0, 1.0]
                w = true
                wj = j
            end
        end
    else
        parulacolor = zeros(ncolors, 3)
        for j in 1:ncolors
            if args[j] isa AbstractString
                # Relies on the rgb() function defined in the previous step[cite: 2]
                parulacolor[j, :] .= rgb(args[j])
            else
                parulacolor[j, :] .= args[j]
            end
            
            # Check for pure white[cite: 2]
            if parulacolor[j, :] ≈ [1.0, 1.0, 1.0]
                w = true
                wj = j
            end
        end
    end
    
    # Calculate colormap length based on ncolors[cite: 2]
    l = 64 * floor(Int, ncolors / 2)
    rate = range(0.0, 1.0, length=ncolors)
    xi = range(0.0, 1.0, length=l)
    
    # Interpolate each color channel[cite: 2]
    col1 = interp1(rate, parulacolor[:, 1], xi)
    col2 = interp1(rate, parulacolor[:, 2], xi)
    col3 = interp1(rate, parulacolor[:, 3], xi)
    
    # Construct the array of Makie-compatible RGB colors[cite: 2]
    cm = [RGBf(col1[i], col2[i], col3[i]) for i in 1:l]
    
    # Inject an explicit white band if 'white' was requested[cite: 2]
    if w
        # 1-based indexing map for Julia (avoids MATLAB bounds errors at wj=1)
        wrow = round(Int, rate[wj] * l) 
        wrow = max(1, wrow) 
        
        d = 3
        for k in -d:d
            idx = wrow + k
            if 1 <= idx <= l
                cm[idx] = RGBf(1.0, 1.0, 1.0)
            end
        end
    end
    
    # Set the global default figure colormap for CairoMakie[cite: 2]
    set_theme!(colormap = cm)
    
    return cm
end