package ThermoPower "Open library for thermal power plant simulation"
  import Modelica.Math.*;
  import Modelica.SIunits.*;


  type HydraulicConductance = Real (final quantity="HydraulicConductance",
        final unit="(kg/s)/Pa");


  type HydraulicResistance = Real (final quantity="HydraulicResistance", final unit
      =      "Pa/(kg/s)");


  type PerUnit = Real (
                     final quantity="PerUnit",final unit="pu");


  type Density = Modelica.SIunits.Density (start=40) "generic start value";


  type LiquidDensity = Density (start=1000) "start value for liquids";


  type GasDensity = Density (start=5) "start value for gases/vapours";


  type AbsoluteTemperature = Temperature (start=300) "generic temperature";


  type AbsolutePressure = Pressure (start=1e5) "generic pressure";


  package Icons "Icons for ThermoPower library" 
    extends Modelica.Icons.Library;
    package Water "Icons for component using water/steam as working fluid" 
      extends Modelica.Icons.Library;
      partial model SourceP 
        annotation (Icon(
            Ellipse(extent=[-80, 80; 80, -80], style(color=0, fillPattern=1)),
            Text(
              extent=[-20, 34; 28, -26],
              string="P",
              style(color=7, fillPattern=1)),
            Text(extent=[-100, -78; 100, -106], string="%name")));
      equation 
      
      end SourceP;
    
      partial model SourceW 
        annotation (Icon(
            Rectangle(extent=[-80, 40; 80, -40], style(color=0, fillPattern=1)),
            Polygon(points=[-12, -20; 66, 0; -12, 20; 34, 0; -12, -20], style(
                color=7,
                fillColor=7,
                fillPattern=1)),
            Text(extent=[-100, -52; 100, -80], string="%name")));
      
      end SourceW;
    
      partial model Tube 
        annotation (Icon(Rectangle(extent=[-80, 40; 80, -40], style(color=0,
                  gradient=2))), Diagram);
      equation 
      
      end Tube;
    
      partial model Mixer 
        annotation (Icon(Ellipse(extent=[80, 80; -80, -80], style(color=0,
                  fillPattern=1)), Text(extent=[-100, -84; 100, -110], string=
                  "%name")), Diagram);
      equation 
      
      end Mixer;
    
      partial model Tank 
        annotation (Icon(
            Rectangle(extent=[-60, 60; 60, -80], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Rectangle(extent=[-54, 60; 54, 12], style(
                color=7,
                fillColor=7,
                fillPattern=1)),
            Rectangle(extent=[-54, 12; 54, -72], style(fillPattern=1))));
      equation 
      
      end Tank;
    
      partial model Valve 
        annotation (Icon(
            Line(points=[0, 40; 0, 0], style(
                color=0,
                thickness=2,
                fillPattern=1)),
            Polygon(points=[-80, 40; -80, -40; 0, 0; -80, 40], style(
                color=0,
                thickness=2,
                fillPattern=1)),
            Polygon(points=[80, 40; 0, 0; 80, -40; 80, 40], style(
                color=0,
                thickness=2,
                fillPattern=1)),
            Rectangle(extent=[-20, 60; 20, 40], style(
                color=0,
                fillColor=0,
                fillPattern=1))), Diagram);
      equation 
      
      end Valve;
    
      model FlowJoin 
        annotation (Diagram, Icon(Polygon(points=[-40, 60; 0, 20; 40, 20; 40, -20;
                   0, -20; -40, -60; -40, -20; -20, 0; -40, 20; -40, 60], style(
                  color=0, fillPattern=1))));
      equation 
      
      end FlowJoin;
    
      model FlowSplit 
        annotation (Diagram, Icon(Polygon(points=[40, 60; 0, 20; -40, 20; -40,
                  -20; 0, -20; 40, -60; 40, -20; 22, 0; 40, 20; 40, 60], style(
                  color=0, fillPattern=1))));
      equation 
      
      end FlowSplit;
    
      model SensThrough 
        annotation (Icon(
            Rectangle(extent=[-40, -20; 40, -60], style(color=0, fillPattern=1)),
            Line(points=[0, 20; 0, -20], style(color=0)),
            Ellipse(extent=[-40, 100; 40, 20], style(color=0)),
            Line(points=[40, 60; 60, 60]),
            Text(extent=[-100, -76; 100, -100], string="%name")));
      
      end SensThrough;
    
      model SensP 
        annotation (Icon(
            Line(points=[0, 20; 0, -20], style(color=0)),
            Ellipse(extent=[-40, 100; 40, 20], style(color=0)),
            Line(points=[40, 60; 60, 60]),
            Text(extent=[-100, -52; 100, -86], string="%name")));
      equation 
      
      end SensP;
    
      model Drum 
        annotation (Icon(
            Ellipse(extent=[-80, 80; 80, -80], style(color=10, fillColor=10)),
            Polygon(points=[-60, 0; -60, -6; -58, -16; -52, -30; -44, -42; -38,
                   -46; -32, -50; -22, -56; -16, -58; -8, -60; -6, -60; 0, -60;
                   6, -60; 12, -58; 22, -56; 30, -52; 36, -48; 42, -42; 48, -36;
                   52, -28; 58, -18; 60, -8; 60, 0; -60, 0], style(color=10,
                  fillPattern=1)),
            Polygon(points=[-60, 0; -58, 16; -50, 34; -36, 48; -26, 54; -16, 58;
                   -6, 60; 0, 60; 10, 60; 20, 56; 30, 52; 36, 48; 46, 40; 52,
                  30; 56, 22; 58, 14; 60, 6; 60, 0; -60, 0], style(
                color=10,
                fillColor=72,
                fillPattern=1))));
      equation 
      
      end Drum;
    
      partial model Pump 
        annotation (Icon(
            Polygon(points=[-40, -24; -60, -60; 60, -60; 40, -24; -40, -24],
                style(pattern=0, fillColor=74)),
            Ellipse(extent=[-60, 80; 60, -40], style(gradient=3)),
            Polygon(points=[-30, 52; -30, -8; 48, 20; -30, 52], style(
                pattern=0,
                gradient=2,
                fillColor=7)),
            Text(extent=[-100, -64; 100, -90], string="%name")));
      equation 
      
      end Pump;
    
      partial model Accumulator 
      
        annotation (Icon(
            Rectangle(extent=[-60, 80; 60, -40], style(
                pattern=0,
                fillColor=10,
                fillPattern=1)),
            Ellipse(extent=[-60, 100; 60, 60], style(
                pattern=0,
                fillColor=10,
                fillPattern=1)),
            Ellipse(extent=[-60, -20; 60, -60], style(
                pattern=0,
                fillColor=10,
                fillPattern=1)),
            Ellipse(extent=[-52, 94; 52, 64], style(
                color=74,
                pattern=0,
                fillColor=76,
                fillPattern=1)),
            Rectangle(extent=[-52, 22; 52, -40], style(
                color=74,
                fillColor=74,
                fillPattern=1)),
            Rectangle(extent=[-52, 80; 52, 20], style(
                pattern=0,
                fillColor=76,
                fillPattern=1)),
            Ellipse(extent=[-52, -24; 52, -54], style(
                color=74,
                pattern=0,
                fillColor=74,
                fillPattern=1)),
            Rectangle(extent=[-4, -58; 4, -86], style(
                pattern=0,
                fillColor=10,
                fillPattern=1)),
            Rectangle(extent=[-26, -86; 26, -94], style(
                pattern=0,
                fillColor=10,
                fillPattern=1)),
            Text(extent=[-62, -100; 64, -122], string="%name"),
            Polygon(points=[-74, 86; -60, 72; -54, 78; -68, 92; -74, 86], style(
                pattern=0,
                fillColor=10,
                fillPattern=1))), Diagram);
      equation 
      
      end Accumulator;
    
      partial model PumpMech 
        annotation (Icon(
            Rectangle(extent=[54,28; 80,12],   style(
                color=76,
                gradient=2,
                fillColor=9)),
            Polygon(points=[-40, -24; -60, -60; 60, -60; 40, -24; -40, -24],
                style(pattern=0, fillColor=74)),
            Ellipse(extent=[-60, 80; 60, -40], style(gradient=3)),
            Polygon(points=[-30, 52; -30, -8; 48, 20; -30, 52], style(
                pattern=0,
                gradient=2,
                fillColor=7)),
            Text(extent=[-100, -64; 100, -90], string="%name")));
      equation 
      
      end PumpMech;
    
      partial model PressDrop 
        annotation (Icon(Rectangle(extent=[-80,40; 80,-40],   style(color=0,
                  gradient=2)), Polygon(points=[-80,40; -42,40; -20,12; 20,12;
                  40,40; 80,40; 80,-40; 40,-40; 20,-12; -20,-12; -40,-40; -80,
                  -40; -80,40], style(
                color=0,
                rgbcolor={0,0,0},
                gradient=2,
                fillColor=3,
                rgbfillColor={0,0,255}))),                                                Diagram);
      equation 
      
      end PressDrop;
    
      partial model SteamTurbineUnit 
        annotation (Icon(
            Line(points=[14,20; 14,42; 38,42; 38,20], style(
                color=3,
                rgbcolor={0,0,255},
                thickness=2,
                gradient=2,
                fillColor=3,
                rgbfillColor={0,0,255})),
            Rectangle(extent=[-100, 8; 100, -8], style(
                color=76,
                gradient=2,
                fillColor=9)),
            Polygon(points=[-14,48; -14,-48; 14,-20; 14,20; -14,48], style(
                color=0,
                rgbcolor={0,0,0},
                thickness=2,
                fillColor=3,
                rgbfillColor={0,0,255},
                fillPattern=1)),
            Polygon(points=[38,20; 38,-20; 66,-46; 66,48; 38,20], style(
                color=0,
                rgbcolor={0,0,0},
                thickness=2,
                fillColor=3,
                rgbfillColor={0,0,255},
                fillPattern=1)),
            Polygon(points=[-66,20; -66,-20; -40,-44; -40,48; -66,20], style(
                color=0,
                rgbcolor={0,0,0},
                thickness=2,
                fillColor=3,
                rgbfillColor={0,0,255},
                fillPattern=1)),
            Line(points=[-100,70; -100,70; -66,70; -66,20], style(
                color=3,
                rgbcolor={0,0,255},
                thickness=2,
                gradient=2,
                fillColor=3,
                rgbfillColor={0,0,255})),
            Line(points=[-40,46; -40,70; 26,70; 26,42], style(
                color=3,
                rgbcolor={0,0,255},
                thickness=2,
                gradient=2,
                fillColor=3,
                rgbfillColor={0,0,255})),
            Line(points=[-14,-46; -14,-70; 66,-70; 66,-46], style(
                color=3,
                rgbcolor={0,0,255},
                thickness=2,
                gradient=2,
                fillColor=3,
                rgbfillColor={0,0,255})),
            Line(points=[66,-70; 100,-70], style(
                color=3,
                rgbcolor={0,0,255},
                thickness=2,
                fillColor=3,
                rgbfillColor={0,0,255},
                fillPattern=1))),
                                Diagram);
      equation 
      
      end SteamTurbineUnit;
    
      partial model Header 
        annotation (Icon(
          Ellipse(extent=[-80,80; 80,-80], style(
              color=10,
              rgbcolor={95,95,95},
              fillColor=10,
              rgbfillColor={95,95,95})),
                         Ellipse(extent=[70,70; -70,-70], style(
              color=10,
              rgbcolor={95,95,95},
              fillPattern=1)),     Text(extent=[-100, -84; 100, -110], string=
                  "%name")), Diagram);
      equation 
      
      end Header;
    end Water;
  
    partial model HeatFlow 
      annotation (Icon(Rectangle(extent=[-80, 20; 80, -20], style(
              color=0,
              fillColor=7,
              fillPattern=7))));
    equation 
    
    end HeatFlow;
  
    partial model MetalWall 
      annotation (Icon(Rectangle(extent=[-80, 20; 80, -20], style(color=0,
                fillColor=10))));
    equation 
    
    end MetalWall;
  
    package Gas "Icons for component using water/steam as working fluid" 
      extends Modelica.Icons.Library;
      partial model SourceP 
        annotation (Icon(
            Ellipse(extent=[-80, 80; 80, -80], style(
                color=10,
                fillColor=76,
                fillPattern=1)),
            Text(
              extent=[-20, 34; 28, -26],
              string="P",
              style(color=7, fillPattern=1)),
            Text(extent=[-100, -78; 100, -106], string="%name")));
      equation 
      
      end SourceP;
    
      partial model SourceW 
        annotation (Icon(
            Rectangle(extent=[-80, 40; 80, -40], style(
                color=10,
                fillColor=76,
                fillPattern=1)),
            Polygon(points=[-12, -20; 66, 0; -12, 20; 34, 0; -12, -20], style(
                  color=10, fillColor=0)),
            Text(extent=[-100, -52; 100, -80], string="%name")));
      equation 
      
      end SourceW;
    
      partial model Tube 
        annotation (Icon(Rectangle(extent=[-80, 40; 80, -40], style(
                color=10,
                fillColor=76,
                gradient=2))), Diagram);
      equation 
      
      end Tube;
    
      partial model Mixer 
        annotation (Icon(Ellipse(extent=[80, 80; -80, -80], style(
                color=10,
                fillColor=76,
                fillPattern=1)), Text(extent=[-100, -84; 100, -110], string=
                  "%name")), Diagram);
      equation 
      
      end Mixer;
    
      partial model Valve 
        annotation (Icon(
            Line(points=[0, 40; 0, 0], style(
                color=0,
                thickness=2,
                fillPattern=1)),
            Polygon(points=[-80, 40; -80, -40; 0, 0; -80, 40], style(
                color=10,
                fillColor=76,
                thickness=2,
                fillPattern=1)),
            Polygon(points=[80, 40; 0, 0; 80, -40; 80, 40], style(
                color=10,
                fillColor=76,
                thickness=2,
                fillPattern=1)),
            Rectangle(extent=[-20, 60; 20, 40], style(
                color=0,
                fillColor=0,
                fillPattern=1))), Diagram);
      equation 
      
      end Valve;
    
      model FlowJoin 
        annotation (Diagram, Icon(Polygon(points=[-40, 60; 0, 20; 40, 20; 40, -20;
                   0, -20; -40, -60; -40, -20; -20, 0; -40, 20; -40, 60], style(
                color=10,
                fillColor=76,
                fillPattern=1))));
      equation 
      
      end FlowJoin;
    
      model FlowSplit 
        annotation (Diagram, Icon(Polygon(points=[40, 60; 0, 20; -40, 20; -40,
                  -20; 0, -20; 40, -60; 40, -20; 22, 0; 40, 20; 40, 60], style(
                color=10,
                fillColor=76,
                fillPattern=1))));
      equation 
      
      end FlowSplit;
    
      model SensThrough 
        annotation (Icon(
            Rectangle(extent=[-40, -20; 40, -60], style(
                color=10,
                fillColor=76,
                fillPattern=1)),
            Line(points=[0, 20; 0, -20], style(color=0)),
            Ellipse(extent=[-40, 100; 40, 20], style(color=0)),
            Line(points=[40, 60; 60, 60], color=0),
            Text(extent=[-100, -76; 100, -100], string="%name")));
      equation 
      
      end SensThrough;
    
      model SensP 
        annotation (Icon(
            Line(points=[0, 20; 0, -20], style(color=0)),
            Ellipse(extent=[-40, 100; 40, 20], style(color=0)),
            Line(points=[40, 60; 60, 60]),
            Text(extent=[-130,-80; 132,-124],  string="%name")));
      equation 
      
      end SensP;
    
      partial model Compressor 
        annotation (Icon(
            Polygon(points=[24, 26; 30, 26; 30, 76; 60, 76; 60, 82; 24, 82; 24,
                   26], style(
                color=10,
                fillColor=76,
                thickness=2)),
            Polygon(points=[-30, 76; -30, 56; -24, 56; -24, 82; -60, 82; -60,
                  76; -30, 76], style(
                color=10,
                fillColor=76,
                thickness=2)),
            Rectangle(extent=[-60, 8; 60, -8], style(
                color=76,
                gradient=2,
                fillColor=9)),
            Polygon(points=[-30, 60; -30, -60; 30, -26; 30, 26; -30, 60], style(
                color=10,
                fillColor=76,
                thickness=2,
                fillPattern=1))), Diagram);
      equation 
      
      end Compressor;
    
      partial model Turbine 
        annotation (Icon(
            Polygon(points=[-28, 76; -28, 28; -22, 28; -22, 82; -60, 82; -60,
                  76; -28, 76], style(
                color=10,
                fillColor=76,
                thickness=2)),
            Polygon(points=[26, 56; 32, 56; 32, 76; 60, 76; 60, 82; 26, 82; 26,
                   56], style(
                color=10,
                fillColor=76,
                thickness=2)),
            Rectangle(extent=[-60, 8; 60, -8], style(
                color=76,
                gradient=2,
                fillColor=9)),
            Polygon(points=[-28, 28; -28, -26; 32, -60; 32, 60; -28, 28], style(
                color=10,
                fillColor=76,
                thickness=2,
                fillPattern=1))), Diagram);
      equation 
      
      end Turbine;
    
      partial model GasTurbineUnit 
        annotation (Icon(
            Line(points=[-22, 26; -22, 48; 22, 48; 22, 28], style(
                color=76,
                gradient=2,
                thickness=10,
                fillColor=9)),
            Rectangle(extent=[-100, 8; 100, -8], style(
                color=76,
                gradient=2,
                fillColor=9)),
            Polygon(points=[-80, 60; -80, -60; -20, -26; -20, 26; -80, 60],
                style(
                color=10,
                fillColor=76,
                thickness=2,
                fillPattern=1)),
            Polygon(points=[20, 28; 20, -26; 80, -60; 80, 60; 20, 28], style(
                color=10,
                fillColor=76,
                thickness=2,
                fillPattern=1)),
            Ellipse(extent=[-16, 64; 16, 32], style(
                color=76,
                gradient=3,
                fillColor=1))), Diagram);
      equation 
      
      end GasTurbineUnit;
    
      partial model Fan 
        annotation (Icon(
            Polygon(points=[-38,-24; -58,-60; 62,-60; 42,-24; -38,-24], style(
              color=10,
              rgbcolor={95,95,95},
              thickness=4,
              fillColor=76,
              rgbfillColor={170,170,255})),
            Ellipse(extent=[-60, 80; 60, -40], style(
              color=76,
              rgbcolor={170,170,255},
              gradient=3,
              fillColor=76,
              rgbfillColor={170,170,255})),
            Polygon(points=[-30, 52; -30, -8; 48, 20; -30, 52], style(
                pattern=0,
                gradient=2,
                fillColor=7)),
            Text(extent=[-100, -64; 100, -90], string="%name",
            style(color=10, rgbcolor={95,95,95}))));
      equation 
      
      end Fan;
    end Gas;
  end Icons;


  package Functions "Miscellaneous functions" 
    extends Modelica.Icons.Library;
    function linear 
      extends Modelica.Icons.Function;
      input Real x;
      output Real y;
      annotation (derivative=Functions.linear_der);
    algorithm 
      y := x;
    end linear;
  
    function linear_der 
      extends Modelica.Icons.Function;
      input Real x;
      input Real der_x;
      output Real der_y;
    algorithm 
      der_y := der_x;
    end linear_der;
  
    function one 
      extends Modelica.Icons.Function;
      input Real x;
      output Real y;
      annotation (derivative=Functions.one_der);
    algorithm 
      y := 1;
    end one;
  
    function one_der 
      extends Modelica.Icons.Function;
      input Real x;
      input Real der_x;
      output Real der_y;
    algorithm 
      der_y := 0;
    end one_der;
  
    function sqrtReg 
    "Symmetric square root approximation with finite derivative in zero" 
      extends Modelica.Icons.Function;
      input Real x;
      input Real delta=0.01 "Range of significant deviation from sqrt(x)";
      output Real y;
      annotation(derivative(zeroDerivative=delta)=Functions.sqrtReg_der,
        Documentation(info="<html>
This function approximates sqrt(x)*sign(x), such that the derivative is finite and smooth in x=0. 
</p>
<p>
<table border=1 cellspacing=0 cellpadding=2> 
<tr><th>Function</th><th>Approximation</th><th>Range</th></tr>
<tr><td>y = sqrtReg(x)</td><td>y ~= sqrt(abs(x))*sign(x)</td><td>abs(x) &gt;&gt delta</td></tr>
<tr><td>y = sqrtReg(x)</td><td>y ~= x/sqrt(delta)</td><td>abs(x) &lt;&lt  delta</td></tr>
</table>
<p>
With the default value of delta=0.01, the difference between sqrt(x) and sqrtReg(x) is 16% around x=0.1, 0.25% around x=0.1 and 0.0025% around x=1.
</p> 
</html>", revisions="<html>
<ul>
<li><i>15 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Created. </li>
</ul>
</html>"));
    algorithm 
      y := x/sqrt(sqrt(x*x+delta*delta));
    
    annotation (Documentation(info="<html>
This function approximates sqrt(x)*sign(x), such that the derivative is finite and smooth in x=0. 
</p>
<p>
<table border=1 cellspacing=0 cellpadding=2> 
<tr><th>Function</th><th>Approximation</th><th>Range</th></tr>
<tr><td>y = sqrtReg(x)</td><td>y ~= sqrt(abs(x))*sign(x)</td><td>abs(x) &gt;&gt delta</td></tr>
<tr><td>y = sqrtReg(x)</td><td>y ~= x/delta</td><td>abs(x) &lt;&lt  delta</td></tr>
</table>
<p>
With the default value of delta=0.01, the difference between sqrt(x) and sqrtReg(x) is 0.5% around x=0.1 and 0.005% around x=1.
</p> 
</html>", revisions="<html>
<ul>
<li><i>15 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Created. </li>
</ul>
</html>"));
    end sqrtReg;
  
    function sqrtReg_der "Derivative of sqrtReg" 
      extends Modelica.Icons.Function;
      input Real x;
      input Real delta=0.01 "Range of significant deviation from sqrt(x)";
      input Real dx "Derivative of x";
      output Real dy;
    algorithm 
      dy := dx*0.5*(x*x+2*delta*delta)/((x*x+delta*delta)^1.25);
    annotation (Documentation(info="<html>
</html>", revisions="<html>
<ul>
<li><i>15 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Created. </li>
</ul>
</html>"));
    end sqrtReg_der;
  
    block OffsetController "Offset computation for steady-state conditions" 
      extends Modelica.Blocks.Interfaces.BlockIcon;
      parameter Real steadyStateGain=0.0 
      "0.0: Adds offset to input - 1.0: Closed loop action to find steady state";
      parameter Real SP0 "Initial setpoint for the controlled variable";
      parameter Real deltaSP=0 
      "Variation of the setpoint for the controlled variable";
      parameter Time Tstart=0 "Start time of the setpoint ramp change";
      parameter Time Tend=0 "End time of the setpoint ramp change";
      parameter Real Kp "Proportional gain";
      parameter Real Ti "Integral time constant";
      parameter Real biasCO 
      "Bias value of the control variable when computing the steady state";
  protected 
      Real SP;
      Real error;
      Real integralError;
  public 
      Modelica.Blocks.Interfaces.RealInput deltaCO 
        annotation (extent=[-140, 62; -100, 100]);
      Modelica.Blocks.Interfaces.RealInput PV 
        annotation (extent=[-140, -100; -100, -60]);
      Modelica.Blocks.Interfaces.RealOutput CO 
        annotation (extent=[100, -20; 140, 20]);
    equation 
      SP = if time <= Tstart then SP0 else if time >= Tend then SP0 + deltaSP else 
              SP0 + (time - Tstart)/(Tend - Tstart)*deltaSP;
      error = (SP -PV)           *steadyStateGain;
      der(integralError) = error;
      CO           = Kp*(error + integralError/Ti) + biasCO + (1.0 -
        steadyStateGain)*deltaCO;
      annotation (
        Documentation(info="<HTML>
<p>This model is useful to compute the steady state value of a control variable corresponding to some specified setpoint of an output variable, and to reuse it later to perform simulations starting from this steady state condition.
<p>The block has two different behaviours, depending on the value of the <tt>steadyState</tt> parameter.
<p>When <tt>steadyState = 1</tt>, the <tt>deltaCO</tt> input is ignored, and the block acts as a standard PI controller with transfer function Kp*(1+1/sTi) to bring the process variable connected to the <tt>PV</tt> input at the setpoint value, by acting on the control variable connected to the <tt>CO</tt> output. The setpoint value is <tt>SP0</tt> at time zero, and may change by <tt>deltaSP</tt> from <tt>Tstart</tt> to <tt>Tend</tt>; this can be useful to bring the process far away from the tentative start values of the transient without any inconvenience. The control variable can be biased by <tt>biasCO</tt> to start near the expected steady state value of <tt>CO</tt>.
<p>When <tt>steadyState = 0</tt>, the <tt>PV</tt> input is ignored, and the <tt>CO</tt> output is simply the sum of the <tt>deltaCO</tt> input and of the freezed steady-state output of the controller.
<p>To perform a steady state computation:
<ol>
<li>Set <tt>steadyState = 1</tt> and suitably tune <tt>Kp</tt>, <tt>Ti</tt> and <tt>biasCO</tt>
<li>Simulate a transient until the desired steady state is achieved.
<li>Set <tt>steadyState = 0</tt> and continue the simulation for 0 s
<li>Save the final state of the simulation, which contains the initial steady-state values of all the variables for subsequent transient simulations
</ol>
<p>To perform experiments starting from a steady state:
<ol>
<li>Load a previously saved steady state, to be used as initial state
<li>Perform the simulation of the desired transient. The <tt>offsetCO</tt> input value will be automatically added to the previously computed steady state value.
</ol>
<p><b>Revision history:</b></p>
<ul>
<li><i>15 Feb 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"),
        Diagram,
        Icon(Text(extent=[-90, 90; 94, -92], string="SS Offset")));
    end OffsetController;
    annotation (Documentation(info="<HTML>
This package contains general-purpose functions and models
</HTML>"));
    package PumpCharacteristics "Functions for pump characteristics" 
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    
      partial function baseFlow "Base class for pump flow characteristics" 
        extends Modelica.Icons.Function;
        input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
        output Modelica.SIunits.Height head "Pump head";
      end baseFlow;
    
      partial function basePower 
      "Base class for pump power consumption characteristics" 
        extends Modelica.Icons.Function;
        input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
        output Modelica.SIunits.Power consumption 
        "Power consumption at nominal density";
      end basePower;
    
      partial function baseEfficiency 
      "Base class for efficiency characteristics" 
        extends Modelica.Icons.Function;
        input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
        output Real eta "Efficiency";
      end baseEfficiency;
    
      function linearFlow "Linear flow characteristic" 
        extends baseFlow;
        input Modelica.SIunits.VolumeFlowRate q_nom[2] 
        "Volume flow rate for two operating points (single pump)";
        input Modelica.SIunits.Height head_nom[2] 
        "Pump head for two operating points";
        /* Linear system to determine the coefficients:
  head_nom[1] = c[1] + q_nom[1]*c[2];
  head_nom[2] = c[1] + q_nom[2]*c[2];
  */
    protected 
        Real c[2] = Modelica.Math.Matrices.solve([ones(2),q_nom],head_nom) 
        "Coefficients of linear head curve";
      algorithm 
        // Flow equation: head = q*c[1] + c[2];
        head :=  c[1] + q_flow*c[2];
      end linearFlow;
    
      function quadraticFlow "Quadratic flow characteristic" 
        extends baseFlow;
        input Modelica.SIunits.VolumeFlowRate q_nom[3] 
        "Volume flow rate for three operating points (single pump)";
        input Modelica.SIunits.Height head_nom[3] 
        "Pump head for three operating points";
    protected 
        Real q_nom2[3] = {q_nom[1]^2,q_nom[2]^2, q_nom[3]^2} 
        "Squared nominal flow rates";
        /* Linear system to determine the coefficients:
  head_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  head_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  head_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
        Real c[3] = Modelica.Math.Matrices.solve([ones(3), q_nom, q_nom2],head_nom) 
        "Coefficients of quadratic head curve";
      algorithm 
        // Flow equation: head = c[1] + q_flow*c[2] + q_flow^2*c[3];
        head := c[1] + q_flow*c[2] + q_flow^2*c[3];
      end quadraticFlow;
    
      function polynomialFlow "Polynomial flow characteristic" 
        extends baseFlow;
        input Modelica.SIunits.VolumeFlowRate q_nom[:] 
        "Volume flow rate for N operating points (single pump)";
        input Modelica.SIunits.Height head_nom[:] 
        "Pump head for N operating points";
    protected 
        Integer N = size(q_nom,1) "Number of nominal operating points";
        Real q_nom_pow[N,N] = {{q_nom[j]^(i-1) for j in 1:N} for i in 1:N} 
        "Rows: different operating points; columns: increasing powers";
        /* Linear system to determine the coefficients (example N=3):
  head_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  head_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  head_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
        Real c[N] = Modelica.Math.Matrices.solve(q_nom_pow,head_nom) 
        "Coefficients of polynomial head curve";
      algorithm 
        // Flow equation (example N=3): head = c[1] + q_flow*c[2] + q_flow^2*c[3];
        // Note: the implementation is numerically efficient only for low values of N
        head := sum(q_flow^(i-1)*c[i] for i in 1:N);
      end polynomialFlow;
    
      function constantPower "Constant power consumption characteristic" 
          extends basePower;
        input Modelica.SIunits.Power power = 0 "Constant power consumption";
      algorithm 
        consumption := power;
      end constantPower;

      function linearPower "Linear power consumption characteristic" 
        extends basePower;
        input Modelica.SIunits.VolumeFlowRate q_nom[2] 
        "Volume flow rate for two operating points (single pump)";
        input Modelica.SIunits.Power W_nom[2] 
        "Power consumption for two operating points";
        /* Linear system to determine the coefficients:
  W_nom[1] = c[1] + q_nom[1]*c[2];
  W_nom[2] = c[1] + q_nom[2]*c[2];
  */
    protected 
        Real c[2] = Modelica.Math.Matrices.solve([ones(2),q_nom],W_nom) 
        "Coefficients of quadratic power consumption curve";
      algorithm 
        consumption := c[1] + q_flow*c[2];
      end linearPower;

      function quadraticPower "Quadratic power consumption characteristic" 
        extends basePower;
        input Modelica.SIunits.VolumeFlowRate q_nom[3] 
        "Volume flow rate for three operating points (single pump)";
        input Modelica.SIunits.Power W_nom[3] 
        "Power consumption for three operating points";
    protected 
        Real q_nom2[3] = {q_nom[1]^2,q_nom[2]^2, q_nom[3]^2} 
        "Squared nominal flow rates";
        /* Linear system to determine the coefficients:
  W_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  W_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  W_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
        Real c[3] = Modelica.Math.Matrices.solve([ones(3),q_nom,q_nom2],W_nom) 
        "Coefficients of quadratic power consumption curve";
      algorithm 
        consumption := c[1] + q_flow*c[2] + q_flow^2*c[3];
      end quadraticPower;

      function constantEfficiency "Constant efficiency characteristic" 
         extends baseEfficiency;
         input Real eta_nom "Nominal efficiency";
      algorithm 
        eta := eta_nom;
      end constantEfficiency;
    
    
    end PumpCharacteristics;
  
    package ValveCharacteristics "Functions for valve characteristics" 
      partial function baseFun "Base class for valve characteristics" 
        extends Modelica.Icons.Function;
        input Real pos "Stem position (per unit)";
        output Real rc "Relative coefficient (per unit)";
      end baseFun;
    
      function linear "Linear characteristic" 
        extends baseFun;
      algorithm 
        rc := pos;
      end linear;
    
      function one "Constant characteristic" 
        extends baseFun;
      algorithm 
        rc := 1;
      end one;
    
      function quadratic "Quadratic characteristic" 
        extends baseFun;
      algorithm 
        rc := pos*pos;
      end quadratic;
    
      function equalPercentage "Equal percentage characteristic" 
        extends baseFun;
        input Real rangeability = 20 "Rangeability";
        input Real delta = 0.01;
      algorithm 
        rc := if pos > delta then rangeability^(pos-1) else 
                pos/delta*rangeability^(delta-1);
        annotation (Documentation(info="<html>
This characteristic is such that the relative change of the flow coefficient is proportional to the change in the stem position:
<p> d(rc)/d(pos) = k d(pos).
<p> The constant k is expressed in terms of the rangeability, i.e. the ratio between the maximum and the minimum useful flow coefficient:
<p> rangeability = exp(k) = rc(1.0)/rc(0.0).
<p> The theoretical characteristic has a non-zero opening when pos = 0; the implemented characteristic is modified so that the valve closes linearly when pos &lt delta.
</html>"));
      end equalPercentage;
    
      function sinusoidal "Sinusoidal characteristic" 
        extends baseFun;
      import Modelica.Math.*;
      import Modelica.Constants.*;
      algorithm 
        rc := sin(pos*pi/2);
      end sinusoidal;
    end ValveCharacteristics;
  
    package FanCharacteristics "Functions for fan characteristics" 
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    
      partial function baseFlow "Base class for fan flow characteristics" 
        extends Modelica.Icons.Function;
        input VolumeFlowRate q_flow "Volumetric flow rate";
        input Real bladePos = 1 "Blade position";
        output SpecificEnergy H "Specific Energy";
      end baseFlow;
    
      partial function basePower 
      "Base class for fan power consumption characteristics" 
        extends Modelica.Icons.Function;
        input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
        input Real bladePos = 1 "Blade position";
        output Modelica.SIunits.Power consumption "Power consumption";
      end basePower;
    
      partial function baseEfficiency 
      "Base class for efficiency characteristics" 
        extends Modelica.Icons.Function;
        input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
        input Real bladePos = 1 "Blade position";
        output Real eta "Efficiency";
      end baseEfficiency;
    
      function linearFlow "Linear flow characteristic, fixed blades" 
        extends baseFlow;
        input Modelica.SIunits.VolumeFlowRate q_nom[2] 
        "Volume flow rate for two operating points (single fan)";
        input Modelica.SIunits.Height H_nom[2] 
        "Specific energy for two operating points";
        /* Linear system to determine the coefficients:
  H_nom[1] = c[1] + q_nom[1]*c[2];
  H_nom[2] = c[1] + q_nom[2]*c[2];
  */
    protected 
        Real c[2] = Modelica.Math.Matrices.solve([ones(2),q_nom],H_nom) 
        "Coefficients of linear head curve";
      algorithm 
        // Flow equation: head = q*c[1] + c[2];
        H := c[1] + q_flow*c[2];
      end linearFlow;
    
      function quadraticFlow "Quadratic flow characteristic, fixed blades" 
        extends baseFlow;
        input Modelica.SIunits.VolumeFlowRate q_nom[3] 
        "Volume flow rate for three operating points (single fan)";
        input Modelica.SIunits.Height H_nom[3] 
        "Specific work for three operating points";
    protected 
        Real q_nom2[3] = {q_nom[1]^2,q_nom[2]^2, q_nom[3]^2} 
        "Squared nominal flow rates";
        /* Linear system to determine the coefficients:
  H_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  H_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  H_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
        Real c[3] = Modelica.Math.Matrices.solve([ones(3), q_nom, q_nom2],H_nom) 
        "Coefficients of quadratic specific work characteristic";
      algorithm 
        // Flow equation: H = c[1] + q_flow*c[2] + q_flow^2*c[3];
        H := c[1] + q_flow*c[2] + q_flow^2*c[3];
      end quadraticFlow;
    
      function quadraticFlowBlades 
      "Quadratic flow characteristic, movable blades" 
        extends baseFlow;
        input Real bladePos_nom[:];
        input Modelica.SIunits.VolumeFlowRate q_nom[3,:] 
        "Volume flow rate for three operating points at N_pos blade positionings";
        input Modelica.SIunits.Height H_nom[3,:] 
        "Specific work for three operating points at N_pos blade positionings";
        input Real slope_s(unit = "(J/kg)/(m3/s)", max = 0) = 0 
        "Slope of flow characteristic at stalling conditions (must be negative)";
      algorithm 
        H := Utilities.quadraticFlowBlades(q_flow, bladePos, bladePos_nom,
             Utilities.quadraticFlowBladesCoeff(bladePos_nom, q_nom, H_nom), slope_s);
      end quadraticFlowBlades;
    
      function polynomialFlow "Polynomial flow characteristic, fixed blades" 
        extends baseFlow;
        input Modelica.SIunits.VolumeFlowRate q_nom[:] 
        "Volume flow rate for N operating points (single fan)";
        input Modelica.SIunits.Height H_nom[:] 
        "Specific work for N operating points";
    protected 
        Integer N = size(q_nom,1) "Number of nominal operating points";
        Real q_nom_pow[N,N] = {{q_nom[j]^(i-1) for j in 1:N} for i in 1:N} 
        "Rows: different operating points; columns: increasing powers";
        /* Linear system to determine the coefficients (example N=3):
  H_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  H_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  H_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
        Real c[N] = Modelica.Math.Matrices.solve(q_nom_pow,H_nom) 
        "Coefficients of polynomial specific work curve";
      algorithm 
        // Flow equation (example N=3): H = c[1] + q_flow*c[2] + q_flow^2*c[3];
        // Note: the implementation is numerically efficient only for low values of Na
        H := sum(q_flow^(i-1)*c[i] for i in 1:N);
      end polynomialFlow;
    
      function constantEfficiency "Constant efficiency characteristic" 
         extends baseEfficiency;
         input Real eta_nom "Nominal efficiency";
      algorithm 
        eta := eta_nom;
      end constantEfficiency;
    
      function quadraticPower 
      "Quadratic power consumption characteristic, fixed blades" 
        extends basePower;
        input Modelica.SIunits.VolumeFlowRate q_nom[3] 
        "Volume flow rate for three operating points (single fan)";
        input Modelica.SIunits.Power W_nom[3] 
        "Power consumption for three operating points";
    protected 
        Real q_nom2[3] = {q_nom[1]^2,q_nom[2]^2, q_nom[3]^2} 
        "Squared nominal flow rates";
        /* Linear system to determine the coefficients:
  W_nom[1]*g = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  W_nom[2]*g = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  W_nom[3]*g = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
        Real c[3] = Modelica.Math.Matrices.solve([ones(3),q_nom,q_nom2],W_nom) 
        "Coefficients of quadratic power consumption curve";
      algorithm 
        consumption := c[1] + q_flow*c[2] + q_flow^2*c[3];
      end quadraticPower;
    
      package Utilities 
        function quadraticFlowBlades 
        "Quadratic flow characteristic, movable blades" 
          extends Modelica.Icons.Function;
          input Modelica.SIunits.VolumeFlowRate q_flow;
          input Real bladePos;
          input Real bladePos_nom[:];
          input Real c[:,:] 
          "Coefficients of quadratic specific work characteristic";
          input Real slope_s(unit = "(J/kg)/(m3/s)", max = 0) = 0 
          "Slope of flow characteristic at stalling conditions (must be negative)";
          output SpecificEnergy H "Specific Energy";
      protected 
          Integer N_pos=size(bladePos_nom,1);
          Integer i;
          Real alpha;
          Real q_s "Volume flow rate at stalling conditions";
        algorithm 
          // Flow equation: H = c[1] + q_flow*c[2] + q_flow^2*c[3];
          i := N_pos-1;
          while bladePos <= bladePos_nom[i] and i > 1 loop
            i := i - 1;
          end while;
          alpha := (bladePos-bladePos_nom[i])/(bladePos_nom[i+1]-bladePos_nom[i]);
          q_s :=(slope_s-((1 - alpha)*c[2, i] + alpha*c[2, i + 1]))/
                (2*((1 - alpha)*c[3, i] + alpha*c[3, i + 1]));
          H:= if q_flow > q_s then 
               ((1-alpha)*c[1,i] + alpha*c[1,i+1]) +
               ((1-alpha)*c[2,i] + alpha*c[2,i+1])*q_flow +
               ((1-alpha)*c[3,i] + alpha*c[3,i+1])*q_flow^2 else 
               ((1-alpha)*c[1,i] + alpha*c[1,i+1]) +
               ((1-alpha)*c[2,i] + alpha*c[2,i+1])*q_s +
               ((1-alpha)*c[3,i] + alpha*c[3,i+1])*q_s^2 +
               (q_flow - q_s)*slope_s;
        end quadraticFlowBlades;
      
        function quadraticFlowBladesCoeff 
          extends Modelica.Icons.Function;
          input Real bladePos_nom[:];
          input Modelica.SIunits.VolumeFlowRate q_nom[3,:] 
          "Volume flow rate for three operating points at N_pos blade positionings";
          input Modelica.SIunits.Height H_nom[3,:] 
          "Specific work for three operating points at N_pos blade positionings";
          output Real c[3,size(bladePos_nom,1)] 
          "Coefficients of quadratic specific work characteristic";
      protected 
          Integer N_pos=size(bladePos_nom,1);
          Real q_nom2[3];
        algorithm 
          for j in 1:N_pos loop
           q_nom2 := {q_nom[1, j]^2,q_nom[2, j]^2,q_nom[3, j]^2};
           c[:,j] := Modelica.Math.Matrices.solve([ones(3),q_nom[:,j],q_nom2], H_nom[:,j]);
          end for;
        end quadraticFlowBladesCoeff;
      end Utilities;
    end FanCharacteristics;
  end Functions;


  annotation (Documentation(info="<HTML>
<p><h2>General Information</h2></p>
<p>The ThermoFluid library is an open Modelica library for the dynamic modeling of thermal power plants.
<p>A general description of the library can be found in the papers:
<ul><li>F. Casella, A. Leva, \"Modelling of distributed thermo-hydraulic processes using Modelica\", <i>Proceedings of the MathMod '03 Conference</i>, Wien, Austria, 2003.
<li>F. Casella, A. Leva, \"Modelica open library for power plant simulation: design and experimental validation\", <i>Proceedings of the 2003 Modelica Conference</i>, Link&ouml ping, Sweden, 2003.
</ul>
<p>The papers are available from the <a href=\"mailto:francesco.casella@polimi.it\">authors</a> upon request, or can be downloaded from the <a href=\"http://www.elet.polimi.it/upload/casella/thermopower/\">library home page</a>.
<p>The ThermoPower library uses the medium models provided by the Modelica.Media library, which is freely available from the <a href= \"http://www.modelica.org/\">Modelica Association</a> web site.
 
<p><h2>Library home page</h2></p>
<p>For additional information and library updates, consult the <a href=\"http://www.elet.polimi.it/upload/casella/thermopower/\"> 
library home page</a>, and the <a href=\"http://sourceforge.net/projects/thermopower/\"> ThermoPower project page </a> on SourceForge.net.
<p>Contributions to the library are welcome: please contact the authors if you are interested.
 
<p><h2>Release notes:</h2></p>
 
<h3>Version 2.0 (<i>10 Jun 2005</i>)</h3>
<ul>
    <li>The new Modelica 2.2 standard library is used.
    <li>The ThermoPower library is now based on the Modelica.Media standard library for fluid property calculations. All the component models use a Modelica.Media compliant interface to specify the medium model. Standard water and gas models from the Modelica.Media library can be used, as well as custom-built water and gas models, compliant with the Modelica.Media interfaces.
    <li>Fully functional gas components are now available, including model for gas compressors and turbines, as well as compact gas turbine unit models.
    <li>Steady-state initialisation support has been added to all dynamic models.
<li>Some components are still under development, and could be changed in the final 2.0 release:
<ul>
<li>Moving boundary model for two-phase flow in once-through evaporators.
<li>Stress models for headers and turbines.
</ul>
</ul>
<h3>Version 1.2 (<i>18 Nov 2004</i>)</h3>
<ul>
    <li>Valve and pump models restructured using inheritance.
    <li>Simple model of a steam turbine unit added (requires the  Modelica.Media library).
    <li>CISE example restructured and moved to the <tt>Examples</tt> package.
    <li>Preliminary version of gas components added in the <tt>Gas</tt> package.
    <li>Finite element model of thermohydraulic two-phase flow added.
    <li>Simplified models for the connection to the power system added in the <tt>Electrical</tt> package.
</ul>
 
<h3>Version 1.1 (<i>15 Feb 2004</i>)</h3>
<ul>
    <li>No default values for parameters whose values must be set explicitly by the user.
    <li>Description of the meaning of the model variables added.
    <li><tt>Pump</tt>, <tt>PumpMech</tt>, <tt>Accumulator</tt> models added.
    <li>More rational geometric parameters for <tt>Flow1D*</tt> models.
    <li><tt>Flow1D</tt> model corrected to avoid numerical problems when the phase transition boundaries cross the nodes.
    <li><tt>Flow1D2phDB</tt> model updated.
    <li><tt>Flow1D2phChen</tt> models with two-phase heat transfer added.
</ul>
<h3>Version 1.0 (<i>20 Oct 2003</i>)</h3>
<ul>
    <li>First release in the public domain</li>
</ul>
<h2>License agreement</h2></p>
<p>The ThermoPower package is <b>free</b> software;
it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".
<p><b>Copyright &copy; 2002-2004, Politecnico di Milano.</b></p>
</HTML>"), uses(Modelica(version="2.2.2")),
    version="2",
    conversion(from(
        version="1",
        script="ConvertFromThermoPower_1.mos",
        version="")));


  package Electrical "Simplified models of electric power components" 
    extends Modelica.Icons.Library;
    connector PowerConnection "Electrical power connector" 
      flow Power W "Active power";
      Frequency f "Frequency";
      annotation (Icon(Rectangle(extent=[-100,100; 100,-100], style(
              pattern=0,
              thickness=2,
              fillColor=1,
              rgbfillColor={255,0,0},
              fillPattern=1))));
    end PowerConnection;
  
    model Grid "Ideal grid with finite droop" 
      parameter Frequency fn=50 "Nominal frequency";
      parameter Power Pn "Nominal power installed on the network";
      parameter Real droop(unit="pu")=0.05 "Network droop";
      PowerConnection connection annotation (extent=[-100,-14; -72,14]);
    equation 
      connection.f = fn + droop*fn*connection.W/Pn;
      annotation (Diagram, Icon(
          Line(points=[18,-16; 2,-38], style(color=0, rgbcolor={0,0,0})),
          Line(points=[-72,0; -40,0], style(color=0, rgbcolor={0,0,0})),
          Ellipse(extent=[100,-68; -40,68], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2)),
          Line(points=[-40,0; -6,0; 24,36; 54,50], style(color=0, rgbcolor={0,0,
                  0})),
          Line(points=[24,36; 36,-6], style(color=0, rgbcolor={0,0,0})),
          Line(points=[-6,0; 16,-14; 40,-52], style(color=0, rgbcolor={0,0,0})),
          Line(points=[18,-14; 34,-6; 70,-22], style(color=0, rgbcolor={0,0,0})),
          Line(points=[68,18; 36,-4; 36,-4], style(color=0, rgbcolor={0,0,0})),
          Ellipse(extent=[-8,2; -2,-4], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Ellipse(extent=[20,38; 26,32], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Ellipse(extent=[52,54; 58,48], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Ellipse(extent=[14,-12; 20,-18], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Ellipse(extent=[66,22; 72,16], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Ellipse(extent=[32,-2; 38,-8], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Ellipse(extent=[38,-50; 44,-56], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Ellipse(extent=[66,-18; 72,-24], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Ellipse(extent=[0,-34; 6,-40], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255}))));
    end Grid;
  
    model Breaker "Circuit breaker" 
      PowerConnection connection1 annotation (extent=[-100,-14; -72,14]);
      PowerConnection connection2 annotation (extent=[72,-14; 100,14]);
      annotation (Diagram, Icon(
          Line(points=[-72,0; -40,0], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=1,
              rgbfillColor={255,0,0},
              fillPattern=1)),
          Line(points=[40,0; 72,0], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=1,
              rgbfillColor={255,0,0},
              fillPattern=1)),
          Line(points=[-40,0; 30,36; 30,34], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=1,
              rgbfillColor={255,0,0},
              fillPattern=1)),
          Ellipse(extent=[-42,4; -34,-4], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=7,
              rgbfillColor={255,255,255})),
          Ellipse(extent=[36,4; 44,-4], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=7,
              rgbfillColor={255,255,255})),
          Line(points=[0,60; 0,20], style(
              color=83,
              rgbcolor={255,85,255},
              fillColor=83,
              rgbfillColor={255,85,255},
              fillPattern=1))));
      Modelica.Blocks.Interfaces.BooleanInput closed 
        annotation (extent=[-20,60; 20,100], rotation=-90);
    equation 
      connection1.W+connection2.W=0;
      if closed then
        connection1.f=connection2.f;
      else
        connection1.W=0;
      end if;
    end Breaker;
  
    model Generator "Active power generator" 
    import Modelica.SIunits.Conversions.NonSIunits.*;
      parameter Real eta=1 "Conversion efficiency";
      parameter Boolean hasInertia = false 
      "Model accounts for rotational inertia";
      parameter MomentOfInertia J=0 "Moment of inertia";
      parameter Integer Np=2 "Number of electrical poles";
      Energy E "Rotational kinetic energy";
      AngularVelocity omega "Shaft angular velocity";
      AngularVelocity_rpm n "Rotational speed";
      Frequency f "Electrical frequency";
      PowerConnection powerConnection annotation (extent=[72,-14; 100,14]);
      Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft 
        annotation (extent=[-100,-14; -72,14]);
    equation 
      omega=der(shaft.phi) "Mechanical boundary condition";
      f=Np*omega/(2*Modelica.Constants.pi) "Electrical frequency";
      n = Modelica.SIunits.Conversions.to_rpm(omega) "Rotational speed in rpm";
      powerConnection.f=f "Electrical boundary condition";
      if hasInertia then
        E=1/2*J*omega^2 "Kinetic energy";
        der(E)=omega*shaft.tau-powerConnection.W/eta "Energy balance";
      else
        E=0 "Kinetic energy";
        0=omega*shaft.tau+powerConnection.W/eta "Energy balance";
      end if annotation (Diagram);
      annotation (Icon(
          Rectangle(extent=[-72,6; -48,-8],  style(
              color=76,
              gradient=2,
              fillColor=9)),
          Ellipse(extent=[50,-50; -50,50], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1)),
          Line(points=[50,0; 72,0], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1)),
          Text(
            extent=[-26,24; 28,-28],
            style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1),
            string="G")));
    end Generator;
  
    model Load "Electrical load" 
      parameter Power Wn "Nominal active power consumption";
      parameter Frequency fn=50 "Nominal frequency";
      replaceable function powerCurve = Functions.one 
      "Normalised power consumption vs. frequency curve";
      PowerConnection connection annotation (extent=[-14,74; 12,100]);
      Power W "Actual power consumption";
      Frequency f "Frequency";
      annotation (
        extent=[-20,80; 0,100],
        rotation=-90,
        Icon(
          Line(points=[0,40; 0,74],   style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1)),
          Rectangle(extent=[-20,40; 20,-40], style(
              color=0,
              rgbcolor={0,0,0},
              thickness=2,
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1)),
          Line(points=[0,-40; 0,-68],
                                    style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1)),
          Line(points=[16,-68; -16,-68],
                                       style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1)),
          Line(points=[8,-76; -8,-76], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1)),
          Line(points=[-2,-84; 4,-84],
                                     style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1))));
      Modelica.Blocks.Interfaces.RealInput powerConsumption 
        annotation (extent=[-20,12; -46,-12], rotation=-180);
    equation 
      if cardinality(powerConsumption)==1 then
        W=powerConsumption*powerCurve((f-fn)/fn) 
        "Power consumption determined by connector";
      else
        powerConsumption=Wn "Set the connector value (not used)";
        W=Wn*powerCurve((f-fn)/fn) "Power consumption determined by parameter";
      end if;
      connection.f=f;
      connection.W=W;
    end Load;
  
    model PowerSensor "Measures power flow through the component" 
      PowerConnection port_a annotation (extent=[-110,-10; -90,10]);
      PowerConnection port_b annotation (extent=[90,-12; 110,8]);
    annotation (Diagram, Icon(
          Ellipse(extent=[-70,70; 70,-70],   style(color=0, fillColor=7)),
          Line(points=[0,70; 0,40],   style(color=0)),
          Line(points=[22.9,32.8; 40.2,57.3],   style(color=0)),
          Line(points=[-22.9,32.8; -40.2,57.3],   style(color=0)),
          Line(points=[37.6,13.7; 65.8,23.9],   style(color=0)),
          Line(points=[-37.6,13.7; -65.8,23.9],   style(color=0)),
          Line(points=[0,0; 9.02,28.6],   style(color=0)),
          Polygon(points=[-0.48,31.6; 18,26; 18,57.2; -0.48,31.6],     style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Ellipse(extent=[-5,5; 5,-5],   style(
              color=0,
              gradient=0,
              fillColor=0,
              fillPattern=1)),
             Text(
            extent=[-29,-11; 30,-70],
            style(color=0),
          string="W"),
          Line(points=[-70,0; -90,0],   style(color=0)),
          Line(points=[100,0; 70,0], style(color=0, rgbcolor={0,0,0})),
          Text(extent=[-148,88; 152,128],   string="%name"),
        Line(points=[0,-70; 0,-84], style(color=0, rgbcolor={0,0,0}))));
      Modelica.Blocks.Interfaces.RealOutput W(
          redeclare type SignalType = Power) 
      "Power flowing from port_a to port_b" 
          annotation (extent=[-10,-104; 10,-84], rotation=-90);
    equation 
      port_a.W+port_b.W = 0;
      port_a.f = port_b.f;
      W = port_a.W;
    end PowerSensor;
  
    model FrequencySensor "Measures the frequency at the connector" 
      PowerConnection port annotation (extent=[-110,-10; -90,10]);
    annotation (Diagram, Icon(
          Ellipse(extent=[-70,70; 70,-70],   style(color=0, fillColor=7)),
          Line(points=[0,70; 0,40],   style(color=0)),
          Line(points=[22.9,32.8; 40.2,57.3],   style(color=0)),
          Line(points=[-22.9,32.8; -40.2,57.3],   style(color=0)),
          Line(points=[37.6,13.7; 65.8,23.9],   style(color=0)),
          Line(points=[-37.6,13.7; -65.8,23.9],   style(color=0)),
          Line(points=[0,0; 9.02,28.6],   style(color=0)),
          Polygon(points=[-0.48,31.6; 18,26; 18,57.2; -0.48,31.6],     style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Ellipse(extent=[-5,5; 5,-5],   style(
              color=0,
              gradient=0,
              fillColor=0,
              fillPattern=1)),
             Text(
            extent=[-29,-11; 30,-70],
            style(color=0),
          string="f"),
          Line(points=[-70,0; -90,0],   style(color=0)),
          Line(points=[100,0; 70,0], style(color=0, rgbcolor={0,0,0})),
          Text(extent=[-148,88; 152,128],   string="%name")));
      Modelica.Blocks.Interfaces.RealOutput f(
          redeclare type SignalType = Frequency) "Frequency at the connector" 
          annotation (extent=[92,-10; 112,10], rotation=0);
    equation 
      port.W = 0;
      f = port.f;
    end FrequencySensor;
  end Electrical;
end ThermoPower;
