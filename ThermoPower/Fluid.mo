package Fluid "Modelica_Fluid compatible components" 
  extends Modelica.Icons.Library;
  package Water 
    model SourceW "Flowrate source for water/steam flows" 
      import ThermoPower;
      extends Icons.Water.SourceW;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
      parameter MassFlowRate w0=0 "Nominal mass flowrate";
      parameter Pressure p0=1e5 "Nominal pressure";
      parameter HydraulicConductance G=0 "Hydraulic conductance";
      parameter SpecificEnthalpy h=1e5 "Nominal specific enthalpy";
      MassFlowRate w "Mass flowrate";
      Modelica_Fluid.Interfaces.FluidPort_b flange(redeclare package Medium = 
            Medium)  annotation (extent=[80, -20; 120, 20]);
      Modelica.Blocks.Interfaces.RealInput in_w0 
        annotation (extent=[-60, 40; -20, 80], rotation=-90);
      Modelica.Blocks.Interfaces.RealInput in_h 
        annotation (extent=[20, 40; 60, 80], rotation=-90);
    equation 
      if G == 0 then
        flange.m_flow = -w;
      else
        flange.m_flow = -w + (flange.p - p0)*G;
      end if;
      if cardinality(in_w0) == 0 then
        w = w0;
        in_w0         = 0;
      else
        w =in_w0;
      end if;
      if cardinality(in_h)==0 then
        flange.H_flow = semiLinear(flange.m_flow,flange.h,h);
        in_h          = 0;
      else
        flange.H_flow = semiLinear(flange.m_flow,flange.h,in_h);
      end if;
      annotation (
        Icon(Text(extent=[-98, 74; -48, 42], string="w0"), Text(extent=[48, 74;
                 98, 42], string="h")),
        Diagram,
        Documentation(info="<HTML>
<p><b>Modelling options</b></p>
<p>If <tt>G</tt> is set to zero, the flowrate source is ideal; otherwise, the outgoing flowrate decreases proportionally to the outlet pressure.</p>
<p>If the <tt>in_w0</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>p0</tt>.</p>
<p>If the <tt>in_h</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>h</tt>.</p>
</HTML>", revisions="<html>
<ul>
<li><i>11 July 2005</i>
    by <a href=\"mailto:jonas.eborn@modelon.se\">Jonas Eborn</a>:<br>
       Updated to Modelica.Fluid connectors.</li>
<li><i>18 Jun 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>p0_fix</tt> and <tt>hfix</tt>; the connection of external signals is now detected automatically.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    end SourceW;
    
    model SourceP "Pressure source for water/steam flows" 
      extends Icons.Water.SourceP;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
      parameter Pressure p0=1.01325e5 "Nominal pressure";
      parameter HydraulicResistance R=0 "Hydraulic resistance";
      parameter SpecificEnthalpy h=1e5 "Nominal specific enthalpy";
      Pressure p "Actual pressure";
      Modelica_Fluid.Interfaces.FluidPort_b flange(redeclare package Medium = 
            Medium)  annotation (extent=[80, -20; 120, 20]);
      Modelica.Blocks.Interfaces.RealInput in_p0 
        annotation (extent=[-60, 72; -20, 112], rotation=-90);
      Modelica.Blocks.Interfaces.RealInput in_h 
        annotation (extent=[20, 70; 60, 110], rotation=-90);
    equation 
      if R == 0 then
        flange.p = p;
      else
        flange.p = p + flange.m_flow*R;
      end if;
      if cardinality(in_p0)==0 then
        p = p0;
        in_p0           = 0;
      else
        p =in_p0;
      end if;
      if cardinality(in_h)==0 then
        flange.H_flow = semiLinear(flange.m_flow,flange.h,h);
        in_h           = 0;
      else
        flange.H_flow = semiLinear(flange.m_flow,flange.h,in_h);
      end if;
      annotation (
        Diagram,
        Icon(Text(extent=[-106, 90; -52, 50], string="p0"), Text(extent=[66, 90;
                 98, 52], string="h")),
        Documentation(info="<HTML>
<p><b>Modelling options</b></p>
<p>If <tt>R</tt> is set to zero, the pressure source is ideal; otherwise, the outlet pressure decreases proportionally to the outgoing flowrate.</p>
<p>If the <tt>in_p0</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>p0</tt>.</p>
<p>If the <tt>in_h</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>h</tt>.</p>
</HTML>", revisions="<html>
<ul>
<li><i>18 Jun 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>p0_fix</tt> and <tt>hfix</tt>; the connection of external signals is now detected automatically.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    end SourceP;
    
    model SinkP "Pressure sink for water/steam flows" 
      extends Icons.Water.SourceP;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
      parameter Pressure p0=1.01325e5 "Nominal pressure";
      parameter HydraulicResistance R=0 "Hydraulic resistance";
      parameter SpecificEnthalpy h=1e5 "Nominal specific enthalpy";
      Pressure p;
      Modelica_Fluid.Interfaces.FluidPort_a flange(redeclare package Medium = 
            Medium)  annotation (extent=[-120, -20; -80, 20]);
      Modelica.Blocks.Interfaces.RealInput in_p0 
        annotation (extent=[-60, 68; -20, 108], rotation=-90);
      Modelica.Blocks.Interfaces.RealInput in_h 
        annotation (extent=[20, 68; 60, 108], rotation=-90);
    equation 
      if R == 0 then
        flange.p = p;
      else
        flange.p = p + flange.m_flow*R;
      end if;
      if cardinality(in_p0)==0 then
        p = p0;
        in_p0           = 0;
      else
        p =in_p0;
      end if;
      if cardinality(in_h)==0 then
        flange.H_flow = semiLinear(flange.m_flow,flange.h,h);
        in_h           = 0;
      else
        flange.H_flow = semiLinear(flange.m_flow,flange.h,in_h);
      end if;
      annotation (
        Icon(Text(extent=[-106, 92; -56, 50], string="p0"), Text(extent=[54, 94;
                 112, 52], string="h")),
        Diagram,
        Documentation(info="<HTML>
<p><b>Modelling options</b></p>
<p>If <tt>R</tt> is set to zero, the pressure sink is ideal; otherwise, the inlet pressure increases proportionally to the incoming flowrate.</p>
<p>If the <tt>in_p0</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>p0</tt>.</p>
<p>If the <tt>in_h</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>h</tt>.</p>
</HTML>", revisions="<html>
<ul>
<li><i>18 Jun 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>p0_fix</tt> and <tt>hfix</tt>; the connection of external signals is now detected automatically.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    end SinkP;
    
  partial model Flow1DBase 
      "Basic interface for 1-dimensional water/steam fluid flow models" 
    replaceable package Medium = Modelica.Media.Water.StandardWater extends 
        Modelica.Media.Interfaces.PartialMedium "Medium model";
    extends Icons.Water.Tube;
    import ThermoPower.Choices.Flow1D.FFtypes;
    parameter Integer N(min=2) = 2 "Number of nodes for thermal variables";
    parameter Integer Nt=1 "Number of tubes in parallel";
    parameter Distance L "Tube length" annotation(Evaluate=true);
    parameter Position H=0 "Elevation of outlet over inlet";
    parameter Area A "Cross-sectional area (single tube)";
    parameter Length omega "Perimeter of heat transfer surface (single tube)";
    parameter Length Dhyd "Hydraulic Diameter (single tube)";
    parameter MassFlowRate wnom "Nominal mass flowrate (total)";
    parameter FFtypes.Temp FFtype "Friction Factor Type" annotation(Evaluate = true);
    parameter Real Kfnom(unit = "Pa.kg/m^3/(kg/s)^2", min=0)=0 
        "Nominal hydraulic resistance coefficient";
    parameter Pressure dpnom=0 "Nominal pressure drop (friction term only!)";
    parameter Density rhonom=0 "Nominal inlet density";
    parameter Real Cfnom=0 "Nominal Fanning friction factor";
    parameter Real e=0 "Relative roughness (ratio roughness/diameter)";
    parameter Boolean DynamicMomentum=false "Inertial phenomena accounted for" annotation(Evaluate = true);
    parameter Integer HydraulicCapacitance=2 "1: Upstream, 2: Downstream";
    parameter SpecificEnthalpy hstartin=1e5 "Inlet enthalpy start value";
    parameter SpecificEnthalpy hstartout=1e5 "Outlet enthalpy start value";
    parameter Pressure pstartin=1e5 "Inlet pressure start value";
    parameter Pressure pstartout=1e5 "Outlet pressure start value";
    parameter Real wnf=0.01 
        "Fraction of nominal flow rate at which linear friction equals turbulent friction";
    parameter Real Kfc=1 "Friction factor correction coefficient";
    parameter Choices.Init.Options.Temp initOpt=Choices.Init.Options.noInit 
        "Initialisation option";
    constant Real g=Modelica.Constants.g_n;
    Modelica_Fluid.Interfaces.FluidPort_a infl(p(start=pstartin),
      m_flow(start=wnom),h(start=hstartin), redeclare package Medium = Medium) 
                 annotation (extent=[-120, -20; -80, 20]);
    Modelica_Fluid.Interfaces.FluidPort_b outfl(p(start=pstartout),
      m_flow(start=-wnom),h(start=hstartout), redeclare package Medium = Medium) 
                  annotation (extent=[80, -20; 120, 20]);
    replaceable ThermoPower.Thermal.DHT wall(N=N) 
      annotation (extent=[-40, 40; 40, 60]);
    Power Q "Total heat flow through the lateral boundary (all Nt tubes)";
    Time Tr "Residence time";
    protected 
    parameter Real dzdx = H/L "Slope" annotation(Evaluate=true);
    parameter Length l = L/(N - 1) "Length of a single volume" annotation(Evaluate = true);
    annotation (Documentation(info="<HTML>
Basic interface of the <tt>Flow1D</tt> models, containing the common parameters and connectors.
</HTML>
", revisions="<html>
<ul>
<li><i>11 July 2005</i>
    by <a href=\"mailto:jonas.eborn@modelon.se\">Jonas Eborn</a>:<br>
       Updated to Modelica.Fluid connectors.</li>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>24 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       <tt>FFtypes</tt> package and <tt>NoFriction</tt> option added.</li>
<li><i>16 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Standard medium definition added.</li>
<li><i>8 Oct 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Created.</li>
</ul>
</html>"));
  end Flow1DBase;
    
  model Flow1D2ph 
      "1-dimensional fluid flow model for water/steam (finite volumes, 2-phase)" 
    extends Flow1DBase(redeclare replaceable package Medium = 
                       Modelica.Media.Water.StandardWater extends 
          Modelica.Media.Interfaces.PartialTwoPhaseMedium "Medium model");
    import ThermoPower.Choices.Flow1D.FFtypes;
    package SmoothMedium=Medium(final smoothModel = true);
    constant Pressure pzero=10 "Small deltap for calculations";
    constant Pressure pc=Medium.fluidConstants[1].criticalPressure;
    constant SpecificEnthalpy hzero=1e-3 "Small value for deltah";
    SmoothMedium.BaseProperties fluid[N](each p(start=pstartin),
      h(start=linspace(hstartin, hstartout, N))) 
        "Properties of the fluid at the nodes";
    Medium.SaturationProperties sat "Properties of saturated fluid";
    Medium.ThermodynamicState dew "Thermodynamic state at dewpoint";
    Medium.ThermodynamicState bubble "Thermodynamic state at bubblepoint";
    Length omega_hyd "Wet perimeter (single tube)";
    Pressure Dpfric "Pressure drop due to friction";
    Pressure Dpstat "Pressure drop due to static head";
    Real Kf[N - 1] "Friction coefficient";
    Real Kfl[N - 1] "Linear friction coefficient";
    Real Cf[N - 1] "Fanning friction factor";
    Real dwdt "Dynamic momentum term";
    Medium.AbsolutePressure p(start=if HydraulicCapacitance==1 then pstartin else 
           pstartout) "Fluid pressure for property calculations";
    Pressure dpf[N - 1] "Pressure drop due to friction between two nodes";
    MassFlowRate w(start=wnom/Nt) "Mass flowrate (single tube)";
    MassFlowRate wbar[N - 1](each start=wnom/Nt);
    Velocity u[N] "Fluid velocity";
    Medium.Temperature T[N] "Fluid temperature";
    Medium.Temperature Ts "Saturated water temperature";
    Medium.SpecificEnthalpy h[N](start=linspace(hstartin, hstartout, N)) 
        "Fluid specific enthalpy";
    Medium.SpecificEnthalpy htilde[N - 1](start=ones(N - 1)*hstartin + (1:(N - 1))/(
          N - 1)*(hstartout - hstartin)) "Enthalpy state variables";
    Medium.SpecificEnthalpy hl "Saturated liquid temperature";
    Medium.SpecificEnthalpy hv "Saturated vapour temperature";
    Real x[N] "Steam quality";
    Medium.Density rho[N] "Fluid density";
    LiquidDensity rhol "Saturated liquid density";
    GasDensity rhov "Saturated vapour density";
    Mass M "Fluid mass";
    protected 
    DerEnthalpyByPressure dhldp 
        "Derivative of saturated liquid enthalpy by pressure";
    DerEnthalpyByPressure dhvdp 
        "Derivative of saturated vapour enthalpy by pressure";
    Density rhobar[N - 1] "Fluid average density";
    DerDensityByPressure drdp[N] "Derivative of density by pressure";
    DerDensityByPressure drbdp[N - 1] 
        "Derivative of average density by pressure";
    DerDensityByPressure drldp 
        "Derivative of saturated liquid density by pressure";
    DerDensityByPressure drl_dp 
        "Derivative of liquid density by pressure just before saturation";
    DerDensityByPressure drvdp 
        "Derivative of saturated vapour density by pressure";
    DerDensityByPressure drv_dp 
        "Derivative of vapour density by pressure just before saturation";
    SpecificVolume vbar[N - 1] "Average specific volume";
    HeatFlux phibar[N - 1] "Average heat flux";
    DerDensityByEnthalpy drdh[N] "Derivative of density by enthalpy";
    DerDensityByEnthalpy drbdh[N - 1] 
        "Derivative of average density by enthalpy";
    Real AA;
    Real BB;
    Real CC;
    Real dMdt[N - 1] "Derivative of fluid mass in each volume";
    annotation (
      Diagram,
      Icon(Text(extent=[-100, -54; 100, -80], string="%name")),
      Documentation(info="<HTML>
<p>This model describes the flow of water or steam in a rigid tube. The basic modelling assumptions are:
<ul><li>The fluid state is either one-phase, or a two-phase mixture.
<li>In case of two-phase flow, the same velocity is assumed for both phases (homogeneous model).
<li>Uniform velocity is assumed on the cross section, leading to a 1-D distributed parameter model.
<li>Turbulent friction is always assumed; a small linear term is added to avoid numerical singularities at zero flowrate. The friction effects are not accurately computed in the laminar and transitional flow regimes, which however should not be an issue in most applications using water or steam as a working fluid.
<li>The model is based on dynamic mass, momentum, and energy balances. The dynamic momentum term can be switched off, to avoid the fast oscillations that can arise from its coupling with the mass balance (sound wave dynamics). 
<li>The longitudinal heat diffusion term is neglected.
<li>The energy balance equation is written by assuming a uniform pressure distribution; the pressure drop is lumped either at the inlet or at the outlet.
<li>The fluid flow can exchange thermal power through the lateral surface, which is represented by the <tt>wall</tt> connector. The actual heat flux must be computed by a connected component (heat transfer computation module).
</ul>
<p>The mass, momentum, and energy balance equation are discretised with the finite volume method. The state variables are one pressure, one flowrate (optional) and N-1 specific enthalpies.
<p>The turbulent friction factor can be either assumed as a constant, or computed by Colebrook's equation. In the former case, the friction factor can be supplied directly, or given implicitly by a specified operating point. In any case, the multiplicative correction coefficient <tt>Kfc</tt> can be used to modify the friction coefficient, e.g. to fit experimental data.
<p>A small linear pressure drop is added to avoid numerical singularities at low or zero flowrate. The <tt>wnom</tt> parameter must be always specified: the additional linear pressure drop is such that it is equal to the turbulent pressure drop when the flowrate is equal to <tt>wnf*wnom</tt> (the default value is 1% of the nominal flowrate). Increase <tt>wnf</tt> if numerical instabilities occur in tubes with very low pressure drops.
<p>Flow reversal is fully supported.
<p><b>Modelling options</b></p>
<p>Thermal variables (enthalpy, temperature, density) are computed in <tt>N</tt> equally spaced nodes, including the inlet (node 1) and the outlet (node N); <tt>N</tt> must be greater than or equal to 2.
<p>The dynamic momentum term is included or neglected depending on the <tt>DynamicMomentum</tt> parameter.
<p>The following options are available to specify the friction coefficient:
<ul><li><tt>FFtype = FFtypes.Kfnom</tt>: the hydraulic friction coefficient <tt>Kf</tt> is set directly to <tt>Kfnom</tt>.
<li><tt>FFtype = FFtypes.OpPoint</tt>: the hydraulic friction coefficient is specified by a nominal operating point (<tt>wnom</tt>,<tt>dpnom</tt>, <tt>rhonom</tt>).
<li><tt>FFtype = FFtypes.Cfnom</tt>: the friction coefficient is computed by giving the (constant) value of the Fanning friction factor <tt>Cfnom</tt>.
<li><tt>FFtype = FFtypes.Colebrook</tt>: the Fanning friction factor is computed by Colebrook's equation (assuming Re > 2100, e.g. turbulent flow).
<li><tt>FFtype = FFtypes.NoFriction</tt>: no friction is assumed across the pipe.</ul><p>If <tt>HydraulicCapacitance = 2</tt> (default option) then the mass buildup term depending on the pressure is lumped at the outlet, while the optional momentum buildup term depending on the flowrate is lumped at the inlet. If <tt>HydraulicCapacitance = 1</tt> the reverse takes place.
<p>Start values for pressure and flowrate are specified by <tt>pstart</tt>, <tt>wstart</tt>. The start values for the node enthalpies are linearly distributed from <tt>hstartin</tt> at the inlet to <tt>hstartout</tt> at the outlet.
<p>A bank of <tt>Nt</tt> identical tubes working in parallel can be modelled by setting <tt>Nt > 1</tt>. The geometric parameters always refer to a <i>single</i> tube.
<p>This models makes the temperature and external heat flow distributions visible through the <tt>wall</tt> connector. If other variables (e.g. the heat transfer coefficient) are needed by external components to compute the actual heat flow, the <tt>wall</tt> connector can be replaced by an extended version of the <tt>DHT</tt> connector.
</HTML>",
        revisions="<html>
<ul>
<li><i>11 July 2005</i>
    by <a href=\"mailto:jonas.eborn@modelon.se\">Jonas Eborn</a>:<br>
       Updated to Modelica.Fluid connectors.</li>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>24 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       <tt>FFtypes</tt> package and <tt>NoFriction</tt> option added.</li>
<li><i>16 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Standard medium definition added.</li>
<li><i>8 Oct 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Model now based on <tt>Flow1DBase</tt>.
<li><i>24 Sep 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>wstart</tt>, <tt>pstart</tt>. Added <tt>pstartin</tt>, <tt>pstartout</tt>.
<li><i>28 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to <tt>Modelica.Media</tt>.
<li><i>15 Jan 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Computation of fluid velocity <i>u</i> added. Improved treatment of geometric parameters</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  equation 
    //All equations are referred to a single tube
    omega_hyd = 4*A/Dhyd;
    // Friction factor selection
    for j in 1:(N - 1) loop
      if FFtype == FFtypes.Kfnom then
        Kf[j] = Kfnom*Kfc/(N - 1);
        Cf[j] = 2*Kf[j]*A^3/(omega_hyd*l);
      elseif FFtype == FFtypes.OpPoint then
        Kf[j] = dpnom*rhonom/(wnom/Nt)^2/(N - 1)*Kfc;
        Cf[j] = 2*Kf[j]*A^3/(omega_hyd*l);
      elseif FFtype == FFtypes.Cfnom then
        Kf[j] = Cfnom*omega_hyd*l/(2*A^3)*Kfc;
        Cf[j] = 2*Kf[j]*A^3/(omega_hyd*l);
      elseif FFtype == FFtypes.Colebrook then
        Cf[j]=if noEvent(htilde[j] < hl or htilde[j] > hv) then 
          ThermoPower.Water.f_colebrook(w, Dhyd/A, e,
            Medium.dynamicViscosity(fluid[j].state))*Kfc else 
          ThermoPower.Water.f_colebrook_2ph(w, Dhyd/A, e,
            Medium.dynamicViscosity(bubble),
            Medium.dynamicViscosity(dew),x[j])*Kfc;
        Kf[j] = Cf[j]*omega_hyd*l/(2*A^3);
      elseif FFtype == FFtypes.NoFriction then
        Cf[j] = 0;
        Kf[j] = 0;
      else
        assert(FFtype<>FFtypes.NoFriction, "Unsupported FFtype");
        Cf[j] = 0;
        Kf[j] = 0;
      end if;
      assert(Kf[j]>=0, "Negative friction coefficient");
      Kfl[j] = wnom*wnf*Kf[j];
    end for;
      
    // Dynamic momentum term
    if DynamicMomentum then
      dwdt = der(w);
    else
      dwdt = 0;
    end if;
      
    sum(dMdt) = (infl.m_flow/Nt + outfl.m_flow/Nt) "Mass balance";
    sum(dpf) = Dpfric "Total pressure drop due to friction";
    Dpstat = if abs(dzdx)<1e-6 then 0 else g*l*dzdx*sum(rhobar) 
        "Pressure drop due to static head";
    L/A*dwdt + (outfl.p - infl.p) + Dpstat + Dpfric = 0 "Momentum balance";
    for j in 1:(N - 1) loop
      A*l*rhobar[j]*der(htilde[j]) + wbar[j]*(h[j + 1] - h[j]) - A*l*der(p) =
         l*omega*phibar[j] "Energy balance";
      dMdt[j] = A*l*(drbdh[j]*der(htilde[j]) + drbdp[j]*der(p)) 
          "Mass balance for each volume";
      // Average volume quantities
      vbar[j] = 1/rhobar[j] "Average specific volume";
      wbar[j] = infl.m_flow/Nt - sum(dMdt[1:j - 1]) - dMdt[j]/2;
      dpf[j] = (if FFtype == FFtypes.NoFriction then 0 else 
                noEvent(Kf[j]*abs(w) + Kfl[j])*w*vbar[j]);
      drbdh[j] = if noEvent(abs(h[j + 1] - h[j]) < hzero) then (drdh[j] +
        drdh[j + 1])/2 else (rho[j + 1] - rho[j])/(h[j + 1] - h[j]);
      if noEvent((h[j] < hl and h[j + 1] < hl) or (h[j] > hv and h[j + 1] >
          hv) or p >= (pc - pzero) or abs(h[j + 1] - h[j]) < hzero) then
        // 1-phase or almost uniform properties
        rhobar[j] = (rho[j] + rho[j + 1])/2;
        drbdp[j] = (drdp[j] + drdp[j + 1])/2;
      elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] >= hl and h[j + 1]
           <= hv) then
        // 2-phase
        rhobar[j] = CC*log(rho[j]/rho[j + 1])/(h[j + 1] - h[j]);
        drbdp[j] = (AA*log(rho[j]/rho[j + 1]) + BB*(rho[j] - rho[j + 1]))/(h[
          j + 1] - h[j]);
      elseif noEvent(h[j] < hl and h[j + 1] >= hl and h[j + 1] <= hv) then
        // liquid/2-phase
        rhobar[j] = ((rho[j] + rhol)*(hl - h[j])/2 + CC*log(rhol/rho[j + 1]))
          /(h[j + 1] - h[j]);
        drbdp[j] = ((drdp[j] + drl_dp)*(hl - h[j])/2 + AA*log(rhol/rho[j + 1])
           + BB*(rhol - rho[j + 1]))/(h[j + 1] - h[j]);
      elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] > hv) then
        // 2-phase/vapour
        rhobar[j] = (CC*log(rho[j]/rhov) + (rhov + rho[j + 1])*(h[j + 1] - hv)
          /2)/(h[j + 1] - h[j]);
        drbdp[j] = (AA*log(rho[j]/rhov) + BB*(rho[j] - rhov) + (drv_dp + drdp[
          j + 1])*(h[j + 1] - hv)/2)/(h[j + 1] - h[j]);
      elseif noEvent(h[j] < hl and h[j + 1] > hv) then
        // liquid/2-phase/vapour
        rhobar[j] = ((rho[j] + rhol)*(hl - h[j])/2 + CC*log(rhol/rhov) + (
          rhov + rho[j + 1])*(h[j + 1] - hv)/2)/(h[j + 1] - h[j]);
        drbdp[j] = ((rho[j] + drl_dp)*(hl - h[j])/2 + AA*log(rhol/rhov) + BB*
          (rhol - rhov) + (drv_dp + drdp[j + 1])*(h[j + 1] - hv)/2)/(h[j + 1]
           - h[j]);
      elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] < hl) then
        // 2-phase/liquid
        rhobar[j] = (CC*log(rho[j]/rhol) + (rhol + rho[j + 1])*(h[j + 1] - hl)
          /2)/(h[j + 1] - h[j]);
        drbdp[j] = (AA*log(rho[j]/rhol) + BB*(rho[j] - rhol) + (drl_dp + drdp[
          j + 1])*(h[j + 1] - hl)/2)/(h[j + 1] - h[j]);
      elseif noEvent(h[j] > hv and h[j + 1] < hl) then
        // vapour/2-phase/liquid
        rhobar[j] = ((rho[j] + rhov)*(hv - h[j])/2 + CC*log(rhov/rhol) + (
          rhol + rho[j + 1])*(h[j + 1] - hl)/2)/(h[j + 1] - h[j]);
        drbdp[j] = ((drdp[j] + drv_dp)*(hv - h[j])/2 + AA*log(rhov/rhol) + BB
          *(rhov - rhol) + (drl_dp + drdp[j + 1])*(h[j + 1] - hl)/2)/(h[j + 1]
           - h[j]);
      else
        // vapour/2-phase
        rhobar[j] = ((rho[j] + rhov)*(hv - h[j])/2 + CC*log(rhov/rho[j + 1]))
          /(h[j + 1] - h[j]);
        drbdp[j] = ((drdp[j] + drv_dp)*(hv - h[j])/2 + AA*log(rhov/rho[j + 1])
           + BB*(rhov - rho[j + 1]))/(h[j + 1] - h[j]);
      end if;
    end for;
      
    // Saturated fluid property calculations
    sat.psat=p;
    sat.Tsat=Medium.saturationTemperature(p);
    Ts=sat.Tsat;
    bubble=Medium.setBubbleState(sat,1);
    dew=Medium.setDewState(sat,1);
    rhol=Medium.bubbleDensity(sat);
    rhov=Medium.dewDensity(sat);
    hl=Medium.bubbleEnthalpy(sat);
    hv=Medium.dewEnthalpy(sat);
    drldp=Medium.dBubbleDensity_dPressure(sat);
    drvdp=Medium.dDewDensity_dPressure(sat);
    dhldp=Medium.dBubbleEnthalpy_dPressure(sat);
    dhvdp=Medium.dDewEnthalpy_dPressure(sat);
    drl_dp=Medium.density_derp_h(bubble);
    drv_dp=Medium.density_derp_h(dew);
    AA = ((dhvdp - dhldp)*(rhol - rhov)*rhol*rhov - (hv - hl)*(rhov^2*drldp
       - rhol^2*drvdp))/(rhol - rhov)^2;
    BB = ((hv - hl)*(rhov*drldp - rhol*drvdp)/(rhol - rhov) + dhldp*rhol -
      dhvdp*rhov)/(rhol - rhov);
    CC = (hv - hl)/(1/rhov - 1/rhol);
      
    // Fluid property calculations
    for j in 1:N loop
      fluid[j].p=p;
      fluid[j].h=h[j];
      T[j]=fluid[j].T;
      rho[j]=fluid[j].d;
      drdp[j]=Medium.density_derp_h(fluid[j].state);
      drdh[j]=Medium.density_derh_p(fluid[j].state);
      u[j] = w/(rho[j]*A);
      x[j]=noEvent(if h[j]<=hl then 0 else 
                if h[j]>=hv then 1 else (h[j]-hl)/(hv-hl));
    end for;
      
    // Selection of representative pressure and flow rate variables
    if HydraulicCapacitance == 1 then
      p = infl.p;
      w = -outfl.m_flow/Nt;
    else
      p = outfl.p;
      w = infl.m_flow/Nt;
    end if;
      
    // Boundary conditions
    infl.H_flow=semiLinear(infl.m_flow,infl.h,htilde[1]);
    outfl.H_flow=semiLinear(outfl.m_flow,outfl.h,htilde[N - 1]);
    if w >= 0 then
      h[1] = infl.h;
      h[2:N] = htilde;
    else
      h[N] = outfl.h;
      h[1:N - 1] = htilde;
    end if;
    T = wall.T;
    phibar = (wall.phi[1:N - 1] + wall.phi[2:N])/2;
      
    Q = Nt*l*omega*sum(phibar) "Total heat flow through lateral boundary";
    M=sum(rhobar)*A*l "Fluid mass (single tube)";
    Tr=noEvent(M/max(infl.m_flow/Nt,Modelica.Constants.eps)) "Residence time";
      
  initial equation 
    if initOpt == Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.steadyState then
      der(htilde) = zeros(N-1);
      if (not Medium.singleState) then
        der(p) = 0;
      end if;
    elseif initOpt == Choices.Init.Options.steadyStateNoP then
      der(htilde) = zeros(N-1);
    else
      assert(false, "Unsupported initialisation option");
    end if;
  end Flow1D2ph;
    
  model TestFlow1D2ph "Test case for Flow1D2ph" 
    package Medium=Modelica.Media.Water.StandardWater;
    import Modelica.Constants.*;
    // number of Nodes
    parameter Integer Nnodes=10;
    // total length
    parameter Length Lhex=10;
    // internal diameter
    parameter Diameter Dhex=0.06;
    // wall thickness
    parameter Thickness thhex=0;
    // internal radius
    parameter Radius rhex=Dhex/2;
    // internal perimeter
    parameter Length omegahex=Dhex;
    // internal cross section
    parameter Area Ahex=pi*rhex^2;
    // friction factor
    parameter Real Cfhex=0.005;
    annotation (
      experiment(
        StopTime=100,
        NumberOfIntervals=2000,
        Tolerance=1e-009),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2ph</tt> (fluid side of a heat exchanger, finite volumes, two-phase flow).<br>
This model represent the fluid side of a once-through boiler with an applied external heat flow. The operating fluid is water.<br> 
During the simulation, the inlet specific enthalpy and heat flux are changed, while maintaining the inlet flowrate constant:
<ul>
    <li>t=0 s. The initial state of the water is subcooled liquid.
    <li>t=10 s. Ramp increase of the applied heat flow. The water starts boiling and is blown out of the outlet, whose pressure and flowrate undergo a transient increase. At the end of the transient the outlet fluid is in superheated vapour state.</li>
    <li>t=30 s. Step increase of the inlet enthalpy</li> 
    <li>t=50 s. The heat flow is reduced to zero in 2s. The vapour collapses, causing a suddend decrease in the outlet pressure and flowrate, until the liquid fills again the entire boiler. At that instant, the pressure and flowrate rise again rapidly to the inlet values.</li> 
</ul>
<p>
Simulation Interval = [0...150] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>,
    First release.</li>
</ul>
</HTML>"),
      experimentSetupOutput(equdistant=false));
    Flow1D2ph hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dhex,
      A=Ahex,
      Cfnom=0.005,
      DynamicMomentum=false,
      hstartin=6e5,
      hstartout=6e5,
      pstartin=10e5,
      pstartout=10e5,
      wnom=1,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState,
      redeclare package Medium = Medium) 
                   annotation (extent=[-30,-10; -10,10]);
    ValveLin valve(Kv=1/10e5, redeclare package Medium = 
          Medium) 
      annotation (extent=[18, -10; 38, 10]);
    ThermoPower.Thermal.HeatSource1D heatSource(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-30, 8; -10, 28]);
    SinkP Sink(p0=1e5, redeclare package Medium = Medium) 
                                         annotation (extent=[52, -10; 72, 10]);
    Modelica.Blocks.Sources.Step hIn(
      height=1e5,
      offset=6e5,
      startTime=50)   annotation (extent=[-100, 10; -80, 30]);
    Modelica.Blocks.Sources.Ramp extPower(
      height=30e5,
      startTime=10,
      duration=30)   annotation (extent=[-80, 40; -60, 60]);
    SourceW Source(w0=1, redeclare package Medium = Medium) 
      annotation (extent=[-68, -10; -48, 10]);
    Modelica.Blocks.Sources.Ramp extPower2(
      duration=10,
      height=-30e5,
      startTime=70) annotation (extent=[-80, 74; -60, 94]);
    Modelica.Blocks.Math.Add Add1 annotation (extent=[-38, 54; -18, 74]);
    Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1) 
      annotation (extent=[16, 48; 36, 68]);
  equation 
    connect(heatSource.wall, hex.wall) 
      annotation (points=[-20,15; -20,5],   style(color=45));
    connect(hex.outfl, valve.inlet) annotation (points=[-10,0; 18,0]);
    connect(valve.outlet, Sink.flange) annotation (points=[38, 0; 52, 0]);
    connect(Source.flange, hex.infl) annotation (points=[-48,0; -30,0]);
    connect(extPower2.y,Add1.u1) 
      annotation (points=[-59, 84; -40, 70], style(color=3));
    connect(extPower.y,Add1.u2) 
      annotation (points=[-59, 50; -40, 58], style(color=3));
    connect(Add1.y,       heatSource.power) annotation (points=[-17, 64; -4,
          64; -4, 40; -20, 40; -20, 22], style(color=3));
    connect(xValve.y,       valve.cmd) annotation (points=[37, 58; 52, 58; 52,
           28; 28, 28; 28, 8], style(color=3));
    connect(hIn.y,       Source.in_h) 
      annotation (points=[-79, 20; -54, 20; -54, 6], style(color=3));
  end TestFlow1D2ph;
    
    partial model ValveBase "Base model for valves" 
      import ThermoPower;
      extends Icons.Water.Valve;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium 
        "Medium model";
      Medium.BaseProperties fluid;
      parameter Integer CvData "(0: Av | 1: Kv | 2: Cv | 3: OpPoint)";
      parameter Area Avnom=0 "Av (metric) flow coefficient";
      parameter Real Kvnom(unit="m^3/h")=0 "Kv (metric) flow coefficient";
      parameter Real Cvnom(unit="USG/min")=0 "Cv (US) flow coefficient";
      parameter Pressure dpnom "Nominal pressure drop";
      parameter MassFlowRate wnom=0 "Nominal mass flowrate";
      parameter LiquidDensity rhonom=0 "Nominal inlet density";
      parameter Boolean CheckValve=false "Reverse flow stopped";
      parameter Real b=0.01 "Regularisation factor";
      replaceable function FlowChar = Functions.linear "Flow characteristic";
      MassFlowRate w "Mass flowrate";
      Real Av;
      LiquidDensity rho "Inlet density";
      AbsoluteTemperature Tin;
      Modelica_Fluid.Interfaces.FluidPort_a inlet(redeclare package Medium = 
            Medium) annotation (extent=[-120, -20; -80, 20]);
      Modelica_Fluid.Interfaces.FluidPort_b outlet(redeclare package Medium = 
            Medium)  annotation (extent=[80, -20; 120, 20]);
      Modelica.Blocks.Interfaces.RealInput theta 
        annotation (extent=[-20, 60; 20, 100], rotation=-90);
      annotation (
        Icon(Text(extent=[-100, -40; 100, -80], string="%name")),
        Diagram,
        Documentation(info="<HTML>
<p>This is the base model for the <tt>ValveLiq</tt>, <tt>ValveLiqChoked</tt>, and <tt>ValveVap</tt> valve models. The model is based on the IEC 534 / ISA S.75 standards for valve sizing.
<p>The model optionally supports reverse flow conditions (assuming symmetrical behaviour) or check valve operation, and has been suitably modified to avoid numerical singularities at zero pressure drop. 
<p>The flow characteristic can be customised.
<p><b>Modelling options</b></p>
<p>The following options are available to specify the valve flow coefficient in fully open conditions:
<ul><li><tt>CvData = 0</tt>: the flow coefficient is given by the metric Av coefficient <tt>Avnom</tt> (m^2).
<li><tt>CvData = 1</tt>: the flow coefficient is given by the metric Kv coefficient <tt>Kvnom</tt> (m^3/h).
<li><tt>CvData = 2</tt>: the flow coefficient is given by the US Cv coefficient <tt>Cvnom</tt> (USG/min).
<li><tt>CvData = 3</tt>: the flow coefficient is given implicitly by the operating point (<tt>wnom</tt>,<tt>dpnom</tt>, <tt>rhonom<tt/>).
</ul>
<p>The nominal pressure drop <tt>dpnom</tt> must always be specified; to avoid numerical singularities, the flow characteristic is modified for pressure drops less than <tt>b*dpnom</tt> (the default value is 1% of the nominal pressure drop). Increase this parameter if numerical instabilities occur in valves with very low pressure drops.
<p>If <tt>CheckValve</tt> is true, then the flow is stopped when the outlet pressure is higher than the inlet pressure; otherwise, reverse flow takes place.
<p>The default flow characteristic <tt>FlowChar</tt> is linear; this can be replaced by any user-defined function (e.g. equal percentage, quick opening, etc.).
</HTML>", revisions="<html>
<ul>
<li><i>1 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Valve models restructured using inheritance. <br>
       Adapted to Modelica.Media.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
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
      inlet.m_flow + outlet.m_flow = 0;
      w = inlet.m_flow;
      inlet.H_flow=semiLinear(inlet.m_flow,inlet.h,fluid.h);
      outlet.H_flow=semiLinear(outlet.m_flow,outlet.h,fluid.h);
      inlet.H_flow+outlet.H_flow=0;
      fluid.p=inlet.p;
      Tin=fluid.T;
      rho=fluid.d;
    end ValveBase;
    
    model ValveLiq "Valve for liquid water flow" 
      import ThermoPower;
      extends ValveBase;
      Real z "Normalized pressure drop";
      Real sqrtz;
      annotation (
        Icon(Text(extent=[-100, -40; 100, -80], string="%name")),
        Diagram,
        Documentation(info="<HTML>
<p>Liquid water valve model according to the IEC 534/ISA S.75 standards for valve sizing, incompressible fluid. <p>
Extends the <tt>ValveBase</tt> model (see the corresponding documentation for common valve features).
</html>", revisions="<html>
<ul>
<li><i>1 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Valve model restructured using inheritance. <br>
       Adapted to Modelica.Media.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
    equation 
      z = (inlet.p - outlet.p)/dpnom;
      if CheckValve then
        sqrtz = (if z >= 0 then z/sqrt(z + b) else 0);
      else
        sqrtz = noEvent(z/sqrt(abs(z) + b));
      end if;
      w = FlowChar(theta)          *Av*sqrt(rho*dpnom)*sqrtz;
    end ValveLiq;
    
    model TestValv "Test case for valves" 
      package Medium = Modelica.Media.Water.StandardWater;
      SourceP SourceP1(p0=10e5,
      redeclare package Medium = Medium) 
        annotation (extent=[-100,30; -80,50]);
      SourceP SourceP2(p0=8e5,
      redeclare package Medium = Medium) 
        annotation (extent=[-100, -50; -80, -30]);
      SinkP SinkP1(p0=1e5,
      redeclare package Medium = Medium) 
        annotation (extent=[64, -4; 84, 16]);
      ValveLiq V1(
        rhonom=1000,
        CvData=3,
        dpnom=9e5,
        wnom=1.5,
      redeclare package Medium = Medium) 
                  annotation (extent=[-50, 58; -30, 78]);
      ValveLiq V2(
        dpnom=5e5,
        rhonom=1000,
        CvData=3,
        wnom=1.2,
      redeclare package Medium = Medium) 
                  annotation (extent=[-38, 26; -18, 46]);
      ValveLiq V3(
        dpnom=3e5,
        rhonom=1000,
        CvData=3,
        wnom=1.1,
      redeclare package Medium = Medium) 
                  annotation (extent=[-38, -38; -18, -18]);
      ValveLiq V4(
        dpnom=8e5,
        rhonom=1000,
        CvData=3,
        wnom=1.3,
      redeclare package Medium = Medium) 
                  annotation (extent=[-38, -78; -18, -58]);
      ValveLiq V5(
        dpnom=4e5,
        wnom=2,
        rhonom=1000,
        CvData=3,
      redeclare package Medium = Medium) 
                  annotation (extent=[28, -4; 48, 16]);
      annotation (
        Diagram,
        experiment(StopTime=4, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>ValveLiq</tt> model zero or reverse flow conditions.
<p>Simulate the model for 4 s. At t = 1 s the V5 valve closes in 1 s, the V2 and V3 valves close in 2 s and the V1 and V4 valves open in 2 s. The flow in valve V3 reverses between t = 1.83 and t = 1.93.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
      SinkP SinkP2(p0=1e5,
      redeclare package Medium = Medium) 
        annotation (extent=[-16, 58; 4, 78]);
      SinkP SinkP3(p0=1e5, redeclare package Medium = Medium) 
        annotation (extent=[-2, -78; 18, -58]);
      Modelica.Blocks.Sources.Ramp CloseLoad(
        duration=1,
        height=-0.99,
        offset=1,
        startTime=1)    annotation (extent=[8, 28; 28, 48]);
      Modelica.Blocks.Sources.Ramp OpenRelief(
        duration=2,
        height=1,
        offset=0,
        startTime=1) 
                    annotation (extent=[-92, 74; -72, 94]);
      Modelica.Blocks.Sources.Ramp CloseValves(
        duration=2,
        height=-1,
        offset=1,
        startTime=1) 
                    annotation (extent=[-96, -12; -76, 8]);
    equation 
      connect(V1.outlet, SinkP2.flange) annotation (points=[-30, 68; -16, 68]);
      connect(V5.outlet, SinkP1.flange) annotation (points=[48, 6; 64, 6]);
      connect(V4.outlet, SinkP3.flange) annotation (points=[-18, -68; -2, -68]);
      connect(CloseLoad.y,       V5.theta) 
        annotation (points=[29, 38; 38, 38; 38, 14], style(color=3));
      connect(OpenRelief.y,       V1.theta) 
        annotation (points=[-71, 84; -40, 84; -40, 76], style(color=3));
      connect(OpenRelief.y,       V4.theta) annotation (points=[-71, 84; -70, -6;
             -42, -6; -42, -50; -28, -50; -28, -60], style(color=3));
      connect(CloseValves.y,       V3.theta) 
        annotation (points=[-75, -2; -28, -2; -28, -20], style(color=3));
      connect(CloseValves.y,       V2.theta) annotation (points=[-75, -2; -42,
            -2; -42, 54; -28, 54; -28, 44], style(color=3));
      connect(SourceP1.flange, V1.inlet) annotation (points=[-80,40; -66,40; -66,68;
            -50,68], style(color=69, rgbcolor={0,127,255}));
      connect(SourceP1.flange, V2.inlet) annotation (points=[-80,40; -60,40; -60,36;
            -38,36], style(color=69, rgbcolor={0,127,255}));
      connect(V2.outlet, V5.inlet) annotation (points=[-18,36; 5,36; 5,6; 28,6],
          style(color=69, rgbcolor={0,127,255}));
      connect(V3.outlet, V5.inlet) annotation (points=[-18,-28; 6,-28; 6,6; 28,6],
          style(color=69, rgbcolor={0,127,255}));
      connect(SourceP2.flange, V4.inlet) annotation (points=[-80,-40; -60,-40; -60,
            -68; -38,-68], style(color=69, rgbcolor={0,127,255}));
      connect(SourceP2.flange, V3.inlet) annotation (points=[-80,-40; -58,-40; -58,
            -28; -38,-28], style(color=69, rgbcolor={0,127,255}));
    end TestValv;
    
    model TestValvProva "Test case for valves" 
      package Medium = Modelica.Media.Water.StandardWater;
      SourceP SourceP1(p0=10e5,
      redeclare package Medium = Modelica.Media.Water.StandardWater) 
        annotation (extent=[-100,30; -80,50]);
      ValveLiq V1(
        rhonom=1000,
        CvData=3,
        dpnom=9e5,
        wnom=1.5,
      redeclare package Medium = Modelica.Media.Water.StandardWater) 
                  annotation (extent=[-50, 58; -30, 78]);
      annotation (
        Diagram,
        experiment(StopTime=4, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>ValveLiq</tt> model zero or reverse flow conditions.
<p>Simulate the model for 4 s. At t = 1 s the V5 valve closes in 1 s, the V2 and V3 valves close in 2 s and the V1 and V4 valves open in 2 s. The flow in valve V3 reverses between t = 1.83 and t = 1.93.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
      SinkP SinkP2(p0=1e5,
      redeclare package Medium = Modelica.Media.Water.StandardWater) 
        annotation (extent=[-16, 58; 4, 78]);
      Modelica.Blocks.Sources.Ramp OpenRelief(
        duration=2,
        height=1,
        offset=0,
        startTime=1) 
                    annotation (extent=[-92, 74; -72, 94]);
    equation 
      connect(V1.outlet, SinkP2.flange) annotation (points=[-30, 68; -16, 68]);
      connect(OpenRelief.y,       V1.theta) 
        annotation (points=[-71, 84; -40, 84; -40, 76], style(color=3));
      connect(SourceP1.flange, V1.inlet) annotation (points=[-80,40; -66,40; -66,68;
            -50,68], style(color=69, rgbcolor={0,127,255}));
    end TestValvProva;
    
    partial model PumpBase "Base model for centrifugal pumps" 
      extends Icons.Water.Pump;
      import Modelica.SIunits.Conversions.NonSIunits.*;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium 
        "Medium model";
      Medium.BaseProperties fluid "Fluid propertie";
      replaceable package SatMedium = 
          Modelica.Media.Interfaces.PartialTwoPhaseMedium 
        "Saturated medium model (required only for NPSH computation)";
      parameter Integer Np0(min=1) = 1 "Nominal number of pumps in parallel";
      parameter Pressure pin_start "Inlet Pressure Start Value";
      parameter Pressure pout_start "Outlet Pressure Start Value";
      parameter SpecificEnthalpy hstart=1e5 
        "Fluid Specific Enthalpy Start Value";
      parameter Density rho0=1000 "Nominal Liquid Density";
      parameter AngularVelocity_rpm n0=1500 "Nominal rotational speed";
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
      parameter Height head_nom[3] "Pump head for three operating points";
      parameter VolumeFlowRate q_nom[3] 
        "Volume flow rate for three operating points (single pump)";
      parameter Power P_cons[3] 
        "Power consumption for three operating points (single pump)";
      parameter Boolean CheckValve=false "Reverse flow stopped";
      parameter Boolean ThermalCapacity=false 
        "Fluid heat capacity accounted for";
      parameter Boolean ComputeNPSHa=false 
        "Compute NPSH Available at the inlet";
      constant Acceleration g=Modelica.Constants.g_n;
      LiquidDensity rho "Liquid density";
      AbsoluteTemperature Tin "Liquid inlet temperature";
      MassFlowRate w "Mass flowrate (single pump)";
      SpecificEnthalpy h(start=hstart) "Fluid specific enthalpy";
      AngularVelocity_rpm n "Shaft r.p.m.";
      Integer Np(min=1) "Number of pumps in parallel";
      
      Power P "Power Consumption (single pump)";
      Power Ptot "Power Consumption (total)";
      constant Power P_eps=1e-8 
        "Small coefficient to avoid numerical singularities";
      Power Phyd "Hydraulic power (single pump)";
      Real eta "Global Efficiency";
      Length NPSHa "Net Positive Suction Head available";
      Pressure pv "Saturated liquid pressure";
      Boolean FlowOn(start=true);
      Real s "Auxiliary Variable";
      Real A;
      Real B;
      Real C;
      Real D;
      Real E;
      Real F;
      Modelica_Fluid.Interfaces.FluidPort_a infl(redeclare package Medium = 
            Medium, p(start=pin_start)) 
        annotation (extent=[-100, 2; -60, 42]);
      Modelica_Fluid.Interfaces.FluidPort_b outfl(redeclare package Medium = 
            Medium, p(start=pout_start)) 
        annotation (extent=[40,52; 80,92]);
      Modelica.Blocks.Interfaces.RealInput in_Np "Number of  parallel pumps" 
        annotation (extent=[18, 70; 38, 90], rotation=-90);
    equation 
      if cardinality(in_Np)==0 then
        Np = Np0;
        in_Np           = 0;
      else
        Np =in_Np;
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
          head_nom[1]*g = -A*q_nom[1]^2 + B*q_nom[1] + C;
          head_nom[2]*g = -A*q_nom[2]^2 + B*q_nom[2] + C;
          head_nom[3]*g = -A*q_nom[3]^2 + B*q_nom[3] + C;
          P_cons[1] = D*(n0^2)*q_nom[1] - E*n0*(q_nom[1]^2) + F*(n0^2);
          P_cons[2] = D*(n0^2)*q_nom[2] - E*n0*(q_nom[2]^2) + F*(n0^2);
          P_cons[3] = D*(n0^2)*q_nom[3] - E*n0*(q_nom[3]^2) + F*(n0^2);
        end if;
      end if;
      
      infl.m_flow + outfl.m_flow = 0;
      w = infl.m_flow/Np;
      FlowOn = s > 0;
      
      if (FlowOn or (not CheckValve)) then
        w = s;
        (outfl.p - infl.p)/rho = -A*(w/rho)^2 + B*(n/n0)*w/rho + C*(n/n0)^2;
      else
        (outfl.p - infl.p)/rho = C*(n/n0)^2 - s*1e3;
        w = 0;
      end if;
      
      P = D*(n^2)*(w/rho) - E*n*((w/rho)^2) + F*(n^2);
      Ptot = P*Np;
      
      infl.H_flow=semiLinear(infl.m_flow,infl.h,fluid.h);
      outfl.H_flow=semiLinear(outfl.m_flow,outfl.h,fluid.h);
      fluid.p=infl.p;
      
      rho = fluid.d;
      Tin = fluid.T;
      
      h = fluid.h;
      
      if ThermalCapacity then
        (rho*V*der(h)) = (outfl.m_flow/Np)*outfl.h + (infl.m_flow/Np)*infl.h + Phyd;
      else
        0 = (outfl.m_flow/Np)*outfl.h + (infl.m_flow/Np)*infl.h + Phyd;
      end if;
      Phyd = P*etaMech;
      eta = ((outfl.p - infl.p)*w/rho)/(P + P_eps);
      
      if ComputeNPSHa then
        pv=SatMedium.saturationPressure(fluid.T);
        NPSHa=(infl.p-pv)/(rho*Modelica.Constants.g_n);
      else
        pv=0;
        NPSHa=0;
      end if;
      
      annotation (
        Icon,
        Diagram,
        Documentation(info="<HTML>
<p>This is the base model for the <tt>Pump</tt> and <tt>
PumpMech</tt> pump models.
<p>The model describes a centrifugal pump, or a group of <tt>Np</tt> identical pumps in parallel. The hydraulic characteristic (head vs. flowrate) is represented, as well as the pump power consumption.
<p>In order to avoid singularities in the computation of the outlet enthalpy at zero flowrate, the thermal capacity of the fluid inside the pump body can be taken into account.
<p>The model can either support reverse flow conditions or include a built-in check valve to avoid flow reversal.
<p><b>Modelling options</b></p>
<p>The following options are available to specify the pump characteristics:
<ul><li><tt>CharData = 0</tt>: the coefficients of the characteristics (<tt>A,B,C,D,E,F</tt>) are provided directly
<li><tt>CharData = 1</tt>: the characteristics are specified by providing a vector of three operating points (in terms of heads <tt>head[3]</tt>, volume flow rate <tt>q[3]</tt>, power consumption <tt>P_cons[3]</tt>, nominal fluid density <tt>rho0</tt>, and nominal rotational speed <tt>n0</tt>) for a single pump.
</ul>
<p>If the <tt>in_Np</tt> input connector is wired, it provides the number of pumps in parallel; otherwise,  <tt>Np0</tt> parallel pumps are assumed.</p>
<p>If <tt>ThermalCapacity</tt> is set to true, the heat capacity of the fluid inside the pump is taken into account: this is necessary to avoid singularities in the computation of the outlet enthalpy in case of zero flowrate. If zero flowrate conditions are always avoided, this effect can be neglected by setting <tt>ThermalCapacity</tt> to false, thus avoiding a fast state variable in the model.
<p>The <tt>CheckValve</tt> parameter determines whether the pump has a built-in check valve or not.
</HTML>", revisions="<html>
<ul>
<li><i>2 Aug 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       NPSHa computation added. Changed parameter names</li>
<li><i>5 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Model restructured by using inheritance. Adapted to Modelica.Media.</li>
<li><i>15 Jan 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       <tt>ThermalCapacity</tt> and <tt>CheckValve</tt> added.</li>
<li><i>15 Dec 2003</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</html>"));
    end PumpBase;
    
    model Pump "Centrifugal pump with ideally controlled speed" 
      extends PumpBase;
      import Modelica.SIunits.Conversions.NonSIunits.*;
      parameter AngularVelocity_rpm n_const=n0 "Constant rotational speed";
      Modelica.Blocks.Interfaces.RealInput in_n "RPM" 
        annotation (extent=[-36, 70; -16, 90], rotation=-90);
    equation 
      if cardinality(in_n)==0 then
        n = n_const;
        in_n           = 0;
      else
        n =in_n;
      end if;
      
      annotation (
        Icon(
          Text(extent=[-58,94; -30,74], string="n"),
          Text(extent=[-10,102; 18,82], string="Np")),
        Diagram,
        Documentation(info="<HTML>
<p>This model describes a centrifugal pump (or a group of <tt>Np</tt> pumps in parallel) with controlled speed, either fixed or provided by an external signal.
<p>The model extends <tt>PumpBase</tt>
<p>If the <tt>in_n</tt> input connector is wired, it provides rotational speed of the pumps (rpm); otherwise, a constant rotational speed equal to <tt>n_const</tt> (which can be different from <tt>n0</tt>) is assumed.</p>
</HTML>", revisions="<html>
<ul>
<li><i>5 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Model restructured by using inheritance. Adapted to Modelica.Media.</li>
<li><i>15 Jan 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       <tt>ThermalCapacity</tt> and <tt>CheckValve</tt> added.</li>
<li><i>15 Dec 2003</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</html>"));
    end Pump;
    
    model PumpMech "Centrifugal pump with mechanical connector for the shaft" 
      extends PumpBase;
      extends Icons.Water.PumpMech;
      Angle phi "Shaft angle";
      AngularVelocity omega "Shaft angular velocity";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a MechPort 
        annotation (extent=[80,4; 110,32]);
    equation 
      phi = MechPort.phi;
      omega = der(phi);
      n = Modelica.SIunits.Conversions.to_rpm(omega);
      P = omega*MechPort.tau;
      annotation (
        Icon(
          Text(extent=[-10,104; 18,84], string="Np")),
        Diagram,
        Documentation(info="<HTML>
<p>This model describes a centrifugal pump (or a group of <tt>Np</tt> pumps in parallel) with a mechanical rotational connector for the shaft, to be used when the pump drive has to be modelled explicitly. In the case of <tt>Np</tt> pumps in parallel, the mechanical connector is relative to a single pump.
<p>The model extends <tt>PumpBase</tt>
 </HTML>", revisions="<html>
<ul>
<li><i>5 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Model restructured by using inheritance. Adapted to Modelica.Media.</li>
<li><i>15 Jan 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       <tt>ThermalCapacity</tt> and <tt>CheckValve</tt> added.</li>
<li><i>15 Dec 2003</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</html>"));
    end PumpMech;
    
    model ValveLin "Valve for water/steam flows with linear pressure drop" 
      extends Icons.Water.Valve;
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium 
        "Medium model";
      parameter HydraulicConductance Kv "Nominal hydraulic conductance";
      MassFlowRate w "Mass flowrate";
      SpecificEnthalpy h "Fluid specific enthalpy";
      Modelica_Fluid.Interfaces.FluidPort_a inlet(redeclare package Medium=Medium) 
                    annotation (extent=[-120, -20; -80, 20]);
      Modelica_Fluid.Interfaces.FluidPort_b outlet(redeclare package Medium=Medium) 
                     annotation (extent=[80, -20; 120, 20]);
      Modelica.Blocks.Interfaces.RealInput cmd 
        annotation (extent=[-20, 60; 20, 100], rotation=-90);
    equation 
      inlet.m_flow + outlet.m_flow = 0;
      w = inlet.m_flow;
      inlet.H_flow=semiLinear(inlet.m_flow,inlet.h,h);
      outlet.H_flow=semiLinear(outlet.m_flow,outlet.h,h);
      inlet.H_flow+outlet.H_flow=0;
      w = Kv*cmd*(inlet.p - outlet.p);
      annotation (
        Icon(Text(extent=[-100, -40; 100, -74], string="%name")),
        Diagram,
        Documentation(info="<HTML>
<p>This very simple model provides a pressure drop which is proportional to the flowrate and to the <tt>cmd</tt> signal, without computing any fluid property.</p>
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    end ValveLin;
    
    model WaterPumpTest "Test case for WaterPump" 
      annotation (
        Diagram,
        experiment(StopTime=10, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>Pump</tt> model with the check valve option active.
<p>The sink pressure is varied sinusoidally with a period of 10 s, so as to operate the pump in all the possible working conditions, including stopped flow.
<p>
Simulation Interval = [0...10] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
<p><b>Revision history:</b></p>
<ul>
<li><i>5 Feb 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco
Schiavo</a>:<br>
       First release.</li>
</ul>
</HTML>"));
      SourceP Source(p0=1e5, redeclare package Medium = 
            Modelica.Media.Water.StandardWater) 
        annotation (extent=[-86, 24; -66, 44]);
      ValveLin ValveLin1(Kv=1e-5, redeclare package Medium = 
            Modelica.Media.Water.StandardWater) 
        annotation (extent=[8, 22; 28, 42]);
      SinkP SinkP1(p0=3e5, redeclare package Medium = 
            Modelica.Media.Water.StandardWater) 
        annotation (extent=[42, 22; 62, 42]);
      Pump Pump1(
        rho0=1000,
        CharData=1,
        pin_start=1e5,
        pout_start=4e5,
        hstart=1e5,
        ThermalCapacity=true,
        V=0.01,
        P_cons={800,1800,2000},
        CheckValve=true,
        head_nom={60,30,0},
        q_nom={0,0.001,0.0015},
      redeclare package Medium = Modelica.Media.Water.StandardWater,
      redeclare package SatMedium = Modelica.Media.Water.StandardWater,
        ComputeNPSHa=true)  annotation (extent=[-52, 26; -32, 46]);
      Modelica.Blocks.Sources.Constant Constant1 
        annotation (extent=[-72, 64; -52, 84]);
      Modelica.Blocks.Sources.Sine Sine1(
        amplitude=5e5,
        freqHz=0.1,
        offset=3e5,
        startTime=0)   annotation (extent=[78, 66; 58, 86]);
    equation 
      connect(ValveLin1.outlet, SinkP1.flange) 
        annotation (points=[28, 32; 42, 32]);
      connect(Source.flange, Pump1.infl) 
        annotation (points=[-66, 34; -58, 34; -58, 38.2; -50, 38.2]);
      connect(Constant1.y,       ValveLin1.cmd) annotation (points=[-51, 74; -16,
             74; -16, 72; 18, 72; 18, 40], style(color=3));
      connect(Sine1.y,       SinkP1.in_p0) annotation (points=[57, 76; 52, 76;
            52, 40.8; 48, 40.8], style(color=3));
      connect(Pump1.outfl, ValveLin1.inlet) 
        annotation (points=[-36,43.2; -14,43.2; -14,32; 8,32]);
    end WaterPumpTest;
  end Water;
  
  package Gas 
  model SourceW "Flowrate source for gas flows" 
    extends Icons.Gas.SourceW;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    Medium.BaseProperties gas(p(start=p0),T(start=T),Xi(start=Xnom[1:Medium.nXi]));
    parameter Pressure p0=101325 "Nominal pressure";
    parameter AbsoluteTemperature T=300 "Nominal temperature";
    parameter MassFraction Xnom[Medium.nX]=Medium.reference_X 
        "Nominal gas composition";
    parameter MassFlowRate w0=0 "Nominal mass flowrate";
    parameter HydraulicConductance G=0 "HydraulicConductance";
    MassFlowRate w;
    Modelica_Fluid.Interfaces.FluidPort_b flange(redeclare package Medium = 
            Medium)  annotation (extent=[80, -20; 120, 20]);
    Modelica.Blocks.Interfaces.RealInput in_w0 
      annotation (extent=[-70,40; -50,60], rotation=-90);
    Modelica.Blocks.Interfaces.RealInput in_T 
      annotation (extent=[10,60; -10,40], rotation=-270);
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] 
      annotation (extent=[50,40; 70,60], rotation=-90);
  equation 
    if G == 0 then
      flange.m_flow = -w;
    else
      flange.m_flow = -w + (flange.p - p0)*G;
    end if;
      
    w = in_w0;
    if cardinality(in_w0)==0 then
      in_w0 = w0 "Flow rate set by parameter";
    end if;
      
    gas.T = in_T;
    if cardinality(in_T)==0 then
      in_T = T "Temperature set by parameter";
    end if;
      
    gas.Xi = in_X[1:Medium.nXi];
    if cardinality(in_X)==0 then
      in_X = Xnom "Composition set by parameter";
    end if;
      
    flange.p = gas.p;
    flange.H_flow = semiLinear(flange.m_flow,flange.h,gas.h);
    flange.mXi_flow = semiLinear(flange.m_flow,flange.Xi,gas.Xi);
      
    annotation (Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>,whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>G</tt> is set to zero, the flowrate source is ideal; otherwise, the outgoing flowrate decreases proportionally to the outlet pressure.</p>
<p>If the <tt>in_w0</tt> connector is wired, then the source massflowrate is given by the corresponding signal, otherwise it is fixed to <tt>w0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>12 July 2005</i>
    by <a href=\"mailto:jonas.eborn@modelon.se\">Jonas Eborn</a>:<br>
       Updated to Modelica.Fluid connectors.</li>
<li><i>19 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Removed <tt>w0fix</tt> and <tt>Tfix</tt> and <tt>Xfix</tt>; the connection of external signals is now detected automatically.</li> <br> Adapted to Modelica.Media
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end SourceW;
    
  model SourceP "Pressure source for gas flows" 
    extends Icons.Gas.SourceP;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    Medium.BaseProperties gas(p(start=p0),T(start=T),Xi(start=Xnom[1:Medium.nXi]));
    parameter Pressure p0=101325 "Nominal pressure";
    parameter HydraulicResistance R=0 "Hydraulic resistance";
    parameter AbsoluteTemperature T=300 "Nominal temperature";
    parameter MassFraction Xnom[Medium.nX]=Medium.reference_X 
        "Nominal gas composition";
      
    Modelica_Fluid.Interfaces.FluidPort_b flange(redeclare package Medium=Medium) 
      annotation (extent=[80,-20; 120,20]);
    Modelica.Blocks.Interfaces.RealInput in_p 
      annotation (extent=[-70,54; -50,74], rotation=-90);
    Modelica.Blocks.Interfaces.RealInput in_T 
      annotation (extent=[-10,80; 10,100], rotation=270);
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] 
      annotation (extent=[50,52; 70,72], rotation=270);
  equation 
    if R == 0 then
      flange.p = gas.p;
    else
      flange.p = gas.p + flange.m_flow*R;
    end if;
      
    gas.p = in_p;
    if cardinality(in_p)==0 then
      in_p = p0 "Pressure set by parameter";
    end if;
      
    gas.T = in_T;
    if cardinality(in_T)==0 then
      in_T = T "Temperature set by parameter";
    end if;
      
    gas.Xi = in_X[1:Medium.nXi];
    if cardinality(in_X)==0 then
      in_X = Xnom "Composition set by parameter";
    end if;
      
    flange.H_flow = semiLinear(flange.m_flow,flange.h,gas.h);
    flange.mXi_flow = semiLinear(flange.m_flow,flange.Xi,gas.Xi);
      
    annotation (Icon, Diagram,
      Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package.In the case of multiple componet, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>, whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>R</tt> is set to zero, the pressure source is ideal; otherwise, the outlet pressure decreases proportionally to the outgoing flowrate.</p>
<p>If the <tt>in_p</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>p0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>12 July 2005</i>
    by <a href=\"mailto:jonas.eborn@modelon.se\">Jonas Eborn</a>:<br>
       Updated to Modelica.Fluid connectors.</li>
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
    extends Icons.Gas.SourceP;
    replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
    Medium.BaseProperties gas(p(start=p0),T(start=T),Xi(start=Xnom[1:Medium.nXi]));
    parameter Pressure p0=101325 "Nominal pressure";
    parameter AbsoluteTemperature T=300 "Nominal temperature";
    parameter MassFraction Xnom[Medium.nX]=Medium.reference_X 
        "Nominal gas composition";
    parameter HydraulicResistance R=0 "Hydraulic Resistance";
      
    Modelica_Fluid.Interfaces.FluidPort_a flange(redeclare package Medium=Medium) 
      annotation (extent=[-120,-20; -80,20]);
    Modelica.Blocks.Interfaces.RealInput in_p 
      annotation (extent=[-77,47; -52,72], rotation=-90);
    Modelica.Blocks.Interfaces.RealInput in_T 
      annotation (extent=[-12,80; 12,100], rotation=-90);
    Modelica.Blocks.Interfaces.RealInput in_X[Medium.nX] 
      annotation (extent=[52,46; 80,72], rotation=-90);
  equation 
    if R == 0 then
      flange.p = gas.p;
    else
      flange.p = gas.p + flange.m_flow*R;
    end if;
      
    gas.p = in_p;
    if cardinality(in_p)==0 then
      in_p = p0 "Pressure set by parameter";
    end if;
      
    gas.T = in_T;
    if cardinality(in_T)==0 then
      in_T =T "Temperature set by parameter";
    end if;
      
    gas.Xi = in_X[1:Medium.nXi];
    if cardinality(in_X)==0 then
      in_X = Xnom "Composition set by parameter";
    end if;
      
    flange.H_flow = semiLinear(flange.m_flow,flange.h,gas.h);
    flange.mXi_flow = semiLinear(flange.m_flow,flange.Xi,gas.Xi);
      
    annotation (Documentation(info="<html>
<p><b>Modelling options</b></p>
<p>The actual gas used in the component is determined by the replaceable <tt>Medium</tt> package. In the case of multiple component, variable composition gases, the nominal gas composition is given by <tt>Xnom</tt>, whose default value is <tt>Medium.reference_X</tt> .
<p>If <tt>R</tt> is set to zero, the pressure sink is ideal; otherwise, the inlet pressure increases proportionally to the outgoing flowrate.</p>
<p>If the <tt>in_p</tt> connector is wired, then the source pressure is given by the corresponding signal, otherwise it is fixed to <tt>p0</tt>.</p>
<p>If the <tt>in_T</tt> connector is wired, then the source temperature is given by the corresponding signal, otherwise it is fixed to <tt>T</tt>.</p>
<p>If the <tt>in_X</tt> connector is wired, then the source massfraction is given by the corresponding signal, otherwise it is fixed to <tt>Xnom</tt>.</p>
</html>", revisions="<html>
<ul>
<li><i>12 July 2005</i>
    by <a href=\"mailto:jonas.eborn@modelon.se\">Jonas Eborn</a>:<br>
       Updated to Modelica.Fluid connectors.</li>
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
    
  model Flow1D "1-dimensional fluid flow model for gas (finite volumes)" 
    extends Icons.Gas.Tube;
    import ThermoPower.Choices.Flow1D.FFtypes;
    replaceable package Medium=ThermoPower.Media.FlueGas 
      extends ThermoPower.Media.GenericGas;
    parameter Integer N(min=2) = 2 "Number of nodes for thermal variables";
    parameter Integer Nt=1 "Number of tubes in parallel";
    parameter Distance L "Tube length";
    parameter Position H=0 "Elevation of outlet over inlet";
    parameter Area A "Cross-sectional area (single tube)";
    parameter Length omega "Perimeter of heat transfer surface (single tube)";
    parameter Length Dhyd "Hydraulic Diameter (single tube)";
    parameter MassFlowRate wnom "Nominal mass flowrate (total)";
    parameter FFtypes.Temp FFtype "Friction Factor Type";
    parameter Real Kfnom=0 "Nominal hydraulic resistance coefficient";
    parameter Pressure dpnom=0 "Nominal pressure drop";
    parameter Density rhonom=0 "Nominal inlet density";
    parameter Real Cfnom=0 "Nominal Fanning friction factor";
    parameter Real e=0 "Relative roughness (ratio roughness/diameter)";
    parameter Boolean DynamicMomentum=false "Inertial phenomena accounted for"  annotation(Evaluate=true);
    parameter Boolean UniformComposition=true 
        "Uniform gas composition is assumed" 
                                           annotation(Evaluate=true);
    parameter Boolean QuasiStatic=false 
        "Quasi-static model (mass, energy and momentum static balances" 
                                                                      annotation(Evaluate=true);
    parameter Integer HydraulicCapacitance=2 "1: Upstream, 2: Downstream";
    parameter AbsoluteTemperature Tstartin=300 "Inlet temperature start value";
    parameter AbsoluteTemperature Tstartout=300 
        "Outlet temperature start value";
    parameter Pressure pstart=101325 "Pressure start value";
    parameter Real wnf=0.01 
        "Fraction of nominal flow rate at which linear friction equals turbulent friction";
    parameter Real Kfc=1 "Friction factor correction coefficient";
    parameter Integer nXi=Medium.nXi "number of independent mass fractions";
    parameter Integer nX=Medium.nX "total number of mass fractions";
    parameter MassFraction Xstart[nX]=Medium.reference_X 
        "Start gas composition";
    parameter Choices.Init.Options.Temp initOpt=Choices.Init.Options.noInit 
        "Initialisation option";
    constant Real g=Modelica.Constants.g_n;
    Modelica_Fluid.Interfaces.FluidPort_a infl(redeclare package Medium = Medium,
      m_flow(start=wnom)) annotation (extent=[-120,-20; -80,20]);
    Modelica_Fluid.Interfaces.FluidPort_b outfl(redeclare package Medium = Medium,
      m_flow(start=-wnom)) annotation (extent=[80,-20; 120,20]);
    replaceable Thermal.DHT wall(N=N) annotation (extent=[-60,40; 60,60]);
    Medium.BaseProperties gas[N](
      p(start=ones(N)*pstart),
      T(start=linspace(Tstartin,Tstartout,N)),
      state(p(start=ones(N)*pstart),
      T(start=ones(N)*Tstartin+(0:(N-1))/(N-1)*(Tstartout-Tstartin)))) 
        "Gas nodal properties";
      // Xi(start=fill(Xstart[1:nXi],N)),
      // X(start=fill(Xstart,N)),
    Pressure Dpfric "Pressure drop due to friction";
    Length omega_hyd "Wet perimeter (single tube)";
    Real Kf "Friction factor";
    Real Kfl "Linear friction factor";
    Real dwdt "Time derivative of mass flow rate";
    Real Cf "Fanning friction factor";
    MassFlowRate w(start=wnom/Nt) "Mass flowrate (single tube)";
    AbsoluteTemperature Ttilde[N - 1](start=ones(N - 1)*Tstartin + (1:(N - 1))
          /(N - 1)*(Tstartout - Tstartin)) "Temperature state variables";
    Real Xtilde[if UniformComposition or Medium.fixedX then 1 else N - 1, nX](
        start=ones(size(Xtilde, 1), size(Xtilde, 2))*diagonal(Xstart[1:nX]),
        stateSelect=StateSelect.prefer) "Composition state variables";
    MassFlowRate wbar[N - 1](each start=wnom/Nt);
    Velocity u[N] "Fluid velocity";
    Pressure p(start=pstart, stateSelect=StateSelect.prefer);
    Time Tr "Residence time";
    Mass M "Gas Mass";
    Real Q "Total heat flow through the wall (all Nt tubes)";
    protected 
    parameter Real dzdx = H/L "Slope";
    parameter Length l = L/(N - 1) "Length of a single volume";
    Density rhobar[N - 1] "Fluid average density";
    SpecificVolume vbar[N - 1] "Fluid average specific volume";
    HeatFlux phibar[N - 1] "Average heat flux";
    DerDensityByTemperature drbdT[N - 1] 
        "Derivative of average density by temperature";
    DerDensityByPressure drbdp[N - 1] 
        "Derivative of average density by pressure";
    Density drbdX[N - 1, nX] "Derivative of average density by composition";
    Medium.SpecificHeatCapacity cvbar[N - 1] "Average cv";
    Real dMdt[N - 1] "Derivative of mass in a finite volume";
    Medium.SpecificHeatCapacity cv[N];
    Medium.DerDensityByTemperature dddT[N] 
        "Derivative of density by temperature";
    Medium.DerDensityByPressure dddp[N] "Derivative of density by pressure";
    Medium.Density dddX[N,nX] "Derivative of density by composition";
  equation 
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
      Cf=ThermoPower.Gas.f_colebrook(w,Dhyd/A,e,
            Medium.dynamicViscosity(gas[integer(N/2)].state))*Kfc;
      Kf = Cf*omega_hyd*L/(2*A^3);
    elseif FFtype == FFtypes.NoFriction then
      Cf = 0;
      Kf = 0;
    end if;
    assert(Kf>=0, "Negative friction coefficient");
    Kfl = wnom/Nt*wnf*Kf "Linear friction factor";
      
    // Dynamic momentum term
    dwdt = if DynamicMomentum and not QuasiStatic then 
              der(w) else 0;
      
    sum(dMdt) = (infl.m_flow + outfl.m_flow)/Nt "Mass balance";
    L/A*dwdt + (outfl.p - infl.p) + Dpfric = 0 "Momentum balance";
    Dpfric = (if FFtype == FFtypes.NoFriction then 0 else 
              noEvent(Kf*abs(w) + Kfl)*w*sum(vbar)/(N - 1)) 
        "Pressure drop due to friction";
    for j in 1:N - 1 loop
      if not QuasiStatic then
        // Dynamic mass and energy balances
        A*l*rhobar[j]*cvbar[j]*der(Ttilde[j]) + wbar[j]*(gas[j + 1].h - gas[j].h) =
          l*omega*phibar[j] "Energy balance";
        dMdt[j] = A*l*(drbdT[j]*der(Ttilde[j]) + drbdp[j]*der(p) + vector(drbdX[j, :])*
          vector(der(Xtilde[if UniformComposition then 1 else j, :]))) 
            "Mass balance";
        // Average volume quantities
        rhobar[j] = (gas[j].d + gas[j + 1].d)/2;
        drbdp[j] = (dddp[j] + dddp[j + 1])/2;
        drbdT[j] = (dddT[j] + dddT[j + 1])/2;
        drbdX[j, :] = (dddX[j,:] + dddX[j + 1,:])/2;
        vbar[j] = 1/rhobar[j];
        wbar[j] = infl.m_flow/Nt - sum(dMdt[1:j - 1]) - dMdt[j]/2;
        cvbar[j]=(cv[j]+cv[j+1])/2;
      else
        // Static mass and energy balances
        wbar[j]*(gas[j + 1].h - gas[j].h) = l*omega*phibar[j] "Energy balance";
        dMdt[j] = 0 "Mass balance";
        // Dummy values for unused average quantities
        rhobar[j] = 0;
        drbdp[j] = 0;
        drbdT[j] = 0;
        drbdX[j, :] = zeros(nX);
        vbar[j] = 0;
        wbar[j] = infl.m_flow/Nt;
        cvbar[j]= 0;
      end if;
    end for;
    Q = Nt*l*omega*sum(phibar) "Total heat flow through lateral boundary";
    if Medium.fixedX then
      Xtilde = fill(Medium.reference_X, 1);
    elseif QuasiStatic then
      Xtilde = fill(if w>=0 then infl.Xi else outfl.Xi, size(Xtilde,1)) 
          "Gas composition equal to actual inlet";
    elseif UniformComposition then
      der(Xtilde[1, :]) = 1/L*sum(u)/N*(gas[1].X - gas[N].X) 
          "Partial mass balance for the whole pipe";
    else
      for j in 1:N - 1 loop
        der(Xtilde[j, :]) = (u[j + 1] + u[j])/(2*l)*(gas[j].X - gas[j + 1].X) 
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
          cv[j]  =Medium.heatCapacity_cv(gas[j].state);
        dddT[j]  =Medium.density_derT_p(gas[j].state);
        dddp[j]  =Medium.density_derp_T(gas[j].state);
        if nX > 0 then
          dddX[j,:]=Medium.density_derX(gas[j].state);
        end if;
      else
        // Dummy values (not needed by dynamic equations)
          cv[j]  = 0;
        dddT[j]  = 0;
        dddp[j]  = 0;
        dddX[j,:]= zeros(nX);
      end if;
    end for;
      
    // Selection of representative pressure and flow rate variables
    if HydraulicCapacitance == 1 then
      p = infl.p;
      w = -outfl.m_flow/Nt;
    else
      p = outfl.p;
      w = infl.m_flow/Nt;
    end if;
      
    // Boundary conditions
    infl.H_flow=semiLinear(infl.m_flow,infl.h,gas[1].h);
    outfl.H_flow=semiLinear(outfl.m_flow,outfl.h,gas[N].h);
    infl.mXi_flow=semiLinear(infl.m_flow,infl.Xi,gas[1].Xi);
    outfl.mXi_flow=semiLinear(outfl.m_flow,outfl.Xi,gas[N].Xi);
    if w >= 0 then
      gas[1].h = infl.h;
      gas[2:N].T = Ttilde;
      gas[1].Xi = infl.Xi;
      for j in 2:N loop
        gas[j].Xi = Xtilde[if UniformComposition then 1 else j - 1, 1:nXi];
      end for;
    else
      gas[N].h = outfl.h;
      gas[1:N - 1].T = Ttilde;
      gas[N].Xi = outfl.Xi;
      for j in 1:N - 1 loop
        gas[j].Xi = Xtilde[if UniformComposition then 1 else j, 1:nXi];
      end for;
    end if;
    gas.T = wall.T;
    phibar = (wall.phi[1:N - 1] + wall.phi[2:N])/2;
      
    M=sum(rhobar)*A*l "Total gas mass";
    Tr=noEvent(M/max(infl.m_flow/Nt,Modelica.Constants.eps)) "Residence time";
  initial equation 
    if initOpt == Choices.Init.Options.noInit or QuasiStatic then
      // do nothing
    elseif initOpt == Choices.Init.Options.steadyState then
      if (not Medium.singleState) then
        der(p) = 0;
      end if;
      der(Ttilde) = zeros(N-1);
      if (not Medium.fixedX) then
        der(Xtilde) = zeros(size(Xtilde,1), size(Xtilde,2));
      end if;
    elseif initOpt == Choices.Init.Options.steadyStateNoP then
      der(Ttilde) = zeros(N-1);
      if (not Medium.fixedX) then
        der(Xtilde) = zeros(size(Xtilde,1), size(Xtilde,2));
      end if;
   else
      assert(false, "Unsupported initialisation option");
    end if;
      
    annotation (Icon(Text(extent=[-100, -40; 100, -80], string="%name")),
      Diagram, Documentation(info="<html>
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
<p>if <tt>UniformComposition</tt> is true, then a uniform compostion is assumed for the gas through the entire tube lenght; otherwise, the gas compostion is computed in <tt>N</tt> equally spaced nodes, as in the case of thermal variables.
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
<li><i>12 July 2005</i>
    by <a href=\"mailto:jonas.eborn@modelon.se\">Jonas Eborn</a>:<br>
       Updated to Modelica.Fluid connectors.</li>
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
</html>"));
  end Flow1D;
    
  model TestGasFlow1D 
    package Medium=ThermoPower.Media.FlueGas;
    parameter Integer Nnodes=10 "number of Nodes";
    parameter Modelica.SIunits.Length Lhex=200 "total length";
    parameter Modelica.SIunits.Diameter Dihex=0.02 "internal diameter";
    parameter Modelica.SIunits.Radius rhex=Dihex/2 "internal radius";
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex 
        "internal perimeter";
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2 
        "internal cross section";
    parameter Real Cfhex=0.005 "friction coefficient";
    parameter Modelica.SIunits.MassFlowRate whex=0.05 
        "nominal (and initial) mass flow rate";
    parameter Modelica.SIunits.Pressure phex=3e5 "initial pressure";
    parameter Temperature Tinhex=300 "initial inlet temperature";
    parameter Temperature Touthex=300 "initial outlet temperature";
   // parameter Temperature deltaT=10 "height of temperature step";
    parameter Modelica.SIunits.EnergyFlowRate W=1e3 "height of power step";
    parameter Real deltaX[2]={.25,-.25} "offset and height of composition step";
      
    SourceW SourceW1(
      redeclare package Medium = Medium,
      p0=phex,
      T=Tinhex,
      w0=whex) annotation (extent=[-80,-6; -60,14]);
    SinkP SinkP1(
      redeclare package Medium = Medium,
      p0=0.1e5,
      T=300) annotation (extent=[76,-6; 96,14]);
    Flow1D Flow1D1(
      redeclare package Medium = Medium,
      N=Nnodes,
      L=Lhex,
      A=Ahex,
      omega=omegahex,
      Dhyd=Dihex,
      wnom=whex,
      Cfnom=Cfhex,
      Tstartin=Tinhex,
      Tstartout=Touthex,
      pstart=phex,
      UniformComposition=true,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                    annotation (extent=[-14,-6; 6,14]);
    ValveLin ValveLin1(redeclare package Medium = Medium, Kv=whex/phex) 
      annotation (extent=[20,-6; 40,14]);
    Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-16,20; 4,40]);
    Modelica.Blocks.Sources.Step Step1(height=W, startTime=20) 
      annotation (extent=[-30,50; -10,70]);
    Modelica.Blocks.Sources.Step Step4(
      height=10,
      offset=Tinhex,
      startTime=10) annotation (extent=[-110,14; -90,34]);
    Modelica.Blocks.Sources.Step Step2(
      height=-0.2,
      offset=1,
      startTime=30) 
      annotation (extent=[8,46; 28,66]);
  equation 
    connect(SourceW1.flange, Flow1D1.infl)   annotation (points=[-60,4; -14,4],
        style(color=76, rgbcolor={159,159,223}));
    connect(Flow1D1.outfl, ValveLin1.inlet)   annotation (points=[6,4; 20,4],
        style(color=76, rgbcolor={159,159,223}));
    connect(ValveLin1.outlet, SinkP1.flange) annotation (points=[40,4; 76,4],
        style(color=76, rgbcolor={159,159,223}));
    connect(HeatSource1D1.wall, Flow1D1.wall)   annotation (points=[-6,27; -6,
          9; -4,9],     style(color=45, rgbcolor={255,127,0}));
    connect(Step1.y, HeatSource1D1.power) annotation (points=[-9,60; -6,60;
          -6,34], style(color=74, rgbcolor={0,0,127}));
    connect(Step4.y, SourceW1.in_T) annotation (points=[-89,24; -70,24; -70,9],
        style(color=74, rgbcolor={0,0,127}));
    connect(Step2.y, ValveLin1.cmd) annotation (points=[29,56; 42,56; 42,32;
          30,32; 30,11], style(color=74, rgbcolor={0,0,127}));
    annotation (Diagram, experiment(StopTime=50),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Gas.Flow1D</tt> (fluid side of a heat exchanger, finite volumes).<br>
The model starts at steady state. At t = 10 s, step variation of the temperature of the fluid entering the heat exchanger. At t = 20 s, step variation of the thermal flow entering the heat exchanger lateral surface. At t = 30 s, step reduction of the outlet valve opening.
</ul>
<p>
Simulation Interval = [0...50] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</HTML>"));
  end TestGasFlow1D;
    
  model ValveLin "Valve for gas flows with linear pressure drop" 
    extends Icons.Gas.Valve;
    replaceable package Medium=Modelica.Media.Interfaces.PartialMedium;
    parameter HydraulicConductance Kv "Hydraulic conductance";
    MassFlowRate w "Mass flowrate";
    SpecificEnthalpy h "Fluid specific enthalpy";
    MassFraction Xi[Medium.nXi] "Independent component mass fractions";
    Modelica_Fluid.Interfaces.FluidPort_a inlet(redeclare package Medium = Medium) 
      annotation (extent=[-120,-20; -80,20]);
    Modelica_Fluid.Interfaces.FluidPort_b outlet(redeclare package Medium = Medium) 
      annotation (extent=[80,-20; 120,20]);
    annotation (Icon(Text(extent=[-100, -40; 100, -80], string="%name")),
      Diagram,
    Documentation(info="<html>
<p>This very simple model provides a pressure drop which is proportional to the flowrate and to the <tt>cmd</tt> signal, without computing any fluid property.</p>
</html>", revisions="<html>
<ul>
<li><i>12 July 2005</i>
    by <a href=\"mailto:jonas.eborn@modelon.se\">Jonas Eborn</a>:<br>
       Updated to Modelica.Fluid connectors.</li>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Mar 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    Modelica.Blocks.Interfaces.RealInput cmd 
      annotation (extent=[-10,60; 10,80], rotation=270);
  equation 
    w = Kv*cmd*(inlet.p-outlet.p) "Flow characteristics";
    inlet.m_flow + outlet.m_flow = 0;
    w = inlet.m_flow;
      
    // Energy balance
    inlet.H_flow=semiLinear(inlet.m_flow,inlet.h,h);
    outlet.H_flow=semiLinear(outlet.m_flow,outlet.h,h);
    inlet.H_flow + outlet.H_flow=0;
      
    // Independent components mass balance
    inlet.mXi_flow=semiLinear(inlet.m_flow,inlet.Xi,Xi);
    outlet.mXi_flow=semiLinear(outlet.m_flow,outlet.Xi,Xi);
    inlet.mXi_flow + outlet.mXi_flow=zeros(Medium.nXi);
  end ValveLin;
    
    model TestValv "Test case for valves" 
      package Medium = ThermoPower.Media.FlueGas;
      SourceP SourceP1(p0=10e5,
      redeclare package Medium = Medium) 
        annotation (extent=[-100,30; -80,50]);
      SourceP SourceP2(p0=8e5,
      redeclare package Medium = Medium) 
        annotation (extent=[-100, -50; -80, -30]);
      SinkP SinkP1(p0=1e5,
      redeclare package Medium = Medium) 
        annotation (extent=[64, -4; 84, 16]);
      ValveLin V1(Kv=1.5/9e5, redeclare package Medium = Medium) 
                  annotation (extent=[-50, 58; -30, 78]);
      ValveLin V2(Kv=1.2/5e5, redeclare package Medium = Medium) 
                  annotation (extent=[-38, 26; -18, 46]);
      ValveLin V3(Kv=1.1/3e5, redeclare package Medium = Medium) 
                  annotation (extent=[-38, -38; -18, -18]);
      ValveLin V4(Kv=1.3/8e5, redeclare package Medium = Medium) 
                  annotation (extent=[-38, -78; -18, -58]);
      ValveLin V5(Kv=2/4e5, redeclare package Medium = Medium) 
                  annotation (extent=[28, -4; 48, 16]);
      annotation (
        Diagram,
        experiment(StopTime=4, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>Gas.ValveLin</tt> model zero or reverse flow conditions.
<p>Simulate the model for 4 s. At t = 1 s the V5 valve closes in 1 s, the V2 and V3 valves close in 2 s and the V1 and V4 valves open in 2 s. The flow in valve V3 reverses between t = 1.83 and t = 1.93.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
      SinkP SinkP2(p0=1e5, redeclare package Medium = Medium) 
        annotation (extent=[-16, 58; 4, 78]);
      SinkP SinkP3(p0=1e5, redeclare package Medium = Medium) 
        annotation (extent=[-2, -78; 18, -58]);
      Modelica.Blocks.Sources.Ramp CloseLoad(
        duration=1,
        height=-0.99,
        offset=1,
        startTime=1)    annotation (extent=[8, 28; 28, 48]);
      Modelica.Blocks.Sources.Ramp OpenRelief(
        duration=2,
        height=1,
        offset=0,
        startTime=1) 
                    annotation (extent=[-92, 74; -72, 94]);
      Modelica.Blocks.Sources.Ramp CloseValves(
        duration=2,
        height=-1,
        offset=1,
        startTime=1) 
                    annotation (extent=[-96, -12; -76, 8]);
    equation 
      connect(V1.outlet, SinkP2.flange) annotation (points=[-30, 68; -16, 68]);
      connect(V5.outlet, SinkP1.flange) annotation (points=[48, 6; 64, 6]);
      connect(V4.outlet, SinkP3.flange) annotation (points=[-18, -68; -2, -68]);
      connect(CloseLoad.y, V5.cmd) 
        annotation (points=[29, 38; 38, 38; 38, 14], style(color=3));
      connect(OpenRelief.y, V1.cmd) 
        annotation (points=[-71, 84; -40, 84; -40, 76], style(color=3));
      connect(OpenRelief.y, V4.cmd) annotation (points=[-71, 84; -70, -6;
             -42, -6; -42, -50; -28, -50; -28, -60], style(color=3));
      connect(CloseValves.y, V3.cmd) 
        annotation (points=[-75, -2; -28, -2; -28, -20], style(color=3));
      connect(CloseValves.y, V2.cmd) annotation (points=[-75, -2; -42,
            -2; -42, 54; -28, 54; -28, 44], style(color=3));
      connect(SourceP1.flange, V1.inlet) annotation (points=[-80,40; -66,40; -66,68;
            -50,68], style(color=69, rgbcolor={0,127,255}));
      connect(SourceP1.flange, V2.inlet) annotation (points=[-80,40; -60,40; -60,36;
            -38,36], style(color=69, rgbcolor={0,127,255}));
      connect(V2.outlet, V5.inlet) annotation (points=[-18,36; 5,36; 5,6; 28,6],
          style(color=69, rgbcolor={0,127,255}));
      connect(V3.outlet, V5.inlet) annotation (points=[-18,-28; 6,-28; 6,6; 28,6],
          style(color=69, rgbcolor={0,127,255}));
      connect(SourceP2.flange, V4.inlet) annotation (points=[-80,-40; -60,-40; -60,
            -68; -38,-68], style(color=69, rgbcolor={0,127,255}));
      connect(SourceP2.flange, V3.inlet) annotation (points=[-80,-40; -58,-40; -58,
            -28; -38,-28], style(color=69, rgbcolor={0,127,255}));
    end TestValv;
  end Gas;
end Fluid;
