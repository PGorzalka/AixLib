within AixLib.BoundaryConditions.WeatherData.BaseClasses;
block LimiterTerrestriallInfraredIrradiation
  "Block that limits the terrestrial infrared irradiation"
  extends PartialLimiterMin;

  Modelica.Blocks.Interfaces.RealOutput HTerIR(
    final unit="W/m2") = max(0, u) "Terrestrial infrared irradiation"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  annotation (
defaultComponentName="limMin",
Documentation(info="<html>
 <p>
 Block that limits the terrestrial infrared irradiation to be positive.
 </p>
 <p>
 This block is used because interpolation of weather data can lead to slightly
 negative values.
 </p>
 </html>",
revisions="<html>
 <ul>
 <li>
 April 14, 2020, by Michael Wetter:<br/>
 First implementation.
 </li>
 </ul>
 </html>"));
end LimiterTerrestriallInfraredIrradiation;
