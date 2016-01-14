within ThermoPower;
package Media "Medium models for the ThermoPower library"
  extends Modelica.Icons.Package;

  package GenericGas
    extends Modelica.Media.Interfaces.PartialMedium(nXi=0);
    redeclare record extends ThermodynamicState
      AbsolutePressure p;
      Temperature T;
      // MassFraction X[nXi];
    end ThermodynamicState;
  end GenericGas;

  package Air "Air as mixture of O2, N2, Ar and H2O"
    extends Modelica.Media.IdealGases.Common.MixtureGasNasa(
      mediumName="Air",
      data={Modelica.Media.IdealGases.Common.SingleGasesData.O2,
            Modelica.Media.IdealGases.Common.SingleGasesData.H2O,
            Modelica.Media.IdealGases.Common.SingleGasesData.Ar,
            Modelica.Media.IdealGases.Common.SingleGasesData.N2},
      fluidConstants={
            Modelica.Media.IdealGases.Common.FluidData.O2,
            Modelica.Media.IdealGases.Common.FluidData.H2O,
            Modelica.Media.IdealGases.Common.FluidData.Ar,
            Modelica.Media.IdealGases.Common.FluidData.N2},
      substanceNames={"Oxygen","Water","Argon","Nitrogen"},
      reference_X={0.23,0.015,0.005,0.75},
      referenceChoice=Modelica.Media.Interfaces.Choices.ReferenceEnthalpy.ZeroAt25C);
  end Air;

  package NaturalGas "Mixture of N2, CO2, and CH4"
    extends Modelica.Media.IdealGases.Common.MixtureGasNasa(
      mediumName="NaturalGas",
      data={Modelica.Media.IdealGases.Common.SingleGasesData.N2,
            Modelica.Media.IdealGases.Common.SingleGasesData.CO2,
            Modelica.Media.IdealGases.Common.SingleGasesData.CH4},
      fluidConstants={
            Modelica.Media.IdealGases.Common.FluidData.N2,
            Modelica.Media.IdealGases.Common.FluidData.CO2,
            Modelica.Media.IdealGases.Common.FluidData.CH4},
      substanceNames={"Nitrogen","Carbondioxide","Methane"},
      reference_X={0.02,0.012,0.968},
      referenceChoice=Modelica.Media.Interfaces.Choices.ReferenceEnthalpy.ZeroAt25C);

  end NaturalGas;

  package FlueGas "flue gas"
    extends Modelica.Media.IdealGases.Common.MixtureGasNasa(
      mediumName="FlueGas",
      data={Modelica.Media.IdealGases.Common.SingleGasesData.O2,
            Modelica.Media.IdealGases.Common.SingleGasesData.Ar,
            Modelica.Media.IdealGases.Common.SingleGasesData.H2O,
            Modelica.Media.IdealGases.Common.SingleGasesData.CO2,
            Modelica.Media.IdealGases.Common.SingleGasesData.N2},
      fluidConstants={
            Modelica.Media.IdealGases.Common.FluidData.O2,
            Modelica.Media.IdealGases.Common.FluidData.Ar,
            Modelica.Media.IdealGases.Common.FluidData.H2O,
            Modelica.Media.IdealGases.Common.FluidData.CO2,
            Modelica.Media.IdealGases.Common.FluidData.N2},
      substanceNames={"Oxygen","Argon","Water","Carbondioxide","Nitrogen"},
      reference_X={0.23,0.02,0.01,0.04,0.7},
      referenceChoice=Modelica.Media.Interfaces.Choices.ReferenceEnthalpy.ZeroAt25C);

  end FlueGas;

  package CombustionGas "Mixture of O2, H2O, CO2, N2, CH4"
    extends Modelica.Media.IdealGases.Common.MixtureGasNasa(
      mediumName="TestGas",
      data={Modelica.Media.IdealGases.Common.SingleGasesData.O2,
            Modelica.Media.IdealGases.Common.SingleGasesData.H2O,
            Modelica.Media.IdealGases.Common.SingleGasesData.CO2,
            Modelica.Media.IdealGases.Common.SingleGasesData.N2,
            Modelica.Media.IdealGases.Common.SingleGasesData.CH4},
      fluidConstants={
            Modelica.Media.IdealGases.Common.FluidData.O2,
            Modelica.Media.IdealGases.Common.FluidData.H2O,
            Modelica.Media.IdealGases.Common.FluidData.CO2,
            Modelica.Media.IdealGases.Common.FluidData.N2,
            Modelica.Media.IdealGases.Common.FluidData.CH4},
      substanceNames={"Oxygen","Water","Carbondioxide","Nitrogen","Methane"},
      reference_X={0.23,0.03,0.04,0.5,0.2},
      referenceChoice=Modelica.Media.Interfaces.Choices.ReferenceEnthalpy.ZeroAt25C);
    annotation (Documentation(info="<html>
This Medium is a mixture of O2, H2O, CO2, N2, CH4. It has its reference composition, defined as <tt>Medium.reference_X</tt>, but only changing it, it can be reused as Air, just leading to zero the mass fraction of CH4, and as Fuel keeping only the mass fraction of CH4, as the unique gas.
</html>"));
  end CombustionGas;
  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics={
        Line(
          points = {{-76,-80},{-62,-30},{-32,40},{4,66},{48,66},{73,45},{62,-8},{48,-50},{38,-80}},
          color={64,64,64},
          smooth=Smooth.Bezier),
        Line(
          points={{-40,20},{68,20}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-40,20},{-44,88},{-44,88}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{68,20},{86,-58}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-60,-28},{56,-28}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-60,-28},{-74,84},{-74,84}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{56,-28},{70,-80}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-76,-80},{38,-80}},
          color={175,175,175},
          smooth=Smooth.None),
        Line(
          points={{-76,-80},{-94,-16},{-94,-16}},
          color={175,175,175},
          smooth=Smooth.None)}));

end Media;
