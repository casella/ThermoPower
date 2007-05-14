package Choices "Choice enumerations for ThermoPower models" 
  package CylinderFourier 
    package NodeDistribution 
      "Type, constants and menu choices for node distribution" 
      annotation(preferedView="text");
      import Modelica.Icons;
      extends Icons.Enumeration;
      constant Integer thickInternal = 0 
        "Quadratically distributed node radii - thickest at rint";
      constant Integer thickExternal = 1 
        "Quadratically distributed node radii - thickest at rext";
      constant Integer thickBoth = 2 
        "Quadratically distributed node radii - thickest at both extremes";
      type Temp 
        "Temporary type with choices for menus (until enumerations are available)" 
        extends Integer( min=0, max=2);
        annotation(Evaluate = true, choices(
          choice=ThermoPower.Choices.CylinderFourier.NodeDistribution.thickInternal 
              "Quadratically distributed node radii - thickest at rint",
          choice=ThermoPower.Choices.CylinderFourier.NodeDistribution.thickExternal 
              "Quadratically distributed node radii - thickest at rext",
          choice=ThermoPower.Choices.CylinderFourier.NodeDistribution.thickBoth 
              "Quadratically distributed node radii - thickest at both extremes"));
      end Temp;
    end NodeDistribution;
  end CylinderFourier;
  
  package CylinderMechanicalStress 
    package MechanicalStandard 
      "Types, constants and menu choices for mechanical standard" 
      annotation(preferedView="text");
      import Modelica.Icons;
      extends Icons.Enumeration;
      constant Integer TRDstandard = 0 "TRD standard";
      constant Integer ASMEstandard = 1 "Laborelec-ASME standard";
      type Temp 
        "Temporary type with choices for menus (until enumerations are available)" 
        extends Integer( min=0, max=1);
        annotation(Evaluate = true, choices(
          choice=ThermoPower.Choices.CylinderMechanicalStress.MechanicalStandard.TRDstandard 
              "TRD standard",
          choice=ThermoPower.Choices.CylinderMechanicalStress.MechanicalStandard.ASMEstandard 
              "Laborelec-ASME standard"));
      end Temp;
    end MechanicalStandard;
  end CylinderMechanicalStress;
  
  package Flow1D 
    package FFtypes 
      "Type, constants and menu choices to select the friction factor" 
      annotation (preferedView="text");
      import Modelica.Icons;
      extends Icons.Enumeration;
      constant Integer Kfnom = 0 "Kfnom friction factor";
      constant Integer OpPoint = 1 "Friction factor defined by operating point";
      constant Integer Cfnom = 2 "Cfnom friction factor";
      constant Integer Colebrook = 3 "Colebrook's equation";
      constant Integer NoFriction = 4 "No friction";
      type Temp 
        "Temporary type with choices for menus (until enumerations are available)" 
        extends Integer(min=0, max=4);
        annotation (Evaluate=true, choices(
          choice=ThermoPower.Choices.Flow1D.FFtypes.Kfnom 
              "Kfnom friction factor",
          choice=ThermoPower.Choices.Flow1D.FFtypes.OpPoint 
              "Friction factor defined by operating point",
          choice=ThermoPower.Choices.Flow1D.FFtypes.Cfnom 
              "Cfnom friction factor",
          choice=ThermoPower.Choices.Flow1D.FFtypes.Colebrook 
              "Colebrook's equation",
          choice=ThermoPower.Choices.Flow1D.FFtypes.NoFriction "No friction"));
      end Temp;
    end FFtypes;
    
    package HCtypes 
      "Type, constants and menu choices to select the location of the hydraulic capacitance" 
      annotation (preferedView="text");
      import Modelica.Icons;
      extends Icons.Enumeration;
      constant Integer Middle = 0 "Middle of the pipe";
      constant Integer Upstream = 1 "At the inlet";
      constant Integer Downstream = 2 "At the outlet";
      type Temp 
        "Temporary type with choices for menus (until enumerations are available)" 
        extends Integer(min=0, max=2);
        annotation (Evaluate=true, choices(
          choice=ThermoPower.Choices.Flow1D.HCtypes.Middle "Middle of the pipe",
          choice=ThermoPower.Choices.Flow1D.HCtypes.Upstream "At the inlet",
          choice=ThermoPower.Choices.Flow1D.HCtypes.Downstream "At the outlet"));
      end Temp;
    end HCtypes;
  end Flow1D;
  
  package PressDrop 
    package FFtypes 
      "Type, constants and menu choices to select the friction factor" 
      annotation (preferedView="text");
      extends Modelica.Icons.Enumeration;
      constant Integer Kf = 0 "Kf friction factor";
      constant Integer OpPoint = 1 "Friction factor defined by operating point";
      constant Integer Kinetic = 2 "Kinetic friction factor";
      type Temp 
        "Temporary type with choices for menus (until enumerations are available)" 
      extends Integer(min=0, max=2);
      annotation (Evaluate=true, choices(
        choice=ThermoPower.Choices.PressDrop.FFtypes.Kf "Kf friction factor",
        choice=ThermoPower.Choices.PressDrop.FFtypes.OpPoint 
              "Friction factor defined by operating point",
        choice=ThermoPower.Choices.PressDrop.FFtypes.Kinetic 
              "Kinetic friction factor"));
      end Temp;
    end FFtypes;
  end PressDrop;
  
  package Valve 
    package CvTypes 
      "Type, constants and menu choices to select the type of Cv data" 
      annotation (preferedView="text");
      extends Modelica.Icons.Enumeration;
      constant Integer Av = 0 "Av (metric) flow coefficient";
      constant Integer Kv = 1 "Kv (metric) flow coefficient";
      constant Integer Cv = 2 "Cv (US) flow coefficient";
      constant Integer OpPoint = 3 "Av defined by nominal operating point";
      type Temp 
        "Temporary type with choices for menus (until enumerations are available)" 
        extends Integer(min=0, max=3);
        annotation (Evaluate=true, choices(
          choice=ThermoPower.Choices.Valve.CvTypes.Av 
              "Av (metric) flow coefficient",
          choice=ThermoPower.Choices.Valve.CvTypes.Kv 
              "Kv (metric) flow coefficient",
          choice=ThermoPower.Choices.Valve.CvTypes.Cv 
              "Cv (US) flow coefficient",
          choice=ThermoPower.Choices.Valve.CvTypes.OpPoint 
              "Av defined by nominal operating point"));
      end Temp;
    end CvTypes;
  end Valve;
  
  package TurboMachinery 
    package TableTypes 
      "Type, constants and menu choices to select the representation of table matrix" 
      annotation (uses(Modelica(version="2.1")), Diagram);
      import Modelica.Icons;
      extends Icons.Enumeration;
      constant Integer matrix = 0 
        "Explicitly supplied as parameter matrix table";
      constant Integer file = 1 "Read from a file";
      type Temp 
        "Temporary type with choices for menus (until enumerations are available)" 
        extends Integer(min=0, max=1);
        annotation (Evaluate=true, choices(
          choice=ThermoPower.Choices.TurboMachinery.TableTypes.matrix 
              "parameter matrix",
          choice=ThermoPower.Choices.TurboMachinery.TableTypes.file 
              "read from a file"));
      end Temp;
    end TableTypes;
  end TurboMachinery;
  
  package Init "Options for initialisation" 
    package Options 
      "Type, constants and menu choices to select the initialisation options" 
      annotation (preferedView="text");
      extends Modelica.Icons.Enumeration;
      constant Integer noInit = 0 "No initial equations";
      constant Integer steadyState = 1 "Steady-state initialisation";
      constant Integer steadyStateNoP = 2 
        "Steady-state initialisation except pressures";
      constant Integer steadyStateNoT = 3 
        "Steady-state initialisation except temperatures";
      constant Integer steadyStateNoPT = 4 
        "Steady-state initialisation except pressures and temperatures";
      type Temp 
        "Temporary type with choices for menus (until enumerations are available)" 
        extends Integer(min=0, max=4);
        annotation (Evaluate=true, choices(
          choice=ThermoPower.Choices.Init.Options.noInit "No initial equations",
          choice=ThermoPower.Choices.Init.Options.steadyState 
              "Steady-state initialisation",
          choice=ThermoPower.Choices.Init.Options.steadyStateNoP 
              "Steady-state initialisation except pressures",
          choice=ThermoPower.Choices.Init.Options.steadyStateNoT 
              "Steady-state initialisation except temperatures",
          choice=ThermoPower.Choices.Init.Options.steadyStateNoPT 
              "Steady-state initialisation except pressures and temperatures"));
      end Temp;
    end Options;
  end Init;
end Choices;
