within AixLib.Building.Benchmark.Rooms;
model Canteen
  replaceable package Medium_Air =
    AixLib.Media.Air "Medium in the component";
  Components.Walls.Wall NorthWall(
    wall_height=3,
    solar_absorptance=0.48,
    withWindow=true,
    withSunblind=false,
    withDoor=false,
    WindowType=DataBase.WindowsDoors.Simple.WindowSimple_EnEV2009(),
    T0(displayUnit="degC") = 293.15,
    wall_length=20,
    windowarea=40)
               annotation (Placement(transformation(
        extent={{-3.99999,-24},{4.00002,24}},
        rotation=-90,
        origin={-52,60})));
  Components.Walls.Wall SouthWall(
    wall_height=3,
    solar_absorptance=0.48,
    withWindow=true,
    WindowType=DataBase.WindowsDoors.Simple.WindowSimple_EnEV2009(),
    withSunblind=false,
    withDoor=false,
    wall_length=20,
    windowarea=40,
    T0=293.15) annotation (Placement(transformation(
        extent={{-3.99999,-24},{4.00002,24}},
        rotation=90,
        origin={-52,-62})));
  Components.Walls.Wall WestWallToWorkshop(
    wall_height=3,
    solar_absorptance=0.48,
    withWindow=true,
    redeclare model Window = Components.WindowsDoors.Window_ASHRAE140,
    WindowType=DataBase.WindowsDoors.Simple.WindowSimple_EnEV2009(),
    windowarea=60,
    withSunblind=false,
    outside=false,
    wall_length=20,
    withDoor=true,
    door_height=2.125,
    door_width=1,
    WallType=DataBase.Walls.EnEV2009.IW.IWload_EnEV2009_S_half(),
    T0=293.15) annotation (Placement(transformation(
        extent={{-3.99999,-24},{4.00002,24}},
        rotation=0,
        origin={-76,0})));
  Components.Walls.Wall EastWall(
    wall_height=3,
    solar_absorptance=0.48,
    withWindow=true,
    WindowType=DataBase.WindowsDoors.Simple.WindowSimple_EnEV2009(),
    withSunblind=false,
    withDoor=false,
    wall_length=30,
    windowarea=60,
    T0=293.15) annotation (Placement(transformation(
        extent={{-3.99999,-24},{4.00002,24}},
        rotation=180,
        origin={60,0})));
  Components.Walls.Wall FloorToGround(
    solar_absorptance=0.48,
    withWindow=true,
    redeclare model Window = Components.WindowsDoors.Window_ASHRAE140,
    WindowType=DataBase.WindowsDoors.Simple.WindowSimple_EnEV2009(),
    windowarea=60,
    withSunblind=false,
    withDoor=false,
    outside=false,
    wall_length=30,
    wall_height=20,
    ISOrientation=2,
    WallType=DataBase.Walls.EnEV2009.Floor.FLground_EnEV2009_SML(),
    T0=293.15) annotation (Placement(transformation(
        extent={{-3.99999,-24},{4.00002,24}},
        rotation=90,
        origin={14,-62})));
  Utilities.Interfaces.Adaptors.HeatStarToComb thermStar_Demux annotation(Placement(transformation(extent = {{-10, 8}, {10, -8}}, rotation = 90, origin = {-20, -26})));
  Components.Walls.ActiveWallPipeBased activeWallPipeBased(
    wall_height=30,
    withDoor=false,
    ISOrientation=3,
    outside=false,
    WallType=DataBase.Walls.EnEV2009.Ceiling.CEpartition_EnEV2009_SM_loHalf_TBA(),
    wall_length=20)
    annotation (Placement(transformation(
        extent={{-4,-24},{4,24}},
        rotation=-90,
        origin={20,60})));

  Fluid.MixingVolumes.MixingVolumeMoistAir vol(
                                     nPorts=2,
    m_flow_nominal=10,
    m_flow_small=0.001,
    allowFlowReversal=true,
    X_start={0.01,0.99},
    energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial,
    redeclare package Medium = Medium_Air,
    p_start=100000,
    T_start=293.15,
    V=1800)
    annotation (Placement(transformation(extent={{6,-12},{26,8}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a HeatPort_ToGround
    annotation (Placement(transformation(extent={{4,-110},{24,-90}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a HeatPort_ToWorkshop
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealInput WindSpeedPort_EastWall annotation (
      Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={104,-18})));
  Modelica.Blocks.Interfaces.RealInput WindSpeedPort_NorthWall annotation (
      Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={-20,104})));
  Modelica.Blocks.Interfaces.RealInput WindSpeedPort_SouthWall annotation (
      Placement(transformation(
        extent={{12,-12},{-12,12}},
        rotation=-90,
        origin={-82,-106})));
  Utilities.Interfaces.SolarRad_in SolarRadiationPort_NorthWall annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={10,110})));
  Utilities.Interfaces.SolarRad_in SolarRadiationPort_EastWall annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,-50})));
  Utilities.Interfaces.SolarRad_in SolarRadiationPort_SouthWall annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-24,-110})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b Heatport_TBA
    annotation (Placement(transformation(extent={{90,38},{110,58}})));
  Modelica.Fluid.Interfaces.FluidPort_a Air_in(redeclare package Medium =
        Medium_Air)
    "Fluid connector a (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{90,-4},{110,16}})));
  Modelica.Fluid.Interfaces.FluidPort_b Air_out(redeclare package Medium =
        Medium_Air)
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{90,18},{110,38}})));
  Modelica.Blocks.Interfaces.RealInput mWat_Canteen
    "Water flow rate added into the medium"
    annotation (Placement(transformation(extent={{-116,80},{-92,104}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a AddPower_Canteen
    annotation (Placement(transformation(extent={{-110,60},{-90,80}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a HeatPort_Canteen
    annotation (Placement(transformation(extent={{50,90},{70,110}})));
  BusSystem.Bus_measure measureBus
    annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor
    annotation (Placement(transformation(extent={{8,12},{28,32}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature1
                          annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-52,90})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=-90,
        origin={-52,-88})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature2
                          annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=0,
        origin={82,0})));
equation
  connect(FloorToGround.port_outside, HeatPort_ToGround)
    annotation (Line(points={{14,-66.2},{14,-100}}, color={191,0,0}));
  connect(WestWallToWorkshop.port_outside, HeatPort_ToWorkshop)
    annotation (Line(points={{-80.2,0},{-100,0}}, color={191,0,0}));
  connect(SouthWall.WindSpeedPort,WindSpeedPort_SouthWall)  annotation (Line(
        points={{-69.6,-66.2},{-69.6,-80},{-82,-80},{-82,-106}}, color={0,0,127}));
  connect(EastWall.WindSpeedPort,WindSpeedPort_EastWall)  annotation (Line(
        points={{64.2,-17.6},{81.1,-17.6},{81.1,-18},{104,-18}}, color={0,0,127}));
  connect(NorthWall.SolarRadiationPort,SolarRadiationPort_NorthWall)
    annotation (Line(points={{-30,65.2},{-30,80},{10,80},{10,110}}, color={255,
          128,0}));
  connect(EastWall.SolarRadiationPort,SolarRadiationPort_EastWall)  annotation (
     Line(points={{65.2,-22},{80,-22},{80,-50},{110,-50}}, color={255,128,0}));
  connect(SouthWall.SolarRadiationPort,SolarRadiationPort_SouthWall)
    annotation (Line(points={{-74,-67.2},{-74,-80},{-24,-80},{-24,-110}}, color=
         {255,128,0}));
  connect(SouthWall.thermStarComb_inside,thermStar_Demux. thermStarComb)
    annotation (Line(points={{-52,-58},{-52,-52},{-20.1,-52},{-20.1,-35.4}},
        color={191,0,0}));
  connect(FloorToGround.thermStarComb_inside, thermStar_Demux.thermStarComb)
    annotation (Line(points={{14,-58},{14,-52},{-20.1,-52},{-20.1,-35.4}},
        color={191,0,0}));
  connect(WestWallToWorkshop.thermStarComb_inside, thermStar_Demux.thermStarComb)
    annotation (Line(points={{-72,0},{-60,0},{-60,-52},{-20.1,-52},{-20.1,-35.4}},
        color={191,0,0}));
  connect(NorthWall.thermStarComb_inside,thermStar_Demux. thermStarComb)
    annotation (Line(points={{-52,56},{-52,48},{-60,48},{-60,-52},{-20.1,-52},{
          -20.1,-35.4}}, color={191,0,0}));
  connect(EastWall.thermStarComb_inside,thermStar_Demux. thermStarComb)
    annotation (Line(points={{56,0},{50,0},{50,-52},{-20.1,-52},{-20.1,-35.4}},
        color={191,0,0}));
  connect(NorthWall.WindSpeedPort,WindSpeedPort_NorthWall)  annotation (Line(
        points={{-34.4,64.2},{-34.4,80},{-20,80},{-20,104}}, color={0,0,127}));
  connect(activeWallPipeBased.thermStarComb_inside,thermStar_Demux. thermStarComb)
    annotation (Line(points={{20,56},{20,48},{-60,48},{-60,-52},{-20.1,-52},{
          -20.1,-35.4}}, color={191,0,0}));
  connect(activeWallPipeBased.Heatport_TBA,Heatport_TBA)  annotation (Line(
        points={{37.6,55.8},{37.6,48},{100,48}}, color={191,0,0}));
  connect(Air_in,vol. ports[1]) annotation (Line(points={{100,6},{80,6},{80,28},
          {40,28},{40,-20},{14,-20},{14,-12}}, color={0,127,255}));
  connect(Air_out,vol. ports[2]) annotation (Line(points={{100,28},{40,28},{40,
          -20},{18,-20},{18,-12}}, color={0,127,255}));
  connect(vol.heatPort,thermStar_Demux. therm) annotation (Line(points={{6,-2},
          {-25.1,-2},{-25.1,-15.9}}, color={191,0,0}));
  connect(vol.mWat_flow, mWat_Canteen) annotation (Line(points={{4,6},{-20,6},{
          -20,80},{-90,80},{-90,92},{-104,92}}, color={0,0,127}));
  connect(thermStar_Demux.therm, AddPower_Canteen) annotation (Line(points={{
          -25.1,-15.9},{-25.1,32},{-25.1,80},{-26,80},{-26,80},{-26,80},{-90,80},
          {-90,70},{-100,70}}, color={191,0,0}));
  connect(activeWallPipeBased.port_outside, HeatPort_Canteen) annotation (Line(
        points={{20,64.2},{20,74},{60,74},{60,100}}, color={191,0,0}));
  connect(temperatureSensor.port, thermStar_Demux.therm) annotation (Line(
        points={{8,22},{-4,22},{-4,-2},{-25.1,-2},{-25.1,-15.9}}, color={191,0,
          0}));
  connect(temperatureSensor.T, measureBus.RoomTemp_Canteen) annotation (Line(
        points={{28,22},{40,22},{40,-52},{-80,-52},{-90,-52},{-90,-59.9},{-99.9,
          -59.9}}, color={0,0,127}));
  connect(vol.X_w, measureBus.X_Canteen) annotation (Line(points={{28,-6},{40,
          -6},{40,-52},{-80,-52},{-90,-52},{-90,-59.9},{-99.9,-59.9}}, color={0,
          0,127}));
  connect(prescribedTemperature1.port, NorthWall.port_outside)
    annotation (Line(points={{-52,84},{-52,64.2}}, color={191,0,0}));
  connect(prescribedTemperature.port, SouthWall.port_outside)
    annotation (Line(points={{-52,-82},{-52,-66.2}}, color={191,0,0}));
  connect(prescribedTemperature2.port, EastWall.port_outside)
    annotation (Line(points={{76,0},{64.2,0}}, color={191,0,0}));
  connect(prescribedTemperature.T, measureBus.AirTemp) annotation (Line(points=
          {{-52,-95.2},{-52,-98},{-24,-98},{-24,-52},{-60,-52},{-60,-59.9},{
          -99.9,-59.9}}, color={0,0,127}));
  connect(prescribedTemperature1.T, measureBus.AirTemp) annotation (Line(points=
         {{-52,97.2},{-52,102},{-80,102},{-80,48},{-60,48},{-60,-59.9},{-99.9,
          -59.9}}, color={0,0,127}));
  connect(prescribedTemperature2.T, measureBus.AirTemp) annotation (Line(points=
         {{89.2,0},{92,0},{92,36},{40,36},{40,-52},{-60,-52},{-60,-59.9},{-99.9,
          -59.9}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-4,46},{44,36}},
          lineColor={28,108,200},
          textString="Solar absorptance ist noch nicht richtig,
gucken wie das mit PV Anlage ist
")}));
end Canteen;