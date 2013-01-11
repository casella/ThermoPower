within ThermoPower;
package Media "Medium models for the ThermoPower library"
  package LiquidWaterConstant "Simple incompressible water model"
    import ThermoPower;
    extends Modelica.Media.Interfaces.PartialMedium(
      mediumName="LiquidWaterConstant",
      singleState=true,
      reducedX=true,
      SpecificEnthalpy(start=1.0e5, nominal=5.0e5),
      Density(start=900, nominal=700),
      AbsolutePressure(start=50e5, nominal=10e5),
      Temperature(start=300, nominal=300));

    constant Pressure p0=1e5 "Reference pressure";
    constant Modelica.SIunits.Temperature T0=293.15 "Reference temperature";

    /*
  constant Modelica.SIunits.SpecificHeatCapacity cp0=4200;
  constant ThermoPower.Density rho0=998;
  constant RelativePressureCoefficient beta_r=2.5e-4;
  constant Modelica.SIunits.SpecificEnthalpy h0=1e5;
  constant Modelica.SIunits.DynamicViscosity eta0=0.00095;
  constant Modelica.SIunits.DynamicViscosity lambda0=0.6;
*/
    constant Modelica.SIunits.SpecificHeatCapacity cp0=
        Modelica.Media.Water.IF97_Utilities.cp_pT(p0, T0);
    constant ThermoPower.Density rho0=
        Modelica.Media.Water.IF97_Utilities.rho_pT(p0, T0);
    constant RelativePressureCoefficient beta0=
        Modelica.Media.Water.IF97_Utilities.beta_pT(p0, T0);
    constant Modelica.SIunits.SpecificEnthalpy h0=
        Modelica.Media.Water.IF97_Utilities.h_pT(p0, T0);
    constant Modelica.SIunits.DynamicViscosity eta0=
        Modelica.Media.Water.IF97_Utilities.dynamicViscosity(
          rho0,
          T0,
          p0);
    constant Modelica.SIunits.DynamicViscosity lambda0=
        Modelica.Media.Water.IF97_Utilities.thermalConductivity(
          rho0,
          T0,
          p0);

    redeclare record extends ThermodynamicState
      Modelica.SIunits.Temperature T;
    end ThermodynamicState;

    redeclare model extends BaseProperties "Base properties of medium"
    equation
      // h = cp0*(T-T0)+h0;
      T = T0 + (h - h0)/cp0;
      d = rho0*(1 - beta0*(T - T0));
      u = h;
      R = 1;
      MM = 0.018;
      state.T = T;
    end BaseProperties;

    redeclare function extends specificHeatCapacityCp
      "Return specific heat capacity at constant pressure"
    algorithm
      cp := cp0;
    end specificHeatCapacityCp;

    redeclare function extends specificHeatCapacityCv
      "Return specific heat capacity at constant volume"
    algorithm
      cv := cp0;
    end specificHeatCapacityCv;

    redeclare function extends density_derh_p
      "density derivative by specific enthalpy at const pressure"
    algorithm
      ddhp := -rho0*beta0/cp0;
    end density_derh_p;

    redeclare function extends density_derp_h
      "density derivative by pressure at const specific enthalpy"
    algorithm
      ddph := 0;
    end density_derp_h;

    redeclare function extends dynamicViscosity "Return dynamic viscosity"
    algorithm
      eta := eta0;
    end dynamicViscosity;

    redeclare function extends thermalConductivity
      "Return thermal conductivity"
    algorithm
      lambda := lambda0;
    end thermalConductivity;
  end LiquidWaterConstant;

  package GenericGas
    extends Modelica.Media.Interfaces.PartialMedium(nXi=0);
    redeclare record extends ThermodynamicState
      Pressure p;
      Temperature T;
      // MassFraction X[nXi];
    end ThermodynamicState;
  end GenericGas;

  package Air "Air as mixture of O2, N2, Ar and H2O"
    import Modelica.Media.IdealGases.*;
    extends Common.MixtureGasNasa(
      mediumName="Air",
      data={Common.SingleGasesData.O2,Common.SingleGasesData.H2O,Common.SingleGasesData.Ar,
          Common.SingleGasesData.N2},
      fluidConstants={Common.FluidData.O2,Common.FluidData.H2O,Common.FluidData.Ar,
          Common.FluidData.N2},
      substanceNames={"Oxygen","Water","Argon","Nitrogen"},
      reference_X={0.23,0.015,0.005,0.75});
  end Air;

  package NaturalGas "Mixture of N2, CO2, and CH4"
    import Modelica.Media.IdealGases.*;
    extends Common.MixtureGasNasa(
      mediumName="NaturalGas",
      data={Common.SingleGasesData.N2,Common.SingleGasesData.CO2,Common.SingleGasesData.CH4},

      substanceNames={"Nitrogen","Carbondioxide","Methane"},
      reference_X={0.02,0.012,0.968});
  end NaturalGas;

  package FlueGas "flue gas"
    import Modelica.Media.IdealGases.*;
    extends Common.MixtureGasNasa(
      mediumName="FlueGas",
      data={Common.SingleGasesData.O2,Common.SingleGasesData.Ar,Common.SingleGasesData.H2O,
          Common.SingleGasesData.CO2,Common.SingleGasesData.N2},
      fluidConstants={Common.FluidData.O2,Common.FluidData.Ar,Common.FluidData.H2O,
          Common.FluidData.CO2,Common.FluidData.N2},
      substanceNames={"Oxygen","Argon","Water","Carbondioxide","Nitrogen"},
      reference_X={0.23,0.02,0.01,0.04,0.7});

  end FlueGas;

  package CombustionGas "Mixture of O2, H2O, CO2, N2, CH4"
    import Modelica.Media.IdealGases.*;
    extends Common.MixtureGasNasa(
      mediumName="TestGas",
      data={Common.SingleGasesData.O2,Common.SingleGasesData.H2O,Common.SingleGasesData.CO2,
          Common.SingleGasesData.N2,Common.SingleGasesData.CH4},
      substanceNames={"Oxygen","Water","Carbondioxide","Nitrogen","Methane"},
      reference_X={0.23,0.03,0.04,0.5,0.2});

    annotation (Documentation(info="<html>
This Medium is a mixture of O2, H2O, CO2, N2, CH4. It has its reference composition, defined as <tt>Medium.reference_X</tt>, but only changing it, it can be reused as Air, just leading to zero the mass fraction of CH4, and as Fuel keeping only the mass fraction of CH4, as the unique gas.
</html>"));
  end CombustionGas;

end Media;
