within AixLib.Fluid.DistrictHeatingCooling.Supplies.ClosedLoop;
model IdealSourcewithT_supply

      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium model for water"
      annotation (choicesAllMatching = true);

       parameter Modelica.SIunits.Pressure dp_nominal(displayUnit="Pa")=30000
      "Nominal pressure drop";

  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium =
        Medium)
    "Fluid connector for connecting the ideal plant to the cold line of the network"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b(redeclare package Medium =
        Medium)
    "Fluid connector for connecting the ideal plant to the warm line of the network"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  AixLib.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium =
        Medium, m_flow_nominal=2,
    tau=0,
    allowFlowReversal=false,
    T_start=283.15)
    annotation (Placement(transformation(extent={{14,10},{34,-10}})));
  Modelica.Blocks.Interfaces.RealInput  TIn(unit="K")
 "Prescribed supply temperature"
    annotation (Placement(transformation(extent={{-126,60},{-86,100}})));

  Sensors.MassFlowRate m_flow(redeclare package Medium = Medium,
      allowFlowReversal=false)
    annotation (Placement(transformation(extent={{68,10},{88,-10}})));
  Sensors.TemperatureTwoPort senTem1( redeclare package Medium = Medium,m_flow_nominal=2, tau=0,
    allowFlowReversal=false)
    annotation (Placement(transformation(extent={{-54,10},{-34,-10}})));
  MixingVolumes.MixingVolume vol(
    redeclare package Medium = Medium,
    nPorts=2,
    m_flow_nominal=2,
    V=5) annotation (Placement(transformation(extent={{-32,0},{-12,20}})));
  Sources.PropertySource_T proSou(redeclare package Medium = Medium,use_T_in=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Sensors.SpecificEnthalpyTwoPort Re(redeclare package Medium = Medium,
      m_flow_nominal=2)
    annotation (Placement(transformation(extent={{-88,10},{-68,-10}})));
  Sensors.SpecificEnthalpyTwoPort For(redeclare package Medium = Medium,
      m_flow_nominal=2)
    annotation (Placement(transformation(extent={{42,10},{62,-10}})));
  Modelica.Blocks.Sources.RealExpression heat_flow(y=(Re.h_out - For.h_out)*
        m_flow.m_flow/1000)
    annotation (Placement(transformation(extent={{66,-48},{86,-28}})));
  Utilities.Sensors.EnergyMeter energyMeter
    annotation (Placement(transformation(extent={{94,-46},{106,-30}})));
equation
  connect(m_flow.port_b, port_b)
    annotation (Line(points={{88,0},{100,0}}, color={0,127,255}));
  connect(senTem1.port_b, vol.ports[1]) annotation (Line(points={{-34,0},{-24,0}},
                            color={0,127,255}));
  connect(proSou.port_b, senTem.port_a)
    annotation (Line(points={{10,0},{14,0}}, color={0,127,255}));
  connect(vol.ports[2], proSou.port_a) annotation (Line(points={{-20,0},{-10,0}},
                            color={0,127,255}));
  connect(TIn, proSou.T_in)
    annotation (Line(points={{-106,80},{-4,80},{-4,12}}, color={0,0,127}));
  connect(port_a, Re.port_a)
    annotation (Line(points={{-100,0},{-88,0}}, color={0,127,255}));
  connect(Re.port_b, senTem1.port_a)
    annotation (Line(points={{-68,0},{-54,0}}, color={0,127,255}));
  connect(senTem.port_b, For.port_a)
    annotation (Line(points={{34,0},{42,0}}, color={0,127,255}));
  connect(For.port_b, m_flow.port_a)
    annotation (Line(points={{62,0},{68,0}}, color={0,127,255}));
  connect(heat_flow.y, energyMeter.p)
    annotation (Line(points={{87,-38},{94.4,-38}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-80,80},{80,0}},
          lineColor={28,108,200},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,-80},{80,0}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.None)}),                       Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(revisions="<html>
<ul>
<li><i>August 09, 2018</i> ,by Tobias Blacha:<br/>
Implemented </li>
</ul>
</html>"));
end IdealSourcewithT_supply;