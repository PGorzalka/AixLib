within AixLib.Utilities.Math.Examples;
model IntegerReplicator "Test model for integer replicator"

  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.IntegerTable intTab(table=[0,1;1, 4;1.5, 5;2, 6])
    "Integer input signal"
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  AixLib.Utilities.Math.IntegerReplicator intRep(nout=
       2) "Replicates integer values" annotation (Placement(transformation(extent={{0,0},{20,20}})));
equation
  connect(intTab.y, intRep.u) annotation (Line(
      points={{-19,10},{-2,10}},
      color={255,127,0}));
annotation (experiment(Tolerance=1e-6, StopTime=2),
__Dymola_Commands(file="modelica://AixLib/Resources/Scripts/Dymola/Utilities/Math/Examples/IntegerReplicator.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This model tests the implementation of
<a href=\"modelica://AixLib.Utilities.Math.IntegerReplicator\">
AixLib.Utilities.Math.IntegerReplicator</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
August 31, 2012, by Michael Wetter:<br/>
Revised documentation.
</li>
<li>
July 27, 2012, by Kaustubh Phalak:<br/>
First implementation.
</li>
</ul>
</html>"),  
   __Dymola_LockedEditing="Model from IBPSA");
end IntegerReplicator;
