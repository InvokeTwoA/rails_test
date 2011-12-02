// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



$("#playground").playground({height: PLAYGROUND_HEIGHT, width: PLAYGROUND_WIDTH})
          .addSprite("sprite1",{animation: animation1})
          .addGroup("groupA")
          .addSprite("sprite2",{animation: animation2}).end()
          .addSprite("sprite3",{animation: animation3})
          .addGroup("groupB",{overflow: hidden})
          .addSprite("sprite4",{animation: animation4});

