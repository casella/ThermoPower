within ThermoPower;
package Choices "Choice enumerations for ThermoPower models"
  package CylinderFourier
    type NodeDistribution = enumeration(
        uniform "Uniform distribution of node radii",
        thickInternal "Quadratically distributed node radii - thickest at rint", 

        thickExternal "Quadratically distributed node radii - thickest at rext", 

        thickBoth
          "Quadratically distributed node radii - thickest at both extremes")
      "Type, constants and menu choices for node distribution";

  end CylinderFourier;

  package CylinderMechanicalStress
    type MechanicalStandard = enumeration(
        TRDstandard "TRD standard",
        ASMEstandard "Laborelec-ASME standard")
      "Types, constants and menu choices for mechanical standard";
  end CylinderMechanicalStress;

  package Flow1D
    type FFtypes = enumeration(
        Kfnom "Kfnom friction factor",
        OpPoint "Friction factor defined by operating point",
        Cfnom "Cfnom friction factor",
        Colebrook "Colebrook's equation",
        NoFriction "No friction")
      "Type, constants and menu choices to select the friction factor";

    type HCtypes = enumeration(
        Middle "Middle of the pipe",
        Upstream "At the inlet",
        Downstream "At the outlet")
      "Type, constants and menu choices to select the location of the hydraulic capacitance";
  end Flow1D;

  package PressDrop
    type FFtypes = enumeration(
        Kf "Kf friction factor",
        OpPoint "Friction factor defined by operating point",
        Kinetic "Kinetic friction factor")
      "Type, constants and menu choices to select the friction factor";
  end PressDrop;

  package Valve
    type CvTypes = enumeration(
        Av "Av (metric) flow coefficient",
        Kv "Kv (metric) flow coefficient",
        Cv "Cv (US) flow coefficient",
        OpPoint "Av defined by nominal operating point")
      "Type, constants and menu choices to select the type of Cv data";
  end Valve;

  package TurboMachinery
    type TableTypes = enumeration(
        matrix "Explicitly supplied as parameter matrix table",
        file "Read from a file")
      "Type, constants and menu choices to select the representation of table matrix";
  end TurboMachinery;

  package Init "Options for initialisation"
    type Options = enumeration(
        noInit "No initial equations",
        steadyState "Steady-state initialisation",
        steadyStateNoP "Steady-state initialisation except pressures",
        steadyStateNoT "Steady-state initialisation except temperatures",
        steadyStateNoPT
          "Steady-state initialisation except pressures and temperatures")
      "Type, constants and menu choices to select the initialisation options";
  end Init;

  package FlowReversal "Options for flow reversal support"
    type Options = enumeration(
        fullFlowReversal "Full flow reversal support",
        smallFlowReversal "Small flow reversal allowed (approx. model)",
        noFlowReversal "Flow reversal is not allowed")
      "Type, constants and menu choices to select the flow reversal support options";
  end FlowReversal;

  package System
  type Dynamics = enumeration(
        DynamicFreeInitial
          "DynamicFreeInitial -- Dynamic balance, Initial guess value",
        FixedInitial "FixedInitial -- Dynamic balance, Initial value fixed",
        SteadyStateInitial
          "SteadyStateInitial -- Dynamic balance, Steady state initial with guess value", 

        SteadyState "SteadyState -- Steady state balance, Initial guess value")
      "Enumeration to define definition of balance equations";

  end System;

  package FluidPhase
    type FluidPhases = enumeration(
        Liquid "Liquid",
        Steam "Steam",
        TwoPhases "Two Phases")
      "Type, constants and menu choices to select the fluid phase";
  end FluidPhase;
end Choices;
