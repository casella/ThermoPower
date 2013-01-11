within ThermoPower;
package Old "Old models"
  model ValveLiq "Valve for liquid water flow"
    extends Icons.Water.Valve;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      "Medium model";
    Medium.BaseProperties fluid;
    parameter Integer CvData "(0: Av | 1: Kv | 2: Cv | 3: OpPoint)";
    parameter Area Avnom=0 "Av (metric) flow coefficient";
    parameter Real Kvnom=0 "Kv (metric) flow coefficient [m^3/h]";
    parameter Real Cvnom=0 "Cv (US) flow coefficient [USG/min]";
    parameter Pressure dpnom "Nominal pressure drop";
    parameter MassFlowRate wnom=0 "Nominal mass flowrate";
    parameter LiquidDensity rhonom=0 "Nominal inlet density";
    parameter Boolean CheckValve=false "Reverse flow stopped";
    parameter Boolean ChokedFlow=false "Supports choked flow computation";
    parameter Real Flnom=0.9 "Liquid pressure recovery factor";
    parameter Real b=0.01 "Regularisation factor";
    replaceable function FlowChar = Functions.linear "Flow characteristic";
    replaceable function Flfun = Functions.one
      "Pressure recovery characteristic";
    MassFlowRate w "Mass flowrate";
    Real Av;
    Real Ff;
    Real Fl;
    Real z "Normalized pressure drop";
    Real sqrtz;
    LiquidDensity rho "Inlet density";
    AbsoluteTemperature Tin;
    AbsolutePressure pv "Saturation pressure";
    ThermoPower.Water.FlangeAOld inlet annotation (Placement(transformation(
            extent={{-120,-20},{-80,20}}, rotation=0)));
    ThermoPower.Water.FlangeBOld outlet annotation (Placement(transformation(
            extent={{80,-20},{120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput theta annotation (Placement(
          transformation(
          origin={0,80},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    if CvData == 0 then
      Av = Avnom;
    elseif CvData == 1 then
      Av = 2.7778e-5*Kvnom;
    elseif CvData == 2 then
      Av = 2.4027e-5*Cvnom;
    elseif CvData == 3 then
      Av = wnom/sqrt(rhonom*dpnom);
    end if;
    inlet.w + outlet.w = 0;
    w = inlet.w;
    inlet.hAB = outlet.hAB;
    inlet.hBA = outlet.hBA;
    fluid.p = inlet.p;
    fluid.h = inlet.hBA;
    Tin = fluid.T;
    rho = fluid.d;
    if CheckValve then
      sqrtz = (if z >= 0 then z/sqrt(z + b) else 0);
    else
      sqrtz = noEvent(z/sqrt(abs(z) + b));
    end if;
    if not ChokedFlow then
      pv = 1e5;
      Ff = 1;
      Fl = 1;
      z = (inlet.p - outlet.p)/dpnom;
    else
      pv = ThermoFluid.BaseClasses.MediumModels.SteamIF97.satp(Tin);
      Ff = 0.96 - 0.28*sqrt(pv/221.1e5);
      Fl = Flnom*Flfun(theta);
      if outlet.p >= (1 - Fl^2)*inlet.p + Ff*Fl^2*pv then
        z = (inlet.p - outlet.p)/dpnom;
      else
        z = Fl^2*(inlet.p - Ff*pv)/dpnom;
      end if;
    end if;
    w = FlowChar(theta)*Av*sqrt(rho*dpnom)*sqrtz;

    annotation (
      Icon(graphics={Text(extent={{-100,-40},{100,-80}}, textString="%name")}),

      Diagram(graphics),
      Documentation(info="<HTML>
<p>This model is based on the IEC 534/ISA S.75 standards for valve sizing, incompressible fluid.
<p>The model optionally supports reverse flow conditions (assuming symmetrical behaviour) or check valve operation, and has been suitably modified to avoid numerical singularities at zero pressure drop. 
<p>The flow characteristic can be customised.
<p><b>Modelling options</b></p>
<p>The following options are available to specify the valve flow coefficient in fully open conditions:
<ul><li><tt>CvData = 0</tt>: the flow coefficient is given by the metric Av coefficient <tt>Avnom</tt> (m^2).
<li><tt>CvData = 1</tt>: the flow coefficient is given by the metric Kv coefficient <tt>Kvnom</tt> (m^3/h).
<li><tt>CvData = 2</tt>: the flow coefficient is given by the US Cv coefficient <tt>Cvnom</tt> (USG/min).
<li><tt>CvData = 3</tt>: the flow coefficient is given implicitly by the operating point (<tt>wnom</tt>,<tt>dpnom</tt>, <tt>rhonom<tt/>).
</ul>
<p>The nominal pressure drop <tt>dpnom</tt> must always be specified; to avoid numerical singularities, the flow characteristic is modified for pressure drops less than <tt>b * dpnom</tt> (the default value is 1% of the nominal pressure drop). Increase this parameter if numerical instabilities occur in valves with very low pressure drops.
<p>If <tt>CheckValve</tt> is true, then the flow is stopped when the outlet pressure is higher than the inlet pressure; otherwise, reverse flow takes place.
<p>If <tt>ChockedFlow</tt> is true, the model operating range is extended to include choked flow operation, which takes place for low outlet pressures due to flashing in the vena contracta; otherwise, non-choking conditions are assumed.
<p>The default flow characteristic <tt>FlowChar</tt> is linear; this can be replaced by any user-defined function (e.g. equal percentage, quick opening, etc.).
<p>The default liquid pressure recovery coefficient Fl is constant and given by the parameter <tt>Flnom</tt>. The recovery coefficient can be specified as a given function of the valve opening by customising the <tt>Flfun</tt> function.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end ValveLiq;

  model ValveVap "Valve for steam flow"
    extends Icons.Water.Valve;
    parameter Pressure dpnom "Nominal pressure drop";
    parameter Pressure pnom=0 "Nominal inlet pressure";
    parameter MassFlowRate wnom=0 "Nominal mass flowrate";
    parameter GasDensity rhonom=0 "Nominal inlet density";
    parameter Area Avnom=0 "Av (metric) flow coefficient";
    parameter Real Kvnom=0 "Kv (metric) flow coefficient [m^3/h]";
    parameter Real Cvnom=0 "Cv (US) flow coefficient [USG/min]";
    parameter Real b=0.01 "Regularisation factor";
    parameter Real Fxtnom=0.5 "Nominal Fk*xt critical ratio";
    parameter Integer CvData=0 "(0: Av | 1: Kv | 2: Cv | 3: OpPoint)";
    parameter Boolean CheckValve=false "Reverse flow stopped";
    replaceable function FlowChar = Functions.linear "Flow characteristic";
    replaceable function xtfun = Functions.one "Critical ratio characteristic";
    MassFlowRate w "Mass flowrate";
    Real Av;
    Real Fxt;
    Real x;
    Real xs;
    Real Y;
    Real z "Normalized x";
    Real sqrtz;
    GasDensity rho "Inlet density";
    ThermoPower.Water.FlangeAOld inlet annotation (Placement(transformation(
            extent={{-120,-20},{-80,20}}, rotation=0)));
    ThermoPower.Water.FlangeBOld outlet annotation (Placement(transformation(
            extent={{80,-20},{120,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput theta annotation (Placement(
          transformation(
          origin={0,80},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    if CvData == 0 then
      Av = Avnom;
    elseif CvData == 1 then
      Av = 2.7778e-5*Kvnom;
    elseif CvData == 2 then
      Av = 2.4027e-5*Cvnom;
    elseif CvData == 3 then
      Av = wnom/sqrt(rhonom*dpnom);
    end if;
    inlet.w + outlet.w = 0;
    w = inlet.w;
    inlet.hAB = outlet.hAB;
    inlet.hBA = outlet.hBA;
    rho = Water.dens_ph(inlet.p, inlet.hBA);
    Fxt = Fxtnom*xtfun(theta);
    x = (inlet.p - outlet.p)/inlet.p;
    xs = if x < -Fxt then -Fxt else if x > Fxt then Fxt else x;
    Y = 1 - abs(xs)/(3*Fxt);
    z = xs/(dpnom/pnom);
    if CheckValve then
      sqrtz = (if z >= 0 then z/sqrt(z + b) else 0);
    else
      sqrtz = noEvent(z/sqrt(abs(z) + b));
    end if;
    w = FlowChar(theta)*Av*Y*sqrt(dpnom/pnom*inlet.p*rho)*sqrtz;
    annotation (
      Icon(graphics={Text(extent={{-100,-40},{100,-80}}, textString="%name")}),

      Diagram(graphics),
      Documentation(info="<HTML>
<p>This model is based on the IEC 534/ISA S.75 standards for valve sizing, compressible fluid.
<p>The model optionally supports reverse flow conditions (assuming symmetrical behaviour) or check valve operation, and has been suitably modified to avoid numerical singularities at zero pressure drop. 
<p>The model operating range include choked flow operation, due to sonic conditions in the vena contracta. 
<p>The flow characteristic can be customised.
<p><b>Modelling options</b></p>
<p>The following options are available to specify the valve flow coefficient in fully open conditions:
<ul><li><tt>CvData = 0</tt>: the flow coefficient is given by the metric Av coefficient <tt>Avnom</tt> (m^2).
<li><tt>CvData = 1</tt>: the flow coefficient is given by the metric Kv coefficient <tt>Kvnom</tt> (m^3/h).
<li><tt>CvData = 2</tt>: the flow coefficient is given by the US Cv coefficient <tt>Cvnom</tt> (USG/min).
<li><tt>CvData = 3</tt>: the flow coefficient is given implicitly by the operating point (<tt>wnom</tt>,<tt>dpnom</tt>, <tt>rhonom<tt/>).
</ul>
<p>The nominal inlet pressure <tt>pnom</tt> and pressure drop <tt>dpnom</tt> must always be specified; to avoid numerical singularities, the flow characteristic is modified for pressure drops less than <tt>b*dpnom</tt> (the default value is 1% of the nominal pressure drop). Increase this parameter if numerical instabilities occur in valves with very low pressure drops.
<p>If <tt>CheckValve</tt> is true, then the flow is stopped when the outlet pressure is higher than the inlet pressure; otherwise, reverse flow takes place.
<p>The default flow characteristic <tt>FlowChar</tt> is linear; this can be replaced by any user-defined function (e.g. equal percentage, quick opening, etc.).
<p>The product Fk*xt is given by the parameter <tt>Fxtnom</tt>, and is assumed constant by default. The relative change of the xt coefficient with the valve opening can be specified by customising the <tt>xtfun</tt> function.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end ValveVap;

  model PumpOld "Centrifugal pump with controlled speed"
    extends ThermoPower.Icons.Water.Pump;
    import Modelica.SIunits.Conversions.NonSIunits.*;
    parameter Integer Np0(min=1) = 1 "Nominal number of pumps in parallel";
    parameter Boolean NpFix=true "Fixed number of pumps in parallel";
    parameter Pressure pin_start "Inlet Pressure Start Value";
    parameter Pressure pout_start "Outlet Pressure Start Value";
    parameter SpecificEnthalpy hstart=1e5 "Fluid Specific Enthalpy Start Value";
    parameter Density rho0=1000 "Nominal Liquid Density";
    parameter AngularVelocity_rpm n0=100 "Nominal Velocity (RPM)";
    parameter AngularVelocity_rpm nAct=100 "Actual Velocity (RPM)";
    parameter Boolean nFix=true "Fixed Velocity";
    parameter Volume V "Pump Internal Volume";
    parameter Real etaMech(
      min=0,
      max=1) = 0.98 "Mechanical Efficiency";
    parameter Integer CharData(
      min=0,
      max=1) = 1 "0: (A,B,C,D,E,F) - 1: OpPoints";
    parameter Real A0=0;
    parameter Real B0=0;
    parameter Real C0=0;
    parameter Real D0=0;
    parameter Real E0=0;
    parameter Real F0=0;
    parameter Height head[3] "Pump head for three operating points";
    parameter VolumeFlowRate q[3]
      "Volume flow rate for three operating points (single pump)";
    parameter Power P_cons[3]
      "Power consumption for three operating points (single pump)";
    parameter Boolean CheckValve=false "Reverse flow stopped";
    parameter Boolean ThermalCapacity=false
      "Fluid heat capacity accounted for (mandatory in case of low or zero flowrate)";
    constant Acceleration g=Modelica.Constants.g_n;
    LiquidDensity rho "Liquid density";
    MassFlowRate w "Mass flowrate (single pump)";
    SpecificEnthalpy h(start=hstart) "Fluid specific enthalpy";
    SpecificEnthalpy hin;
    SpecificEnthalpy hout;
    Pressure p(start=pin_start) "Fluid pressure";
    AngularVelocity_rpm n "Shaft r.p.m.";
    Integer Np(min=1) "Number of pumps in parallel";

    Power P "Power Consumption (single pump)";
    Power Ptot "Power Consumption (total)";
    constant Power P_eps=1e-8
      "Small coefficient to avoid numerical singularities";
    Power Phyd "Hydraulic power (single pump)";
    Real eta "Efficiency";
    Boolean FlowOn(start=true);
    Real s "Auxiliary Variable";
    Real A;
    Real B;
    Real C;
    Real D;
    Real E;
    Real F;
    ThermoPower.Water.FlangeAOld infl(p(start=pin_start)) annotation (Placement(
          transformation(extent={{-100,2},{-60,42}}, rotation=0)));
    ThermoPower.Water.FlangeBOld outfl(p(start=pout_start)) annotation (
        Placement(transformation(extent={{60,2},{100,42}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_n "RPM" annotation (Placement(
          transformation(
          origin={-26,80},
          extent={{-10,-10},{10,10}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput in_Np "Number of  parallel pumps"
      annotation (Placement(transformation(
          origin={28,80},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation
    if nFix then
      n = nAct;
      in_n = 0;
    else
      n = in_n;
    end if;

    if NpFix then
      Np = Np0;
      in_Np = 0;
    else
      Np = in_Np;
    end if;

    if CharData == 0 then
      A = A0;
      B = B0;
      C = C0;
      D = D0;
      E = E0;
      F = F0;
    else
      if CharData == 1 then
        head[1]*g = -A*q[1]^2 + B*q[1] + C;
        head[2]*g = -A*q[2]^2 + B*q[2] + C;
        head[3]*g = -A*q[3]^2 + B*q[3] + C;
        P_cons[1] = D*(n0^2)*q[1] - E*n0*(q[1]^2) + F*(n0^2);
        P_cons[2] = D*(n0^2)*q[2] - E*n0*(q[2]^2) + F*(n0^2);
        P_cons[3] = D*(n0^2)*q[3] - E*n0*(q[3]^2) + F*(n0^2);
      end if;
    end if;

    infl.w + outfl.w = 0;
    w = infl.w/Np;
    FlowOn = s > 0;

    if (FlowOn or (not CheckValve)) then
      w = s;
      (outfl.p - infl.p)/rho = -A*(w/rho)^2 + B*(n/n0)*w/rho + C*(n/n0)^2;
    else
      (outfl.p - infl.p)/rho = C*(n/n0)^2 - s;
      w = 0;
    end if;

    P = D*(n^2)*(w/rho) - E*n*((w/rho)^2) + F*(n^2);
    Ptot = P*Np;

    if w >= 0 then
      hin = infl.hBA;
    else
      hin = outfl.hAB;
    end if;

    infl.hAB = h;
    outfl.hBA = h;
    h = hout;
    p = infl.p;
    rho = ThermoPower.Water.dens_ph(p, h);

    if ThermalCapacity then
      (rho*V*der(h)) = (outfl.w/Np)*hout + (infl.w/Np)*hin + Phyd;
    else
      0 = (outfl.w/Np)*hout + (infl.w/Np)*hin + Phyd;
    end if;
    Phyd = P*etaMech;
    eta = ((outfl.p - infl.p)*w/rho)/(P + P_eps);

    annotation (
      Icon(graphics),
      Diagram(graphics),
      Documentation(info="<HTML>
<p>This model describes a centrifugal pump (or a group of <tt>Np</tt> pumps in parallel) with controlled speed, either fixed or provided by an external signal. The hydraulic characteristic (head vs. flowrate) is represented, as well as the pump power consumption.
<p>In order to avoid singularities in the computation of the outlet enthalpy at zero flowrate, the thermal capacity of the fluid inside the pump body can be taken into account.
<p>The model can either support reverse flow conditions or include a built-in check valve to avoid flow reversal.
<p><b>Modelling options</b></p>
<p>The following options are available to specify the pump characteristics:
<ul><li><tt>CharData = 0</tt>: the coefficients of the characteristics (<tt>A,B,C,D,E,F</tt>) are provided directly
<li><tt>CharData = 1</tt>: the characteristics are specified by providing a vector of three operating points (in terms of heads <tt>head[3]</tt>, volume flow rate <tt>q[3]</tt>, power consumption <tt>P_cons[3]</tt>, nominal fluid density <tt>rho0</tt>, and nominal rotational speed <tt>n0</tt>) for a single pump.
</ul>
<p>If <tt>NpFix</tt> is set to true, the number of pumps in parallel is fixed, and equal to <tt>Np0</tt>; otherwise, the <tt>in_Np</tt> connector must be wired, providing the (possibly varying) number of working pumps in parallel.</p>
<p>If <tt>nFix</tt> is set to true, the rotational speed of the pump is fixed, and equal to <tt>nAct</tt>, which can be different from <tt>n0</tt>; otherwise, the <tt>in_n</tt> connector must be wired, providing the (possibly varying) actual rotational speed of the pump.</p>
<p>If <tt>ThermalCapacity</tt> is set to true, the heat capacity of the fluid inside the pump is taken into account: this is necessary to avoid singularities in the computation of the outlet enthalpy in case of zero flowrate. If zero flowrate conditions are always avoided, this effect can be neglected by setting <tt>ThermalCapacity</tt> to false, thus avoiding a fast state variable in the model.
<p>The <tt>CheckValve</tt> parameter determines whether the pump allows a reverse flow or blocks it.
<p><b>Revision history:</b></p>
<ul>
<li><i>15 Jan 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       <tt>ThermalCapacity</tt> and <tt>CheckValve</tt> added.</li>
<li><i>15 Dec 2003</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end PumpOld;

  model PumpMechOld "Centrifugal pump with mechanical connector for the shaft"
    extends ThermoPower.Icons.Water.Pump;
    import Modelica.SIunits.*;
    import Modelica.SIunits.Conversions.NonSIunits.*;
    parameter Integer Np0(min=1) = 1 "Nominal number of pumps in parallel";
    parameter Boolean NpFix=true "Fixed number of pumps in parallel";
    parameter Pressure pin_start "Inlet Pressure Start Value";
    parameter Pressure pout_start "Outlet Pressure Start Value";
    parameter SpecificEnthalpy hstart=1e5 "Fluid Specific Enthalpy Start Value";
    parameter LiquidDensity rho0=1000 "Nominal Density";
    parameter AngularVelocity_rpm n0=100 "Nominal Velocity (RPM)";
    parameter Volume V "Pump Internal Volume";
    parameter Real etaMech(
      min=0,
      max=1) = 0.98 "Mechanical Efficiency";
    parameter Integer CharData(
      min=0,
      max=1) = 1 "0: (A,B,C,D,E,F) - 1: OpPoints";
    parameter Real A0=0;
    parameter Real B0=0;
    parameter Real C0=0;
    parameter Real D0=0;
    parameter Real E0=0;
    parameter Real F0=0;
    parameter Height head[3] "Pump head for three operating points";
    parameter VolumeFlowRate q[3]
      "Volume flow rate for three operating points (single pump)";
    parameter Power P_cons[3]
      "Power consumption for three operating points (single pump)";
    parameter Boolean CheckValve=false "Reverse flow stopped";
    parameter Boolean ThermalCapacity=false
      "Fluid heat capacity accounted for (mandatory in case of low or zero flowrate)";
    constant Acceleration g=Modelica.Constants.g_n;

    LiquidDensity rho "Fluid density";
    MassFlowRate w "Mass flowrate (single pump)";
    SpecificEnthalpy h(start=hstart) "Fluid specific enthalpy";
    SpecificEnthalpy hin;
    SpecificEnthalpy hout;
    Pressure p(start=pin_start) "Fluid pressure";
    AngularVelocity_rpm n "Shaft r.p.m.";
    Angle phi "Shaft angle";
    AngularVelocity omega "Shaft angular velocity";
    Integer Np(min=1) "Number of pumps in parallel";
    Boolean FlowOn(start=true);
    Real s "Auxiliary Variable";

    Power P "Power consumption (single pump)";
    Power Ptot "Power consumption (total)";
    constant Power P_eps=1e-8
      "Small coefficient to avoid numerical singularities";
    Power Phyd "Hydraulic power (single pump)";
    Real eta "Efficiency";
    Real A;
    Real B;
    Real C;
    Real D;
    Real E;
    Real F;
    ThermoPower.Water.FlangeAOld infl(p(start=pin_start)) annotation (Placement(
          transformation(extent={{-100,2},{-60,42}}, rotation=0)));
    ThermoPower.Water.FlangeBOld outfl(p(start=pout_start)) annotation (
        Placement(transformation(extent={{36,56},{76,96}}, rotation=0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_a MechPort annotation (
        Placement(transformation(extent={{56,6},{86,34}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput in_Np "Number of  parallel pumps"
      annotation (Placement(transformation(
          origin={0,88},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation
    if NpFix then
      Np = Np0;
      in_Np = 0;
    else
      Np = in_Np;
    end if;

    if CharData == 0 then
      A = A0;
      B = B0;
      C = C0;
      D = D0;
      E = E0;
      F = F0;
    else
      if CharData == 1 then
        head[1]*g = -A*q[1]^2 + B*q[1] + C;
        head[2]*g = -A*q[2]^2 + B*q[2] + C;
        head[3]*g = -A*q[3]^2 + B*q[3] + C;
        P_cons[1] = D*(n0^2)*q[1] - E*n0*(q[1]^2) + F*(n0^2);
        P_cons[2] = D*(n0^2)*q[2] - E*n0*(q[2]^2) + F*(n0^2);
        P_cons[3] = D*(n0^2)*q[3] - E*n0*(q[3]^2) + F*(n0^2);
      end if;
    end if;

    phi = MechPort.phi;
    omega = der(phi);
    n = Modelica.SIunits.Conversions.to_rpm(omega);
    P = omega*MechPort.tau;

    infl.w + outfl.w = 0;
    w = infl.w/Np;
    FlowOn = s > 0;

    if (FlowOn or (not CheckValve)) then
      w = s;
      (outfl.p - infl.p)/rho = -A*(w/rho)^2 + B*(n/n0)*w/rho + C*(n/n0)^2;
    else
      (outfl.p - infl.p)/rho = C*(n/n0)^2 - s;
      w = 0;
    end if;

    P = D*(n^2)*(w/rho) - E*n*((w/rho)^2) + F*(n^2);
    Ptot = P*Np;

    if w >= 0 then
      hin = infl.hBA;
    else
      hin = outfl.hAB;
    end if;

    infl.hAB = h;
    outfl.hBA = h;
    h = hout;
    p = infl.p;
    rho = ThermoPower.Water.dens_ph(p, h);

    if ThermalCapacity then
      (rho*V*der(h)) = (outfl.w/Np)*hout + (infl.w/Np)*hin + Phyd;
    else
      0 = (outfl.w/Np)*hout + (infl.w/Np)*hin + Phyd;
    end if;
    Phyd = P*etaMech;
    eta = ((outfl.p - infl.p)*w/rho)/(P + P_eps);

    annotation (
      Icon(graphics),
      Diagram(graphics),
      Documentation(info="<HTML>
<p>This model describes a centrifugal pump (or a group of <tt>Np</tt> pumps in parallel) with a mechanical rotational connector for the shaft, to be used when the pump drive has to be modelled explicitly. In the case of <tt>Np</tt> pumps in parallel, the mechanical connector is relative to a single pump. The hydraulic characteristic (head vs. flowrate) is represented, as well as the pump power consumption.
<p>In order to avoid singularities in the computation of the outlet enthalpy at zero flowrate, the thermal capacity of the fluid inside the pump body can be taken into account.
<p>The model can either support reverse flow conditions or include a built-in check valve to avoid flow reversal.
<p><b>Modelling options</b></p>
<p>The following options are available to specify the pump characteristics:
<ul><li><tt>CharData = 0</tt>: the coefficients of the characteristics (<tt>A,B,C,D,E,F</tt>) are provided directly
<li><tt>CharData = 1</tt>: the characteristics are specified by providing a vector of three operating points (in terms of heads <tt>head[3]</tt>, volume flow rate <tt>q[3]</tt>, power consumption <tt>P_cons[3]</tt>, nominal fluid density <tt>rho0</tt>, and nominal rotational speed <tt>n0</tt>) for a single pump.
</ul>
<p>If <tt>NpFix</tt> is set to true, the number of pumps in parallel is fixed, and equal to <tt>Np0</tt>; otherwise, the <tt>in_Np</tt> connector must be wired, providing the (possibly varying) number of working pumps in parallel.</p>
<p>If <tt>ThermalCapacity</tt> is set to true, the heat capacity of the fluid inside the pump is taken into account: this is necessary to avoid singularities in the computation of the outlet enthalpy in case of zero flowrate. If zero flowrate conditions are always avoided, this effect can be neglected by setting <tt>ThermalCapacity</tt> to false, thus avoiding a fast state variable in the model.
<p>The <tt>CheckValve</tt> parameter determines whether the pump allows a reverse flow or blocks it.
<p><b>Revision history:</b></p>
<ul>
<li><i>15 Jan 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       <tt>ThermalCapacity</tt> and <tt>CheckValve</tt> added.</li>
<li><i>15 Dec 2003</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end PumpMechOld;

  model Flow1D2phDB
    "1-dimensional fluid flow model for 2-phase boiling flow (finite volumes, 2-phase, computation of heat transfer coeff.)"
    extends Water.Flow1D2ph(redeclare Thermal.DHThtc wall);
    parameter CoefficientOfHeatTransfer gamma_b=20000
      "Coefficient of heat transfer for boiling flow";
    parameter Real xCHF=0.9
      "Steam quality corresponding to the Critical Heat Flux";
    SpecificEnthalpy hCHF "Enthalpy corresponding to the Critical Heat Flux";
    function calc_gamma
      "Computation of the heat transfer coefficient from the model variables"
      input MassFlowRate w;
      input Length D;
      input Area A;
      input Pressure p;
      input Temperature Twall[:];
      input SpecificEnthalpy h[:];
      input SpecificEnthalpy hls;
      input SpecificEnthalpy hvs;
      input CoefficientOfHeatTransfer gamma_b;
      input Real xCHF;
      output CoefficientOfHeatTransfer gamma[size(h, 1)];
    protected
      ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop;
      ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop_ls;
      ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop_vs;
      DynamicViscosity mu;
      DynamicViscosity mu_ls;
      DynamicViscosity mu_vs;
      ThermalConductivity k;
      ThermalConductivity k_ls;
      ThermalConductivity k_vs;
      AbsoluteTemperature Ts;
      Real x;
      SpecificEnthalpy hCHF;
      SpecificEnthalpy h_B;
      Real csi;
      Boolean hasBoundary;
      CoefficientOfHeatTransfer gcorr[size(h, 1)]
        "Correction to gamma for smoothness";
      CoefficientOfHeatTransfer gamma_ls;
      CoefficientOfHeatTransfer gamma_chf;
      CoefficientOfHeatTransfer gamma_nb;
      Integer n;
      Integer type_B[size(h, 1)] "1:NB-Bls; 2:B-NBls; 3:B-NBchf: 4:NB-Bchf";
      Real pos_B[size(h, 1)] "Position of the boundary relative to the node";
      Integer n_B "Number of boil-noboil and noboil-boil boundaries";
      Integer node_B[size(h, 1)] "Node nearest to the boundary";
      Integer curr_type;
    algorithm
      hCHF := hls + xCHF*(hvs - hls);
      if (min(h) <= hvs and max(h) >= hls) then
        // Two-phase heat transfer takes place: compute properties
        // of saturated water and steam
        prop_ls := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
              p,
              hls - 1e-5,
              0);
        mu_ls := ThermoFluid.BaseClasses.MediumModels.SteamIF97.visc_dt(prop_ls.d,
          prop_ls.T);
        k_ls := ThermoFluid.BaseClasses.MediumModels.SteamIF97.cond_dt(
              prop_ls.d,
              prop_ls.T,
              p,
              1);
        prop_vs := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
              p,
              hvs + 1e-5,
              1);
        mu_vs := ThermoFluid.BaseClasses.MediumModels.SteamIF97.visc_dt(prop_vs.d,
          prop_vs.T);
        k_vs := ThermoFluid.BaseClasses.MediumModels.SteamIF97.cond_dt(
              prop_vs.d,
              prop_vs.T,
              p,
              2);

        // Compute the h.t.c. immediately before and after the onset of nucleate boiling
        gamma_ls := Water.f_dittus_boelter(
              w,
              D,
              A,
              mu_ls,
              k_ls,
              prop_ls.cp);
        gamma_chf := Water.f_dittus_boelter(
              w*xCHF,
              D,
              A,
              mu_vs,
              k_vs,
              prop_vs.cp);
      end if;

      for j in 1:size(h, 1) loop
        if h[j] < hls then
          // Liquid phase: Dittus-Boelter's correlation
          prop := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
                p,
                h[j],
                0);
          mu := ThermoFluid.BaseClasses.MediumModels.SteamIF97.visc_dt(prop.d,
            prop.T);
          k := ThermoFluid.BaseClasses.MediumModels.SteamIF97.cond_dt(
                prop.d,
                prop.T,
                p,
                1);
          gamma[j] := Water.f_dittus_boelter(
                w,
                D,
                A,
                mu,
                k,
                prop.cp);
        elseif h[j] > hvs then
          // Vapour phase: Dittus-Boelter's correlation
          prop := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
                p,
                h[j],
                1);
          mu := ThermoFluid.BaseClasses.MediumModels.SteamIF97.visc_dt(prop.d,
            prop.T);
          k := ThermoFluid.BaseClasses.MediumModels.SteamIF97.cond_dt(
                prop.d,
                prop.T,
                p,
                2);
          gamma[j] := Water.f_dittus_boelter(
                w,
                D,
                A,
                mu,
                k,
                prop.cp);
        elseif h[j] > hCHF then
          // Wet steam after dryout: Dittus-Boelter's correlation considering
          // only the vapour phase
          x := (h[j] - hls)/(hvs - hls);
          prop := prop_vs;
          mu := mu_vs;
          k := k_vs;
          gamma[j] := Water.f_dittus_boelter(
                w*x,
                D,
                A,
                mu,
                k,
                prop.cp);
        else
          // Nucleate boiling: constant h.t.c.
          gamma[j] := gamma_b;
        end if;
      end for;

      // Smoothing of heat transfer coefficients if there are boiling boundaries is
      // in a neighbourhood of radius l/2 of each node with boiling condition
      gcorr := zeros(size(gamma, 1));
      n_B := 0;
      // compute boundary types and positions
      for j in 1:(size(h, 1) - 1) loop
        hasBoundary := false;
        if h[j] < hls and h[j + 1] > hls then
          hasBoundary := true;
          h_B := hls;
          curr_type := 1;
        elseif h[j] > hls and h[j + 1] < hls then
          hasBoundary := true;
          h_B := hls;
          curr_type := 2;
        elseif h[j] < hCHF and h[j + 1] > hCHF then
          hasBoundary := true;
          h_B := hCHF;
          curr_type := 3;
        elseif h[j] > hCHF and h[j + 1] < hCHF then
          hasBoundary := true;
          h_B := hCHF;
          curr_type := 4;
        end if;
        if hasBoundary then
          n_B := n_B + 1;
          type_B[n_B] := curr_type;
          csi := abs((h[j] - h_B)/(h[j + 1] - h[j]));
          if csi < 0.5 then
            pos_B[n_B] := csi;
            node_B[n_B] := j;
          else
            pos_B[n_B] := csi - 1;
            node_B[n_B] := j + 1;
          end if;
        end if;
      end for;

      // compute corrections to gamma in the nodes near the boundaries
      for j in 1:n_B loop
        n := node_B[j];
        if type_B[j] == 1 or type_B[j] == 2 then
          gamma_nb := gamma_ls;
        else
          gamma_nb := gamma_chf;
        end if;
        csi := if pos_B[j] < 0 then 0.5 + pos_B[j] else pos_B[j] - 0.5;
        if type_B[j] == 1 or type_B[j] == 4 then
          csi := -csi;
        end if;
        if n == 1 or n == size(h, 1) then
          csi := 2*csi;
        end if;
        gcorr[n] := gcorr[n] + csi*(gamma_b - gamma_nb);
      end for;
      gamma := gamma + gcorr;
    end calc_gamma;
  equation
    wall.gamma = calc_gamma(
        w,
        Dhyd,
        A,
        p,
        wall.T,
        h,
        hl,
        hv,
        gamma_b,
        xCHF);
    hCHF = hl + xCHF*(hv - hl);
    annotation (Documentation(info="<HTML>
<p>This model extends <tt>Flow1D2ph</tt> by computing the distribution of the heat transfer coefficient <tt>gamma</tt> and making it available through an extended version of the <tt>wall</tt> connector.
<p>This simplified model can be used for one-phase or two-phase water/steam flow. The heat transfer coefficient is computed according to the following hypotheses:
<ul>
<li> If the fluid is subcooled liquid or superheated steam, Dittus-Boelter's correlation [1] is used.
<li> If the fluid is a two-phase mixture with a steam fraction less than the (constant) critical value <tt>xCHF</tt>, boiling heat transfer is assumed with a heat transfer coefficient equal to <tt>gamma_b</tt>.
<li> If the fluid is wet steam with a steam fraction greater than the (constant) critical value <tt>xCHF</tt>, the heat transfer coefficient is computed according to Dittus-Boelter's correlation, by considering only the steam fraction of the mixture.
</ul>
<p>A smoothing algorithm is applied to the nodes which are in the neighbourhood of a transition boundary between non-boiling and boiling conditions, to avoid non-physical sudden changes of the nodal values of the heat transfer coefficient when the transition boundary passes through a node. The computed values of the heat transfer coefficient are thus a continuous function of the nodal enthalpies and pressures, so that it is not necessary to generate events in order to handle discontinuities
<p><b>References</b></p>
<ol>
<li>J. C. Collier: <i>Convective Boiling and Condensation</i>, 2nd ed.,McGraw Hill, 1981, pp. 146.
</ol>
</HTML>", revisions="<html>
<ul>
<li><i>24 Sep 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>11 Feb 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Computation of the h.t.c. extended to all the thermodynamic conditions of the fluid.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end Flow1D2phDB;

  model Flow1D2phChen
    "1-dimensional fluid flow model for 2-phase boiling flow (finite volumes, 2-phase, Chen correlation)"

    extends Water.Flow1D2ph(redeclare Thermal.DHThtc wall);
    parameter Real xCHF=0.9 "Steam quality corresponding to Critical Heat Flux";
    SpecificEnthalpy hCHF "Enthalpy corresponding to the Critical Heat Flux";
    function calc_gamma
      "Computation of the heat transfer coefficient from the model variables"

      input MassFlowRate w;
      input Length D;
      input Area A;
      input Pressure p;
      input Temperature Twall[:];
      input SpecificEnthalpy h[:];
      input SpecificEnthalpy hls;
      input SpecificEnthalpy hvs;
      input Real xCHF;
      output CoefficientOfHeatTransfer gamma[size(h, 1)];
    protected
      ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop;
      ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop_ls;
      ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop_vs;
      DynamicViscosity mu;
      DynamicViscosity mu_ls;
      DynamicViscosity mu_vs;
      ThermalConductivity k;
      ThermalConductivity k_ls;
      ThermalConductivity k_vs;
      AbsoluteTemperature Ts;
      Temperature DTsat;
      Pressure Dpsat;
      SurfaceTension sigma;
      Real x;
      SpecificEnthalpy hCHF;
      SpecificEnthalpy h_B;
      Real csi;
      Boolean hasBoundary;
      CoefficientOfHeatTransfer gcorr[size(h, 1)]
        "Correction to gamma for smoothness";
      CoefficientOfHeatTransfer gamma_ls;
      CoefficientOfHeatTransfer gamma_chf;
      CoefficientOfHeatTransfer gamma_b;
      CoefficientOfHeatTransfer gamma_nb;
      Integer n;
      Integer type_B[size(h, 1)] "1:NB-Bls; 2:B-NBls; 3:B-NBchf: 4:NB-Bchf";
      Real pos_B[size(h, 1)] "Position of the boundary relative to the node";
      Integer n_B "Number of boil-noboil and noboil-boil boundaries";
      Integer node_B[size(h, 1)] "Node nearest to the boundary";
      Integer curr_type;
    algorithm
      hCHF := hls + xCHF*(hvs - hls);
      if (min(h) <= hvs and max(h) >= hls) then
        // Two-phase heat transfer takes place: compute properties
        // of saturated water and steam
        prop_ls := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
              p,
              hls - 1e-5,
              0);
        mu_ls := ThermoFluid.BaseClasses.MediumModels.SteamIF97.visc_dt(prop_ls.d,
          prop_ls.T);
        k_ls := ThermoFluid.BaseClasses.MediumModels.SteamIF97.cond_dt(
              prop_ls.d,
              prop_ls.T,
              p,
              1);
        sigma := ThermoFluid.BaseClasses.MediumModels.SteamIF97.surfaceTension(
          prop_ls.T);
        prop_vs := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
              p,
              hvs + 1e-5,
              1);
        mu_vs := ThermoFluid.BaseClasses.MediumModels.SteamIF97.visc_dt(prop_vs.d,
          prop_vs.T);
        k_vs := ThermoFluid.BaseClasses.MediumModels.SteamIF97.cond_dt(
              prop_vs.d,
              prop_vs.T,
              p,
              2);

        // Compute the h.t.c. immediately before and after the onset of nucleate boiling
        gamma_ls := Water.f_dittus_boelter(
              w,
              D,
              A,
              mu_ls,
              k_ls,
              prop_ls.cp);
        gamma_chf := Water.f_dittus_boelter(
              w*xCHF,
              D,
              A,
              mu_vs,
              k_vs,
              prop_vs.cp);
      end if;
      for j in 1:size(h, 1) loop
        if h[j] < hls then
          // Liquid phase: Dittus-Boelter's correlation
          prop := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
                p,
                h[j],
                0);
          mu := ThermoFluid.BaseClasses.MediumModels.SteamIF97.visc_dt(prop.d,
            prop.T);
          k := ThermoFluid.BaseClasses.MediumModels.SteamIF97.cond_dt(
                prop.d,
                prop.T,
                p,
                1);
          gamma[j] := Water.f_dittus_boelter(
                w,
                D,
                A,
                mu,
                k,
                prop.cp);
        elseif h[j] > hvs then
          // Vapour phase: Dittus-Boelter's correlation
          prop := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
                p,
                h[j],
                1);
          mu := ThermoFluid.BaseClasses.MediumModels.SteamIF97.visc_dt(prop.d,
            prop.T);
          k := ThermoFluid.BaseClasses.MediumModels.SteamIF97.cond_dt(
                prop.d,
                prop.T,
                p,
                2);
          gamma[j] := Water.f_dittus_boelter(
                w,
                D,
                A,
                mu,
                k,
                prop.cp);
        elseif h[j] > hCHF then
          // Wet steam after dryout: Dittus-Boelter's correlation considering
          // only the vapour phase
          x := (h[j] - hls)/(hvs - hls);
          prop := prop_vs;
          mu := mu_vs;
          k := k_vs;
          gamma[j] := Water.f_dittus_boelter(
                w*x,
                D,
                A,
                mu,
                k,
                prop.cp);
        else
          // Nucleate boiling: Chen's correlation
          DTsat := Twall[j] - prop_vs.T;
          Dpsat := ThermoFluid.BaseClasses.MediumModels.SteamIF97.satp(Twall[j])
             - p;
          x := (h[j] - hls)/(hvs - hls);
          gamma[j] := Water.f_chen(
                w,
                D,
                A,
                mu_ls,
                k_ls,
                prop_ls.cp,
                prop_ls.d,
                sigma,
                prop_vs.d,
                mu_vs,
                DTsat,
                Dpsat,
                hvs - hls,
                x);
        end if;
      end for;

      // Smoothing of heat transfer coefficients if there are boiling boundaries is
      // in a neighbourhood of radius l/2 of each node with boiling condition
      gcorr := zeros(size(gamma, 1));
      n_B := 0;
      // compute boundary types and positions
      for j in 1:(size(h, 1) - 1) loop
        hasBoundary := false;
        if h[j] < hls and h[j + 1] > hls then
          hasBoundary := true;
          h_B := hls;
          curr_type := 1;
        elseif h[j] > hls and h[j + 1] < hls then
          hasBoundary := true;
          h_B := hls;
          curr_type := 2;
        elseif h[j] < hCHF and h[j + 1] > hCHF then
          hasBoundary := true;
          h_B := hCHF;
          curr_type := 3;
        elseif h[j] > hCHF and h[j + 1] < hCHF then
          hasBoundary := true;
          h_B := hCHF;
          curr_type := 4;
        end if;
        if hasBoundary then
          n_B := n_B + 1;
          type_B[n_B] := curr_type;
          csi := abs((h[j] - h_B)/(h[j + 1] - h[j]));
          if csi < 0.5 then
            pos_B[n_B] := csi;
            node_B[n_B] := j;
          else
            pos_B[n_B] := csi - 1;
            node_B[n_B] := j + 1;
          end if;
        end if;
      end for;

      // compute corrections to gamma in the nodes near the boundaries
      for j in 1:n_B loop
        n := node_B[j];
        if type_B[j] == 1 or type_B[j] == 2 then
          gamma_nb := gamma_ls;
          x := 0;
        else
          gamma_nb := gamma_chf;
          x := xCHF;
        end if;
        DTsat := Twall[n] - prop_vs.T;
        Dpsat := ThermoFluid.BaseClasses.MediumModels.SteamIF97.satp(Twall[n])
           - p;
        gamma_b := Water.f_chen(
              w,
              D,
              A,
              mu_ls,
              k_ls,
              prop_ls.cp,
              prop_ls.d,
              sigma,
              prop_vs.d,
              mu_vs,
              DTsat,
              Dpsat,
              hvs - hls,
              x);
        csi := if pos_B[j] < 0 then 0.5 + pos_B[j] else pos_B[j] - 0.5;
        if type_B[j] == 1 or type_B[j] == 4 then
          csi := -csi;
        end if;
        if n == 1 or n == size(h, 1) then
          csi := 2*csi;
        end if;
        gcorr[n] := gcorr[n] + csi*(gamma_b - gamma_nb);
      end for;
      gamma := gamma + gcorr;
    end calc_gamma;
  equation
    wall.gamma = calc_gamma(
        w,
        Dhyd,
        A,
        p,
        wall.T,
        h,
        hl,
        hv,
        xCHF);
    hCHF = hl + xCHF*(hv - hl);

    annotation (Documentation(info="<HTML>
<p>This model extends <tt>Flow1D2ph</tt> by computing the distribution of the heat transfer coefficient <tt>gamma</tt> and making it available through an extended version of the <tt>wall</tt> connector.
<p>The model can be used for one-phase or two-phase water/steam flow. The heat transfer coefficient is computed according to the following hypotheses:
<ul>
<li> If the fluid is subcooled liquid or superheated steam, Dittus-Boelter's correlation [1] is used.
<li> If the fluid is a two-phase mixture with a steam fraction less than the (constant) critical value <tt>xCHF</tt>, the heat transfer coefficent is computed according to Chen's correlation [2].
<li> If the fluid is wet steam with a steam fraction greater than the (constant) critical value <tt>xCHF</tt>, the heat transfer coefficient is computed according to Dittus-Boelter's correlation [1], by considering only the steam fraction of the mixture.
</ul>
<p>A smoothing algorithm is applied to the nodes which are in the neighbourhood of a transition boundary between non-boiling and boiling conditions, to avoid non-physical sudden changes of the nodal values of the heat transfer coefficient when the transition boundary passes through a node. The computed values of the heat transfer coefficient are thus a continuous function of the nodal enthalpies and pressures, so that it is not necessary to generate events in order to handle discontinuities
<p><b>References</b></p>
<ol>
<li>J. C. Collier: <i>Convective Boiling and Condensation</i>, 2nd ed.,McGraw Hill, 1981, pp. 146.
</ol>
<ol>
<li>J. C. Collier: <i>Convective Boiling and Condensation</i>, 2nd ed.,McGraw Hill, 1981, pp. 215-220.
</ol>
<p><b>Revision history:</b></p>
<ul>
<li><i>11 Feb 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end Flow1D2phChen;

  function prop_ph
    "Water substance properties as a function of pressure and specific enthalpy"

    import Modelica.SIunits.*;
    input Pressure p;
    input SpecificEnthalpy h;
    output Temperature T;
    output Density rho;
    output DerDensityByPressure drdp;
    output DerDensityByEnthalpy drdh;

  protected
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop;
  algorithm

    prop := Water.water_ph(
        p,
        h,
        0);
    T := prop.T;
    rho := prop.d;

    drdp := prop.ddph;
    drdh := prop.ddhp;
    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
</HTML>", revisions="<html>
<ul>
<li><i>1Jun 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       Modified to avoid discontinuities at the phase boundaries.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end prop_ph;

  function prop_ph_2ph
    "Water substance properties as a function of pressure and specific enthalpy for 1 or 2-phase states"

    input Pressure p;
    input SpecificEnthalpy h;
    output Temperature T;
    output Density rho;
    output DerDensityByPressure drdp;
    output DerDensityByEnthalpy drdh;
  protected
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop;
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph propls;
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph propvs;
    Temperature Ts;
    SpecificEnthalpy hls;
    SpecificEnthalpy hvs;
    Density rhov;
    Density rhol;
    Real x;
  algorithm
    (Ts,hvs,hls,rhov,rhol) :=
      ThermoFluid.BaseClasses.MediumModels.SteamIF97.boundaryvals_p(p);
    prop := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
        p,
        h,
        0);
    if h >= hls and h <= hvs then
      propls := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
          p,
          hls - 1e-5,
          0);
      propvs := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
          p,
          hvs + 1e-5,
          1);
      x := (h - hls)/(hvs - hls);
      rho := 1/(x/propvs.d + (1 - x)/propls.d);
      T := propvs.T*x + (1 - x)*propls.T;
    else
      rho := prop.d;
      T := prop.T;
    end if;
    drdp := prop.ddph;
    drdh := prop.ddhp;
    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
<p>Corrects a bug in the ThermoFluid water_ph function, which causes a small discontinuity in the
density and temperature computations across the saturation boundaries, which in turn may crash the integration algorithms near the equilibrium by originating sliding mode dynamics.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Feb 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end prop_ph_2ph;

  function tempdens_ph
    "Temperature and density of water substance as a function of pressure and specific enthalpy"

    input Pressure p;
    input SpecificEnthalpy h;
    output Temperature T;
    output Density rho;
  protected
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop;
  algorithm
    prop := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
        p,
        h,
        0);
    T := prop.T;
    rho := prop.d;
    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end tempdens_ph;

  function temp_ph
    "Temperature of water substance as a function of pressure and specific enthalpy"

    input Pressure p;
    input SpecificEnthalpy h;
    output Temperature T;
  protected
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop;
  algorithm
    prop := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
        p,
        h,
        0);
    T := prop.T;
    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end temp_ph;

  function dens_ph
    "Density of water substance as a function of pressure and specific enthalpy"

    input Pressure p;
    input SpecificEnthalpy h;
    output Density rho;
  protected
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop;
  algorithm
    prop := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
        p,
        h,
        0);
    rho := prop.d;
    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end dens_ph;

  function propsat_p
    "Saturated water and steam properties as a function of pressure"

    input Pressure p;
    output Temperature Ts;
    output Density rhol;
    output Density rhov;
    output SpecificEnthalpy hl;
    output SpecificEnthalpy hv;
  algorithm
    (Ts,hv,hl,rhov,rhol) :=
      ThermoFluid.BaseClasses.MediumModels.SteamIF97.boundaryvals_p(p);
    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end propsat_p;

  function propsat_p_der
    "Saturated water and steam properties (and their derivatives) as a function of pressure"

    input Pressure p;
    output Temperature Ts;
    output Density rhol;
    output Density rhov;
    output SpecificEnthalpy hl;
    output SpecificEnthalpy hv;
    output DerDensityByPressure drldp;
    output DerDensityByPressure drvdp;
    output DerEnthalpyByPressure dhldp;
    output DerEnthalpyByPressure dhvdp;
    output DerDensityByPressure drl_dp;
    // left derivative
    output DerDensityByPressure drv_dp;
    // right derivative
  protected
    Real dTdp;
  protected
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph propls;
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph propvs;
  algorithm
    (Ts,hv,hl,rhov,rhol) :=
      ThermoFluid.BaseClasses.MediumModels.SteamIF97.boundaryvals_p(p);
    (dTdp,dhvdp,dhldp,drvdp,drldp) :=
      ThermoFluid.BaseClasses.MediumModels.SteamIF97.boundaryderiv_p(p, 1);
    propls := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
        p,
        hl - 1e-5,
        0);
    propvs := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
        p,
        hv + 1e-5,
        1);

    // the limit densities of the one-phase fluid are used instead of the values
    // provided by boundaryvals_p() to avoid discontinuities
    rhol := propls.d;
    rhov := propvs.d;
    drl_dp := propls.ddph;
    drv_dp := propvs.ddph;
    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end propsat_p_der;

  function propsat_p_th
    "Saturated water and steam temperature and specific enthalpy as a function of pressure"

    input Pressure p;
    output Temperature Ts;
    output SpecificEnthalpy hl;
    output SpecificEnthalpy hv;
  protected
    LiquidDensity rhol;
    GasDensity rhov;
  algorithm
    (Ts,hv,hl,rhov,rhol) :=
      ThermoFluid.BaseClasses.MediumModels.SteamIF97.boundaryvals_p(p);
    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end propsat_p_th;

  function propsat_p_der2
    "Saturated water and steam properties (and their derivatives) as a function of pressure"

    input Pressure p;
    output Temperature Ts;
    output Density rhol;
    output Density rhov;
    output SpecificEnthalpy hl;
    output SpecificEnthalpy hv;
    output DerDensityByPressure drldp;
    output DerDensityByPressure drvdp;
    output DerEnthalpyByPressure dhldp;
    output DerEnthalpyByPressure dhvdp;
    output Real dTdp;

  protected
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph propls;
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph propvs;
  algorithm
    (Ts,hv,hl,rhov,rhol) :=
      ThermoFluid.BaseClasses.MediumModels.SteamIF97.boundaryvals_p(p);
    (dTdp,dhvdp,dhldp,drvdp,drldp) :=
      ThermoFluid.BaseClasses.MediumModels.SteamIF97.boundaryderiv_p(p, 1);
    propls := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
        p,
        hl - 1e-5,
        0);
    propvs := ThermoFluid.BaseClasses.MediumModels.Water.water_ph(
        p,
        hv + 1e-5,
        1);

    // the limit densities of the one-phase fluid are used instead of the values
    // provided by boundaryvals_p() to avoid discontinuities
    rhol := propls.d;
    rhov := propvs.d;
    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end propsat_p_der2;

  function water_ph
    input Pressure p;
    input SpecificEnthalpy h;
    input Integer phase "0: Find 1:Liquid 2:TwoPhase 3: Vapour";
    output ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph pro;
  protected
    constant Modelica.SIunits.Temperature TLIMIT1=623.15;
    ThermoFluid.BaseClasses.MediumModels.Common.HelmholtzData dTR(R=ThermoFluid.BaseClasses.MediumModels.SteamIF97.data.RH2O);
    ThermoFluid.BaseClasses.MediumModels.Common.GibbsData pTR(R=ThermoFluid.BaseClasses.MediumModels.SteamIF97.data.RH2O);
    ThermoFluid.BaseClasses.MediumModels.Common.GibbsDerivs g;
    ThermoFluid.BaseClasses.MediumModels.Common.HelmholtzDerivs f;
    Integer error;
    Integer region;
    Temperature T;
  algorithm
    pTR.p := p;
    if phase == 0 then
      region := ThermoFluid.BaseClasses.MediumModels.SteamIF97.region_ph(
          p,
          h,
          0,
          0);
    elseif phase == 1 then
      if h < ThermoFluid.BaseClasses.MediumModels.SteamIF97.hupperofp1(p) then
        region := 1;
      else
        region := 3;
      end if;
    elseif phase == 2 then
      region := 4;
    else
      region := 2;
    end if;
    if (region == 1) then
      pTR.T := ThermoFluid.BaseClasses.MediumModels.SteamIF97.tph1(p, h);
      g := ThermoFluid.BaseClasses.MediumModels.SteamIF97.g1(p, pTR.T);
      pro := ThermoFluid.BaseClasses.MediumModels.Common.gibbsToProps_ph(g, pTR);
    elseif (region == 2) then
      pTR.T := ThermoFluid.BaseClasses.MediumModels.SteamIF97.tph2(p, h);
      g := ThermoFluid.BaseClasses.MediumModels.SteamIF97.g2(p, pTR.T);
      pro := ThermoFluid.BaseClasses.MediumModels.Common.gibbsToProps_ph(g, pTR);
    elseif (region == 3) then
      (dTR.d,dTR.T,error) :=
        ThermoFluid.BaseClasses.MediumModels.SteamIF97.dtofph3(
          p=p,
          h=h,
          delp=1.0e-7,
          delh=1.0e-6);
      f := ThermoFluid.BaseClasses.MediumModels.SteamIF97.f3(dTR.d, dTR.T);
      pro := ThermoFluid.BaseClasses.MediumModels.Common.helmholtzToProps_ph(f,
        dTR);
    elseif (region == 4) then
      pro := ThermoFluid.BaseClasses.MediumModels.SteamIF97.water_ph_r4(p, h);
    elseif (region == 5) then
      (pTR.T,error) := ThermoFluid.BaseClasses.MediumModels.SteamIF97.tofph5(
          p=p,
          h=h,
          reldh=1.0e-7);
      g := ThermoFluid.BaseClasses.MediumModels.SteamIF97.g5(p, pTR.T);
      pro := ThermoFluid.BaseClasses.MediumModels.Common.gibbsToProps_ph(g, pTR);
    end if;
  end water_ph;

  function propsat_p_2der
    "Saturated water and steam properties (and their derivatives) as a function of pressure, second version"

    input Pressure p;
    output Temperature Ts;
    output Density rhol;
    output Density rhov;
    output SpecificEnthalpy hl;
    output SpecificEnthalpy hv;

    output DerDensityByPressure drl_dp;
    //fuori campana
    output DerDensityByPressure drv_dp;
    //fuori campana
    output DerDensityByEnthalpy drl_dh;
    //fuori campana
    output DerDensityByEnthalpy drv_dh;
    //fuori campana

    output Real dhl;
    output Real dhv;

    output Real drl;
    output Real drv;
  protected
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph propls;
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph propvs;

    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop_ls;
    ThermoFluid.BaseClasses.CommonRecords.ThermoProperties_ph prop_vs;

    Real dT;
  algorithm

    (Ts,hv,hl,rhov,rhol) :=
      ThermoFluid.BaseClasses.MediumModels.SteamIF97.boundaryvals_p(p);

    (dT,dhv,dhl,drv,drl) :=
      ThermoFluid.BaseClasses.MediumModels.SteamIF97.boundaryderiv_p(p, 1);

    //fuori campana
    prop_ls := water_ph(
        p,
        hl,
        1);
    prop_vs := water_ph(
        p,
        hv,
        3);

    drl_dp := prop_ls.ddph;
    drv_dp := prop_vs.ddph;
    drl_dh := prop_ls.ddhp;
    drv_dh := prop_vs.ddhp;

    annotation (Documentation(info="<HTML>
<p>Based on the water medium model in the ThermoFluid library.
</HTML>", revisions="<html>
<ul>
<li><i>1 Jun 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       Improved version using <tt>water_ph</tt>.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end propsat_p_2der;

  model Pressuriser
    "Pressuriser for nuclear reactors (with steam generation by electrical heating)"

    parameter HeatCapacity Cm "Total Heat Capacity of the metal wall";
    parameter Volume Vlow
      "Volume of the (cylindrical) lower part of the pressuriser";
    parameter Volume Alow
      "Cross-sectional area of the lower part of the pressuriser";
    parameter Length ylow
      "Height of the downcomer outlet over the zero-level reference";
    parameter Volume Dup
      "Diameter of the (emispherical) upper part of the pressuriser";
    parameter Time tauev=15 "Time constant of bulk evaporation";
    parameter Time tauc=15 "Time constant of bulk condensation";
    parameter Real Kcs=0 "Surface condensation coefficient [kg/(s.m^2.K)]";
    parameter Real Ks=0 "Surface heat transfer coefficient [W/(m^2.K)]";
    parameter CoefficientOfHeatTransfer gmv=0
      "Heat transfer coefficient between metal wall and vapour phase";
    parameter CoefficientOfHeatTransfer gml=0
      "Heat transfer coefficient between metal wall and vapour phase";
    parameter Real afd=0.0 "Ratio of feedwater in downcomer flowrate";
    parameter Pressure pstart=1e5 "Pressure start value";
    parameter SpecificEnthalpy hlstart=1e5 "Liquid enthalpy start value";
    parameter SpecificEnthalpy hvstart=2.78e6 "Vapour enthalpy start value";
    parameter Temperature Tmstart=300 "Metal wall temperature start value";
    constant Real g=Modelica.Constants.g_n;
    constant Real pi=Modelica.Constants.pi;
    Volume Vv "Volume occupied by the vapour";
    Volume Vl "Volume occupied by the liquid";
    Pressure p(start=pstart) "Pressure at the liquid surface";
    SpecificEnthalpy hl(start=hlstart) "Liquid specific enthalpy";
    SpecificEnthalpy hv(start=hvstart) "Vapour specific enthalpy";
    SpecificEnthalpy hls "Saturated liquid specific enthalpy";
    SpecificEnthalpy hvs "Saturated vapour specific enthalpy";
    SpecificEnthalpy hf "Feedwater specific enthalpy";
    SpecificEnthalpy hd "Specific enthalpy of fluid to the downcomers";
    SpecificEnthalpy hvout "Specific enthalpy of steam at the outlet";
    SpecificEnthalpy hr "Specific enthalpy of fluid from the risers";
    MassFlowRate wf "Mass flowrate of feedwater";
    MassFlowRate wd "Mass flowrate to the downcomers";
    MassFlowRate wb "Mass flowrate of blowdown";
    MassFlowRate wr "Mass flowrate from the riser";
    MassFlowRate wv "Mass flowrate of steam at the outlet";
    MassFlowRate wc "Mass flowrate of bulk condensation";
    MassFlowRate wcs "Mass flowrate of surface condensation";
    MassFlowRate wev "Mass flowrate of bulk evaporation";
    MassFlowRate wh "Mass flowrate of steam produced by the heaters";
    AbsoluteTemperature Tl "Liquid temperature";
    AbsoluteTemperature Tv "Vapour temperature";
    AbsoluteTemperature Tm(start=Tmstart) "Wall temperature";
    AbsoluteTemperature Ts "Saturated wall temperature";
    Power Qmv "Heat flow from the metal to the vapour";
    Power Qml "Heat flow from the metal to the liquid";
    Power Qvl "Heat flow from the vapour to the liquid";
    LiquidDensity rhol "Liquid density";
    GasDensity rhov "Vapour density";
    DerDensityByPressure drvdp;
    DerDensityByPressure drldp;
    Real drvdh;
    Real drldh;
    Real xl "Mass fraction of vapour in the liquid";
    Real xv "Steam quality of the vapour";
    Length y "Level (zero at the boundary between lower and upper volumes)";
    Area Amv "Surface of the wall-vapour interface";
    Area Aml "Surface of the wall-liquid interface";
    Area Asurf "Surface of the liquid-vapour interface";
    Real dVvdy;
    Real dVldy;
    ThermoPower.Water.FlangeAOld feedwater annotation (Placement(transformation(
            extent={{-60,-34},{-26,0}}, rotation=0)));
    ThermoPower.Water.FlangeAOld riser annotation (Placement(transformation(
            extent={{26,-36},{62,-2}}, rotation=0)));
    ThermoPower.Water.FlangeBOld downcomer annotation (Placement(transformation(
            extent={{-62,-80},{-26,-44}}, rotation=0)));
    ThermoPower.Water.FlangeBOld blowdown annotation (Placement(transformation(
            extent={{26,-80},{62,-44}}, rotation=0)));
    ThermoPower.Water.FlangeBOld steam annotation (Placement(transformation(
            extent={{32,40},{68,76}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput HeatingPower annotation (Placement(
          transformation(extent={{-76,10},{-56,30}}, rotation=0)));
  equation
    Vv*(drvdp*der(p) + drvdh*der(hv)) + rhov*dVvdy*der(y) = wev - wv - wc - wcs
       + wh;
    Vl*(drldp*der(p) + drldh*der(hl)) + rhol*dVldy*der(y) = wf + wr + wc + wcs
       - wd - wb - wev - wh;
    rhov*Vv*(der(hv) - der(p)/rhov) = (wev - wcs)*(hvs - hv) - wc*(hls - hv) -
      wv*(hvout - hv) + Qmv - Qvl + wh*(hvs - hv);
    rhol*Vl*(der(hl) - der(p)/rhol) = wf*(hf - hl) + wr*(hr - hl) + wc*(hls -
      hl) + (wcs - wev)*(hvs - hl) - wd*(hd - hl) + Qvl - Qml;
    Cm*der(Tm) = -Qmv - Qml;
    wev = xl*rhol*Vl/tauev;
    wc = (1 - xv)*rhov*Vv/tauc;
    wcs = Kcs*Asurf*(Ts - Tl);
    wh = HeatingPower/(hvs - hl);
    Qmv = gmv*Amv*(Tm - Tv);
    Qml = gml*Aml*(Tm - Tl);
    Qvl = Ks*Asurf*(Tv - Ts);
    if hv >= hvs then
      xv = 1;
    else
      xv = (hv - hls)/(hvs - hls);
    end if;
    xl = if hl <= hls then 0 else (hl - hls)/(hvs - hls);
    if y <= 0 then
      Vl = Vlow + Alow*y;
      Vv = 2/3*pi*(Dup/2)^3 - Alow*y;
      Asurf = Alow;
    else
      Vl = Vlow + 2/3*pi*(Dup/2)^3 - Vv;
      Vv = 1/3*pi*(Dup/2 - y)^2*(Dup + y);
      Asurf = pi*((Dup/2)^2 - y^2);
    end if;
    dVldy = Asurf;
    dVvdy = -Asurf;
    Amv = 2*pi*(Dup/2)^2 "approx. value";
    Aml = 2*Alow "approx. value";
    // approx. value
    (Ts,hls,hvs) = ThermoPower.Water.propsat_p_th(p);
    (Tv,rhov,drvdp,drvdh) = ThermoPower.Water.prop_ph(p, hv);
    (Tl,rhol,drldp,drldh) = ThermoPower.Water.prop_ph(p, hl);
    feedwater.p = p;
    feedwater.w = wf;
    feedwater.hAB = hl;
    hf = if wf >= 0 then feedwater.hBA else hl;
    downcomer.p = p + rhol*g*ylow;
    downcomer.w = -wd;
    downcomer.hBA = hd;
    hd = if wd >= 0 then afd*hf + (1 - afd)*hl else downcomer.hAB;
    blowdown.p = p;
    blowdown.w = -wb;
    blowdown.hBA = hl;
    riser.p = p;
    riser.w = wr;
    riser.hAB = hl;
    if wr >= 0 then
      hr = riser.hBA;
    else
      hr = hl;
    end if;
    steam.p = p;
    steam.w = -wv;
    steam.hBA = hv;
    hvout = if wv >= 0 then hv else steam.hAB;
    annotation (
      Icon(graphics={Text(extent={{-110,2},{-64,-26}}, textString="Feed"),Text(
            extent={{-192,-40},{-62,-82}}, textString="Downcomer"),Text(extent=
            {{28,-80},{92,-120}}, textString="Blowdown"),Text(extent={{76,20},{
            138,-6}}, textString="Riser"),Text(extent={{16,104},{78,78}},
            textString="Steam"),Text(extent={{-144,56},{-46,28}}, textString=
            "Heating Power"),Polygon(
              points={{-60,0},{-58,16},{-50,34},{-36,48},{-26,54},{-16,58},{-6,
              60},{0,60},{10,60},{20,56},{30,52},{36,48},{46,40},{52,30},{56,22},
              {58,14},{60,6},{60,0},{-60,0}},
              lineColor={128,128,128},
              fillColor={159,191,223},
              fillPattern=FillPattern.Solid),Rectangle(
              extent={{-26,0},{26,-16}},
              lineColor={159,191,223},
              fillColor={159,191,223},
              fillPattern=FillPattern.Solid),Rectangle(extent={{-26,-16},{26,-70}},
            lineColor={0,0,255})}),
      Documentation(info="<HTML>
<p>This model describes the pressuriser for a nuclear reactor, and is very similar to the <tt>Drum</tt> model. The fluid properties in the liquid and steam volumes are homogeneous, but are not assumed at thermodynamic equilibrium. Connectors are provided for feedwater inlet, steam outlet, downcomer outlet, riser inlet, blowdown outlet and heating power inlet. Unused inlets and/or outlets can be \"plugged\" with a flowrate source or sink with zero flowrate.
<p>The model is based on dynamic mass and energy balance equations of the liquid volume and vapour volume inside the drum. Mass and energy tranfer between the two phases is provided by bulk condensation and surface condensation of the vapour phase, and by bulk boiling of the liquid phase. Additional energy transfer can take place at the surface if the steam is superheated. 
<p>The riser flowrate enters the liquid volume.
<p>The heating power supplied to the pressuriser produces saturated steam at a rate corresponding to the difference between the enthalpy of the liquid holdup and the enthalpy of saturated steam. For simplicity, the corresponding steam flow enters directly the steam holdup, without causing heating of the liquid holdup.
<p>The enthalpy of the liquid going to the downcomer is computed by assuming that a fraction of the total mass flowrate (<tt>afd</tt>) comes directly from the feedwater inlet.
<p>The metal wall dynamics is taken into account, assuming uniform temperature. Heat transfer takes place between the metal wall and the two phases, the corresponding heat transfer coefficients being <tt>gl</tt>, <tt>gv</tt>; the external surface is thermally insulated.
<p>The pressuriser geometry is a hemisphere having diameter <tt>Dup</tt> on top of a cylinder having volume <tt>Vlow</tt> and cross-section <tt>Alow</tt>. The zero reference for the liquid level is the boundary between the two shapes.
<p>The start values of vapour pressure, liquid specific enthalpy, vapour specific enthalpy, and metal wall temperature can be specified by setting the parameters <tt>pstart</tt>, <tt>hlstart</tt>, <tt>hvstart</tt>, <tt>Tmstart</tt>
<p><b>Revision history:</b></p>
<ul>
<li><i>2 Feb 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
        Energy and mass equation corrected; IRIS geometry added; Equations for phase separation at the riser inlet eliminated.</li>
<li><i>17 Dec 2003</i>
    by <a href=\"mailto:schiavo@elet.polimi.it\">Francesco Schiavo</a>:<br>
        First release, based on Drum model with Inlet heating power connector added.</li>
</ul>
</HTML>"),
      Diagram(graphics));
  end Pressuriser;

  model Flow1D2phDB_2
    "1-dimensional fluid flow model for 2-phase boiling flow (finite volumes, 2-phase, computation of heat transfer coeff.)"
    extends Water.Flow1D2ph(redeclare Thermal.DHThtc wall);
    parameter CoefficientOfHeatTransfer gamma_b=20000
      "Coefficient of heat transfer for boiling flow";
    parameter Real xCHF=0.9
      "Steam quality corresponding to the Critical Heat Flux";
    CoefficientOfHeatTransfer gamma[N] "Raw heat transfer coefficient";
    CoefficientOfHeatTransfer gamma_ls "H.t.c. just before bubble point";
    CoefficientOfHeatTransfer gamma_chf "H.t.c. just after CHF";
    CoefficientOfHeatTransfer gamma_corr[N]
      "Correction term to get smooth h.t.c.";
    SpecificEnthalpy hCHF "Enthalpy corresponding to the Critical Heat Flux";
    DynamicViscosity mu_ls "Dynamic viscosity at bubble point";
    DynamicViscosity mu_vs "Dynamic viscosity at dew point";
    ThermalConductivity k_ls "Thermal conductivity at bubble point";
    ThermalConductivity k_vs "Thermal conductivity at dew point";
    SpecificHeatCapacity cp_ls "Specific heat capacity at bubble point";
    SpecificHeatCapacity cp_vs "Specific heat capacity at dew point";
  protected
    SpecificEnthalpy h_B;
    Real csi;
    Boolean hasBoundary;
    CoefficientOfHeatTransfer gamma_nb;
    Integer n;
    Integer type_B[N] "1:NB-Bls; 2:B-NBls; 3:B-NBchf: 4:NB-Bchf";
    Real pos_B[N] "Normalised position of the boundary relative to the node";
    Integer n_B "Number of boil-noboil and noboil-boil boundaries";
    Integer node_B[N] "Node nearest to the boundary";
    Integer curr_type;
  equation
    hCHF = hl + xCHF*(hv - hl);
    if noEvent(min(h) < hv and max(h) > hl) then
      // Two-phase heat transfer takes place: compute properties
      // of saturated water and steam
      mu_ls = Medium.dynamicViscosity(bubble);
      k_ls = Medium.thermalConductivity(bubble);
      cp_ls = Medium.cp(bubble);
      mu_vs = Medium.dynamicViscosity(dew);
      k_vs = Medium.thermalConductivity(dew);
      cp_vs = Medium.cp(dew);
      // Compute the h.t.c. just outside the nucleate boiling region
      gamma_ls = Water.f_dittus_boelter(
          w,
          Dhyd,
          A,
          mu_ls,
          k_ls,
          cp_ls);
      gamma_chf = Water.f_dittus_boelter(
          w*xCHF,
          Dhyd,
          A,
          mu_vs,
          k_vs,
          cp_vs);
    else
      // dummy values
      mu_ls = 0;
      k_ls = 0;
      cp_ls = 0;
      mu_vs = 0;
      k_vs = 0;
      cp_vs = 0;
      gamma_ls = 0;
      gamma_chf = 0;
    end if;
    for j in 1:N loop
      if noEvent(h[j] < hl or h[j] > hv) then
        // Subcooled liquid or superheated steam: Dittus-Boelter's correlation
        gamma[j] = Water.f_dittus_boelter(
            w,
            Dhyd,
            A,
            Medium.dynamicViscosity(fluid[j].state, 1),
            Medium.thermalConductivity(fluid[j].state, 1),
            Medium.cp(fluid[j].state));
      elseif noEvent(h[j] > hCHF) then
        // Wet steam after dryout: Dittus-Boelter's correlation considering
        // only the vapour phase
        gamma[j] = Water.f_dittus_boelter(
            w*x[j],
            Dhyd,
            A,
            mu_vs,
            k_vs,
            cp_vs);
      else
        // Nucleate boiling: constant h.t.c.
        gamma[j] = gamma_b;
      end if;
    end for;
  algorithm
    // Smoothing of heat transfer coefficients if there are boiling boundaries is
    // in a neighbourhood of radius l/2 of each node with boiling condition
    gamma_corr := zeros(N);
    n_B := 0;
    // compute boundary types and positions
    for j in 1:(N - 1) loop
      hasBoundary := false;
      if (h[j] <= hl and h[j + 1] >= hl) then
        hasBoundary := true;
        h_B := hl;
        curr_type := 1;
      elseif (h[j] >= hl and h[j + 1] <= hl) then
        hasBoundary := true;
        h_B := hl;
        curr_type := 2;
      elseif (h[j] <= hCHF and h[j + 1] >= hCHF) then
        hasBoundary := true;
        h_B := hCHF;
        curr_type := 3;
      elseif (h[j] >= hCHF and h[j + 1] <= hCHF) then
        hasBoundary := true;
        h_B := hCHF;
        curr_type := 4;
      end if;
      if (hasBoundary) then
        n_B := n_B + 1;
        type_B[n_B] := curr_type;
        csi := abs((h[j] - h_B)/(h[j + 1] - h[j]));
        if (csi < 0.5) then
          pos_B[n_B] := csi;
          node_B[n_B] := j;
        else
          pos_B[n_B] := csi - 1;
          node_B[n_B] := j + 1;
        end if;
      end if;
    end for;
    // compute corrections to gamma in the nodes near the boundaries
    for j in 1:n_B loop
      n := node_B[j];
      if type_B[j] == 1 or type_B[j] == 2 then
        gamma_nb := gamma_ls;
      else
        gamma_nb := gamma_chf;
      end if;
      csi := if pos_B[j] < 0 then 0.5 + pos_B[j] else pos_B[j] - 0.5;
      if type_B[j] == 1 or type_B[j] == 4 then
        csi := -csi;
      end if;
      if n == 1 or n == N then
        csi := 2*csi;
      end if;
      gamma_corr[n] := gamma_corr[n] + csi*(gamma_b - gamma_nb);
    end for;
  equation
    wall.gamma = gamma + gamma_corr;
    annotation (Documentation(info="<HTML>
<p>This model extends <tt>Flow1D2ph</tt> by computing the distribution of the heat transfer coefficient <tt>gamma</tt> and making it available through an extended version of the <tt>wall</tt> connector.
<p>This simplified model can be used for one-phase or two-phase water/steam flow. The heat transfer coefficient is computed according to the following hypotheses:
<ul>
<li> If the fluid is subcooled liquid or superheated steam, Dittus-Boelter's correlation [1] is used.
<li> If the fluid is a two-phase mixture with a steam fraction less than the (constant) critical value <tt>xCHF</tt>, boiling heat transfer is assumed with a heat transfer coefficient equal to <tt>gamma_b</tt>.
<li> If the fluid is wet steam with a steam fraction greater than the (constant) critical value <tt>xCHF</tt>, the heat transfer coefficient is computed according to Dittus-Boelter's correlation, by considering only the steam fraction of the mixture.
</ul>
<p>A smoothing algorithm is applied to the nodes which are in the neighbourhood of a transition boundary between non-boiling and boiling conditions, to avoid non-physical sudden changes of the nodal values of the heat transfer coefficient when the transition boundary passes through a node. The computed values of the heat transfer coefficient are thus a continuous function of the nodal enthalpies and pressures, so that it is not necessary to generate events in order to handle discontinuities
<p><b>References</b></p>
<ol>
<li>J. C. Collier: <i>Convective Boiling and Condensation</i>, 2nd ed.,McGraw Hill, 1981, pp. 146.
</ol>
</HTML>", revisions="<html>
<ul>
<li><i>24 Sep 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>11 Feb 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Computation of the h.t.c. extended to all the thermodynamic conditions of the fluid.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end Flow1D2phDB_2;

  model Drum2States
    extends Icons.Water.Drum;
    replaceable package Medium =
        Modelica.Media.Interfaces.PartialTwoPhaseMedium;
    Medium.SaturationProperties sat;
    ThermoPower.Water.FlangeAOld feed annotation (Placement(transformation(
            extent={{-110,-64},{-70,-24}}, rotation=0)));
    ThermoPower.Water.FlangeBOld steam annotation (Placement(transformation(
            extent={{48,52},{88,92}}, rotation=0)));
    Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heat annotation (
        Placement(transformation(extent={{-28,-100},{28,-80}}, rotation=0)));
    parameter Volume Vd "Drum volume";
    parameter Volume Vr "Riser volume";
    parameter Volume Vdc "Downcomer volume";
    parameter Mass Mt "Total metal mass";
    parameter Mass Mr "Risers metal mass";
    parameter SpecificHeatCapacity Cp "Specific heat capacity of the metal";
    parameter Pressure pstart "Pressure start value";
    parameter Volume Vwtstart "Water volume start value";
    Real e11;
    Real e12;
    Real e21;
    Real e22;
    Volume Vt "Total volume";
    Volume Vwt(start=Vwtstart) "Total water volume";
    Volume Vst "Total steam volume";
    Pressure p(start=pstart) "Drum pressure";
    MassFlowRate qf "Feedwater mass flowrate";
    MassFlowRate qs "Steam mass flowrate";
    HeatFlowRate Q "Heat flow to the risers";
    SpecificEnthalpy hf "Feedwater specific enthalpy";
    SpecificEnthalpy hw "Specific enthalpy of saturated liquid";
    SpecificEnthalpy hs "Specific enthalpy of saturated steam";
    Temperature Ts "Saturation temperature";
    Density rhow "Density of saturated liquid";
    Density rhos "Density of saturated steam";
    Real drwdp;
    Real drsdp;
    Real dhwdp;
    Real dhsdp;
    Real dTdp;
  equation
    sat.psat = p;
    sat.Tsat = Medium.saturationTemperature(p);
    rhow = Medium.bubbleDensity(sat);
    rhos = Medium.dewDensity(sat);
    hw = Medium.bubbleEnthalpy(sat);
    hs = Medium.dewEnthalpy(sat);
    drwdp = Medium.dBubbleDensity_dPressure(sat);
    drsdp = Medium.dDewDensity_dPressure(sat);
    dhwdp = Medium.dBubbleEnthalpy_dPressure(sat);
    dhsdp = Medium.dDewEnthalpy_dPressure(sat);
    dTdp = 0;
    //Needs to be fixed!!! XXXXXXXXX
    e11*der(Vwt) + e12*der(p) = qf - qs;
    e21*der(Vwt) + e22*der(p) = Q + qf*hf - qs*hs;
    e11 = rhow - rhos;
    e12 = Vwt*drwdp + Vst*drsdp;
    e21 = rhow*hw - rhos*hs;
    e22 = Vwt*(hw*drwdp + rhow*dhwdp) + Vst*(hs*drsdp + rhos*dhsdp) - Vt + Mt*
      Cp*dTdp;
    Vt = Vd + Vr + Vdc;
    Vt = Vwt + Vst;
    p = feed.p;
    p = steam.p;
    hf = if feed.w >= 0 then feed.hBA else hw;
    feed.w = qf;
    -steam.w = qs;
    feed.hAB = hw;
    steam.hBA = hs;
    Q = heat.Q_flow;
    heat.T = Ts;
    annotation (
      Diagram(graphics),
      Documentation(info="<HTML>
<p>Simplified model of a drum for drum boilers. This model assumes thermodynamic equilibrium between the liquid and vapour volumes. The model has two state variables (i.e., pressure and liquid volume).
</HTML>", revisions="<html>
<ul>
<li><i>24 Sep 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>1 May 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Icon(graphics));
  end Drum2States;

  model PressDrop "Pressure drop for water/steam flows"
    extends Icons.Water.PressDrop;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
      "Medium model";
    Medium.BaseProperties fluid;
    parameter MassFlowRate wnom "Nominal mass flowrate";
    parameter Integer FFtype=0
      "Friction Factor Type (0: kfnom; 1:OpPoint; 2: Kinetic)";
    parameter Real Kfnom=0
      "Hydraulic resistance coefficient (DP=kfnom/rho*massflowrate^2/2)";
    parameter Pressure dpnom=0 "Nominal pressure drop";
    parameter Density rhonom=0 "Nominal density";
    parameter Real K=0 "Kinetic resistance coefficient (DP=K*rho*velocity^2/2)";
    parameter Area A=0 "Cross-section";
    parameter Real wnf=0.01
      "Fraction of nominal flow rate at which linear friction equals turbulent friction";
    parameter Real Kfc=1 "Friction factor correction coefficient";
    Real Kf;
    Real Kfl;
    Density rho "Fluid density";
    ThermoPower.Water.FlangeAOld inlet(w(start=wnom)) annotation (Placement(
          transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
    ThermoPower.Water.FlangeBOld outlet(w(start=-wnom)) annotation (Placement(
          transformation(extent={{80,-20},{120,20}}, rotation=0)));
  equation
    if FFtype == 0 then
      Kf = Kfnom*Kfc;
    elseif FFtype == 1 then
      Kf = dpnom*rhonom/wnom^2*Kfc;
    elseif FFtype == 2 then
      Kf = K/(2*A^2)*Kfc;
    end if;
    if inlet.w >= 0 then
      fluid.p = inlet.p;
      fluid.h = inlet.hBA;
    else
      fluid.p = outlet.p;
      fluid.h = outlet.hAB;
    end if;
    rho = fluid.d;
    Kfl = wnom*wnf*Kf;
    inlet.p - outlet.p = noEvent(Kf*abs(inlet.w) + Kfl)*inlet.w/rho;
    inlet.w + outlet.w = 0;
    inlet.hAB = outlet.hAB;
    inlet.hBA = outlet.hBA;
    annotation (Icon(graphics={Text(extent={{-100,-50},{100,-82}}, textString=
            "%name")}), Documentation(info="<HTML>
<p>The pressure drop across the inlet and outlet connectors is computed according to a turbulent friction model, i.e. is proportional to the squared velocity of the fluid. The friction coefficient can be specified directly, or by giving an operating point, or as a multiple of the kinetic pressure. The correction coefficient <tt>Kfc</tt> can be used to modify the friction coefficient, e.g. to fit some experimental operating point.</p>
<p>A small linear pressure drop is added to avoid numerical singularities at low or zero flowrate. The <tt>wnom</tt> parameter must be always specified; the additional linear pressure drop is such that it is equal to the turbulent pressure drop when the flowrate is equal to <tt>wnf*wnom</tt> (the default value is 1% of the nominal flowrate).
<p><b>Modelling options</b></p>
<p>The following options are available to specify the friction coefficient:
<ul><li><tt>FFtype = 0</tt>: the hydraulic friction coefficient <tt>Kfnom</tt> is used directly.</li>
<li><tt>FFtype = 1</tt>: the hydraulic friction coefficient is specified by the nominal operating point (<tt>wnom</tt>,<tt>dpnom</tt>, <tt>rhonom</tt>).</li>
<li><tt>FFtype = 2</tt>: the pressure drop is <tt>K</tt> times the kinetic pressure.</li></ul>
</HTML>", revisions="<html>
<ul>
<li><i>18 Jun 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end PressDrop;

  model Drum_explicit "Drum for circulation boilers"
    extends Icons.Water.Drum;
    replaceable package Medium = Water.StandardWater constrainedby
      Modelica.Media.Interfaces.PartialTwoPhaseMedium "Medium model";
    Medium.BaseProperties liquid;
    Medium.BaseProperties vapour;
    Medium.SaturationProperties sat;
    parameter Length rint=0 "Internal radius";
    parameter Length rext=0 "External radius";
    parameter Length L=0 "Length";
    parameter HeatCapacity Cm=0 "Total Heat Capacity of the metal wall";
    parameter Temperature Text=293 "External atmospheric temperature";
    parameter Time tauev=15 "Time constant of bulk evaporation";
    parameter Time tauc=15 "Time constant of bulk condensation";
    parameter Real Kcs=0 "Surface condensation coefficient [kg/(s.m^2.K)]";
    parameter Real Ks=0 "Surface heat transfer coefficient [W/(m^2.K)]";
    parameter CoefficientOfHeatTransfer gext=0
      "Heat transfer coefficient between metal wall and external atmosphere";
    parameter CoefficientOfHeatTransfer gl=200
      "Heat transfer coefficient between metal wall and liquid phase";
    parameter CoefficientOfHeatTransfer gv=200
      "Heat transfer coefficient between metal wall and vapour phase";
    parameter ThermalConductivity lm=20 "Metal wall thermal conductivity";
    parameter Real afd=0.05 "Ratio of feedwater in downcomer flowrate";
    parameter Real avr=1.2 "Phase separation efficiency coefficient";
    parameter Integer DrumOrientation=0 "0: Horizontal; 1: Vertical";
    parameter Pressure pstart=1e5 "Pressure start value";
    parameter SpecificEnthalpy hlstart=1e5 "Liquid enthalpy start value";
    parameter SpecificEnthalpy hvstart=2.78e6 "Vapour enthalpy start value";
    parameter Temperature Tmstart=300 "Metal wall temperature start value";
    parameter Length ystart=0 "Start level value";
    constant Real g=Modelica.Constants.g_n;
    constant Real pi=Modelica.Constants.pi;

    Volume Vv "Volume occupied by the vapour";
    Volume Vl "Volume occupied by the liquid";
    Pressure p(start=pstart, stateSelect=StateSelect.prefer) "Surface pressure";
    SpecificEnthalpy hl(start=hlstart, stateSelect=StateSelect.prefer)
      "Liquid specific enthalpy";
    SpecificEnthalpy hv(start=hvstart, stateSelect=StateSelect.prefer)
      "Vapour specific enthalpy";
    SpecificEnthalpy hrv "Specific enthalpy of vapour from the risers";
    SpecificEnthalpy hrl "Specific enthalpy of liquid from the risers";
    SpecificEnthalpy hls "Specific enthalpy of saturated liquid";
    SpecificEnthalpy hvs "Specific enthalpy of saturated vapour";
    SpecificEnthalpy hf "Specific enthalpy of feedwater";
    SpecificEnthalpy hd "Specific enthalpy of liquid to the downcomers";
    SpecificEnthalpy hvout "Specific enthalpy of steam at the outlet";
    SpecificEnthalpy hr "Specific enthalpy of fluid from the risers";
    MassFlowRate wf "Mass flowrate of feedwater";
    MassFlowRate wd "Mass flowrate to the downcomers";
    MassFlowRate wb "Mass flowrate of blowdown";
    MassFlowRate wr "Mass flowrate from the risers";
    MassFlowRate wrl "Mass flowrate of liquid from the risers";
    MassFlowRate wrv "Mass flowrate of vapour from the risers";
    MassFlowRate wv "Mass flowrate of steam at the outlet";
    MassFlowRate wc "Mass flowrate of bulk condensation";
    MassFlowRate wcs "Mass flowrate of surface condensation";
    MassFlowRate wev "Mass flowrate of bulk evaporation";
    AbsoluteTemperature Tl "Liquid temperature";
    AbsoluteTemperature Tv "Vapour temperature";
    AbsoluteTemperature Tm(start=Tmstart, stateSelect=StateSelect.prefer)
      "Wall temperature";
    AbsoluteTemperature Ts "Saturated water temperature";
    Power Qmv "Heat flow from the wall to the vapour";
    Power Qvl "Heat flow from the vapour to the liquid";
    Power Qml "Heat flow from the wall to the liquid";
    Power Qme "Heat flow from the wall to the atmosphere";
    Mass Ml "Liquid density";
    Mass Mv "Vapour density";
    Energy El "Liquid internal energy";
    Energy Ev "Vapour internal energy";
    LiquidDensity rhol "Liquid density";
    GasDensity rhov "Vapour density";
    Real xl "Mass fraction of vapour in the liquid volume";
    Real xv "Steam quality in the vapour volume";
    Real xr "Steam quality of the fluid from the risers";
    Real xrv "Steam quality of the separated steam from the risers";
    Real gml "Total heat transfer coefficient (wall-liquid)";
    Real gmv "Total heat transfer coefficient (wall-vapour)";
    Real a;
    Length y(start=ystart, stateSelect=StateSelect.prefer)
      "Level (referred to the centreline)";
    Area Aml "Surface of the wall-liquid interface";
    Area Amv "Surface of the wall-vapour interface";
    Area Asup "Surface of the liquid-vapour interface";
    Area Aext "External drum surface";
    ThermoPower.Water.FlangeAOld feedwater(redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{-114,-32},{-80,2}},
            rotation=0)));
    ThermoPower.Water.FlangeAOld riser(redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{60,-74},{96,-40}}, rotation
            =0)));
    ThermoPower.Water.FlangeBOld downcomer(redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{-88,-88},{-52,-52}},
            rotation=0)));
    ThermoPower.Water.FlangeBOld blowdown(redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{-18,-116},{18,-80}},
            rotation=0)));
    ThermoPower.Water.FlangeBOld steam(redeclare package Medium = Medium)
      annotation (Placement(transformation(extent={{40,52},{76,88}}, rotation=0)));
  equation
    der(Mv) = wrv + wev - wv - wc - wcs;
    der(Ml) = wf + wrl + wc + wcs - wd - wb - wev;
    Mv*der(hv) - der(p)*Vv = wrv*(hrv - hv) + (wev - wcs)*(hvs - hv) - wc*(hls
       - hv) - wv*(hvout - hv) + Qmv - Qvl;
    Ml*der(hl) - der(p)*Vl = wf*(hf - hl) + wrl*(hrl - hl) + wc*(hls - hl) + (
      wcs - wev)*(hvs - hl) - wd*(hd - hl) - wb*(hl - hl) + Qml + Qvl;
    Cm*der(Tm) = -Qml - Qmv - Qme;
    Mv = Vv*rhov;
    Ml = Vl*rhol;
    Ev = Mv*vapour.u;
    El = Ml*liquid.u;
    wev = xl*rhol*Vl/tauev;
    wc = (1 - xv)*rhov*Vv/tauc;
    wcs = Kcs*Asup*(Ts - Tl);
    Qme = gext*Aext*(Tm - Text);
    Qml = gml*Aml*(Tm - Tl);
    Qmv = gmv*Amv*(Tm - Tv);
    Qvl = Ks*Asup*(Tv - Ts);
    if hv >= hvs then
      xv = 1;
    else
      xv = (hv - hls)/(hvs - hls);
    end if;
    xl = if hl <= hls then 0 else (hl - hls)/(hvs - hls);
    gml = 1/(1/gl + a*rint/lm);
    gmv = 1/(1/gv + a*rint/lm);
    a = rext^2/(rext^2 - rint^2)*log(rext/rint) - 0.5;
    if DrumOrientation == 0 then
      Vl = L*(rint^2*acos(-y/rint) + y*sqrt(rint^2 - y^2));
      Aml = 2*Vl/L + 2*rint*acos(-y/rint)*L;
      Asup = 2*sqrt(rint^2 - y^2)*L;
    else
      Vl = pi*rint^2*(y + L/2);
      Aml = pi*rint^2 + 2*pi*rint*(y + L/2);
      Asup = pi*rint^2;
    end if;
    Vv = pi*rint^2*L - Vl;
    Amv = 2*pi*rint*L + 2*pi*rint^2 - Aml;
    liquid.p = p;
    liquid.h = hl;
    Tl = liquid.T;
    rhol = liquid.d;
    vapour.p = p;
    vapour.h = hv;
    Tv = vapour.T;
    rhov = vapour.d;
    sat.psat = p;
    sat.Tsat = Medium.saturationTemperature(p);
    hls = Medium.bubbleEnthalpy(sat);
    hvs = Medium.dewEnthalpy(sat);
    Ts = sat.Tsat;
    feedwater.p = p;
    feedwater.w = wf;
    feedwater.hAB = hl;
    hf = if wf >= 0 then feedwater.hBA else hl;
    downcomer.p = p + rhol*g*y;
    downcomer.w = -wd;
    downcomer.hBA = hd;
    hd = if wd >= 0 then afd*hf + (1 - afd)*hl else downcomer.hAB;
    blowdown.p = p;
    blowdown.w = -wb;
    blowdown.hBA = hl;
    riser.p = p;
    riser.w = wr;
    riser.hAB = hl;
    hrv = hls + xrv*(hvs - hls);
    xrv = 1 - (rhov/rhol)^avr;
    if wr >= 0 then
      hr = riser.hBA;
      if hr > hls then
        xr = (hr - hls)/(hvs - hls);
        hrl = hls;
      else
        xr = 0;
        hrl = hr;
      end if;
      wrv = xr*wr/xrv;
      wrl = wr - wrv;
    else
      hr = hl;
      hrl = hl;
      xr = xl;
      wrv = 0;
      wrl = wr;
    end if;
    steam.p = p;
    steam.w = -wv;
    steam.hBA = hv;
    hvout = if wv >= 0 then hv else steam.hAB;
    Aext = 2*pi*rext^2 + 2*pi*rext*L;
    annotation (Icon(graphics={Text(extent={{-150,26},{-78,0}}, textString=
            "Feed"),Text(extent={{-180,-34},{-66,-58}}, textString="Downcomer"),
            Text(extent={{-38,-102},{46,-142}}, textString="Blowdown"),Text(
            extent={{52,-22},{146,-40}}, textString="Risers"),Text(extent={{-22,
            100},{50,80}}, textString="Steam")}), Documentation(info="<HTML>
<p>This model describes the cylindrical drum of a drum boiler, without assuming thermodynamic equilibrium between the liquid and vapour holdups. Connectors are provided for feedwater inlet, steam outlet, downcomer outlet, riser inlet, and blowdown outlet.
<p>The model is based on dynamic mass and energy balance equations of the liquid volume and vapour volume inside the drum. Mass and energy tranfer between the two phases is provided by bulk condensation and surface condensation of the vapour phase, and by bulk boiling of the liquid phase. Additional energy transfer can take place at the surface if the steam is superheated.
<p>The riser flowrate is separated before entering the drum, at the vapour pressure. The (saturated) liquid fraction goes into the liquid volume; the (wet) vapour fraction goes into the vapour volume, vith a steam quality depending on the liquid/vapour density ratio and on the <tt>avr</tt> parameter.
<p>The enthalpy of the liquid going to the downcomer is computed by assuming that a fraction of the total mass flowrate (<tt>afd</tt>) comes directly from the feedwater inlet. The pressure at the downcomer connector is equal to the vapour pressure plus the liquid head.
<p>The metal wall dynamics is taken into account, assuming uniform temperature. Heat transfer takes place between the metal wall and the liquid phase, vapour phase, and external atmosphere, the corresponding heat transfer coefficients being <tt>gl</tt>, <tt>gv</tt>, and <tt>gext</tt>.
<p>The drum level is referenced to the centreline.
<p>The start values of drum pressure, liquid specific enthalpy, vapour specific enthalpy, and metal wall temperature can be specified by setting the parameters <tt>pstart</tt>, <tt>hlstart</tt>, <tt>hvstart</tt>, <tt>Tmstart</tt>
<p><b>Modelling options</b></p>
<p>The following options are available to specify the orientation of the cylindrical drum:
<ul><li><tt>DrumOrientation = 0</tt>: horizontal axis.
<li><tt>DrumOrientation = 1</tt>: vertical axis.
</ul>
</HTML>", revisions="<html>
<ul>
<li><i>16 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Standard medium definition added.</li>
<li><i>5 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>1 Feb 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Improved equations for drum geometry.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
"));
  end Drum_explicit;

  model Header_explicit "Header with metal walls for water/steam flows"
    extends Icons.Water.Mixer;
    replaceable package Medium = Water.StandardWater constrainedby
      Modelica.Media.Interfaces.PartialMedium "Medium model";
    Medium.BaseProperties fluid(p(start=pstartout),h(start=hstart));
    parameter Volume V "Inner volume";
    parameter Area S=0 "Inner surface";
    parameter Position H=0 "Elevation of outlet over inlet"
      annotation (Evaluate=true);
    parameter CoefficientOfHeatTransfer gamma=0 "Heat Transfer Coefficient";
    parameter HeatCapacity Cm=0 "Metal Heat Capacity";
    parameter Pressure pstartin=1.01325e5 "Inlet pressure start value";
    parameter Pressure pstartout=1.01325e5 "Outlet pressure start value";
    parameter SpecificEnthalpy hstart=1e5 "Specific enthalpy start value";
    parameter AbsoluteTemperature Tmstart=300 "Metal wall start temperature";
    ThermoPower.Water.FlangeAOld inlet(
      p(start=pstartin),
      hAB(start=hstart),
      redeclare package Medium = Medium) annotation (Placement(transformation(
            extent={{-122,-20},{-80,20}}, rotation=0)));
    ThermoPower.Water.FlangeBOld outlet(
      p(start=pstartout),
      hBA(start=hstart),
      redeclare package Medium = Medium) annotation (Placement(transformation(
            extent={{80,-20},{120,20}}, rotation=0)));
    Medium.AbsolutePressure p(start=pstartout, stateSelect=if Medium.singleState
           then StateSelect.avoid else StateSelect.prefer)
      "Fluid pressure at the outlet";
    Medium.SpecificEnthalpy h(start=hstart, stateSelect=StateSelect.prefer)
      "Fluid specific enthalpy";
    Medium.SpecificEnthalpy hi;
    Medium.SpecificEnthalpy ho;
    Mass M "Fluid mass";
    Energy E "Fluid energy";
    Medium.Temperature T "Fluid temperature";
    AbsoluteTemperature Tm(start=Tmstart) "Wall temperature";
    Time Tr "Residence time";
  equation
    fluid.p = p;
    fluid.h = h;
    fluid.T = T;
    M = fluid.d*V;
    E = M*fluid.u;
    der(M) = inlet.w + outlet.w;
    M*der(h) - der(p)*V = inlet.w*(hi - h) + outlet.w*(ho - h) - gamma*S*(T -
      Tm);
    if Cm > 0 then
      Cm*der(Tm) = gamma*S*(T - Tm);
    else
      Tm = T;
    end if;
    hi = if inlet.w >= 0 then inlet.hBA else h;
    ho = if outlet.w >= 0 then outlet.hAB else h;
    inlet.hAB = h;
    outlet.hBA = h;
    inlet.p = p + fluid.d*Modelica.Constants.g_n*H;
    outlet.p = p;
    Tr = noEvent(M/max(inlet.w, Modelica.Constants.eps));
    annotation (Icon(graphics), Documentation(info="<HTML>
<p>This model describes a constant volume header with metal walls. The fluid can be water, steam, or a two-phase mixture. The metal wall temperature and the heat transfer coefficient between the wall and the fluid are uniform. The wall is thermally insulated from the outside.</p>
<p>If the inlet or the outlet are connected to a bank of tubes, the model can actually represent a collector or a distributor (or both).</p>
</HTML>", revisions="<html>
<ul>
<li><i>16 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Standard medium definition added.</li>
<li><i>28 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Added head between inlet and outlet.</li>
<li><i>7 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Changed name from <tt>Collector</tt> to <tt>Header</tt>.</li>
<li><i>18 Jun 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end Header_explicit;

  package HRB_Old "Heat recovery boiler models"
    model HRB "Heat recovery boiler model"
      constant Real pi=Modelica.Constants.pi;
      replaceable package WaterMedium = Water.StandardWater constrainedby
        Modelica.Media.Interfaces.PartialMedium;
      replaceable package GasMedium =
          Modelica.Media.Interfaces.PartialMixtureMedium;
      parameter GasMedium.MassFraction Xnom[GasMedium.nX];
      parameter Integer Nr=2 "Number of tube rows";
      parameter Integer Nt=2 "Number of parallel tubes in each row";
      parameter Length Lt "Length of a tube in a row";
      parameter Length Dint "Internal diameter of each tube";
      parameter Length Dext "External diameter of each tube";
      parameter Density rhom "Density of the tube metal walls";
      parameter SpecificHeatCapacity cm
        "Specific heat capacity of the tube metal walls";
      parameter Area Sb "Cross-section of the boiler";
      parameter Length Lb "Length of the boiler";
      parameter Area St=Dext*pi*Lt*Nt*Nr
        "Total area of the heat exchange surface";
      Water.Flow1DDB WaterSide(
        redeclare package Medium = WaterMedium,
        Nt=Nt,
        A=pi*Dint^2/4,
        omega=pi*Dint,
        Dhyd=Dint,
        wnom=20,
        FFtype=2,
        Cfnom=0.005,
        L=Lt*Nr,
        N=Nr + 1) annotation (Placement(transformation(extent={{-12,-40},{8,-20}},
              rotation=0)));
      Thermal.ConvHT_htc WaterMetalHT(N=Nr + 1) annotation (Placement(
            transformation(extent={{-12,-2},{8,-22}}, rotation=0)));
      Thermal.MetalTube TubeWalls(
        rint=Dint/2,
        rext=Dext/2,
        rhomcm=rhom*cm,
        lambda=20,
        L=Lt*Nr,
        N=Nr + 1) "Tube" annotation (Placement(transformation(extent={{-12,16},
                {8,-4}}, rotation=0)));
      Flow1DGasHT GasSide(
        redeclare package Medium = GasMedium,
        L=Lb,
        omega=St/Lb,
        wnom=10,
        FFtype=0,
        Xstart=Xnom,
        Khtc=100,
        A=Sb,
        Dhyd=St/Lb,
        N=Nr + 1) annotation (Placement(transformation(extent={{8,64},{-14,44}},
              rotation=0)));
      ThermoPower.Gas.FlangeAOld gasInlet(redeclare package Medium = GasMedium)
        annotation (Placement(transformation(extent={{80,40},{100,60}},
              rotation=0)));
      ThermoPower.Gas.FlangeBOld gasOutlet(redeclare package Medium = GasMedium)
        annotation (Placement(transformation(extent={{-100,40},{-80,60}},
              rotation=0)));
      ThermoPower.Water.FlangeAOld waterInlet(redeclare package Medium =
            WaterMedium) annotation (Placement(transformation(extent={{-100,-60},
                {-80,-40}}, rotation=0)));
      ThermoPower.Water.FlangeBOld waterOutlet(redeclare package Medium =
            WaterMedium) annotation (Placement(transformation(extent={{80,-60},
                {100,-40}}, rotation=0)));
      Thermal.CounterCurrent CounterCurrent1(N=Nr + 1) annotation (Placement(
            transformation(extent={{-12,16},{8,36}}, rotation=0)));
      Thermal.ConvHT_htc ConvHT_htc1(N=Nr + 1) annotation (Placement(
            transformation(extent={{-12,30},{8,50}}, rotation=0)));
    equation
      connect(WaterMetalHT.fluidside, WaterSide.wall)
        annotation (Line(points={{-2,-15},{-2,-25}}, color={0,0,255}));
      connect(TubeWalls.int, WaterMetalHT.otherside)
        annotation (Line(points={{-2,3},{-2,-8.9}}, color={255,127,0}));
      connect(TubeWalls.ext, TubeWalls.int) annotation (Line(points={{-2,9.1},{
              -2,8},{0,8},{2,6},{-2,6},{-2,3}}, color={255,127,0}));
      connect(waterInlet, WaterSide.infl)
        annotation (Line(points={{-90,-50},{-56,-50},{-56,-30},{-12,-30}}));
      connect(WaterSide.outfl, waterOutlet)
        annotation (Line(points={{8,-30},{52,-30},{52,-50},{90,-50}}));
      connect(gasOutlet, GasSide.outfl) annotation (Line(points={{-90,50},{-58,
              50},{-58,54},{-14,54}}, color={159,159,223}));
      connect(GasSide.infl, gasInlet) annotation (Line(points={{8,54},{52,54},{
              52,50},{90,50}}, color={159,159,223}));
      connect(CounterCurrent1.side2, TubeWalls.ext)
        annotation (Line(points={{-2,22.9},{-2,9.1}}, color={255,127,0}));
      connect(CounterCurrent1.side1, ConvHT_htc1.otherside)
        annotation (Line(points={{-2,29},{-2,36.9}}, color={255,127,0}));
      connect(ConvHT_htc1.fluidside, GasSide.wall) annotation (Line(points={{-2,
              43},{-2,46.5},{-3,46.5},{-3,49}}, color={0,0,255}));
      annotation (
        Diagram(graphics),
        Icon(graphics={Rectangle(
                  extent={{-80,80},{80,-80}},
                  lineColor={255,0,0},
                  lineThickness=0.5,
                  fillColor={255,128,0},
                  fillPattern=FillPattern.Solid),Line(
                  points={{-60,62},{62,-60},{62,-60}},
                  color={255,0,0},
                  thickness=1),Line(
                  points={{62,60},{-60,-60}},
                  color={255,0,0},
                  thickness=1)}),
        Documentation(revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
", info="<html>
This is the model of a very simple heat recovery boiler. The modelling assumptions are as follows:
<ul>
<li> The boiler contains <tt>Nr</tt> rows of tubes, connected in series; each one is made of <tt>Nt</tt> identical tubes in parallel. 
<li>Each tube has a length <tt>L</tt>, internal and external diameters <tt>Dint</tt> and <tt>Dext</tt>, and is made of a metal having density <tt>rhom</tt> and a specific heat capacity of <tt>cm</tt>. 
<li>The series connection of the tubes is discretised with <tt>Nr+1</tt> nodes, so that each cell between two nodes corresponds to a single row.
<li>The gas flow is also discretised with <tt>Nr+1</tt> nodes, so that each gas cell interacts with a single tube row. Temperature differences are of course averaged.
<li>The gas flows through a volume having a (net) cross-section <tt>Sb</tt> and a (net) lenght <tt>Lb</tt>. 
<li>Mass and energy dynamic balances are assumed for both the water and the gas sides.
<li>The fluid in the water side remains liquid throughout the boiler.
<li>The internal heat transfer coefficient is computed by Dittus-Boelter's correlation.
<li>The external heat transfer coefficient is computed according to the simple law written in <tt>Flow1DGasHT</tt>. It would of course be possible to use a different component, extending <tt>Gas.Flow1D</tt> and containing more sophisticated laws to compute the h.t.c.
</ul>
</html>"));
    end HRB;

    model Flow1DGasHT "Gas flow model with h.t.c. computation"
      extends Gas.Flow1Dfv(redeclare Thermal.DHThtc wall);
      parameter CoefficientOfHeatTransfer Khtc(fixed=false) = 100;
    equation
      for i in 1:N loop
        wall.gamma[i] = Khtc*(w/wnom)^0.6;
      end for;
      annotation (Documentation(revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
", info="<html>
This model extends <tt>Gas.Flow1D</tt> by adding the computation of the heat transfer coefficient, which is proportional to the mass flow rate, raised to the power of 0.6.
</html>"));
    end Flow1DGasHT;

    model Plant "Simple plant model with HRB"
      package GasMedium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;
      parameter GasMedium.MassFraction Xnom[GasMedium.nX]={0.75,0.25};
      HRB Boiler(
        redeclare package GasMedium = GasMedium,
        Xnom=Xnom,
        Nr=10,
        Nt=100,
        Lt=3,
        Dint=0.01,
        Dext=0.012,
        rhom=7800,
        cm=650,
        Sb=8,
        Lb=2) annotation (Placement(transformation(extent={{-18,14},{18,50}},
              rotation=0)));
      Water.ValveLin ValveLin1(Kv=20/4e5) annotation (Placement(transformation(
              extent={{52,20},{72,0}}, rotation=0)));
      Water.SinkP SinkP1(p0=1e5) annotation (Placement(transformation(extent={{
                82,0},{102,20}}, rotation=0)));
      Gas.SourceW SourceW2(
        w0=10,
        redeclare package Medium = GasMedium,
        Xnom=Xnom,
        p0=1e5,
        T=670) annotation (Placement(transformation(extent={{102,52},{82,72}},
              rotation=0)));
      Gas.SinkP SinkP2(
        redeclare package Medium = GasMedium,
        T=300,
        Xnom=Xnom) annotation (Placement(transformation(extent={{-78,44},{-98,
                64}}, rotation=0)));
      Modelica.Blocks.Sources.Step ValveWaterOpening(
        offset=1,
        startTime=1,
        height=-0.1) annotation (Placement(transformation(extent={{-20,-40},{0,
                -20}}, rotation=0)));
      Gas.PressDropLin PressDropLin1(redeclare package Medium = GasMedium, R=
            1000/10) annotation (Placement(transformation(extent={{-48,44},{-68,
                64}}, rotation=0)));
      Water.SensT TinWater annotation (Placement(transformation(extent={{-66,2},
                {-46,22}}, rotation=0)));
      Water.SensT ToutWater annotation (Placement(transformation(extent={{28,4},
                {48,24}}, rotation=0)));
      Gas.SensT ToutGas(redeclare package Medium = GasMedium) annotation (
          Placement(transformation(extent={{-20,48},{-40,68}}, rotation=0)));
      Gas.SensT TinGas(redeclare package Medium = GasMedium) annotation (
          Placement(transformation(extent={{70,56},{50,76}}, rotation=0)));
      Water.SourceP SourceP1(p0=5e5) annotation (Placement(transformation(
              extent={{-100,-2},{-80,18}}, rotation=0)));
    equation
      connect(ValveLin1.outlet, SinkP1.flange)
        annotation (Line(points={{72,10},{82,10}}));
      connect(ValveWaterOpening.y, ValveLin1.cmd)
        annotation (Line(points={{1,-30},{62,-30},{62,2}}, color={0,0,127}));
      connect(SinkP2.flange, PressDropLin1.outlet)
        annotation (Line(points={{-78,54},{-68,54}}, color={159,159,223}));
    initial equation
      // Boiler.GasSide.Khtc=250;
      ToutGas.T = 330;
      der(Boiler.GasSide.p) = 0;
      der(Boiler.GasSide.Ttilde) = zeros(size(Boiler.GasSide.Ttilde, 1));
      der(Boiler.GasSide.Xtilde) = zeros(size(Boiler.GasSide.Xtilde, 1), size(
        Boiler.GasSide.Xtilde, 2));
      der(Boiler.TubeWalls.T) = zeros(size(Boiler.TubeWalls.T, 1));
      der(Boiler.WaterSide.htilde) = zeros(size(Boiler.WaterSide.htilde, 1));
      der(Boiler.WaterSide.p) = 0;
    equation
      connect(TinGas.inlet, SourceW2.flange)
        annotation (Line(points={{66,62},{82,62}}, color={159,159,223}));
      connect(TinGas.outlet, Boiler.gasInlet) annotation (Line(points={{54,62},
              {42,62},{42,41},{16.2,41}}, color={159,159,223}));
      connect(PressDropLin1.inlet, ToutGas.outlet)
        annotation (Line(points={{-48,54},{-36,54}}, color={159,159,223}));
      connect(ToutGas.inlet, Boiler.gasOutlet) annotation (Line(points={{-24,54},
              {-20,54},{-20,41},{-16.2,41}}, color={159,159,223}));
      connect(TinWater.outlet, Boiler.waterInlet)
        annotation (Line(points={{-50,8},{-32,8},{-32,23},{-16.2,23}}));
      connect(ToutWater.outlet, ValveLin1.inlet)
        annotation (Line(points={{44,10},{52,10}}));
      connect(Boiler.waterOutlet, ToutWater.inlet)
        annotation (Line(points={{16.2,23},{23.1,23},{23.1,10},{32,10}}));
      connect(SourceP1.flange, TinWater.inlet)
        annotation (Line(points={{-80,8},{-62,8}}));
      annotation (
        Diagram(graphics),
        Documentation(revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
", info="<html>
Very simple plant model, providing boundary conditions to the <tt>HRB</tt> model.
</html>"),
        experiment(
          StopTime=1200,
          NumberOfIntervals=1000,
          Tolerance=1e-007));
    end Plant;
    annotation (Documentation(revisions="", info="<html>
This package contains models of Heat Recovery Boilers
</html>"));
  end HRB_Old;
end Old;
