within ThermoPower;
package Media "Medium models for the ThermoPower library"
  extends Modelica.Icons.Package;

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
