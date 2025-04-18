﻿within AixLib.Controls.HeatPump;
model DefrostControl
  "Control block to ensure no frost limits heat flow at the evaporator"
  parameter Real minIceFac "Minimal value above which no defrost is necessary";

  parameter Real deltaIceFac = 0.1 "Bandwitdth for hystereses. If the icing factor is based on the duration of defrost, this value is necessary to avoid state-events.";
  Modelica.Blocks.Interfaces.BooleanInput hea
    annotation (Placement(transformation(extent={{-132,-36},{-100,-4}})));
  Modelica.Blocks.Interfaces.RealInput ySet
    "Set value relative speed of compressor. Analog from 0 to 1"
    annotation (Placement(transformation(extent={{-132,4},{-100,36}})));
  Utilities.Logical.SmoothSwitch swiErr
    "If an error occurs, the value of the conZero block will be used(0)"
    annotation (Placement(transformation(extent={{58,2},{78,22}})));
  Modelica.Blocks.Sources.Constant conOne(final k=1)
    "If Defrost is enabled, HP runs at full power"
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Interfaces.RealOutput yOut
    "Relative speed of compressor. From 0 to 1"
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.BooleanOutput heaOut
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Fluid.HeatPumps.ModularReversible.BaseClasses.RefrigerantMachineControlBus sigBus
    annotation (Placement(transformation(extent={{-120,-76},{-92,-48}})));
  Modelica.Blocks.Logical.Hysteresis            iceFacGreMinChi(
    final uLow=minIceFac,
    final uHigh=minIceFac + deltaIceFac,
    final pre_y_start=true)
    "Check if icing factor is greater than a boundary" annotation (Placement(
        transformation(
        extent={{-10.5,-10.5},{10.5,10.5}},
        rotation=0,
        origin={-49.5,-61.5})));
  Modelica.Blocks.Logical.LogicalSwitch logicalSwitch
    "If a chiller is used to defrost, mode will be false"
    annotation (Placement(transformation(extent={{58,-42},{78,-22}})));
  Modelica.Blocks.Sources.BooleanConstant conTrueUseChi(final k=false)
  "Set mode to false to simulate the defrost cycle"
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
equation
  connect(conOne.y, swiErr.u3) annotation (Line(points={{21,0},{46,0},{46,4},{
          56,4}},         color={0,0,127}));
  connect(swiErr.y,yOut)  annotation (Line(points={{79,12},{96,12},{96,20},{110,
          20}}, color={0,0,127}));
  connect(ySet, swiErr.u1) annotation (Line(points={{-116,20},{56,20}},
               color={0,0,127}));

  connect(sigBus.iceFacMea, iceFacGreMinChi.u) annotation (Line(
      points={{-106,-62},{-84.05,-62},{-84.05,-61.5},{-62.1,-61.5}},
      color={255,204,51},
      thickness=0.5),            Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(iceFacGreMinChi.y, swiErr.u2) annotation (Line(
      points={{-37.95,-61.5},{8,-61.5},{8,-32},{44,-32},{44,12},{56,12}},
      color={255,0,255}));
  connect(logicalSwitch.y, heaOut) annotation (Line(points={{79,-32},{84,-32},{84,
          -20},{110,-20}}, color={255,0,255}));
  connect(hea, logicalSwitch.u1) annotation (Line(points={{-116,-20},{-32,-20},{
          -32,-24},{56,-24}}, color={255,0,255}));
  connect(iceFacGreMinChi.y, logicalSwitch.u2) annotation (Line(
      points={{-37.95,-61.5},{8,-61.5},{8,-32},{56,-32}},
      color={255,0,255}));
  connect(conTrueUseChi.y, logicalSwitch.u3) annotation (Line(
      points={{41,-70},{48,-70},{48,-40},{56,-40}},
      color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,80}}),                                   graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-36,34},{-36,-6}},
          color={28,108,200}),
        Line(
          points={{0,20},{0,-20}},
          color={28,108,200},
          origin={-36,14},
          rotation=90),
        Line(
          points={{-14,14},{14,-14}},
          color={28,108,200},
          origin={-36,14},
          rotation=90),
        Line(
          points={{14,14},{-14,-14}},
          color={28,108,200},
          origin={-36,14},
          rotation=90),
        Line(
          points={{8,64},{8,24}},
          color={28,108,200}),
        Line(
          points={{0,20},{0,-20}},
          color={28,108,200},
          origin={8,44},
          rotation=90),
        Line(
          points={{-14,14},{14,-14}},
          color={28,108,200},
          origin={8,44},
          rotation=90),
        Line(
          points={{14,14},{-14,-14}},
          color={28,108,200},
          origin={8,44},
          rotation=90),
        Line(
          points={{-34,-22},{-34,-62}},
          color={28,108,200}),
        Line(
          points={{0,20},{0,-20}},
          color={28,108,200},
          origin={-34,-42},
          rotation=90),
        Line(
          points={{-14,14},{14,-14}},
          color={28,108,200},
          origin={-34,-42},
          rotation=90),
        Line(
          points={{14,14},{-14,-14}},
          color={28,108,200},
          origin={-34,-42},
          rotation=90),
        Line(
          points={{14,6},{14,-34}},
          color={28,108,200}),
        Line(
          points={{0,20},{0,-20}},
          color={28,108,200},
          origin={14,-14},
          rotation=90),
        Line(
          points={{-14,14},{14,-14}},
          color={28,108,200},
          origin={14,-14},
          rotation=90),
        Line(
          points={{14,14},{-14,-14}},
          color={28,108,200},
          origin={14,-14},
          rotation=90),
        Text(
          extent={{-104,100},{106,76}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.None,
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),
    Documentation(info="<html><p>
  Basic model for a defrost control. The icing factor is calculated in
  the heat pump based on functions or other models.
</p>
<p>
  If a given lower boundary is surpassed, the mode of the heat pump
  will be set to false(eq. Chilling) and the compressor speed is set to
  1 to make the defrost process as fast as possible.
</p>
<ul>
  <li>
  <i>August 27, 2024</i> by Fabian Wüllhorst:<br/>
  Adapted to new heat pump approach (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/1520\">#1520</a>)
  </li>
  <li>
    <i>November 26, 2018&#160;</i> by Fabian Wüllhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">#577</a>)
  </li>
</ul>
</html>"));
end DefrostControl;
