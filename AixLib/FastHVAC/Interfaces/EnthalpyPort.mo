within AixLib.FastHVAC.Interfaces;
partial connector EnthalpyPort "Enthalpy port for 1-dim. enthalpy transfer"

  Modelica.SIunits.Temperature T "Port temperature";
  flow Modelica.SIunits.MassFlowRate m_flow
    "Mass flow rate(positive if flowing from outside into the component)";
  Modelica.SIunits.SpecificEnthalpy h "Specific enthalpy of fluid";
  Modelica.SIunits.SpecificHeatCapacity c "Constant specific heat capacity";

  annotation (Documentation(info="<html>
</html>", revisions="<html>
<ul>
<li>
<i>April 25, 2017</i>, by Michael Mans:<br/>
Moved to AixLib
</li>
</ul>
</html>"));
end EnthalpyPort;