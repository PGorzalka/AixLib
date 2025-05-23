within AixLib.DataBase.ThermalZones.MultizoneInterzonalsFixedHeater;
record MorschenichSfhFixedHeater_storey_1
  "Record for storey 1 (heated zone) of MorschenichSfhFixedHeater"
  extends AixLib.DataBase.ThermalZones.ZoneBaseRecord(
    T_start = 293.15,
    withAirCap = true,
    VAir = 397.9080273398396,
    AZone = 159.20861405343825,
    hRad = 6.412173509324796,
    lat = 0.88645272708792,
    nOrientations = 4,
    AWin = {7.994727958935687, 0.0, 6.2814477487020985, 1.469956978567883},
    ATransparent = {7.994727958935687, 0.0, 6.2814477487020985, 1.469956978567883},
    hConWin = 2.7,
    RWin = 0.02262878108386785,
    gWin = 0.6000000000000001,
    UWin= 1.9004689468829976,
    ratioWinConRad = 0.02,
    AExt = {34.28652855778237, 33.681699350690096, 36.102416288624, 32.28027445628709},
    hConExt = 2.7000000000000006,
    nExt = 1,
    RExt = {0.0006272500902998506},
    RExtRem = 0.0038866948600443933,
    CExt = {45506467.997390226},
    AInt = 265.0503060847065,
    hConInt = 2.2008187229652214,
    nInt = 1,
    RInt = {0.00016316072251894653},
    CInt = {39941330.50149727},
    AFloor = 0.0,
    hConFloor = 0.0,
    nFloor = 1,
    RFloor = {0.0},
    RFloorRem =  0.0,
    CFloor = {0.0},
    ARoof = 43.589501009976416,
    hConRoof = 4.999999999999999,
    nRoof = 1,
    RRoof = {0.007652948221776212},
    RRoofRem = 0.04408800468163947,
    CRoof = {5709796.093657629},
    nOrientationsRoof = 2,
    tiltRoof = {0.8377580409572781, 0.8552113334772214},
    aziRoof = {1.239183768915974, -1.902408884673819},
    wfRoof = {0.4953221625478848, 0.5046778374521153},
    aRoof = 0.39999999999999997,
    aExt = 0.6000000000000001,
    nIze = 2,
    AIze = {50.52377022336238, 79.60430702671913},
    hConIze = {5.0, 0.8999999999999999},
    nIzeRC = 1,
    RIze = {{0.0035232809784288355}, {0.001417204190643372}},
    RIzeRem = {0.01989650625627657, 0.00602089152051407},
    CIze = {{7416783.851736129}, {10100425.349640716}},
    othZoneInd = {1, 2},
    zoneInd = 3,
    TSoil = 286.15,
    TSoiDatSou = AixLib.BoundaryConditions.GroundTemperature.DataSourceGroTem.File,
    TSoiOffTim = 6004800,
    TSoiAmp = 0,
    TSoiFil = Modelica.Utilities.Files.loadResource("modelica://AixLib/Resources/LowOrder_ExampleData/t_soil_MorschenichSfhFixedHeater.txt"),
    hConWallOut = 20.0,
    hRadWall = 5.0,
    hConWinOut = 20.0,
    hConRoofOut = 19.999999999999996,
    hRadRoof = 4.999999999999999,
    tiltExtWalls = {1.5707963267948966, 1.5707963267948966, 1.5707963267948966, 1.5707963267948966},
    aziExtWalls = {-0.47123889803846897, 1.0995574287564276, 2.670353755551324, -2.0420352248333655},
    wfWall = {0.269077037238337, 0.2107928510041719, 0.26679794378078975, 0.25333216797670155},
    wfWin = {0.5077264442169622, 0.0, 0.398920031596389, 0.09335352418664884},
    wfGro = 0.0,
    specificPeople = 0.02,
    internalGainsMoistureNoPeople = 0.5,
    fixedHeatFlowRatePersons = 70,
    activityDegree = 1.2,
    ratioConvectiveHeatPeople = 0.5,
    internalGainsMachinesSpecific = 2.0,
    ratioConvectiveHeatMachines = 0.75,
    lightingPowerSpecific = 7.0,
    ratioConvectiveHeatLighting = 0.5,
    useConstantACHrate = true,
    baseACH = 0.2,
    maxUserACH = 1.0,
    maxOverheatingACH = {3.0, 2.0},
    maxSummerACH = {1.0, 283.15, 290.15},
    winterReduction = {0.2, 273.15, 283.15},
    maxIrr = {10000.000000000002, 9999.9, 10000.0, 10000.0},
    shadingFactor = {0.0, 1.0, 0.0, 0.0},
    withAHU = false,
    minAHU = 0.3,
    maxAHU = 0.6,
    hHeat = 11549.094558470617,
    lHeat = 0,
    KRHeat = 10000,
    TNHeat = 1,
    HeaterOn = true,
    hCool = 0,
    lCool = -11549.094558470617,
    heaLoadFacOut = 360.9092049522068,
    heaLoadFacGrd = 0.0,
    KRCool = 10000,
    TNCool = 1,
    CoolerOn = false,
    withIdealThresholds = false,
    TThresholdHeater = 288.15,
    TThresholdCooler = 295.15);
end MorschenichSfhFixedHeater_storey_1;
