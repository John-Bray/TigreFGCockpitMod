# Tigre display drivers by Warty, 2021

var com1_display = {
  canvas_settings: {
      "name": "COM1_f",
      "size": [512, 512],
      "view": [512, 128],
      "mipmapping": 1
  },
  new: func(placement)  # create a new canvas...
  {
    var m = { parents: [com1_display],
    canvas: canvas.new(com1_display.canvas_settings)
  };
    m.canvas.addPlacement({"node": "canvas_COM1_frequency"});
    m.canvas.setColorBackground(0,0,0.1, 1);
    m.comf  = props.globals.getNode("instrumentation/comm/frequencies/selected-mhz-fmt");
    m.comfs = props.globals.getNode("instrumentation/comm/frequencies/standby-mhz-fmt");
    var g = m.canvas.createGroup();
    m.Com1_Freq =
      g.createChild("text", "line-title")
       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
       .setColor(1,1,0,1)
       .setColorFill(0,0,0,1)
       .setAlignment("center-center")
       .setFont("7-Segment.ttf")
       .setFontSize(8, 0.5)
       .setTranslation(256, 64);
    return m;
  },
  update: func()
  {
  var com1_text = '  ' ~ me.comf.getValue() ~ '      ' ~ me.comfs.getValue() ;
    me.Com1_Freq.setText(com1_text);
    settimer(func me.update(), 0.1);
  },
};



var com2_display = {
  canvas_settings: {
      "name": "COM2_f",
      "size": [512, 512],
      "view": [512, 128],
      "mipmapping": 1
  },
  new: func(placement)  # create a new canvas...
  {
    var m = { parents: [com2_display],
    canvas: canvas.new(com2_display.canvas_settings)
  };
    m.canvas.addPlacement({"node": "canvas_COM2_frequency"});
    m.canvas.setColorBackground(0,0,0.1, 1);
    m.comf  = props.globals.getNode("instrumentation/comm[1]/frequencies/selected-mhz-fmt");
    m.comfs = props.globals.getNode("instrumentation/comm[1]/frequencies/standby-mhz-fmt");
    var g = m.canvas.createGroup();
    m.Com2_Freq =
      g.createChild("text", "line-title")
       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
       .setColor(1,1,0,1)
       .setColorFill(0,0,0,1)
       .setAlignment("center-center")
       .setFont("7-Segment.ttf")
       .setFontSize(8, 0.5)
       .setTranslation(256, 64);
    return m;
  },
  update: func()
  {
  var com2_text = '  ' ~ me.comf.getValue() ~ '      ' ~ me.comfs.getValue() ;
    me.Com2_Freq.setText(com2_text);
    settimer(func me.update(), 0.1);
  },
};


var nav1_display = {
  canvas_settings: {
      "name": "NAV1_f",
      "size": [512, 512],
      "view": [512, 128],
      "mipmapping": 1
  },
  new: func(placement)  # create a new canvas...
  {
    var m = { parents: [nav1_display],
    canvas: canvas.new(nav1_display.canvas_settings)
  };
    m.canvas.addPlacement({"node": "canvas_NAV1_frequency"});
    m.canvas.setColorBackground(0,0,0.1, 1);
    var g = m.canvas.createGroup();
    m.Nav1_Freq =
      g.createChild("text", "line-title")
       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
       .setColor(1,1,0,1)
       .setColorFill(0,0,0,1)
       .setAlignment("center-center")
       .setFont("7-Segment.ttf")
       .setFontSize(8, 0.5)
       .setTranslation(256, 64);
    return m;
  },
  update: func()
  {
  var nav1_text = '  ' ;
  var nav1_use = sprintf("%4.2f", getprop("/instrumentation/nav/frequencies/selected-mhz"));
  var nav1_sby = sprintf("%4.2f", getprop("/instrumentation/nav/frequencies/standby-mhz-fmt"));
      nav1_text = nav1_text ~ nav1_use ~ '     ' ~ nav1_sby  ;
    me.Nav1_Freq.setText(nav1_text);
    settimer(func me.update(), 0.1);
  },
};
# print (getprop("instrumentation/nav/frequencies/selected-mhz-fmt"));


var iff_display = {
  canvas_settings: {
      "name": "iff",
      "size": [512, 512],
      "view": [512, 128],
      "mipmapping": 1
  },
  new: func(placement)  # create a new canvas...
  {
    var m = { parents: [iff_display],
    canvas: canvas.new(iff_display.canvas_settings)
  };
    m.canvas.addPlacement({"node": "canvas_IFF_squawk"});
    m.canvas.setColorBackground(0,0,0.1, 1);
    var g = m.canvas.createGroup();
    m.IFF_id =
      g.createChild("text", "line-title")
       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
       .setColor(1,1,0,1)
       .setColorFill(0,0,0,1)
       .setAlignment("center-center")
       .setFont("7-Segment.ttf")
       .setFontSize(8, 0.5)
       .setTranslation(256, 64);
    return m;
  },
  update: func()
  {
    var iff_text = getprop("/instrumentation/transponder/inputs/digit[3]") ~ '     ';
    iff_text = iff_text ~ getprop("/instrumentation/transponder/inputs/digit[2]") ~ '     ';
    iff_text = iff_text ~ getprop("/instrumentation/transponder/inputs/digit[1]") ~ '     ';
    iff_text = iff_text ~ getprop("/instrumentation/transponder/inputs/digit");
    me.IFF_id.setText(iff_text);
    settimer(func me.update(), 0.1);
  },
};

# ========================================================================== Route Manager
var nav_display = {
  canvas_settings: {
    "name": "navDisplay",
    "size": [512, 512],
    "view": [512, 512],
    "mipmapping": 1
  },
  new: func(placement)  # create a new canvas...
  {
    var m = { parents: [nav_display],
    canvas: canvas.new(nav_display.canvas_settings)
  };
    m.canvas.addPlacement({"node": "canvas_NAV_screen"});
    m.canvas.setColorBackground(0,0,0.1, 1);
    var g = m.canvas.createGroup()
    	.set("font", "LiberationFonts/LiberationMono-Regular.ttf")
    	.setDouble("character-size", 36)
        .setDouble("character-aspect-ration", 1.0)
    ;
    m.nav_a_txt =
      g.createChild("text", "line-title")
       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
       .setColor(1,1,0,1)
       .setColorFill(0,0,0.1,1)
       .setAlignment("center-center")
       .setFontSize(36, 1.2)
       .setTranslation(256, 64);
    return m;
  },
  update: func()
  { 
  	var rmTxt = 'ROUTE MANAGER';
  	if (getprop("autopilot/route-manager/current-wp") == -1 ){
  		rmTxt = 'Route Manager NOT active' ;
  	}
  	#else{} place holder for Route Manager data display
    me.nav_a_txt.setText(rmTxt);
    
    settimer(func me.update(), 0.1);
  },
};

var init = setlistener("/sim/signals/fdm-initialized", func() {
  removelistener(init); # only call once
  var com1_f = com1_display.new({"node": "canvas_COM1_frequency"});
  var com2_f = com2_display.new({"node": "canvas_COM2_frequency"});
  var nav1_f = nav1_display.new({"node": "canvas_NAV1_frequency"}); 
  var iff_id = iff_display.new({"node": "canvas_IFF_squawk"}); 
  var nav_scr = nav_display.new({"node": "canvas_NAV_screen"}); 
    
  com1_f.update();
  com2_f.update();
  nav1_f.update();
  iff_id.update();
  nav_scr.update();
  
});
