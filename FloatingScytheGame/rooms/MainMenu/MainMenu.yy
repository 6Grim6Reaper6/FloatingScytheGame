{
  "$GMRoom":"v1",
  "%Name":"MainMenu",
  "creationCodeFile":"rooms/MainMenu/RoomCreationCode.gml",
  "inheritCode":false,
  "inheritCreationOrder":false,
  "inheritLayers":false,
  "instanceCreationOrder":[
    {"name":"inst_EAAE8F7","path":"rooms/MainMenu/MainMenu.yy",},
    {"name":"inst_4DB44281","path":"rooms/MainMenu/MainMenu.yy",},
    {"name":"inst_7FD1DD6D","path":"rooms/MainMenu/MainMenu.yy",},
    {"name":"inst_628C38","path":"rooms/MainMenu/MainMenu.yy",},
    {"name":"inst_457C54DC","path":"rooms/MainMenu/MainMenu.yy",},
  ],
  "isDnd":false,
  "layers":[
    {"$GMRBackgroundLayer":"","%Name":"Background","animationFPS":12.0,"animationSpeedType":0,"colour":4294967295,"depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"name":"Background","properties":[],"resourceType":"GMRBackgroundLayer","resourceVersion":"2.0","spriteId":{"name":"sWallCamBorder","path":"sprites/sWallCamBorder/sWallCamBorder.yy",},"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
    {"$GMRInstanceLayer":"","%Name":"Instances","depth":100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"$GMRInstance":"v1","%Name":"inst_628C38","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_628C38","objectId":{"name":"oMenuBackground","path":"objects/oMenuBackground/oMenuBackground.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":7.5,"scaleY":4.0,"x":0.0,"y":0.0,},
        {"$GMRInstance":"v1","%Name":"inst_EAAE8F7","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_EAAE8F7","objectId":{"name":"oNewGameButton","path":"objects/oNewGameButton/oNewGameButton.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"oMenuButton","path":"objects/oMenuButton/oMenuButton.yy",},"propertyId":{"name":"text","path":"objects/oMenuButton/oMenuButton.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"Start",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":3.5,"scaleY":1.0,"x":240.0,"y":120.0,},
        {"$GMRInstance":"v1","%Name":"inst_4DB44281","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_4DB44281","objectId":{"name":"oSettings","path":"objects/oSettings/oSettings.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":3.5,"scaleY":1.0,"x":240.0,"y":140.0,},
        {"$GMRInstance":"v1","%Name":"inst_7FD1DD6D","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_7FD1DD6D","objectId":{"name":"oTestArea","path":"objects/oTestArea/oTestArea.yy",},"properties":[],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":3.5,"scaleY":1.0,"x":240.0,"y":220.0,},
        {"$GMRInstance":"v1","%Name":"inst_457C54DC","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"name":"inst_457C54DC","objectId":{"name":"oText","path":"objects/oText/oText.yy",},"properties":[
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"oTextbox","path":"objects/oTextbox/oTextbox.yy",},"propertyId":{"name":"permenant","path":"objects/oTextbox/oTextbox.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"True",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"oTextbox","path":"objects/oTextbox/oTextbox.yy",},"propertyId":{"name":"text","path":"objects/oTextbox/oTextbox.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"Guess I'm the weapon now..?",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"oTextbox","path":"objects/oTextbox/oTextbox.yy",},"propertyId":{"name":"clicked","path":"objects/oTextbox/oTextbox.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"True",},
            {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"oText","path":"objects/oText/oText.yy",},"propertyId":{"name":"Localtext","path":"objects/oText/oText.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"Guess I'm the weapon now..?",},
          ],"resourceType":"GMRInstance","resourceVersion":"2.0","rotation":0.0,"scaleX":5.0,"scaleY":2.0,"x":240.0,"y":64.0,},
      ],"layers":[],"name":"Instances","properties":[],"resourceType":"GMRInstanceLayer","resourceVersion":"2.0","userdefinedDepth":false,"visible":true,},
  ],
  "name":"MainMenu",
  "parent":{
    "name":"Menus",
    "path":"folders/Rooms/Menus.yy",
  },
  "parentRoom":null,
  "physicsSettings":{
    "inheritPhysicsSettings":false,
    "PhysicsWorld":false,
    "PhysicsWorldGravityX":0.0,
    "PhysicsWorldGravityY":10.0,
    "PhysicsWorldPixToMetres":0.1,
  },
  "resourceType":"GMRoom",
  "resourceVersion":"2.0",
  "roomSettings":{
    "Height":270,
    "inheritRoomSettings":false,
    "persistent":false,
    "Width":480,
  },
  "sequenceId":null,
  "tags":[
    "Menu",
  ],
  "views":[
    {"hborder":32,"hport":1080,"hspeed":-1,"hview":270,"inherit":false,"objectId":null,"vborder":32,"visible":true,"vspeed":-1,"wport":1920,"wview":480,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings":{
    "clearDisplayBuffer":true,
    "clearViewBackground":false,
    "enableViews":true,
    "inheritViewSettings":false,
  },
  "volume":1.0,
}