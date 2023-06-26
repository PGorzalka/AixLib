within AixLib.BoundaryConditions.WeatherData;
block ReaderDWD "Reader for DWD-sourced weather files"

  parameter String filNam="" "Name of weather data file" annotation (
    Dialog(loadSelector(filter="Weather files (*.mos)",
                        caption="Select weather file")));

  ReaderTMY3 weaDat(
    filNam=filNam,
    computeWetBulbTemperature=false,
    pAtmSou=AixLib.BoundaryConditions.Types.DataSource.File,
    TDryBulSou=AixLib.BoundaryConditions.Types.DataSource.File,
    TDewPoiSou=AixLib.BoundaryConditions.Types.DataSource.Parameter,
    TBlaSkySou=AixLib.BoundaryConditions.Types.DataSource.File,
    relHumSou=AixLib.BoundaryConditions.Types.DataSource.File,
    winSpeSou=AixLib.BoundaryConditions.Types.DataSource.File,
    winDirSou=AixLib.BoundaryConditions.Types.DataSource.File,
    HInfHorSou=AixLib.BoundaryConditions.Types.DataSource.File,
    HSou=AixLib.BoundaryConditions.Types.RadiationDataSource.Input_HGloHor_HDifHor,
    ceiHeiSou=AixLib.BoundaryConditions.Types.DataSource.Parameter,
    totSkyCovSou=AixLib.BoundaryConditions.Types.DataSource.File,
    opaSkyCovSou=AixLib.BoundaryConditions.Types.DataSource.Parameter,
    calTSky=AixLib.BoundaryConditions.Types.SkyTemperatureCalculation.HorizontalRadiation)
    annotation (Placement(transformation(extent={{8,10},{28,30}})));

  Bus weaBus "Weather data bus" annotation (Placement(transformation(extent={{88,-10},
            {108,10}}),          iconTransformation(extent={{190,-10},{210,10}})));
protected
  final parameter Modelica.Units.SI.Time[2] timeSpan=
      AixLib.BoundaryConditions.WeatherData.BaseClasses.getTimeSpanTMY3(filNam,
      "tab1") "Start time, end time of weather data";
  Modelica.Blocks.Math.Add add30Min
    "Add 30 minutes to time to shift weather data reader"
    annotation (Placement(transformation(extent={{-50,62},{-30,82}})));
  Modelica.Blocks.Sources.Constant con30Min(final k=1800)
    "Constant used to shift weather data reader"
    annotation (Placement(transformation(extent={{-90,68},{-70,88}})));
  Modelica.Blocks.Tables.CombiTable1Ds datRea30Min(
    final tableOnFile=true,
    final tableName="tab1",
    final fileName=filNam,
    verboseRead=false,
    final smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    final columns={9,11})
       "Data reader with 30 min offset for solar irradiation"
    annotation (Placement(transformation(extent={{8,62},{28,82}})));
  BaseClasses.ConvertTime                                       conTimMin(final
      weaDatStaTim=timeSpan[1], final weaDatEndTim=timeSpan[2])
    "Convert simulation time to calendar time"
    annotation (Placement(transformation(extent={{-22,62},{-2,82}})));
  Utilities.Time.ModelTime        modTim "Model time"
    annotation (Placement(transformation(extent={{-90,36},{-70,56}})));
  Modelica.Blocks.Tables.CombiTable1Ds datRea(
    final tableOnFile=true,
    final tableName="tab1",
    final fileName=filNam,
    verboseRead=false,
    final smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    final columns={31})                   "Data reader"
    annotation (Placement(transformation(extent={{-14,-42},{6,-22}})));
  Modelica.Blocks.Math.Gain conTerRad(final k=-1)
    "Convert the terrestrial infrared radiation from downwards to upwards"
    annotation (Placement(transformation(extent={{20,-42},{40,-22}})));
  BaseClasses.ConvertTime                                       conTim(final
      weaDatStaTim=timeSpan[1], final weaDatEndTim=timeSpan[2])
    "Convert simulation time to calendar time"
    annotation (Placement(transformation(extent={{-44,-42},{-24,-22}})));
  BaseClasses.LimiterTerrestriallInfraredIrradiation limTerRad
    "Limits the terrestrial infrared irradiation"
    annotation (Placement(transformation(extent={{50,-42},{70,-22}})));
equation
  connect(modTim.y,add30Min. u2) annotation (Line(points={{-69,46},{-58,46},{-58,
          66},{-52,66}},    color={0,0,127}));
  connect(con30Min.y,add30Min. u1)
    annotation (Line(points={{-69,78},{-52,78}},     color={0,0,127}));
  connect(add30Min.y,conTimMin. modTim)
    annotation (Line(points={{-29,72},{-24,72}},   color={0,0,127}));
  connect(conTimMin.calTim,datRea30Min. u)
    annotation (Line(points={{-1,72},{6,72}},      color={0,0,127}));
  connect(datRea30Min.y[1], weaDat.HGloHor_in) annotation (Line(points={{29,72},
          {38,72},{38,36},{-18,36},{-18,7},{7,7}}, color={0,0,127}));
  connect(datRea30Min.y[2], weaDat.HDifHor_in) annotation (Line(points={{29,72},
          {38,72},{38,36},{-18,36},{-18,10.5},{7,10.5}}, color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{28,20},{44,20},{44,0},{98,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(conTerRad.u,datRea.y[1]) annotation (Line(points={{18,-32},{7,-32}},
                              color={0,0,127}));
  connect(conTim.calTim,datRea.u) annotation (Line(
      points={{-23,-32},{-16,-32}},
      color={0,0,127}));
  connect(modTim.y, conTim.modTim) annotation (Line(points={{-69,46},{-58,46},{-58,
          -32},{-46,-32}}, color={0,0,127}));
  connect(limTerRad.HTerIR, weaBus.HTerIR) annotation (Line(points={{71,-32},{
          78,-32},{78,0},{98,0}}, color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(conTerRad.y, limTerRad.u)
    annotation (Line(points={{41,-32},{48,-32}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ReaderDWD;
