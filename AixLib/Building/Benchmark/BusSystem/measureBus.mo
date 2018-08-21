within AixLib.Building.Benchmark.BusSystem;
expandable connector measureBus
  "Control bus that is adapted to the signals connected to it"
  extends Modelica.Icons.SignalBus;
  import SI = Modelica.SIunits;
  // Weather
  SI.Temp_K AirTemp;
  Real WaterInAir;

  //Storage
  SI.Temp_K HotWater_TTop "Temperatur at the top of the hotwater-bufferstorage";
  SI.Temp_K HotWater_TBottom "Temperatur at the bottom of the hotwater-bufferstorage";
  SI.Temp_K WarmWater_TTop "Temperatur at the top of the warmwater-bufferstorage";
  SI.Temp_K WarmWater_TBottom "Temperatur at the bottom of the warmwater-bufferstorage";
  SI.Temp_K ColdWater_TTop "Temperatur at the top of the coldwater-bufferstorage";
  SI.Temp_K ColdWater_TBottom "Temperatur at the bottom of the coldwater-bufferstorage";

  //Measured Temperatures
  SI.Temp_K Heatpump_cold_big_in;
  SI.Temp_K Heatpump_cold_small_out;
  SI.Temp_K Heatpump_warm_big_out;
  SI.Temp_K Heatpump_warm_small_in;
  SI.Temp_K Aircooler_in;
  SI.Temp_K Aircooler_out;
  SI.Temp_K GeothermalProbe_in;
  SI.Temp_K GeothermalProbe_out;
  SI.Temp_K generation_hot_in;
  SI.Temp_K generation_hot_out;
  SI.Temp_K RLT_central_hot_in;
  SI.Temp_K RLT_central_hot_out;
  SI.Temp_K RLT_central_cold_in;
  SI.Temp_K RLT_central_cold_out;
  SI.Temp_K RLT_openplanoffice_hot_in;
  SI.Temp_K RLT_openplanoffice_hot_out;
  SI.Temp_K RLT_openplanoffice_cold_in;
  SI.Temp_K RLT_openplanoffice_cold_out;
  SI.Temp_K RLT_conferencerom_hot_in;
  SI.Temp_K RLT_conferencerom_hot_out;
  SI.Temp_K RLT_conferencerom_cold_in;
  SI.Temp_K RLT_conferencerom_cold_out;
  SI.Temp_K RLT_multipersonoffice_hot_in;
  SI.Temp_K RLT_multipersonoffice_hot_out;
  SI.Temp_K RLT_multipersonoffice_cold_in;
  SI.Temp_K RLT_multipersonoffice_cold_out;
  SI.Temp_K RLT_canteen_hot_in;
  SI.Temp_K RLT_canteen_hot_out;
  SI.Temp_K RLT_canteen_cold_in;
  SI.Temp_K RLT_canteen_cold_out;
  SI.Temp_K RLT_workshop_hot_in;
  SI.Temp_K RLT_workshop_hot_out;
  SI.Temp_K RLT_workshop_cold_in;
  SI.Temp_K RLT_workshop_cold_out;
  SI.Temp_K TBA_openplanoffice_in;
  SI.Temp_K TBA_openplanoffice_out;
  SI.Temp_K TBA_conferencerom_in;
  SI.Temp_K TBA_conferencerom_out;
  SI.Temp_K TBA_multipersonoffice_in;
  SI.Temp_K TBA_multipersonoffice_out;
  SI.Temp_K TBA_canteen_in;
  SI.Temp_K TBA_canteen_out;
  SI.Temp_K TBA_workshop_in;
  SI.Temp_K TBA_workshop_out;
  SI.Temp_K RoomTemp_Openplanoffice;
  SI.Temp_K RoomTemp_Conferenceroom;
  SI.Temp_K RoomTemp_Multipersonoffice;
  SI.Temp_K RoomTemp_Canteen;
  SI.Temp_K RoomTemp_Workshop;


  //MassflowRates
  SI.MassFlowRate heatpump_cold_massflow;
  SI.MassFlowRate heatpump_warm_massflow;
  SI.MassFlowRate Aircooler_massflow;
  SI.MassFlowRate generation_hot_massflow;
  SI.MassFlowRate RLT_central_warm;
  SI.MassFlowRate RLT_central_cold;
  SI.MassFlowRate RLT_openplanoffice_warm;
  SI.MassFlowRate RLT_openplanoffice_cold;
  SI.MassFlowRate RLT_conferenceroom_warm;
  SI.MassFlowRate RLT_conferenceroom_cold;
  SI.MassFlowRate RLT_multipersonoffice_warm;
  SI.MassFlowRate RLT_multipersonoffice_cold;
  SI.MassFlowRate RLT_canteen_warm;
  SI.MassFlowRate RLT_canteen_cold;
  SI.MassFlowRate RLT_workshop_warm;
  SI.MassFlowRate RLT_workshop_cold;
  SI.MassFlowRate TBA_openplanoffice;
  SI.MassFlowRate TBA_conferenceroom;
  SI.MassFlowRate TBA_multipersonoffice;
  SI.MassFlowRate TBA_canteen;
  SI.MassFlowRate TBA_workshop;

  //Power
  SI.Power Pump_Warmwater_heatpump_power "Power of warmwater heatpump pump";
  SI.Power Heatpump_small_power "Power of small heatpump";
  SI.Power Heatpump_big_power "Power of big heatpump";
  SI.Power Pump_generation_hot_power;
  SI.Power Pump_Coldwater_heatpump_power;
  SI.Power Pump_Coldwater_power;
  SI.Power Pump_Warmwater_power;
  SI.Power Pump_Hotwater_power;
  Real Electrical_power_CHP;
  SI.Power Pump_RLT_central_warm;
  SI.Power Pump_RLT_central_cold;
  SI.Power Pump_RLT_openplanoffice_warm;
  SI.Power Pump_RLT_openplanoffice_cold;
  SI.Power Pump_RLT_conferenceroom_warm;
  SI.Power Pump_RLT_conferenceroom_cold;
  SI.Power Pump_RLT_multipersonoffice_warm;
  SI.Power Pump_RLT_multipersonoffice_cold;
  SI.Power Pump_RLT_canteen_warm;
  SI.Power Pump_RLT_canteen_cold;
  SI.Power Pump_RLT_workshop_warm;
  SI.Power Pump_RLT_workshop_cold;
  SI.Power Pump_TBA_openplanoffice;
  SI.Power Pump_TBA_conferenceroom;
  SI.Power Pump_TBA_multipersonoffice;
  SI.Power Pump_TBA_canteen;
  SI.Power Pump_TBA_workshop;

  Real InternalLoad_Power;
  Real PV_Power;
  Real Sum_Power;

  Real Fuel_Boiler "kW";
  Real Fuel_CHP "kW";

  //COP
  Real Heatpump_small_COP;
  Real Heatpump_big_COP;

  //Humidity
  Real X_OpenplanOffice;
  Real X_Conferenceroom;
  Real X_Multipersonoffice;
  Real X_Canteen;
  Real X_Workshop;

  //Costs
  Real Total_Cost;

  //Time
  Real Minute;
  Integer Hour;
  Integer WeekDay;
end measureBus;