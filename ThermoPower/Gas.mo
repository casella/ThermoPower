within ThermoPower;
package Gas "Models of components with ideal gases as working fluid"
  connector Flange "Flange connector for gas flows"
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    flow Medium.MassFlowRate m_flow
      "Mass flow rate from the connection point into the component";
    Medium.AbsolutePressure p "Thermodynamic pressure in the connection point";
    stream Medium.SpecificEnthalpy h_outflow
      "Specific thermodynamic enthalpy close to the connection point if m_flow < 0";
    stream Medium.MassFraction Xi_outflow[Medium.nXi]
      "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0";
    stream Medium.ExtraProperty C_outflow[Medium.nC]
      "Properties c_i/m close to the connection point if m_flow < 0";
    annotation (Icon(graphics), Documentation(info="<HTML>
</HTML>", revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end Flange;

  connector FlangeA "A-type flange connector for gas flows"
    extends Flange;
    annotation (Icon(graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={159,159,223},
            fillColor={159,159,223},
            fillPattern=FillPattern.Solid)}));
  end FlangeA;

  connector FlangeB "B-type flange connector for gas flows"
    extends Flange;
    annotation (Icon(graphics={Ellipse(
            extent={{-100,100},{100,-100}},
            lineColor={159,159,223},
            fillColor={159,159,223},
            fillPattern=FillPattern.Solid), Ellipse(
            extent={{-40,40},{40,-40}},
            lineColor={159,159,223},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));
  end FlangeB;
  extends Modelica.Icons.Package;

  model SourcePressure "Pressure source for gas flows"
    extends Icons.Gas.SourceP;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Medium.BaseProperties gas(
      p(start=p0),
      T(start=T),
      Xi(start=Xnom[1:Medium.nXi]));
    parameter SI.Pressure p0=101325 "Nominal pressure";
    parameter Units.HydraulicResistance R=0 "Hydraulic resistance";
    parameter Medium.Temperature T=300 "Nominal temperature";
    parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
      "Nominal gas composition";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    parameter Boolean use_in_p0 = false "Use connector input for the pressure" annotation(Dialog(group="External inputs"), choices(checkBox=true));
    parameter Boolean use_in_T = false
      "Use connector input for the temperature"                                  annotation(Dialog(group="External inputs"), choices(checkBox=true));
    parameter Boolean use_in_X = false
      "Use connector input for the composition"                                  annotation(Dialog(group="External inputs"), choices(checkBox=true));

    outer ThermoPower.System system "System wide properties";

    FlangeB flange(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_p0 if use_in_p0 annotation (Placement(
          transformation(
          origin={-60,64},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_T if use_in_T annotation (Placement(
          transformation(
          origin={0,90},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] if use_in_X annotation (Placement(
          transformation(
          origin={60,62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  protected
    Modelica.Blocks.Interfaces.RealInput in_p0_internal;
    Modelica.Blocks.Interfaces.RealInput in_T_internal;
    Modelica.Blocks.Interfaces.RealInput in_X_internal[Medium.nX];

  equation
    if R > 0 then
      flange.p = gas.p + flange.m_flow*R;
    else
      flange.p = gas.p;
    end if;

    gas.p = in_p0_internal;
    if not use_in_p0 then
      in_p0_internal = p0 "Pressure set by parameter";
    end if;

    gas.T = in_T_internal;
    if not use_in_T then
      in_T_internal = T "Temperature set by parameter";
    end if;

    gas.Xi = in_X_internal[1:Medium.nXi];
    if not use_in_X then
      in_X_internal = Xnom "Composition set by parameter";
    end if;

    flange.h_outflow = gas.h;
    flange.Xi_outflow = gas.Xi;

    // Connect protected connectors to public conditional connectors
    connect(in_p0, in_p0_internal);
    connect(in_T, in_T_internal);
    connect(in_X, in_X_internal);
    annotation (
      Icon(graphics),
      Diagram(graphics),
      Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package.In the case of multiple componet, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>, whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>R</tt> is set to zero, the pressure source is ideal; otherwise, the outlet pressure decreases proportionally to the outgoing flowrate.</p>
<p>If the <tt>in_p</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>p0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>p0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li> <br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end SourcePressure;

  model SinkPressure "Pressure sink for gas flows"
    extends Icons.Gas.SourceP;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Medium.BaseProperties gas(
      p(start=p0),
      T(start=T),
      Xi(start=Xnom[1:Medium.nXi]));
    parameter Medium.AbsolutePressure p0=101325 "Nominal pressure";
    parameter Medium.Temperature T=300 "Nominal temperature";
    parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
      "Nominal gas composition";
    parameter Units.HydraulicResistance R=0 "Hydraulic Resistance";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    parameter Boolean use_in_p0 = false "Use connector input for the pressure" annotation(Dialog(group="External inputs"), choices(checkBox=true));
    parameter Boolean use_in_T = false
      "Use connector input for the temperature"                                  annotation(Dialog(group="External inputs"), choices(checkBox=true));
    parameter Boolean use_in_X = false
      "Use connector input for the composition"                                  annotation(Dialog(group="External inputs"), choices(checkBox=true));

    outer ThermoPower.System system "System wide properties";

    FlangeA flange(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_p0 if use_in_p0 annotation (Placement(
          transformation(
          origin={-64.5,59.5},
          extent={{-12.5,-12.5},{12.5,12.5}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_T if use_in_T annotation (Placement(
          transformation(
          origin={0,90},
          extent={{-10,-12},{10,12}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] if use_in_X annotation (Placement(
          transformation(
          origin={66,59},
          extent={{-13,-14},{13,14}},
          rotation=270)));
  protected
    Modelica.Blocks.Interfaces.RealInput in_p0_internal;
    Modelica.Blocks.Interfaces.RealInput in_T_internal;
    Modelica.Blocks.Interfaces.RealInput in_X_internal[Medium.nX];
  equation
    if R > 0 then
      flange.p = gas.p + flange.m_flow*R;
    else
      flange.p = gas.p;
    end if;

    gas.p = in_p0_internal;
    if not use_in_p0 then
      in_p0_internal = p0 "Pressure set by parameter";
    end if;

    gas.T = in_T_internal;
    if not use_in_T then
      in_T_internal = T "Temperature set by parameter";
    end if;

    gas.Xi = in_X_internal[1:Medium.nXi];
    if not use_in_X then
      in_X_internal = Xnom "Composition set by parameter";
    end if;

    flange.h_outflow = gas.h;
    flange.Xi_outflow = gas.Xi;

    // Connect protected connectors to public conditional connectors
    connect(in_p0, in_p0_internal);
    connect(in_T, in_T_internal);
    connect(in_X, in_X_internal);

    annotation (Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>, whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>R</tt> is set to zero, the pressure sink is ideal; otherwise, the inlet pressure increases proportionally to the outgoing flowrate.</p>
<p>If the <tt>in_p</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>p0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>p0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li>
<br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end SinkPressure;

  model SourceMassFlow "Flow rate source for gas flows"
    extends Icons.Gas.SourceW;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Medium.BaseProperties gas(
      p(start=p0),
      T(start=T),
      Xi(start=Xnom[1:Medium.nXi]));
    parameter Medium.AbsolutePressure p0=101325 "Nominal pressure";
    parameter Medium.Temperature T=300 "Nominal temperature";
    parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
      "Nominal gas composition";
    parameter Medium.MassFlowRate w0=0 "Nominal mass flowrate";
    parameter Units.HydraulicConductance G=0 "HydraulicConductance";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    parameter Boolean use_in_w0 = false
      "Use connector input for the nominal flow rate" annotation(Dialog(group="External inputs"), choices(checkBox=true));
    parameter Boolean use_in_T = false
      "Use connector input for the temperature"                                  annotation(Dialog(group="External inputs"), choices(checkBox=true));
    parameter Boolean use_in_X = false
      "Use connector input for the composition"                                  annotation(Dialog(group="External inputs"), choices(checkBox=true));
    outer ThermoPower.System system "System wide properties";

    Medium.MassFlowRate w "Nominal mass flow rate";

    FlangeB flange(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_w0 if use_in_w0 annotation (Placement(
          transformation(
          origin={-60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_T if use_in_T annotation (Placement(
          transformation(
          origin={0,50},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] if use_in_X annotation (Placement(
          transformation(
          origin={60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  protected
    Modelica.Blocks.Interfaces.RealInput in_w0_internal;
    Modelica.Blocks.Interfaces.RealInput in_T_internal;
    Modelica.Blocks.Interfaces.RealInput in_X_internal[Medium.nX];

  equation
    if G > 0 then
      flange.m_flow = -w + (flange.p - p0)*G;
    else
      flange.m_flow = -w;
    end if;

    w = in_w0_internal;

    if not use_in_w0 then
      in_w0_internal = w0 "Flow rate set by parameter";
    end if;

    gas.T = in_T_internal;
    if not use_in_T then
      in_T_internal = T "Temperature set by parameter";
    end if;

    gas.Xi = in_X_internal[1:Medium.nXi];
    if not use_in_X then
      in_X_internal = Xnom "Composition set by parameter";
    end if;

    flange.p = gas.p;
    flange.h_outflow = gas.h;
    flange.Xi_outflow = gas.Xi;

    // Connect protected connectors to public conditional connectors
    connect(in_w0, in_w0_internal);
    connect(in_T, in_T_internal);
    connect(in_X, in_X_internal);

    annotation (Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>,whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>G</tt> is set to zero, the flowrate source is ideal; otherwise, the outgoing flowrate decreases proportionally to the outlet pressure.</p>
<p>If the <tt>in_w0</tt> connector is wired, then the source massflowrate is given by the corresponding signal, otherwise it is fixed to <tt>w0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>w0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li> <br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"), Diagram(graphics));
  end SourceMassFlow;

  model SinkMassFlow "Flow rate sink for gas flows"

    extends Icons.Gas.SourceW;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Medium.BaseProperties gas(
      p(start=p0),
      T(start=T),
      Xi(start=Xnom[1:Medium.nXi]));
    parameter Medium.AbsolutePressure p0=101325 "Nominal pressure";
    parameter Medium.Temperature T=300 "Nominal Temperature";
    parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
      "Nominal gas composition";
    parameter Medium.MassFlowRate w0=0 "Nominal mass flowrate";
    parameter Units.HydraulicConductance G=0 "Hydraulic Conductance";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    parameter Boolean use_in_w0 = false
      "Use connector input for the nominal flow rate" annotation(Dialog(group="External inputs"), choices(checkBox=true));
    parameter Boolean use_in_T = false
      "Use connector input for the temperature"                                  annotation(Dialog(group="External inputs"), choices(checkBox=true));
    parameter Boolean use_in_X = false
      "Use connector input for the composition"                                  annotation(Dialog(group="External inputs"), choices(checkBox=true));
    outer ThermoPower.System system "System wide properties";

    Medium.MassFlowRate w "Nominal mass flow rate";
    FlangeA flange(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));

    Modelica.Blocks.Interfaces.RealInput in_w0 if use_in_w0 annotation (Placement(
          transformation(
          origin={-60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_T if use_in_T annotation (Placement(
          transformation(
          origin={0,50},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] if use_in_X annotation (Placement(
          transformation(
          origin={60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));

  protected
    Modelica.Blocks.Interfaces.RealInput in_w0_internal;
    Modelica.Blocks.Interfaces.RealInput in_T_internal;
    Modelica.Blocks.Interfaces.RealInput in_X_internal[Medium.nX];
  equation
    if G > 0 then
      flange.m_flow = w + (flange.p - p0)*G;
    else
      flange.m_flow = w;
    end if;

    w = in_w0_internal;
    if not use_in_w0 then
      in_w0_internal = w0 "Flow rate set by parameter";
    end if;

    gas.T = in_T_internal;
    if not use_in_T then
      in_T_internal = T "Temperature set by parameter";
    end if;

    gas.Xi = in_X_internal[1:Medium.nXi];
    if not use_in_X then
      in_X_internal = Xnom "Composition set by parameter";
    end if;

    flange.p = gas.p;
    flange.h_outflow = gas.h;
    flange.Xi_outflow = gas.Xi;

    // Connect protected connectors to public conditional connectors
    connect(in_w0, in_w0_internal);
    connect(in_T, in_T_internal);
    connect(in_X, in_X_internal);

    annotation (
      Icon(graphics),
      Diagram(graphics),
      Documentation(info="<html>
<p>The actual gas used in the component is determined by the replaceable <tt>GasModel</tt> model. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>, whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>G</tt> is set to zero, the flowrate source is ideal; otherwise, the incoming flowrate increases proportionally to the outlet pressure.</p>
<p>If the <tt>in_w0</tt> connector is wired, then the source massflowrate is given by the corresponding signal, otherwise it is fixed to <tt>w0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>w0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li> <br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end SinkMassFlow;

  model ThroughMassFlow "Prescribes the mass flow rate across the component"
    extends Icons.Gas.SourceW;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    parameter Medium.MassFlowRate w0=0 "Nominal mass flow rate";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    parameter Boolean use_in_w0 = false
      "Use connector input for the nominal flow rate" annotation(Dialog(group="External inputs"), choices(checkBox=true));
    outer ThermoPower.System system "System wide properties";

    Medium.MassFlowRate w "Mass flow rate";

    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_w0 if use_in_w0 annotation (Placement(
          transformation(
          origin={-60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  protected
    Modelica.Blocks.Interfaces.RealInput in_w0_internal;
  equation
    inlet.m_flow + outlet.m_flow = 0 "Mass balance";
    inlet.m_flow = w "Flow characteristics";

    w = in_w0_internal;
    if not use_in_w0 then
      in_w0_internal = w0 "Flow rate set by parameter";
    end if;

    // Energy and partial mass balance
    inlet.h_outflow = inStream(outlet.h_outflow);
    inStream(inlet.h_outflow) = outlet.h_outflow;
    inlet.Xi_outflow = inStream(outlet.Xi_outflow);
    inStream(inlet.Xi_outflow) = outlet.Xi_outflow;

    // Connect protected connectors to public conditional connectors
    connect(in_w0, in_w0_internal);

    annotation (Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>,whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>G</tt> is set to zero, the flowrate source is ideal; otherwise, the outgoing flowrate decreases proportionally to the outlet pressure.</p>
<p>If the <tt>in_w0</tt> connector is wired, then the source massflowrate is given by the corresponding signal, otherwise it is fixed to <tt>w0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>w0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li> <br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"), Diagram(graphics));
  end ThroughMassFlow;

  model Plenum "Rigid adiabatic volume"
    extends Icons.Gas.Mixer;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Medium.BaseProperties gas(
      p(start=pstart, stateSelect=StateSelect.prefer),
      T(start=Tstart, stateSelect=StateSelect.prefer),
      Xi(start=Xstart[1:Medium.nXi], stateSelect=StateSelect.prefer));
    parameter SI.Volume V "Inner volume";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    parameter Medium.AbsolutePressure pstart=1e5 "Pressure start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tstart=300 "Temperature start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.MassFraction Xstart[Medium.nX]=Medium.reference_X
      "Start gas composition" annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt=system.initOpt
      "Initialisation option"
      annotation (Dialog(tab="Initialisation"));
    parameter Boolean noInitialPressure=false
      "Remove initial equation on pressure"
      annotation (Dialog(tab="Initialisation"),choices(checkBox=true));
    parameter Boolean noInitialTemperature=false
      "Remove initial equation on temperature"
      annotation (Dialog(tab="Initialisation"),choices(checkBox=true));

    SI.Mass M "Total mass";
    SI.InternalEnergy E "Total internal energy";
    Medium.SpecificEnthalpy hi "Inlet specific enthalpy";
    Medium.SpecificEnthalpy ho "Outlet specific enthalpy";
    Medium.MassFraction Xi_i[Medium.nXi] "Inlet composition";
    Medium.MassFraction Xi_o[Medium.nXi] "Outlet composition";
    SI.Time Tr "Residence Time";

    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    replaceable Thermal.HT thermalPort annotation (Placement(transformation(
            extent={{-40,60},{40,80}}, rotation=0)));
  equation
    M = gas.d*V "Gas mass";
    E = M*gas.u "Gas internal energy";
    der(M) = inlet.m_flow + outlet.m_flow "Mass balance";
    der(E) = inlet.m_flow*hi + outlet.m_flow*ho + thermalPort.Q_flow
      "Energy balance";
    for j in 1:Medium.nXi loop
      M*der(gas.Xi[j]) = inlet.m_flow*(Xi_i[j] - gas.Xi[j]) + outlet.m_flow*(
        Xi_o[j] - gas.Xi[j]) "Independent component mass balance";
    end for;

    // Boundary conditions
    hi = homotopy(if not allowFlowReversal then inStream(inlet.h_outflow) else
      actualStream(inlet.h_outflow), inStream(inlet.h_outflow));
    Xi_i = homotopy(if not allowFlowReversal then inStream(inlet.Xi_outflow)
       else actualStream(inlet.Xi_outflow), inStream(inlet.Xi_outflow));
    ho = homotopy(if not allowFlowReversal then gas.h else actualStream(outlet.h_outflow),
      gas.h);
    Xi_o = homotopy(if not allowFlowReversal then gas.Xi else actualStream(
      outlet.Xi_outflow), gas.Xi);
    inlet.h_outflow = gas.h;
    inlet.Xi_outflow = gas.Xi;
    outlet.h_outflow = gas.h;
    outlet.Xi_outflow = gas.Xi;
    inlet.p = gas.p;
    outlet.p = gas.p;
    thermalPort.T = gas.T;

    Tr = noEvent(M/max(abs(-outlet.m_flow), Modelica.Constants.eps))
      "Residence time";
  initial equation
    // Initial conditions
    if initOpt == Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.fixedState then
      if not noInitialPressure then
        gas.p = pstart;
      end if;
      if not noInitialTemperature then
        gas.T = Tstart;
      end if;
      gas.Xi = Xstart[1:Medium.nXi];
    elseif initOpt == Choices.Init.Options.steadyState then
      if not noInitialPressure then
        der(gas.p) = 0;
      end if;
      if not noInitialTemperature then
        der(gas.T) = 0;
      end if;
      der(gas.Xi) = zeros(Medium.nXi);
    elseif initOpt == Choices.Init.Options.steadyStateNoP then
      if not noInitialTemperature then
        der(gas.T) = 0;
      end if;
      der(gas.Xi) = zeros(Medium.nXi);
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Documentation(info="<html>
<p>This model describes a rigid, adiabatic control volume.
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the start composition is given by <tt>Xstart</tt>, whose default value is <tt>Medium.reference_X</tt> .
</html>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Icon(graphics),
      Diagram(graphics));
  end Plenum;

  model Header "Header with metal walls for gas flows"
    extends Icons.Gas.Mixer;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Medium.BaseProperties gas(
      p(start=pstart, stateSelect=StateSelect.prefer),
      T(start=Tstart, stateSelect=StateSelect.prefer),
      Xi(start=Xstart[1:Medium.nXi], stateSelect=StateSelect.prefer));
    parameter Medium.Temperature Tmstart=300 "Metal wall start temperature";
    parameter SI.Volume V "Inner volume";
    parameter SI.Area S=0 "Inner surface";
    parameter SI.CoefficientOfHeatTransfer gamma=0 "Heat Transfer Coefficient"
      annotation (Evaluate=true);
    parameter SI.HeatCapacity Cm=0 "Metal Heat Capacity" annotation (Evaluate=true);
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    parameter Medium.AbsolutePressure pstart=1e5 "Pressure start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tstart=300 "Temperature start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.MassFraction Xstart[Medium.nX]=Medium.reference_X
      "Start gas composition" annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt=system.initOpt
      "Initialisation option"
      annotation (Dialog(tab="Initialisation"));
    parameter Boolean noInitialPressure=false
      "Remove initial equation on pressure"
      annotation (Dialog(tab="Initialisation"),choices(checkBox=true));
    parameter Boolean noInitialTemperature=false
      "Remove initial equation on temperature"
      annotation (Dialog(tab="Initialisation"),choices(checkBox=true));

    SI.Mass M "Gas total mass";
    SI.InternalEnergy E "Gas total energy";
    Medium.SpecificEnthalpy hi "Inlet specific enthalpy";
    Medium.SpecificEnthalpy ho "Outlet specific enthalpy";
    Medium.MassFraction Xi_i[Medium.nXi] "Inlet composition";
    Medium.MassFraction Xi_o[Medium.nXi] "Outlet composition";
    SI.Temperature Tm(start=Tmstart) "Wall temperature";
    SI.Time Tr "Residence Time";

    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    replaceable Thermal.HT thermalPort annotation (Placement(transformation(
            extent={{-40,60},{40,80}}, rotation=0)));
  equation
    M = gas.d*V "Gas mass";
    E = gas.u*M "Gas internal energy";
    der(M) = inlet.m_flow + outlet.m_flow "Mass balance";
    der(E) = inlet.m_flow*hi + outlet.m_flow*ho - gamma*S*(gas.T - Tm) +
      thermalPort.Q_flow "Energy balance";
    for j in 1:Medium.nXi loop
      M*der(gas.Xi[j]) = inlet.m_flow*(Xi_i[j] - gas.Xi[j]) + outlet.m_flow*(
        Xi_o[j] - gas.Xi[j]) "Independent component mass balance";
    end for;
    if Cm > 0 and gamma > 0 then
      Cm*der(Tm) = gamma*S*(gas.T - Tm) "Metal wall energy balance";
    else
      Tm = gas.T;
    end if;

    // Boundary conditions
    hi = homotopy(if not allowFlowReversal then inStream(inlet.h_outflow) else
      actualStream(inlet.h_outflow), inStream(inlet.h_outflow));
    Xi_i = homotopy(if not allowFlowReversal then inStream(inlet.Xi_outflow)
       else actualStream(inlet.Xi_outflow), inStream(inlet.Xi_outflow));
    ho = homotopy(if not allowFlowReversal then gas.h else actualStream(outlet.h_outflow),
      gas.h);
    Xi_o = homotopy(if not allowFlowReversal then gas.Xi else actualStream(
      outlet.Xi_outflow), gas.Xi);
    inlet.p = gas.p;
    inlet.h_outflow = gas.h;
    inlet.Xi_outflow = gas.Xi;
    outlet.p = gas.p;
    outlet.h_outflow = gas.h;
    outlet.Xi_outflow = gas.Xi;
    thermalPort.T = gas.T;

    Tr = noEvent(M/max(abs(-outlet.m_flow), Modelica.Constants.eps))
      "Residence time";
  initial equation
    // Initial conditions
    if initOpt == Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.fixedState then
      if not noInitialPressure then
        gas.p = pstart;
      end if;
      if not noInitialTemperature then
        gas.T = Tstart;
      end if;
      gas.Xi = Xstart[1:Medium.nXi];
      if (Cm > 0 and gamma > 0) then
        Tm  = Tmstart;
      end if;
    elseif initOpt == Choices.Init.Options.steadyState then
      if not noInitialPressure then
        der(gas.p) = 0;
      end if;
      if not noInitialTemperature then
        der(gas.T) = 0;
      end if;
      der(gas.Xi) = zeros(Medium.nXi);
      if (Cm > 0 and gamma > 0) then
        der(Tm) = 0;
      end if;
    elseif initOpt == Choices.Init.Options.steadyStateNoP then
      if not noInitialTemperature then
        der(gas.T) = 0;
      end if;
      der(gas.Xi) = zeros(Medium.nXi);
      if (Cm > 0 and gamma > 0) then
        der(Tm) = 0;
      end if;
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Icon(graphics),
      Documentation(info="<html>
<p>This model describes a constant volume buffer with metal walls. The metal wall temperature and the heat transfer coefficient between the wall and the fluid are uniform. The wall is thermally insulated from the outside.</p>
<p>If the inlet or the outlet are connected to a bank of tubes, the model can actually represent a collector or a distributor.</p>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the start composition is given by <tt>Xstart</tt>, whose default value is <tt>Medium.reference_X</tt> .
</html>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),   Diagram(graphics));
  end Header;

  model Mixer "Mixer with metal walls for gas flows"
    extends Icons.Gas.Mixer;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Medium.BaseProperties gas(
      p(start=pstart, stateSelect=StateSelect.prefer),
      T(start=Tstart, stateSelect=StateSelect.prefer),
      Xi(start=Xstart[1:Medium.nXi], stateSelect=StateSelect.prefer));
    parameter SI.Volume V "Inner volume";
    parameter SI.Area S=0 "Inner surface";
    parameter SI.CoefficientOfHeatTransfer gamma=0 "Heat Transfer Coefficient"
      annotation (Evaluate=true);
    parameter SI.HeatCapacity Cm=0 "Metal heat capacity" annotation (Evaluate=true);
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    parameter Medium.AbsolutePressure pstart=1e5 "Pressure start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tstart=300 "Temperature start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.MassFraction Xstart[Medium.nX]=Medium.reference_X
      "Start gas composition" annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tmstart=Tstart "Metal wall start temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt=system.initOpt
      "Initialisation option"
      annotation (Dialog(tab="Initialisation"));
    parameter Boolean noInitialPressure=false
      "Remove initial equation on pressure"
      annotation (Dialog(tab="Initialisation"),choices(checkBox=true));
    parameter Boolean noInitialTemperature=false
      "Remove initial equation on temperature"
      annotation (Dialog(tab="Initialisation"),choices(checkBox=true));

    SI.Mass M "Gas total mass";
    SI.InternalEnergy E "Gas total energy";
    SI.Temperature Tm(start=Tmstart) "Wall temperature";
    Medium.SpecificEnthalpy hi1 "Inlet 1 specific enthalpy";
    Medium.SpecificEnthalpy hi2 "Inlet 2 specific enthalpy";
    Medium.SpecificEnthalpy ho "Outlet specific enthalpy";
    Medium.MassFraction Xi1[Medium.nXi] "Inlet 1 composition";
    Medium.MassFraction Xi2[Medium.nXi] "Inlet 2 composition";
    Medium.MassFraction Xo[Medium.nXi] "Outlet composition";
    SI.Time Tr "Residence time";

    FlangeA in1(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-100,40},{-60,80}}, rotation=0)));
    FlangeB out(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    FlangeA in2(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-100,-80},{-60,-40}}, rotation=0)));

    replaceable Thermal.HT thermalPort annotation (Placement(transformation(
            extent={{-38,60},{42,80}}, rotation=0)));
  equation
    M = gas.d*V "Gas mass";
    E = M*gas.u "Gas internal energy";
    der(M) = in1.m_flow + in2.m_flow + out.m_flow "Mass balance";
    der(E) = in1.m_flow*hi1 + in2.m_flow*hi2 + out.m_flow*ho - gamma*S*(gas.T
       - Tm) + thermalPort.Q_flow "Energy balance";
    for j in 1:Medium.nXi loop
      M*der(gas.Xi[j]) = in1.m_flow*(Xi1[j] - gas.Xi[j]) + in2.m_flow*(Xi2[j]
         - gas.Xi[j]) + out.m_flow*(Xo[j] - gas.Xi[j])
        "Independent component mass balance";
    end for;
    if Cm > 0 and gamma > 0 then
      Cm*der(Tm) = gamma*S*(gas.T - Tm) "Metal wall energy balance";
    else
      Tm = gas.T;
    end if;

    // Boundary conditions
    hi1 = homotopy(if not allowFlowReversal then inStream(in1.h_outflow) else
      actualStream(in1.h_outflow), inStream(in1.h_outflow));
    Xi1 = homotopy(if not allowFlowReversal then inStream(in1.Xi_outflow) else
      actualStream(in1.Xi_outflow), inStream(in1.Xi_outflow));
    hi2 = homotopy(if not allowFlowReversal then inStream(in2.h_outflow) else
      actualStream(in2.h_outflow), inStream(in2.h_outflow));
    Xi2 = homotopy(if not allowFlowReversal then inStream(in2.Xi_outflow) else
      actualStream(in2.Xi_outflow), inStream(in2.Xi_outflow));
    ho = homotopy(if not allowFlowReversal then gas.h else actualStream(out.h_outflow),
      gas.h);
    Xo = homotopy(if not allowFlowReversal then gas.Xi else actualStream(out.Xi_outflow),
      gas.Xi);
    in1.p = gas.p;
    in1.h_outflow = gas.h;
    in1.Xi_outflow = gas.Xi;
    in2.p = gas.p;
    in2.h_outflow = gas.h;
    in2.Xi_outflow = gas.Xi;
    out.p = gas.p;
    out.h_outflow = gas.h;
    out.Xi_outflow = gas.Xi;
    thermalPort.T = gas.T;

    Tr = noEvent(M/max(abs(-out.m_flow), Modelica.Constants.eps))
      "Residence time";
  initial equation
    // Initial conditions
    if initOpt == Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.fixedState then
      if not noInitialPressure then
        gas.p = pstart;
      end if;
      if not noInitialTemperature then
        gas.T = Tstart;
      end if;
      gas.Xi = Xstart[1:Medium.nXi];
      if (Cm > 0 and gamma > 0) then
        Tm  = Tmstart;
      end if;
    elseif initOpt == Choices.Init.Options.steadyState then
      if not noInitialPressure then
        der(gas.p) = 0;
      end if;
      if not noInitialTemperature then
        der(gas.T) = 0;
      end if;
      der(gas.Xi) = zeros(Medium.nXi);
      if (Cm > 0 and gamma > 0) then
        der(Tm) = 0;
      end if;
    elseif initOpt == Choices.Init.Options.steadyStateNoP then
      if not noInitialTemperature then
        der(gas.T) = 0;
      end if;
      der(gas.Xi) = zeros(Medium.nXi);
      if (Cm > 0 and gamma > 0) then
        der(Tm) = 0;
      end if;
    else
      assert(false, "Unsupported initialisation option");
    end if;

    annotation (
      Documentation(info="<html>
<p>This model describes a constant volume mixer with metal walls. The metal wall temperature and the heat transfer coefficient between the wall and the fluid are uniform. The wall is thermally insulated from the outside.</p>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the start composition is given by <tt>Xstart</tt>, whose default value is <tt>Medium.reference_X</tt>.
</html>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Icon(graphics),
      Diagram(graphics));
  end Mixer;

  model Flow1DFV "1-dimensional fluid flow model for gas (finite volumes)"
    extends BaseClasses.Flow1DBase;

    Thermal.DHTVolumes wall(final N=Nw)
      annotation (Placement(transformation(extent={{-60,40},{60,60}}, rotation=0)));

    replaceable model HeatTransfer = Thermal.HeatTransferFV.IdealHeatTransfer
      constrainedby ThermoPower.Thermal.BaseClasses.DistributedHeatTransferFV
      annotation (choicesAllMatching=true);
    HeatTransfer heatTransfer(
      redeclare package Medium = Medium,
      final Nf=N,
      final Nw=Nw,
      final Nt=Nt,
      final L=L,
      final A=A,
      final Dhyd=Dhyd,
      final omega=omega,
      final wnom=wnom/Nt,
      final w=w*ones(N),
      final fluidState=gas.state) "Instantiated heat transfer model";

    Medium.BaseProperties gas[N] "Gas nodal properties";
    SI.Pressure Dpfric "Pressure drop due to friction";
    SI.Length omega_hyd "Wet perimeter (single tube)";
    Real Kf "Friction factor";
    Real Kfl "Linear friction factor";
    Real dwdt "Time derivative of mass flow rate";
    SI.PerUnit Cf "Fanning friction factor";
    Medium.MassFlowRate w(start=wnom/Nt) "Mass flowrate (single tube)";
    Medium.Temperature Ttilde[N - 1](start=ones(N - 1)*Tstartin + (1:(N - 1))/
          (N - 1)*(Tstartout - Tstartin), each stateSelect=StateSelect.prefer)
      "Temperature state variables";
    Medium.Temperature T[N] "Node temperatures";
    Medium.SpecificEnthalpy h[N] "Node specific enthalpies";
    Medium.Temperature Tin(start=Tstartin);
    Medium.MassFraction Xtilde[if UniformComposition or Medium.fixedX then 1 else N - 1, nX](
        start=ones(size(Xtilde, 1), size(Xtilde, 2))*diagonal(Xstart[1:nX]),
        each stateSelect=StateSelect.prefer) "Composition state variables";
    Medium.MassFlowRate wbar[N - 1](each start=wnom/Nt);
    SI.Power Q_single[N-1] = heatTransfer.Qvol/Nt
      "Heat flows entering the volumes from the lateral boundary (single tube)";
    SI.Velocity u[N] "Fluid velocity";
    Medium.AbsolutePressure p(start=pstart, stateSelect=StateSelect.prefer);
    SI.Time Tr "Residence time";
    SI.Mass M "Gas Mass (single tube)";
    SI.Mass Mtot "Gas Mass (total)";
    SI.Power Q "Total heat flow through the wall (all Nt tubes)";
  protected
    parameter SI.Length l=L/(N - 1) "Length of a single volume";
    Medium.Density rhobar[N - 1] "Fluid average density";
    SI.SpecificVolume vbar[N - 1] "Fluid average specific volume";
    Medium.DerDensityByPressure drbdp[N - 1]
      "Derivative of average density by pressure";
    Medium.DerDensityByTemperature drbdT1[N - 1]
      "Derivative of average density by left temperature";
    Medium.DerDensityByTemperature drbdT2[N - 1]
      "Derivative of average density by right temperature";
    Real drbdX1[N - 1, nX](each unit="kg/m3")
      "Derivative of average density by left composition";
    Real drbdX2[N - 1, nX](each unit="kg/m3")
      "Derivative of average density by right composition";
    Medium.SpecificHeatCapacity cvbar[N - 1] "Average cv";
    SI.MassFlowRate dMdt[N - 1] "Derivative of mass in a finite volume";
    Medium.SpecificHeatCapacity cv[N];
    Medium.DerDensityByTemperature dddT[N]
      "Derivative of density by temperature";
    Medium.DerDensityByPressure dddp[N] "Derivative of density by pressure";
    Real dddX[N, nX](each unit="kg/m3") "Derivative of density by composition";
  equation
    assert(FFtype == ThermoPower.Choices.Flow1D.FFtypes.NoFriction or dpnom > 0,
      "dpnom=0 not supported, it is also used in the homotopy trasformation during the inizialization");
    //All equations are referred to a single tube
    // Friction factor selection
    omega_hyd = 4*A/Dhyd;
    if FFtype == ThermoPower.Choices.Flow1D.FFtypes.Kfnom then
      Kf = Kfnom*Kfc;
      Cf = 2*Kf*A^3/(omega_hyd*L);
    elseif FFtype == ThermoPower.Choices.Flow1D.FFtypes.OpPoint then
      Kf = dpnom*rhonom/(wnom/Nt)^2*Kfc;
      Cf = 2*Kf*A^3/(omega_hyd*L);
    elseif FFtype == ThermoPower.Choices.Flow1D.FFtypes.Cfnom then
      Kf = Cfnom*omega_hyd*L/(2*A^3)*Kfc;
      Cf = Cfnom*Kfc;
    elseif FFtype == ThermoPower.Choices.Flow1D.FFtypes.Colebrook then
      Cf = f_colebrook(
          w,
          Dhyd/A,
          e,
          Medium.dynamicViscosity(gas[integer(N/2)].state))*Kfc;
      Kf = Cf*omega_hyd*L/(2*A^3);
    elseif FFtype == ThermoPower.Choices.Flow1D.FFtypes.NoFriction then
      Cf = 0;
      Kf = 0;
    else
      assert(false, "Unsupported FFtype");
      Cf = 0;
      Kf = 0;
    end if;
    assert(Kf >= 0, "Negative friction coefficient");
    Kfl = wnom/Nt*wnf*Kf "Linear friction factor";

    // Dynamic momentum term
    dwdt = if DynamicMomentum and not QuasiStatic then der(w) else 0;

    sum(dMdt) = (infl.m_flow + outfl.m_flow)/Nt "Mass balance";
    L/A*dwdt + (outfl.p - infl.p) + Dpfric = 0 "Momentum balance";
    Dpfric = (if FFtype == ThermoPower.Choices.Flow1D.FFtypes.NoFriction then 0
              else homotopy((smooth(1, Kf*squareReg(w, wnom/Nt*wnf))*sum(vbar)/(N - 1)),
                             dpnom/(wnom/Nt)*w))
      "Pressure drop due to friction";
    for j in 1:N - 1 loop
      if not QuasiStatic then
        // Dynamic mass and energy balances
        A*l*rhobar[j]*cvbar[j]*der(Ttilde[j]) + wbar[j]*(gas[j + 1].h - gas[j].h)
          = Q_single[j] "Energy balance";
        dMdt[j] = A*l*(drbdp[j]*der(p) + drbdT1[j]*der(gas[j].T) + drbdT2[j]*
          der(gas[j + 1].T) + vector(drbdX1[j, :])*vector(der(gas[j].X)) +
          vector(drbdX2[j, :])*vector(der(gas[j + 1].X))) "Mass balance";
        /*
      dMdt[j] = A*l*(drbdT[j]*der(Ttilde[j]) + drbdp[j]*der(p) + vector(drbdX[j, :])*
      vector(der(Xtilde[if UniformComposition then 1 else j, :])))
      "Mass balance";
*/
        // Average volume quantities
        if avoidInletEnthalpyDerivative and j == 1 then
          // first volume properties computed by the volume outlet properties
          rhobar[j] = gas[j + 1].d;
          drbdp[j] = dddp[j + 1];
          drbdT1[j] = 0;
          drbdT2[j] = dddT[j + 1];
          drbdX1[j, :] = zeros(size(Xtilde, 2));
          drbdX2[j, :] = dddX[j + 1, :];
        else
          // volume properties computed by averaging
          rhobar[j] = (gas[j].d + gas[j + 1].d)/2;
          drbdp[j] = (dddp[j] + dddp[j + 1])/2;
          drbdT1[j] = dddT[j]/2;
          drbdT2[j] = dddT[j + 1]/2;
          drbdX1[j, :] = dddX[j, :]/2;
          drbdX2[j, :] = dddX[j + 1, :]/2;
        end if;
        vbar[j] = 1/rhobar[j];
        wbar[j] = homotopy(infl.m_flow/Nt - sum(dMdt[1:j - 1]) - dMdt[j]/2,
          wnom/Nt);
        cvbar[j] = (cv[j] + cv[j + 1])/2;
      else
        // Static mass and energy balances
        wbar[j]*(gas[j + 1].h - gas[j].h) = Q_single[j] "Energy balance";
        dMdt[j] = 0 "Mass balance";
        // Dummy values for unused average quantities
        rhobar[j] = 0;
        drbdp[j] = 0;
        drbdT1[j] = 0;
        drbdT2[j] = 0;
        drbdX1[j, :] = zeros(nX);
        drbdX2[j, :] = zeros(nX);
        vbar[j] = 0;
        wbar[j] = infl.m_flow/Nt;
        cvbar[j] = 0;
      end if;
    end for;
    Q = heatTransfer.Q "Total heat flow through the lateral boundary";
    if Medium.fixedX then
      Xtilde = fill(Medium.reference_X, 1);
    elseif QuasiStatic then
      Xtilde = fill(gas[1].X, size(Xtilde, 1))
        "Gas composition equal to actual inlet";
    elseif UniformComposition then
      der(Xtilde[1, :]) = homotopy(1/L*sum(u)/N*(gas[1].X - gas[N].X), 1/L*unom
        *(gas[1].X - gas[N].X)) "Partial mass balance for the whole pipe";
    else
      for j in 1:N - 1 loop
        der(Xtilde[j, :]) = homotopy((u[j + 1] + u[j])/(2*l)*(gas[j].X - gas[j
           + 1].X), 1/L*unom*(gas[j].X - gas[j + 1].X))
          "Partial mass balance for single volume";
      end for;
    end if;
    for j in 1:N loop
      u[j] = w/(gas[j].d*A) "Gas velocity";
      gas[j].p = p;
      gas[j].T = T[j];
      gas[j].h = h[j];
    end for;
    // Fluid property computations
    for j in 1:N loop
      if not QuasiStatic then
        cv[j] = Medium.heatCapacity_cv(gas[j].state);
        dddT[j] = Medium.density_derT_p(gas[j].state);
        dddp[j] = Medium.density_derp_T(gas[j].state);
        if nX > 0 then
          dddX[j, :] = Medium.density_derX(gas[j].state);
        end if;
      else
        // Dummy values (not needed by dynamic equations)
        cv[j] = 0;
        dddT[j] = 0;
        dddp[j] = 0;
        dddX[j, :] = zeros(nX);
      end if;
    end for;

    // Selection of representative pressure and flow rate variables
    if HydraulicCapacitance ==ThermoPower.Choices.Flow1D.HCtypes.Upstream then
      p = infl.p;
      w = -outfl.m_flow/Nt;
    else
      p = outfl.p;
      w = infl.m_flow/Nt;
    end if;

    // Boundary conditions
    infl.h_outflow = gas[1].h;
    outfl.h_outflow = gas[N].h;
    infl.Xi_outflow = gas[1].Xi;
    outfl.Xi_outflow = gas[N].Xi;

    gas[1].h = inStream(infl.h_outflow);
    gas[2:N].T = Ttilde;
    gas[1].Xi = inStream(infl.Xi_outflow);
    for j in 2:N loop
      gas[j].Xi = Xtilde[if UniformComposition then 1 else j - 1, 1:nXi];
    end for;

    connect(wall,heatTransfer.wall);

    Tin = gas[1].T;
    M = sum(rhobar)*A*l "Fluid mass (single tube)";
    Mtot = M*Nt "Fluid mass (total)";
    Tr = noEvent(M/max(infl.m_flow/Nt, Modelica.Constants.eps))
      "Residence time";
  initial equation
    if initOpt == Choices.Init.Options.noInit or QuasiStatic then
      // do nothing
    elseif initOpt == Choices.Init.Options.fixedState then
      if not noInitialPressure then
        p = pstart;
      end if;
      Ttilde = Tstart[2:N];
    elseif initOpt == Choices.Init.Options.steadyState then
      if (not Medium.singleState) and not noInitialPressure then
        der(p) = 0;
      end if;
      der(Ttilde) = zeros(N - 1);
      if (not Medium.fixedX) then
        der(Xtilde) = zeros(size(Xtilde, 1), size(Xtilde, 2));
      end if;
    elseif initOpt == Choices.Init.Options.steadyStateNoP then
      der(Ttilde) = zeros(N - 1);
      if (not Medium.fixedX) then
        der(Xtilde) = zeros(size(Xtilde, 1), size(Xtilde, 2));
      end if;
    else
      assert(false, "Unsupported initialisation option");
    end if;

    annotation (
      Icon(graphics={Text(extent={{-100,-60},{100,-100}},textString="%name")}),
      Diagram(graphics),
      Documentation(info="<html>
<p>This model describes the flow of a gas in a rigid tube. The basic modelling assumptions are:
<ul>
<li>Uniform velocity is assumed on the cross section, leading to a 1-D distributed parameter model.
<li>Turbulent friction is always assumed; a small linear term is added to avoid numerical singularities at zero flowrate. The friction effects are not accurately computed in the laminar and transitional flow regimes, which however should not be an issue in most power generation applications.
<li>The model is based on dynamic mass, momentum, and energy balances. The dynamic momentum term can be switched off, to avoid the fast oscillations that can arise from its coupling with the mass balance (sound wave dynamics).
<li>The longitudinal heat diffusion term is neglected.
<li>The energy balance equation is written by assuming a uniform pressure distribution; the pressure drop is lumped either at the inlet or at the outlet.
<li>The fluid flow can exchange thermal power through the lateral tube boundary, by means of the <tt>wall</tt> connector, that actually represents the wall surface with its temperature. The heat flow is computed by an instance of the replaceable HeatTransfer model; various heat transfer models are available in the ThermoPower.Thermal.HeatTransferFV package.
</ul>
<p>The mass, momentum and energy balance equation are discretised with the finite volume method. The state variables are one pressure, one flowrate (optional), N-1 temperatures, and either one or N-1 gas composition vectors.
<p>The turbulent friction factor can be either assumed as a constant, or computed by Colebrook's equation. In the former case, the friction factor can be supplied directly, or given implicitly by a specified operating point. In any case, the multiplicative correction coefficient <tt>Kfc</tt> can be used to modify the friction coefficient, e.g. to fit experimental data.
<p>A small linear pressure drop is added to avoid numerical singularities at low or zero flowrate. The <tt>wnom</tt> parameter must be always specified: the additional linear pressure drop is such that it is equal to the turbulent pressure drop when the flowrate is equal to <tt>wnf*wnom</tt> (the default value is 1% of the nominal flowrate). Increase <tt>wnf</tt> if numerical problems occur in tubes with very low pressure drops.
<p>Flow reversal is not supported by this model; if you need flow reversal, please consider using the Flow1DFEM model.
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package.In the case of multiple component, variable composition gases, the start composition is given by <tt>Xstart</tt>, whose default value is <tt>Medium.reference_X</tt>.
<p>Thermal variables (enthalpy, temperature, density) are computed in <tt>N</tt> equally spaced nodes, including the inlet (node 1) and the outlet (node N); <tt>N</tt> must be greater than or equal to 2.
<p>if <tt>UniformComposition</tt> is true, then a uniform compostion is assumed for the gas through the entire tube length; otherwise, the gas compostion is computed in <tt>N</tt> equally spaced nodes, as in the case of thermal variables.
<p>The following options are available to specify the friction coefficient:
<ul><li><tt>FFtype = FFtypes.Kfnom</tt>: the hydraulic friction coefficient <tt>Kf</tt> is set directly to <tt>Kfnom</tt>.
<li><tt>FFtype = FFtypes.OpPoint</tt>: the hydraulic friction coefficient is specified by a nominal operating point (<tt>wnom</tt>,<tt>dpnom</tt>, <tt>rhonom</tt>).
<li><tt>FFtype = FFtypes.Cfnom</tt>: the friction coefficient is computed by giving the (constant) value of the Fanning friction factor <tt>Cfnom</tt>.
<li><tt>FFtype = FFtypes.Colebrook</tt>: the Fanning friction factor is computed by Colebrook's equation (assuming Re > 2100, e.g. turbulent flow).
<li><tt>FFtype = FFtypes.NoFriction</tt>: no friction is assumed across the pipe.</ul>
<p>If <tt>QuasiStatic</tt> is set to true, the dynamic terms are neglected in the mass, momentum, and energy balances, i.e., quasi-static behaviour is modelled. It is also possible to neglect only the dynamic momentum term by setting <tt>DynamicMomentum = false</tt>.
<p>If <tt>HydraulicCapacitance = 2</tt> (default option) then the mass buildup term depending on the pressure is lumped at the outlet, while the optional momentum buildup term depending on the flowrate is lumped at the inlet; therefore, the state variables are the outlet pressure and the inlet flowrate. If <tt>HydraulicCapacitance = 1</tt> the reverse takes place.
<p>Start values for the pressure and flowrate state variables are specified by <tt>pstart</tt>, <tt>wstart</tt>. The start values for the node temperatures are linearly distributed from <tt>Tstartin</tt> at the inlet to <tt>Tstartout</tt> at the outlet. The (uniform) start value of the gas composition is specified by <tt>Xstart</tt>.
<p>A bank of <tt>Nt</tt> identical tubes working in parallel can be modelled by setting <tt>Nt > 1</tt>. The geometric parameters always refer to a <i>single</i> tube.
<p>This models makes the temperature and external heat flow distributions available to connected components through the <tt>wall</tt> connector. If other variables (e.g. the heat transfer coefficient) are needed by external components to compute the actual heat flow, the <tt>wall</tt> connector can be replaced by an extended version of the <tt>DHT</tt> connector.
</html>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>24 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       <tt>QuasiStatic</tt> added.<br>
       <tt>FFtypes</tt> package and <tt>NoFriction</tt> option added.</li>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      DymolaStoredErrors);
  end Flow1DFV;

  model Flow1DFV2w "Same as Flow1DFV with two walls and heat transfer models"
    extends Flow1DFV(
      Q_single = heatTransfer.Qvol/Nt + heatTransfer2.Qvol/Nt);
    replaceable model HeatTransfer2 = Thermal.HeatTransferFV.IdealHeatTransfer
      constrainedby ThermoPower.Thermal.BaseClasses.DistributedHeatTransferFV
      annotation (choicesAllMatching=true);
    HeatTransfer heatTransfer2(
      redeclare package Medium = Medium,
      final Nf=N,
      final Nw=Nw,
      final Nt=Nt,
      final L=L,
      final A=A,
      final Dhyd=Dhyd,
      final omega=omega,
      final wnom=wnom/Nt,
      final w=w*ones(N),
      final fluidState=gas.state) "Instantiated heat transfer model";

    Thermal.DHTVolumes wall2(final N=Nw)
      annotation (Placement(transformation(extent={{-60,-60},{60,-40}},
                                                                      rotation=0)));
  equation
    connect(wall2,heatTransfer2.wall);
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics), Icon(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
  end Flow1DFV2w;

  model FlowJoin "Joins two gas flows"
    extends Icons.Gas.FlowJoin;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    constant Medium.MassFlowRate wzero=1e-9
      "Small flowrate to avoid singularity in computing the outlet enthalpy and composition";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    parameter Boolean rev_inlet1=allowFlowReversal
      "Allow flow reversal at inlet1" annotation (Evaluate=true);
    parameter Boolean rev_inlet2=allowFlowReversal
      "Allow flow reversal at inlet2" annotation (Evaluate=true);
    parameter Boolean rev_outlet=allowFlowReversal
      "Allow flow reversal at outlet" annotation (Evaluate=true);
    parameter Boolean checkFlowDirection=false "Check flow direction"
      annotation (Dialog(enable=not rev_inlet1 or not rev_inlet2 or not
            rev_outlet));
    FlangeA inlet1(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-80,20},{-40,60}}, rotation=0)));
    FlangeA inlet2(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-80,-60},{-40,-20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{40,-20},{80,20}}, rotation=0)));
  equation
    inlet1.m_flow + inlet2.m_flow + outlet.m_flow = 0 "Mass balance";

    // Momentum balance
    inlet1.p = outlet.p;
    inlet2.p = outlet.p;

    // Energy balance
    outlet.h_outflow = homotopy(
      if (inlet2.m_flow < 0 and rev_inlet2) then
        inStream(inlet1.h_outflow)
      else if (inlet1.m_flow < 0 and rev_inlet1) then
        inStream(inlet2.h_outflow)
      else
        (inStream(inlet1.h_outflow)*(inlet1.m_flow+ wzero) +
         inStream(inlet2.h_outflow)*(inlet2.m_flow + wzero))/
        (inlet1.m_flow + 2*wzero + inlet2.m_flow),
      (inStream(inlet1.h_outflow)*(inlet1.m_flow + wzero) +
       inStream(inlet2.h_outflow)*(inlet2.m_flow + wzero))/
      (inlet1.m_flow + 2*wzero + inlet2.m_flow));

    inlet1.h_outflow = homotopy(
      if (inlet2.m_flow < 0 and rev_inlet2) then
        inStream(outlet.h_outflow)
      else if (outlet.m_flow < 0 or not rev_outlet) then
        inStream(inlet2.h_outflow)
      else
        (inStream(outlet.h_outflow)*(outlet.m_flow + wzero) +
         inStream(inlet2.h_outflow)*(inlet2.m_flow + wzero))/
        (outlet.m_flow + 2*wzero + inlet2.m_flow),
      inStream(outlet.h_outflow));

    inlet2.h_outflow = homotopy(
      if (inlet1.m_flow < 0 and rev_inlet1) then
        inStream(outlet.h_outflow)
      else if (outlet.m_flow < 0 or not rev_outlet) then
        inStream(inlet1.h_outflow)
      else
        (inStream(outlet.h_outflow)*(outlet.m_flow + wzero) +
         inStream(inlet1.h_outflow)*(inlet1.m_flow + wzero))/
        (outlet.m_flow + 2*wzero + inlet1.m_flow),
      inStream(outlet.h_outflow));

    // Independent component mass balances
    outlet.Xi_outflow = homotopy(
      if (inlet2.m_flow < 0 and rev_inlet2) then
        inStream(inlet1.Xi_outflow)
      else if (inlet1.m_flow < 0 and rev_inlet1) then
        inStream(inlet2.Xi_outflow)
      else
        (inStream(inlet1.Xi_outflow)*(inlet1.m_flow + wzero) +
         inStream(inlet2.Xi_outflow)*(inlet2.m_flow + wzero))/
        (inlet1.m_flow + 2*wzero + inlet2.m_flow),
      (inStream(inlet1.Xi_outflow)*(inlet1.m_flow + wzero) +
       inStream(inlet2.Xi_outflow)*(inlet2.m_flow + wzero))/
      (inlet1.m_flow + 2*wzero + inlet2.m_flow));

    inlet1.Xi_outflow = homotopy(
      if (inlet2.m_flow < 0 and rev_inlet2) then
        inStream(outlet.Xi_outflow)
      else if (outlet.m_flow < 0 or not rev_outlet) then
         inStream(inlet2.Xi_outflow)
      else
         (inStream(outlet.Xi_outflow)*(outlet.m_flow + wzero) +
          inStream(inlet2.Xi_outflow)*(inlet2.m_flow + wzero))/
         (outlet.m_flow + 2*wzero + inlet2.m_flow),
      inStream(outlet.Xi_outflow));

    inlet2.Xi_outflow = homotopy(
      if (inlet1.m_flow < 0 and rev_inlet1) then
        inStream(outlet.Xi_outflow)
      else if (outlet.m_flow < 0 or not rev_outlet) then
        inStream(inlet1.Xi_outflow)
      else
        (inStream(outlet.Xi_outflow)*(outlet.m_flow + wzero) +
         inStream(inlet1.Xi_outflow)*(inlet1.m_flow + wzero))/
        (outlet.m_flow + 2*wzero + inlet1.m_flow),
      inStream(outlet.Xi_outflow));

    //Check flow direction
    assert(not checkFlowDirection or
     ((rev_inlet1 or inlet1.m_flow >= 0) and
      (rev_inlet2 or inlet2.m_flow >= 0) and
      (rev_outlet or outlet.m_flow <= 0)),
      "Flow reversal not supported");
    annotation (
      Icon(graphics),
      Documentation(info="<html>
<p>This component allows to join two separate flows into one. The model is based on mass and energy balance equations, without any mass or energy buildup, and without any pressure drop between the inlet and the outlets. </p>
<p>Since stream connectors are used in the library, this component is actually not necessary to handle a three-way connection. It can be used for a finer tuning of the simplified model for initialization using homotopy, in particularly hard-to-initialize systems, and it is included in the library for backwards compatibility.</p>
<h4>Modelling options</h4>
<p>If <code>rev_inlet1</code>, <code>rev_inlet2</code> or <code>rev_outlet</code> is true, the respective flows reversal is allowed. If at least ona among these parameters is false, it is possible to set <code>checkFlowDirection</code>.</p>
<p>If <code>checkFlowDirection</code> is true, when the flow reversal happen where it is not allowed, the error message is showed.</p>
</html>", revisions="<html>
<ul>
<li><i>30 Oct 2014</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Bug fixing.</li>
<li><i>23 May 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       Allow flows reversal option added.</li>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Diagram(graphics));
  end FlowJoin;

  model FlowSplit "Splits a gas flow in two"
    extends Icons.Gas.FlowSplit;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    constant Medium.MassFlowRate wzero=1e-9
      "Small flowrate to avoid singularity in computing the outlet enthalpy and composition";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    parameter Boolean rev_inlet=allowFlowReversal
      "Allow flow reversal at inlet" annotation (Evaluate=true);
    parameter Boolean rev_outlet1=allowFlowReversal
      "Allow flow reversal at outlet1" annotation (Evaluate=true);
    parameter Boolean rev_outlet2=allowFlowReversal
      "Allow flow reversal at outlet2" annotation (Evaluate=true);
    parameter Boolean checkFlowDirection=false "Check flow direction"
      annotation (Dialog(enable=not rev_inlet or not rev_outlet1 or not
            rev_outlet2));
    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-80,-20},{-40,20}}, rotation=0)));
    FlangeB outlet1(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{40,20},{80,60}}, rotation=0)));
    FlangeB outlet2(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{40,-60},{80,-20}}, rotation=0)));

  equation
    inlet.m_flow + outlet1.m_flow + outlet2.m_flow = 0 "Mass balance";

    // Momentum balance
    outlet1.p = inlet.p;
    outlet2.p = inlet.p;

    // Energy balance
    outlet1.h_outflow = homotopy(
      if (inlet.m_flow < 0 and rev_inlet) then
        inStream(outlet2.h_outflow)
      else if (outlet2.m_flow < 0 or not rev_outlet2) then
        inStream(inlet.h_outflow)
      else
        (inStream(inlet.h_outflow)*(inlet.m_flow + wzero) +
         inStream(outlet2.h_outflow)*(outlet2.m_flow + wzero))/
        (inlet.m_flow + 2*wzero + outlet2.m_flow),
      inStream(inlet.h_outflow));

    outlet2.h_outflow = homotopy(
      if (inlet.m_flow < 0 and rev_inlet) then
        inStream(outlet1.h_outflow)
      else if (outlet1.m_flow < 0 or not rev_outlet1) then
        inStream(inlet.h_outflow)
      else
        (inStream(inlet.h_outflow)*(inlet.m_flow + wzero) +
         inStream(outlet1.h_outflow)*(outlet1.m_flow + wzero))/
        (inlet.m_flow + 2*wzero + outlet1.m_flow),
      inStream(inlet.h_outflow));

    inlet.h_outflow = homotopy(
      if (outlet1.m_flow < 0 or not rev_outlet1) then
        inStream(outlet2.h_outflow)
      else if (outlet2.m_flow < 0 or not rev_outlet2) then
        inStream(outlet1.h_outflow)
      else
        (inStream(outlet1.h_outflow)*(outlet1.m_flow + wzero) +
         inStream(outlet2.h_outflow)*(outlet2.m_flow + wzero))/
        (outlet1.m_flow + 2*wzero + outlet2.m_flow),
      inStream(outlet1.h_outflow));

    // Independent component mass balances
    outlet1.Xi_outflow = homotopy(
      if (inlet.m_flow < 0 and rev_inlet) then
        inStream(outlet2.Xi_outflow)
      else if (outlet2.m_flow < 0 or not rev_outlet2) then
        inStream(inlet.Xi_outflow)
      else
        (inStream(inlet.Xi_outflow)*(inlet.m_flow + wzero) +
         inStream(outlet2.Xi_outflow)*(outlet2.m_flow + wzero))/
        (inlet.m_flow + 2*wzero + outlet2.m_flow),
      inStream(inlet.Xi_outflow));

    outlet2.Xi_outflow = homotopy(
      if (inlet.m_flow < 0 and rev_inlet) then
        inStream(outlet1.Xi_outflow)
      else if (outlet1.m_flow < 0 or not rev_outlet1) then
        inStream(inlet.Xi_outflow)
      else
        (inStream(inlet.Xi_outflow)*(inlet.m_flow + wzero) +
         inStream(outlet1.Xi_outflow)*(outlet1.m_flow + wzero))/
        (inlet.m_flow + 2*wzero + outlet1.m_flow),
      inStream(inlet.Xi_outflow));

    inlet.Xi_outflow = homotopy(
      if (outlet1.m_flow < 0 or not rev_outlet1) then
        inStream(outlet2.Xi_outflow)
      else if (outlet2.m_flow < 0 or not rev_outlet2) then
        inStream(outlet1.Xi_outflow)
      else
        (inStream(outlet1.Xi_outflow)*(outlet1.m_flow + wzero) +
         inStream(outlet2.Xi_outflow)*(outlet2.m_flow + wzero))/
        (outlet1.m_flow + 2*wzero + outlet2.m_flow),
      inStream(outlet1.Xi_outflow));

    //Check flow direction
    assert(not checkFlowDirection or
     ((rev_inlet or inlet.m_flow >= 0) and
      (rev_outlet1 or outlet1.m_flow <= 0) and
      (rev_outlet2 or outlet2.m_flow <= 0)), "Flow reversal not supported");
    annotation (
      Icon(graphics),
      Documentation(info="<html>
<p>This component allows to split a single flow in two ones. The model is based on mass and energy balance equations, without any mass or energy buildup, and without any pressure drop between the inlet and the outlets.</p>
<p>Since stream connectors are used in the library, this component is actually not necessary to handle a three-way connection. It can be used for a finer tuning of the simplified model for initialization using homotopy, in particularly hard-to-initialize systems, and it is included in the library for backwards compatibility.</p>
<h4>Modelling options</h4>
<p>If <code>rev_inlet</code>, <code>rev_outlet1</code> or <code>rev_outlet2</code> is true, the respective flows reversal is allowed. If at least ona among these parameters is false, it is possible to set <code>checkFlowDirection</code>.</p>
<p>If <code>checkFlowDirection</code> is true, when the flow reversal happen where it is not allowed, the error message is showed.</p>
</html>", revisions="<html>
<ul>
<li><i>30 Oct 2014</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Bug fixing.</li>
<li><i>23 May 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       Allow flows reversal option added.</li>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Diagram(graphics));
  end FlowSplit;

  model PressDropLin "Linear pressure drop for gas flows"
    extends Icons.Gas.Tube;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    parameter Units.HydraulicResistance R "Hydraulic resistance";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";

    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));

  equation
    inlet.m_flow + outlet.m_flow = 0 "Mass balance";
    inlet.p - outlet.p = R*inlet.m_flow "Flow characteristics";

    // Boundary conditions
    inlet.h_outflow = inStream(outlet.h_outflow);
    inStream(inlet.h_outflow) = outlet.h_outflow;
    inlet.Xi_outflow = inStream(outlet.Xi_outflow);
    inStream(inlet.Xi_outflow) = outlet.Xi_outflow;
    annotation (
      Icon(graphics={Text(extent={{-100,-40},{100,-80}}, textString="%name")}),
      Diagram(graphics),
      Documentation(info="<html>
<p>This very simple model provides a pressure drop which is proportional to the flowrate, without computing any fluid property.</p>
</html>", revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Icon);
  end PressDropLin;

  model PressDrop "Pressure drop for gas flows"
    extends Icons.Gas.Tube;
    import ThermoPower.Choices.PressDrop.FFtypes;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Medium.BaseProperties gas(
      p(start=pstart),
      T(start=Tstart),
      Xi(start=Xstart[1:Medium.nXi]));
    parameter Medium.MassFlowRate wnom "Nominal mass flowrate";
    parameter SI.Pressure dpnom "Nominal pressure drop";
    parameter ThermoPower.Choices.PressDrop.FFtypes FFtype= ThermoPower.Choices.PressDrop.FFtypes.Kf
      "Friction factor type";
    parameter Real Kf = 0 "Hydraulic resistance coefficient (DP = Kf*w^2/rho)"
      annotation(Dialog(enable = (FFtype == ThermoPower.Choices.PressDrop.FFtypes.Kf)));
    parameter Medium.Density rhonom=0 "Nominal density"
      annotation(Dialog(enable = (FFtype == ThermoPower.Choices.PressDrop.FFtypes.OpPoint)));
    parameter SI.PerUnit K=0
      "Kinetic resistance coefficient (DP=K*rho*velocity2/2)"
      annotation(Dialog(enable = (FFtype == ThermoPower.Choices.PressDrop.FFtypes.Kinetic)));
    parameter SI.Area A=0 "Cross-section"
      annotation(Dialog(enable = (FFtype == ThermoPower.Choices.PressDrop.FFtypes.Kinetic)));
    parameter SI.PerUnit wnf=0.01
      "Fraction of nominal flow rate at which linear friction equals turbulent friction";
    parameter SI.PerUnit Kfc=1 "Friction factor correction coefficient";
    final parameter Real Kf_a(fixed = false)
      "Actual hydraulic resistance coefficient";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    parameter Medium.AbsolutePressure pstart=101325 "Start pressure value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tstart=300 "Start temperature value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.MassFraction Xstart[Medium.nX]=Medium.reference_X
      "Start gas composition" annotation (Dialog(tab="Initialisation"));
    function squareReg = ThermoPower.Functions.squareReg;
    Medium.MassFlowRate w "Mass flow rate in the inlet";
    Medium.AbsolutePressure pin "Inlet pressure";
    Medium.AbsolutePressure pout "Outlet pressure";
    SI.Pressure dp "Pressure drop";

    FlangeA inlet(redeclare package Medium = Medium, m_flow(start=wnom, min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(start=-wnom, max=
            if allowFlowReversal then +Modelica.Constants.inf else 0))
      annotation (Placement(transformation(extent={{80,-20},{120,20}}, rotation=
             0)));
  initial equation
    if FFtype ==  ThermoPower.Choices.PressDrop.FFtypes.Kf then
      Kf_a = Kf*Kfc;
    elseif FFtype ==  ThermoPower.Choices.PressDrop.FFtypes.OpPoint then
      Kf_a = dpnom*rhonom/wnom^2*Kfc;
    elseif FFtype ==  ThermoPower.Choices.PressDrop.FFtypes.Kinetic then
      Kf_a = K/(2*A^2)*Kfc;
    else
      Kf_a = 0;
      assert(false, "Unsupported FFtype");
    end if;
  equation
    assert(dpnom > 0, "Please set a positive value for dpnom");
    assert(rhonom > 0 or FFtype <> FFtypes.OpPoint, "Please set a positive value for rhonom");
    // Set fluid properties
    gas.p = homotopy(if not allowFlowReversal then pin else if inlet.m_flow >=
      0 then pin else pout, pin);
    gas.h = homotopy(if not allowFlowReversal then inStream(inlet.h_outflow)
       else actualStream(inlet.h_outflow), inStream(inlet.h_outflow));
    gas.Xi = homotopy(if not allowFlowReversal then inStream(inlet.Xi_outflow)
       else actualStream(inlet.Xi_outflow), inStream(inlet.Xi_outflow));

    pin - pout = homotopy(smooth(1, Kf_a*squareReg(w, wnom*wnf))/gas.d, dpnom/
      wnom*w) "Flow characteristics";

    //Boundary conditions
    w = inlet.m_flow;
    pin = inlet.p;
    pout = outlet.p;
    dp = pin - pout;

    // Mass balance
    inlet.m_flow + outlet.m_flow = 0;

    // Energy balance
    inlet.h_outflow = inStream(outlet.h_outflow);
    inStream(inlet.h_outflow) = outlet.h_outflow;

    // Independent component mass balances
    inlet.Xi_outflow = inStream(outlet.Xi_outflow);
    inStream(inlet.Xi_outflow) = outlet.Xi_outflow;
    annotation (
      Icon(graphics={Text(extent={{-100,-40},{100,-80}}, textString="%name")}),
      Diagram(graphics),
      Documentation(info="<html>
<p>The pressure drop across the inlet and outlet connectors is computed according to a turbulent friction model, i.e. is proportional to the squared velocity of the fluid. The friction coefficient can be specified directly, or by giving an operating point, or as a multiple of the kinetic pressure. The correction coefficient <tt>Kfc</tt> can be used to modify the friction coefficient, e.g. to fit some experimental operating point.</p>
<p>A small linear pressure drop is added to avoid numerical singularities at low or zero flowrate. The <tt>wnom</tt> parameter must be always specified; the additional linear pressure drop is such that it is equal to the turbulent pressure drop when the flowrate is equal to <tt>wnf*wnom</tt> (the default value is 1% of the nominal flowrate).
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the start composition is given by <tt>Xstart</tt>, whose default value is <tt>Medium.reference_X</tt>.
<p>The following options are available to specify the friction coefficient:
<ul><li><tt>FFtype = 0</tt>: the hydraulic friction coefficient <tt>Kf</tt> is used directly.</li>
<li><tt>FFtype = 1</tt>: the hydraulic friction coefficient is specified by the nominal operating point (<tt>wnom</tt>,<tt>dpnom</tt>, <tt>rhonom</tt>).</li>
<li><tt>FFtype = 2</tt>: the pressure drop is <tt>K</tt> times the kinetic pressure.</li></ul>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<br> <tt>Kfnom</tt> removed, <tt>Kf</tt> can now be set directly.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end PressDrop;

  model SensT "Temperature sensor for gas"
    extends Icons.Gas.SensThrough;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";

    Medium.BaseProperties gas;
    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-80,-60},{-40,-20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{40,-60},{80,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput T annotation (Placement(
          transformation(extent={{60,50},{80,70}}, rotation=0)));
  equation
    inlet.m_flow + outlet.m_flow = 0 "Mass balance";
    inlet.p = outlet.p "Momentum balance";

    // Energy balance
    inlet.h_outflow = inStream(outlet.h_outflow);
    inStream(inlet.h_outflow) = outlet.h_outflow;

    // Independent composition mass balances
    inlet.Xi_outflow = inStream(outlet.Xi_outflow);
    inStream(inlet.Xi_outflow) = outlet.Xi_outflow;

    // Set gas properties
    inlet.p = gas.p;
    gas.h = homotopy(if not allowFlowReversal then inStream(inlet.h_outflow)
       else inStream(inlet.h_outflow), inStream(inlet.h_outflow));
    gas.Xi = homotopy(if not allowFlowReversal then inStream(inlet.Xi_outflow)
       else inStream(inlet.Xi_outflow), inStream(inlet.Xi_outflow));

    T = gas.T "Sensor output";
    annotation (
      Documentation(info="<html>
<p>This component can be inserted in a hydraulic circuit to measure the temperature of the fluid flowing through it.
<p>Flow reversal is supported.
<p><b>Modelling options</p></b>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package.
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Diagram(graphics),
      Icon(graphics={Text(
            extent={{-40,84},{38,34}},
            lineColor={0,0,0},
            textString="T")}));
  end SensT;

  model SensT1 "Temperature sensor for gas flows, single port"
    extends Icons.Gas.SensP;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Modelica.Blocks.Interfaces.RealOutput T annotation (Placement(
          transformation(extent={{60,50},{72,70}}, rotation=0),
          iconTransformation(extent={{60,50},{80,70}})));
    FlangeA flange(redeclare package Medium = Medium, m_flow(min=0))
      annotation (Placement(transformation(extent={{-20,-60},{20,-20}},
            rotation=0)));
  equation
    flange.m_flow = 0 "Mass balance";
    T = Medium.temperature(Medium.setState_phX(
        flange.p,
        inStream(flange.h_outflow),
        inStream(flange.Xi_outflow)));
    flange.h_outflow = 0;
    flange.Xi_outflow = zeros(Medium.nXi);
    annotation (
      Documentation(info="<html>
<p>This component can be connected to any A-type or B-type connector to measure the pressure of the fluid flowing through it.
</html>", revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Icon(graphics={Text(
            extent={{-40,84},{38,34}},
            lineColor={0,0,0},
            textString="T")}),
      Diagram(graphics));
  end SensT1;

  model SensW "Mass Flowrate sensor for gas flows"
    extends Icons.Gas.SensThrough;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-80,-60},{-40,-20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{40,-60},{80,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput w annotation (Placement(
          transformation(extent={{56,50},{76,70}}, rotation=0),
          iconTransformation(extent={{60,50},{80,70}})));

  equation
    inlet.m_flow + outlet.m_flow = 0 "Mass balance";
    inlet.p = outlet.p "Momentum balance";

    // Energy balance
    inlet.h_outflow = inStream(outlet.h_outflow);
    inStream(inlet.h_outflow) = outlet.h_outflow;

    // Independent composition mass balances
    inlet.Xi_outflow = inStream(outlet.Xi_outflow);
    inStream(inlet.Xi_outflow) = outlet.Xi_outflow;

    w = inlet.m_flow "Sensor output";
    annotation (
      Documentation(revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
      Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This component can be inserted in a hydraulic circuit to measure the flowrate of the fluid flowing through it.
<p>Flow reversal is supported.
</html>"),
      Diagram(graphics),
      Icon(graphics={Text(
            extent={{-42,92},{40,32}},
            lineColor={0,0,0},
            textString="w")}));
  end SensW;

  model SensP "Pressure sensor for gas flows"
    extends Icons.Gas.SensP;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    Modelica.Blocks.Interfaces.RealOutput p annotation (Placement(
          transformation(extent={{60,50},{72,70}}, rotation=0),
          iconTransformation(extent={{60,50},{80,70}})));
    FlangeA flange(redeclare package Medium = Medium, m_flow(min=0))
      annotation (Placement(transformation(extent={{-20,-60},{20,-20}},
            rotation=0)));
  equation
    flange.m_flow = 0 "Mass balance";
    flange.p = p "Sensor output";
    flange.h_outflow = 0;
    flange.Xi_outflow = zeros(Medium.nXi);
    annotation (
      Documentation(info="<html>
<p>This component can be connected to any A-type or B-type connector to measure the pressure of the fluid flowing through it.
</html>", revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Icon(graphics={Text(
            extent={{-42,92},{44,36}},
            lineColor={0,0,0},
            textString="p")}),
      Diagram(graphics));
  end SensP;

  model SensQ "Volume Flow Rate sensor for gas flows"
    extends Icons.Gas.SensThrough;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    Medium.BaseProperties gas "Gas properties";
    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-80,-60},{-40,-20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{40,-60},{80,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput q "Volume flow rate" annotation (
        Placement(transformation(extent={{56,50},{76,70}}, rotation=0)));
    Medium.MassFlowRate w "Mass flow rate";
  equation
    inlet.m_flow + outlet.m_flow = 0 "Mass balance";
    inlet.p = outlet.p "Momentum balance";
    w = inlet.m_flow;

    // Energy balance
    inlet.h_outflow = inStream(outlet.h_outflow);
    inStream(inlet.h_outflow) = outlet.h_outflow;

    // Independent composition mass balances
    inlet.Xi_outflow = inStream(outlet.Xi_outflow);
    inStream(inlet.Xi_outflow) = outlet.Xi_outflow;

    // Gas properties
    gas.p = inlet.p;
    gas.h = homotopy(if not allowFlowReversal then inStream(inlet.h_outflow)
       else inStream(inlet.h_outflow), inStream(inlet.h_outflow));
    gas.Xi = homotopy(if not allowFlowReversal then inStream(inlet.Xi_outflow)
       else inStream(inlet.Xi_outflow), inStream(inlet.Xi_outflow));

    q = inlet.m_flow/gas.d "Sensor output";
    annotation (
      Documentation(revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
      Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This component can be inserted in a hydraulic circuit to measure the flowrate of the fluid flowing through it.
<p>Flow reversal is supported.
</html>"),
      Diagram(graphics),
      Icon(graphics));
  end SensQ;

  model ValveLin "Valve for gas flows with linear pressure drop"
    extends Icons.Gas.Valve;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation(choicesAllMatching = true);
    parameter Units.HydraulicConductance Kv "Hydraulic conductance";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    Medium.MassFlowRate w "Mass flowrate";
    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput cmd annotation (Placement(
          transformation(
          origin={0,70},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation
    inlet.m_flow + outlet.m_flow = 0 "Mass balance";
    inlet.m_flow = w;
    w = Kv*cmd*(inlet.p - outlet.p) "Flow characteristics";

    // Energy balance
    inlet.h_outflow = inStream(outlet.h_outflow);
    inStream(inlet.h_outflow) = outlet.h_outflow;

    // Independent composition mass balances
    inlet.Xi_outflow = inStream(outlet.Xi_outflow);
    inStream(inlet.Xi_outflow) = outlet.Xi_outflow;
    annotation (
      Icon(graphics={Text(extent={{-100,-40},{100,-80}}, textString="%name")}),
      Diagram(graphics),
      Documentation(info="<html>
<p>This very simple model provides a pressure drop which is proportional to the flowrate and to the <tt>cmd</tt> signal, without computing any fluid property.</p>
</html>", revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end ValveLin;

  model Valve "Valve for gas flow"
    extends Icons.Gas.Valve;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      annotation (choicesAllMatching=true);
    Medium.BaseProperties gas(
      p(start=pin_start),
      T(start=Tstart),
      Xi(start=Xstart[1:Medium.nXi]),
      d(start=pnom/(8314/30*Tstart)));
    parameter ThermoPower.Choices.Valve.CvTypes CvData=
      ThermoPower.Choices.Valve.CvTypes.Av "Selection of flow coefficient"
      annotation (Dialog(group="Flow Coefficient"),
                  Evaluate = true);
    final parameter Boolean fixedAv=
      (if CvData == ThermoPower.Choices.Valve.CvTypes.Av then true else false)
      annotation(Evaluate = true);
    parameter SI.Area Av(
      fixed=fixedAv,
      start=wnom/(sqrt(rhonom*dpnom)*FlowChar(thetanom)))
      "Av (metric) flow coefficient"
      annotation (Dialog(group="Flow Coefficient",
                         enable=(CvData == ThermoPower.Choices.Valve.CvTypes.Av)));
    parameter Real Kv(unit="m3/h") = 0 "Kv (metric) flow coefficient"
      annotation (Dialog(group="Flow Coefficient",
                         enable=(CvData == ThermoPower.Choices.Valve.CvTypes.Kv)));
    parameter Real Cv=0 "Cv (US) flow coefficient [USG/min]"
      annotation (Dialog(group="Flow Coefficient",
                         enable=(CvData == ThermoPower.Choices.Valve.CvTypes.Cv)));
    parameter Boolean useThetaInput = true
      "Use the input connector for the valve opening"
      annotation(Dialog(group = "Valve Opening"), choices(checkBox = true));
    parameter SI.PerUnit theta_fix = 1
      "Fixed opening value when the input connector not used"
      annotation(Dialog(group= "Valve Opening", enable = not useThetaInput));
    parameter Medium.AbsolutePressure pnom "Nominal inlet pressure"
      annotation (Dialog(group="Nominal operating point"));
    parameter Medium.AbsolutePressure dpnom "Nominal pressure drop"
      annotation (Dialog(group="Nominal operating point"));
    parameter Medium.MassFlowRate wnom "Nominal mass flowrate"
      annotation (Dialog(group="Nominal operating point"));
    parameter Medium.Density rhonom=1000 "Nominal density" annotation (Dialog(group=
            "Nominal operating point", enable=(CvData == CvTypes.OpPoint)));
    parameter SI.PerUnit thetanom=1 "Nominal valve opening" annotation (Dialog(group=
            "Nominal operating point", enable=(CvData == CvTypes.OpPoint)));
    parameter Boolean CheckValve=false "Reverse flow stopped";
    parameter SI.PerUnit b=0.01 "Regularisation factor";

    replaceable function FlowChar =
        ThermoPower.Functions.ValveCharacteristics.linear
      constrainedby Functions.ValveCharacteristics.baseFun
      "Flow characteristic" annotation (choicesAllMatching=true);
    parameter SI.PerUnit Fxt_full=0.5 "Fk*xt critical ratio at full opening";
    replaceable function xtfun = ThermoPower.Functions.ValveCharacteristics.one
      constrainedby Functions.ValveCharacteristics.baseFun
      "Critical ratio characteristic";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    parameter Medium.AbsolutePressure pin_start=pnom
      "Inlet pressure start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.AbsolutePressure pout_start=pnom - dpnom
      "Inlet pressure start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tstart=300 "Start temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.MassFraction Xstart[Medium.nX]=Medium.reference_X
      "Start gas composition" annotation (Dialog(tab="Initialisation"));
    Medium.MassFlowRate w "Mass Flow Rate";
    SI.Pressure dp "Pressure drop";
    SI.PerUnit Fxt;
    SI.PerUnit x "Pressure drop ratio";
    SI.PerUnit xs "Saturated pressure drop ratio";
    SI.PerUnit Y "Compressibility factor";
    SI.PerUnit theta_act "Actual valve opening";
    Medium.AbsolutePressure p "Inlet pressure";
  protected
    function sqrtR = Functions.sqrtReg (delta=b*dpnom);
    parameter SI.PerUnit Fxt_nom(fixed=false) "Nominal Fxt";
    parameter SI.PerUnit x_nom(fixed=false) "Nominal pressure drop ratio";
    parameter SI.PerUnit xs_nom(fixed=false)
      "Nominal saturated pressure drop ratio";
    parameter SI.PerUnit Y_nom(fixed=false) "Nominal compressibility factor";
    Modelica.Blocks.Interfaces.RealInput theta_int
      "Protected connector for conditional input connector handling";
  public
    FlangeA inlet(
      redeclare package Medium = Medium,
      m_flow(start=wnom, min=if allowFlowReversal then -Modelica.Constants.inf
             else 0),
      p(start=pin_start)) annotation (Placement(transformation(extent={{-120,-20},
              {-80,20}}, rotation=0)));
    FlangeB outlet(
      redeclare package Medium = Medium,
      m_flow(start=-wnom, max=if allowFlowReversal then +Modelica.Constants.inf
             else 0),
      p(start=pout_start)) annotation (Placement(transformation(extent={{80,-20},
              {120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput theta if useThetaInput annotation (Placement(
          transformation(
          origin={0,72},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  initial equation
    if CvData == ThermoPower.Choices.Valve.CvTypes.Kv then
      Av = 2.7778e-5*Kv;
    elseif CvData == ThermoPower.Choices.Valve.CvTypes.Cv then
      Av = 2.4027e-5*Cv;
    end if;
    // assert(CvData>=0 and CvData<=3, "Invalid CvData");

    if CvData == ThermoPower.Choices.Valve.CvTypes.OpPoint then
      // Determination of Av by the nominal operating point conditions
      Fxt_nom = Fxt_full*xtfun(thetanom);
      x_nom = dpnom/pnom;
      xs_nom = smooth(0, if x_nom > Fxt_nom then Fxt_nom else x_nom);
      Y_nom = 1 - abs(xs_nom)/(3*Fxt_nom);
      wnom = FlowChar(thetanom)*Av*Y_nom*sqrt(rhonom)*sqrtR(pnom*xs_nom);
    else
      // Dummy values
      Fxt_nom = 0;
      x_nom = 0;
      xs_nom = 0;
      Y_nom = 0;
    end if;
  equation
    inlet.m_flow + outlet.m_flow = 0 "Mass balance";
    w = inlet.m_flow;

    // Fluid properties
    gas.p = inlet.p;
    gas.h = inStream(inlet.h_outflow);
    gas.Xi = inStream(inlet.Xi_outflow);

    p = noEvent(if inlet.p >= outlet.p then inlet.p else outlet.p);
    Fxt = Fxt_full*xtfun(theta_act);
    dp = inlet.p - outlet.p;
    x = dp/p;
    xs = noEvent(smooth(0, if x < -Fxt then -Fxt else if x > Fxt then Fxt else
      x));
    Y = noEvent(1 - abs(xs)/(3*Fxt));
    if CheckValve then
      w = homotopy(FlowChar(theta_act)*Av*Y*sqrt(gas.d)*noEvent(smooth(0, if xs >=
        0 then sqrtR(p*xs) else 0)), theta_act/thetanom*dpnom/wnom*dp);
    else
      w = homotopy(FlowChar(theta_act)*Av*Y*sqrt(gas.d)*sqrtR(p*xs), theta_act/thetanom
        *dpnom/wnom*dp);
    end if;

    // Energy balance
    inlet.h_outflow = inStream(outlet.h_outflow);
    inStream(inlet.h_outflow) = outlet.h_outflow;

    // Mass balances of independent components
    inlet.Xi_outflow = inStream(outlet.Xi_outflow);
    inStream(inlet.Xi_outflow) = outlet.Xi_outflow;

    // Valve opening
    connect(theta, theta_int); // automatically removed if theta is disabled
    if not useThetaInput then
      theta_int = theta_fix;   // provide actual opening value from parameter
    end if;
    theta_act = theta_int;
    annotation (
      Icon(graphics={Text(extent={{-100,-40},{100,-80}}, textString="%name")}),
      Diagram(graphics),
      Documentation(info="<html>
<p>This model is based on the IEC 534/ISA S.75 standards for valve sizing, compressible fluid.
<p>The model optionally supports reverse flow conditions (assuming symmetrical behaviour) or check valve operation, and has been suitably modified to avoid numerical singularities at zero pressure drop.
<p>The model operating range include choked flow operation, due to sonic conditions in the vena contracta.
<p>The flow characteristic can be customised.
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the start composition is given by <tt>Xstart</tt>,whose default value is <tt>Medium.reference_X</tt>.
<p>The following options are available to specify the valve flow coefficient in fully open conditions:
<ul><li><tt>CvData = 0</tt>: the flow coefficient is given by the metric Av coefficient <tt>Av</tt> (m^2).
<li><tt>CvData = 1</tt>: the flow coefficient is given by the metric Kv coefficient <tt>Kv</tt> (m^3/h).
<li><tt>CvData = 2</tt>: the flow coefficient is given by the US Cv coefficient <tt>Cv</tt> (USG/min).
<li><tt>CvData = 3</tt>: the flow coefficient must be specified by an additional initial equation (e.g. w=0.5); the start value given by Av is used to initialise the numerical solution of the equation.
</ul>
<p>The nominal inlet pressure <tt>pnom</tt> and pressure drop <tt>dpnom</tt> must always be specified; to avoid numerical singularities, the flow characteristic is modified for pressure drops less than <tt>b*dpnom</tt> (the default value is 1% of the nominal pressure drop). Increase this parameter if numerical instabilities occur in valves with very low pressure drops.
<p>If <tt>CheckValve</tt> is true, then the flow is stopped when the outlet pressure is higher than the inlet pressure; otherwise, reverse flow takes place.
<p>The default flow characteristic <tt>FlowChar</tt> is linear; this can be replaced by any user-defined function (e.g. equal percentage, quick opening, etc.).
<p>The product Fk*xt is given by the parameter <tt>Fxtnom</tt>, and is assumed constant by default. The relative change of the xt coefficient with the valve opening can be specified by customising the <tt>xtfun</tt> function.
</html>", revisions="<html>
<ul>
<li><i>15 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Rewritten with sqrtReg.</li>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<br> <tt>Avnom</tt> removed, <tt>Av</tt> can now be set directly. <tt>Kvnom</tt> and <tt>Cvnom</tt> renamed to <tt>Kv</tt> and <tt>Cv</tt>.
<br><tt>CvData=3</tt> no longer uses <tt>dpnom</tt>,<tt>wnom</tt> and <tt>rhonom</tt>, and requires an additional initial equation to set the flow coefficient based on the initial working conditions.
</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),   DymolaStoredErrors);
  end Valve;

  function f_colebrook "Fanning friction factor for water/steam flows"
    input SI.MassFlowRate w;
    input Real D_A;
    input Real e;
    input SI.DynamicViscosity mu;
    output SI.PerUnit f;
  protected
    Real Re;
  algorithm
    Re := w*D_A/mu;
    Re := if Re > 2100 then Re else 2100;
    f := 0.332/(log(e/3.7 + 5.47/Re^0.9)^2);
    annotation (Documentation(info="<HTML>
<p>The Fanning friction factor is computed by Colebrook's equation, assuming turbulent, one-phase flow. For low Reynolds numbers, the limit value for turbulent flow is returned.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end f_colebrook;

  model CombustionChamber "Combustion Chamber"
    extends BaseClasses.CombustionChamberBase(
      redeclare package Air = Media.Air "O2, H2O, Ar, N2",
      redeclare package Fuel = Media.NaturalGas "N2, CO2, CH4",
      redeclare package Exhaust = Media.FlueGas "O2, Ar, H2O, CO2, N2");
    Real wcomb(final quantity="MolarFlowRate", unit="mol/s")
      "Molar Combustion rate (CH4)";
    SI.PerUnit lambda
      "Stoichiometric ratio (>1 if air flow is greater than stoichiometric)";
  protected
    Air.MassFraction ina_X[Air.nXi]=inStream(ina.Xi_outflow);
    Fuel.MassFraction inf_X[Fuel.nXi]=inStream(inf.Xi_outflow);

  equation
    wcomb = inf.m_flow*inf_X[3]/Fuel.data[3].MM "Combustion molar flow rate";
    lambda = (ina.m_flow*ina_X[1]/Air.data[1].MM)/(2*wcomb);
    assert(lambda >= 1, "Not enough oxygen flow");
    der(MX[1]) = ina.m_flow*ina_X[1] + out.m_flow*fluegas.X[1] - 2*wcomb*
      Exhaust.data[1].MM "oxygen";
    der(MX[2]) = ina.m_flow*ina_X[3] + out.m_flow*fluegas.X[2] "argon";
    der(MX[3]) = ina.m_flow*ina_X[2] + out.m_flow*fluegas.X[3] + 2*wcomb*
      Exhaust.data[3].MM "water";
    der(MX[4]) = inf.m_flow*inf_X[2] + out.m_flow*fluegas.X[4] + wcomb*Exhaust.data[
      4].MM "carbondioxide";
    der(MX[5]) = ina.m_flow*ina_X[4] + out.m_flow*fluegas.X[5] + inf.m_flow*
      inf_X[1] "nitrogen";
    annotation (Icon(graphics), Documentation(info="<html>
This model extends the CombustionChamber Base model, with the definition of the gases.
<p>In particular, the air inlet uses the <tt>Media.Air</tt> medium model, the fuel input uses the <tt>Media.NaturalGas</tt> medium model, and the flue gas outlet uses the <tt>Medium.FlueGas</tt> medium model.
<p>The composition of the outgoing gas is determined by the mass balance of every component, taking into account the combustion reaction CH4+2O2--->2H2O+CO2.</p>
<p>The model assumes complete combustion, so that it is only valid if the oxygen flow at the air inlet is greater than the stoichiometric flow corresponding to the flow at the fuel inlet.</p>

</html>", revisions="<html>
<ul>
<li><i>31 Jan 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
 Combustion Chamber model restructured using inheritance.
     <p>  First release.
 </li>
</ul>
</html>"));
  end CombustionChamber;

  model Compressor "Gas compressor"
    extends BaseClasses.CompressorBase;
    import ThermoPower.Choices.TurboMachinery.TableTypes;
    parameter SI.AngularVelocity Ndesign "Design velocity";
    parameter Real tablePhic[:, :]=fill(
          0,
          0,
          2) "Table for phic(N_T,beta)";
    parameter Real tableEta[:, :]=fill(
          0,
          0,
          2) "Table for eta(N_T,beta)";
    parameter Real tablePR[:, :]=fill(
          0,
          0,
          2) "Table for eta(N_T,beta)";
    parameter String fileName="noName" "File where matrix is stored";
    parameter TableTypes Table = TableTypes.matrix
      "Selection of the way of definition of table matrix";
    Modelica.Blocks.Tables.CombiTable2D Eta(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tableEta,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tabEta",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-12,60},{8,80}}, rotation=0)));
    Modelica.Blocks.Tables.CombiTable2D PressRatio(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tablePR,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tabPR",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-12,0},{8,20}}, rotation=0)));
    Modelica.Blocks.Tables.CombiTable2D Phic(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tablePhic,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tabPhic",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-12,30},{8,50}}, rotation=0)));
    Real N_T "Referred speed ";
    Real N_T_design "Referred design velocity";
    Real phic "Flow number ";
    Real beta(start=integer(size(tablePhic, 1)/2)) "Number of beta line";

  equation
    N_T_design = Ndesign/sqrt(Tdes_in) "Referred design velocity";
    N_T = 100*omega/(sqrt(gas_in.T)*N_T_design)
      "Referred speed definition, as percentage of design velocity";
    phic = w*sqrt(gas_in.T)/(gas_in.p) "Flow number definition";

    // phic = Phic(beta, N_T)
    Phic.u1 = beta;
    Phic.u2 = N_T;
    phic = Phic.y;

    // eta = Eta(beta, N_T)
    Eta.u1 = beta;
    Eta.u2 = N_T;
    eta = Eta.y;

    // PR = PressRatio(beta, N_T)
    PressRatio.u1 = beta;
    PressRatio.u2 = N_T;
    PR = PressRatio.y;
    annotation (Documentation(info="<html>
This model adds the performance characteristics to the Compressor_Base model, by means of 2D interpolation tables.</p>
<p>The perfomance characteristics are specified by two characteristic equations: the first relates the flow number <tt>phic</tt>, the pressure ratio <tt>PR</tt> and the referred speed <tt>N_T</tt>; the second relates the efficiency <tt>eta</tt>, the flow number <tt>phic</tt>, and the referred speed <tt>N_T</tt> [1]. To avoid singularities, the two characteristic equations are expressed in parametric form by adding a further variable <tt>beta</tt> (method of beta lines [2]).
<p>The performance maps are thus tabulated into three differents tables, <tt>tablePhic</tt>,  <tt>tablePR</tt> and <tt>tableEta</tt>, which express <tt>phic</tt>, <tt>PR</tt> and <tt>eta</tt> as a function of <tt>N_T</tt> and <tt>beta</tt>, respectively, where <tt>N_T</tt> is the first row while <tt>beta</tt> is the first column. The referred speed <tt>N_T</tt> is defined as a percentage of the design referred speed and <tt>beta</tt> are arbitrary lines, usually drawn parallel to the surge-line on the performance maps.
<p><tt>Modelica.Blocks.Tables.CombiTable2D</tt> interpolates the tables to obtain values of referred flow, pressure ratio and efficiency at given levels of referred speed and beta.
<p><b>Modelling options</b></p>
<p>The following options are available to determine how the table is defined:
<ul><li><tt>Table = 0</tt>: the table is explicitly supplied as matrix parameter.
<li><tt>Table = 1</tt>: the table is read from a file; the string <tt>fileName</tt> contains the path to the files where the tables are stored, either in ASCII or Matlab binary format.
</ul>
<p><b>References:</b></p>
<ol>
<li>S. L. Dixon: <i>Fluid mechanics, thermodynamics of turbomachinery</i>, Oxford, Pergamon press, 1966, pp. 213.
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol>
</html>", revisions="<html>
<ul>
<li><i>13 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       New method for calculating performance parameters using tables.</li>
</li>
<li><i>14 Jan 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<br> Compressor model restructured using inheritance.
</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end Compressor;

  model Turbine "Gas Turbine"
    extends BaseClasses.TurbineBase;
    import ThermoPower.Choices.TurboMachinery.TableTypes;
    parameter SI.AngularVelocity Ndesign "Design speed";
    parameter Real tablePhic[:, :]=fill(
          0,
          0,
          2) "Table for phic(N_T,PR)";
    parameter Real tableEta[:, :]=fill(
          0,
          0,
          2) "Table for eta(N_T,PR)";
    parameter String fileName="NoName" "File where matrix is stored";
    parameter TableTypes Table = TableTypes.matrix
      "Selection of the way of definition of table matrix";

    Real N_T "Referred speed";
    Real N_T_design "Referred design speed";
    Real phic "Flow number";
    Modelica.Blocks.Tables.CombiTable2D Phic(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tablePhic,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tabPhic",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-10,10},{10,30}}, rotation=
              0)));
    Modelica.Blocks.Tables.CombiTable2D Eta(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tableEta,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tabEta",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-10,50},{10,70}}, rotation=
              0)));
  equation
    N_T_design = Ndesign/sqrt(Tdes_in) "Referred design velocity";
    N_T = 100*omega/(sqrt(gas_in.T)*N_T_design)
      "Referred speed definition as percentage of design velocity";
    phic = w*sqrt(gas_in.T)/(gas_in.p) "Flow number definition";

    // phic = Phic(PR, N_T)
    Phic.u1 = PR;
    Phic.u2 = N_T;
    phic = (Phic.y);

    // eta = Eta(PR, N_T)
    Eta.u1 = PR;
    Eta.u2 = N_T;
    eta = Eta.y;
    annotation (Documentation(info="<html>
This model adds the performance characteristics to the Turbine_Base model, by means of 2D interpolation tables.
<p>The performance characteristics are described by two characteristic equations: the first relates the flow number <tt>phic</tt>, the pressure ratio <tt>PR</tt> and the referred speed <tt>N_T</tt>; the second relates the efficiency <tt>eta</tt>, the flow number <tt>phic</tt>, and the referred speed <tt>N_T</tt> [1]. </p>
<p>The performance maps are tabulated into two differents tables, <tt>tablePhic</tt> and <tt>tableEta</tt> which express <tt>phic</tt> and <tt>eta</tt> as a function of <tt>N_T</tt> and <tt>PR</tt> respectively, where <tt>N_T</tt> represents the first row and <tt>PR</tt> the first column [2]. The referred speed <tt>N_T</tt> is defined as a percentage of the design referred speed.
<p>The <tt>Modelica.Blocks.Tables.CombiTable2D</tt> interpolates the tables to obtain values of referred flow and efficiency at given levels of referred speed.
<p><b>Modelling options</b></p>
<p>The following options are available to determine how the table is defined:
<ul><li><tt>Table = 0</tt>: the table is explicitly supplied as matrix parameter.
<li><tt>Table = 1</tt>: the table is read from a file; the string <tt>fileName</tt> contains the path to the files where tables are stored, either in ASCII or Matlab binary format.
</ul>
<p><b>References:</b></p>
<ol>
<li>S. L. Dixon: <i>Fluid mechanics, thermodynamics of turbomachinery</i>, Oxford, Pergamon press, 1966, pp. 213.
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol>
</html>", revisions="<html>
<ul>
<li><i>13 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       New method for calculating performance parameters using tables.</li>
</li>
<li><i>14 Jan 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<br> Turbine model restructured using inheritance.
</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"), Diagram(graphics));
  end Turbine;

  model TurbineStodola "Gas Turbine"
    extends BaseClasses.TurbineBase;
    import ThermoPower.Choices.TurboMachinery.TableTypes;
    parameter Boolean NominalCondition=true
      "true: K is evaluated from design operating point; false: K is set as a parameter";
    parameter SI.AngularVelocity Ndesign "Design velocity";
    parameter Real tableEta[:, :]=fill(
          0,
          2,
          2) "Table for eta(N_T,PR)";
    parameter String fileName="NoName" "File where matrix is stored";
    parameter TableTypes Table = TableTypes.matrix
      "Selection of the way of definition of table matrix";
    parameter Boolean fixedEta=true "true:eta is a parameter,
      false:eta is calculated from table";
    parameter SI.PerUnit eta_nom=0.8 "Nominal efficiency value";
    parameter Real K(fixed=if (NominalCondition == false) then true else false)
      "Stodola's constant"
       annotation(Dialog(enable=not NominalCondition));
    parameter Medium.MassFlowRate wnom "Nominal mass flow rate";

    Real N_T "Referred speed";
    Real N_T_design "Referred design speed";
    Real phic "Flow number";

    Modelica.Blocks.Tables.CombiTable2D Eta(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tableEta,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tabEta",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-16,38},{4,58}}, rotation=0)));

  initial equation
    // set K if NominalCondition is true
    if NominalCondition then
      wnom*sqrt(Tstart_in)/pstart_in = K*sqrt(1 - (pstart_out/pstart_in)^2)
        "Stodola's constant evaluated from design operation";
    end if;

  equation
    N_T_design = Ndesign/sqrt(Tdes_in) "Referred design velocity";
    N_T = 100*omega/(sqrt(gas_in.T)*N_T_design)
      "Referred speed definition as percentage of design velocity";
    phic = w*sqrt(gas_in.T)/(gas_in.p) "Flow number definition";

    // phic = function(PR, K)
    phic = K*sqrt(1 - (1/PR)^2);

    // eta = Eta(PR, N_T)
    Eta.u1 = PR;
    Eta.u2 = N_T;

    if fixedEta then
      eta = eta_nom;
    else
      eta = Eta.y;
    end if;
    annotation (
      Documentation(info="<html>
This model extends the Turbine_Base model with the calculation of the performance parameters, mass flowrate, pressure ratio and efficiency.
<p>This method is based on the Stodola's law, which calculates <tt>PR</tt> as function of the inlet conditions, i.e. mass flowrate, inlet temperature and pressure.</p>
<p><b>Modelling options</b></p>
<p>The following options are available to define Stodola's constant <tt>K</tt>:
<ul><li><tt>NominalCondition = true</tt>: Stodola's constant K is specified by the nominal operating point (<tt>wnom,Tstart_in,pstart_in,pstart_out</tt>)
<li><tt>NominalCondition = false</tt>: Stodola's constant K is used directly.</ul>
<p>The following options are available to define the efficiency <tt>eta</tt>:
<ul><li><tt>fixedEta = true</tt>: the efficiency is explicitly supplied as a parameter.
<li><tt>fixedEta = false</tt>: the efficiency is a function of the pressure ratio <tt>PR</tt> and of the referred speed <tt>N_T</tt>. The function is defined by interpolation of the table <tt>tableEta</tt>, where <tt>N_T</tt> represents the first row and <tt>PR</tt> the first column of the table. The interpolation is performed by a <tt>Modelica.Blocks.Tables.CombiTable2D</tt> model.
</ul>
<p><p><p>The following options are available to select the way of definition of the table:
<ul><li><tt>Table = 0</tt>: the table is explicitly supplied as a matrix parameter.
<li><tt>Table = 1</tt>: the table is read from a file; the string <tt>fileName</tt> contains the path to the files where the table is stored, either in ASCII or Matlab binary format.
</ul>
</html>", revisions="<html>
<ul>
<li><i>13 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Turbine model restructured using inheritance.<br>
       First release.</li>
</ul>
</html>"),
      Diagram(graphics),
      Icon(graphics));
  end TurbineStodola;

  model GTunit_ISO "Gas Turbine"
    extends BaseClasses.GTunitExhaustBase;
    import ThermoPower.Choices.TurboMachinery.TableTypes;
    parameter Real tableData[:, 4]=fill(
          0,
          0,
          4) "Table with unit data";
    parameter String fileName="noName" "File where matrix is stored";
    parameter TableTypes Table = TableTypes.matrix
      "Selection of the way of definition of table matrix";
    Modelica.Blocks.Tables.CombiTable1Ds OperatingPoint(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tableData,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tableData",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-10,28},{10,48}}, rotation=
              0)));

  equation
    // HI_ISO = f(ZLPout_ISO)
    OperatingPoint.u = ZLPout_ISO;
    OperatingPoint.y[1] = HI_ISO;

    // PR = g(ZLP_ISO)
    OperatingPoint.y[2] = PR;

    // wia_iso = h(ZLP_ISO)
    OperatingPoint.y[3] = wia_ISO;
    annotation (
      Icon(graphics),
      Diagram(graphics),
      Documentation(info="<html>
This model adds the performance characteristics to the GTunit_base model, when only one performance curve is known at ISO conditions: 15 degC temperature and 1.013 bar pressure at the air inlet, and nominal rotational speed.
<ul><li>HI_ISO = f(ZLPout_ISO)</li>
<li>PR = g(ZLPout_ISO)</li>
<li>wia_ISO = h(ZLPout_ISO)</li></ul>
<p>The performance maps are thus tabulated into the matrix <tt>tableData</tt>, whose columns contain:
<ol>
<li><tt>ZLPout_ISO</tt> (zero loss power output in ISO conditions)</li>
<li><tt>HI_ISO</tt> (heat input in ISO conditions)</li>
<li><tt>PR</tt> (pressure ratio)</li>
<li><tt>wia_ISO</tt> (inlet air flow rate in ISO conditions)</li>
</ol>
<p><b>Modelling options</b></p>
<p>The following options are available to select how the table is defined:
<ul><li><tt>Table = 0</tt>: the table is explicitly supplied as matrix parameter.
<li><tt>Table = 1</tt>: the table is read from a file; the string <tt>fileName</tt> contains the path to the files where tables are stored, either in ASCII or Matlab binary format.
</ul>
</html>", revisions="<html>
<ul>
<li><i>7 Jun 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Model restructured by inheritance.</li>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       GT unit model restructured using inheritance.</li>
<br>   First release.
</li>
</ul>
</html>"));
  end GTunit_ISO;

  model GTunit "Gas Turbine"
    extends BaseClasses.GTunitExhaustBase;
    import ThermoPower.Choices.TurboMachinery.TableTypes;
    parameter SI.AngularVelocity omega_sync=314
      "synchronous value of the shaft speed";
    parameter Real tableHI[:, :]=fill(
          0,
          0,
          2) "Table for HI_ISO=f(ZLPout_ISO, Tsync)";
    parameter Real tablePR[:, :]=fill(
          0,
          0,
          2) "Table for PR=g(ZLPout_ISO,Tsync)";
    parameter Real tableW[:, :]=fill(
          0,
          0,
          2) "Table for wia_ISO=h(ZLPout_ISO,Tsync)";
    parameter String fileName="noName" "File where matrix is stored";
    parameter TableTypes Table = TableTypes.matrix
      "Selection of the way of definition of table matrix";
    Modelica.Blocks.Tables.CombiTable2D PowerOut(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tableHI,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tabHI",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-12,36},{8,56}}, rotation=0)));
    Modelica.Blocks.Tables.CombiTable2D PressRatio(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tablePR,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tabPR",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-12,6},{8,26}}, rotation=0)));
    Modelica.Blocks.Tables.CombiTable2D MassFlowRate(
      tableOnFile=if (Table == TableTypes.matrix) then false else true,
      table=tableW,
      tableName=if (Table == TableTypes.matrix) then "NoName" else "tabW",
      fileName=if (Table == TableTypes.matrix) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative)
      annotation (Placement(transformation(extent={{-10,-24},{10,-4}}, rotation=
             0)));
    SI.Temperature Tsync
      "temperature corresponding to omega referred in synchronous conditions";
  equation
    Tsync = (omega_sync/omega)^2*gas.T;
    // HI_ISO = f(ZLPout_ISO, Tsync)
    PowerOut.u1 = ZLPout_ISO;
    PowerOut.u2 = Tsync;
    PowerOut.y = HI_ISO;

    // PR = g(ZLPout_ISO, Tsync)
    PressRatio.u1 = ZLPout_ISO;
    PressRatio.u2 = Tsync;
    PressRatio.y = PR;

    // wia_ISO = h(ZLPout_ISO, Tsync)
    MassFlowRate.u1 = ZLPout_ISO;
    MassFlowRate.u2 = Tsync;
    MassFlowRate.y = wia_ISO;
    annotation (
      Icon(graphics),
      Diagram(graphics),
      Documentation(info="<html>
This model adds the performance characteristics to the GTunit_base model, by means of 2D interpolation tables.
<p>Unit performance is a function of two referred quantities, i.e. Zero Loss Power Output referred at ISO conditions (ZLPout_ISO) and referred speed. In typical performance charts, curves corresponding to different referred speeds are labelled by synchronous temperatures (Tsync), i.e. inlet temperatures which would give the same referred speed if the unit operated at nominal rotational speed. The performance is thus specified by three functions[1]:
<ul><li>HI_ISO = f(ZLPout_ISO, Tsync)</li>
<li>PR = g(ZLPout_ISO, Tsync)</li>
<li>wia_ISO = h(ZLPout_ISO, Tsync)</li></ul>
<p>which in turn are specified by three tables, in the format of Modelica.Blocks.Tables.CombiTable2D:
<ol><li><tt>tableHI</tt>, where <tt>ZLPout_ISO</tt> is the first column and <tt>Tsync</tt> the first row</li>
<li><tt>tablePR</tt>, where <tt>ZLPout_ISO</tt> is the first column and <tt>Tsync</tt> the first row</li>
<li> <tt>tableW</tt>, where <tt>ZLPout_ISO</tt> is the first column and <tt>Tsync</tt> the first row</li>, respectively.</li></ol>
<p><b>Modelling options</b></p>
The packages Medium are redeclared and a mass balance determines the composition of the outgoing gas.
<p>The following options are available to select the way of definition of the table:
<ul><li><tt>Table = 0</tt>: the table is explicitly supplied as matrix parameter.
<li><tt>Table = 1</tt>: the table is read from a file; the string <tt>fileName</tt> contains the path to the files where tables are stored, either in ASCII or Matlab binary format.
</ul>
<p><b>References:</b></p>
<ol>
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol>

</html>", revisions="<html>
<ul>
<li><i>7 Jun 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Model restructured by inheritance.</li>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       GT unit model restructured using inheritance.</li>
<br>   First release.
</li>
</ul>
</html>"));
  end GTunit;

  model FanMech
    extends BaseClasses.FanBase;
    SI.Angle phi "Shaft angle";
    SI.AngularVelocity omega "Shaft angular velocity";
    Modelica.Mechanics.Rotational.Interfaces.Flange_a MechPort annotation (
        Placement(transformation(extent={{78,6},{108,36}}, rotation=0)));
  equation
    n = Modelica.SIunits.Conversions.to_rpm(omega) "Rotational speed";

    // Mechanical boundary condition
    phi = MechPort.phi;
    omega = der(phi);
    W_single = omega*MechPort.tau;

    annotation (
      Diagram(graphics),
      Icon(graphics={Rectangle(
            extent={{60,28},{86,12}},
            lineColor={0,0,0},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={160,160,164})}),
      Documentation(info="<HTML>
<p>This model describes a fan (or a group of <tt>Np</tt> fans in parallel) with a mechanical rotational connector for the shaft, to be used when the pump drive has to be modelled explicitly. In the case of <tt>Np</tt> fans in parallel, the mechanical connector is relative to a single fan.
<p>The model extends <tt>FanBase</tt>
 </HTML>", revisions="<html>
<ul>
<li><i>10 Nov 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
      Adapted from the <tt>Water.PumpBase</tt> model.</li>
</ul>
</html>"));
  end FanMech;

  package BaseClasses
    extends Modelica.Icons.BasesPackage;
    partial model Flow1DBase
      "Basic interface for 1-dimensional water/steam fluid flow models"
      extends Icons.Gas.Tube;
      import ThermoPower.Choices.Flow1D.FFtypes;
      import ThermoPower.Choices.Flow1D.HCtypes;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        annotation(choicesAllMatching = true);
      parameter Integer N(min=2) = 2 "Number of nodes for thermal variables";
      parameter Integer Nw = N - 1 "Number of volumes on the wall interface";
      parameter Integer Nt=1 "Number of tubes in parallel";
      parameter SI.Distance L "Tube length";
      parameter SI.Position H=0 "Elevation of outlet over inlet";
      parameter SI.Area A "Cross-sectional area (single tube)";
      parameter SI.Length omega
        "Perimeter of heat transfer surface (single tube)";
      parameter SI.Length Dhyd "Hydraulic Diameter (single tube)";
      parameter Medium.MassFlowRate wnom "Nominal mass flowrate (total)";
      parameter ThermoPower.Choices.Flow1D.FFtypes FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
        "Friction Factor Type"
        annotation(Evaluate=true);
      parameter SI.Pressure dpnom = 0 "Nominal pressure drop";
      parameter Real Kfnom=0 "Nominal hydraulic resistance coefficient"
        annotation(Dialog(enable = (FFtype == ThermoPower.Choices.Flow1D.FFtypes.Kfnom)));
      parameter Medium.Density rhonom=0 "Nominal inlet density"
        annotation(Dialog(enable = (FFtype == ThermoPower.Choices.Flow1D.FFtypes.OpPoint)));
      parameter SI.PerUnit Cfnom=0 "Nominal Fanning friction factor"
        annotation(Dialog(enable = (FFtype == ThermoPower.Choices.Flow1D.FFtypes.Cfnom)));
      parameter SI.PerUnit e=0 "Relative roughness (ratio roughness/diameter)";
      parameter Real Kfc=1 "Friction factor correction coefficient";
      parameter Boolean DynamicMomentum=false
        "Inertial phenomena accounted for"
        annotation (Evaluate=true);
      parameter Boolean UniformComposition=true
        "Uniform gas composition is assumed" annotation (Evaluate=true);
      parameter Boolean QuasiStatic=false
        "Quasi-static model (mass, energy and momentum static balances"
        annotation (Evaluate=true);
      parameter HCtypes HydraulicCapacitance=HCtypes.Downstream
        "1: Upstream, 2: Downstream";
      parameter Boolean avoidInletEnthalpyDerivative=true
        "Avoid inlet enthalpy derivative";
      parameter Boolean allowFlowReversal=system.allowFlowReversal
        "= true to allow flow reversal, false restricts to design direction";
      outer ThermoPower.System system "System wide properties";
      parameter Medium.AbsolutePressure pstart=1e5 "Pressure start value"
        annotation (Dialog(tab="Initialisation"));
      parameter Medium.Temperature Tstartbar=300
        "Avarage temperature start value"
        annotation (Dialog(tab="Initialisation"));
      parameter Medium.Temperature Tstartin=Tstartbar
        "Inlet temperature start value" annotation (Dialog(tab="Initialisation"));
      parameter Medium.Temperature Tstartout=Tstartbar
        "Outlet temperature start value" annotation (Dialog(tab="Initialisation"));
      parameter Medium.Temperature Tstart[N]=linspace(
            Tstartin,
            Tstartout,
            N) "Start value of temperature vector (initialized by default)"
        annotation (Dialog(tab="Initialisation"));
      final parameter SI.Velocity unom=10
        "Nominal velocity for simplified equation";
      parameter Real wnf=0.01
        "Fraction of nominal flow rate at which linear friction equals turbulent friction";
      parameter Medium.MassFraction Xstart[nX]=Medium.reference_X
        "Start gas composition" annotation (Dialog(tab="Initialisation"));
      parameter Choices.Init.Options initOpt=system.initOpt
        "Initialisation option"
        annotation (Dialog(tab="Initialisation"));
      parameter Boolean noInitialPressure=false
        "Remove initial equation on pressure"
        annotation (Dialog(tab="Initialisation"),choices(checkBox=true));

      function squareReg = ThermoPower.Functions.squareReg;
    protected
      parameter Integer nXi=Medium.nXi "number of independent mass fractions";
      parameter Integer nX=Medium.nX "total number of mass fractions";
    public
      FlangeA infl(redeclare package Medium = Medium, m_flow(start=wnom, min=if
              allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
         Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
      FlangeB outfl(redeclare package Medium = Medium, m_flow(start=-wnom, max=
              if allowFlowReversal then +Modelica.Constants.inf else 0))
        annotation (Placement(transformation(extent={{80,-20},{120,20}}, rotation=
               0)));
    equation
        assert(FFtype == FFtypes.NoFriction or dpnom > 0,
        "dpnom=0 not valid, it is also used in the homotopy trasformation during the inizialization");
        annotation(Dialog(enable = (FFtype == ThermoPower.Choices.Flow1D.FFtypes.Colebrook)),
        Documentation(info="<HTML>
Basic interface of the <tt>Flow1D</tt> models, containing the common parameters and connectors.
</HTML>
",     revisions="<html>
<ul>
<li><i>7 Apr 2014</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Added base class.</li>

</ul>
</html>"),
        Diagram(graphics),
        Icon(graphics));
    end Flow1DBase;

    partial model CombustionChamberBase "Combustion Chamber"
      extends Icons.Gas.Mixer;
      replaceable package Air = Modelica.Media.Interfaces.PartialMedium;
      replaceable package Fuel = Modelica.Media.Interfaces.PartialMedium;
      replaceable package Exhaust = Modelica.Media.Interfaces.PartialMedium;
      parameter SI.Volume V "Inner volume";
      parameter SI.Area S=0 "Inner surface";
      parameter SI.CoefficientOfHeatTransfer gamma=0
        "Heat Transfer Coefficient"
        annotation (Evaluate=true);
      parameter SI.HeatCapacity Cm=0 "Metal Heat Capacity" annotation (Evaluate=true);
      parameter SI.Temperature Tmstart=300 "Metal wall start temperature"
        annotation (Dialog(tab="Initialisation"));
      parameter SI.SpecificEnthalpy HH "Lower Heating value of fuel";
      parameter Boolean allowFlowReversal=system.allowFlowReversal
        "= true to allow flow reversal, false restricts to design direction";
      outer ThermoPower.System system "System wide properties";
      parameter Air.AbsolutePressure pstart=101325 "Pressure start value"
        annotation (Dialog(tab="Initialisation"));
      parameter Air.Temperature Tstart=300 "Temperature start value"
        annotation (Dialog(tab="Initialisation"));
      parameter Air.MassFraction Xstart[Exhaust.nX]=Exhaust.reference_X
        "Start flue gas composition" annotation (Dialog(tab="Initialisation"));
      parameter Choices.Init.Options initOpt=system.initOpt
        "Initialisation option"
        annotation (Dialog(tab="Initialisation"));
      parameter Boolean noInitialPressure=false
        "Remove initial equation on pressure"
        annotation (Dialog(tab="Initialisation"),choices(checkBox=true));

      Exhaust.BaseProperties fluegas(
        p(start=pstart),
        T(start=Tstart),
        Xi(start=Xstart[1:Exhaust.nXi]));
      SI.Mass M "Gas total mass";
      SI.Mass MX[Exhaust.nXi] "Partial flue gas masses";
      SI.InternalEnergy E "Gas total energy";
      SI.Temperature Tm(start=Tmstart) "Wall temperature";
      Air.SpecificEnthalpy hia "Air specific enthalpy";
      Fuel.SpecificEnthalpy hif "Fuel specific enthalpy";
      Exhaust.SpecificEnthalpy ho "Outlet specific enthalpy";
      SI.Power HR "Heat rate";

      SI.Time Tr "Residence time";
      FlangeA ina(redeclare package Medium = Air, m_flow(min=if allowFlowReversal
               then -Modelica.Constants.inf else 0)) "inlet air" annotation (
          Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
      FlangeA inf(redeclare package Medium = Fuel, m_flow(min=if
              allowFlowReversal then -Modelica.Constants.inf else 0))
        "inlet fuel" annotation (Placement(transformation(extent={{-20,80},{20,
                120}}, rotation=0)));
      FlangeB out(redeclare package Medium = Exhaust, m_flow(max=if
              allowFlowReversal then +Modelica.Constants.inf else 0))
        "flue gas"
        annotation (Placement(transformation(extent={{80,-20},{120,20}}, rotation=
               0)));
    equation
      M = fluegas.d*V "Gas mass";
      E = fluegas.u*M "Gas energy";
      MX = fluegas.Xi*M "Component masses";
      HR = inf.m_flow*HH;
      der(M) = ina.m_flow + inf.m_flow + out.m_flow "Gas mass balance";
      der(E) = ina.m_flow*hia + inf.m_flow*hif + out.m_flow*ho + HR - gamma*S*(
        fluegas.T - Tm) "Gas energy balance";
      if Cm > 0 and gamma > 0 then
        Cm*der(Tm) = gamma*S*(fluegas.T - Tm) "Metal wall energy balance";
      else
        Tm = fluegas.T;
      end if;

      // Set gas properties
      out.p = fluegas.p;
      out.h_outflow = fluegas.h;
      out.Xi_outflow = fluegas.Xi;

      // Boundary conditions
      ina.p = fluegas.p;
      ina.h_outflow = 0;
      ina.Xi_outflow = Air.reference_X[1:Air.nXi];
      inf.p = fluegas.p;
      inf.h_outflow = 0;
      inf.Xi_outflow = Fuel.reference_X[1:Fuel.nXi];
      assert(ina.m_flow >= 0, "The model does not support flow reversal");
      hia = inStream(ina.h_outflow);
      assert(inf.m_flow >= 0, "The model does not support flow reversal");
      hif = inStream(inf.h_outflow);
      assert(out.m_flow <= 0, "The model does not support flow reversal");
      ho = fluegas.h;

      Tr = noEvent(M/max(abs(out.m_flow), Modelica.Constants.eps));
    initial equation
      // Initial conditions
      if initOpt == Choices.Init.Options.noInit then
        // do nothing
      elseif initOpt == Choices.Init.Options.fixedState then
        if not noInitialPressure then
          fluegas.p = pstart;
        end if;
        fluegas.T = Tstart;
        fluegas.Xi = Xstart[1:Exhaust.nXi];
      elseif initOpt == Choices.Init.Options.steadyState then
        if not noInitialPressure then
          der(fluegas.p) = 0;
        end if;
        der(fluegas.T) = 0;
        der(fluegas.Xi) = zeros(Exhaust.nXi);
        if (Cm > 0 and gamma > 0) then
          der(Tm) = 0;
        end if;
      elseif initOpt == Choices.Init.Options.steadyStateNoP then
        der(fluegas.T) = 0;
        der(fluegas.Xi) = zeros(Exhaust.nXi);
        if (Cm > 0 and gamma > 0) then
          der(Tm) = 0;
        end if;
      else
        assert(false, "Unsupported initialisation option");
      end if;

      annotation (Documentation(info="<html>
This is the model-base of a Combustion Chamber, with a constant volume.
<p>The metal wall temperature and the heat transfer coefficient between the wall and the fluid are uniform. The wall is thermally insulated from the outside. It has been assumed that inlet gases are premixed before entering in the volume.
<p><b>Modelling options</b></p>
<p>This model has three different Medium models to characterize the inlet air, fuel, and flue gas exhaust.
<p>If <tt>gamma = 0</tt>, the thermal effects of the surrounding walls are neglected.</p>
<p>There are two ways to obtain correct energy balances. The first is to explicitly set the lower heating value of the fuel <tt>HH</tt>, and use medium models that do not include the enthalpy of formation, by setting <tt>excludeEnthalpyOfFormation = true</tt>, which is the default option in Modelica.Media. As the heating value is usually provided at 25 degC temperature, it is also necessary to set <tt>referenceChoice =ReferenceEnthalpy.ZeroAt25C</tt> in all medium models for consistency. This is done in the medium models contained within <a href=\"modelica://ThermoPower.Media\">ThermoPower.Media</a>.</p>
<p>Alternatively, one can set <tt>excludeEnthalpyOfFormation = false</tt> in all media and set <tt>HH = 0</tt>. By doing so, the heating value is automatically accounted for by the difference in the enthalpy of formation. 
</html>",   revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>31 Jan 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    CombustionChamber model restructured using inheritance.
<p> First release.</li>
</ul>
</html>
"),   Diagram(graphics));
    end CombustionChamberBase;

    partial model CompressorBase "Gas compressor"
      extends ThermoPower.Icons.Gas.Compressor;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        annotation(choicesAllMatching = true);
      parameter Boolean explicitIsentropicEnthalpy=true
        "isentropicEnthalpy function used";
      parameter SI.PerUnit eta_mech=0.98 "mechanical efficiency";
      parameter Medium.AbsolutePressure pstart_in "inlet start pressure"
        annotation (Dialog(tab="Initialisation"));
      parameter Medium.AbsolutePressure pstart_out "outlet start pressure"
        annotation (Dialog(tab="Initialisation"));
      parameter Medium.Temperature Tdes_in "inlet design temperature";
      parameter Boolean allowFlowReversal=system.allowFlowReversal
        "= true to allow flow reversal, false restricts to design direction";
      outer ThermoPower.System system "System wide properties";
      parameter Medium.Temperature Tstart_in=Tdes_in "inlet start temperature"
                                  annotation (Dialog(tab="Initialisation"));
      parameter Medium.Temperature Tstart_out "outlet start temperature"
                                   annotation (Dialog(tab="Initialisation"));
      parameter Medium.MassFraction Xstart[Medium.nX]=Medium.reference_X
        "start gas composition" annotation (Dialog(tab="Initialisation"));
      Medium.BaseProperties gas_in(
        p(start=pstart_in),
        T(start=Tstart_in),
        Xi(start=Xstart[1:Medium.nXi]));
      Medium.BaseProperties gas_iso(
        p(start=pstart_out),
        T(start=Tstart_out),
        Xi(start=Xstart[1:Medium.nXi]));
      Medium.SpecificEnthalpy hout_iso "Outlet isentropic enthalpy";
      Medium.SpecificEnthalpy hout "Outlet enthaply";
      Medium.SpecificEntropy s_in "Inlet specific entropy";
      Medium.AbsolutePressure pout(start=pstart_out) "Outlet pressure";

      Medium.MassFlowRate w "Gas flow rate";
      SI.Angle phi "shaft rotation angle";
      SI.AngularVelocity omega "shaft angular velocity";
      SI.Torque tau "net torque acting on the compressor";

      SI.PerUnit eta "isentropic efficiency";
      SI.PerUnit PR "pressure ratio";

      FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
              allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
         Placement(transformation(extent={{-100,60},{-60,100}}, rotation=0)));
      FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
              allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
         Placement(transformation(extent={{60,60},{100,100}}, rotation=0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_a annotation (
          Placement(transformation(extent={{-72,-12},{-48,12}}, rotation=0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b shaft_b annotation (
          Placement(transformation(extent={{48,-12},{72,12}}, rotation=0)));

    equation
      w = inlet.m_flow;
      assert(w >= 0, "The compressor model does not support flow reversal");
      inlet.m_flow + outlet.m_flow = 0 "Mass balance";

      // Set inlet gas properties
      gas_in.p = inlet.p;
      gas_in.h = inStream(inlet.h_outflow);
      gas_in.Xi = inStream(inlet.Xi_outflow);

      // Set outlet gas properties
      outlet.p = pout;
      outlet.h_outflow = hout;
      outlet.Xi_outflow = gas_in.Xi;

      // Equations for reverse flow (not used)
      inlet.h_outflow = inStream(outlet.h_outflow);
      inlet.Xi_outflow = inStream(outlet.Xi_outflow);

      // Component mass balances
      gas_iso.Xi = gas_in.Xi;

      if explicitIsentropicEnthalpy then
        hout_iso = Medium.isentropicEnthalpy(outlet.p, gas_in.state)
          "Approximated isentropic enthalpy";
        hout - gas_in.h = 1/eta*(hout_iso - gas_in.h);
        // dummy assignments
        s_in = 0;
        gas_iso.p = 1e5;
        gas_iso.T = 300;
      else
        // Properties of the gas after isentropic transformation
        gas_iso.p = pout;
        s_in = Medium.specificEntropy(gas_in.state);
        s_in = Medium.specificEntropy(gas_iso.state);
        hout - gas_in.h = 1/eta*(gas_iso.h - gas_in.h);
        // dummy assignment
        hout_iso = 0;
      end if;

      w*(hout - gas_in.h) = tau*omega*eta_mech "Energy balance";
      PR = pout/gas_in.p "Pressure ratio";

      // Mechanical boundary conditions
      shaft_a.phi = phi;
      shaft_b.phi = phi;
      shaft_a.tau + shaft_b.tau = tau;
      der(phi) = omega;
      annotation (
        Documentation(info="<html>
<p>This is the base model for a compressor, including the interface and all equations except the actual computation of the performance characteristics. Reverse flow conditions are not supported.</p>
<p>This model does not include any shaft inertia by itself; if that is needed, connect a Modelica.Mechanics.Rotational.Inertia model to one of the shaft connectors.</p>
<p>As a base-model, it can be used both for axial and centrifugal compressors.
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the start composition is given by <tt>Xstart</tt>, whose default value is <tt>Medium.reference_X</tt>.
<p>The following options are available to calculate the enthalpy of the outgoing gas:
<ul><li><tt>explicitIsentropicEnthalpy = true</tt>: the isentropic enthalpy <tt>hout_iso</tt> is calculated by the <tt>Medium.isentropicEnthalpy</tt> function. <li><tt>explicitIsentropicEnthalpy = false</tt>: the isentropic enthalpy is obtained by equating the specific entropy of the inlet gas <tt>gas_in</tt> and of a fictitious gas state <tt>gas_iso</tt>, with the same pressure of the outgoing gas; both are computed with the function <tt>Medium.specificEntropy</tt>.</pp></ul>
</html>",   revisions="<html>
<ul>
<li><i>13 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Medium.BaseProperties <tt>gas_out</tt>removed.</li>
</li>
<li><i>14 Jan 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<br> Compressor model restructured using inheritance.
</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),     Diagram(graphics),
        Icon(graphics={Text(
              extent={{-128,-60},{128,-100}},
              lineColor={0,0,255},
              textString="%name")}));
    end CompressorBase;

    partial model TurbineBase "Gas Turbine"
      extends ThermoPower.Icons.Gas.Turbine;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        annotation(choicesAllMatching = true);
      parameter Boolean explicitIsentropicEnthalpy=true
        "isentropicEnthalpy function used";
      parameter SI.PerUnit eta_mech=0.98 "mechanical efficiency";
      parameter Medium.Temperature Tdes_in "inlet design temperature";
      parameter Boolean allowFlowReversal=system.allowFlowReversal
        "= true to allow flow reversal, false restricts to design direction";
      outer ThermoPower.System system "System wide properties";
      parameter Medium.AbsolutePressure pstart_in "inlet start pressure"
        annotation (Dialog(tab="Initialisation"));
      parameter Medium.AbsolutePressure pstart_out "outlet start pressure"
        annotation (Dialog(tab="Initialisation"));
      parameter Medium.Temperature Tstart_in=Tdes_in "inlet start temperature"
                                  annotation (Dialog(tab="Initialisation"));
      parameter Medium.Temperature Tstart_out "outlet start temperature"
                                   annotation (Dialog(tab="Initialisation"));
      parameter Medium.MassFraction Xstart[Medium.nX]=Medium.reference_X
        "start gas composition" annotation (Dialog(tab="Initialisation"));

      Medium.BaseProperties gas_in(
        p(start=pstart_in),
        T(start=Tstart_in),
        Xi(start=Xstart[1:Medium.nXi]));
      Medium.BaseProperties gas_iso(
        p(start=pstart_out),
        T(start=Tstart_out),
        Xi(start=Xstart[1:Medium.nXi]));

      SI.Angle phi "shaft rotation angle";
      SI.Torque tau "net torque acting on the turbine";
      SI.AngularVelocity omega "shaft angular velocity";
      Medium.MassFlowRate w "Gas flow rate";
      Medium.SpecificEntropy s_in "Inlet specific entropy";
      Medium.SpecificEnthalpy hout_iso "Outlet isentropic enthalpy";
      Medium.SpecificEnthalpy hout "Outlet enthalpy";
      Medium.AbsolutePressure pout(start=pstart_out) "Outlet pressure";
      SI.PerUnit PR "pressure ratio";
      SI.PerUnit eta "isoentropic efficiency";

      Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_a annotation (
          Placement(transformation(extent={{-72,-12},{-48,12}}, rotation=0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b shaft_b annotation (
          Placement(transformation(extent={{48,-12},{72,12}}, rotation=0)));
      FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
              allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
         Placement(transformation(extent={{-100,60},{-60,100}}, rotation=0)));
      FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
              allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
         Placement(transformation(extent={{60,60},{100,100}}, rotation=0)));
    equation
      w = inlet.m_flow;
      assert(w >= 0, "The turbine model does not support flow reversal");
      inlet.m_flow + outlet.m_flow = 0 "Mass balance";

      // Set inlet gas properties
      gas_in.p = inlet.p;
      gas_in.h = inStream(inlet.h_outflow);
      gas_in.Xi = inStream(inlet.Xi_outflow);

      // Set outlet gas properties
      outlet.p = pout;
      outlet.h_outflow = hout;
      outlet.Xi_outflow = gas_in.Xi;

      // Equations for reverse flow (not used)
      inlet.h_outflow = inStream(outlet.h_outflow);
      inlet.Xi_outflow = inStream(outlet.Xi_outflow);

      // Component mass balances
      gas_iso.Xi = gas_in.Xi;

      if explicitIsentropicEnthalpy then
        hout_iso = Medium.isentropicEnthalpy(outlet.p, gas_in.state)
          "Approximated isentropic enthalpy";
        hout - gas_in.h = eta*(hout_iso - gas_in.h) "Enthalpy change";
        //dummy assignments
        s_in = 0;
        gas_iso.p = 1e5;
        gas_iso.T = 300;
      else
        // Properties of the gas after isentropic transformation
        gas_iso.p = pout;
        s_in = Medium.specificEntropy(gas_in.state);
        s_in = Medium.specificEntropy(gas_iso.state);
        hout - gas_in.h = eta*(gas_iso.h - gas_in.h) "Enthalpy change";
        //dummy assignment
        hout_iso = 0;
      end if;

      w*(hout - gas_in.h)*eta_mech = tau*omega "Energy balance";
      PR = gas_in.p/pout "Pressure ratio";

      // Mechanical boundary conditions
      shaft_a.phi = phi;
      shaft_b.phi = phi;
      shaft_a.tau + shaft_b.tau = tau;
      der(phi) = omega;
      annotation (
        Documentation(info="<html>
<p>This is the base model for a turbine, including the interface and all equations except the actual computation of the performance characteristics. Reverse flow conditions are not supported.</p>
<p>This model does not include any shaft inertia by itself; if that is needed, connect a Modelica.Mechanics.Rotational.Inertia model to one of the shaft connectors.</p>
<p>As a base-model, it can be used both for axial and radial turbines.
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the start composition is given by <tt>Xstart</tt>, whose default value is <tt>Medium.reference_X</tt>.
<p>The following options are available to calculate the enthalpy of the outgoing gas:
<ul><li><tt>explicitIsentropicEnthalpy = true</tt>: the isentropic enthalpy <tt>hout_iso</tt> is calculated by the <tt>Medium.isentropicEnthalpy</tt> function. <li><tt>explicitIsentropicEnthalpy = false</tt>: the isentropic enthalpy is determined by equating the specific entropy of the inlet gas <tt>gas_in</tt> and of a fictitious gas state <tt>gas_iso</tt>, with the same pressure of the outgoing gas; both are computed with the function <tt>Medium.specificEntropy</tt>.</pp></ul>
</html>",   revisions="<html>
<ul>
<li><i>13 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Medium.BaseProperties <tt>gas_out</tt>removed.</li>
</li>
<li><i>14 Jan 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<br> Turbine model restructured using inheritance.
</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
        Icon(graphics={Text(
              extent={{-128,-60},{128,-100}},
              lineColor={0,0,255},
              textString="%name")}),
        Diagram(graphics));
    end TurbineBase;

    partial model GTunitBase "Gas Turbine"
      extends ThermoPower.Icons.Gas.GasTurbineUnit;
      replaceable package Air = Modelica.Media.Interfaces.PartialMedium;
      replaceable package Fuel = Modelica.Media.Interfaces.PartialMedium;
      replaceable package Exhaust = Modelica.Media.Interfaces.PartialMedium;
      parameter Modelica.SIunits.Pressure pstart "start pressure value"
        annotation (Dialog(tab="Initialisation"));
      parameter Exhaust.Temperature Tstart "start temperature value"
        annotation (Dialog(tab="Initialisation"));
      parameter Modelica.SIunits.MassFraction Xstart[Air.nX]=Air.reference_X
        "start gas composition" annotation (Dialog(tab="Initialisation"));
      constant Exhaust.AbsolutePressure pnom=1.013e5 "ISO reference pressure";
      constant Air.Temperature Tnom=288.15 "ISO reference temperature";
      parameter SI.SpecificEnthalpy HH "Lower Heating value";
      parameter SI.PerUnit eta_mech=0.95 "mechanical efficiency";
      parameter Boolean allowFlowReversal=system.allowFlowReversal
        "= true to allow flow reversal, false restricts to design direction";
      outer ThermoPower.System system "System wide properties";

      Air.BaseProperties gas(
        p(start=pstart),
        T(start=Tstart),
        Xi(start=Xstart[1:Air.nXi]));

      Air.MassFlowRate wia "Air mass flow";
      Air.MassFlowRate wia_ISO "Air mass flow, referred to ISO conditions";
      Fuel.MassFlowRate wif "Fuel mass flow";
      Exhaust.MassFlowRate wout "FlueGas mass flow";
      Air.SpecificEnthalpy hia "Air specific enthalpy";
      Fuel.SpecificEnthalpy hif "Fuel specific enthalpy";
      Exhaust.SpecificEnthalpy hout "FlueGas specific enthalpy";

      SI.Angle phi "shaft rotation angle";
      SI.Torque tau "net torque acting on the turbine";
      SI.AngularVelocity omega "shaft angular velocity";
      SI.Power ZLPout "zero_loss power output";
      SI.Power ZLPout_ISO "zero_loss power output, referred to ISO conditions ";
      SI.Power Pout "Net power output";
      SI.Power HI "Heat input";
      SI.Power HI_ISO "Heat input, referred to ISO conditions";
      SI.PerUnit PR "pressure ratio";
      Exhaust.AbsolutePressure pc "combustion pressure";
      Air.AbsolutePressure pin "inlet pressure";

      FlangeA Air_in(redeclare package Medium = Air,m_flow(min=if
              allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
         Placement(transformation(extent={{-100,20},{-80,40}}, rotation=0)));
      FlangeA Fuel_in(redeclare package Medium = Fuel,m_flow(min=if
              allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
         Placement(transformation(extent={{-10,62},{10,82}}, rotation=0)));
      FlangeB FlueGas_out(redeclare package Medium = Exhaust,m_flow(max=if
              allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
         Placement(transformation(extent={{80,20},{100,40}}, rotation=0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b shaft_b annotation (
          Placement(transformation(extent={{88,-10},{108,10}}, rotation=0)));
    equation

      PR = pc/pin "pressure ratio";
      HI = wif*HH "Heat input";
      HI_ISO = HI*sqrt(Tnom/gas.T)*(pnom/gas.p)
        "heat input, referred to ISO conditions";

      0 = Air_in.m_flow + Fuel_in.m_flow + FlueGas_out.m_flow "Mass balance";
      0 = wia*gas.h + wif*(hif + HH) + wout*hout - ZLPout "Energy balance";
      ZLPout_ISO = ZLPout*sqrt(Tnom/gas.T)*(pnom/gas.p)
        "Net power output, referred to ISO conditions";
      Pout = ZLPout*eta_mech "Net power output";
      Pout = tau*omega "Mechanical boundary condition";
      wia_ISO = wia*sqrt(gas.T/Tnom)/(gas.p/pnom)
        "Air mass flow, referred to ISO conditions";

      // Set inlet gas properties
      gas.p = Air_in.p;
      gas.h = inStream(Air_in.h_outflow);
      gas.Xi = inStream(Air_in.Xi_outflow);

      // Boundary conditions
      assert(Air_in.m_flow >= 0, "The model does not support flow reversal");
      wia = Air_in.m_flow;
      hia = inStream(Air_in.h_outflow);
      Air_in.p = pin;
      Air_in.h_outflow = 0;
      Air_in.Xi_outflow = Air.reference_X[1:Air.nXi];
      assert(Fuel_in.m_flow >= 0, "The model does not support flow reversal");
      wif = Fuel_in.m_flow;
      hif = inStream(Fuel_in.h_outflow);
      Fuel_in.p = pc;
      Fuel_in.h_outflow = 0;
      Fuel_in.Xi_outflow = Fuel.reference_X[1:Fuel.nXi];
      assert(FlueGas_out.m_flow <= 0, "The model does not support flow reversal");
      wout = FlueGas_out.m_flow;
      hout = FlueGas_out.h_outflow;
      // Flue gas composition FlueGas_out.XBA to be determined by extended model

      // Mechanical boundaries
      shaft_b.phi = phi;
      shaft_b.tau = -tau;
      der(phi) = omega;

      annotation (
        Icon(graphics={Text(
              extent={{-126,-60},{130,-100}},
              lineColor={0,0,255},
              textString="%name")}),
        Diagram(graphics),
        Documentation(info="<html>
This model describes a gas turbine unit as a single model, including the interface and all equations, except the computation of the performance characteristics and of the exhaust composition.
<p>Actual operating conditions are related to ISO standard conditions <tt>pnom</tt> and <tt>Tnom</tt> by the following relationship:
<ul><li> HI_ISO = HI*sqrt(Tnom/gas.T)*(pnom/gas.p)</li>
<li> ZLPout_ISO = ZLPout*sqrt(Tnom/gas.T)*(pnom/gas.p)</li>
<li> wia_ISO = wia*pnom/gas.p*sqrt(gas.T/Tnom)</li></ul>
<p> where <tt>HI</tt> is the heat input, <tt>ZLPout</tt> the zero loss power output and <tt>wia</tt> the air inlet flow.
<p><b>Modelling options</b></p>
<p>This model has three different Medium models to characterize the inlet air, fuel, and flue gas exhaust.
</html>",   revisions="<html>
<ul>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       GTunit model restructured using inheritance.<br>
       First release.</li>
</ul>
</html>"));
    end GTunitBase;

    partial model GTunitExhaustBase
      "Adds computation of exhaust composition to GTunitBase"
      extends BaseClasses.GTunitBase(
        redeclare package Air = ThermoPower.Media.Air "O2, H2O, Ar, N2",
        redeclare package Fuel = ThermoPower.Media.NaturalGas "N2, CO2, CH4",
        redeclare package Exhaust = ThermoPower.Media.FlueGas
          "O2, Ar, H2O, CO2, N2");
      parameter Boolean constantCompositionExhaust=false
        "Assume exhaust composition equal to reference_X";
      Real wcomb(final quantity="MolarFlowRate", unit="mol/s")
        "Molar Combustion rate (CH4)";
      Real lambda
        "Stoichiometric ratio (>1 if air flow is greater than stoichiometric)";
    protected
      Real Air_in_X[Air.nXi]=inStream(Air_in.Xi_outflow);
      Real Fuel_in_X[Fuel.nXi]=inStream(Fuel_in.Xi_outflow);
    equation
      wcomb = wif*Fuel_in_X[3]/Fuel.data[3].MM "Combustion molar flow rate";
      lambda = (wia*Air_in_X[1]/Air.data[1].MM)/(2*wcomb);
      assert(lambda >= 1, "Not enough oxygen flow");
      if constantCompositionExhaust then
        FlueGas_out.Xi_outflow[1:Exhaust.nXi] = Exhaust.reference_X[1:Exhaust.nXi]
          "Reference value for exhaust compostion";
      else
        // True mass balances
        0 = wia*Air_in_X[1] + wout*FlueGas_out.Xi_outflow[1] - 2*wcomb*Exhaust.data[
          1].MM "oxygen";
        0 = wia*Air_in_X[3] + wout*FlueGas_out.Xi_outflow[2] "argon";
        0 = wia*Air_in_X[2] + wout*FlueGas_out.Xi_outflow[3] + 2*wcomb*Exhaust.data[
          3].MM "water";
        0 = wout*FlueGas_out.Xi_outflow[4] + wif*Fuel_in_X[2] + wcomb*Exhaust.data[
          4].MM "carbondioxide";
        0 = wia*Air_in_X[4] + wout*FlueGas_out.Xi_outflow[5] + wif*Fuel_in_X[1]
          "nitrogen";
      end if;
      annotation (Documentation(info="<html>
This model extends <tt>GTunitBase</tt>, by adding the computation of the exhaust composition.

<p><b>Modelling options</b></p>
If <tt>constantCompositionExhaust = false</tt>, the exhaust composition is computed according to the exact mass balances; otherwise, the exhaust composition is held fixed to <tt>Exhaust.reference_X</tt>.
</html>",   revisions="<html>
<ul>
<li><i>7 Jun 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       GTunit models further restructured.</li>
</ul>
</html>"));
    end GTunitExhaustBase;

    partial model FanBase "Base model for fans"
      extends Icons.Gas.Fan;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        "Medium model"
        annotation(choicesAllMatching = true);
      Medium.BaseProperties inletFluid(h(start=hstart))
        "Fluid properties at the inlet";
      replaceable function flowCharacteristic =
        Functions.FanCharacteristics.baseFlow
        "Head vs. q_flow characteristic at nominal speed and density" annotation (
         Dialog(group="Characteristics"), choicesAllMatching=true);
      parameter Boolean usePowerCharacteristic=false
        "Use powerCharacteristic (vs. efficiencyCharacteristic)"
        annotation (Dialog(group="Characteristics"));
      replaceable function powerCharacteristic =
          Functions.FanCharacteristics.constantPower constrainedby
        Functions.FanCharacteristics.basePower
        "Power consumption vs. q_flow at nominal speed and density" annotation (
          Dialog(group="Characteristics", enable=usePowerCharacteristic),
          choicesAllMatching=true);
      replaceable function efficiencyCharacteristic =
          Functions.FanCharacteristics.constantEfficiency (eta_nom=0.8)
        constrainedby Functions.PumpCharacteristics.baseEfficiency
        "Efficiency vs. q_flow at nominal speed and density" annotation (Dialog(
            group="Characteristics", enable=not usePowerCharacteristic),
          choicesAllMatching=true);
      parameter Integer Np0(min=1) = 1 "Nominal number of fans in parallel";
      parameter Real bladePos0=1 "Nominal blade position";
      parameter Medium.Density rho0=1.229 "Nominal Gas Density"
        annotation (Dialog(group="Characteristics"));
      parameter NonSI.AngularVelocity_rpm n0=1500 "Nominal rotational speed"
        annotation (Dialog(group="Characteristics"));
      parameter SI.Volume V=0 "Fan Internal Volume" annotation (Evaluate=true);
      parameter Boolean CheckValve=false "Reverse flow stopped";
      parameter Boolean allowFlowReversal=system.allowFlowReversal
        "= true to allow flow reversal, false restricts to design direction";
      outer ThermoPower.System system "System wide properties";
      parameter SI.VolumeFlowRate q_single_start=q_single0
        "Volume Flow Rate Start Value (single pump)"
        annotation (Dialog(tab="Initialisation"));
      parameter Medium.SpecificEnthalpy hstart=1e5
        "Fluid Specific Enthalpy Start Value"
        annotation (Dialog(tab="Initialisation"));
      parameter Medium.Density rho_start=rho0 "Inlet Density start value"
        annotation (Dialog(tab="Initialisation"));
      parameter Choices.Init.Options initOpt=system.initOpt
        "Initialisation option" annotation (Dialog(tab="Initialisation"));
      parameter Medium.MassFlowRate w0 "Nominal mass flow rate"
        annotation (Dialog(group="Characteristics"));
      parameter SI.Pressure dp0 "Nominal pressure increase"
        annotation (Dialog(group="Characteristics"));
      final parameter SI.VolumeFlowRate q_single0=w0/(Np0*rho0)
        "Nominal volume flow rate (single pump)";
      final parameter SI.SpecificEnergy H0=dp0/(rho0) "Nominal specific energy";
    protected
      function dH_dqflow
        "Approximated partial derivative of flow characteristic w.r.t. flow"
        input SI.VolumeFlowRate q_flow;
        output Real dH;
      algorithm
        dH := (flowCharacteristic(1.05*q_flow) -
              flowCharacteristic(0.95*q_flow)) / 0.1;
      annotation(Inline = true);
      end dH_dqflow;
    public
      Medium.MassFlowRate w_single(start=q_single_start*rho_start)
        "Mass flow rate (single fan)";
      Medium.MassFlowRate w=Np*w_single "Mass flow rate (total)";
      SI.VolumeFlowRate q_single "Volume flow rate (single fan)";
      SI.VolumeFlowRate q=Np*q_single "Volume flow rate (totale)";
      SI.Pressure dp "Outlet pressure minus inlet pressure";
      SI.SpecificEnergy H "Specific energy";
      Medium.SpecificEnthalpy h(start=hstart) "Fluid specific enthalpy";
      Medium.SpecificEnthalpy hin(start=hstart) "Enthalpy of entering fluid";
      Medium.SpecificEnthalpy hout(start=hstart) "Enthalpy of outgoing fluid";
      Units.LiquidDensity rho "Gas density";
      Medium.Temperature Tin "Gas inlet temperature";
      NonSI.AngularVelocity_rpm n "Shaft r.p.m.";
      Real bladePos "Blade position";
      Integer Np(min=1) "Number of fans in parallel";
      SI.Power W_single "Power Consumption (single fan)";
      SI.Power W=Np*W_single "Power Consumption (total)";
      constant SI.Power W_eps=1e-8
        "Small coefficient to avoid numerical singularities";
      constant NonSI.AngularVelocity_rpm n_eps=1e-6;
      SI.PerUnit eta "Fan efficiency";
      Real s "Auxiliary Variable";
      FlangeA infl(
        h_outflow(start=hstart),
        redeclare package Medium = Medium,
        m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
        annotation (Placement(transformation(extent={{-100,2},{-60,42}}, rotation=
               0)));
      FlangeB outfl(
        h_outflow(start=hstart),
        redeclare package Medium = Medium,
        m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0))
        annotation (Placement(transformation(extent={{40,52},{80,92}}, rotation=0)));
      Modelica.Blocks.Interfaces.IntegerInput in_Np "Number of  parallel pumps"
        annotation (Placement(transformation(
            origin={28,80},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Modelica.Blocks.Interfaces.RealInput in_bladePos annotation (Placement(
            transformation(
            origin={-40,76},
            extent={{-10,-10},{10,10}},
            rotation=270)));
    equation
      // Number of fans in parallel
      Np = in_Np;
      if cardinality(in_Np) == 0 then
        in_Np = Np0 "Number of fans selected by parameter";
      end if;

      // Blade position
      bladePos = in_bladePos;
      if cardinality(in_bladePos) == 0 then
        in_bladePos = bladePos0 "Blade position selected by parameter";
      end if;

      // Fluid properties (always uses the properties upstream of the inlet flange)
      inletFluid.p = infl.p;
      inletFluid.h = inStream(infl.h_outflow);
      rho = inletFluid.d;
      Tin = inletFluid.T;

      // Flow equations
      q_single = w_single/homotopy(rho, rho0);
      H = dp/(homotopy(rho, rho0));
      if noEvent(s > 0 or (not CheckValve)) then
        // Flow characteristics when check valve is open
        q_single = s;
        H = homotopy(
          (n/n0)^2*flowCharacteristic(q_single*n0/(n + n_eps), bladePos),
          dH_dqflow(q_single0)*(q_single - q_single0) +
           (2/n0*flowCharacteristic(q_single0) -
            q_single0/n0*dH_dqflow(q_single0))*(n-n0) + H0);
      else
        // Flow characteristics when check valve is closed
        H = homotopy((n/n0)^2*flowCharacteristic(0) - s,
          dH_dqflow(q_single0)*(q_single - q_single0) +
           (2/n0*flowCharacteristic(q_single0) -
            q_single0/n0*dH_dqflow(q_single0))*(n - n0) + H0);
        q_single = 0;
      end if;

      /*
  // Flow equations
  q_single = w_single/rho;
  if noEvent(s > 0 or (not CheckValve)) then
    // Flow characteristics when check valve is open
    q_single = s;
    H = (n/n0)^2*flowCharacteristic(q_single*n0/(n+n_eps),bladePos);
  else
    // Flow characteristics when check valve is closed
    H = (n/n0)^2*flowCharacteristic(0) - s;
    q_single = 0;
  end if;
*/

      // Power consumption
      if usePowerCharacteristic then
        W_single = (n/n0)^3*(rho/rho0)*powerCharacteristic(q_single*n0/(n + n_eps),
          bladePos) "Power consumption (single fan)";
        eta = (dp*q_single)/(W_single + W_eps) "Hydraulic efficiency";
      else
        eta = efficiencyCharacteristic(q_single*n0/(n + n_eps), bladePos);
        W_single = dp*q_single/eta;
      end if;

      // Boundary conditions
      dp = outfl.p - infl.p;
      w = infl.m_flow "Fan total flow rate";
      hin = homotopy(if not allowFlowReversal then inStream(infl.h_outflow) else
        if w >= 0 then inStream(infl.h_outflow) else h, inStream(infl.h_outflow));
      hout = homotopy(if not allowFlowReversal then h else if w >= 0 then h else
        inStream(outfl.h_outflow), h);

      // Mass balance
      infl.m_flow + outfl.m_flow = 0 "Mass balance";

      // Energy balance
      if V > 0 then
        (rho*V*der(h)) = (outfl.m_flow/Np)*hout + (infl.m_flow/Np)*hin + W_single
          "Dynamic energy balance (single fan)";
        outfl.h_outflow = h;
        infl.h_outflow = h;
      else
        outfl.h_outflow = inStream(infl.h_outflow) + W_single/w
          "Energy balance for w > 0";
        infl.h_outflow = inStream(outfl.h_outflow) + W_single/w
          "Energy balance for w < 0";
        h = homotopy(if not allowFlowReversal then outfl.h_outflow else if w >= 0
           then outfl.h_outflow else infl.h_outflow, outfl.h_outflow)
          "Definition of h";
      end if;

    initial equation
      if initOpt == Choices.Init.Options.noInit then
        // do nothing
     elseif initOpt == Choices.Init.Options.fixedState then
       if V > 0 then
         h = hstart;
       end if;
     elseif initOpt == Choices.Init.Options.steadyState then
        if V > 0 then
          der(h) = 0;
        end if;
      else
        assert(false, "Unsupported initialisation option");
      end if;

      annotation (
        Icon(graphics),
        Diagram(graphics),
        Documentation(info="<HTML>
<p>This is the base model for the <tt>FanMech</tt> fan model.
<p>The model describes a fan, or a group of <tt>Np</tt> identical fans, with optional blade angle regulation. The fan model is based on the theory of kinematic similarity: the fan characteristics are given for nominal operating conditions (rotational speed and fluid density), and then adapted to actual operating condition, according to the similarity equations.
<p>In order to avoid singularities in the computation of the outlet enthalpy at zero flowrate, the thermal capacity of the fluid inside the fan body can be taken into account.
<p>The model can either support reverse flow conditions or include a built-in check valve to avoid flow reversal.
<p><b>Modelling options</b></p>
<p> The nominal flow characteristic (specific energy vs. volume flow rate) is given by the the replaceable function <tt>flowCharacteristic</tt>. If the blade angles are fixed, it is possible to use implementations which ignore the <tt>bladePos</tt> input.
<p> The fan energy balance can be specified in two alternative ways:
<ul>
<li><tt>usePowerCharacteristic = false</tt> (default option): the replaceable function <tt>efficiencyCharacteristic</tt> (efficiency vs. volume flow rate in nominal conditions) is used to determine the efficiency, and then the power consumption. The default is a constant efficiency of 0.8.
<li><tt>usePowerCharacteristic = true</tt>: the replaceable function <tt>powerCharacteristic</tt> (power consumption vs. volume flow rate in nominal conditions) is used to determine the power consumption, and then the efficiency.
</ul>
<p>
Several functions are provided in the package <tt>Functions.FanCharacteristics</tt> to specify the characteristics as a function of some operating points at nominal conditions.
<p>Depending on the value of the <tt>checkValve</tt> parameter, the model either supports reverse flow conditions, or includes a built-in check valve to avoid flow reversal.
<p>If the <tt>in_Np</tt> input connector is wired, it provides the number of fans in parallel; otherwise,  <tt>Np0</tt> parallel fans are assumed.</p>
<p>It is possible to take into account the heat capacity of the fluid inside the fan by specifying its volume <tt>V</tt> at nominal conditions; this is necessary to avoid singularities in the computation of the outlet enthalpy in case of zero flow rate. If zero flow rate conditions are always avoided, this dynamic effect can be neglected by leaving the default value <tt>V = 0</tt>, thus avoiding a fast state variable in the model.
<p>The <tt>CheckValve</tt> parameter determines whether the fan has a built-in check valve or not.
</HTML>",   revisions="<html>
<ul>
<li><i>10 Nov 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
      Adapted from the <tt>Water.PumpBase</tt> model.</li>
</ul>
</html>"));
    end FanBase;
  end BaseClasses;

  model SourceP "Pressure source for gas flows"
    extends Modelica.Icons.ObsoleteModel;
    extends Icons.Gas.SourceP;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    Medium.BaseProperties gas(
      p(start=p0),
      T(start=T),
      Xi(start=Xnom[1:Medium.nXi]));
    parameter Medium.AbsolutePressure p0=101325 "Nominal pressure";
    parameter Units.HydraulicResistance R=0 "Hydraulic resistance";
    parameter Medium.Temperature T=300 "Nominal temperature";
    parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
      "Nominal gas composition";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";

    FlangeB flange(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_p annotation (Placement(
          transformation(
          origin={-60,64},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_T annotation (Placement(
          transformation(
          origin={0,90},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] annotation (Placement(
          transformation(
          origin={60,62},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation
    if R == 0 then
      flange.p = gas.p;
    else
      flange.p = gas.p + flange.m_flow*R;
    end if;

    gas.p = in_p;
    if cardinality(in_p) == 0 then
      in_p = p0 "Pressure set by parameter";
    end if;

    gas.T = in_T;
    if cardinality(in_T) == 0 then
      in_T = T "Temperature set by parameter";
    end if;

    gas.Xi = in_X[1:Medium.nXi];
    if cardinality(in_X) == 0 then
      in_X = Xnom "Composition set by parameter";
    end if;

    flange.h_outflow = gas.h;
    flange.Xi_outflow = gas.Xi;

    annotation (
      Icon(graphics),
      Diagram(graphics),
      Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package.In the case of multiple componet, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>, whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>R</tt> is set to zero, the pressure source is ideal; otherwise, the outlet pressure decreases proportionally to the outgoing flowrate.</p>
<p>If the <tt>in_p</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>p0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>p0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li> <br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end SourceP;

  model SinkP "Pressure sink for gas flows"
    extends Modelica.Icons.ObsoleteModel;
    extends Icons.Gas.SourceP;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    Medium.BaseProperties gas(
      p(start=p0),
      T(start=T),
      Xi(start=Xnom[1:Medium.nXi]));
    parameter Medium.AbsolutePressure p0=101325 "Nominal pressure";
    parameter Medium.Temperature T=300 "Nominal temperature";
    parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
      "Nominal gas composition";
    parameter Units.HydraulicResistance R=0 "Hydraulic Resistance";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";

    FlangeA flange(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_p annotation (Placement(
          transformation(
          origin={-64.5,59.5},
          extent={{-12.5,-12.5},{12.5,12.5}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_T annotation (Placement(
          transformation(
          origin={0,90},
          extent={{-10,-12},{10,12}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] annotation (Placement(
          transformation(
          origin={66,59},
          extent={{-13,-14},{13,14}},
          rotation=270)));
  equation
    if R == 0 then
      flange.p = gas.p;
    else
      flange.p = gas.p + flange.m_flow*R;
    end if;

    gas.p = in_p;
    if cardinality(in_p) == 0 then
      in_p = p0 "Pressure set by parameter";
    end if;

    gas.T = in_T;
    if cardinality(in_T) == 0 then
      in_T = T "Temperature set by parameter";
    end if;

    gas.Xi = in_X[1:Medium.nXi];
    if cardinality(in_X) == 0 then
      in_X = Xnom "Composition set by parameter";
    end if;

    flange.h_outflow = gas.h;
    flange.Xi_outflow = gas.Xi;

    annotation (Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>, whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>R</tt> is set to zero, the pressure sink is ideal; otherwise, the inlet pressure increases proportionally to the outgoing flowrate.</p>
<p>If the <tt>in_p</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>p0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>p0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li>
<br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end SinkP;

  model SourceW "Flowrate source for gas flows"
    extends Modelica.Icons.ObsoleteModel;
    extends Icons.Gas.SourceW;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    Medium.BaseProperties gas(
      p(start=p0),
      T(start=T),
      Xi(start=Xnom[1:Medium.nXi]));
    parameter Medium.AbsolutePressure p0=101325 "Nominal pressure";
    parameter Medium.Temperature T=300 "Nominal temperature";
    parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
      "Nominal gas composition";
    parameter Medium.MassFlowRate w0=0 "Nominal mass flowrate";
    parameter Units.HydraulicConductance G=0 "HydraulicConductance";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";

    Medium.MassFlowRate w;

    FlangeB flange(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_w0 annotation (Placement(
          transformation(
          origin={-60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_T annotation (Placement(
          transformation(
          origin={0,50},
          extent={{10,-10},{-10,10}},
          rotation=90)));
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] annotation (Placement(
          transformation(
          origin={60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation

    if G == 0 then
      flange.m_flow = -w;
    else
      flange.m_flow = -w + (flange.p - p0)*G;
    end if;

    w = in_w0;
    if cardinality(in_w0) == 0 then
      in_w0 = w0 "Flow rate set by parameter";
    end if;

    gas.T = in_T;
    if cardinality(in_T) == 0 then
      in_T = T "Temperature set by parameter";
    end if;

    gas.Xi = in_X[1:Medium.nXi];
    if cardinality(in_X) == 0 then
      in_X = Xnom "Composition set by parameter";
    end if;

    flange.p = gas.p;
    flange.h_outflow = gas.h;
    flange.Xi_outflow = gas.Xi;

    annotation (Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>,whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>G</tt> is set to zero, the flowrate source is ideal; otherwise, the outgoing flowrate decreases proportionally to the outlet pressure.</p>
<p>If the <tt>in_w0</tt> connector is wired, then the source massflowrate is given by the corresponding signal, otherwise it is fixed to <tt>w0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>w0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li> <br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"), Diagram(graphics));
  end SourceW;

  model SinkW "Flowrate sink for gas flows"
    extends Modelica.Icons.ObsoleteModel;
    extends Icons.Gas.SourceW;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    Medium.BaseProperties gas(
      p(start=p0),
      T(start=T),
      Xi(start=Xnom[1:Medium.nXi]));
    parameter Medium.AbsolutePressure p0=101325 "Nominal pressure";
    parameter Medium.Temperature T=300 "Nominal Temperature";
    parameter Medium.MassFraction Xnom[Medium.nX]=Medium.reference_X
      "Nominal gas composition";
    parameter Medium.MassFlowRate w0=0 "Nominal mass flowrate";
    parameter Units.HydraulicConductance G=0 "Hydraulic Conductance";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";

    Medium.MassFlowRate w;
    Modelica.Blocks.Interfaces.RealInput in_w0 annotation (Placement(
          transformation(
          origin={-60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_T annotation (Placement(
          transformation(
          origin={0,50},
          extent={{-10,10},{10,-10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] annotation (Placement(
          transformation(
          origin={60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    FlangeA flange(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
  equation
    if G == 0 then
      flange.m_flow = w;
    else
      flange.m_flow = w + (flange.p - p0)*G;
    end if;

    w = in_w0;
    if cardinality(in_w0) == 0 then
      in_w0 = w0 "Flow rate set by parameter";
    end if;

    gas.T = in_T;
    if cardinality(in_T) == 0 then
      in_T = T "Temperature set by parameter";
    end if;

    gas.Xi = in_X[1:Medium.nXi];
    if cardinality(in_X) == 0 then
      in_X = Xnom "Composition set by parameter";
    end if;

    flange.p = gas.p;
    flange.h_outflow = gas.h;
    flange.Xi_outflow = gas.Xi;

    annotation (
      Icon(graphics),
      Diagram(graphics),
      Documentation(info="<html>
<p>The actual gas used in the component is determined by the replaceable <tt>GasModel</tt> model. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>, whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>G</tt> is set to zero, the flowrate source is ideal; otherwise, the incoming flowrate increases proportionally to the outlet pressure.</p>
<p>If the <tt>in_w0</tt> connector is wired, then the source massflowrate is given by the corresponding signal, otherwise it is fixed to <tt>w0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>w0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li> <br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end SinkW;

  model ThroughW "Prescribes the flow rate across the component"
    extends Modelica.Icons.ObsoleteModel;
    extends Icons.Gas.SourceW;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    parameter Medium.MassFlowRate w0=0 "Nominal mass flowrate";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";

    FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if
            allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_w0 annotation (Placement(
          transformation(
          origin={-60,50},
          extent={{-10,-10},{10,10}},
          rotation=270)));

    Medium.MassFlowRate w "Mass flow rate";

  equation
    inlet.m_flow + outlet.m_flow = 0 "Mass balance";
    inlet.m_flow = w "Flow characteristics";

    w = in_w0;
    if cardinality(in_w0) == 0 then
      in_w0 = w0 "Flow rate set by parameter";
    end if;

    // Energy and partial mass balance
    inlet.h_outflow = inStream(outlet.h_outflow);
    inStream(inlet.h_outflow) = outlet.h_outflow;
    inlet.Xi_outflow = inStream(outlet.Xi_outflow);
    inStream(inlet.Xi_outflow) = outlet.Xi_outflow;

    annotation (Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>,whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>G</tt> is set to zero, the flowrate source is ideal; otherwise, the outgoing flowrate decreases proportionally to the outlet pressure.</p>
<p>If the <tt>in_w0</tt> connector is wired, then the source massflowrate is given by the corresponding signal, otherwise it is fixed to <tt>w0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>w0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li> <br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"), Diagram(graphics));
  end ThroughW;

  model Flow1D "1-dimensional fluid flow model for gas (finite volumes)"
    extends Modelica.Icons.ObsoleteModel;
    extends Icons.Gas.Tube;
    import ThermoPower.Choices.Flow1D.FFtypes;
    import ThermoPower.Choices.Flow1D.HCtypes;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    parameter Integer N(min=2) = 2 "Number of nodes for thermal variables";
    parameter Integer Nt=1 "Number of tubes in parallel";
    parameter SI.Distance L "Tube length";
    parameter SI.Position H=0 "Elevation of outlet over inlet";
    parameter SI.Area A "Cross-sectional area (single tube)";
    parameter SI.Length omega
      "Perimeter of heat transfer surface (single tube)";
    parameter SI.Length Dhyd "Hydraulic Diameter (single tube)";
    parameter Medium.MassFlowRate wnom "Nominal mass flowrate (total)";
    parameter FFtypes FFtype "Friction Factor Type";
    parameter Real Kfnom=0 "Nominal hydraulic resistance coefficient";
    parameter Medium.AbsolutePressure dpnom=0 "Nominal pressure drop";
    parameter Medium.Density rhonom=0 "Nominal inlet density";
    parameter SI.PerUnit Cfnom=0 "Nominal Fanning friction factor";
    parameter SI.PerUnit e=0 "Relative roughness (ratio roughness/diameter)";
    parameter Boolean DynamicMomentum=false "Inertial phenomena accounted for"
      annotation (Evaluate=true);
    parameter Boolean UniformComposition=true
      "Uniform gas composition is assumed" annotation (Evaluate=true);
    parameter Boolean QuasiStatic=false
      "Quasi-static model (mass, energy and momentum static balances"
      annotation (Evaluate=true);
    parameter HCtypes HydraulicCapacitance=HCtypes.Downstream
      "1: Upstream, 2: Downstream";
    parameter Boolean avoidInletEnthalpyDerivative=true
      "Avoid inlet enthalpy derivative";
    parameter Boolean allowFlowReversal=system.allowFlowReversal
      "= true to allow flow reversal, false restricts to design direction";
    outer ThermoPower.System system "System wide properties";
    parameter Medium.AbsolutePressure pstart=1e5 "Pressure start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tstartbar=300
      "Avarage temperature start value"
      annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tstartin=Tstartbar
      "Inlet temperature start value" annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tstartout=Tstartbar
      "Outlet temperature start value" annotation (Dialog(tab="Initialisation"));
    parameter Medium.Temperature Tstart[N]=linspace(
          Tstartin,
          Tstartout,
          N) "Start value of temperature vector (initialized by default)"
      annotation (Dialog(tab="Initialisation"));
    final parameter SI.Velocity unom=10
      "Nominal velocity for simplified equation";
    parameter SI.PerUnit wnf=0.01
      "Fraction of nominal flow rate at which linear friction equals turbulent friction";
    parameter SI.PerUnit Kfc=1 "Friction factor correction coefficient";
    parameter Medium.MassFraction Xstart[nX]=Medium.reference_X
      "Start gas composition" annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt=Choices.Init.Options.noInit
      "Initialisation option" annotation (Dialog(tab="Initialisation"));
    function squareReg = ThermoPower.Functions.squareReg;
  protected
    parameter Integer nXi=Medium.nXi "number of independent mass fractions";
    parameter Integer nX=Medium.nX "total number of mass fractions";
    constant SI.Acceleration g=Modelica.Constants.g_n;
  public
    FlangeA infl(redeclare package Medium = Medium, m_flow(start=wnom, min=if
            allowFlowReversal then -Modelica.Constants.inf else 0)) annotation (
       Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    FlangeB outfl(redeclare package Medium = Medium, m_flow(start=-wnom, max=
            if allowFlowReversal then +Modelica.Constants.inf else 0))
      annotation (Placement(transformation(extent={{80,-20},{120,20}}, rotation=
             0)));
    replaceable Thermal.DHT wall(N=N) annotation (Dialog(enable=false),
        Placement(transformation(extent={{-60,40},{60,60}}, rotation=0)));
  public
    Medium.BaseProperties gas[N] "Gas nodal properties";
    // Xi(start=fill(Xstart[1:nXi],N)),
    // X(start=fill(Xstart,N)),
    SI.Pressure Dpfric "Pressure drop due to friction";
    SI.Length omega_hyd "Wet perimeter (single tube)";
    Real Kf "Friction factor";
    Real Kfl "Linear friction factor";
    Real dwdt "Time derivative of mass flow rate";
    SI.PerUnit Cf "Fanning friction factor";
    Medium.MassFlowRate w(start=wnom/Nt) "Mass flowrate (single tube)";
    Medium.Temperature Ttilde[N - 1](
      start=ones(N - 1)*Tstartin + (1:(N - 1))/(N - 1)*(Tstartout - Tstartin),
      each stateSelect=StateSelect.prefer) "Temperature state variables";
    Medium.Temperature Tin(start=Tstartin);
    Medium.MassFraction Xtilde[if UniformComposition or Medium.fixedX then 1 else N - 1, nX](
        start=ones(size(Xtilde, 1), size(Xtilde, 2))*diagonal(Xstart[1:nX]),
        each stateSelect=StateSelect.prefer) "Composition state variables";
    Medium.MassFlowRate wbar[N - 1](each start=wnom/Nt);
    SI.Velocity u[N] "Fluid velocity";
    Medium.AbsolutePressure p(start=pstart, stateSelect=StateSelect.prefer);
    SI.Time Tr "Residence time";
    SI.Mass M "Gas Mass";
    SI.Power Q "Total heat flow through the wall (all Nt tubes)";
  protected
    parameter SI.PerUnit dzdx=H/L "Slope";
    parameter SI.Length l=L/(N - 1) "Length of a single volume";
    Medium.Density rhobar[N - 1] "Fluid average density";
    SI.SpecificVolume vbar[N - 1] "Fluid average specific volume";
    SI.HeatFlux phibar[N - 1] "Average heat flux";
    Medium.DerDensityByPressure drbdp[N - 1]
      "Derivative of average density by pressure";
    Medium.DerDensityByTemperature drbdT1[N - 1]
      "Derivative of average density by left temperature";
    Medium.DerDensityByTemperature drbdT2[N - 1]
      "Derivative of average density by right temperature";
    Real drbdX1[N - 1, nX](each unit="kg/m3")
      "Derivative of average density by left composition";
    Real drbdX2[N - 1, nX](each unit="kg/m3")
      "Derivative of average density by right composition";
    Medium.SpecificHeatCapacity cvbar[N - 1] "Average cv";
    Real dMdt[N - 1] "Derivative of mass in a finite volume";
    Medium.SpecificHeatCapacity cv[N];
    Medium.DerDensityByTemperature dddT[N]
      "Derivative of density by temperature";
    Medium.DerDensityByPressure dddp[N] "Derivative of density by pressure";
    Real dddX[N, nX](each unit="kg/m3") "Derivative of density by composition";
  equation
    assert(FFtype == FFtypes.NoFriction or dpnom > 0,
      "dpnom=0 not supported, it is also used in the homotopy trasformation during the inizialization");
    //All equations are referred to a single tube
    // Friction factor selection
    omega_hyd = 4*A/Dhyd;
    if FFtype == FFtypes.Kfnom then
      Kf = Kfnom*Kfc;
      Cf = 2*Kf*A^3/(omega_hyd*L);
    elseif FFtype == FFtypes.OpPoint then
      Kf = dpnom*rhonom/(wnom/Nt)^2*Kfc;
      Cf = 2*Kf*A^3/(omega_hyd*L);
    elseif FFtype == FFtypes.Cfnom then
      Kf = Cfnom*omega_hyd*L/(2*A^3)*Kfc;
      Cf = Cfnom*Kfc;
    elseif FFtype == FFtypes.Colebrook then
      Cf = f_colebrook(
          w,
          Dhyd/A,
          e,
          Medium.dynamicViscosity(gas[integer(N/2)].state))*Kfc;
      Kf = Cf*omega_hyd*L/(2*A^3);
    elseif FFtype == FFtypes.NoFriction then
      Cf = 0;
      Kf = 0;
    end if;
    assert(Kf >= 0, "Negative friction coefficient");
    Kfl = wnom/Nt*wnf*Kf "Linear friction factor";

    // Dynamic momentum term
    dwdt = if DynamicMomentum and not QuasiStatic then der(w) else 0;

    sum(dMdt) = (infl.m_flow + outfl.m_flow)/Nt "Mass balance";
    L/A*dwdt + (outfl.p - infl.p) + Dpfric = 0 "Momentum balance";
    Dpfric = (if FFtype == FFtypes.NoFriction then 0 else homotopy((smooth(1,
      Kf*squareReg(w, wnom/Nt*wnf))*sum(vbar)/(N - 1)), dpnom/(wnom/Nt)*w))
      "Pressure drop due to friction";
    for j in 1:N - 1 loop
      if not QuasiStatic then
        // Dynamic mass and energy balances
        A*l*rhobar[j]*cvbar[j]*der(Ttilde[j]) + wbar[j]*(gas[j + 1].h - gas[j].h)
          = l*omega*phibar[j] "Energy balance";
        dMdt[j] = A*l*(drbdp[j]*der(p) + drbdT1[j]*der(gas[j].T) + drbdT2[j]*
          der(gas[j + 1].T) + vector(drbdX1[j, :])*vector(der(gas[j].X)) +
          vector(drbdX2[j, :])*vector(der(gas[j + 1].X))) "Mass balance";
        /*
      dMdt[j] = A*l*(drbdT[j]*der(Ttilde[j]) + drbdp[j]*der(p) + vector(drbdX[j, :])*
      vector(der(Xtilde[if UniformComposition then 1 else j, :])))
      "Mass balance";
*/
        // Average volume quantities
        if avoidInletEnthalpyDerivative and j == 1 then
          // first volume properties computed by the volume outlet properties
          rhobar[j] = gas[j + 1].d;
          drbdp[j] = dddp[j + 1];
          drbdT1[j] = 0;
          drbdT2[j] = dddT[j + 1];
          drbdX1[j, :] = zeros(size(Xtilde, 2));
          drbdX2[j, :] = dddX[j + 1, :];
        else
          // volume properties computed by averaging
          rhobar[j] = (gas[j].d + gas[j + 1].d)/2;
          drbdp[j] = (dddp[j] + dddp[j + 1])/2;
          drbdT1[j] = dddT[j]/2;
          drbdT2[j] = dddT[j + 1]/2;
          drbdX1[j, :] = dddX[j, :]/2;
          drbdX2[j, :] = dddX[j + 1, :]/2;
        end if;
        vbar[j] = 1/rhobar[j];
        wbar[j] = homotopy(infl.m_flow/Nt - sum(dMdt[1:j - 1]) - dMdt[j]/2,
          wnom/Nt);
        cvbar[j] = (cv[j] + cv[j + 1])/2;
      else
        // Static mass and energy balances
        wbar[j]*(gas[j + 1].h - gas[j].h) = l*omega*phibar[j] "Energy balance";
        dMdt[j] = 0 "Mass balance";
        // Dummy values for unused average quantities
        rhobar[j] = 0;
        drbdp[j] = 0;
        drbdT1[j] = 0;
        drbdT2[j] = 0;
        drbdX1[j, :] = zeros(nX);
        drbdX2[j, :] = zeros(nX);
        vbar[j] = 0;
        wbar[j] = infl.m_flow/Nt;
        cvbar[j] = 0;
      end if;
    end for;
    Q = Nt*l*omega*sum(phibar) "Total heat flow through the lateral boundary";
    if Medium.fixedX then
      Xtilde = fill(Medium.reference_X, 1);
    elseif QuasiStatic then
      Xtilde = fill(gas[1].X, size(Xtilde, 1))
        "Gas composition equal to actual inlet";
    elseif UniformComposition then
      der(Xtilde[1, :]) = homotopy(1/L*sum(u)/N*(gas[1].X - gas[N].X), 1/L*unom
        *(gas[1].X - gas[N].X)) "Partial mass balance for the whole pipe";
    else
      for j in 1:N - 1 loop
        der(Xtilde[j, :]) = homotopy((u[j + 1] + u[j])/(2*l)*(gas[j].X - gas[j
           + 1].X), 1/L*unom*(gas[j].X - gas[j + 1].X))
          "Partial mass balance for single volume";
      end for;
    end if;
    for j in 1:N loop
      u[j] = w/(gas[j].d*A) "Gas velocity";
      gas[j].p = p;
    end for;
    // Fluid property computations
    for j in 1:N loop
      if not QuasiStatic then
        cv[j] = Medium.heatCapacity_cv(gas[j].state);
        dddT[j] = Medium.density_derT_p(gas[j].state);
        dddp[j] = Medium.density_derp_T(gas[j].state);
        if nX > 0 then
          dddX[j, :] = Medium.density_derX(gas[j].state);
        end if;
      else
        // Dummy values (not needed by dynamic equations)
        cv[j] = 0;
        dddT[j] = 0;
        dddp[j] = 0;
        dddX[j, :] = zeros(nX);
      end if;
    end for;

    // Selection of representative pressure and flow rate variables
    if HydraulicCapacitance == HCtypes.Upstream then
      p = infl.p;
      w = -outfl.m_flow/Nt;
    else
      p = outfl.p;
      w = infl.m_flow/Nt;
    end if;

    // Boundary conditions
    infl.h_outflow = gas[1].h;
    outfl.h_outflow = gas[N].h;
    infl.Xi_outflow = gas[1].Xi;
    outfl.Xi_outflow = gas[N].Xi;

    gas[1].h = inStream(infl.h_outflow);
    gas[2:N].T = Ttilde;
    gas[1].Xi = inStream(infl.Xi_outflow);
    for j in 2:N loop
      gas[j].Xi = Xtilde[if UniformComposition then 1 else j - 1, 1:nXi];
    end for;
    /*
  if w >= 0 then
    gas[1].h = infl.hBA;
    gas[2:N].T = Ttilde;
    gas[1].Xi = infl.XBA;
    for j in 2:N loop
      gas[j].Xi = Xtilde[if UniformComposition then 1 else j - 1, 1:nXi];
    end for;
  else
    gas[N].h = outfl.hAB;
    gas[1:N - 1].T = Ttilde;
    gas[N].Xi = outfl.XAB;
    for j in 1:N - 1 loop
      gas[j].Xi = Xtilde[if UniformComposition then 1 else j, 1:nXi];
    end for;
  end if;
*/

    gas.T = wall.T;
    Tin = gas[1].T;
    phibar = (wall.phi[1:N - 1] + wall.phi[2:N])/2;

    M = sum(rhobar)*A*l "Total gas mass";
    Tr = noEvent(M/max(infl.m_flow/Nt, Modelica.Constants.eps))
      "Residence time";
  initial equation
    if initOpt == Choices.Init.Options.noInit or QuasiStatic then
      // do nothing
    elseif initOpt == Choices.Init.Options.steadyState then
      if (not Medium.singleState) then
        der(p) = 0;
      end if;
      der(Ttilde) = zeros(N - 1);
      if (not Medium.fixedX) then
        der(Xtilde) = zeros(size(Xtilde, 1), size(Xtilde, 2));
      end if;
    elseif initOpt == Choices.Init.Options.steadyStateNoP then
      der(Ttilde) = zeros(N - 1);
      if (not Medium.fixedX) then
        der(Xtilde) = zeros(size(Xtilde, 1), size(Xtilde, 2));
      end if;
    else
      assert(false, "Unsupported initialisation option");
    end if;

    annotation (
      Icon(graphics={Text(extent={{-100,-40},{100,-80}}, textString="%name")}),
      Diagram(graphics),
      Documentation(info="<html>
<p>This model describes the flow of a gas in a rigid tube. The basic modelling assumptions are:
<ul>
<li>Uniform velocity is assumed on the cross section, leading to a 1-D distributed parameter model.
<li>Turbulent friction is always assumed; a small linear term is added to avoid numerical singularities at zero flowrate. The friction effects are not accurately computed in the laminar and transitional flow regimes, which however should not be an issue in most power generation applications.
<li>The model is based on dynamic mass, momentum, and energy balances. The dynamic momentum term can be switched off, to avoid the fast oscillations that can arise from its coupling with the mass balance (sound wave dynamics).
<li>The longitudinal heat diffusion term is neglected.
<li>The energy balance equation is written by assuming a uniform pressure distribution; the pressure drop is lumped either at the inlet or at the outlet.
<li>The fluid flow can exchange thermal power through the lateral surface, which is represented by the <tt>wall</tt> connector. The actual heat flux must be computed by a connected component (heat transfer computation module).
</ul>
<p>The mass, momentum and energy balance equation are discretised with the finite volume method. The state variables are one pressure, one flowrate (optional), N-1 temperatures, and either one or N-1 gas composition vectors.
<p>The turbulent friction factor can be either assumed as a constant, or computed by Colebrook's equation. In the former case, the friction factor can be supplied directly, or given implicitly by a specified operating point. In any case, the multiplicative correction coefficient <tt>Kfc</tt> can be used to modify the friction coefficient, e.g. to fit experimental data.
<p>A small linear pressure drop is added to avoid numerical singularities at low or zero flowrate. The <tt>wnom</tt> parameter must be always specified: the additional linear pressure drop is such that it is equal to the turbulent pressure drop when the flowrate is equal to <tt>wnf*wnom</tt> (the default value is 1% of the nominal flowrate). Increase <tt>wnf</tt> if numerical problems occur in tubes with very low pressure drops.
<p>Flow reversal is fully supported.
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package.In the case of multiple component, variable composition gases, the start composition is given by <tt>Xstart</tt>, whose default value is <tt>Medium.reference_X</tt>.
<p>Thermal variables (enthalpy, temperature, density) are computed in <tt>N</tt> equally spaced nodes, including the inlet (node 1) and the outlet (node N); <tt>N</tt> must be greater than or equal to 2.
<p>if <tt>UniformComposition</tt> is true, then a uniform compostion is assumed for the gas through the entire tube length; otherwise, the gas compostion is computed in <tt>N</tt> equally spaced nodes, as in the case of thermal variables.
<p>The following options are available to specify the friction coefficient:
<ul><li><tt>FFtype = FFtypes.Kfnom</tt>: the hydraulic friction coefficient <tt>Kf</tt> is set directly to <tt>Kfnom</tt>.
<li><tt>FFtype = FFtypes.OpPoint</tt>: the hydraulic friction coefficient is specified by a nominal operating point (<tt>wnom</tt>,<tt>dpnom</tt>, <tt>rhonom</tt>).
<li><tt>FFtype = FFtypes.Cfnom</tt>: the friction coefficient is computed by giving the (constant) value of the Fanning friction factor <tt>Cfnom</tt>.
<li><tt>FFtype = FFtypes.Colebrook</tt>: the Fanning friction factor is computed by Colebrook's equation (assuming Re > 2100, e.g. turbulent flow).
<li><tt>FFtype = FFtypes.NoFriction</tt>: no friction is assumed across the pipe.</ul>
<p>If <tt>QuasiStatic</tt> is set to true, the dynamic terms are neglected in the mass, momentum, and energy balances, i.e., quasi-static behaviour is modelled. It is also possible to neglect only the dynamic momentum term by setting <tt>DynamicMomentum = false</tt>.
<p>If <tt>HydraulicCapacitance = 2</tt> (default option) then the mass buildup term depending on the pressure is lumped at the outlet, while the optional momentum buildup term depending on the flowrate is lumped at the inlet; therefore, the state variables are the outlet pressure and the inlet flowrate. If <tt>HydraulicCapacitance = 1</tt> the reverse takes place.
<p>Start values for the pressure and flowrate state variables are specified by <tt>pstart</tt>, <tt>wstart</tt>. The start values for the node temperatures are linearly distributed from <tt>Tstartin</tt> at the inlet to <tt>Tstartout</tt> at the outlet. The (uniform) start value of the gas composition is specified by <tt>Xstart</tt>.
<p>A bank of <tt>Nt</tt> identical tubes working in parallel can be modelled by setting <tt>Nt > 1</tt>. The geometric parameters always refer to a <i>single</i> tube.
<p>This models makes the temperature and external heat flow distributions available to connected components through the <tt>wall</tt> connector. If other variables (e.g. the heat transfer coefficient) are needed by external components to compute the actual heat flow, the <tt>wall</tt> connector can be replaced by an extended version of the <tt>DHT</tt> connector.
</html>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>24 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       <tt>QuasiStatic</tt> added.<br>
       <tt>FFtypes</tt> package and <tt>NoFriction</tt> option added.</li>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      DymolaStoredErrors);
  end Flow1D;
  annotation (Documentation(info="<HTML>
This package contains models of physical processes and components using ideal gases as working fluid.
<p>All models with dynamic equations provide initialisation support. Set the <tt>initOpt</tt> parameter to the appropriate value:
<ul>
<li><tt>Choices.Init.Options.noInit</tt>: no initialisation
<li><tt>Choices.Init.Options.steadyState</tt>: full steady-state initialisation
<li><tt>Choices.Init.Options.steadyStateNoP</tt>: steady-state initialisation (except pressure)
<li><tt>Choices.Init.Options.steadyStateNoT</tt>: steady-state initialisation (except temperature)
</ul>
The latter options can be useful when two or more components are connected directly so that they will have the same pressure or temperature, to avoid over-specified systems of initial equations.
</HTML>"));
end Gas;
