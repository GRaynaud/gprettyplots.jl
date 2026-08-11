"""
    glineplot(x, y; kwargs...)

A wrapper to make a quick and pretty scatter plot in CairoMakie, mapping directly 
to the MATLAB gscatterplot functionality. Returns a tuple `(fig, ax, hcb)`.
"""
function glineplot(x, y;
    xerr = nothing,
    yerr = nothing,
    color = rgb("canard"), # Relies on the previously defined rgb() function
    linewidth = 1.5,
    xlabel = "",
    ylabel = "",
    figposition = (560, 420), # Converted from MATLAB's [left bottom width height] to Makie's (width, height)
    xlim = nothing,
    ylim = nothing,
    plotindex = nothing,
    dark_mode = false,
    figurehandle = nothing
)
    # Define color scheme based on dark_mode[cite: 3]
    if dark_mode
        text_color = rgb("white")
        background_color = rgb("black")
        errorbar_color = rgb("white")
    else    
        text_color = rgb("black")
        background_color = rgb("white")
        errorbar_color = rgb("black")
    end

    # Handle figure and axis generation[cite: 3]
    if isnothing(figurehandle)
        fig = Figure(size = figposition, backgroundcolor = background_color)
        ax = Axis(fig[1, 1], 
            backgroundcolor = background_color,
            xlabel = xlabel, 
            ylabel = ylabel,
            xlabelsize = 16, 
            ylabelsize = 16,
            xlabelcolor = text_color, 
            ylabelcolor = text_color,
            xtickcolor = text_color, 
            ytickcolor = text_color,
            bottomspinecolor = text_color, 
            leftspinecolor = text_color,
            xticklabelcolor = text_color, 
            yticklabelcolor = text_color
        )
    else
        # In Makie, appending to an existing plot usually means passing the Figure and Axis
        fig, ax = figurehandle 
    end

    # Filter data by plotindex[cite: 3]
    if !isnothing(plotindex)
        # Assertions to ensure plotindex contains strictly positive integers within bounds[cite: 3]
        @assert all(isinteger.(plotindex)) "plotindex contains non integer values"
        @assert maximum(plotindex) <= length(x) "plotindex contains values greater than the length of submitted data"
        @assert minimum(plotindex) > 0 "plotindex contains non-strictly positive values"
        pti = Int.(plotindex)
    else
        pti = 1:length(x)
    end

    # Subset the x and y data[cite: 3]
    x_plot = x[pti]
    y_plot = y[pti]

    # Plot errorbars in the background[cite: 3]
    if !isnothing(xerr)
        x_err_plot = xerr isa AbstractArray ? xerr[pti] : xerr
        errorbars!(ax, x_plot, y_plot, x_err_plot, direction = :x, color = errorbar_color)
    end
    if !isnothing(yerr)
        y_err_plot = yerr isa AbstractArray ? yerr[pti] : yerr
        errorbars!(ax, x_plot, y_plot, y_err_plot, direction = :y, color = errorbar_color)
    end
    

    # Plot line
    lp = plot!(ax,x_plot,y_plot, color = color, linewidth = linewidth)



    # Set axis limits[cite: 3]
    if !isnothing(xlim)
        xlims!(ax, xlim[1], xlim[2])
    end
    if !isnothing(ylim)
        ylims!(ax, ylim[1], ylim[2])
    end

    return fig, ax, hcb
end