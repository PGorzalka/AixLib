within AixLib.Electrical.AC.ThreePhasesUnbalanced.Lines.Examples;
model ACLine_R_N
  "Test model for a three-phase unbalanced resistive line with neutral cable"
  extends Modelica.Icons.Example;
  Sources.FixedVoltage_N E(
    definiteReference=true,
    f=60,
    V=480) "Voltage source"
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Loads.Impedance_N R1(R=10) "Resistive load 1"
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Loads.Impedance_N R2(R=10) "Resistive load 2"
    annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
  Loads.Impedance_N R3(R=10) "Resistive load 3"
    annotation (Placement(transformation(extent={{0,-70},{20,-50}})));
  Loads.Impedance_N sc_load(R=0) "Short circuit load"
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Lines.TwoPortResistance_N Rline_sc(      useHeatPort=false, R=60,
    Rn=20) "Resistive line that connects to the short circuit"
    annotation (Placement(transformation(extent={{-60,60},{-40,40}})));
  Lines.TwoPortResistance_N Rline_1(R=30, Rn=10)
    "Resistive line that connects to load 1"
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Lines.TwoPortResistance_N Rline_2a(R=15, Rn=5)
    "Resistive line that connects to load 2"
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Lines.TwoPortResistance_N Rline_2b(R=15, Rn=5)
    "Resistive line that connects to load 2"
    annotation (Placement(transformation(extent={{-32,-30},{-12,-10}})));
  Lines.TwoPortResistance_N Rline_3a(R=60, Rn=20)
    "Resistive line that connects to load 3"
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Lines.TwoPortResistance_N Rline_3b(R=60, Rn=20)
    "Resistive line that connects to load 3"
    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
equation
  connect(Rline_sc.terminal_p, sc_load.terminal) annotation (Line(
      points={{-40,50},{0,50}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(Rline_1.terminal_p, R1.terminal) annotation (Line(
      points={{-40,10},{0,10}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(Rline_2b.terminal_p, R2.terminal) annotation (Line(
      points={{-12,-20},{0,-20}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(Rline_2a.terminal_p, Rline_2b.terminal_n) annotation (Line(
      points={{-40,-20},{-32,-20}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(Rline_3b.terminal_p, R3.terminal) annotation (Line(
      points={{-40,-70},{-20,-70},{-20,-60},{0,-60}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(Rline_3a.terminal_p, R3.terminal) annotation (Line(
      points={{-40,-50},{-20,-50},{-20,-60},{0,-60}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(E.terminal, Rline_sc.terminal_n) annotation (Line(
      points={{-80,0},{-70,0},{-70,50},{-60,50}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(E.terminal, Rline_1.terminal_n) annotation (Line(
      points={{-80,0},{-70,0},{-70,10},{-60,10}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(E.terminal, Rline_2a.terminal_n) annotation (Line(
      points={{-80,0},{-70,0},{-70,-20},{-60,-20}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(E.terminal, Rline_3a.terminal_n) annotation (Line(
      points={{-80,0},{-70,0},{-70,-50},{-60,-50}},
      color={127,0,127},
      smooth=Smooth.None));
  connect(E.terminal, Rline_3b.terminal_n) annotation (Line(
      points={{-80,0},{-70,0},{-70,-70},{-60,-70}},
      color={127,0,127},
      smooth=Smooth.None));
  annotation (experiment(StopTime=1.0, Tolerance=1e-6),
  __Dymola_Commands(file=
          "modelica://AixLib/Resources/Scripts/Dymola/Electrical/AC/ThreePhasesUnbalanced/Lines/Examples/ACLine_R_N.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This example demonstrates how to use a resistive line model with neutral cable to connect
a source to a load.
</p>
<p>
The model has four different loads. The load <code>sc_load</code> represents
a short circuit <i>R=0</i>. The current that flows through the load depends
on the resistance of the line.
</p>
<p>
The remaining three loads <code>R1</code>, <code>R2</code>, and <code>R3</code>
are resistive loads. Each load is connected to the source with different configurations,
but the equivalent resistance between each load and the source is the same.
Since the equivalent resistances are the same, each load draws the same current.
</p>
</html>", revisions="<html>
<ul>
<li>
January 14, 2015, by Marco Bonvini:<br/>
Created model and documentation.
</li>
</ul>
</html>"),  
   __Dymola_LockedEditing="Model from IBPSA");
end ACLine_R_N;
