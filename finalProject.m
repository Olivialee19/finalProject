function [] = finalProject()
    global color; %Creates a global variable color
    global line; %Creates a global variable line
    color = 'r'; %Sets the default color to red
    line = 'o'; %Sets the default point style to circles
    global graph; %Creates a global variable graph
    graph.fig = figure('numbertitle', 'off', 'name', 'Editable Plot'); %Used to create the figure everything will be plotted on
    graph.editBox_X = uicontrol('style', 'Edit', 'string', '', 'Units', 'normalized', 'Position', [.2 .85 .1 .04], 'backgroundcolor', 'W', 'Tag', 'EditField'); %Allows for the user to input their own x values
    graph.editBox_Y = uicontrol('style', 'Edit', 'string', '', 'Units', 'normalized', 'Position', [.5 .85 .1 .04], 'backgroundcolor', 'W', 'Tag', 'EditField'); %Allows for the user to input their own y values
    graph.label_X = uicontrol('style', 'text', 'units', 'normalized', 'position', [.19 .898 .1 .03], 'string', 'X-Values', 'horizontalalignment', 'right'); %Creates a label to outline that the value under it is the x values
    graph.label_Y = uicontrol('style', 'text', 'units', 'normalized', 'position', [.49 .898 .1 .03], 'string', 'Y-Values', 'horizontalalignment', 'right'); %Creates a label to outline that the value under it is the y values
    graph.editBox_X_lims = uicontrol('style', 'Edit', 'string', '', 'Units', 'normalized', 'Position', [.35 .85 .1 .04], 'backgroundcolor', 'W', 'Tag', 'EditField'); %Allows for the user to input their own x limits
    graph.editBox_Y_lims = uicontrol('style', 'Edit', 'string', '', 'Units', 'normalized', 'Position', [.65 .85 .1 .04], 'backgroundcolor', 'W', 'Tag', 'EditField'); %Allows for the user to input their own y limits
    graph.label_X_lims = uicontrol('style', 'text', 'units', 'normalized', 'position', [.329 .898 .1 .03], 'string', 'X-lims', 'horizontalalignment', 'right'); %Creates a label to outline that the value under it is the x limits
    graph.label_Y_lims = uicontrol('style', 'text', 'units', 'normalized', 'position', [.629 .898 .1 .03], 'string', 'Y-lims', 'horizontalalignment', 'right'); %Creates a label to outline that the value under it is the y limits
    graph.title = uicontrol('style', 'Edit', 'string', '', 'Units', 'normalized', 'Position', [.34 .95 .3 .05], 'backgroundcolor', 'W', 'Tag', 'EditField'); %Allows for the user to input their own plot title
    graph.label_title = uicontrol('style', 'text', 'units', 'normalized', 'position', [.2 .94 .1 .05], 'string', 'Plot Title', 'horizontalalignment', 'right'); %Creates a label of the plot title input box
    graph.editBox_X_axis_title = uicontrol('style', 'Edit', 'string', '', 'Units', 'normalized', 'Position', [.8 .85 .1 .04], 'backgroundcolor', 'W', 'Tag', 'EditField'); %Allows for the user to input their own x-axis title
    graph.editBox_Y_axis_title = uicontrol('style', 'Edit', 'string', '', 'Units', 'normalized', 'Position', [.05 .85 .1 .04], 'backgroundcolor', 'W', 'Tag', 'EditField'); %Allows for the user to input their own y-axis title
    graph.label_X_axis = uicontrol('style', 'text', 'units', 'normalized', 'position', [.8 .898 .1 .03], 'string', 'X-axis Title', 'horizontalalignment', 'right'); %Creates a label of the X-axis title input box
    graph.label_Y_axis = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .898 .1 .03], 'string', 'Y-axis Title', 'horizontalalignment', 'right'); %Creates a label of the Y-axis title input box
    graph.color_button_group = uibuttongroup('visible', 'on', 'unit', 'normalized', 'position', [.15 .02 .4 .05], 'selectionchangedfcn', {@colorButtonGroup}); %Creates a button group for color changes 
    graph.color_B1 = uicontrol(graph.color_button_group, 'style', 'radiobutton', 'units', 'normalized', 'position', [.07 .1 1 1],'string', 'Red', 'handlevisibility', 'off'); %Creates a button for the user to be able to switch the color to red
    graph.color_B2 = uicontrol(graph.color_button_group, 'style', 'radiobutton', 'units', 'normalized', 'position', [.38 .1 1 1],'string', 'Blue', 'handlevisibility', 'off'); %Creates a button for the user to be able to switch the color to blue
    graph.color_B3 = uicontrol(graph.color_button_group, 'style', 'radiobutton', 'units', 'normalized', 'position', [.7 .1 1 1],'string', 'Green', 'handlevisibility', 'off'); %Creates a button for the user to be able to switch the color to green
    graph.line_button_group = uibuttongroup('visible', 'on', 'unit', 'normalized', 'position', [.54 .02 .4 .05], 'selectionchangedfcn', {@lineButtonGroup}); %Creates a button group for line style changes 
    graph.line_B1 = uicontrol(graph.line_button_group, 'style', 'radiobutton', 'units', 'normalized', 'position', [.05 .1 1 1], 'string', 'Circles', 'handlevisibility', 'off'); %Creates a button for the user to be able to switch the line style to circles
    graph.line_B2 = uicontrol(graph.line_button_group, 'style', 'radiobutton', 'units', 'normalized', 'position', [.34 .1 1 1], 'string', 'Diamonds', 'handlevisibility', 'off'); %Creates a button for the user to be able to switch the line style to dashes
    graph.line_B3 = uicontrol(graph.line_button_group, 'style', 'radiobutton', 'units', 'normalized', 'position', [.7 .1 1 1], 'string', 'Stars', 'handlevisibility', 'off'); %Creates a button for the user to be able to switch the line style to stars
    graph.resetButton = uicontrol( 'style', 'pushbutton', 'units', 'normalized', 'position', [.7 .95 .13 .05], 'string', 'Reset Plot', 'callback', {@resetButton}); %Creates a button that's callback is the resetButton function
    ax = axes(graph.fig); %Creates a graph on the figure
    ax.Units = 'normalized'; %Matches the units with the rest of the units used in the function
    ax.Position = [.08 .18 .85 .6]; %Positions the graph 
    c = uicontrol; %Creates a new ui control
    c.String = 'Plot Data'; %Creates a Plot Data button
    c.Callback = @plotData; %Sets the callback of that button to the plotData function
    function [] = plotData(~, ~) %General plotData function
        x = str2num(graph.editBox_X.String); %Converts the string values of x to numbers 
        y = str2num(graph.editBox_Y.String); %Converts the string values of y to numbers
        if ~isempty(char(regexp(graph.editBox_X.String, '[^\-0-9,\.]'))) %Checks to see if the inputed x-values are valid
            msgbox('Invalid Input!', 'X Value Input Error', 'error', 'modal'); %Presents an error message if the x-values are not valid 
            return
        end
        if ~isempty(char(regexp(graph.editBox_Y.String, '[^\-0-9,\.]'))) %Checks to see if the inputed y-values are valid
            msgbox('Invalid Input!', 'Y Value Input Error', 'error', 'modal'); %Presents an error message if the y-values are not valid
            return
        end
        if length(x) ~= length(y) %Checks to see if the amount of x-values and y-values are the same
            msgbox('Invalid Input!', 'Amount of Values Differ!', 'error', 'modal'); %Presents an error message if the amount of x-values and y-values are not the same
            return
        end
        plot(x, y, [color line]); %General plot function for the graph
        xlims = str2num(graph.editBox_X_lims.String); %Converts the string values for X-lims given by the user to numbers
        ylims = str2num(graph.editBox_Y_lims.String); %Converts the string values for Y-lims given by the user to numbers
        if length(xlims) == 2 && xlims(1)< xlims(2) %Checks to see if the limit values are equal to 2 thus determining if the values given are a valid limit
           xlim([xlims(1) xlims(2)]); %Sets the x limit to what the user inputed
        elseif ~isempty(xlims) == 0 %Checks to see if the user did not input any x limit
        else 
            msgbox('Bad X-Lim Input', 'Ignored', 'error', 'modal'); %Spits out an error message if the limit that was inputed was invalid
        end
        if length(ylims) == 2 && ylims(1)< ylims(2) %Checks to see if the limit values are equal to 2 thus determining if the values given are a valid limit
            ylim([ylims(1) ylims(2)]); %Sets the y limit to what the user inputed
        elseif ~isempty(ylims) == 0 %Checks to see if the user did not input any y limit
        else
            msgbox('Bad Y-Lim Input', 'Ignored', 'error', 'modal'); %Spits out an error message if the limit that was inputed was invalid
        end
        xlabel(graph.editBox_X_axis_title.String); %Creates the x-axis title
        ylabel(graph.editBox_Y_axis_title.String); %Creates the y-axis title
        title(graph.title.String); %Creates the plot title
    end
    function [] = colorButtonGroup(~, event) %Creates a function that takes what the user chose for point color and applies it to the plot
        if strcmp('Red', event.NewValue.String) %Does a string comparison to what the user chose
            color = 'r'; %Sets the color of the points to red
        elseif strcmp('Blue', event.NewValue.String) %Does a string comparison to what the user chose
            color = 'b'; %Sets the color of the points to blue
        else 
            color = 'g'; %Sets the color of the points to green
        end
    end
    function [] = lineButtonGroup(~, event) %Creates a function that takes what the user chose for point style and applies it to the plot
        if strcmp('Circles', event.NewValue.String) %Does a string comparison to what the user chose
            line = 'o'; %Sets points style to circles
        elseif strcmp('Diamonds', event.NewValue.String) %Does a string comparison to what the user chose
            line = 'd'; %Sets points style to diamonds
        else
            line = '*'; %Sets points style to stars
        end
    end
    function [] = resetButton(~, ~) %Reset Button function 
       hold off;
       plot(0,0); %Makes the plot blank
       graph.editBox_X.String = ''; %Sets the X Values edit box blank
       graph.editBox_Y.String = ''; %Sets the Y Values edit box blank
       graph.editBox_X_lims.String = ''; %Sets the X limit edit box blank
       graph.editBox_Y_lims.String = ''; %Sets the Y limit edit box blank
       graph.title.String = ''; %Sets the title edit box blank
       graph.editBox_X_axis_title.String = ''; %Sets the X axis title edit box blank
       graph.editBox_Y_axis_title.String = ''; %Sets the Y axis title edit box blank
       return
    end
        
end