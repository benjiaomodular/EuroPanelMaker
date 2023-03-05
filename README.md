# EuroPanelMaker
Generate eurorack panels in OpenSCAD by @benjiaomodular.

![Template preview](preview.png)

## How to use

#### Step 1: Copy the `EuroPanelMaker` directory into your project directory
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
generatePanel();
```


## Features
TODO: List of features
