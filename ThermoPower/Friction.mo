within ThermoPower;
package Friction "Friction models for 1D gas and water components"
  extends Modelica.Icons.Package;

  partial model FrictionModelBase "Base model for friction"

    input Medium.ThermodynamicState[N] fluidState;
    input Medium.MassFlowRate[N] w;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      "Medium model"
      annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
    parameter Integer N "Number of elements (volumes if FV, nodes if FEM)"
      annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
    parameter SI.Distance L "Tube length"
      annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
    parameter SI.Area A "Cross-sectional area (single tube)"
      annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
    final parameter SI.Length omega_hyd = 4*A/Dhyd
      "Wet perimeter (single tube)"
      annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
    parameter SI.Length Dhyd "Hydraulic Diameter (single tube)"
      annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
    parameter SI.MassFlowRate wnom "Nominal mass flow rate (single tube)"
      annotation(Dialog(enable=false, tab = "Set by Flow1D model"));

    output SI.CoefficientOfFriction[N] Cf "Fanning friction factor";

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end FrictionModelBase;

  model NoFriction "Ideal flow model"
    extends FrictionModelBase;

  equation

    Cf = zeros(N);

  end NoFriction;

  model NominalFriction "Constant friction factor flow model"
    extends FrictionModelBase;

    parameter SI.CoefficientOfFriction Cfnom "Nominal friction factor value";

  equation

    for i in 1:N loop
      Cf[i] = Cfnom;
    end for;

  end NominalFriction;

  model NominalOperatingPoint
    "Flow model with friction factor defined by operating point"
    extends FrictionModelBase;

    parameter SI.PressureDifference dpnom "Nominal pressure drop";
    parameter Medium.Density rhonom "Nominal density";

  equation

    for i in 1:N loop
      Cf[i] = 2*dpnom*A^3/(rhonom*wnom^2*omega_hyd*L);
    end for;

  end NominalOperatingPoint;

  model Colebrook "Colebrook flow model"
    extends FrictionModelBase;

    parameter SI.PerUnit e "Relative roughness (ratio roughness/diameter)";

  equation

    // use f_colebrook from the Water package to keep it backwards-compatible
    // (the function in the Gas package is identical)
    for i in 1:N loop
      Cf[i] = Water.f_colebrook(w,
        Dhyd/A,
        e,
        Medium.dynamicViscosity(fluidState[i]));
    end for;

  end Colebrook;
end Friction;
