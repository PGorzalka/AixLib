within AixLib.Fluid.Humidifiers.Validation;
model SprayAirWasher_X_dynamic
  "Model that demonstrates the spray air washer model, configured as dynamic model"
  extends AixLib.Fluid.Humidifiers.Validation.SprayAirWasher_X(
    hum(
     mWatMax_flow=mWat_flow_nominal,
     energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial));

annotation (
    __Dymola_Commands(file= "modelica://AixLib/Resources/Scripts/Dymola/Fluid/Humidifiers/Validation/SprayAirWasher_X_dynamic.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
Model that validates the use of a spray air washer
configured as a dynamic model with limits on the maximum water mass flow rate
that is added to the air stream.
</p>
</html>", revisions="<html>
<ul>
<li>
May 3, 2017, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),
    experiment(
      StopTime=1080,
      Tolerance=1e-6), 
   __Dymola_LockedEditing="Model from IBPSA");
end SprayAirWasher_X_dynamic;
