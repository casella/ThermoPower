within ThermoPower;
package Thermal "Thermal models of heat transfer"
  extends Modelica.Icons.Package;

  connector HT = Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a
    "Thermal port for lumped parameter heat transfer";
  connector DHTNodes "Distributed Heat Terminal"
    parameter Integer N(min=1) = 2 "Number of nodes";
    SI.Temperature T[N] "Temperature at the nodes";
    flow SI.HeatFlux phi[N] "Heat flux at the nodes";
    annotation (
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={255,127,0},
            fillColor={255,127,0},
            fillPattern=FillPattern.Solid)}));
  end DHTNodes;

  connector DHTVolumes "Distributed Heat Terminal"
    parameter Integer N "Number of volumes";
    SI.Temperature T[N] "Temperature at the volumes";
    flow SI.Power Q[N] "Heat flow at the volumes";
    annotation (
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={255,127,0},
            fillColor={255,127,0},
            fillPattern=FillPattern.Solid)}));
  end DHTVolumes;

  model HThtc_HT "HThtc to HT adaptor"

    HT HT_port annotation (Placement(transformation(extent={{100,-20},{140,20}},
            rotation=0)));
    HThtc_in HThtc_port annotation (Placement(transformation(extent={{-140,-20},
              {-100,20}}, rotation=0)));
  equation
    HT_port.T = HThtc_port.T;
    HT_port.Q_flow = HThtc_port.Q_flow;
    annotation (Diagram(graphics), Icon(graphics={
          Text(
            extent={{-86,-4},{32,96}},
            lineColor={0,0,0},
            lineThickness=1,
            textString="HThtc"),
          Text(
            extent={{-10,-92},{96,-20}},
            lineColor={0,0,0},
            textString="HT"),
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={255,0,0}),
          Line(points={{100,100},{-100,-100}}, color={255,0,0})}));
  end HThtc_HT;

  model HT_DHTNodes "HT to DHT adaptor"
    parameter Integer N=1 "Number of nodes on DHT side";
    parameter SI.Area exchangeSurface "Area of heat transfer surface";
    HT HT_port annotation (Placement(transformation(extent={{-140,-16},{-100,24}},
            rotation=0)));
    DHT DHT_port(N=N) annotation (Placement(transformation(extent={{100,-40},{
              120,40}}, rotation=0)));
  equation
    for i in 1:N loop
      DHT_port.T[i] = HT_port.T "Uniform temperature distribution on DHT side";
    end for;
    if N == 1 then
      // Uniform flow distribution
      DHT_port.phi[1]*exchangeSurface + HT_port.Q_flow = 0 "Energy balance";
    else
      // Piecewise linear flow distribution
      sum(DHT_port.phi[1:N - 1] + DHT_port.phi[2:N])/2*exchangeSurface/(N - 1)
         + HT_port.Q_flow = 0 "Energy balance";
    end if;
    annotation (Icon(graphics={
          Polygon(
            points={{-100,100},{-100,-100},{100,100},{-100,100}},
            lineColor={185,0,0},
            fillColor={185,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{100,100},{100,-100},{-100,-100},{100,100}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-74,10},{24,88}},
            lineColor={255,255,255},
            lineThickness=1,
            textString="HT"),
          Text(
            extent={{-16,-84},{82,-6}},
            lineColor={255,255,255},
            lineThickness=1,
            textString="DHT"),
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            pattern=LinePattern.None)}), Diagram(graphics));
  end HT_DHTNodes;

  model HT_DHTVolumes "HT to DHT adaptor"
    parameter Integer N=1 "Number of volumes on the connectors";
    HT HT_port annotation (Placement(transformation(extent={{-140,-16},{-100,24}},
            rotation=0)));
    DHTVolumes DHT_port(N=N) annotation (Placement(transformation(extent={{100,-40},{
              120,40}}, rotation=0)));
  equation
    for i in 1:N loop
      DHT_port.T[i] = HT_port.T "Uniform temperature distribution on DHT side";
    end for;
    sum(DHT_port.Q) + HT_port.Q_flow = 0 "Energy balance";
    annotation (Icon(graphics={
          Polygon(
            points={{-100,100},{-100,-100},{100,100},{-100,100}},
            lineColor={185,0,0},
            fillColor={185,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{100,100},{100,-100},{-100,-100},{100,100}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-74,10},{24,88}},
            lineColor={255,255,255},
            lineThickness=1,
            textString="HT"),
          Text(
            extent={{-16,-84},{82,-6}},
            lineColor={255,255,255},
            lineThickness=1,
            textString="DHT"),
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            pattern=LinePattern.None)}), Diagram(graphics));
  end HT_DHTVolumes;

  model TempSource1DFV
    "Uniform Distributed Temperature Source for Finite Volume models"
    extends Icons.HeatFlow;
    parameter Integer Nw = 1 "Number of volumes on the wall port";
    Thermal.DHTVolumes wall(final N=Nw) annotation (Placement(transformation(
            extent={{-40,-40},{40,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput temperature "Temperature [K]" annotation (Placement(
          transformation(
          origin={0,40},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    for i in 1:Nw loop
      wall.T[i] = temperature;
    end for;
    annotation (
      Diagram(graphics),
      Icon(graphics={Text(
            extent={{-100,-46},{100,-70}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>Model of an ideal 1D uniform temperature source (finite volume). The actual temperature is provided by the <tt>temperature</tt> signal connector.
</HTML>", revisions="<html>
<ul>
<li><i>3 May 2013</i>
    by <a href=\"mailto:stefanoboni@hotmail.com\">Stefano Boni</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end TempSource1DFV;

  model TempSource1DlinFV
    "Linearly Distributed Temperature Source for Finite Volume models"
    extends Icons.HeatFlow;
    parameter Integer Nw = 1 "Number of volumes on the wall port";
    Thermal.DHTVolumes wall(final N=Nw) annotation (Placement(transformation(
            extent={{-40,-40},{40,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput temperature_1 annotation (
        Placement(transformation(
          origin={-40,30},
          extent={{-20,-20},{20,20}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput temperature_Nw annotation (
        Placement(transformation(
          origin={40,28},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    wall.T = Functions.linspaceExt(
        temperature_1,
        temperature_Nw,
        Nw);
    annotation (
      Documentation(info="<HTML>
<p>Model of an ideal 1D temperature source with a linear distribution. The values of the temperature at the two ends of the source are provided by the <tt>temperature_node1</tt> and <tt>temperature_nodeN</tt> signal connectors.
</HTML>", revisions="<html>
<ul>
<li><i>10 Jan 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</html>
"),   Icon(graphics={Text(
            extent={{-100,-46},{100,-72}},
            lineColor={191,95,0},
            textString="%name")}));
  end TempSource1DlinFV;

  model TempSource1DFEM "Distributed Temperature Source for FEM models"
    extends Icons.HeatFlow;
    parameter Integer N=2 "Number of nodes";
    Thermal.DHTNodes wall(N=N) annotation (Placement(transformation(
            extent={{-40,-40},{40,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput temperature annotation (Placement(
          transformation(
          origin={0,40},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    for i in 1:N loop
      wall.T[i] = temperature;
    end for;
    annotation (
      Diagram(graphics),
      Icon(graphics={Text(
            extent={{-100,-46},{100,-70}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>Model of an ideal 1D uniform temperature source. The actual temperature is provided by the <tt>temperature</tt> signal connector.
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end TempSource1DFEM;

  model TempSource1DlinFEM
    "Linearly Distributed Temperature Source for FEM models"
    extends Icons.HeatFlow;
    parameter Integer N=2 "Number of nodes";
    Thermal.DHTNodes wall(N=N) annotation (Placement(transformation(
            extent={{-40,-40},{40,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput temperature_node1 annotation (
        Placement(transformation(
          origin={-40,30},
          extent={{-20,-20},{20,20}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput temperature_nodeN annotation (
        Placement(transformation(
          origin={40,28},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    wall.T = linspace(
        temperature_node1,
        temperature_nodeN,
        N);
    annotation (
      Documentation(info="<HTML>
<p>Model of an ideal 1D temperature source with a linear distribution. The values of the temperature at the two ends of the source are provided by the <tt>temperature_node1</tt> and <tt>temperature_nodeN</tt> signal connectors.
</HTML>", revisions="<html>
<ul>
<li><i>10 Jan 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</html>
"),   Icon(graphics={Text(
            extent={{-100,-46},{100,-72}},
            lineColor={191,95,0},
            textString="%name")}));
  end TempSource1DlinFEM;

  model HeatSource1DFV "Distributed Heat Flow Source for Finite Volume models"
    extends Icons.HeatFlow;
    parameter Integer Nw = 1 "Number of volumes on the wall port";
    Thermal.DHTVolumes wall(final N=Nw) annotation (Placement(transformation(
            extent={{-40,-40},{40,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput power annotation (Placement(
          transformation(
          origin={0,40},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    for i in 1:Nw loop
      wall.Q[i] = -power/Nw;
    end for;
    annotation (
      Diagram(graphics),
      Icon(graphics={Text(
            extent={{-100,-44},{100,-68}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>Model of an ideal tubular heat flow source, with uniform heat flux. The actual heating power is provided by the <tt>power</tt> signal connector.
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end HeatSource1DFV;

  model HeatSource1DFEM "Distributed Heat Flow Source for FEM models"
    extends Icons.HeatFlow;
    parameter Integer N=2 "Number of nodes";
    parameter Integer Nt=1 "Number of tubes";
    parameter SI.Length L "Source length";
    parameter SI.Length omega "Source perimeter (single tube)";
    Thermal.DHTNodes wall(N=N) annotation (Placement(transformation(
            extent={{-40,-40},{40,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput power annotation (Placement(
          transformation(
          origin={0,40},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    for i in 1:N loop
      wall.phi[i] = -power/(omega*L*Nt);
    end for;
    annotation (
      Diagram(graphics),
      Icon(graphics={Text(
            extent={{-100,-44},{100,-68}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>Model of an ideal tubular heat flow source, with uniform heat flux. The actual heating power is provided by the <tt>power</tt> signal connector.
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end HeatSource1DFEM;

  model MetalTubeFV "Cylindrical metal tube model with Nw finite volumes"
    extends Icons.MetalWall;
    parameter Integer Nw = 1 "Number of volumes on the wall ports";
    parameter Integer Nt = 1 "Number of tubes in parallel";
    parameter SI.Length L "Tube length";
    parameter SI.Length rint "Internal radius (single tube)";
    parameter SI.Length rext "External radius (single tube)";
    parameter Real rhomcm "Metal heat capacity per unit volume [J/m^3.K]";
    parameter SI.ThermalConductivity lambda "Thermal conductivity";
    parameter Boolean WallRes=true "Wall thermal resistance accounted for";
    parameter SI.Temperature Tstartbar=300 "Avarage temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature Tstart1=Tstartbar
      "Temperature start value - first volume"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature TstartN=Tstartbar
      "Temperature start value - last volume"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature Tvolstart[Nw]=
      Functions.linspaceExt(Tstart1, TstartN, Nw)
          annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt=system.initOpt
      "Initialisation option"
      annotation (Dialog(tab="Initialisation"));
    constant Real pi=Modelica.Constants.pi;
    final parameter SI.Area Am = (rext^2 - rint^2)*pi
      "Area of the metal tube cross-section";
    final parameter SI.HeatCapacity Cm = Nt*L*Am*rhomcm "Total heat capacity";
    outer ThermoPower.System system "System wide properties";
    SI.Temperature Tvol[Nw](start=Tvolstart) "Volume temperatures";

    ThermoPower.Thermal.DHTVolumes int(final N=Nw, T(start=Tvolstart))
      "Internal surface"
       annotation (Placement(transformation(extent={{-40,20},{40,40}}, rotation=0)));
    ThermoPower.Thermal.DHTVolumes ext(final N=Nw, T(start=Tvolstart))
      "External surface"
       annotation (Placement(transformation(extent={{-40,-42},{40,-20}}, rotation=0)));
  equation
    assert(rext > rint, "External radius must be greater than internal radius");
    (L/Nw*Nt)*rhomcm*Am*der(Tvol) = int.Q + ext.Q "Energy balance";
    if WallRes then
      // Thermal resistance of the tube walls accounted for
      int.Q = (lambda*(2*pi*L/Nw)*(int.T - Tvol))/(log((rint + rext)/(2*rint)))*Nt
        "Heat conduction through the internal half-thickness";
      ext.Q = (lambda*(2*pi*L/Nw)*(ext.T - Tvol))/(log((2*rext)/(rint + rext)))*Nt
        "Heat conduction through the external half-thickness";
    else
      // No temperature gradients across the thickness
      ext.T = Tvol;
      int.T = Tvol;
    end if;
  initial equation
    if initOpt == Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.fixedState then
      Tvol = Tvolstart;
    elseif initOpt == Choices.Init.Options.steadyState then
      der(Tvol) = zeros(Nw);
    elseif initOpt == Choices.Init.Options.steadyStateNoT then
      // do nothing
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Icon(graphics={
          Text(
            extent={{-100,60},{-40,20}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Int"),
          Text(
            extent={{-100,-20},{-40,-60}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Ext"),
          Text(
            extent={{-138,-60},{142,-100}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>This is the model of a cylindrical tube of solid material.
<p>The heat capacity (which is lumped at the center of the tube thickness) is accounted for, as well as the thermal resistance due to the finite heat conduction coefficient. Longitudinal heat conduction is neglected.
<p><b>Modelling options</b></p>
<p>The following options are available:
<ul>
<li><tt>WallRes = false</tt>: the thermal resistance of the tube wall is neglected.
<li><tt>WallRes = true</tt>: the thermal resistance of the tube wall is accounted for.
</ul>
</HTML>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),   Diagram(graphics));
  end MetalTubeFV;

  model MetalTubeFEM "Cylindrical metal tube - 1 radial node and N axial nodes"
    extends Icons.MetalWall;
    parameter Integer N(min=1) = 2 "Number of nodes";
    parameter SI.Length L "Tube length";
    parameter SI.Length rint "Internal radius (single tube)";
    parameter SI.Length rext "External radius (single tube)";
    parameter Real rhomcm "Metal heat capacity per unit volume [J/m^3.K]";
    parameter SI.ThermalConductivity lambda "Thermal conductivity";
    parameter Boolean WallRes=true "Wall conduction resistance accounted for";
    parameter SI.Temperature Tstartbar=300 "Avarage temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature Tstart1=Tstartbar
      "Temperature start value - first node"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature TstartN=Tstartbar
      "Temperature start value - last node"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature Tstart[N]=Functions.linspaceExt(
          Tstart1,
          TstartN,
          N) "Start value of temperature vector (initialized by default)"
      annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt = system.initOpt
      "Initialisation option" annotation (Dialog(tab="Initialisation"));
    constant Real pi=Modelica.Constants.pi;
    outer ThermoPower.System system "System wide properties";
    SI.Temperature T[N](start=Tstart) "Node temperatures";
    SI.Area Am "Area of the metal tube cross-section";
    DHT int(N=N, T(start=Tstart)) "Internal surface" annotation (Placement(
          transformation(extent={{-40,20},{40,40}}, rotation=0)));
    DHT ext(N=N, T(start=Tstart)) "External surface" annotation (Placement(
          transformation(extent={{-40,-42},{40,-20}}, rotation=0)));
  equation
    assert(rext > rint, "External radius must be greater than internal radius");
    Am = (rext^2 - rint^2)*pi "Area of the metal cross section";
    rhomcm*Am*der(T) = rint*2*pi*int.phi + rext*2*pi*ext.phi "Energy balance";
    if WallRes then
      int.phi = lambda/(rint*log((rint + rext)/(2*rint)))*(int.T - T)
        "Heat conduction through the internal half-thickness";
      ext.phi = lambda/(rext*log((2*rext)/(rint + rext)))*(ext.T - T)
        "Heat conduction through the external half-thickness";
    else
      // No temperature gradients across the thickness
      int.T = T;
      ext.T = T;
    end if;
  initial equation
    if initOpt == Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.fixedState then
      T = Tstart;
    elseif initOpt == Choices.Init.Options.steadyState then
      der(T) = zeros(N);
    elseif initOpt == Choices.Init.Options.steadyStateNoT then
      // do nothing
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Icon(graphics={
          Text(
            extent={{-100,60},{-40,20}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Int"),
          Text(
            extent={{-100,-20},{-40,-60}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Ext"),
          Text(
            extent={{-138,-60},{142,-100}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>This is the model of a cylindrical tube of solid material.
<p>The heat capacity (which is lumped at the center of the tube thickness) is accounted for, as well as the thermal resistance due to the finite heat conduction coefficient. Longitudinal heat conduction is neglected.
<p><b>Modelling options</b></p>
<p>The following options are available:
<ul>
<li><tt>WallRes = false</tt>: the thermal resistance of the tube wall is neglected.
<li><tt>WallRes = true</tt>: the thermal resistance of the tube wall is accounted for.
</ul>
</HTML>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),   Diagram(graphics));
  end MetalTubeFEM;

  model MetalWallFV "Generic metal wall model with Nw finite volumes"
    extends ThermoPower.Icons.MetalWall;
    parameter Integer Nw = 1 "Number of volumes on the wall ports";
    parameter SI.Mass M "Mass";
    parameter SI.SpecificHeatCapacity cm "Specific heat capacity of metal";
    parameter SI.HeatCapacity Cm = M*cm "Heat capacity of the wall";
    parameter Boolean WallRes=false "Wall thermal resistance accounted for";
    parameter SI.ThermalConductance UA_ext = 0
      "Equivalent thermal conductance of outer half-wall"
      annotation(Dialog(enable = WallRes));
    parameter SI.ThermalConductance UA_int = UA_ext
      "Equivalent thermal conductance of inner half-wall"
      annotation(Dialog(enable = WallRes));
    parameter SI.Temperature Tstartbar=300 "Average temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature Tstart1=Tstartbar
      "Temperature start value - first volume"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature TstartN=Tstartbar
      "Temperature start value - last volume"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature Tvolstart[Nw]=
      Functions.linspaceExt(Tstart1, TstartN, Nw)
          annotation (Dialog(tab="Initialisation"));
    parameter ThermoPower.Choices.Init.Options initOpt = system.initOpt
      "Initialisation option" annotation (Dialog(tab="Initialisation"));
    constant Real pi=Modelica.Constants.pi;
    outer ThermoPower.System system "System wide properties";
    Units.AbsoluteTemperature Tvol[Nw](start=Tvolstart) "Volume temperatures";
    ThermoPower.Thermal.DHTVolumes int(final N=Nw, T(start=Tvolstart))
      "Internal surface"
       annotation (Placement(transformation(extent={{-40,20},{40,40}}, rotation=0)));
    ThermoPower.Thermal.DHTVolumes ext(final N=Nw, T(start=Tvolstart))
      "External surface"
       annotation (Placement(transformation(extent={{-40,-42},{40,-20}}, rotation=0)));
  equation
    (Cm/Nw)*der(Tvol) = int.Q + ext.Q "Energy balance";
    if WallRes then
      assert(UA_int > 0 and UA_ext > 0, "Assign positive values to UA_int, UA_ext");
      ext.Q = (ext.T-Tvol)*UA_ext/Nw;
      int.Q = (int.T-Tvol)*UA_int/Nw;
    else
      // No temperature gradients across the thickness
      ext.T = Tvol;
      int.T = Tvol;
    end if;
  initial equation
    if initOpt == ThermoPower.Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.fixedState then
      Tvol = Tvolstart;
    elseif initOpt == ThermoPower.Choices.Init.Options.steadyState then
      der(Tvol) = zeros(Nw);
    elseif initOpt == ThermoPower.Choices.Init.Options.steadyStateNoT then
      // do nothing
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Icon(graphics={
          Text(
            extent={{-100,60},{-40,20}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Int"),
          Text(
            extent={{-100,-20},{-40,-60}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Ext"),
          Text(
            extent={{-138,-60},{142,-100}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<html>
<p>Finite volumes 1D model of a generic wall for 1D heat exchangers.</p>
<p>The heat capacity of the wall is accounted for, and lumped half-way between the inner and outer surfaces.</p>
<p>The thermal resistance of the wall is optionally accounted for by setting WallRes = true; in that case, the total heat conductance of the outer and inner half-layers of the wall must then be set. For a flat (or approximately flat) wall with surface S, thickness d and conductivity lambda, both parameters are equal to 2*S*lambda/d.</p>
<h4>Modelling options</h4>
<p>The following options are available: </p>
<ul>
<li><code>WallRes = false</code>: the thermal resistance of the wall is neglected. </li>
<li><code>WallRes = true</code>: the thermal resistance of the wall is accounted for. </li>
</ul>
</html>", revisions="<html>
<ul>
<li>11 Jul 2014 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>Added support for wall resistance.</li>
<li><i>30 May 2005</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>Initialisation support added.</li>
<li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>First release. </li>
</ul>
</html>"),
      Diagram(graphics));
  end MetalWallFV;

  model MetalWallFEM "Generic metal wall - 1 radial node and N axial nodes"
    extends ThermoPower.Icons.MetalWall;
    parameter Integer N(min=1) = 2 "Number of nodes";
    parameter SI.Mass M "Mass";
    parameter SI.Area Sint "Internal surface";
    parameter SI.Area Sext "External surface";
    parameter SI.SpecificHeatCapacity cm "Specific heat capacity of metal";
    parameter SI.HeatCapacity Cm = M*cm "Heat capacity of the wall";
    parameter SI.Temperature Tstartbar=300 "Avarage temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature Tstart1=Tstartbar
      "Temperature start value - first node"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature TstartN=Tstartbar
      "Temperature start value - last node"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature Tstart[N]=Functions.linspaceExt(
          Tstart1,
          TstartN,
          N) "Start value of temperature vector (initialized by default)"
      annotation (Dialog(tab="Initialisation"));
    parameter ThermoPower.Choices.Init.Options initOpt = system.initOpt
      "Initialisation option" annotation (Dialog(tab="Initialisation"));
    constant Real pi=Modelica.Constants.pi;
    outer ThermoPower.System system "System wide properties";
    Units.AbsoluteTemperature T[N](start=Tstart) "Node temperatures";
    ThermoPower.Thermal.DHT int(N=N, T(start=Tstart)) "Internal surface"
      annotation (Placement(transformation(extent={{-40,20},{40,40}}, rotation=
              0)));
    ThermoPower.Thermal.DHT ext(N=N, T(start=Tstart)) "External surface"
      annotation (Placement(transformation(extent={{-40,-42},{40,-20}},
            rotation=0)));
  equation
    Cm*der(T) = Sint*int.phi + Sext*ext.phi "Energy balance";
    // No temperature gradients across the thickness
    int.T = T;
    ext.T = T;
  initial equation
    if initOpt == ThermoPower.Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.fixedState then
      T = Tstart;
    elseif initOpt == ThermoPower.Choices.Init.Options.steadyState then
      der(T) = zeros(N);
    elseif initOpt == ThermoPower.Choices.Init.Options.steadyStateNoT then
      // do nothing
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Icon(graphics={
          Text(
            extent={{-100,60},{-40,20}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Int"),
          Text(
            extent={{-100,-20},{-40,-60}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Ext"),
          Text(
            extent={{-138,-60},{142,-100}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>This is the model of a cylindrical tube of solid material.
<p>The heat capacity (which is lumped at the center of the tube thickness) is accounted for, as well as the thermal resistance due to the finite heat conduction coefficient. Longitudinal heat conduction is neglected.
<p><b>Modelling options</b></p>
<p>The following options are available:
<ul>
<li><tt>WallRes = false</tt>: the thermal resistance of the tube wall is neglected.
<li><tt>WallRes = true</tt>: the thermal resistance of the tube wall is accounted for.
</ul>
</HTML>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),   Diagram(graphics));
  end MetalWallFEM;

  model HeatExchangerTopologyFV
    "Connects two DHTVolumes ports according to a selected heat exchanger topology"
    extends Icons.HeatFlow;
    parameter Integer Nw "Number of volumes";
    replaceable model HeatExchangerTopology =
        HeatExchangerTopologies.CoCurrentFlow
      constrainedby ThermoPower.Thermal.BaseClasses.HeatExchangerTopologyData
      annotation(choicesAllMatching=true);

    HeatExchangerTopology HET(final Nw = Nw);

    Thermal.DHTVolumes side1(final N=Nw) annotation (Placement(transformation(extent={{-40,20},
              {40,40}}, rotation=0)));
    Thermal.DHTVolumes side2(final N=Nw) annotation (Placement(transformation(extent={{-40,-42},
              {40,-20}}, rotation=0)));

  equation
    for j in 1:Nw loop
      side2.T[HET.correspondingVolumes[j]] = side1.T[j];
      side2.Q[HET.correspondingVolumes[j]] + side1.Q[j] = 0;
    end for;
    annotation (
      Diagram(graphics),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
           graphics));
  end HeatExchangerTopologyFV;

  model CounterCurrentFV
    "Connects two DHTVolume ports according to a counter-current flow configuration"
    extends ThermoPower.Thermal.HeatExchangerTopologyFV(
      redeclare model HeatExchangerTopology =
          HeatExchangerTopologies.CounterCurrentFlow);
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}),
                     graphics={
          Polygon(
            points={{-74,2},{-48,8},{-74,16},{-56,8},{-74,2}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{74,-16},{60,-10},{74,-2},{52,-10},{74,-16}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid)}),
                                   Documentation(info="<HTML>
<p>This component can be used to model counter-current heat transfer. The temperature and flux vectors on one side are swapped with respect to the other side. This means that the temperature of node <tt>j</tt> on side 1 is equal to the temperature of note <tt>N-j+1</tt> on side 2; heat fluxes behave correspondingly.
<p>
The swapping is performed if the counterCurrent parameter is true (default value).
</HTML>", revisions="<html>
<ul>
<li><i>25 Aug 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       <tt>counterCurrent</tt> parameter added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>

</html>
"));
  end CounterCurrentFV;

  model CounterCurrentFEM
    "Counter-current heat transfer adaptor for 1D FEM heat exchangers"
    extends Icons.HeatFlow;
    parameter Integer N=2 "Number of Nodes";
    parameter Boolean counterCurrent=true
      "Swap temperature and flux vector order";
    Thermal.DHTNodes side1(N=N) annotation (Placement(transformation(extent={{-40,20},
              {40,40}}, rotation=0)));
    Thermal.DHTNodes side2(N=N) annotation (Placement(transformation(extent={{-40,-42},
              {40,-20}}, rotation=0)));
  equation
    // Swap temperature and flux vector order
    if counterCurrent then
      side1.phi = -side2.phi[N:-1:1];
      side1.T = side2.T[N:-1:1];
    else
      side1.phi = -side2.phi;
      side1.T = side2.T;
    end if;
    annotation (Icon(graphics={
          Polygon(
            points={{-74,2},{-48,8},{-74,16},{-56,8},{-74,2}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{74,-16},{60,-10},{74,-2},{52,-10},{74,-16}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid)}),
                                   Documentation(info="<HTML>
<p>This component can be used to model counter-current heat transfer. The temperature and flux vectors on one side are swapped with respect to the other side. This means that the temperature of node <tt>j</tt> on side 1 is equal to the temperature of note <tt>N-j+1</tt> on side 2; heat fluxes behave correspondingly.
<p>
The swapping is performed if the counterCurrent parameter is true (default value).
</HTML>", revisions="<html>
<ul>
<li><i>25 Aug 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       <tt>counterCurrent</tt> parameter added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>

</html>
"));
  end CounterCurrentFEM;

  model ConvHTLumped "Lumped parameter convective heat transfer"
    extends Icons.HeatFlow;
    parameter SI.ThermalConductance G "Constant thermal conductance";
    HT side1 annotation (Placement(transformation(extent={{-40,20},{40,40}},
            rotation=0)));
    HT side2 annotation (Placement(transformation(extent={{-40,-20},{40,-42}},
            rotation=0)));
  equation
    side1.Q_flow = G*(side1.T - side2.T) "Convective heat transfer";
    side1.Q_flow = -side2.Q_flow "Energy balance";
    annotation (Icon(graphics={Text(
            extent={{-98,-76},{102,-100}},
            lineColor={191,95,0},
            textString="%name")}), Documentation(info="<HTML>
<p>Model of a simple convective heat transfer mechanism between two lumped parameter objects, with a constant heat transfer coefficient.
</HTML>", revisions="<html>
<li><i>28 Dic 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end ConvHTLumped;

  package HeatTransferFV "Heat transfer models for FV components"
    model IdealHeatTransfer
      "Delta T across the boundary layer is zero (infinite h.t.c.)"
      extends BaseClasses.DistributedHeatTransferFV(final useAverageTemperature=false);
    equation
      assert(Nw ==  Nf - 1, "Number of volumes Nw on wall side should be equal to number of volumes fluid side Nf - 1");

      for j in 1:Nw loop
        wall.T[j] = T[j+1] "Ideal infinite heat transfer";
      end for;
    end IdealHeatTransfer;

    model ConstantHeatTransferCoefficient "Constant heat transfer coefficient"
      extends BaseClasses.DistributedHeatTransferFV;

       parameter SI.CoefficientOfHeatTransfer gamma
        "Constant heat transfer coefficient";
       parameter Boolean adaptiveAverageTemperature = true
        "Adapt the average temperature at low flow rates";
       parameter Modelica.SIunits.PerUnit sigma = 0.1
        "Fraction of nominal flow rate below which the heat transfer is computed on outlet volume temperatures";

       SI.PerUnit w_wnom "Ratio between actual and nominal flow rate";
       Medium.Temperature Tvol[Nw] "Fluid temperature in the volumes";
    equation
      assert(Nw ==  Nf - 1, "The number of volumes Nw on wall side should be equal to number of volumes fluid side Nf - 1");

      w_wnom = abs(w[1])/wnom;
      for j in 1:Nw loop
         Tvol[j] =
           if not useAverageTemperature then T[j+1]
           else if not adaptiveAverageTemperature then (T[j] + T[j + 1])/2
           else (T[j]+T[j+1])/2 + (T[j+1]-T[j])/2*exp(-w_wnom/sigma);
         Qw[j] = (Tw[j] - Tvol[j])*omega*l*gamma*Nt;
      end for;

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}),
        Documentation(info="<html>
<p>This component assumes a uniform and connstant heat transfer coefficient gamma.</p>
<p>If useAverageTemperature=false, the outlet fluid temperature of each volume is used to compute the heat transfer, otherwise the average temperature between inlet and outlet is used.</p>
<p>In the latter case, the temperature distribution is accurately predicted if N &GT; NTU. However, non-physical temperature distributions and numerical problems can arise at low flows, when NTU increases. If adaptiveAverageTemperature=true, then the outlet temperature is used instead of the average one when w/wnom_ht &lt; sigma. This leads to physically realistic temperature distributions and better numerical properties at low or zero flows.</p>
</html>"));
    end ConstantHeatTransferCoefficient;

    model ConstantHeatTransferCoefficientTwoGrids
      "Constant heat transfer coefficient - different grids for fluid and wall side"
      extends BaseClasses.DistributedHeatTransferFV(
        final useAverageTemperature = true,
        Qvol=Qv);

       parameter SI.CoefficientOfHeatTransfer gamma
        "Constant heat transfer coefficient";
       final parameter Integer Nv = Nf - 1
        "Number of volumes on the fluid side";
       final parameter SI.Length lw = L/Nw "Length of volumes on the wall side";
       final parameter SI.Length lv = L/Nv
        "Length of volumes on the fluid side";
       Medium.Temperature Tv[Nf-1] "Fluid temperature in the volumes";
       SI.Power Qv[Nf-1] "Heat flows entering the volumes";
       final parameter SI.PerUnit Hv[min(Nw,Nv),Nv] = getH(Nw,Nv)
        "Sums heat flows on fluid side onto coarser grid"
        annotation(Evaluate = true);
       final parameter SI.PerUnit Hw[min(Nw,Nv),Nw] = getH(Nv,Nw)
        "Sums heat flows on wall side onto coarser grid"
        annotation(Evaluate = true);
       final parameter SI.PerUnit G[max(Nw,Nv),min(Nw,Nv)] = transpose(getH(min(Nw,Nv),max(Nw,Nv)))
        "Maps temperatures on coarser grid onto finer grid"
        annotation(Evaluate = true);

    protected
       function getH
         input Integer N1;
         input Integer N2;
         output SI.PerUnit H[min(N1,N2),N2];
      protected
          Integer D;
       algorithm
         assert(rem(N1,N2) == 0 or rem(N2,N1)==0,
          "Please choose grids so that the number of wall volumes is a (sub)multiple of the fluid volumes");
         H := zeros(min(N1,N2),N2);
         D := div(N2,N1);
         if N2 > min(N1,N2) then
           for i in 1:N1 loop
             for j in 1:D loop
               H[i,(i-1)*D+j] :=1;
             end for;
           end for;
         else
           H := identity(N2);
         end if;
       end getH;

    equation
      Hv*Qv = Hw*Qw "Energy balance on coarser grid";
      if Nw >= Nv then
        Qw = omega*lw*gamma*(Tw - G*Tv)
          "Convective heat transfer on finer grid";
      else
        Qv = omega*lv*gamma*(Tv - G*Tw)
          "Convective heat transfer on finer grid";
      end if;
      for j in 1:Nv loop
         Tv[j] = (T[j] + T[j + 1])/2;
      end for;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end ConstantHeatTransferCoefficientTwoGrids;

    model ConstantThermalConductance
      "Constant global thermal conductance (UA value)"
      extends ConstantHeatTransferCoefficient(
        final gamma = UA/(omega*L*Nt));

      parameter SI.ThermalConductance UA
        "Global thermal conductance (UA value), for Nt tubes";
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}),
        Documentation(info="<html>Same as <a href=\"ConstantHeatTransferCoefficient\">ConstantHeatTransferCoefficient</a>, except that
the global nominal thermal conductance UA is given instead of the nominal specific heat transfer coefficient.
</html>"));
    end ConstantThermalConductance;

    model FlowDependentHeatTransferCoefficient
      "Flow-dependent h.t.c. gamma = gamma_nom*(w/wnom)^alpha"
      extends BaseClasses.DistributedHeatTransferFV;

       parameter SI.CoefficientOfHeatTransfer gamma_nom
        "Nominal heat transfer coefficient";
       parameter SI.PerUnit alpha "Exponent in the flow-dependency law";
       parameter SI.PerUnit beta = 0.1
        "Fraction of nominal flow rate below which the heat transfer is not reduced";
       parameter SI.MassFlowRate wnom_ht = wnom
        "Nominal flow rate for heat transfer correlation (single tube)";
       parameter Boolean adaptiveAverageTemperature = true
        "Adapt the average temperature at low flow rates";
       parameter Modelica.SIunits.PerUnit sigma = 0.1
        "Fraction of nominal flow rate below which the heat transfer is computed on outlet volume temperatures";
       Medium.Temperature Tvol[Nw] "Fluid temperature in the volumes";
       SI.CoefficientOfHeatTransfer gamma(start = gamma_nom)
        "Actual heat transfer coefficient";
       SI.PerUnit w_wnom(start = 1, final unit = "1")
        "Ratio between actual and nominal flow rate";
       SI.PerUnit w_wnom_reg
        "Regularized ratio between actual and nominal flow rate";
    equation
      assert(Nw ==  Nf - 1, "Number of volumes Nw on wall side should be equal to number of volumes fluid side Nf - 1");

      // Computation of actual heat transfer coefficient with smooth lower saturation to avoid numerical singularities at low flows
      w_wnom = abs(w[1])/wnom_ht;
      w_wnom_reg = Functions.smoothSat(w_wnom, beta, 1e9, beta/2);
      gamma = homotopy(gamma_nom*w_wnom_reg^alpha,
                       gamma_nom);

      for j in 1:Nw loop
         Tvol[j] =
           if not useAverageTemperature then T[j+1]
           else if not adaptiveAverageTemperature then (T[j] + T[j + 1])/2
           else (T[j]+T[j+1])/2 + (T[j+1]-T[j])/2*exp(-w_wnom/sigma);
         Qw[j] = (Tw[j] - Tvol[j])*gamma*omega*l*Nt;
      end for;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}),
        Documentation(info="<html>
<p>This component assumes a uniform heat transfer coefficient gamma_nom*(w/wnom_ht)^alpha. When w/wnom_ht &LT; beta the heat transfer coefficient stops decreasing, to avoid numerical problems at low flows.</p>
<p>If useAverageTemperature=false, the outlet fluid temperature of each volume is used to compute the heat transfer, otherwise the average temperature between inlet and outlet is used.</p>
<p>In the latter case, the temperature distribution is accurately predicted if N &GT; NTU. However, non-physical temperature distributions and numerical problems can arise at low flows, when NTU increases. If adaptiveAverageTemperature=true, then the outlet temperature is used instead of the average one when w/wnom_ht &lt; sigma. This leads to physically realistic temperature distributions and better numerical properties at low or zero flows.</p>
</html>"));
    end FlowDependentHeatTransferCoefficient;

    model FlowDependentThermalConductance
      "Flow-dependent global thermal conductance UA = UAnom*(w/wnom)^alpha"
      extends FlowDependentHeatTransferCoefficient(
        final gamma_nom = UAnom/(omega*L*Nt));
       parameter SI.ThermalConductance UAnom
        "Nominal global thermal conductance (UA value), for Nt tubes";
      SI.ThermalConductance UA = gamma*omega*L*Nt;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}),
        Documentation(info="<html>Same as <a href=\"FlowDependentHeatTransferCoefficient\">FlowDependentHeatTransferCoefficient</a>, except that
the global nominal thermal conductance UAnom is given instead of the nominal specific heat transfer coefficient.
</html>"));
    end FlowDependentThermalConductance;

    model DittusBoelter "Dittus-Boelter heat transfer correlation"
      extends BaseClasses.DistributedHeatTransferFV;
      parameter Boolean heating=true
        "true if fluid is heated, false if fluid is cooled";
      parameter Real Re_min=10000 "Minimum Reynolds number";
      final parameter Real Pr_min=0.7 "Minimum Prandtl number";
      final parameter Real Pr_max=160 "Maximum Prandtl number";
      SI.CoefficientOfHeatTransfer gamma[Nf]
        "Heat transfer coefficients at the nodes";
      SI.CoefficientOfHeatTransfer gamma_vol[Nw]
        "Heat transfer coefficients at the volumes";
      Medium.Temperature Tvol[Nw] "Fluid temperature in the volumes";
      Medium.DynamicViscosity mu[Nf] "Dynamic viscosity";
      Medium.ThermalConductivity k[Nf] "Thermal conductivity";
      Medium.SpecificHeatCapacity cp[Nf] "Heat capacity at constant pressure";
      SI.PerUnit Re[Nf] "Reynolds number";
      SI.PerUnit Pr[Nf] "Prandtl numbers";
      SI.PerUnit Re_l[Nf] "Reynolds number limited to validity range";
      SI.PerUnit Pr_l[Nf] "Prandtl number limited to validity range";

    equation
      assert(Nw == Nf - 1, "Number of volumes Nw on wall side should be equal to number of volumes fluid side Nf - 1");
      // Fluid properties at the nodes
      for j in 1:Nf loop
        mu[j] = Medium.dynamicViscosity(fluidState[j]);
        k[j] = Medium.thermalConductivity(fluidState[j]);
        cp[j] = Medium.heatCapacity_cp(fluidState[j]);
        Re[j] = abs(w[j]*Dhyd/(A*mu[j]));
        Pr[j] = cp[j]*mu[j]/k[j];
        Re_l[j] = Functions.smoothSat(
              Re[j],
              Re_min,
              1e9,
              Re_min/2);
        Pr_l[j] = Functions.smoothSat(
              Pr[j],
              Pr_min,
              Pr_max,
              Pr_min/2,
              Pr_max/10);
        if heating then
          gamma[j] = 0.023*k[j]/Dhyd*Re_l[j]^0.8*Pr_l[j]^0.4;
        else
          gamma[j] = 0.023*k[j]/Dhyd*Re_l[j]^0.8*Pr_l[j]^0.3;
        end if;
      end for;

      for j in 1:Nw loop
         Tvol[j]      = if useAverageTemperature then (T[j] + T[j + 1])/2       else T[j + 1];
         gamma_vol[j] = if useAverageTemperature then (gamma[j] + gamma[j+1])/2 else gamma[j+1];
         Qw[j] = (Tw[j] - Tvol[j])*omega*l*gamma_vol[j]*Nt;
      end for;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end DittusBoelter;

    model HeatTransfer2phDB "Dittus-Boelter 1-phase, constant h.t.c. 2-phase"
      extends BaseClasses.DistributedHeatTransferFV(
        final useAverageTemperature,
        redeclare replaceable package Medium =
            Modelica.Media.Interfaces.PartialTwoPhaseMedium);

      parameter SI.CoefficientOfHeatTransfer gamma_b=20000
        "Coefficient of heat transfer in the 2-phase region";

      Real state[Nw] "Indicator of phase configuration";
      SI.PerUnit alpha_l[Nw](each unit = "1")
        "Normalized position of liquid phase boundary";
      SI.PerUnit alpha_v[Nw](each unit = "1")
        "Normalized position of vapour phase boundary";
      SI.CoefficientOfHeatTransfer gamma1ph[Nf]
        "Heat transfer coefficient for 1-phase fluid";
      SI.CoefficientOfHeatTransfer gamma_bubble
        "Heat transfer coefficient for 1-phase fluid at liquid phase boundary";
      SI.CoefficientOfHeatTransfer gamma_dew
        "Heat transfer coefficient for 1-phase fluid at vapour phase boundary";
      SI.CoefficientOfHeatTransfer gamma2ph = gamma_b
        "Heat transfer coefficient for 2-phase mixture";
      Medium.SpecificEnthalpy h[Nf] "Fluid specific enthalpy";
      Medium.SpecificEnthalpy hl "Saturated liquid enthalpy";
      Medium.SpecificEnthalpy hv "Saturated vapour enthalpy";
      Medium.Temperature Tvol[Nw] "Fluid average temperature in the volumes";
      Medium.Temperature Ts "Saturated water temperature";
      Medium.SaturationProperties sat "Properties of saturated fluid";
      Medium.ThermodynamicState bubble "Bubble point, one-phase side";
      Medium.ThermodynamicState dew "Dew point, one-phase side";
      Medium.AbsolutePressure p "Fluid pressure for property calculations";
      Medium.DynamicViscosity mu[Nf] "Dynamic viscosity";
      Medium.ThermalConductivity k[Nf] "Thermal conductivity";
      Medium.SpecificHeatCapacity cp[Nf] "Heat capacity at constant pressure";
      Medium.DynamicViscosity mu_bubble "Dynamic viscosity at bubble point";
      Medium.ThermalConductivity k_bubble
        "Thermal conductivity at bubble point";
      Medium.SpecificHeatCapacity cp_bubble
        "Heat capacity at constant pressure at bubble point";
      Medium.DynamicViscosity mu_dew "Dynamic viscosity at dew point";
      Medium.ThermalConductivity k_dew "Thermal conductivity at dew point";
      Medium.SpecificHeatCapacity cp_dew
        "Heat capacity at constant pressure at dew point";
      SI.Power Q "Total heat flow through lateral boundary";

    equation
      assert(Nw == Nf - 1, "The number of volumes Nw on wall side should be equal to number of volumes fluid side Nf - 1");

      // Saturated fluid property calculations
      p = Medium.pressure(fluidState[1]);
      sat = Medium.setSat_p(p);
      Ts = sat.Tsat;
      hl = Medium.bubbleEnthalpy(sat);
      hv = Medium.dewEnthalpy(sat);
      bubble = Medium.setBubbleState(sat,1);
      dew = Medium.setDewState(sat,1);
      mu_bubble = Medium.dynamicViscosity(bubble);
      k_bubble = Medium.thermalConductivity(bubble);
      cp_bubble = Medium.heatCapacity_cp(bubble);
      mu_dew =  Medium.dynamicViscosity(dew);
      k_dew = Medium.thermalConductivity(dew);
      cp_dew = Medium.heatCapacity_cp(dew);

      // Heat transfer coefficient at bubble/dew point
      gamma_bubble = Water.f_dittus_boelter(
        w[1],
        Dhyd,
        A,
        mu_bubble,
        k_bubble,
        cp_bubble);
      gamma_dew = Water.f_dittus_boelter(
        w[1],
        Dhyd,
        A,
        mu_dew,
        k_dew,
        cp_dew);

      // Fluid property calculations at nodes
      for j in 1:Nf loop
        h[j] = Medium.specificEnthalpy(fluidState[j]);
        /* to be fixed */
        mu[j] = Medium.dynamicViscosity(fluidState[j]);  //not all nodes, only 1-phase nodes
        k[j] = Medium.thermalConductivity(fluidState[j]); //not all nodes, only 1-phase nodes
        cp[j] = Medium.heatCapacity_cp(fluidState[j]); //not all nodes, only 1-phase nodes
        gamma1ph[j] = Water.f_dittus_boelter(
          w[j],
          Dhyd,
          A,
          mu[j],
          k[j],
          cp[j]);                                                     //not all nodes, only 1-phase nodes
        /* to be fixed */
      end for;

      for j in 1:Nw loop
         if noEvent((h[j] < hl and h[j + 1] < hl) or (h[j] > hv and h[j + 1]> hv)) then  // 1-phase liquid or vapour
           Qw[j] = (Tw[j] - Tvol[j])*omega*l*Nt*((gamma1ph[j] + gamma1ph[j+1])/2);
           state[j] = 1;
           alpha_l[j] = 0;
           alpha_v[j] = 0;
         elseif noEvent((h[j] < hl and h[j + 1] >= hl and h[j + 1] <= hv)) then          // liquid --> 2-phase
           Qw[j] = alpha_l[j]*      (Tw[j] - (T[j] + Ts)/2)*omega*l*Nt*((gamma1ph[j] + gamma_bubble)/2) +
                   (1 - alpha_l[j])*(Tw[j] - Ts)*omega*l*Nt*gamma2ph;
           state[j] = 2;
           alpha_l[j] = (hl - h[j])/(h[j + 1] - h[j]);
           alpha_v[j] = 0;
         elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] >= hl and h[j + 1]<= hv) then   // 2-phase
           Qw[j] = (Tw[j] - Ts)*omega*l*Nt*gamma2ph;
           state[j] = 3;
           alpha_l[j] = 0;
           alpha_v[j] = 0;
         elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] > hv) then                // 2-phase --> vapour
           //Qw[j] = alpha_v[j]*(Tw[j] - (T[j + 1] + Ts)/2)*omega*l*(gamma1ph[j] + gamma1ph[j+1])/2 + (1 - alpha_v[j])*(Tw[j] - Ts)*omega*l*gamma2ph;
           Qw[j] = alpha_v[j]*      (Tw[j] - (T[j + 1] + Ts)/2)*omega*l*Nt*(gamma_dew + gamma1ph[j+1])/2 +
                   (1 - alpha_v[j])*(Tw[j] - Ts)*omega*l*Nt*gamma2ph;
           state[j] = 4;
           alpha_l[j] = 0;
           alpha_v[j] = (h[j + 1] - hv)/(h[j + 1] - h[j]);
         elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] < hl) then                // 2-phase --> liquid
           Qw[j] = alpha_l[j]*      (Tw[j] - (T[j + 1] + Ts)/2)*omega*l*Nt*(gamma_bubble + gamma1ph[j+1])/2 +
                   (1 - alpha_l[j])*(Tw[j] - Ts)*omega*l*Nt*gamma2ph;
           state[j] = 5;
           alpha_l[j] = (hl - h[j + 1])/(h[j] - h[j + 1]);
           alpha_v[j] = 0;
         else // if noEvent(h[j] > hv and h[j + 1] <= hv and h[j + 1] >= hl) then        // vapour --> 2-phase
           Qw[j] = alpha_v[j]*      (Tw[j] - (T[j] + Ts)/2)*omega*l*Nt*(gamma1ph[j] + gamma_dew)/2 +
                   (1 - alpha_v[j])*(Tw[j] - Ts)*omega*l*Nt*gamma2ph;
           state[j] = 6;
           alpha_l[j] = 0;
           alpha_v[j] = (h[j] - hv)/(h[j] - h[j + 1]);
         end if;

         if useAverageTemperature then
           Tvol[j] = (T[j] + T[j + 1])/2;
         else
           Tvol[j] = T[j + 1];
         end if;
      end for;
       annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end HeatTransfer2phDB;

    model FlowDependentHeatTransferCoefficient2ph
      "Separate h.t.c.'s for each phase, each changing as (w/w_nom)^alpha"
      extends BaseClasses.DistributedHeatTransferFV(
        final useAverageTemperature,
        redeclare replaceable package Medium =
            Modelica.Media.Interfaces.PartialTwoPhaseMedium);
       parameter SI.MassFlowRate wnom_ht = wnom
        "Nominal flow rate for heat transfer correlation (single tube)";
       parameter SI.CoefficientOfHeatTransfer gamma_nom_liq
        "Nominal heat transfer coefficient, liquid phase";
       parameter SI.CoefficientOfHeatTransfer gamma_nom_2ph
        "Nominal average heat transfer coefficient, 2-phase";
       parameter SI.CoefficientOfHeatTransfer gamma_nom_vap
        "Nominal heat transfer coefficient, vapour phase";
       parameter SI.PerUnit alpha = 0.8 "Exponent in the flow-dependency law";
       parameter SI.PerUnit beta = 0.1
        "Fraction of nominal flow rate below which the heat transfer is not reduced";
       SI.CoefficientOfHeatTransfer gamma_liq
        "Actual heat transfer coefficient, liquid phase";
       SI.CoefficientOfHeatTransfer gamma_2ph
        "Actual heat transfer coefficient, 2-phase";
       SI.CoefficientOfHeatTransfer gamma_vap
        "Actual heat transfer coefficient, vapour phase";
       SI.PerUnit w_wnom(start = 1, final unit = "1")
        "Ratio between actual and nominal flow rate";
       SI.PerUnit w_wnom_reg "Regularized w/wnom ratio";

      Real state[Nw] "Indicator of phase configuration";
      SI.PerUnit alpha_l[Nw] "Normalized position of liquid phase boundary";
      SI.PerUnit alpha_v[Nw] "Normalized position of vapour phase boundary";
      Medium.SpecificEnthalpy h[Nf] "Fluid specific enthalpy";
      Medium.SpecificEnthalpy hl "Saturated liquid enthalpy";
      Medium.SpecificEnthalpy hv "Saturated vapour enthalpy";
      Medium.Temperature Tvol[Nw] "Fluid average temperature in the volumes";
      Medium.Temperature Ts "Saturated water temperature";
      Medium.SaturationProperties sat "Properties of saturated fluid";
      Medium.AbsolutePressure p "Fluid pressure for property calculations";
    equation
      assert(Nw == Nf - 1, "The number of volumes Nw on wall side should be equal to number of volumes fluid side Nf - 1");

      // Computation of actual h.t.c.'s
      w_wnom = abs(w[1])/wnom_ht
        "Inlet flow rate used for the computation of the h.t.c.";
      w_wnom_reg = Functions.smoothSat(w_wnom, beta, 1e9, beta/2)
        "Regularized w/wnom ratio";
      gamma_liq = homotopy(gamma_nom_liq*w_wnom_reg^alpha,
                           gamma_nom_liq);
      gamma_2ph = homotopy(gamma_nom_2ph*w_wnom_reg^alpha,
                           gamma_nom_2ph);
      gamma_vap = homotopy(gamma_nom_vap*w_wnom_reg^alpha,
                           gamma_nom_vap);

      // Saturated fluid property calculations
      p = Medium.pressure(fluidState[1]);
      sat = Medium.setSat_p(p);
      Ts = sat.Tsat;
      hl = Medium.bubbleEnthalpy(sat);
      hv = Medium.dewEnthalpy(sat);

      // Fluid property calculations at nodes
      for j in 1:Nf loop
        h[j] = Medium.specificEnthalpy(fluidState[j]);
      end for;

      for j in 1:Nw loop
         if noEvent(h[j] < hl and h[j + 1] < hl) then  // liquid
           Qw[j] = (Tw[j] - Tvol[j])*omega*l*Nt*gamma_liq;
           state[j] = 0;
           alpha_l[j] = 1;
           alpha_v[j] = 0;
         elseif noEvent(h[j] > hv and h[j + 1]> hv) then  // vapour
           Qw[j] = (Tw[j] - Tvol[j])*omega*l*Nt*gamma_vap;
           state[j] = 1;
           alpha_l[j] = 0;
           alpha_v[j] = 1;
         elseif noEvent((h[j] < hl and h[j + 1] >= hl and h[j + 1] <= hv)) then // liquid --> 2-phase
           Qw[j] = alpha_l[j]      *(Tw[j] - (T[j] + Ts)/2)*omega*l*Nt*gamma_liq +
                   (1 - alpha_l[j])*(Tw[j] - Ts)           *omega*l*Nt*gamma_2ph;
           state[j] = 2;
           alpha_l[j] = (hl - h[j])/(h[j + 1] - h[j]);
           alpha_v[j] = 0;
         elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] >= hl and h[j + 1]<= hv) then // 2-phase
           Qw[j] = (Tw[j] - Ts)*omega*l*Nt*gamma_2ph;
           state[j] = 3;
           alpha_l[j] = 0;
           alpha_v[j] = 0;
         elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] > hv) then // 2-phase --> vapour
           Qw[j] = alpha_v[j]      *(Tw[j] - (T[j + 1] + Ts)/2)*omega*l*Nt*gamma_vap +
                   (1 - alpha_v[j])*(Tw[j] - Ts)               *omega*l*Nt*gamma_2ph;
           state[j] = 4;
           alpha_l[j] = 0;
           alpha_v[j] = (h[j + 1] - hv)/(h[j + 1] - h[j]);
         elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] < hl) then // 2-phase --> liquid
           Qw[j] = alpha_l[j]      *(Tw[j] - (T[j + 1] + Ts)/2)*omega*l*Nt*gamma_liq +
                   (1 - alpha_l[j])*(Tw[j] - Ts)               *omega*l*Nt*gamma_2ph;
           state[j] = 5;
           alpha_l[j] = (hl - h[j + 1])/(h[j] - h[j + 1]);
           alpha_v[j] = 0;
         else // if noEvent(h[j] > hv and h[j + 1] <= hv and h[j + 1] >= hl) then        // vapour --> 2-phase
           Qw[j] = alpha_v[j]      *(Tw[j] - (T[j] + Ts)/2)*omega*l*Nt*gamma_vap +
                   (1 - alpha_v[j])*(Tw[j] - Ts)           *omega*l*Nt*gamma_2ph;
           state[j] = 6;
           alpha_l[j] = 0;
           alpha_v[j] = (h[j] - hv)/(h[j] - h[j + 1]);
         end if;

         if useAverageTemperature then
           Tvol[j] = (T[j] + T[j + 1])/2;
         else
           Tvol[j] = T[j + 1];
         end if;
      end for;
       annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end FlowDependentHeatTransferCoefficient2ph;
  end HeatTransferFV;

  package HeatTransferFEM "Heat transfer models for FEM components"
    model IdealHeatTransfer
      "Delta T across the boundary layer is zero (infinite h.t.c.)"
      extends BaseClasses.DistributedHeatTransferFEM;
    equation
      assert(Nw ==  Nf, "Number of nodes Nw on wall side should be equal to number of nodes on the fluid side Nf");

      T = Tw "Ideal infinite heat transfer";
    end IdealHeatTransfer;

    model ConstantHeatTransferCoefficient "Constant heat transfer coefficient"
      extends BaseClasses.DistributedHeatTransferFEM;

      parameter SI.CoefficientOfHeatTransfer gamma
        "Constant heat transfer coefficient";
    equation
      assert(Nw ==  Nf, "Number of nodes Nw on wall side should be equal to number of nodes on the fluid side Nf");

      for j in 1:Nw loop
         phi_w[j] = (Tw[j] - T[j])*gamma;
      end for;

      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end ConstantHeatTransferCoefficient;

    model ConstantThermalConductance
      "Constant global thermal conductance (UA value)"
      extends ConstantHeatTransferCoefficient(
        final gamma = UA/(omega*L*Nt));

      parameter SI.ThermalConductance UA
        "Global thermal conductance (UA value), for Nt tubes";
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end ConstantThermalConductance;

    model FlowDependentHeatTransferCoefficient
      "Flow-dependent h.t.c. gamma = gamma_nom*(w/wnom)^alpha"
      extends BaseClasses.DistributedHeatTransferFEM;

       parameter SI.CoefficientOfHeatTransfer gamma_nom
        "Nominal heat transfer coefficient";
       parameter SI.PerUnit alpha "Exponent in the flow-dependency law";
       parameter SI.PerUnit beta = 0.1
        "Fraction of nominal flow rate below which the heat transfer is not reduced";
       parameter SI.MassFlowRate wnom_ht = wnom
        "Nominal flow rate for heat transfer correlation (single tube)";
       SI.CoefficientOfHeatTransfer gamma(start = gamma_nom)
        "Actual heat transfer coefficient";
       SI.PerUnit w_wnom(start = 1, final unit = "1")
        "Ratio between actual and nominal flow rate";
       SI.PerUnit w_wnom_reg
        "Regularized ratio between actual and nominal flow rate";
    equation
      assert(Nw ==  Nf, "Number of nodes Nw on wall side should be equal to number of nodes on the fluid side Nf");

      // Computation of actual heat transfer coefficient with smooth lower saturation to avoid numerical singularities at low flows
      w_wnom = abs(w[1])/wnom_ht
        "Inlet flow rate used for the computation of the h.t.c.";
      w_wnom_reg = Functions.smoothSat(w_wnom, beta, 1e9, beta/2);
      gamma = homotopy(gamma_nom*w_wnom_reg^alpha,
                       gamma_nom);

      for j in 1:Nw loop
         phi_w[j] = (Tw[j] - T[j])*gamma;
      end for;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end FlowDependentHeatTransferCoefficient;

    model FlowDependentThermalConductance
      "Flow-dependent global thermal conductance UA = UAnom*(w/wnom)^alpha"
      extends FlowDependentHeatTransferCoefficient(
        final gamma_nom = UAnom/(omega*L*Nt));
       parameter SI.ThermalConductance UAnom
        "Nominal global thermal conductance (UA value), for Nt tubes";
      SI.ThermalConductance UA = gamma*omega*L*Nt;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end FlowDependentThermalConductance;

    model DittusBoelter "Dittus-Boelter heat transfer correlation"
      extends BaseClasses.DistributedHeatTransferFEM;
      parameter Boolean heating=true
        "true if fluid is heated, false if fluid is cooled";
      parameter Real Re_min=10000 "Minimum Reynolds number";
      final parameter Real Pr_min=0.7 "Minimum Prandtl number";
      final parameter Real Pr_max=160 "Maximum Prandtl number";
      SI.CoefficientOfHeatTransfer gamma[Nf]
        "Heat transfer coefficients at the nodes";
      Medium.DynamicViscosity mu[Nf] "Dynamic viscosity";
      Medium.ThermalConductivity k[Nf] "Thermal conductivity";
      Medium.SpecificHeatCapacity cp[Nf] "Heat capacity at constant pressure";
      SI.PerUnit Re[Nf] "Reynolds number";
      SI.PerUnit Pr[Nf] "Prandtl numbers";
      SI.PerUnit Re_l[Nf] "Reynolds number limited to validity range";
      SI.PerUnit Pr_l[Nf] "Prandtl number limited to validity range";
    equation
      assert(Nw ==  Nf, "Number of nodes Nw on wall side should be equal to number of nodes on the fluid side Nf");

      // Fluid properties and heat transfer coefficients at the nodes
      for j in 1:Nf loop
        mu[j] = Medium.dynamicViscosity(fluidState[j]);
        k[j] = Medium.thermalConductivity(fluidState[j]);
        cp[j] = Medium.heatCapacity_cp(fluidState[j]);
        Re[j] = abs(w[j]*Dhyd/(A*mu[j]));
        Pr[j] = cp[j]*mu[j]/k[j];
        Re_l[j] = Functions.smoothSat(
              Re[j],
              Re_min,
              1e9,
              Re_min/2);
        Pr_l[j] = Functions.smoothSat(
              Pr[j],
              Pr_min,
              Pr_max,
              Pr_min/2,
              Pr_max/10);
        if heating then
          gamma[j] = 0.023*k[j]/Dhyd*Re_l[j]^0.8*Pr_l[j]^0.4;
        else
          gamma[j] = 0.023*k[j]/Dhyd*Re_l[j]^0.8*Pr_l[j]^0.3;
        end if;
      end for;

      for j in 1:Nw loop
         phi_w[j] = (Tw[j] - T[j])*gamma[j];
      end for;
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                graphics),
        Icon(graphics={Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end DittusBoelter;

  end HeatTransferFEM;

  package MaterialProperties "Thermal and mechanical properties of materials"
    package Interfaces
      "This package provides interfaces for material property models"
      partial model PartialMaterial
        "Partial material properties (base model of all material models)"

        import Modelica.SIunits.*;

        // Constants to be set in Material
        constant String materialName "Name of the material";
        constant String materialDescription
          "Textual description of the material";

        constant PoissonNumber poissonRatio "Poisson ration of material";
        constant Density density "Density of material";

        // Material properties depending on the material state
        ModulusOfElasticity youngModulus "Young modulus of material";
        Stress yieldStress "Tensione di snervamento";
        Stress ultimateStress "Tensione di rottura";
        LinearExpansionCoefficient linearExpansionCoefficient
          "Linear expansion coefficient of the material";
        SpecificHeatCapacity specificHeatCapacity
          "Specific heat capacity of material";
        ThermalConductivity thermalConductivity
          "Thermal conductivity of the material";

        // Material thermodynamic state
        connector InputTemperature = input SI.Temperature;
        InputTemperature T "Material temperature";
      end PartialMaterial;
    end Interfaces;

    package Common "Implementation of material property models"
      model MaterialTable
        "Material property model based on table data and polynomial interpolations"

        import Poly =
          ThermoPower.Thermal.MaterialProperties.Functions.Polynomials_Temp;
        // Attenzione e' una funzione temporanea di Media!!!

        extends Interfaces.PartialMaterial(materialName="tableMaterial",
            materialDescription="tableMaterial");

        // Tables defining temperature dependent properties of material
      protected
        constant SI.ModulusOfElasticity[:, :] tableYoungModulus=fill(0, 0, 0)
          "Table for youngModulus(T)";
        constant SI.Stress[:, :] tableYieldStress=fill(0, 0, 0)
          "Table for yieldStress(T)";
        constant SI.Stress[:, :] tableUltimateStress=fill(0, 0, 0)
          "Table for ultimateStress(T)";
        constant SI.SpecificHeatCapacity[:, :] tableSpecificHeatCapacity=fill(0, 0, 0)
          "Table for cp(T)";
        constant SI.LinearExpansionCoefficient[:, :]
          tableLinearExpansionCoefficient=fill(0, 0,0) "Table for alfa(T)";
        constant SI.ThermalConductivity[:, :] tableThermalConductivity=fill(0, 0, 0)
          "Table for kappa(T)";
        // Functions to interpolate table data
      public
        constant Integer npol=2 "degree of polynomial used for fitting";
      protected
        final constant SI.ModulusOfElasticity poly_youngModulus[:]=if size(
            tableYoungModulus, 1) > 1 then Poly.fitting(
                  tableYoungModulus[:, 1],
                  tableYoungModulus[:, 2],
                  npol) else if size(tableYoungModulus, 1) == 1 then array(
                  0,
                  0,
                  tableYoungModulus[1, 2]) else zeros(npol + 1)
          annotation (keepConstant=true);
        final constant Real poly_yieldStress[:]=if size(tableYieldStress, 1) >
            1 then Poly.fitting(
                  tableYieldStress[:, 1],
                  tableYieldStress[:, 2],
                  npol) else if size(tableYieldStress, 1) == 1 then array(
                  0,
                  0,
                  tableYieldStress[1, 2]) else zeros(npol + 1)
          annotation (keepConstant=true);
        final constant Real poly_ultimateStress[:]=if size(tableUltimateStress,
            1) > 1 then Poly.fitting(
                  tableUltimateStress[:, 1],
                  tableUltimateStress[:, 2],
                  npol) else if size(tableUltimateStress, 1) == 1 then array(
                  0,
                  0,
                  tableUltimateStress[1, 2]) else zeros(npol + 1)
          annotation (keepConstant=true);
        final constant Real poly_cp[:]=if size(tableSpecificHeatCapacity, 1) >
            1 then Poly.fitting(
                  tableSpecificHeatCapacity[:, 1],
                  tableSpecificHeatCapacity[:, 2],
                  npol) else if size(tableSpecificHeatCapacity, 1) == 1 then
            array(0,
                  0,
                  tableSpecificHeatCapacity[1, 2]) else zeros(npol + 1)
          annotation (keepConstant=true);
        final constant Real poly_alfa[:]=if size(
            tableLinearExpansionCoefficient, 1) > 1 then Poly.fitting(
                  tableLinearExpansionCoefficient[:, 1],
                  tableLinearExpansionCoefficient[:, 2],
                  npol) else if size(tableLinearExpansionCoefficient, 1) == 1
             then array(
                  0,
                  0,
                  tableLinearExpansionCoefficient[1, 2]) else zeros(npol + 1)
          annotation (keepConstant=true);
        final constant Real poly_kappa[:]=if size(tableThermalConductivity, 1)
             > 1 then Poly.fitting(
                  tableThermalConductivity[:, 1],
                  tableThermalConductivity[:, 2],
                  npol) else if size(tableThermalConductivity, 1) == 1 then
            array(0,
                  0,
                  tableThermalConductivity[1, 2]) else zeros(npol + 1)
          annotation (keepConstant=true);

      equation
        // Table for main properties of the material should be defined!
        assert(size(tableYoungModulus, 1) > 0, "Material " + materialName +
          " can not be used without assigning tableYoungModulus.");
        assert(size(tableSpecificHeatCapacity, 1) > 0, "Material " +
          materialName +
          " can not be used without assigning tableYoungModulus.");
        assert(size(tableLinearExpansionCoefficient, 1) > 0, "Material " +
          materialName +
          " can not be used without assigning tableYoungModulus.");
        assert(size(tableThermalConductivity, 1) > 0, "Material " +
          materialName +
          " can not be used without assigning tableYoungModulus.");

        youngModulus = Poly.evaluate(poly_youngModulus, T);
        yieldStress = Poly.evaluate(poly_yieldStress, T);
        ultimateStress = Poly.evaluate(poly_ultimateStress, T);
        specificHeatCapacity = Poly.evaluate(poly_cp, T);
        linearExpansionCoefficient = Poly.evaluate(poly_alfa, T);
        thermalConductivity = Poly.evaluate(poly_kappa, T);
        annotation (Documentation(info="<html>
This model computes the thermal and mechanical properties of a generic material. The data is provided in the form of tables, and interpolated by polinomials.
<p>To use the model, set the material temperature to the desired value by a suitable equation.
</html>"));
      end MaterialTable;
    end Common;

    package Functions
      "Utility functions. Provide conversions and interpolation for table data."
      function CtoKTable
        extends Modelica.SIunits.Conversions.ConversionIcon;

        input Real[:, :] table_degC;
        output Real table_degK[size(table_degC, 1), size(table_degC, 2)];
      algorithm
        table_degK := table_degC;

        for i in 1:size(table_degC, 1) loop
          table_degK[i, 1] := Modelica.SIunits.Conversions.from_degC(table_degC[
            i, 1]);
        end for;
      end CtoKTable;

      package Polynomials_Temp "Temporary Functions operating on polynomials (including polynomial fitting), extracted from Modelica.Media.Incompressible.TableBased;
   only to be used in Material.MaterialTable"
        extends Modelica.Icons.Library;

        function evaluate "Evaluate polynomial at a given abszissa value"
          extends Modelica.Icons.Function;
          input Real p[:]
            "Polynomial coefficients (p[1] is coefficient of highest power)";
          input Real u "Abszissa value";
          output Real y "Value of polynomial at u";
        algorithm
          y := p[1];
          for j in 2:size(p, 1) loop
            y := p[j] + u*y;
          end for;
        end evaluate;

        function fitting
          "Computes the coefficients of a polynomial that fits a set of data points in a least-squares sense"
          extends Modelica.Icons.Function;
          input Real u[:] "Abscissa data values";
          input Real y[size(u, 1)] "Ordinate data values";
          input Integer n(min=1)
            "Order of desired polynomial that fits the data points (u,y)";
          output Real p[n + 1]
            "Polynomial coefficients of polynomial that fits the date points";
        protected
          Real V[size(u, 1), n + 1] "Vandermonde matrix";
        algorithm
          // Construct Vandermonde matrix
          V[:, n + 1] := ones(size(u, 1));
          for j in n:-1:1 loop
            V[:, j] := {u[i]*V[i, j + 1] for i in 1:size(u, 1)};
          end for;

          // Solve least squares problem
          p := Modelica.Math.Matrices.leastSquares(V, y);
        end fitting;
      end Polynomials_Temp;
      annotation (Documentation(info=""));
    end Functions;

    package Metals "Models of commonly used steel"
      model StandardSteel
        extends Common.MaterialTable(
          final materialName="Standard Steel",
          final materialDescription="Standard Steel",
          final density=7763,
          final poissonRatio=0.3,
          tableYoungModulus=Functions.CtoKTable([21, 1.923e11]),
          tableUltimateStress=Functions.CtoKTable([21, 4.83e8]),
          tableYieldStress=Functions.CtoKTable([21, 2.76e8]),
          tableLinearExpansionCoefficient=Functions.CtoKTable([21, 10.93e-6]),
          tableSpecificHeatCapacity=Functions.CtoKTable([21, 478.2]),
          tableThermalConductivity=Functions.CtoKTable([21, 62.30]));
      end StandardSteel;

      model CarbonSteel_A106C
        extends Common.MaterialTable(
          final materialName="ASME A106-C",
          final materialDescription="Carbon steel (%C <= 0.30)",
          final density=7763,
          final poissonRatio=0.3,
          tableYoungModulus=Functions.CtoKTable([21, 1.923e11; 93, 1.910e11;
              149, 1.889e11; 204, 1.861e11; 260, 1.820e11; 316, 1.772e11; 371,
              1.710e11; 427, 1.613e11; 482, 1.491e11; 538, 1.373e11]),
          tableUltimateStress=Functions.CtoKTable([21, 4.83e8]),
          tableYieldStress=Functions.CtoKTable([21, 2.76e8; 93, 2.50e8; 149,
              2.45e8; 204, 2.37e8; 260, 2.23e8; 316, 2.05e8; 371, 1.98e8; 427,
              1.84e8; 482, 1.75e8; 538, 1.57e8]),
          tableLinearExpansionCoefficient=Functions.CtoKTable([21, 10.93e-6; 93,
              11.48e-6; 149, 11.88e-6; 204, 12.28e-6; 260, 12.64e-6; 316,
              13.01e-6; 371, 13.39e-6; 427, 13.77e-6; 482, 14.11e-6; 538,
              14.35e-6]),
          tableSpecificHeatCapacity=Functions.CtoKTable([21, 478.2; 93, 494.1;
              149, 510.4; 204, 526.3; 260, 541.0; 316, 556.9; 371, 581.2; 427,
              608.8; 482, 665.3; 538, 684.6]),
          tableThermalConductivity=Functions.CtoKTable([21, 62.30; 93, 60.31;
              149, 57.45; 204, 54.68; 260, 51.57; 316, 48.97; 371, 46.38; 427,
              43.96; 482, 41.18; 538, 39.11]));
      end CarbonSteel_A106C;

      model CarbonSteel_A106B
        extends Common.MaterialTable(
          final materialName="ASME A106-B",
          final materialDescription="Carbon steel (%C <= 0.30)",
          final density=7763,
          final poissonRatio=0.3,
          tableYoungModulus=Functions.CtoKTable([21, 1.923e11; 93, 1.910e11;
              149, 1.889e11; 204, 1.861e11; 260, 1.820e11; 316, 1.772e11; 371,
              1.710e11; 427, 1.613e11; 482, 1.491e11; 538, 1.373e11]),
          tableUltimateStress=Functions.CtoKTable([21, 4.1412e8]),
          tableYieldStress=Functions.CtoKTable([40, 2.41e8; 100, 2.18e8; 150,
              2.14e8; 200, 2.08e8; 250, 1.98e8; 300, 1.83e8; 350, 1.75e8; 400,
              1.68e8; 450, 1.56e8; 475, 1.54e8]),
          tableLinearExpansionCoefficient=Functions.CtoKTable([21, 10.93e-6; 93,
              11.48e-6; 149, 11.88e-6; 204, 12.28e-6; 260, 12.64e-6; 316,
              13.01e-6; 371, 13.39e-6; 427, 13.77e-6; 482, 14.11e-6; 538,
              14.35e-6]),
          tableSpecificHeatCapacity=Functions.CtoKTable([21, 478.2; 93, 494.1;
              149, 510.4; 204, 526.3; 260, 541.0; 316, 556.9; 371, 581.2; 427,
              608.8; 482, 665.3; 538, 684.6]),
          tableThermalConductivity=Functions.CtoKTable([21, 62.30; 93, 60.31;
              149, 57.45; 204, 54.68; 260, 51.57; 316, 48.97; 371, 46.38; 427,
              43.96; 482, 41.18; 538, 39.11]));
      end CarbonSteel_A106B;

      model AlloySteel_A335P22
        extends Common.MaterialTable(
          final materialName="ASME A335-P22",
          final materialDescription="Alloy steel (2 1/4 Cr - 1 Mo)",
          final density=7763,
          final poissonRatio=0.3,
          tableYoungModulus=Functions.CtoKTable([21, 2.061e11; 93, 2.034e11;
              149, 1.999e11; 204, 1.972e11; 260, 1.930e11; 316, 1.889e11; 371,
              1.834e11; 427, 1.772e11; 482, 1.689e11; 538, 1.586e11]),
          tableUltimateStress=Functions.CtoKTable([21, 4.1412e8]),
          tableYieldStress=Functions.CtoKTable([21, 2.07e8; 93, 1.92e8; 149,
              1.87e8; 204, 1.86e8; 260, 1.86e8; 316, 1.86e8; 371, 1.86e8; 427,
              1.84e8; 482, 1.77e8; 538, 1.63e8]),
          tableLinearExpansionCoefficient=Functions.CtoKTable([21, 10.93e-6; 93,
              11.48e-6; 149, 11.88e-6; 204, 12.28e-6; 260, 12.64e-6; 316,
              13.01e-6; 371, 13.39e-6; 427, 13.77e-6; 482, 14.11e-6; 538,
              14.35e-6]),
          tableSpecificHeatCapacity=Functions.CtoKTable([21, 478.2; 93, 494.1;
              149, 510.4; 204, 526.3; 260, 541.0; 316, 556.9; 371, 581.2; 427,
              608.8; 482, 665.3; 538, 684.6]),
          tableThermalConductivity=Functions.CtoKTable([21, 62.30; 93, 60.31;
              149, 57.45; 204, 54.68; 260, 51.57; 316, 48.97; 371, 46.38; 427,
              43.96; 482, 41.18; 538, 39.11]));
      end AlloySteel_A335P22;

      model AlloySteel_A335P12
        extends Common.MaterialTable(
          final materialName="ASME A335-P12",
          final materialDescription="Alloy steel (1 Cr - 1/2 Mo)",
          final density=7763,
          final poissonRatio=0.3,
          tableYoungModulus=Functions.CtoKTable([25, 2.050e11; 100, 2.000e11;
              150, 1.960e11; 200, 1.930e11; 250, 1.900e11; 300, 1.870e11; 350,
              1.830e11; 400, 1.790e11; 450, 1.740e11; 475, 1.720e11; 500,
              1.697e11; 550, 1.648e11]),
          tableUltimateStress=Functions.CtoKTable([21, 4.1404e8]),
          tableYieldStress=Functions.CtoKTable([40, 2.07e8; 100, 1.92e8; 150,
              1.85e8; 200, 1.81e8; 250, 1.79e8; 300, 1.76e8; 350, 1.66e8; 400,
              1.56e8; 425, 1.55e8; 450, 1.51e8; 475, 1.46e8; 500, 1.43e8; 525,
              1.39e8]),
          tableLinearExpansionCoefficient=Functions.CtoKTable([50, 10.49e-6;
              100, 11.08e-6; 150, 11.63e-6; 200, 12.14e-6; 250, 12.60e-6; 300,
              13.02e-6; 350, 13.40e-6; 400, 13.74e-6; 425, 13.89e-6; 450,
              14.02e-6; 500, 14.28e-6; 550, 14.50e-6]),
          tableSpecificHeatCapacity=Functions.CtoKTable([25, 439.5; 100, 477.2;
              150, 498.1; 200, 523.3; 250, 540.0; 300, 560.9; 350, 577.5; 400,
              602.8; 425, 611.2; 450, 627.9; 475, 644.6; 500, 657.2; 550, 690.7]),
          tableThermalConductivity=Functions.CtoKTable([25, 41.9; 100, 42.2;
              150, 41.9; 200, 41.4; 250, 40.6; 300, 39.7; 350, 38.5; 400, 37.4;
              425, 36.7; 450, 36.3; 475, 35.7; 500, 35.0; 550, 34.0]));

      end AlloySteel_A335P12;
    end Metals;

    package Test "Test cases"
      model TestMaterial
        import Modelica.SIunits.*;
        replaceable Metals.CarbonSteel_A106C Material(npol=3) constrainedby
          Interfaces.PartialMaterial "Material model";
        Temp_K T;
        Temp_C T_C;
        Stress E;
      equation
        T_C = 21 + 500*time;
        T = Modelica.SIunits.Conversions.from_degC(T_C);
        Material.T = T;
        E = Material.yieldStress;
      end TestMaterial;
    end Test;

    annotation (Documentation(revisions="<html>
<ul>
<li><i>8 June 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Partial restructuring of models.</li>
<li><i>1 May 2005</i>
    by <a href=\"mailto:luca.bascetta@polimi.it\">Luca Bascetta</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
This package contains models to compute the material properties needed to model heat transfer and thermo-mechanical stresses in objects such as turbine shafts or headers.
</html>"));
  end MaterialProperties;

  package HeatExchangerTopologies
    model CoCurrentFlow "Co-current flow"
      extends BaseClasses.HeatExchangerTopologyData(
        final correspondingVolumes = 1:Nw);
    end CoCurrentFlow;

    model CounterCurrentFlow "Counter-current flow"
      extends BaseClasses.HeatExchangerTopologyData(
        final correspondingVolumes=  Nw:-1:1);
    end CounterCurrentFlow;

    model ShellAndTube "Shell and tube (side1:tubes, side2:shell)"
      extends BaseClasses.HeatExchangerTopologyData(
        final correspondingVolumes=correspondingVolumesComputation(Nw, Ntp, inletTubeAtTop, inletShellAtTop));
      parameter Integer Ntp "Number of passes on the tube side";
      parameter Boolean inletTubeAtTop
        "Tube inlet at the top of heat exchanger";
      parameter Boolean inletShellAtTop
        "Shell inlet at the top of heat exchanger";

      function correspondingVolumesComputation
        input Integer Nw "Number of volumes";
        input Integer Ntp(min = 1, max = 2) "Number of passes tube-side";
        input Boolean inletTubeAtTop "Tube inlet at the top of heat exchanger";
        input Boolean inletShellAtTop
          "Shell inlet at the top of heat exchanger";
        output Integer correspondingVolumes[Nw];

      protected
        Integer k;
        Integer v[Nw],t1[div(Nw,2)],t2[div(Nw,2)];

      algorithm
        assert(mod(Nw,2) == 0,"Number of volumes must be even");
        assert(Ntp >= 1, "Number of passes tube-side must be greater than one");
        // side1 <---> tube
        // side2 <---> shell
        k := 1;
        correspondingVolumes[1] := k;
        if (inletTubeAtTop and inletShellAtTop) or (inletTubeAtTop == false and inletShellAtTop == false) then
          for j in 2:(div(Nw,2)) loop
            if (mod(j,2) == 0) then
                k := k+3;
            else
                k := k+1;
            end if;
            correspondingVolumes[j] := k;
          end for;
          if mod(div(Nw,2),2) == 0 then
            k := Nw - 1;
          else
            k := Nw;
          end if;
          for j in (div(Nw,2))+1:Nw loop
            correspondingVolumes[j] := k;
            if (mod(j,2) == 0) then
                k := k-3;
            else
                k := k-1;
            end if;
          end for;

        elseif (inletTubeAtTop == false and inletShellAtTop) then
          for j in 2:(div(Nw,2)) loop
            if (mod(j,2) == 0) then
                k := k+3;
            else
                k := k+1;
            end if;
            correspondingVolumes[j] := k;
          end for;

          if mod(div(Nw,2),2) == 0 then
            k := Nw - 1;
          else
            k := Nw;
          end if;
          for j in (div(Nw,2))+1:Nw loop
            correspondingVolumes[j] := k;
            if (mod(j,2) == 0) then
                k := k-3;
            else
                k := k-1;
            end if;
          end for;
          for j in 1:Nw loop
            v[j] := correspondingVolumes[Nw-j+1];
          end for;
          for j in 1:Nw loop
            correspondingVolumes[j] := v[j];
          end for;

        elseif (inletTubeAtTop and inletShellAtTop == false) then
          for j in 2:(div(Nw,2)) loop
            if (mod(j,2) == 0) then
                k := k+3;
            else
                k := k+1;
            end if;
            correspondingVolumes[j] := k;
          end for;
          if mod(div(Nw,2),2) == 0 then
            k := Nw - 1;
          else
            k := Nw;
          end if;
          for j in (div(Nw,2))+1:Nw loop
            correspondingVolumes[j] := k;
            if (mod(j,2) == 0) then
                k := k-3;
            else
                k := k-1;
            end if;
          end for;
          for j in 1:(div(Nw,2)) loop
            t1[j] := correspondingVolumes[j];
            t2[j] := correspondingVolumes[j+div(Nw,2)];
          end for;
          correspondingVolumes := cat(1,t2,t1);

        else
          assert(false,"Unsupported topology");
        end if;
      end correspondingVolumesComputation;

    end ShellAndTube;
  end HeatExchangerTopologies;

  package BaseClasses

    partial model DistributedHeatTransferFV
      "Base class for distributed heat transfer models - finite volumes"
      extends ThermoPower.Icons.HeatFlow;
      input Medium.ThermodynamicState fluidState[Nf];
      input Medium.MassFlowRate w[Nf];
        parameter Boolean useAverageTemperature = true
        "= true to use average temperature for heat transfer";
      ThermoPower.Thermal.DHTVolumes wall(final N=Nw) annotation (Placement(transformation(extent={{-40,20},{40,
                40}}, rotation=0)));
      // The medium model and the following parameters will be set by the Flow1D
      // models at instantiation not by end users
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        "Medium model"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter Integer Nf(min=2) = 2 "Number of nodes on the fluid side"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter Integer Nw = Nf - 1 "Number of volumes on the wall side"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter Integer Nt(min=1) "Number of tubes in parallel"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.Distance L "Tube length"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.Area A "Cross-sectional area (single tube)"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.Length omega
        "Wet perimeter of heat transfer surface (single tube)"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.Length Dhyd "Hydraulic Diameter (single tube)"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.MassFlowRate wnom "Nominal mass flow rate (single tube)"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      final parameter SI.Length l=L/(Nw) "Length of a single volume";

      Medium.Temperature T[Nf] "Temperatures at the fluid side nodes";
      Medium.Temperature Tw[Nw] "Temperatures of the wall volumes";
      SI.Power Qw[Nw] "Heat flows entering from the wall volumes";
      SI.Power Qvol[Nf-1] = Qw "Heat flows going to the fluid volumes";
      SI.Power Q "Total heat flow through lateral boundary";

    equation
      for j in 1:Nf loop
        T[j] = Medium.temperature(fluidState[j]);
      end for;
      Tw = wall.T;
      Qw = wall.Q;
      Q = sum(wall.Q);

    end DistributedHeatTransferFV;

    partial model DistributedHeatTransferFEM
      "Base class for distributed heat transfer models - finite elements"
      extends ThermoPower.Icons.HeatFlow;
      input Medium.ThermodynamicState fluidState[Nf];
      input Medium.MassFlowRate w[Nf];
      ThermoPower.Thermal.DHTNodes wall(final N=Nw) annotation (Placement(transformation(extent={{-40,20},{40,
                40}}, rotation=0)));
      // The medium model and the following parameters will be set by the Flow1D
      // models at instantiation not by end users
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        "Medium model"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter Integer Nf(min=2) = 2 "Number of nodes on the fluid side"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter Integer Nw = Nf "Number of nodes on the wall side"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter Integer Nt(min=1) "Number of tubes in parallel"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.Distance L "Tube length"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.Area A "Cross-sectional area (single tube)"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.Length omega
        "Wet perimeter of heat transfer surface (single tube)"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.Length Dhyd "Hydraulic Diameter (single tube)"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      parameter SI.MassFlowRate wnom "Nominal mass flow rate (single tube)"
        annotation(Dialog(enable=false, tab = "Set by Flow1D model"));
      final parameter SI.Length l=L/(Nw) "Length of a single volume";

      Medium.Temperature T[Nf] "Temperatures at the fluid side nodes";
      Medium.Temperature Tw[Nw] "Temperatures of the wall volumes";
      SI.HeatFlux phi_w[Nw] "Heat fluxes entering from the wall connector";
      SI.HeatFlux phi_f[Nf] = phi_w "Heat fluxes going to the fluid nodes";
      // SI.Power Q "Total heat flow through lateral boundary";

    equation
      for j in 1:Nf loop
        T[j] = Medium.temperature(fluidState[j]);
      end for;
      Tw = wall.T;
      phi_w = wall.phi;
      // Q = sum(wall.Q);

    end DistributedHeatTransferFEM;

    partial model HeatExchangerTopologyData
      "Base class for heat exchanger topology data"
      parameter Integer Nw "Number of volumes on both sides";
      parameter Integer correspondingVolumes[Nw]
        "Indeces of corresponding volumes";
    end HeatExchangerTopologyData;
  end BaseClasses;

  connector HThtc
    "Thermal port for lumped parameter heat transfer with outgoing heat transfer coefficient"
    extends HT;
    output SI.ThermalConductance G "Thermal conductance";
  end HThtc;

  connector HThtc_in
    "Thermal port for lumped parameter heat transfer with incoming heat transfer coefficient"
    extends HT;
    input SI.ThermalConductance G "Thermal conductance";
  end HThtc_in;

  connector DHT "Distributed Heat Terminal"
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N(min=1) = 2 "Number of nodes";
    SI.Temperature T[N] "Temperature at the nodes";
    flow SI.HeatFlux phi[N] "Heat flux at the nodes";
    annotation (Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={255,127,0},
            fillColor={255,127,0},
            fillPattern=FillPattern.Solid)}));
  end DHT;

  connector DHThtc
    "Distributed Heat Terminal with heat transfer coefficient output"
    extends DHT;
    output SI.CoefficientOfHeatTransfer gamma[N] "Heat transfer coefficient";
  end DHThtc;

  connector DHThtc_in
    "Distributed Heat Terminal with heat transfer coefficient input"
    extends DHT;
    input SI.CoefficientOfHeatTransfer gamma[N] "Heat transfer coefficient";
  end DHThtc_in;

  model DHThtc_DHT "DHThtc to DHT adapter"
    extends Modelica.Icons.ObsoleteModel;

    DHT DHT_port(N=N) annotation (Placement(transformation(extent={{100,40},{
              120,-40}}, rotation=0)));
    DHThtc_in DHThtc_port(N=N) annotation (Placement(transformation(
          origin={-110,0},
          extent={{40,-10},{-40,10}},
          rotation=90)));

    parameter Integer N(min=1) = 2 "Number of nodes";

  equation
    DHT_port.T = DHThtc_port.T;
    DHT_port.phi + DHThtc_port.phi = zeros(N);
    annotation (Diagram(graphics), Icon(graphics={
          Text(
            extent={{-90,10},{40,100}},
            lineColor={0,0,0},
            lineThickness=1,
            textString="DHThtc"),
          Text(
            extent={{-10,-92},{96,-20}},
            lineColor={0,0,0},
            textString="DHT"),
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={255,128,0}),
          Line(points={{100,100},{-100,-100}}, color={255,128,0})}));
  end DHThtc_DHT;

  model HT_DHT "HT to DHT adaptor"
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N=1 "Number of nodes on DHT side";
    parameter SI.Area exchangeSurface "Area of heat transfer surface";
    HT HT_port annotation (Placement(transformation(extent={{-140,-16},{-100,24}},
            rotation=0)));
    DHT DHT_port(N=N) annotation (Placement(transformation(extent={{100,-40},{
              120,40}}, rotation=0)));
  equation
    for i in 1:N loop
      DHT_port.T[i] = HT_port.T "Uniform temperature distribution on DHT side";
    end for;
    if N == 1 then
      // Uniform flow distribution
      DHT_port.phi[1]*exchangeSurface + HT_port.Q_flow = 0 "Energy balance";
    else
      // Piecewise linear flow distribution
      sum(DHT_port.phi[1:N - 1] + DHT_port.phi[2:N])/2*exchangeSurface/(N - 1)
         + HT_port.Q_flow = 0 "Energy balance";
    end if;
    annotation (Icon(graphics={
          Polygon(
            points={{-100,100},{-100,-100},{100,100},{-100,100}},
            lineColor={185,0,0},
            fillColor={185,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{100,100},{100,-100},{-100,-100},{100,100}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-74,10},{24,88}},
            lineColor={255,255,255},
            lineThickness=1,
            textString="HT"),
          Text(
            extent={{-16,-84},{82,-6}},
            lineColor={255,255,255},
            lineThickness=1,
            textString="DHT"),
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            pattern=LinePattern.None)}), Diagram(graphics));
  end HT_DHT;

  model HThtc_DHThtc "HThtc to DHThtc adaptor"
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N=1 "Number of nodes on DHT side";
    parameter SI.Area exchangeSurface "Heat exchange surface";
    HThtc_in HT_port annotation (Placement(transformation(extent={{-140,-20},{-100,
              22}}, rotation=0)));
    DHThtc DHT_port(final N=1) annotation (Placement(transformation(extent={{
              100,-40},{120,40}}, rotation=0)));
  equation
    for i in 1:N loop
      DHT_port.T[i] = HT_port.T "Uniform temperature distribution on DHT side";
      DHT_port.gamma[i] = HT_port.G/exchangeSurface
        "Uniform h.t.c. distribution on DHT side";
    end for;
    sum(DHT_port.phi)*exchangeSurface/N + HT_port.Q_flow = 0 "Energy balance";
    annotation (Icon(graphics={
          Polygon(
            points={{-100,100},{-100,-100},{100,100},{-100,100}},
            lineColor={185,0,0},
            fillColor={185,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{100,100},{100,-100},{-100,-100},{100,100}},
            lineColor={255,128,0},
            fillColor={255,128,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-92,16},{30,90}},
            lineColor={255,255,255},
            lineThickness=1,
            textString="HT_htc"),
          Text(
            extent={{-40,-100},{94,-30}},
            lineColor={255,255,255},
            lineThickness=1,
            textString="DHT_htc"),
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            pattern=LinePattern.None)}), Diagram(graphics));
  end HThtc_DHThtc;

  model HeatSource1Dhtc "Distributed Heat Flow Source"
    extends HeatSource1D(redeclare Thermal.DHThtc_in wall);
    extends Modelica.Icons.ObsoleteModel;
  end HeatSource1Dhtc;

  model HeatSource1D "Distributed Heat Flow Source"
    extends Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N=2 "Number of nodes";
    parameter Integer Nt=1 "Number of tubes";
    parameter SI.Length L "Source length";
    parameter SI.Length omega "Source perimeter (single tube)";
    replaceable Thermal.DHT wall(N=N) annotation (Placement(transformation(
            extent={{-40,-40},{40,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput power annotation (Placement(
          transformation(
          origin={0,40},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    for i in 1:N loop
      wall.phi[i] = -power/(omega*L*Nt);
    end for;
    annotation (
      Diagram(graphics),
      Icon(graphics={Text(
            extent={{-100,-44},{100,-68}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>Model of an ideal tubular heat flow source, with uniform heat flux. The actual heating power is provided by the <tt>power</tt> signal connector.
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end HeatSource1D;

  model TempSource1D "Distributed Temperature Source"
    extends Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N=2 "Number of nodes";
    replaceable Thermal.DHT wall(N=N) annotation (Placement(transformation(
            extent={{-40,-40},{40,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput temperature annotation (Placement(
          transformation(
          origin={0,40},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    for i in 1:N loop
      wall.T[i] = temperature;
    end for;
    annotation (
      Diagram(graphics),
      Icon(graphics={Text(
            extent={{-100,-46},{100,-70}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>Model of an ideal 1D uniform temperature source. The actual temperature is provided by the <tt>temperature</tt> signal connector.
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"));
  end TempSource1D;

  model TempSource1Dlin "Linearly Distributed Temperature Source"
    extends Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N=2 "Number of nodes";
    replaceable Thermal.DHT wall(N=N) annotation (Placement(transformation(
            extent={{-40,-40},{40,-20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput temperature_node1 annotation (
        Placement(transformation(
          origin={-40,30},
          extent={{-20,-20},{20,20}},
          rotation=270)));
    Modelica.Blocks.Interfaces.RealInput temperature_nodeN annotation (
        Placement(transformation(
          origin={40,28},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    wall.T = linspace(
        temperature_node1,
        temperature_nodeN,
        N);
    annotation (
      Documentation(info="<HTML>
<p>Model of an ideal 1D temperature source with a linear distribution. The values of the temperature at the two ends of the source are provided by the <tt>temperature_node1</tt> and <tt>temperature_nodeN</tt> signal connectors.
</HTML>", revisions="<html>
<ul>
<li><i>10 Jan 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</html>
"),   Icon(graphics={Text(
            extent={{-100,-46},{100,-72}},
            lineColor={191,95,0},
            textString="%name")}));
  end TempSource1Dlin;

  model ConvHT "1D Convective heat transfer"
    extends Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N=2 "Number of Nodes";
    parameter SI.CoefficientOfHeatTransfer gamma
      "Constant heat transfer coefficient";

    DHT side1(N=N) annotation (Placement(transformation(extent={{-40,20},{40,40}},
            rotation=0)));
    DHT side2(N=N) annotation (Placement(transformation(extent={{-40,-42},{40,-20}},
            rotation=0)));
  equation
    side1.phi = gamma*(side1.T - side2.T) "Convective heat transfer";
    side1.phi = -side2.phi "Energy balance";
    annotation (Icon(graphics={Text(
            extent={{-100,-44},{100,-68}},
            lineColor={191,95,0},
            textString="%name")}), Documentation(info="<HTML>
<p>Model of a simple convective heat transfer mechanism between two 1D objects, with a constant heat transfer coefficient.
<p>Node <tt>j</tt> on side 1 interacts with node <tt>j</tt> on side 2.
</HTML>", revisions="<html>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end ConvHT;

  model ConvHTLumped_htc
    "Lumped parameter convective heat transfer between a HT and a HThtc"
    extends Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;

    HT otherside annotation (Placement(transformation(extent={{-40,-20},{40,-40}},
            rotation=0)));
    HThtc_in fluidside annotation (Placement(transformation(extent={{-40,20},{
              40,40}}, rotation=0)));
  equation
    fluidside.Q_flow = fluidside.G*(fluidside.T - otherside.T)
      "Convective heat transfer";
    fluidside.Q_flow + otherside.Q_flow = 0 "Energy balance";
    annotation (
      Icon(graphics={Text(
            extent={{-100,-74},{100,-100}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>Model of a simple convective heat transfer mechanism between two lumped parameter objects. The heat transfer coefficient is supplied by the <tt>fluidside</tt> connector.
</HTML>", revisions="<html>
<li><i>28 Dic 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
      Diagram(graphics));
  end ConvHTLumped_htc;

  model ConvHT2N
    "1D Convective heat transfer between two DHT connectors with a different number of nodes"
    extends Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N1(min=1) = 2 "Number of nodes on side 1";
    parameter Integer N2(min=1) = 2 "Number of nodes on side 2";
    parameter SI.CoefficientOfHeatTransfer gamma
      "Constant heat transfer coefficient";

    DHT side1(N=N1) annotation (Placement(transformation(extent={{-40,20},{40,
              40}}, rotation=0)));
    DHT side2(N=N2) annotation (Placement(transformation(extent={{-40,-42},{40,
              -20}}, rotation=0)));

  protected
    final parameter Real H12[N1, N2]=(if N1 >= N2 then ones(N1, N2) else
        Modelica.Math.Matrices.inv(H1)*H2)
      "Heat flux weight matrix to use if N2>N1" annotation (Evaluate=true);
    final parameter Real H21[N2, N1]=(if N1 >= N2 then Modelica.Math.Matrices.inv(H2)*
        H1 else ones(N2, N1)) "Heat flux weight matrix to use if N1>=N2"
      annotation (Evaluate=true);
    final parameter Real G1[N2, N1]=compG1(N1, N2)
      "Temperature weight matrix - side 1";
    final parameter Real G2[N1, N2]=compG2(N1, N2)
      "Temperature weight matrix - side 2";
    final parameter Real H1[min(N1, N2), N1]=compH1(N1, N2)
      "Heat flux weight matrix - side 1" annotation (Evaluate=true);
    final parameter Real H2[min(N1, N2), N2]=compH2(N1, N2)
      "Heat flux weight matrix - side 2" annotation (Evaluate=true);

    function compHm "Computes matrix H - side with more nodes"
      input Integer Nm "Number of nodes on the side with more nodes";
      input Integer Nf "Number of nodes on the side with fewer nodes";
      output Real H[Nf, Nm] "Temperature weight matrix";
    algorithm
      H := zeros(Nf, Nm);
      // Flux on the first semi-cell, few nodes side
      H[1, :] := fluxWeights(
            Nm,
            0,
            0.5/(Nf - 1));
      // Flux on the central cells, few nodes side
      for i in 2:Nf - 1 loop
        H[i, :] := fluxWeights(
              Nm,
              (i - 1.5)/(Nf - 1),
              (i - 0.5)/(Nf - 1));
      end for;
      // Flux on the last semi-cell, few nodes side
      H[Nf, :] := fluxWeights(
            Nm,
            1 - 0.5/(Nf - 1),
            1);
    end compHm;

    function fluxWeights "Returns the vector of the weights of the nodal fluxes
     (more nodes side) corresponding to the given boundaries"
      input Integer Nm "Number of nodes on the side with more nodes";
      input Real lb "Left boundary, normalised";
      input Real rb "Right boundary, normalised";
      output Real v[Nm] "Flux weight vector";
    protected
      Integer lbi "Index of the leftmost involved node";
      Integer rbi "Index of the rightmost involved node";
      Real h "Width of the inner cells";
      Real hl "Width of the leftmost cell";
      Real hr "Width of the rightmost cell";
    algorithm
      v := zeros(Nm);
      // Index of the rightmost and leftmost involved nodes
      lbi := 1 + integer(floor(lb*(Nm - 1) - 1e-6));
      rbi := 1 + integer(ceil(rb*(Nm - 1) + 1e-6));
      // Width of the inner, leftmost and rightmost cells
      h := 1/(Nm - 1);
      hl := lbi*h - lb;
      hr := rb - (rbi - 2)*h;
      // Coefficients of the contribution of the leftmost partial cell flow
      if abs(hl) > 1e-6 then
        v[lbi] := (hl/h)/2*hl;
        v[lbi + 1] := ((h - hl)/h + 1)/2*hl;
      end if;
      // Coefficients of the contribution of the rightmost partial cell flow
      if abs(hr) > 1e-6 then
        v[rbi - 1] := (1 + (h - hr)/h)/2*hr;
        v[rbi] := (hr/h)/2*hr;
      end if;
      // Coefficients of the additional contributions of the internal cells
      for i in lbi + 1:rbi - 2 loop
        v[i] := v[i] + h/2;
        v[i + 1] := v[i + 1] + h/2;
      end for;
      // Coefficients are scaled to get the average flux from the flow
      v := v/(rb - lb);
    end fluxWeights;

    function compHf "Computes matrix H - side with fewer nodes"
      input Integer Nf "Number of nodes on the side with fewer nodes";
      output Real H[Nf, Nf] "Heat flux weight matrix";
    algorithm
      H := zeros(Nf, Nf);
      // Flux on the first semi-cell is average(phi[1],average(phi[1],phi[2]))
      H[1, 1:2] := {3/4,1/4};
      // Flux on the central cells is the average between the flux on the left
      // semi-cell average(average(phi[i-1],phi[i]),phi[i]) and the flux on the right
      // semi-cell average(phi[i],average(phi[i],phi[i+1]))
      for i in 2:Nf - 1 loop
        H[i, i - 1:i + 1] := {1/8,3/4,1/8};
      end for;
      // Flux on the last semi-cell is average(average(phi[Nf-1],phi[Nf]), phi[Nf])
      H[Nf, Nf - 1:Nf] := {1/4,3/4};
    end compHf;

    function compG "Computes matrix G"
      input Integer Nm "Number of nodes on the side with more nodes";
      input Integer Nf "Number of nodes on the side with fewer nodes";
      output Real G[Nm, Nf] "Temperature weight matrix";
    protected
      Integer firstNode
        "Number of the left corresponding node on the side with fewer nodes";
      Integer lastNode
        "Number of the right corresponding node on the side with fewer nodes";
      Real w "Temperature weight of the left corresponding node ";
    algorithm
      G := zeros(Nm, Nf);
      G[1, 1] := 1 "Temperature of first node";
      G[Nm, Nf] := 1 "Temperature of last node";
      // Temperature of internal nodes by interpolation
      for i in 2:Nm - 1 loop
        firstNode := 1 + div((Nf - 1)*(i - 1), Nm - 1);
        lastNode := 1 + firstNode;
        w := 1 - mod((Nf - 1)*(i - 1), Nm - 1)/(Nm - 1);
        G[i, firstNode] := w;
        G[i, lastNode] := 1 - w;
      end for;
    end compG;

    function compG1 "Computes matrix G1"
      input Integer N1;
      input Integer N2;
      output Real G1[N2, N1];
    algorithm
      G1 := if N1 == N2 then identity(N1) else if N1 > N2 then zeros(N2, N1)
         else compG(max(N1, N2), min(N1, N2));
    end compG1;

    function compG2 "Computes matrix G2"
      input Integer N1;
      input Integer N2;
      output Real G2[N1, N2];
    algorithm
      G2 := if N1 == N2 then identity(N1) else if N1 > N2 then compG(max(N1, N2),
        min(N1, N2)) else zeros(N1, N2);
    end compG2;

    function compH1 "Computes matrix H1"
      input Integer N1;
      input Integer N2;
      output Real H1[min(N1, N2), N1];
    algorithm
      H1 := if N1 == N2 then identity(N1) else if N1 > N2 then compHm(max(N1,
        N2), min(N1, N2)) else compHf(min(N1, N2));
    end compH1;

    function compH2 "Computes matrix H2"
      input Integer N1;
      input Integer N2;
      output Real H2[min(N1, N2), N2];
    algorithm
      H2 := if N1 == N2 then identity(N2) else if N1 > N2 then compHf(min(N1,
        N2)) else compHm(max(N1, N2), min(N1, N2));
    end compH2;

  equation
    // H1*side1.phi+H2*side2.phi = zeros(min(N1,N2)) "Energy balance";
    if N1 >= N2 then
      side1.phi = gamma*(side1.T - G2*side2.T) "Convective heat transfer";
      side2.phi = -H21*side1.phi "Energy balance";
    else
      side2.phi = gamma*(side2.T - G1*side1.T) "Convective heat transfer";
      side1.phi = -H12*side2.phi "Energy balance";
    end if;
    annotation (
      Icon(graphics={Text(
            extent={{-100,-44},{100,-68}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>Model of a simple convective heat transfer mechanism between two 1D objects having (possibly) different nodes, with a constant heat transfer coefficient.
<p>The heat flux through each node of side with a larger number of nodes is computed as a function of the difference between the node temperatures and the corresponding temperatures on the other side, obtained by linear interpolation.
<p>The corresponding heat flux on the side with fewer nodes is computed so that the averaged heat flux around those nodes is equal to the averaged heat flux on the corresponding intervals on the other side.
</HTML>", revisions="<html>
<ul>
<li><i>12 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end ConvHT2N;

  model ConvHT_htc "1D Convective heat transfer between a DHT and a DHT_htc"
    extends Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N=2 "Number of Nodes";

    DHT otherside(N=N) annotation (Placement(transformation(extent={{-40,-40},{
              40,-20}}, rotation=0)));
    DHThtc_in fluidside(N=N) annotation (Placement(transformation(extent={{-40,
              20},{40,40}}, rotation=0)));
  equation
    for j in 1:N loop
      fluidside.phi[j] = fluidside.gamma[j]*(fluidside.T[j] - otherside.T[j])
        "Convective heat transfer";
      otherside.phi[j] = -fluidside.phi[j] "Energy balance";
    end for;
    annotation (
      Icon(graphics={
          Text(
            extent={{-100,-44},{100,-70}},
            lineColor={191,95,0},
            textString="%name"),
          Text(
            extent={{-118,46},{-30,14}},
            lineColor={191,95,0},
            textString="fluid"),
          Text(
            extent={{34,48},{122,16}},
            lineColor={191,95,0},
            textString="side")}),
      Documentation(info="<HTML>
<p>Model of a simple convective heat transfer mechanism between two 1D objects. The heat transfer coefficient is supplied by the fluid-side extended connector.
<p>Node <tt>j</tt> on the fluid side interacts with node <tt>j</tt> on the other side.
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),   Diagram(graphics));
  end ConvHT_htc;

  model ConvHT2N_htc
    "1D Convective heat transfer between two DHT connectors with a different number of nodes"
    extends ThermoPower.Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N1(min=1) = 2 "Number of nodes on side 1";
    parameter Integer N2(min=1) = 2 "Number of nodes on side 2";
    ThermoPower.Thermal.DHThtc_in side1(N=N1) annotation (Placement(
          transformation(extent={{-40,20},{40,40}}, rotation=0)));
    ThermoPower.Thermal.DHT side2(N=N2) annotation (Placement(transformation(
            extent={{-40,-42},{40,-20}}, rotation=0)));
  protected
    parameter Real H12[N1, N2]=(if N1 >= N2 then ones(N1, N2) else
        Modelica.Math.Matrices.inv(H1)*H2)
      "Heat flux weight matrix to use if N2>N1" annotation (Evaluate=true);
    parameter Real H21[N2, N2]=(if N1 >= N2 then Modelica.Math.Matrices.inv(H2)*
        H1 else ones(N2, N1)) "Heat flux weight matrix to use if N1>=N2"
      annotation (Evaluate=true);
    parameter Real G1[N2, N1]=compG1(N1, N2)
      "Temperature weight matrix - side 1";
    parameter Real G2[N1, N2]=compG2(N1, N2)
      "Temperature weight matrix - side 2";
    parameter Real H1[min(N1, N2), N1]=compH1(N1, N2)
      "Heat flux weight matrix - side 1" annotation (Evaluate=true);
    parameter Real H2[min(N1, N2), N2]=compH2(N1, N2)
      "Heat flux weight matrix - side 2" annotation (Evaluate=true);

    function compHm "Computes matrix H - side with more nodes"
      input Integer Nm "Number of nodes on the side with more nodes";
      input Integer Nf "Number of nodes on the side with fewer nodes";
      output Real H[Nf, Nm] "Temperature weight matrix";
    algorithm
      H := zeros(Nf, Nm);
      // Flux on the first semi-cell, few nodes side
      H[1, :] := fluxWeights(
            Nm,
            0,
            0.5/(Nf - 1));
      // Flux on the central cells, few nodes side
      for i in 2:Nf - 1 loop
        H[i, :] := fluxWeights(
              Nm,
              (i - 1.5)/(Nf - 1),
              (i - 0.5)/(Nf - 1));
      end for;
      // Flux on the last semi-cell, few nodes side
      H[Nf, :] := fluxWeights(
            Nm,
            1 - 0.5/(Nf - 1),
            1);
    end compHm;

    function fluxWeights "Returns the vector of the weights of the nodal fluxes
     (more nodes side) corresponding to the given boundaries"
      input Integer Nm "Number of nodes on the side with more nodes";
      input Real lb "Left boundary, normalised";
      input Real rb "Right boundary, normalised";
      output Real v[Nm] "Flux weight vector";
    protected
      Integer lbi "Index of the leftmost involved node";
      Integer rbi "Index of the rightmost involved node";
      Real h "Width of the inner cells";
      Real hl "Width of the leftmost cell";
      Real hr "Width of the rightmost cell";
    algorithm
      v := zeros(Nm);
      // Index of the rightmost and leftmost involved nodes
      lbi := 1 + integer(floor(lb*(Nm - 1) - 1e-6));
      rbi := 1 + integer(ceil(rb*(Nm - 1) + 1e-6));
      // Width of the inner, leftmost and rightmost cells
      h := 1/(Nm - 1);
      hl := lbi*h - lb;
      hr := rb - (rbi - 2)*h;
      // Coefficients of the contribution of the leftmost partial cell flow
      if abs(hl) > 1e-6 then
        v[lbi] := (hl/h)/2*hl;
        v[lbi + 1] := ((h - hl)/h + 1)/2*hl;
      end if;
      // Coefficients of the contribution of the rightmost partial cell flow
      if abs(hr) > 1e-6 then
        v[rbi - 1] := (1 + (h - hr)/h)/2*hr;
        v[rbi] := (hr/h)/2*hr;
      end if;
      // Coefficients of the additional contributions of the internal cells
      for i in lbi + 1:rbi - 2 loop
        v[i] := v[i] + h/2;
        v[i + 1] := v[i + 1] + h/2;
      end for;
      // Coefficients are scaled to get the average flux from the flow
      v := v/(rb - lb);
    end fluxWeights;

    function compHf "Computes matrix H - side with fewer nodes"
      input Integer Nf "Number of nodes on the side with fewer nodes";
      output Real H[Nf, Nf] "Heat flux weight matrix";
    algorithm
      H := zeros(Nf, Nf);
      // Flux on the first semi-cell is average(phi[1],average(phi[1],phi[2]))
      H[1, 1:2] := {3/4,1/4};
      // Flux on the central cells is the average between the flux on the left
      // semi-cell average(average(phi[i-1],phi[i]),phi[i]) and the flux on the right
      // semi-cell average(phi[i],average(phi[i],phi[i+1]))
      for i in 2:Nf - 1 loop
        H[i, i - 1:i + 1] := {1/8,3/4,1/8};
      end for;
      // Flux on the last semi-cell is average(average(phi[Nf-1],phi[Nf]), phi[Nf])
      H[Nf, Nf - 1:Nf] := {1/4,3/4};
    end compHf;

    function compG "Computes matrix G"
      input Integer Nm "Number of nodes on the side with more nodes";
      input Integer Nf "Number of nodes on the side with fewer nodes";
      output Real G[Nm, Nf] "Temperature weight matrix";
    protected
      Integer firstNode
        "Number of the left corresponding node on the side with fewer nodes";
      Integer lastNode
        "Number of the right corresponding node on the side with fewer nodes";
      Real w "Temperature weight of the left corresponding node ";
    algorithm
      G := zeros(Nm, Nf);
      G[1, 1] := 1 "Temperature of first node";
      G[Nm, Nf] := 1 "Temperature of last node";
      // Temperature of internal nodes by interpolation
      for i in 2:Nm - 1 loop
        firstNode := 1 + div((Nf - 1)*(i - 1), Nm - 1);
        lastNode := 1 + firstNode;
        w := 1 - mod((Nf - 1)*(i - 1), Nm - 1)/(Nm - 1);
        G[i, firstNode] := w;
        G[i, lastNode] := 1 - w;
      end for;
    end compG;

    function compG1 "Computes matrix G1"
      input Integer N1;
      input Integer N2;
      output Real G1[N2, N1];
    algorithm
      G1 := if N1 == N2 then identity(N1) else if N1 > N2 then zeros(N2, N1)
         else compG(max(N1, N2), min(N1, N2));
    end compG1;

    function compG2 "Computes matrix G2"
      input Integer N1;
      input Integer N2;
      output Real G2[N1, N2];
    algorithm
      G2 := if N1 == N2 then identity(N1) else if N1 > N2 then compG(max(N1, N2),
        min(N1, N2)) else zeros(N1, N2);
    end compG2;

    function compH1 "Computes matrix H1"
      input Integer N1;
      input Integer N2;
      output Real H1[min(N1, N2), N1];
    algorithm
      H1 := if N1 == N2 then identity(N1) else if N1 > N2 then compHm(max(N1,
        N2), min(N1, N2)) else compHf(min(N1, N2));
    end compH1;

    function compH2 "Computes matrix H2"
      input Integer N1;
      input Integer N2;
      output Real H2[min(N1, N2), N2];
    algorithm
      H2 := if N1 == N2 then identity(N2) else if N1 > N2 then compHf(min(N1,
        N2)) else compHm(max(N1, N2), min(N1, N2));
    end compH2;

  equation
    //H1*side1.phi+H2*side2.phi = zeros(min(N1,N2)) "Energy balance";
    if N1 >= N2 then
      side1.phi = side1.gamma[1]*(side1.T - G2*side2.T)
        "Convective heat transfer";
      side2.phi = -H21*side1.phi;
    else
      side2.phi = side1.gamma[1]*(side2.T - G1*side1.T)
        "Convective heat transfer";
      side1.phi = -H12*side2.phi;
    end if;
    annotation (Icon(graphics={
          Text(
            extent={{-100,-44},{100,-68}},
            lineColor={191,95,0},
            textString="%name"),
          Text(
            extent={{-118,46},{-30,14}},
            lineColor={191,95,0},
            textString="fluid"),
          Text(
            extent={{34,48},{122,16}},
            lineColor={191,95,0},
            textString="side")}), Documentation(info="<HTML>
<p>Model of a simple convective heat transfer mechanism between two 1D objects having (possibly) different nodes, with a constant heat transfer coefficient.
<p>The heat flux through each node of side with a larger number of nodes is computed as a function of the difference between the node temperatures and the corresponding temperatures on the other side, obtained by linear interpolation.
<p>The corresponding heat flux on the side with fewer nodes is computed so that the averaged heat flux around those nodes is equal to the averaged heat flux on the corresponding intervals on the other side.
</HTML>", revisions="<html>
<ul>
<li><i>12 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end ConvHT2N_htc;

  model CounterCurrent
    "Counter-current heat transfer adaptor for 1D heat transfer"
    extends Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N=2 "Number of Nodes";
    parameter Boolean counterCurrent=true
      "Swap temperature and flux vector order";
    Thermal.DHT side1(N=N) annotation (Placement(transformation(extent={{-40,20},
              {40,40}}, rotation=0)));
    Thermal.DHT side2(N=N) annotation (Placement(transformation(extent={{-40,-42},
              {40,-20}}, rotation=0)));
  equation
    // Swap temperature and flux vector order
    if counterCurrent then
      side1.phi = -side2.phi[N:-1:1];
      side1.T = side2.T[N:-1:1];
    else
      side1.phi = -side2.phi;
      side1.T = side2.T;
    end if;
    annotation (Icon(graphics={
          Polygon(
            points={{-74,2},{-48,8},{-74,16},{-56,8},{-74,2}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{74,-16},{60,-10},{74,-2},{52,-10},{74,-16}},
            lineColor={0,0,0},
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-100,-46},{100,-70}},
            lineColor={191,95,0},
            textString="%name")}), Documentation(info="<HTML>
<p>This component can be used to model counter-current heat transfer. The temperature and flux vectors on one side are swapped with respect to the other side. This means that the temperature of node <tt>j</tt> on side 1 is equal to the temperature of note <tt>N-j+1</tt> on side 2; heat fluxes behave correspondingly.
<p>
The swapping is performed if the counterCurrent parameter is true (default value).
</HTML>", revisions="<html>
<ul>
<li><i>25 Aug 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       <tt>counterCurrent</tt> parameter added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>

</html>
"));
  end CounterCurrent;

  model MetalWall
    extends MetalWallFEM;
    extends Modelica.Icons.ObsoleteModel;

    annotation (
      Icon(graphics={
          Text(
            extent={{-100,60},{-40,20}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Int"),
          Text(
            extent={{-100,-20},{-40,-60}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Ext"),
          Text(
            extent={{-138,-60},{142,-100}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>This is the model of a cylindrical tube of solid material.
<p>The heat capacity (which is lumped at the center of the tube thickness) is accounted for, as well as the thermal resistance due to the finite heat conduction coefficient. Longitudinal heat conduction is neglected.
<p><b>Modelling options</b></p>
<p>The following options are available:
<ul>
<li><tt>WallRes = false</tt>: the thermal resistance of the tube wall is neglected.
<li><tt>WallRes = true</tt>: the thermal resistance of the tube wall is accounted for.
</ul>
</HTML>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),   Diagram(graphics));
  end MetalWall;

  model MetalTube "Cylindrical metal tube - 1 radial node and N axial nodes"
    extends MetalTubeFEM;
    extends Modelica.Icons.ObsoleteModel;

    annotation (
      Icon(graphics={
          Text(
            extent={{-100,60},{-40,20}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Int"),
          Text(
            extent={{-100,-20},{-40,-60}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Ext"),
          Text(
            extent={{-138,-60},{142,-100}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<HTML>
<p>This is the model of a cylindrical tube of solid material.
<p>The heat capacity (which is lumped at the center of the tube thickness) is accounted for, as well as the thermal resistance due to the finite heat conduction coefficient. Longitudinal heat conduction is neglected.
<p><b>Modelling options</b></p>
<p>The following options are available:
<ul>
<li><tt>WallRes = false</tt>: the thermal resistance of the tube wall is neglected.
<li><tt>WallRes = true</tt>: the thermal resistance of the tube wall is accounted for.
</ul>
</HTML>", revisions="<html>
<ul>
<li><i>30 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Initialisation support added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),   Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
              100,100}}),
              graphics));
  end MetalTube;

  model CylinderFourier
    "Thermal model of a hollow cylinder by Fourier's equation - 1 axial node and Nr radial nodes"
    import Modelica.SIunits.*;
    import ThermoPower.Choices.CylinderFourier.NodeDistribution;
    extends ThermoPower.Icons.MetalWall;

    replaceable model MaterialModel = MaterialProperties.Metals.StandardSteel
      constrainedby MaterialProperties.Interfaces.PartialMaterial "Metal model";
    parameter Integer Nr=2 "Number of radial nodes";
    parameter NodeDistribution nodeDistribution=ThermoPower.Choices.CylinderFourier.NodeDistribution.uniform
      "Node distribution";
    parameter SI.Length rint "Internal radius";
    parameter SI.Length rext "External radius";
    parameter SI.Temperature Tstartint=300
      "Temperature start value at rint (first node)"
      annotation (Dialog(tab="Initialisation"));
    parameter SI.Temperature Tstartext=300
      "Temperature start value at rext (last node)"
      annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt=Choices.Init.Options.noInit
      "Initialisation option" annotation (Dialog(tab="Initialisation"));

    SI.Length r[Nr](fixed=false) "Node radii";
  protected
    SI.Length r1_2[Nr - 1](fixed=false) "Slice mean radii";
    SI.Length r_lin[Nr](fixed=false) "Linearly distributed radii";
    Real A[Nr](fixed=false);
    Real B[Nr](fixed=false);
    Real C[Nr](fixed=false);

  public
    SI.Temperature T[Nr](start=linspace(
            Tstartint,
            Tstartext,
            Nr)) "Nodal temperatures";
    SI.Temperature Tm "Mean temperature";
    MaterialModel metal[Nr] "Metal properties at the nodes";

    ThermoPower.Thermal.DHT internalBoundary(final N=1) annotation (Placement(
          transformation(extent={{-20,20},{20,40}}, rotation=0)));
    ThermoPower.Thermal.DHT externalBoundary(final N=1) annotation (Placement(
          transformation(extent={{-20,-40},{20,-20}}, rotation=0)));

  equation
    // Generation of the temperature node distribution
    r_lin = linspace(
        rint,
        rext,
        Nr) "Linearly distributed node radii";
    for i in 1:Nr loop
      if nodeDistribution == NodeDistribution.uniform then
        r[i] = r_lin[i] "Uniform distribution of node radii";
      elseif nodeDistribution == NodeDistribution.thickInternal then
        r[i] = rint + 1/(rext - rint)*(r_lin[i] - rint)^2
          "Quadratically distributed node radii - thickest at rint";
      elseif nodeDistribution == NodeDistribution.thickExternal then
        r[i] = rext - 1/(rext - rint)*(rext - r_lin[i])^2
          "Quadratically distributed node radii - thickest at rext";
      elseif nodeDistribution == NodeDistribution.thickBoth then
        if r_lin[i] <= (rint + rext)/2 then
          r[i] = 2/(rext - rint)*(r_lin[i] - rint)^2 + rint
            "Quadratically distributed node radii - thickest at rint";
        else
          r[i] = -2/(rext - rint)*(r_lin[i] - rext)^2 + rext
            "Quadratically distributed node radii - thickest at rext";
        end if;
      else
        r[i] = 0;
        assert(true, "Unsupported NodeDistribution type");
      end if;
    end for;
    for i in 1:Nr - 1 loop
      r1_2[i] = (r[i + 1] + r[i])/2;
    end for;

    // Spatially discretized coefficients of Fourier's equation
    for i in 2:Nr - 1 loop
      A[i] = r1_2[i - 1]/(r[i]*(r[i] - r[i - 1])*(r1_2[i] - r1_2[i - 1]));
      C[i] = r1_2[i]/(r[i]*(r[i + 1] - r[i])*(r1_2[i] - r1_2[i - 1]));
      B[i] = -A[i] - C[i];
    end for;
    // Not used by Fourier equations
    A[1] = 0;
    B[1] = 0;
    C[1] = 0;
    A[Nr] = 0;
    B[Nr] = 0;
    C[Nr] = 0;

    // Metal temperature equations
    metal[1:Nr].T = T[1:Nr];

    // Thermal field
    for i in 2:Nr - 1 loop
      metal[i].density*metal[i].specificHeatCapacity/metal[i].thermalConductivity
        *der(T[i]) = A[i]*T[i - 1] + B[i]*T[i] + C[i]*T[i + 1]
        "Fourier's equation";
    end for;

    // Thermal boundary conditions
    internalBoundary.T[1] = T[1];
    externalBoundary.T[1] = T[Nr];
    internalBoundary.phi[1] = -metal[1].thermalConductivity*(T[2] - T[1])/(r[2]
       - r[1]);
    externalBoundary.phi[1] = metal[Nr].thermalConductivity*(T[Nr] - T[Nr - 1])
      /(r[Nr] - r[Nr - 1]);

    // Mean temperature
    Tm = 1/(rext^2 - rint^2)*sum((T[i]*r[i] + T[i + 1]*r[i + 1])*(r[i + 1] - r[
      i]) for i in 1:Nr - 1);
    //  Tm = sum(T)/Nr;
  initial equation
    // Initial conditions
    if initOpt == Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.steadyState then
      der(T[2:Nr - 1]) = zeros(Nr - 2);
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Icon(graphics={
          Text(
            extent={{-94,52},{-42,24}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Int"),
          Text(
            extent={{-90,-24},{-42,-50}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="Ext"),
          Text(
            extent={{-98,-44},{102,-72}},
            lineColor={191,95,0},
            textString="%name")}),
      Documentation(info="<html>
This is the 1D thermal model of a solid hollow cylinder by Fourier's equations.
<p>The model is axis-symmetric, has one node in the longitudinal direction, and <tt>Nr</tt> nodes in the radial direction. The two connectors correspond to the internal and external surfaces; if one of the surface is thermally insulated, just leave the connector unconnected (no connection on a <tt>DHT</tt> connector means zero heat flux). The temperature-dependent properties of the material are described by the replaceable <tt>MaterialModel</tt> model.
<p><b>Modelling options</b></p>
The radial distribution of the nodes can be chosen by selecting the value of <tt>nodeDistribution</tt>:
<ul>
<li> <tt>Choices.CylinderFourier.NodeDistribution.uniform</tt> uniform distribution, nodes are equally spaced;
<li> <tt>Choices.CylinderFourier.NodeDistribution.thickInternal</tt> quadratic distribution, nodes are thickest near the internal surface;
<li> <tt>Choices.CylinderFourier.NodeDistribution.thickExternal</tt> quadratic distribution, nodes are thickest near the external surface;
<li> <tt>Choices.CylinderFourier.NodeDistribution.thickBoth</tt> quadratic distribution, nodes are thickest near both surfaces.
</ul>
</html>", revisions="<html>
<ul>
<li><i>30 Dec 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Bugs fixed in boundary condition and node distribution.</li>
<li><i>1 May 2005</i>
    by <a href=\"mailto:luca.bascetta@polimi.it\">Luca Bascetta</a>:<br>
       First release.</li>
</ul>
</html>"));
  end CylinderFourier;

  model HeatFlowDistribution "Same heat flow through two different surfaces"
    extends Icons.HeatFlow;
    extends Modelica.Icons.ObsoleteModel;
    parameter Integer N(min=1) = 2 "Number of nodes";
    parameter SI.Area A1=1 "Side 1 surface area" annotation (Evaluate=true);
    parameter SI.Area A2=1 "Side 2 surface area" annotation (Evaluate=true);

    DHT side1(N=N) "Area of side 1 surface" annotation (Placement(
          transformation(extent={{-40,20},{40,40}}, rotation=0)));
    DHT side2(N=N) "Area of side 2 surface" annotation (Placement(
          transformation(extent={{-40,-42},{40,-20}}, rotation=0)));
  equation
    side1.T = side2.T "Same temperature";
    side1.phi*A1 + side2.phi*A2 = zeros(N) "Energy balance";
    annotation (
      Icon(graphics={
          Text(
            extent={{-88,50},{-40,20}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="s1"),
          Text(
            extent={{-100,-44},{100,-72}},
            lineColor={191,95,0},
            textString="%name"),
          Text(
            extent={{-92,-20},{-40,-50}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Forward,
            textString="s2")}),
      Documentation(info="<HTML>
<p>This model can be used to describe the heat flow through two different surfaces, having a different area; the total heat flow entering on the internal side is equal to the total heat flow going out of the external side.
</HTML>", revisions="<html>
<ul>
<li><i>8 May 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>
"),   Diagram(graphics));
  end HeatFlowDistribution;

  function linspaceExt
     extends ThermoPower.Functions.linspaceExt;
     extends Modelica.Icons.ObsoleteModel;
  end linspaceExt;
  annotation (Documentation(info="<HTML>
This package contains models of physical processes and components related to heat transfer phenomena.
<p>All models with dynamic equations provide initialisation support. Set the <tt>initOpt</tt> parameter to the appropriate value:
<ul>
<li><tt>Choices.Init.Options.noInit</tt>: no initialisation
<li><tt>Choices.Init.Options.steadyState</tt>: full steady-state initialisation
</ul>
The latter options can be useful when two or more components are connected directly so that they will have the same pressure or temperature, to avoid over-specified systems of initial equations.

</HTML>"));
end Thermal;
