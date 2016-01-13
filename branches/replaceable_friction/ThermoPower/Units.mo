within ThermoPower;
package Units "Types with custom units"
  extends Modelica.Icons.Package;
  type HydraulicConductance = Real (final quantity="HydraulicConductance", final
        unit="(kg/s)/Pa");

  type HydraulicResistance = Real (final quantity="HydraulicResistance", final
        unit="Pa/(kg/s)");

  type LiquidDensity = SI.Density (start=1000, nominal = 1000)
    "start value for liquids";

  type GasDensity = SI.Density (start=5, nominal = 5)
    "start value for gases/vapours";

  type AbsoluteTemperature = SI.Temperature (start=300, nominal=500, min = 0)
    "Absolute temperature";

  type AbsolutePressure = SI.Pressure (start=1e5, min = 0) "generic pressure";
end Units;
