# EuroPanelMaker
Eurorack panel generator for OpenSCAD by [@benjiaomodular](https://www.instagram.com/benjiaomodular/).

![Template preview](preview.png)

## How to use

#### Step 1: Copy the `EuroPanelMaker` folder into your project directory
![Project dir](projectdir.png)

#### Step 2: Include the `panel.scad` file into your project.
```
include <EuroPanelMaker/panel.scad>
```

#### Step 3: Define variables
```
hp = 4;
title = "VCA";
text_depth = 1.6;

// x (in HP column), y (mm), label, rotation (degrees)
pots = [
    [2, 95, "CV AMT"]]; 

// x (in HP column), y (mm), diameter (mm)
leds = [
    [3, 35, 3]]; 
    
// x (in HP column), y (mm), label, rotation (degrees)
jacks = [
    [1, 18, "In"] ,
    [3, 18, "Out"],
    [1, 35, "CV"]]; 

panel_flipped = false;
```

#### Step 4: Call the generatePanel function
```
generatePanel();erminal
```

## Features
TODO: List of features

## Examples
You can use `template.scad` as a starting point for your project.

I have included my own panels under `examples/benjiaomodular` for reference. Feel free to add a folder and submit a pull request if you'd like to include your own panels. 

### benjiaomodular
| Name   |      SCAD file      | Preview |
|----------|:-------------:|:------:|
| bong0 | [bong0.scad](examples/benjiaomodular/bong0.scad) | ![Bong0 Preview](examples/benjiaomodular/bong0.png) |
| ce2lfo | [ce2lfo.scad](examples/benjiaomodular/ce2lfo.scad) | ![CE2LFO Preview](examples/benjiaomodular/ce2lfo.png) |
| gate2trig | [gate2trig.scad](examples/benjiaomodular/gate2trig.scad) | ![Gate2Trig Preview](examples/benjiaomodular/gate2trig.png)|
| oras | [oras.scad](examples/benjiaomodular/oras.scad) | ![Oras Preview](examples/benjiaomodular/oras.png)|
| squares | [squares.scad](examples/benjiaomodular/squares.scad) | ![Squares Preview](examples/benjiaomodular/squares.png)|
| vca | [vca.scad](examples/benjiaomodular/vca.scad) | ![VCA Preview](examples/benjiaomodular/vca.png)|
| wavefolder | [wavefolder.scad](examples/benjiaomodular/wavefolder.scad) | ![Wavefolder Preview](examples/benjiaomodular/wavefolder.png)|
