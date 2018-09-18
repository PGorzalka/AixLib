within AixLib.Building.Benchmark.Regelungsbenchmark.Controller_Generation;
model Generation_NoChpAndBoiler
  BusSystem.Bus_measure measureBus
    annotation (Placement(transformation(extent={{-20,80},{20,120}})));
  BusSystem.Bus_Control controlBus
    annotation (Placement(transformation(extent={{-20,-120},{20,-80}})));
  Modelica.Blocks.Logical.Or or1
    annotation (Placement(transformation(extent={{-46,60},{-26,80}})));
  Modelica.Blocks.Logical.Or or2
    annotation (Placement(transformation(extent={{-46,20},{-34,32}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=273.15 + 90)
    annotation (Placement(transformation(extent={{80,-54},{60,-34}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=26)
    annotation (Placement(transformation(extent={{80,-66},{60,-46}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=273.15 + 90)
    annotation (Placement(transformation(extent={{80,-20},{60,0}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis2(uLow=273.15 + 3.5, uHigh=
        273.15 + 6)
    annotation (Placement(transformation(extent={{-92,12},{-80,24}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis3(uLow=273.15 + 35, uHigh=273.15
         + 45)
    annotation (Placement(transformation(extent={{-92,28},{-80,40}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis4(uLow=273.15 + 5, uHigh=273.15
         + 9)
    annotation (Placement(transformation(extent={{-92,52},{-80,64}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis5(uLow=273.15 + 30, uHigh=273.15
         + 40)
    annotation (Placement(transformation(extent={{-92,68},{-80,80}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{12,60},{26,74}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=2.5)
            annotation (Placement(transformation(extent={{-10,72},{2,84}})));
  Modelica.Blocks.Logical.Not not3
    annotation (Placement(transformation(extent={{-70,28},{-58,40}})));
  Modelica.Blocks.Logical.Not not4
    annotation (Placement(transformation(extent={{-70,68},{-58,80}})));
  Modelica.Blocks.Logical.Or or3
    annotation (Placement(transformation(extent={{-24,20},{-12,32}})));
  Modelica.Blocks.Logical.Hysteresis hysteresis6(uLow=273.15 + 1, uHigh=273.15
         + 4)
    annotation (Placement(transformation(extent={{-92,-4},{-80,8}})));
  Modelica.Blocks.Logical.Not not5
    annotation (Placement(transformation(extent={{-66,-4},{-54,8}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression
    annotation (Placement(transformation(extent={{-66,-60},{-46,-40}})));
equation
  connect(realExpression3.y, controlBus.ElSet_CHP) annotation (Line(points={{59,
          -56},{40,-56},{40,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(realExpression2.y, controlBus.TSet_CHP) annotation (Line(points={{59,
          -44},{40,-44},{40,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(realExpression4.y, controlBus.TSet_boiler) annotation (Line(points={{
          59,-10},{40,-10},{40,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(hysteresis5.u, measureBus.WarmWater_TTop) annotation (Line(points={{
          -93.2,74},{-100,74},{-100,86},{0.1,86},{0.1,100.1}}, color={0,0,127}));
  connect(hysteresis3.u, measureBus.WarmWater_TTop) annotation (Line(points={{
          -93.2,34},{-100,34},{-100,86},{0.1,86},{0.1,100.1}}, color={0,0,127}));
  connect(hysteresis4.u, measureBus.ColdWater_TBottom) annotation (Line(points=
          {{-93.2,58},{-100,58},{-100,86},{0.1,86},{0.1,100.1}}, color={0,0,127}));
  connect(hysteresis2.u, measureBus.ColdWater_TBottom) annotation (Line(points={{-93.2,
          18},{-100,18},{-100,86},{0.1,86},{0.1,100.1}},         color={0,0,127}));
  connect(hysteresis4.y, or1.u2) annotation (Line(points={{-79.4,58},{-54,58},{
          -54,62},{-48,62}}, color={255,0,255}));
  connect(hysteresis2.y, or2.u2) annotation (Line(points={{-79.4,18},{-54,18},{
          -54,21.2},{-47.2,21.2}},
                             color={255,0,255}));
  connect(greaterThreshold.y, and1.u1) annotation (Line(points={{2.6,78},{6,78},
          {6,67},{10.6,67}}, color={255,0,255}));
  connect(greaterThreshold.u, measureBus.heatpump_cold_massflow) annotation (
      Line(points={{-11.2,78},{-20,78},{-20,86},{0.1,86},{0.1,100.1}}, color={0,
          0,127}));
  connect(hysteresis5.y, not4.u)
    annotation (Line(points={{-79.4,74},{-71.2,74}}, color={255,0,255}));
  connect(not4.y, or1.u1) annotation (Line(points={{-57.4,74},{-52,74},{-52,70},
          {-48,70}}, color={255,0,255}));
  connect(not3.y, or2.u1) annotation (Line(points={{-57.4,34},{-52,34},{-52,26},
          {-47.2,26}},
                     color={255,0,255}));
  connect(hysteresis3.y, not3.u)
    annotation (Line(points={{-79.4,34},{-71.2,34}}, color={255,0,255}));
  connect(or2.y, or3.u1)
    annotation (Line(points={{-33.4,26},{-25.2,26}}, color={255,0,255}));
  connect(hysteresis6.y, not5.u)
    annotation (Line(points={{-79.4,2},{-67.2,2}}, color={255,0,255}));
  connect(not5.y, or3.u2) annotation (Line(points={{-53.4,2},{-30,2},{-30,21.2},
          {-25.2,21.2}}, color={255,0,255}));
  connect(booleanExpression.y, controlBus.OnOff_CHP) annotation (Line(points={{
          -45,-50},{0.1,-50},{0.1,-99.9}}, color={255,0,255}));
  connect(booleanExpression.y, controlBus.OnOff_boiler) annotation (Line(points=
         {{-45,-50},{-28,-50},{-28,-50},{0.1,-50},{0.1,-99.9}}, color={255,0,
          255}));
  connect(or1.y, and1.u2) annotation (Line(points={{-25,70},{-8,70},{-8,61.4},{
          10.6,61.4}}, color={255,0,255}));
  connect(hysteresis6.u, measureBus.Aircooler) annotation (Line(points={{-93.2,
          2},{-100,2},{-100,86},{0.1,86},{0.1,100.1}}, color={0,0,127}));
  connect(or3.y, controlBus.OnOff_heatpump_2) annotation (Line(points={{-11.4,
          26},{0.1,26},{0.1,-99.9}}, color={255,0,255}));
  connect(and1.y, controlBus.OnOff_heatpump_1) annotation (Line(points={{26.7,
          67},{32,67},{32,28},{0.1,28},{0.1,-99.9}}, color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Generation_NoChpAndBoiler;