# IAM

Proof of concept time/task tracking UI.

## Usage

Currently the application is as simple as it gets.  
You are presented with a textbox where you can right what you have been up to.
*We'll call this an entry.*  
While writing your entry you can select **projects**, **people** and add **times**
of how long this action required.  

 * **#**project  
   Project related to the entry, starts with a hash (#). `#proj-1`, `#proj-2`, etc
 * **@**username  
   Friend or foe you wanna tag, starts with an at sign (@). `@geoah`, `@stek`, etc
 * **+**time  
   How long it took you, starts with a plus sign (+). `+1h15m`, `+45min`, etc

### Desktop Application

The desktop application will not show initially a user interface.  
The user interface can be toggled by the global hotkey `Alt+Shift+A`.
*Note: There is currently an issue with `nw.js` that does not allow to blur the
application so hitting escape or pressing again the global hotkey will hide the
window but will not re-focus the previously focused window.*

## Development

Development requires `nodejs >= v0.10.0` with a couple of globally installed packages.  
A simple `npm install -g yo angular-generator grunt-cli bower` should set everything up for you.

Running `grunt serve` will start a web server accessible on `http://localhost:9000`.  
That should be enough for now as nothing else really works.

## Building

To make the application into an executable you will need to build it and package it.  
Building the application using `grunt build` will create a `./dist` folder with
everything you need.  
After that running `grunt nodewebkit` will take the built and package it nicely
into windows and osx applications inside the `./builds` folder.  
*The first time this might take a while as it will need to download the `nw.js` binaries.*
