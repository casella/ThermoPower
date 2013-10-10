within ;
package ThermoPower "Open library for thermal power plant simulation"
extends Modelica.Icons.Package;
import Modelica.Math.*;
import Modelica.SIunits.*;


model System "System wide properties"
  // Assumptions
  parameter Boolean allowFlowReversal=true
    "= false to restrict to design flow direction (flangeA -> flangeB)"
    annotation (Evaluate=true);
  parameter ThermoPower.Choices.System.Dynamics Dynamics=ThermoPower.Choices.System.Dynamics.DynamicFreeInitial;
  annotation (
    defaultComponentName="system",
    defaultComponentPrefixes="inner",
    Icon(graphics={Polygon(
          points={{-100,60},{-60,100},{60,100},{100,60},{100,-60},{60,-100},{-60,
              -100},{-100,-60},{-100,60}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-80,40},{80,-20}},
          lineColor={0,0,255},
          textString="system")}));
end System;


package Icons "Icons for ThermoPower library"
  extends Modelica.Icons.Package;
  package Water "Icons for component using water/steam as working fluid"
    extends Modelica.Icons.Package;
    partial model SourceP

      annotation (Icon(graphics={
            Ellipse(
              extent={{-80,80},{80,-80}},
              lineColor={0,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-20,34},{28,-26}},
              lineColor={255,255,255},
              textString="P"),
            Text(extent={{-100,-78},{100,-106}}, textString="%name")}));
    end SourceP;

    partial model SourceW

      annotation (Icon(graphics={
            Rectangle(
              extent={{-80,40},{80,-40}},
              lineColor={0,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-12,-20},{66,0},{-12,20},{34,0},{-12,-20}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(extent={{-100,-52},{100,-80}}, textString="%name")}));

    end SourceW;

    partial model Tube

      annotation (Icon(graphics={Rectangle(
              extent={{-80,40},{80,-40}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder)}), Diagram(graphics));
    end Tube;

    partial model Mixer

      annotation (Icon(graphics={Ellipse(
              extent={{80,80},{-80,-80}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}), Text(extent={{-100,-84},{100,-110}},
                textString="%name")}), Diagram(graphics));
    end Mixer;

    partial model Tank

      annotation (Icon(graphics={
            Rectangle(
              extent={{-60,60},{60,-80}},
              lineColor={0,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-54,60},{54,12}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(extent={{-54,12},{54,-72}}, lineColor={0,0,255})}));
    end Tank;

    partial model Valve

      annotation (Icon(graphics={
            Line(
              points={{0,40},{0,0}},
              color={0,0,0},
              thickness=0.5),
            Polygon(
              points={{-80,40},{-80,-40},{0,0},{-80,40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Polygon(
              points={{80,40},{0,0},{80,-40},{80,40}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Rectangle(
              extent={{-20,60},{20,40}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}), Diagram(graphics));
    end Valve;

    model FlowJoin

      annotation (Diagram(graphics), Icon(graphics={Polygon(
              points={{-40,60},{0,20},{40,20},{40,-20},{0,-20},{-40,-60},{-40,-20},
                  {-20,0},{-40,20},{-40,60}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255})}));
    end FlowJoin;

    model FlowSplit

      annotation (Diagram(graphics), Icon(graphics={Polygon(
              points={{40,60},{0,20},{-40,20},{-40,-20},{0,-20},{40,-60},{40,-20},
                  {22,0},{40,20},{40,60}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255})}));
    end FlowSplit;

    model SensThrough

      annotation (Icon(graphics={
            Rectangle(
              extent={{-40,-20},{40,-60}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Line(points={{0,20},{0,-20}}, color={0,0,0}),
            Ellipse(extent={{-40,100},{40,20}}, lineColor={0,0,0}),
            Line(points={{40,60},{60,60}}),
            Text(extent={{-100,-76},{100,-100}}, textString="%name")}));

    end SensThrough;

    model SensP

      annotation (Icon(graphics={
            Line(points={{0,20},{0,-20}}, color={0,0,0}),
            Ellipse(extent={{-40,100},{40,20}}, lineColor={0,0,0}),
            Line(points={{40,60},{60,60}}),
            Text(extent={{-100,-52},{100,-86}}, textString="%name")}));
    end SensP;

    model Drum

      annotation (Icon(graphics={
            Ellipse(
              extent={{-80,80},{80,-80}},
              lineColor={128,128,128},
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-60,0},{-60,-6},{-58,-16},{-52,-30},{-44,-42},{-38,-46},
                  {-32,-50},{-22,-56},{-16,-58},{-8,-60},{-6,-60},{0,-60},{6,-60},
                  {12,-58},{22,-56},{30,-52},{36,-48},{42,-42},{48,-36},{52,-28},
                  {58,-18},{60,-8},{60,0},{-60,0}},
              lineColor={128,128,128},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Polygon(
              points={{-60,0},{-58,16},{-50,34},{-36,48},{-26,54},{-16,58},{-6,
                  60},{0,60},{10,60},{20,56},{30,52},{36,48},{46,40},{52,30},{
                  56,22},{58,14},{60,6},{60,0},{-60,0}},
              lineColor={128,128,128},
              fillColor={159,191,223},
              fillPattern=FillPattern.Solid)}));
    end Drum;

    partial model Pump

      annotation (Icon(graphics={
            Polygon(
              points={{-40,-24},{-60,-60},{60,-60},{40,-24},{-40,-24}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,191},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-60,80},{60,-40}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere),
            Polygon(
              points={{-30,52},{-30,-8},{48,20},{-30,52}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,255,255}),
            Text(extent={{-100,-64},{100,-90}}, textString="%name")}));
    end Pump;

    partial model Accumulator

      annotation (Icon(graphics={
            Rectangle(
              extent={{-60,80},{60,-40}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-60,100},{60,60}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-60,-20},{60,-60}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-52,94},{52,64}},
              lineColor={0,0,191},
              pattern=LinePattern.None,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-52,22},{52,-40}},
              lineColor={0,0,191},
              fillColor={0,0,191},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-52,80},{52,20}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-52,-24},{52,-54}},
              lineColor={0,0,191},
              pattern=LinePattern.None,
              fillColor={0,0,191},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-4,-58},{4,-86}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-26,-86},{26,-94}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid),
            Text(extent={{-62,-100},{64,-122}}, textString="%name"),
            Polygon(
              points={{-74,86},{-60,72},{-54,78},{-68,92},{-74,86}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={128,128,128},
              fillPattern=FillPattern.Solid)}), Diagram(graphics));
    end Accumulator;

    partial model PumpMech

      annotation (Icon(graphics={
            Rectangle(
              extent={{54,28},{80,12}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={160,160,164}),
            Polygon(
              points={{-40,-24},{-60,-60},{60,-60},{40,-24},{-40,-24}},
              lineColor={0,0,255},
              pattern=LinePattern.None,
              fillColor={0,0,191},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-60,80},{60,-40}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere),
            Polygon(
              points={{-30,52},{-30,-8},{48,20},{-30,52}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,255,255}),
            Text(extent={{-100,-64},{100,-90}}, textString="%name")}));
    end PumpMech;

    partial model PressDrop

      annotation (Icon(graphics={Rectangle(
              extent={{-80,40},{80,-40}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder), Polygon(
              points={{-80,40},{-42,40},{-20,12},{20,12},{40,40},{80,40},{80,-40},
                  {40,-40},{20,-12},{-20,-12},{-40,-40},{-80,-40},{-80,40}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={0,0,255})}), Diagram(graphics));

    end PressDrop;

    partial model SteamTurbineUnit

      annotation (Icon(graphics={
            Line(
              points={{14,20},{14,42},{38,42},{38,20}},
              color={0,0,0},
              thickness=0.5),
            Rectangle(
              extent={{-100,8},{100,-8}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={160,160,164}),
            Polygon(
              points={{-14,48},{-14,-48},{14,-20},{14,20},{-14,48}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{38,20},{38,-20},{66,-46},{66,48},{38,20}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-66,20},{-66,-20},{-40,-44},{-40,48},{-66,20}},
              lineColor={0,0,0},
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-100,70},{-100,70},{-66,70},{-66,20}},
              color={0,0,0},
              thickness=0.5),
            Line(
              points={{-40,46},{-40,70},{26,70},{26,42}},
              color={0,0,0},
              thickness=0.5),
            Line(
              points={{-14,-46},{-14,-70},{66,-70},{66,-46}},
              color={0,0,0},
              thickness=0.5),
            Line(
              points={{66,-70},{100,-70}},
              color={0,0,255},
              thickness=0.5)}), Diagram(graphics));
    end SteamTurbineUnit;

    partial model Header

      annotation (Icon(graphics={
            Ellipse(
              extent={{-80,80},{80,-80}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{70,70},{-70,-70}},
              lineColor={95,95,95},
              fillPattern=FillPattern.Solid,
              fillColor={0,0,255}),
            Text(extent={{-100,-84},{100,-110}}, textString="%name")}), Diagram(
            graphics));
    end Header;
  end Water;

  partial model HeatFlow

    annotation (Icon(graphics={Rectangle(
            extent={{-80,20},{80,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Forward)}));
  end HeatFlow;

  partial model MetalWall

    annotation (Icon(graphics={Rectangle(
            extent={{-80,20},{80,-20}},
            lineColor={0,0,0},
            fillColor={128,128,128},
            fillPattern=FillPattern.Solid)}));
  end MetalWall;

  package Gas "Icons for component using water/steam as working fluid"
    extends Modelica.Icons.Package;
    partial model SourceP

      annotation (Icon(graphics={
            Ellipse(
              extent={{-80,80},{80,-80}},
              lineColor={128,128,128},
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-20,34},{28,-26}},
              lineColor={255,255,255},
              textString="P"),
            Text(extent={{-100,-78},{100,-106}}, textString="%name")}));
    end SourceP;

    partial model SourceW

      annotation (Icon(graphics={
            Rectangle(
              extent={{-80,40},{80,-40}},
              lineColor={128,128,128},
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-12,-20},{66,0},{-12,20},{34,0},{-12,-20}},
              lineColor={128,128,128},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Text(extent={{-100,-52},{100,-80}}, textString="%name")}));
    end SourceW;

    partial model Tube

      annotation (Icon(graphics={Rectangle(
              extent={{-80,40},{80,-40}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={159,159,223})}), Diagram(graphics));
    end Tube;

    partial model Mixer

      annotation (Icon(graphics={Ellipse(
              extent={{80,80},{-80,-80}},
              lineColor={128,128,128},
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid), Text(extent={{-100,-84},{100,-110}},
                textString="%name")}), Diagram(graphics));
    end Mixer;

    partial model Valve

      annotation (Icon(graphics={
            Line(
              points={{0,40},{0,0}},
              color={0,0,0},
              thickness=0.5),
            Polygon(
              points={{-80,40},{-80,-40},{0,0},{-80,40}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{80,40},{0,0},{80,-40},{80,40}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-20,60},{20,40}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}), Diagram(graphics));
    end Valve;

    model FlowJoin

      annotation (Diagram(graphics), Icon(graphics={Polygon(
              points={{-40,60},{0,20},{40,20},{40,-20},{0,-20},{-40,-60},{-40,-20},
                  {-20,0},{-40,20},{-40,60}},
              lineColor={128,128,128},
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid)}));
    end FlowJoin;

    model FlowSplit

      annotation (Diagram(graphics), Icon(graphics={Polygon(
              points={{40,60},{0,20},{-40,20},{-40,-20},{0,-20},{40,-60},{40,-20},
                  {22,0},{40,20},{40,60}},
              lineColor={128,128,128},
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid)}));
    end FlowSplit;

    model SensThrough

      annotation (Icon(graphics={
            Rectangle(
              extent={{-40,-20},{40,-60}},
              lineColor={128,128,128},
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Line(points={{0,20},{0,-20}}, color={0,0,0}),
            Ellipse(extent={{-40,100},{40,20}}, lineColor={0,0,0}),
            Line(points={{40,60},{60,60}}),
            Text(extent={{-100,-76},{100,-100}}, textString="%name")}));
    end SensThrough;

    model SensP

      annotation (Icon(graphics={
            Line(points={{0,20},{0,-20}}, color={0,0,0}),
            Ellipse(extent={{-40,100},{40,20}}, lineColor={0,0,0}),
            Line(points={{40,60},{60,60}}),
            Text(extent={{-130,-80},{132,-124}}, textString="%name")}));
    end SensP;

    partial model Compressor

      annotation (Icon(graphics={
            Polygon(
              points={{24,26},{30,26},{30,76},{60,76},{60,82},{24,82},{24,26}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-30,76},{-30,56},{-24,56},{-24,82},{-60,82},{-60,76},{-30,
                  76}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-60,8},{60,-8}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={160,160,164}),
            Polygon(
              points={{-30,60},{-30,-60},{30,-26},{30,26},{-30,60}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid)}), Diagram(graphics));

    end Compressor;

    partial model Turbine

      annotation (Icon(graphics={
            Polygon(
              points={{-28,76},{-28,28},{-22,28},{-22,82},{-60,82},{-60,76},{-28,
                  76}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{26,56},{32,56},{32,76},{60,76},{60,82},{26,82},{26,56}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-60,8},{60,-8}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={160,160,164}),
            Polygon(
              points={{-28,28},{-28,-26},{32,-60},{32,60},{-28,28}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid)}), Diagram(graphics));

    end Turbine;

    partial model GasTurbineUnit

      annotation (Icon(graphics={
            Line(
              points={{-22,26},{-22,48},{22,48},{22,28}},
              color={0,0,0},
              thickness=2.5),
            Rectangle(
              extent={{-100,8},{100,-8}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={160,160,164}),
            Polygon(
              points={{-80,60},{-80,-60},{-20,-26},{-20,26},{-80,60}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{20,28},{20,-26},{80,-60},{80,60},{20,28}},
              lineColor={128,128,128},
              lineThickness=0.5,
              fillColor={159,159,223},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-16,64},{16,32}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={255,0,0})}), Diagram(graphics));
    end GasTurbineUnit;

    partial model Fan

      annotation (Icon(graphics={
            Polygon(
              points={{-38,-24},{-58,-60},{62,-60},{42,-24},{-38,-24}},
              lineColor={95,95,95},
              lineThickness=1,
              fillColor={170,170,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-60,80},{60,-40}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={170,170,255}),
            Polygon(
              points={{-30,52},{-30,-8},{48,20},{-30,52}},
              lineColor={0,0,0},
              pattern=LinePattern.None,
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,255,255}),
            Text(
              extent={{-100,-64},{100,-90}},
              lineColor={95,95,95},
              textString="%name")}));
    end Fan;
  end Gas;
end Icons;


package Functions "Miscellaneous functions"
  extends Modelica.Icons.Package;
  function linear
    extends Modelica.Icons.Function;
    input Real x;
    output Real y;
  algorithm
    y := x;
    annotation (derivative=Functions.linear_der);
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
  algorithm
    y := 1;
    annotation (derivative=Functions.one_der);
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
  algorithm
    y := x/sqrt(sqrt(x*x + delta*delta));

    annotation (
      derivative(zeroDerivative=delta) = ThermoPower.Functions.sqrtReg_der,
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
  end sqrtReg;

  function sqrtReg_der "Derivative of sqrtReg"
    extends Modelica.Icons.Function;
    input Real x;
    input Real delta=0.01 "Range of significant deviation from sqrt(x)";
    input Real dx "Derivative of x";
    output Real dy;
  algorithm
    dy := dx*0.5*(x*x + 2*delta*delta)/((x*x + delta*delta)^1.25);
    annotation (Documentation(info="<html>
</html>", revisions="<html>
<ul>
<li><i>15 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Created. </li>
</ul>
</html>"));
  end sqrtReg_der;

  function squareReg
    "Anti-symmetric square approximation with non-zero derivative in the origin"
    extends Modelica.Icons.Function;
    input Real x;
    input Real delta=0.01 "Range of significant deviation from x^2*sgn(x)";
    output Real y;
  algorithm
    y := x*sqrt(x*x + delta*delta);

    annotation (Documentation(info="<html>
This function approximates x^2*sgn(x), such that the derivative is non-zero in x=0.
</p>
<p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th>Function</th><th>Approximation</th><th>Range</th></tr>
<tr><td>y = regSquare(x)</td><td>y ~= x^2*sgn(x)</td><td>abs(x) &gt;&gt delta</td></tr>
<tr><td>y = regSquare(x)</td><td>y ~= x*delta</td><td>abs(x) &lt;&lt  delta</td></tr>
</table>
<p>
With the default value of delta=0.01, the difference between x^2 and regSquare(x) is 41% around x=0.01, 0.4% around x=0.1 and 0.005% around x=1.
</p>
</p>
</html>", revisions="<html>
<ul>
<li><i>15 Mar 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Created. </li>
</ul>
</html>"));
  end squareReg;

  function stepReg = Modelica.Fluid.Utilities.regStep
    "Regularized step function" annotation (
    smoothOrder=1,
    Documentation(info="<html>

</html>", revisions="<html>
<ul>
<li><i>22 Aug 2011</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Added. </li>
</ul>
</html>"),
    Documentation(info="<html>
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
  function smoothSat "Smooth saturation function"
    input Real x;
    input Real xmin "Lower bound of range where y = x";
    input Real xmax "Upper bound of range where y = x";
    input Real dxmin "Width of lower smoothing range";
    input Real dxmax=dxmin "Width of upper smoothing range";
    output Real y;
  algorithm
    y := if x < xmin + dxmin then
           xmin + dxmin - dxmin*(xmin + dxmin - x)/(dxmin^4 + (xmin + dxmin - x)^4)^0.25
         else if x > xmax - dxmax then
           xmax - dxmax + dxmax*(x - xmax + dxmax)/(dxmax^4 + (x - xmax + dxmax)^4)^0.25
         else x;
    annotation (smoothOrder=4, InLine=true);
  end smoothSat;

  function linspaceExt "Extended linspace function handling also the N=1 case"
    input Real x1;
    input Real x2;
    input Integer N;
    output Real vec[N];
  algorithm
    vec := if N == 1 then {x1}
           else linspace(x1, x2, N);
  end linspaceExt;

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
    Modelica.Blocks.Interfaces.RealInput deltaCO annotation (Placement(
          transformation(extent={{-140,62},{-100,100}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput PV annotation (Placement(
          transformation(extent={{-140,-100},{-100,-60}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput CO annotation (Placement(
          transformation(extent={{100,-20},{140,20}}, rotation=0)));
  equation
    SP = if time <= Tstart then SP0 else if time >= Tend then SP0 + deltaSP
       else SP0 + (time - Tstart)/(Tend - Tstart)*deltaSP;
    error = (SP - PV)*steadyStateGain;
    der(integralError) = error;
    CO = Kp*(error + integralError/Ti) + biasCO + (1.0 - steadyStateGain)*
      deltaCO;
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
      Diagram(graphics),
      Icon(graphics={Text(extent={{-90,90},{94,-92}}, textString="SS Offset")}));
  end OffsetController;

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

    partial function baseEfficiency "Base class for efficiency characteristics"
      extends Modelica.Icons.Function;
      input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
      output Real eta "Efficiency";
    end baseEfficiency;

    function linearFlow "Linear flow characteristic"
      extends baseFlow;
      input Modelica.SIunits.VolumeFlowRate q_nom[2]
        "Volume flow rate for two operating points (single pump)" annotation(Dialog);
      input Modelica.SIunits.Height head_nom[2]
        "Pump head for two operating points" annotation(Dialog);
      /* Linear system to determine the coefficients:
  head_nom[1] = c[1] + q_nom[1]*c[2];
  head_nom[2] = c[1] + q_nom[2]*c[2];
  */
    protected
      parameter Real c[2]=Modelica.Math.Matrices.solve([ones(2), q_nom],
          head_nom) "Coefficients of linear head curve";
    algorithm
      // Flow equation: head = q*c[1] + c[2];
      head := c[1] + q_flow*c[2];
      annotation (smoothOrder=2);
    end linearFlow;

    function quadraticFlow "Quadratic flow characteristic"
      extends baseFlow;
      input Modelica.SIunits.VolumeFlowRate q_nom[3]
        "Volume flow rate for three operating points (single pump)" annotation(Dialog);
      input Modelica.SIunits.Height head_nom[3]
        "Pump head for three operating points" annotation(Dialog);
    protected
      parameter Real q_nom2[3]={q_nom[1]^2,q_nom[2]^2,q_nom[3]^2}
        "Squared nominal flow rates";
      /* Linear system to determine the coefficients:
  head_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  head_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  head_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
      parameter Real c[3]=Modelica.Math.Matrices.solve([ones(3), q_nom, q_nom2],
          head_nom) "Coefficients of quadratic head curve";
    algorithm
      // Flow equation: head = c[1] + q_flow*c[2] + q_flow^2*c[3];
      head := c[1] + q_flow*c[2] + q_flow^2*c[3];
    end quadraticFlow;

    function polynomialFlow "Polynomial flow characteristic"
      extends baseFlow;
      input Modelica.SIunits.VolumeFlowRate q_nom[:]
        "Volume flow rate for N operating points (single pump)" annotation(Dialog);
      input Modelica.SIunits.Height head_nom[:]
        "Pump head for N operating points"                                         annotation(Dialog);
    protected
      parameter Integer N=size(q_nom, 1) "Number of nominal operating points";
      parameter Real q_nom_pow[N, N]={{q_nom[i]^(j - 1) for j in 1:N} for i in
          1:N} "Rows: different operating points; columns: increasing powers";
      /* Linear system to determine the coefficients (example N=3):
  head_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  head_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  head_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
      parameter Real c[N]=Modelica.Math.Matrices.solve(q_nom_pow, head_nom)
        "Coefficients of polynomial head curve";
    algorithm
      // Flow equation (example N=3): head = c[1] + q_flow*c[2] + q_flow^2*c[3];
      // Note: the implementation is numerically efficient only for low values of N
      head := sum(q_flow^(i - 1)*c[i] for i in 1:N);
    end polynomialFlow;

    function constantPower "Constant power consumption characteristic"
      extends basePower;
      input Modelica.SIunits.Power power=0 "Constant power consumption" annotation(Dialog);
    algorithm
      consumption := power;
    end constantPower;

    function linearPower "Linear power consumption characteristic"
      extends basePower;
      input Modelica.SIunits.VolumeFlowRate q_nom[2]
        "Volume flow rate for two operating points (single pump)" annotation(Dialog);
      input Modelica.SIunits.Power W_nom[2]
        "Power consumption for two operating points" annotation(Dialog);
      /* Linear system to determine the coefficients:
  W_nom[1] = c[1] + q_nom[1]*c[2];
  W_nom[2] = c[1] + q_nom[2]*c[2];
  */
    protected
      Real c[2]=Modelica.Math.Matrices.solve([ones(2), q_nom], W_nom)
        "Coefficients of quadratic power consumption curve";
    algorithm
      consumption := c[1] + q_flow*c[2];
    end linearPower;

    function quadraticPower "Quadratic power consumption characteristic"
      extends basePower;
      input Modelica.SIunits.VolumeFlowRate q_nom[3]
        "Volume flow rate for three operating points (single pump)" annotation(Dialog);
      input Modelica.SIunits.Power W_nom[3]
        "Power consumption for three operating points" annotation(Dialog);
    protected
      Real q_nom2[3]={q_nom[1]^2,q_nom[2]^2,q_nom[3]^2}
        "Squared nominal flow rates";
      /* Linear system to determine the coefficients:
  W_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  W_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  W_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
      Real c[3]=Modelica.Math.Matrices.solve([ones(3), q_nom, q_nom2], W_nom)
        "Coefficients of quadratic power consumption curve";
    algorithm
      consumption := c[1] + q_flow*c[2] + q_flow^2*c[3];
    end quadraticPower;

    function constantEfficiency "Constant efficiency characteristic"
      extends baseEfficiency;
      input Real eta_nom "Nominal efficiency" annotation(Dialog);
    algorithm
      eta := eta_nom;
    end constantEfficiency;

    function polynomialFlow_rel
      "Polynomial flow characteristic relative to design point"
      extends baseFlow_rel;
      input Real q_nom[:]
        "Non - dimensional volume flow rate for N operating points (single pump)"
                                                                                  annotation(Dialog);
      input Real head_nom[:]
        "Non - dimensional pump head for N operating points"                      annotation(Dialog);
    protected
      parameter Integer N=size(q_nom, 1) "Number of nominal operating points";
      parameter Real q_nom_pow[N, N]={{q_nom[i]^(j - 1) for j in 1:N} for i in
          1:N} "Rows: different operating points; columns: increasing powers";
      /* Linear system to determine the coefficients (example N=3):
  head_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  head_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  head_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
      parameter Real c[N]=Modelica.Math.Matrices.solve(q_nom_pow, head_nom)
        "Coefficients of polynomial head curve";
    algorithm
      // Flow equation (example N=3): head = c[1] + q_flow*c[2] + q_flow^2*c[3];
      // Note: the implementation is numerically efficient only for low values of N
      head := sum(q_flow^(i - 1)*c[i] for i in 1:N);
    end polynomialFlow_rel;

    function polynomialEfficiency_rel
      "Polynomial efficiency characteristic  relative to design point"
      extends baseEfficiency_rel;
      input Real q_nom[:]
        "Non - dimensional volume flow rate for N operating points (single pump)"
                                                                annotation(Dialog);
      input Real eta_nom[:]
        "Non - dimensional pump efficiency for N operating points"                                        annotation(Dialog);
    protected
      parameter Integer N=size(q_nom, 1) "Number of nominal operating points";
      parameter Real q_nom_pow[N, N]={{q_nom[i]^(j - 1) for j in 1:N} for i in
          1:N} "Rows: different operating points; columns: increasing powers";
      /* Linear system to determine the coefficients (example N=3):
  head_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  head_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  head_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
      parameter Real c[N]=Modelica.Math.Matrices.solve(q_nom_pow, eta_nom)
        "Coefficients of polynomial head curve";
    algorithm
      // Flow equation (example N=3): head = c[1] + q_flow*c[2] + q_flow^2*c[3];
      // Note: the implementation is numerically efficient only for low values of N
      eta := sum(q_flow^(i - 1)*c[i] for i in 1:N);
    end polynomialEfficiency_rel;

    partial function baseFlow_rel
      "Base class for pump flow characteristics relative to design point"
      extends Modelica.Icons.Function;
      input Real q_flow "Non - dimensional volumetric flow rate";
      output Real head "Non - dimensional pump head";
    end baseFlow_rel;

    partial function baseEfficiency_rel
      "Base class for efficiency characteristics relative to design point"
      extends Modelica.Icons.Function;
      input Real q_flow "Volumetric flow rate";
      output Real eta "Efficiency";
    end baseEfficiency_rel;
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
      input Real rangeability=20 "Rangeability" annotation(Dialog);
      input Real delta=0.01 "Characteristic is linear for opening < delta" annotation(Dialog);
    algorithm
      rc := if pos > delta then rangeability^(pos - 1) else pos/delta*
        rangeability^(delta - 1);
      annotation (Documentation(info="<html>
This characteristic is such that the relative change of the flow coefficient is proportional to the change in the stem position:
<p> d(rc)/d(pos) = k d(pos).
<p> The constant k is expressed in terms of the rangeability, i.e. the ratio between the maximum and the minimum useful flow coefficient:
<p> rangeability = exp(k) = rc(1.0)/rc(0.0).
<p> The theoretical characteristic has a non-zero opening when pos = 0; the implemented characteristic is modified so that the valve closes linearly when pos &lt; delta.
</html>"));
    end equalPercentage;

    function sinusoidal "Sinusoidal characteristic"
      extends baseFun;
      import Modelica.Constants.pi;
    algorithm
      rc := sin(pos*pi/2);
    end sinusoidal;
  end ValveCharacteristics;

  package FanCharacteristics "Functions for fan characteristics"
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;

    partial function baseFlow "Base class for fan flow characteristics"
      extends Modelica.Icons.Function;
      input VolumeFlowRate q_flow "Volumetric flow rate";
      input Real bladePos=1 "Blade position";
      output SpecificEnergy H "Specific Energy";
    end baseFlow;

    partial function basePower
      "Base class for fan power consumption characteristics"
      extends Modelica.Icons.Function;
      input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
      input Real bladePos=1 "Blade position";
      output Modelica.SIunits.Power consumption "Power consumption";
    end basePower;

    partial function baseEfficiency "Base class for efficiency characteristics"
      extends Modelica.Icons.Function;
      input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
      input Real bladePos=1 "Blade position";
      output Real eta "Efficiency";
    end baseEfficiency;

    function linearFlow "Linear flow characteristic, fixed blades"
      extends baseFlow;
      input Modelica.SIunits.VolumeFlowRate q_nom[2]
        "Volume flow rate for two operating points (single fan)" annotation(Dialog);
      input Modelica.SIunits.Height H_nom[2]
        "Specific energy for two operating points" annotation(Dialog);
      /* Linear system to determine the coefficients:
  H_nom[1] = c[1] + q_nom[1]*c[2];
  H_nom[2] = c[1] + q_nom[2]*c[2];
  */
    protected
      parameter Real c[2]=Modelica.Math.Matrices.solve([ones(2), q_nom], H_nom)
        "Coefficients of linear head curve";
    algorithm
      // Flow equation: head = q*c[1] + c[2];
      H := c[1] + q_flow*c[2];
    end linearFlow;

    function quadraticFlow "Quadratic flow characteristic, fixed blades"
      extends baseFlow;
      input Modelica.SIunits.VolumeFlowRate q_nom[3]
        "Volume flow rate for three operating points (single fan)" annotation(Dialog);
      input Modelica.SIunits.Height H_nom[3]
        "Specific work for three operating points" annotation(Dialog);
    protected
      parameter Real q_nom2[3]={q_nom[1]^2,q_nom[2]^2,q_nom[3]^2}
        "Squared nominal flow rates";
      /* Linear system to determine the coefficients:
  H_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  H_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  H_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
      parameter Real c[3]=Modelica.Math.Matrices.solve([ones(3), q_nom, q_nom2],
          H_nom) "Coefficients of quadratic specific work characteristic";
    algorithm
      // Flow equation: H = c[1] + q_flow*c[2] + q_flow^2*c[3];
      H := c[1] + q_flow*c[2] + q_flow^2*c[3];
    end quadraticFlow;

    function quadraticFlowBlades
      "Quadratic flow characteristic, movable blades"
      extends baseFlow;
      input Real bladePos_nom[:];
      input Modelica.SIunits.VolumeFlowRate q_nom[3, :]
        "Volume flow rate for three operating points at N_pos blade positionings"
                                                                                  annotation(Dialog);
      input Modelica.SIunits.Height H_nom[3, :]
        "Specific work for three operating points at N_pos blade positionings" annotation(Dialog);
      input Real slope_s(
        unit="(J/kg)/(m3/s)",
        max=0) = 0
        "Slope of flow characteristic at stalling conditions (must be negative)"
                                                                                 annotation(Dialog);
    algorithm
      H := Utilities.quadraticFlowBlades(
              q_flow,
              bladePos,
              bladePos_nom,
              Utilities.quadraticFlowBladesCoeff(
                bladePos_nom,
                q_nom,
                H_nom),
              slope_s);
    end quadraticFlowBlades;

    function polynomialFlow "Polynomial flow characteristic, fixed blades"
      extends baseFlow;
      input Modelica.SIunits.VolumeFlowRate q_nom[:]
        "Volume flow rate for N operating points (single fan)" annotation(Dialog);
      input Modelica.SIunits.Height H_nom[:]
        "Specific work for N operating points"                                      annotation(Dialog);
    protected
      parameter Integer N=size(q_nom, 1) "Number of nominal operating points";
      parameter Real q_nom_pow[N, N]={{q_nom[j]^(i - 1) for j in 1:N} for i in
          1:N} "Rows: different operating points; columns: increasing powers";
      /* Linear system to determine the coefficients (example N=3):
  H_nom[1] = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  H_nom[2] = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  H_nom[3] = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
      parameter Real c[N]=Modelica.Math.Matrices.solve(q_nom_pow, H_nom)
        "Coefficients of polynomial specific work curve";
    algorithm
      // Flow equation (example N=3): H = c[1] + q_flow*c[2] + q_flow^2*c[3];
      // Note: the implementation is numerically efficient only for low values of Na
      H := sum(q_flow^(i - 1)*c[i] for i in 1:N);
    end polynomialFlow;

    function constantEfficiency "Constant efficiency characteristic"
      extends baseEfficiency;
      input Real eta_nom "Nominal efficiency" annotation(Dialog);
    algorithm
      eta := eta_nom;
    end constantEfficiency;

    function constantPower "Constant power consumption characteristic"
      extends FanCharacteristics.basePower;
      input Modelica.SIunits.Power power=0 "Constant power consumption" annotation(Dialog);
    algorithm
      consumption := power;
    end constantPower;

    function quadraticPower
      "Quadratic power consumption characteristic, fixed blades"
      extends basePower;
      input Modelica.SIunits.VolumeFlowRate q_nom[3]
        "Volume flow rate for three operating points (single fan)" annotation(Dialog);
      input Modelica.SIunits.Power W_nom[3]
        "Power consumption for three operating points" annotation(Dialog);
    protected
      Real q_nom2[3]={q_nom[1]^2,q_nom[2]^2,q_nom[3]^2}
        "Squared nominal flow rates";
      /* Linear system to determine the coefficients:
  W_nom[1]*g = c[1] + q_nom[1]*c[2] + q_nom[1]^2*c[3];
  W_nom[2]*g = c[1] + q_nom[2]*c[2] + q_nom[2]^2*c[3];
  W_nom[3]*g = c[1] + q_nom[3]*c[2] + q_nom[3]^2*c[3];
  */
      Real c[3]=Modelica.Math.Matrices.solve([ones(3), q_nom, q_nom2], W_nom)
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
        input Real c[:, :]
          "Coefficients of quadratic specific work characteristic";
        input Real slope_s(
          unit="(J/kg)/(m3/s)",
          max=0) = 0
          "Slope of flow characteristic at stalling conditions (must be negative)";
        output SpecificEnergy H "Specific Energy";
      protected
        Integer N_pos=size(bladePos_nom, 1);
        Integer i;
        Real alpha;
        Real q_s "Volume flow rate at stalling conditions";
      algorithm
        // Flow equation: H = c[1] + q_flow*c[2] + q_flow^2*c[3];
        i := N_pos - 1;
        while bladePos <= bladePos_nom[i] and i > 1 loop
          i := i - 1;
        end while;
        alpha := (bladePos - bladePos_nom[i])/(bladePos_nom[i + 1] -
          bladePos_nom[i]);
        q_s := (slope_s - ((1 - alpha)*c[2, i] + alpha*c[2, i + 1]))/(2*((1 -
          alpha)*c[3, i] + alpha*c[3, i + 1]));
        H := if q_flow > q_s then ((1 - alpha)*c[1, i] + alpha*c[1, i + 1]) + (
          (1 - alpha)*c[2, i] + alpha*c[2, i + 1])*q_flow + ((1 - alpha)*c[3, i]
           + alpha*c[3, i + 1])*q_flow^2 else ((1 - alpha)*c[1, i] + alpha*c[1,
          i + 1]) + ((1 - alpha)*c[2, i] + alpha*c[2, i + 1])*q_s + ((1 - alpha)
          *c[3, i] + alpha*c[3, i + 1])*q_s^2 + (q_flow - q_s)*slope_s;
      end quadraticFlowBlades;

      function quadraticFlowBladesCoeff
        extends Modelica.Icons.Function;
        input Real bladePos_nom[:];
        input Modelica.SIunits.VolumeFlowRate q_nom[3, :]
          "Volume flow rate for three operating points at N_pos blade positionings";
        input Modelica.SIunits.Height H_nom[3, :]
          "Specific work for three operating points at N_pos blade positionings";
        output Real c[3, size(bladePos_nom, 1)]
          "Coefficients of quadratic specific work characteristic";
      protected
        Integer N_pos=size(bladePos_nom, 1);
        Real q_nom2[3];
      algorithm
        for j in 1:N_pos loop
          q_nom2 := {q_nom[1, j]^2,q_nom[2, j]^2,q_nom[3, j]^2};
          c[:, j] := Modelica.Math.Matrices.solve([ones(3), q_nom[:, j], q_nom2],
            H_nom[:, j]);
        end for;
      end quadraticFlowBladesCoeff;
    end Utilities;
  end FanCharacteristics;
  annotation (Documentation(info="<HTML>
This package contains general-purpose functions and models
</HTML>"));
end Functions;


package Electrical "Simplified models of electric power components"
  extends Modelica.Icons.Package;
  connector PowerConnection "Electrical power connector"
    flow Power W "Active power";
    Frequency f "Frequency";
    annotation (Icon(graphics={Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,255},
                pattern=LinePattern.None,
                lineThickness=0.5,
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid)}));
  end PowerConnection;

  model Grid "Ideal grid with finite droop"
    parameter Frequency fn=50 "Nominal frequency";
    parameter Power Pn "Nominal power installed on the network";
    parameter Real droop=0.05 "Network droop";
    PowerConnection connection annotation (Placement(transformation(extent={{-100,
              -14},{-72,14}}, rotation=0)));
  equation
    connection.f = fn + droop*fn*connection.W/Pn;
    annotation (Diagram(graphics), Icon(graphics={Line(points={{18,-16},{2,-38}},
            color={0,0,0}),Line(points={{-72,0},{-40,0}}, color={0,0,0}),
            Ellipse(
                extent={{100,-68},{-40,68}},
                lineColor={0,0,0},
                lineThickness=0.5),Line(points={{-40,0},{-6,0},{24,36},{54,50}},
            color={0,0,0}),Line(points={{24,36},{36,-6}}, color={0,0,0}),Line(
            points={{-6,0},{16,-14},{40,-52}}, color={0,0,0}),Line(points={{18,
            -14},{34,-6},{70,-22}}, color={0,0,0}),Line(points={{68,18},{36,-4},
            {36,-4}}, color={0,0,0}),Ellipse(
                extent={{-8,2},{-2,-4}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{20,38},{26,32}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{52,54},{58,48}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{14,-12},{20,-18}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{66,22},{72,16}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{32,-2},{38,-8}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{38,-50},{44,-56}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{66,-18},{72,-24}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{0,-34},{6,-40}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
  end Grid;

  model Generator "Active power generator"
    import Modelica.SIunits.Conversions.NonSIunits.*;
    parameter Real eta=1 "Conversion efficiency";
    parameter Modelica.SIunits.MomentOfInertia J=0 "Moment of inertia";
    parameter Integer Np=2 "Number of electrical poles";
    parameter Modelica.SIunits.Frequency fstart=50
      "Start value of the electrical frequency"
      annotation (Dialog(tab="Initialization"));
    parameter ThermoPower.Choices.Init.Options initOpt=ThermoPower.Choices.Init.Options.noInit
      "Initialization option" annotation (Dialog(tab="Initialization"));
    Modelica.SIunits.Power Pm "Mechanical power";
    Modelica.SIunits.Power Pe "Electrical Power";
    Modelica.SIunits.Power Ploss "Inertial power Loss";
    Modelica.SIunits.Torque tau "Torque at shaft";
    Modelica.SIunits.AngularVelocity omega_m(start=2*Modelica.Constants.pi*
          fstart/Np) "Angular velocity of the shaft";
    Modelica.SIunits.AngularVelocity omega_e
      "Angular velocity of the e.m.f. rotating frame";
    AngularVelocity_rpm n "Rotational speed";
    Modelica.SIunits.Frequency f "Electrical frequency";
    PowerConnection powerConnection annotation (Placement(transformation(extent=
             {{72,-14},{100,14}}, rotation=0)));
    Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft annotation (
        Placement(transformation(extent={{-100,-14},{-72,14}}, rotation=0)));
  equation
    omega_m = der(shaft.phi) "Mechanical boundary condition";
    omega_e = omega_m*Np;
    f = omega_e/(2*Modelica.Constants.pi) "Electrical frequency";
    n = Modelica.SIunits.Conversions.to_rpm(omega_m) "Rotational speed in rpm";
    Pm = omega_m*tau;
    if J > 0 then
      Ploss = J*der(omega_m)*omega_m;
    else
      Ploss = 0;
    end if annotation (Diagram);
    Pm = Pe/eta + Ploss "Energy balance";
    // Boundary conditions
    f = powerConnection.f;
    Pe = -powerConnection.W;
    tau = shaft.tau;
  initial equation
    if initOpt == ThermoPower.Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == ThermoPower.Choices.Init.Options.steadyState then
      der(omega_m) = 0;
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Icon(graphics={Rectangle(
                extent={{-72,6},{-48,-8}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={160,160,164}),Ellipse(
                extent={{50,-50},{-50,50}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{50,0},{72,0}},
            color={0,0,0}),Text(
                extent={{-26,24},{28,-28}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="G")}),
      Documentation(info="<html>
<p>This model describes the conversion between mechanical power and electrical power in an ideal synchronous generator. 
The frequency in the electrical connector is the e.m.f. of generator.
<p>It is possible to consider the generator inertia in the model, by setting the parameter <tt>J > 0</tt>. 
</html>"));
  end Generator;

  model Breaker "Circuit breaker"

    PowerConnection connection1 annotation (Placement(transformation(extent={{-100,
              -14},{-72,14}}, rotation=0)));
    PowerConnection connection2 annotation (Placement(transformation(extent={{
              72,-14},{100,14}}, rotation=0)));
    Modelica.Blocks.Interfaces.BooleanInput closed annotation (Placement(
          transformation(
          origin={0,80},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    connection1.W + connection2.W = 0;
    if closed then
      connection1.f = connection2.f;
    else
      connection1.W = 0;
    end if;
    annotation (
      Diagram(graphics),
      Icon(graphics={Line(points={{-72,0},{-40,0}}, color={0,0,0}),Line(points=
            {{40,0},{72,0}}, color={0,0,0}),Line(
                points={{-40,0},{30,36},{30,34}},
                color={0,0,0},
                thickness=0.5),Ellipse(
                extent={{-42,4},{-34,-4}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{36,4},{44,-4}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{0,60},{0,20}},
            color={255,85,255})}),
      Documentation(info="<html>
Ideal breaker model. Can only be used to connect a generator to a grid with finite droop. Otherwise, please consider the other models in this package.
</html>"));
  end Breaker;

  model Load "Electrical load"
    parameter Power Wn "Nominal active power consumption";
    parameter Frequency fn=50 "Nominal frequency";
    replaceable function powerCurve = Functions.one
      "Normalised power consumption vs. frequency curve";
    PowerConnection connection annotation (Placement(transformation(extent={{-14,
              72},{14,100}}, rotation=0)));
    Power W "Actual power consumption";
    Frequency f "Frequency";
    Modelica.Blocks.Interfaces.RealInput powerConsumption annotation (Placement(
          transformation(
          origin={-33,0},
          extent={{13,12},{-13,-12}},
          rotation=180)));
  equation
    if cardinality(powerConsumption) == 1 then
      W = powerConsumption*powerCurve((f - fn)/fn)
        "Power consumption determined by connector";
    else
      powerConsumption = Wn "Set the connector value (not used)";
      W = Wn*powerCurve((f - fn)/fn)
        "Power consumption determined by parameter";
    end if;
    connection.f = f;
    connection.W = W;
    annotation (
      extent=[-20, 80; 0, 100],
      rotation=-90,
      Icon(graphics={Line(points={{0,40},{0,74}}, color={0,0,0}),Rectangle(
                extent={{-20,40},{20,-40}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{0,-40},{0,-68}},
            color={0,0,0}),Line(points={{16,-68},{-16,-68}}, color={0,0,0}),
            Line(points={{8,-76},{-8,-76}}, color={0,0,0}),Line(points={{-2,-84},
            {4,-84}}, color={0,0,0})}),
      Diagram(graphics),
      Placement(transformation(
          origin={-10,90},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  end Load;

  model PowerSensor "Measures power flow through the component"

    PowerConnection port_a annotation (Placement(transformation(extent={{-110,-10},
              {-90,10}}, rotation=0)));
    PowerConnection port_b annotation (Placement(transformation(extent={{90,-12},
              {110,8}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput W
      "Power flowing from port_a to port_b" annotation (Placement(
          transformation(
          origin={0,-94},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation
    port_a.W + port_b.W = 0;
    port_a.f = port_b.f;
    W = port_a.W;
    annotation (Diagram(graphics), Icon(graphics={Ellipse(
                extent={{-70,70},{70,-70}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{0,70},{0,40}},
            color={0,0,0}),Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),
            Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),Line(points=
             {{37.6,13.7},{65.8,23.9}}, color={0,0,0}),Line(points={{-37.6,13.7},
            {-65.8,23.9}}, color={0,0,0}),Line(points={{0,0},{9.02,28.6}},
            color={0,0,0}),Polygon(
                points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{-5,5},{5,-5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Text(
                extent={{-29,-11},{30,-70}},
                lineColor={0,0,0},
                textString="W"),Line(points={{-70,0},{-90,0}}, color={0,0,0}),
            Line(points={{100,0},{70,0}}, color={0,0,0}),Text(extent={{-148,88},
            {152,128}}, textString="%name"),Line(points={{0,-70},{0,-84}},
            color={0,0,0})}));
  end PowerSensor;

  model FrequencySensor "Measures the frequency at the connector"

    PowerConnection port annotation (Placement(transformation(extent={{-110,-10},
              {-90,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput f "Frequency at the connector"
      annotation (Placement(transformation(extent={{92,-10},{112,10}}, rotation=
             0)));
  equation
    port.W = 0;
    f = port.f;
    annotation (Diagram(graphics), Icon(graphics={Ellipse(
                extent={{-70,70},{70,-70}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{0,70},{0,40}},
            color={0,0,0}),Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),
            Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),Line(points=
             {{37.6,13.7},{65.8,23.9}}, color={0,0,0}),Line(points={{-37.6,13.7},
            {-65.8,23.9}}, color={0,0,0}),Line(points={{0,0},{9.02,28.6}},
            color={0,0,0}),Polygon(
                points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{-5,5},{5,-5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Text(
                extent={{-29,-11},{30,-70}},
                lineColor={0,0,0},
                textString="f"),Line(points={{-70,0},{-90,0}}, color={0,0,0}),
            Line(points={{100,0},{70,0}}, color={0,0,0}),Text(extent={{-148,88},
            {152,128}}, textString="%name")}));
  end FrequencySensor;

  partial model Network1portBase "Base class for one-port network"
    parameter Boolean hasBreaker=false
      "Model includes a breaker controlled by external input";
    parameter Modelica.SIunits.Angle deltaStart=0
      "Start value of the load angle" annotation (Dialog(tab="Initialization"));
    parameter ThermoPower.Choices.Init.Options initOpt=ThermoPower.Choices.Init.Options.noInit
      "Initialization option" annotation (Dialog(tab="Initialization"));
    parameter Modelica.SIunits.Power C "Max. power transfer";
    Modelica.SIunits.Power Pe "Net electrical power";
    Modelica.SIunits.Power Ploss "Electrical power loss";
    Modelica.SIunits.AngularVelocity omega "Angular velocity";
    Modelica.SIunits.AngularVelocity omegaRef "Angular velocity reference";
    Modelica.SIunits.Angle delta(stateSelect=StateSelect.prefer, start=
          deltaStart) "Load angle";

    PowerConnection powerConnection annotation (Placement(transformation(extent=
             {{-114,-14},{-86,14}}, rotation=0)));
    Modelica.Blocks.Interfaces.BooleanInput closed if hasBreaker annotation (
        Placement(transformation(
          origin={0,97},
          extent={{-15,-16},{15,16}},
          rotation=270)));
  protected
    Modelica.Blocks.Interfaces.BooleanInput closedInternal annotation (
        Placement(transformation(
          origin={0,49},
          extent={{-9,-8},{9,8}},
          rotation=270)));
  public
    Modelica.Blocks.Interfaces.RealOutput delta_out annotation (Placement(
          transformation(
          origin={0,-90},
          extent={{-10,-10},{10,10}},
          rotation=270)));
  equation
    // Load angle
    der(delta) = omega - omegaRef;
    // Power flow
    if closedInternal then
      Pe = homotopy(C*Modelica.Math.sin(delta), C*delta);
    else
      Pe = 0;
    end if;
    // Boundary conditions
    Pe + Ploss = powerConnection.W;
    omega = 2*Modelica.Constants.pi*powerConnection.f;
    if not hasBreaker then
      closedInternal = true;
    end if;
    connect(closed, closedInternal);
    //Output signal
    delta_out = delta;
  initial equation
    if initOpt == ThermoPower.Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == ThermoPower.Choices.Init.Options.steadyState then
      der(delta) = 0;
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Diagram(graphics),
      Icon(graphics={Ellipse(
                extent={{-80,80},{80,-80}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>Basic interface of the Network models with one electrical port for the connection to the generator, containing the common parameters, variables and connectors.</p>
<p><b>Modelling options</b>
<p>The net electrical power is defined by the following relationship:
<ul><tt>Pe = C*sin(delta)</tt></ul> 
<p><tt>delta</tt> is the load angle, defined by the following relationship:
<ul><tt>der(delta) = omega - omegaRef</tt></ul>
<p>where <tt>omega</tt> is related to the frequency on the power connector (generator frequency), and <tt>omegaRef</tt> is the reference angular velocity of the network embedded in the model.
<p>The electrical power losses are described by the variable <tt>Ploss</tt>.
<p>If <tt>hasBreaker</tt> is true, the model provides a circuit breaker, controlled by the boolean input signal, to describe the connection/disconnection of the electrical port from the grid; otherwise it is assumed that the electrical port is always connected to the grid. 
</html>", revisions="<html>
<ul>
<li><i>15 Jul 2008</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a> and <a> Luca Savoldelli </a>:<br>
       First release.</li>
</ul>
</html>"));
  end Network1portBase;

  model NetworkGrid_eX
    extends ThermoPower.Electrical.Network1portBase(final C=e*v/(X + Xline));
    parameter Modelica.SIunits.Voltage e "e.m.f voltage"
      annotation (Dialog(group="Generator"));
    parameter Modelica.SIunits.Voltage v "Network voltage";
    parameter Modelica.SIunits.Frequency fnom=50 "Nominal frequency of network";
    parameter Modelica.SIunits.Reactance X "Internal reactance"
      annotation (Dialog(group="Generator"));
    parameter Modelica.SIunits.Reactance Xline "Line reactance";
    parameter Modelica.SIunits.MomentOfInertia J=0
      "Moment of inertia of the generator/shaft system (for damping term calculation only)"
      annotation (Dialog(group="Generator"));
    parameter Real r=0.2 "Damping coefficient of the swing equation"
      annotation (dialog(enable=if J > 0 then true else false, group=
            "Generator"));
    parameter Integer Np=2 "Number of electrical poles" annotation (dialog(
          enable=if J > 0 then true else false, group="Generator"));
    Real D "Electrical damping coefficient";
  equation
    // Definition of the reference angular velocity
    omegaRef = 2*Modelica.Constants.pi*fnom;
    // Damping power loss
    if J > 0 then
      D = 2*r*sqrt(C*J*(2*Modelica.Constants.pi*fnom*Np)/(Np^2));
    else
      D = 0;
    end if;
    if closedInternal then
      Ploss = D*der(delta);
    else
      Ploss = 0;
    end if;
    annotation (Icon(graphics={Line(
                points={{40,40},{40,-40}},
                color={0,0,0},
                thickness=0.5),Line(points={{-56,0},{-98,0}}, color={0,0,0}),
            Line(points={{-34,0},{-16,0},{12,16}}, color={0,0,0}),Line(points={
            {14,0},{40,0}}, color={0,0,0}),Rectangle(
                extent={{-60,6},{-34,-6}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>This model extends <tt>Network1portBase</tt> partial model, by defining the power coefficient <tt>C</tt> in terms of <tt>e</tt>, <tt>v</tt>, <tt>X</tt>, and <tt>Xline</tt>.
<p>The power losses are represented by a linear dissipative term. It is possible to directly set the damping coefficient <tt>r</tt> of the generator/shaft system. 
If <tt>J</tt> is zero, zero damping is assumed by default. Note that <tt>J</tt> is only used to compute the dissipative term and should refer to the total inertia of the generator-shaft system; the network model does not add any inertial effects.
</html>", revisions="<html>
<ul>
<li><i>15 Jul 2008</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a> and <a> Luca Savoldelli </a>:<br>
       First release.</li>
</ul>
</html>"));
  end NetworkGrid_eX;

  model NetworkGrid_Pmax
    extends ThermoPower.Electrical.Network1portBase(final C=Pmax);
    parameter Modelica.SIunits.Power Pmax "Maximum power transfer";
    parameter Modelica.SIunits.Frequency fnom=50 "Nominal frequency of network";
    parameter Modelica.SIunits.MomentOfInertia J=0
      "Moment of inertia of the generator/shaft system (for damping term calculation)"
      annotation (Dialog(group="Generator"));
    parameter Real r=0.2 "Electrical damping of generator/shaft system"
      annotation (dialog(enable=if J > 0 then true else false, group=
            "Generator"));
    parameter Integer Np=2 "Number of electrical poles" annotation (dialog(
          enable=if J > 0 then true else false, group="Generator"));
    Real D "Electrical damping coefficient";
  equation
    // Definition of the reference
    omegaRef = 2*Modelica.Constants.pi*fnom;
    // Definition of damping power loss
    if J > 0 then
      D = 2*r*sqrt(C*J*(2*Modelica.Constants.pi*fnom*Np)/(Np^2));
    else
      D = 0;
    end if;
    if closedInternal then
      Ploss = D*der(delta);
    else
      Ploss = 0;
    end if;
    annotation (Icon(graphics={Rectangle(
                extent={{-54,6},{-28,-6}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{-54,0},{-92,0}},
            color={0,0,0}),Line(points={{-28,0},{-10,0},{18,16}}, color={0,0,0}),
            Line(points={{20,0},{46,0}}, color={0,0,0}),Line(
                points={{46,40},{46,-40}},
                color={0,0,0},
                thickness=0.5)}), Documentation(info="<html>
<p>This model extends <tt>Network1portBase</tt> partial model, by directly defining the maximum power that can be transferred between the electrical port and the grid <tt>Pmax</tt>.
<p>The power losses are represented by a linear dissipative term. It is possible to directly set the damping coefficient <tt>r</tt> of the generator/shaft system. 
If <tt>J</tt> is zero, zero damping is assumed. Note that <tt>J</tt> is only used to compute the dissipative term and should refer to the total inertia of the generator-shaft system; the network model does not add any inertial effects.
</html>", revisions="<html>
<ul>
<li><i>15 Jul 2008</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a> and <a> Luca Savoldelli </a>:<br>
       First release.</li>
</ul>
</html>"));
  end NetworkGrid_Pmax;

  partial model Network2portBase "Base class for network with two port"
    parameter ThermoPower.Choices.Init.Options initOpt=ThermoPower.Choices.Init.Options.noInit
      "Initialization option" annotation (Dialog(tab="Initialization"));
    parameter Modelica.SIunits.Power C_ab "Coefficient of Pe_ab";
    Modelica.SIunits.Power Pe_ab "Exchanged electrical power from A to B";
    Modelica.SIunits.Power Pe_a "Net electrical power side A";
    Modelica.SIunits.Power Pe_b "Net electrical power side B";
    Modelica.SIunits.Power Ploss_a "Electrical power loss side A";
    Modelica.SIunits.Power Ploss_b "Electrical power loss side B";
    Modelica.SIunits.AngularVelocity omega_a "Angular velocity A";
    Modelica.SIunits.AngularVelocity omega_b "Angular velocity B";
    Modelica.SIunits.Angle delta_a "Phase A";
    Modelica.SIunits.Angle delta_b "Phase B";
    Modelica.SIunits.Angle delta_ab(stateSelect=StateSelect.prefer, start=
          deltaStart) "Load angle between A and B";

  protected
    parameter Real deltaStart=0;
  public
    PowerConnection powerConnection_a "A" annotation (Placement(transformation(
            extent={{-114,-14},{-86,14}}, rotation=0)));
    PowerConnection powerConnection_b "B" annotation (Placement(transformation(
            extent={{86,-14},{114,14}}, rotation=0)));
  protected
    Modelica.Blocks.Interfaces.BooleanInput closedInternal_gen_a annotation (
        Placement(transformation(
          origin={-40,29},
          extent={{-9,-8},{9,8}},
          rotation=270)));
    Modelica.Blocks.Interfaces.BooleanInput closedInternal_gen_b annotation (
        Placement(transformation(
          origin={40,29},
          extent={{-9,-8},{9,8}},
          rotation=270)));
  equation
    // Definition of load angles
    der(delta_a) = omega_a;
    der(delta_b) = omega_b;
    delta_ab = delta_a - delta_b;
    // Definition of power flow
    if closedInternal_gen_a and closedInternal_gen_b then
      Pe_ab = homotopy(C_ab*Modelica.Math.sin(delta_ab), C_ab*delta_ab);
    else
      Pe_ab = 0;
    end if;
    // Boundary conditions
    Pe_a + Ploss_a = powerConnection_a.W;
    Pe_b + Ploss_b = powerConnection_b.W;
    omega_a = 2*Modelica.Constants.pi*powerConnection_a.f;
    omega_b = 2*Modelica.Constants.pi*powerConnection_b.f;
  initial equation
    if initOpt == ThermoPower.Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == ThermoPower.Choices.Init.Options.steadyState then
      der(delta_ab) = 0;
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Diagram(graphics),
      Icon(graphics={Ellipse(
                extent={{-80,80},{80,-80}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>Basic interface of the Network models with two electrical ports, containing the common parameters, variables and connectors.</p>
<p><b>Modelling options</b>
<p>The flow of electrical power from side A to side B is defined by the following relationship:
<ul><tt>Pe_ab = C*sin(delta_ab)</tt></ul> 
<p>where
<ul><tt>delta_ab = delta_a - delta_b</tt></ul>
<p>is the relative load angle.</p>
<p><tt>delta_a</tt> and <tt>delta_b</tt> are the phases of the rotating frames in the corresponding ports.
<p>The electrical power loss on each side are described by the variables <tt>Ploss_a</tt> and <tt>Ploss_b</tt>.
</html>", revisions="<html>
<ul>
<li><i>15 Jul 2008</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a> and <a> Luca Savoldelli </a>:<br>
       First release.</li>
</ul>
</html>"));
  end Network2portBase;

  model NetworkTwoGenerators_eX
    "Connection: generator(a) - generator(b); Parameters: voltages and reactances"
    extends ThermoPower.Electrical.Network2portBase(deltaStart=deltaStart_ab,
        final C_ab=e_a*e_b/(X_a + X_b + Xline));
    parameter Boolean hasBreaker=false
      "Model includes a breaker controlled by external input";
    parameter Modelica.SIunits.Voltage e_a "e.m.f voltage (generator A)"
      annotation (Dialog(group="Generator side A"));
    parameter Modelica.SIunits.Voltage e_b "e.m.f voltage (generator B)"
      annotation (Dialog(group="Generator side B"));
    parameter Modelica.SIunits.Reactance X_a "Internal reactance (generator A)"
      annotation (Dialog(group="Generator side A"));
    parameter Modelica.SIunits.Reactance X_b "Internal reactance (generator B)"
      annotation (Dialog(group="Generator side B"));
    parameter Modelica.SIunits.Reactance Xline "Line reactance";
    parameter Modelica.SIunits.MomentOfInertia J_a=0
      "Moment of inertia of the generator/shaft system A (for damping term calculation only)"
      annotation (Dialog(group="Generator side A"));
    parameter Real r_a=0.2
      "Electrical damping of generator/shaft system (generator A)" annotation (
        dialog(enable=if J_a > 0 then true else false, group="Generator side A"));
    parameter Integer Np_a=2 "Number of electrical poles (generator A)"
      annotation (dialog(enable=if J_a > 0 then true else false, group=
            "Generator side A"));
    parameter Modelica.SIunits.MomentOfInertia J_b=0
      "Moment of inertia of the generator/shaft system B (for damping term calculation only)"
      annotation (Dialog(group="Generator side B"));
    parameter Real r_b=0.2
      "Electrical damping of generator/shaft system (generator B)" annotation (
        dialog(enable=if J_b > 0 then true else false, group="Generator side B"));
    parameter Integer Np_b=2 "Number of electrical poles (generator B)"
      annotation (dialog(enable=if J_b > 0 then true else false, group=
            "Generator side B"));
    parameter Modelica.SIunits.Frequency fnom=50
      "Nominal frequency of the network";
    parameter Modelica.SIunits.Angle deltaStart_ab=0
      "Start value of the load angle between side A and side B"
      annotation (Dialog(tab="Initialization"));
    Real D_a "Electrical damping coefficient side A";
    Real D_b "Electrical damping coefficient side B";
    Modelica.Blocks.Interfaces.BooleanInput closed if hasBreaker annotation (
        Placement(transformation(
          origin={0,97},
          extent={{-15,-16},{15,16}},
          rotation=270)));
  equation
    // Breaker and its connections (unique breaker => closedInternal_gen_a = closedInternal_gen_b)
    if not hasBreaker then
      closedInternal_gen_a = true;
      closedInternal_gen_b = true;
    end if;
    connect(closed, closedInternal_gen_a);
    connect(closed, closedInternal_gen_b);

    // Definitions of net powers
    Pe_a = Pe_ab;
    Pe_a = -Pe_b;
    // Definitions of damping power losses
    if J_a > 0 then
      D_a = 2*r_a*sqrt(C_ab*J_a*(2*Modelica.Constants.pi*fnom*Np_a)/(Np_a^2));
    else
      D_a = 0;
    end if;
    if J_b > 0 then
      D_b = 2*r_b*sqrt(C_ab*J_b*(2*Modelica.Constants.pi*fnom*Np_b)/(Np_b^2));
    else
      D_b = 0;
    end if;
    if closedInternal_gen_a then
      Ploss_a = D_a*der(delta_ab);
      Ploss_b = -D_b*der(delta_ab);
    else
      Ploss_a = 0;
      Ploss_b = 0;
    end if;
    annotation (Documentation(info="<html>
<p>Simplified model of connection between two generators based on the swing equation. It completes <tt>Netowrk2portBase</tt> partial model, by defining the power coefficient <tt>C</tt> in terms of the parameters <tt>e_a</tt>, <tt>e_b</tt>, <tt>X_a</tt>, <tt>X_b</tt> and <tt>Xline</tt>.
<p>The net electrical powers of two port coincides with the power <tt>P_ab</tt>.
<p>The power losses are represented by a linear dissipative term. It is possible to directly set the damping coefficient <tt>r</tt> of the generator/shaft system. 
If <tt>J_a</tt> or <tt>J_b</tt> are zero, zero damping is assumed. Note that <tt>J_a</tt> and <tt>J_b</tt> are only used to compute the dissipative term and should each refer to the total inertia of the generator-shaft system; the network model does not add any inertial effects.
</html>", revisions="<html>
<ul>
<li><i>15 Jul 2008</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a> and <a> Luca Savoldelli </a>:<br>
       First release.</li>
</ul>
</html>"), Icon(graphics={Line(points={{-54,0},{-94,0}}, color={0,0,0}),Line(
            points={{62,0},{98,0}}, color={0,0,0}),Line(points={{-34,0},{-14,0},
            {12,18}}, color={0,0,0}),Line(points={{14,0},{38,0}}, color={0,0,0}),
            Rectangle(
                extent={{-58,6},{-34,-6}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{38,6},{62,-6}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
  end NetworkTwoGenerators_eX;

  model NetworkTwoGenerators_Pmax
    "Connection: generator(a) - generator(b); Parameters: maximum power"
    extends ThermoPower.Electrical.Network2portBase(deltaStart=deltaStart_ab,
        final C_ab=Pmax);
    parameter Boolean hasBreaker=false;
    parameter Modelica.SIunits.Power Pmax "Maximum power transfer";
    parameter Modelica.SIunits.MomentOfInertia J_a=0
      "Moment of inertia of the generator/shaft system A (for damping term calculation only)"
      annotation (Dialog(group="Generator side A"));
    parameter Real r_a=0.2
      "Electrical damping of generator/shaft system (generator A)" annotation (
        dialog(enable=if J_a > 0 then true else false, group="Generator side A"));
    parameter Integer Np_a=2 "Number of electrical poles (generator A)"
      annotation (dialog(enable=if J_a > 0 then true else false, group=
            "Generator side A"));
    parameter Modelica.SIunits.MomentOfInertia J_b=0
      "Moment of inertia of the generator/shaft system B (for damping term calculation only)"
      annotation (Dialog(group="Generator side B"));
    parameter Real r_b=0.2
      "Electrical damping of generator/shaft system (generator B)" annotation (
        dialog(enable=if J_b > 0 then true else false, group="Generator side B"));
    parameter Integer Np_b=2 "Number of electrical poles (generator B)"
      annotation (dialog(enable=if J_b > 0 then true else false, group=
            "Generator side B"));
    parameter Modelica.SIunits.Frequency fnom=50
      "Nominal frequency of the network";
    parameter Modelica.SIunits.Angle deltaStart_ab=0
      "Start value of the load angle between side A and side B"
      annotation (Dialog(tab="Initialization"));
    Real D_a "Electrical damping coefficient side A";
    Real D_b "Electrical damping coefficient side B";
    Modelica.Blocks.Interfaces.BooleanInput closed if hasBreaker annotation (
        Placement(transformation(
          origin={0,97},
          extent={{-15,-16},{15,16}},
          rotation=270)));
  equation
    // Breaker and its connections (unique breaker => closedInternal_gen_a = closedInternal_gen_b)
    if not hasBreaker then
      closedInternal_gen_a = true;
      closedInternal_gen_b = true;
    end if;
    connect(closed, closedInternal_gen_a);
    connect(closed, closedInternal_gen_b);

    // Definition of net powers
    Pe_a = Pe_ab;
    Pe_a = -Pe_b;
    // Definition of damping power losses
    if J_a > 0 then
      D_a = 2*r_a*sqrt(C_ab*J_a*(2*Modelica.Constants.pi*fnom*Np_a)/(Np_a^2));
    else
      D_a = 0;
    end if;
    if J_b > 0 then
      D_b = 2*r_b*sqrt(C_ab*J_b*(2*Modelica.Constants.pi*fnom*Np_b)/(Np_b^2));
    else
      D_b = 0;
    end if;
    if closedInternal_gen_a then
      Ploss_a = D_a*der(delta_ab);
      Ploss_b = -D_b*der(delta_ab);
    else
      Ploss_a = 0;
      Ploss_b = 0;
    end if;
    annotation (Documentation(info="<html>
<p>Simplified model of connection between two generators based on swing equation. It completes <tt>Netowrk2portBase</tt> partial model, defining the coefficient of the exchanged clean electrical power and the damping power losses.
<p>The power coefficient is given by directly defining the maximum power that can be transferred between the electrical port and the grid <tt>Pmax</tt>.
<p>The net electrical powers of two port coincide with the power <tt>P_ab</tt>.
<p>The power losses are represented by a linear dissipative term. It is possible to directly set the damping coefficient <tt>r</tt> of the generator/shaft system. 
If <tt>J_a</tt> or <tt>J_b</tt> are zero, zero damping is assumed. Note that <tt>J_a</tt> and <tt>J_b</tt> are only used to compute the dissipative term and should each refer to the total inertia of the generator-shaft system; the network model does not add any inertial effects.
</html>", revisions="<html>
<ul>
<li><i>15 Jul 2008</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a> and <a> Luca Savoldelli </a>:<br>
       First release.</li>
</ul>
</html>"), Icon(graphics={Line(points={{-54,0},{-94,0}}, color={0,0,0}),Line(
            points={{56,0},{92,0}}, color={0,0,0}),Line(points={{-34,0},{-14,0},
            {12,18}}, color={0,0,0}),Line(points={{14,0},{38,0}}, color={0,0,0}),
            Rectangle(
                extent={{-58,6},{-34,-6}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{38,6},{62,-6}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid)}));
  end NetworkTwoGenerators_Pmax;

  model NetworkGridTwoGenerators "Base class for network with two port"
    extends ThermoPower.Electrical.Network2portBase(final C_ab=e_a*e_b/(X_a +
          X_b));
    parameter Boolean hasBreaker=false
      "Model includes a breaker controlled by external input";
    parameter Modelica.SIunits.Voltage v "Network connection frame";
    parameter Modelica.SIunits.Voltage e_a "e.m.f voltage (generator A)"
      annotation (Dialog(group="Generator side A"));
    parameter Modelica.SIunits.Voltage e_b "e.m.f voltage (generator B)"
      annotation (Dialog(group="Generator side B"));
    parameter Modelica.SIunits.Reactance X_a "Internal reactance (generator A)"
      annotation (Dialog(group="Generator side A"));
    parameter Modelica.SIunits.Reactance X_b "Internal reactance (generator B)"
      annotation (Dialog(group="Generator side B"));
    parameter Modelica.SIunits.Reactance Xline "Line reactance";
    parameter Modelica.SIunits.MomentOfInertia J_a=0
      "Moment of inertia of the generator/shaft system A (for damping term calculation only)"
      annotation (Dialog(group="Generator side A"));
    parameter Real r_a=0.2
      "Electrical damping of generator/shaft system (generator A)" annotation (
        dialog(enable=if J_a > 0 then true else false, group="Generator side A"));
    parameter Integer Np_a=2 "Number of electrical poles (generator A)"
      annotation (dialog(enable=if J_a > 0 then true else false, group=
            "Generator side A"));
    parameter Modelica.SIunits.MomentOfInertia J_b=0
      "Moment of inertia of the generator/shaft system B (for damping term calculation only)"
      annotation (Dialog(group="Generator side B"));
    parameter Real r_b=0.2
      "Electrical damping of generator/shaft system (generator B)" annotation (
        dialog(enable=if J_b > 0 then true else false, group="Generator side B"));
    parameter Integer Np_b=2 "Number of electrical poles (generator B)"
      annotation (dialog(enable=if J_b > 0 then true else false, group=
            "Generator side B"));
    parameter Modelica.SIunits.Frequency fnom=50 "Frequency of the network";
    Real D_a "Electrical damping coefficient side A";
    Real D_b "Electrical damping coefficient side B";
    Modelica.SIunits.Power Pe_g "Electrical Power provided to the grid";
    Modelica.SIunits.Power Pe_ag
      "Power transferred from generator A to the grid";
    Modelica.SIunits.Power Pe_bg
      "Power transferred from generator B to the grid";
    final parameter Modelica.SIunits.Power C_ag=e_a*v/(X_a + Xline)
      "Coefficient of Pe_ag";
    final parameter Modelica.SIunits.Power C_bg=e_b*v/(X_b + Xline)
      "Coefficient of Pe_bg";
    Modelica.SIunits.AngularVelocity omegaRef "Angular velocity reference";
    Modelica.SIunits.Angle delta_ag(stateSelect=StateSelect.prefer)
      "Load angle between generator side A and the grid";
    Modelica.SIunits.Angle delta_bg
      "Load angle between generator side B and the grid";
    Modelica.SIunits.Angle delta_g "Grid phase";
    Modelica.Blocks.Interfaces.BooleanInput closed_gen_a if hasBreaker
      annotation (Placement(transformation(
          origin={-68,59},
          extent={{-15,-16},{15,16}},
          rotation=270)));
    Modelica.Blocks.Interfaces.BooleanInput closed_gen_b if hasBreaker
      annotation (Placement(transformation(
          origin={68,59},
          extent={{-15,-16},{15,16}},
          rotation=270)));
    Modelica.Blocks.Interfaces.BooleanInput closed_grid if hasBreaker
      annotation (Placement(transformation(
          origin={0,97},
          extent={{-15,-16},{15,16}},
          rotation=270)));
  protected
    Modelica.Blocks.Interfaces.BooleanInput closedInternal_grid annotation (
        Placement(transformation(
          origin={0,49},
          extent={{-9,-8},{9,8}},
          rotation=270)));
  equation
    // Load angles
    omegaRef = 2*Modelica.Constants.pi*fnom;
    der(delta_g) = omegaRef;
    delta_ag = delta_a - delta_g;
    delta_bg = delta_b - delta_g;
    // Breakers and their connections
    if not hasBreaker then
      closedInternal_gen_a = true;
      closedInternal_gen_b = true;
      closedInternal_grid = true;
    end if;
    connect(closed_gen_a, closedInternal_gen_a);
    connect(closed_gen_b, closedInternal_gen_b);
    connect(closed_grid, closedInternal_grid);
    // Coefficients of exchanged powers (power = zero if open breaker)
    if closedInternal_gen_a and closedInternal_grid then
      Pe_ag = homotopy(C_ag*Modelica.Math.sin(delta_ag), C_ag*delta_ag);
    else
      Pe_ag = 0;
    end if;
    if closedInternal_gen_b and closedInternal_grid then
      Pe_bg = homotopy(C_bg*Modelica.Math.sin(delta_bg), C_bg*delta_bg);
    else
      Pe_bg = 0;
    end if;
    if closedInternal_gen_a then
      Ploss_a = D_a*der(delta_ag);
    else
      Ploss_a = 0;
    end if;
    if closedInternal_gen_b then
      Ploss_b = D_b*der(delta_bg);
    else
      Ploss_b = 0;
    end if;
    // Net and exchanged powers
    Pe_a = Pe_ab + Pe_ag;
    Pe_b = -Pe_ab + Pe_bg;
    Pe_g = Pe_ag + Pe_bg;
    // Damping power losses
    if J_a > 0 then
      D_a = 2*r_a*sqrt(C_ab*J_a*(2*Modelica.Constants.pi*fnom*Np_a)/(Np_a^2));
    else
      D_a = 0;
    end if;
    if J_b > 0 then
      D_b = 2*r_b*sqrt(C_ab*J_b*(2*Modelica.Constants.pi*fnom*Np_b)/(Np_b^2));
    else
      D_b = 0;
    end if;
  initial equation
    if initOpt == Choices.Init.Options.noInit then
      // do nothing
    elseif initOpt == Choices.Init.Options.steadyState then
      der(delta_ag) = 0;
    else
      assert(false, "Unsupported initialisation option");
    end if;
    annotation (
      Diagram(graphics),
      Icon(graphics={Line(points={{32,0},{98,0}}, color={0,0,0}),Line(points={{
            -40,0},{-32,0},{-16,8}}, color={0,0,0}),Line(points={{-16,0},{16,0}},
            color={0,0,0}),Line(points={{0,2},{0,12},{8,24}}, color={0,0,0}),
            Line(
                points={{-30,64},{30,64}},
                color={0,0,0},
                thickness=0.5),Line(points={{0,64},{0,26}}, color={0,0,0}),
            Rectangle(
                extent={{-4,54},{4,36}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Ellipse(
                extent={{-4,4},{4,-4}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(points={{-36,0},{-102,0}},
            color={0,0,0}),Rectangle(
                extent={{-66,4},{-48,-4}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Rectangle(
                extent={{48,4},{66,-4}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),Line(points={{8,0},{16,0},{32,8}},
            color={0,0,0})}),
      Documentation(info="<html>
<p>Simplified model of connection between two generators and the grid.
<p>This model adds to <tt>Netowrk2portBase</tt> partial model, in more in comparison to the concepts expressed by the <tt>NetowrkTwoGenerators_eX</tt> model, two further electrical flows: from port_a to grid and from port_b to grid, so that to describe the interactions between two ports and the grid.
<p>The clean electrical powers of two ports are defined by opportune combinations of the power flows introduced.
<p>The power losses are represented by a linear dissipative term. It is possible to directly set the damping coefficient <tt>r</tt> of the generator/shaft system. 
If <tt>J_a</tt> or <tt>J_b</tt> are zero, zero damping is assumed. Note that <tt>J_a</tt> and <tt>J_b</tt> are only used to compute the dissipative term and should each refer to the total inertia of the generator-shaft system; the network model does not add any inertial effects.
</html>", revisions="<html>
<ul>
<li><i>15 Jul 2008</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a> and <a> Luca Savoldelli </a>:<br>
       First release.</li>
</ul>
</html>"));
  end NetworkGridTwoGenerators;
  annotation (Documentation(info="<html>
<p>This package allows to describe the flow of active power between a synchronous generator and a grid, through simplified power transmission line models, assuming ideal voltage control. </p>
<p>These models are meant to be used as simplified boundary conditions for a thermal power plant model, rather than for fully modular description of three-phase networks. Specialized libraries should be used for this purpose; bear in mind, however, that full three-phase models of electrical machinery and power lines could make the power plant simulation substantially heavier, if special numeric integration strategies are not adopted.
</html>"));
end Electrical;


type HydraulicConductance = Real (final quantity="HydraulicConductance", final
      unit="(kg/s)/Pa");


type HydraulicResistance = Real (final quantity="HydraulicResistance", final
      unit="Pa/(kg/s)");


type PerUnit = Real (final quantity="PerUnit", final unit="1");


type Density = Modelica.SIunits.Density (start=40) "generic start value";


type LiquidDensity = Density (start=1000) "start value for liquids";


type GasDensity = Density (start=5) "start value for gases/vapours";


type AbsoluteTemperature = Temperature (start=300, nominal=500)
  "generic temperature";


type AbsolutePressure = Pressure (start=1e5) "generic pressure";


annotation (
  Documentation(info="<html>
<b>General Information</b>
<p>The ThermoPower library is an open-source <a href=\"http://www.modelica.org/libraries\">Modelica library</a>for the dynamic modelling of thermal power plants and energy conversion systems. It provides basic components for system-level modelling, in particular for the study of control systems in traditional and innovative power plants and energy conversion systems.</p>
<p>The library is hosted by <a href=\"http://sourceforge.net/projects/thermopower/\">sourceforge.net</a> and has been under continuous development at Politecnico di Milano since 2002. It has been applied to the dynamic modelling of steam generators, combined-cycle power plants, III- and IV-generation nuclear power plants, direct steam generation solar plants, organic Rankine cycle plants, and cryogenic circuits for nuclear fusion applications. The main author is Francesco Casella, with contributions from Alberto Leva, Matilde Ratti, Luca Savoldelli, Roberto Bonifetto, Stefano Boni, and many others. The library is licensed under the <b><a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">Modelica License 2</a></b>. The library has been developed as a tool for research in the field of energy system control at the Dipartimento di Elettronica, Informazione e Bioingegneria of Politecnico di Milano and progressively enhanced as new projects were undertaken there. It has been released as open source for the benefit of the community, but without any guarantee of support or completeness of documentation.</p>
<p>The latest official release of the library is ThermoPower 2.1, which is compatible with Modelica 2.2 and Modelica Standard Library 2.2.x. This release is now quite old. From 2009 to 2012, the development of the library focused on: </p>
<ul>
<li>Conversion to Modelica 3.x (new graphical annotations, use of enumerations) </li>
<li>Use of stream connectors, compatible with the Modelica.Fluid library, allowing multiple-way connections (see <a href=\"http://dx.doi.org/10.3384/ecp09430078\">paper</a>) </li>
<li>Use of the homotopy operator for improved initialization (see <a href=\"https://www.modelica.org/events/modelica2011/Proceedings/pages/papers/04_2_ID_131_a_fv.pdf\">paper</a>) </li>
<li>Bugfixing</li>
</ul>
<p>Until 2012, the library was developed using the tool <a href=\"http://www.3ds.com/products/catia/portfolio/dymola\">Dymola</a>, and could only be used within that tool, due to limitations of other Modelica tools available at the time. An official version was never released during that period, because we kept on experimenting new features, some of them experimental (e.g., homotopy-based initialization), so the library never reached a stable state. The plan is to release a revision 3.0, which will run in Dymola, and will incorporate all these changes. In the meantime, you can obtain this version of the library by anonymous SVN checkout from this URL:<br><br><a href=\"svn://svn.code.sf.net/p/thermopower/svn/branches/release.3.0\">svn://svn.code.sf.net/p/thermopower/svn/branches/release.3.0</a><br><br>
If you are running Windows, we recommend using the excellent <a href=\"http://tortoisesvn.net/\">TortoiseSVN</a> client to checkout the library.</p>
<p>Since 2013, the development started focusing on three main lines. 
<ol>
<li>We are working towards making the library fully compliant to Modelica 3.2rev2 and to the Modelica Standard Library 3.2.1, in order to be usable with other Modelica tools. The library is currently being tested with OpenModelica, and is expected to run satisfactorily in that tool within the year 2013. </li>
<li>The second development line is to improve the structure of the Flow1D models, for greater flexibility and ease of use. In particular, we are changing the design of the distributed heat ports, which had several shortcomings in the original design, and adding replaceable models for the heat transfer and friction models. The new Flow1D models will be incompatible with the old ones, which will be kept (but deprecated) for backwards compatibility. </li>
<li>The last development is to change the way initial conditions are specified. The current design relies on initial equations being automatically generated by the tool, based on start attributes, which has several problems if you want to use the library with different Modelica tools and get the same results everywhere. Doing this right might eventually lead to a library which is not backwards-compatible with earlier versions.</li>
</ol></p>
<p>Eventually, these improvements will be incorporated in the 3.1 release. You can have a look at the work in progress by anonymous SVN checkout from this URL:<br><br><a href=\"svn://svn.code.sf.net/p/thermopower/svn/trunk\">svn://svn.code.sf.net/p/thermopower/svn/trunk</a></p>
<p>To give you an idea on the structure and content of the library, the automatically generated&nbsp;documentation of the 2.1 release can be browsed on-line <a href=\"http://thermopower.sourceforge.net/help/ThermoPower.html\">here</a>.</p>
<p>If you want to get involved in the development, or you need some information, please contact the main developer <a href=\"mailto://francesco.casella@polimi.it\">francesco.casella@polimi.it</a>.</p>
<p><b>References</b></p>
<p>A general description of the library and on the modelling principles can be found in the papers: </p>
<p><ul>
<li>F. Casella, A. Leva, &QUOT;Modelling of distributed thermo-hydraulic processes using Modelica&QUOT;, <i>Proceedings of the MathMod &apos;03 Conference</i>, Wien , Austria, February 2003. </li>
<li>F. Casella, A. Leva, &QUOT;Modelica open library for power plant simulation: design and experimental validation&QUOT;, <i>Proceedings of the 2003 Modelica Conference</i>, Link&ouml;ping, Sweden, November 2003, pp. 41-50. (<a href=\"http://www.modelica.org/Conference2003/papers/h08_Leva.pdf\">Available online</a>) </li>
<li>F. Casella, A. Leva, &QUOT;Simulazione di impianti termoidraulici con strumenti object-oriented&QUOT;, <i>Atti convegno ANIPLA Enersis 2004,</i> Milano, Italy, April 2004 (in Italian). </li>
<li>F. Casella, A. Leva, &QUOT;Object-oriented library for thermal power plant simulation&QUOT;, <i>Proceedings of the Eurosis Industrial Simulation Conference 2004 (ISC-2004)</i>, Malaga, Spain, June 2004. </li>
<li>F. Casella, A. Leva, &QUOT;Simulazione object-oriented di impianti di generazione termoidraulici per studi di sistema&QUOT;, <i>Atti convegno nazionale ANIPLA 2004</i>, Milano, Italy, September 2004 (in Italian).</li>
<li>Francesco Casella and Alberto Leva, &ldquo;Modelling of Thermo-Hydraulic Power Generation Processes Using Modelica&rdquo;. <i>Mathematical and Computer Modeling of Dynamical Systems</i>, vol. 12, n. 1, pp. 19-33, Feb. 2006. <a href=\"http://dx.doi.org/10.1080/13873950500071082\">Online</a>. </li>
<li>Francesco Casella, J. G. van Putten and Piero Colonna, &ldquo;Dynamic Simulation of a Biomass-Fired Power Plant: a Comparison Between Causal and A-Causal Modular Modeling&rdquo;. In <i>Proceedings of 2007 ASME International Mechanical Engineering Congress and Exposition</i>, Seattle, Washington, USA, Nov. 11-15, 2007, paper IMECE2007-41091 (Best paper award). </li>
</ul></p>
<p><br/>Other papers about the library and its applications:</p>
<p><ul>
<li>F. Casella, F. Schiavo, &QUOT;Modelling and Simulation of Heat Exchangers in Modelica with Finite Element Methods&QUOT;, <i>Proceedings of the 2003 Modelica Conference</i>, Link&ouml;ping, Sweden, 2003, pp. 343-352. (<a href=\"http://www.modelica.org/Conference2003/papers/h22_Schiavo.pdf\">Available online</a>) </li>
<li>A. Cammi, M.E. Ricotti, F. Casella, F. Schiavo, &QUOT;New modelling strategy for IRIS dynamic response simulation&QUOT;, <i>Proc. 5th International Conference on Nuclear Option in Countries with Small and Medium Electricity Grids</i>, Dubrovnik, Croatia, May 2004.</li>
<li>A. Cammi, F. Casella, M.E. Ricotti, F. Schiavo, &QUOT;Object-oriented Modelling for Integral Nuclear Reactors Dynamic Dimulation&QUOT;, <i>Proceedings of the International Conference on Integrated Modeling &AMP; Analysis in Applied Control &AMP; Automation</i>, Genova, Italy, October 2004. </li>
<li>Antonio Cammi, Francesco Casella, Marco Ricotti and Francesco Schiavo, &ldquo;Object-Oriented Modeling, Simulation and Control of the IRIS Nuclear Power Plant with Modelica&rdquo;. In <i>Proceedings 4th International Modelica Conference</i>, Hamburg, Germany,Mar. 7-8, 2005, pp. 423-432. <a href=\"http://www.modelica.org/events/Conference2005/online_proceedings/Session5/Session5b3.pdf\">Online</a>. </li>
<li>A. Cammi, F. Casella, M. E. Ricotti, F. Schiavo, G. D. Storrick, &QUOT;Object-oriented Simulation for the Control of the IRIS Nuclear Power Plant&QUOT;, <i>Proceedings of the IFAC World Congress, </i>Prague, Czech Republic, July 2005 </li>
<li>Francesco Casella and Francesco Pretolani, &ldquo;Fast Start-up of a Combined-Cycle Power Plant: a Simulation Study with Modelica&rdquo;. In <i>Proceedings 5th International Modelica Conference</i>, Vienna, Austria, Sep. 6-8, 2006, pp. 3-10. <a href=\"http://www.modelica.org/events/modelica2006/Proceedings/sessions/Session1a1.pdf\">Online</a>. </li>
<li>Francesco Casella, &ldquo;Object-Oriented Modelling of Two-Phase Fluid Flows by the Finite Volume Method&rdquo;. In <i>Proceedings 5th Mathmod Vienna</i>, Vienna, Austria, Feb. 8-10, 2006. </li>
<li>Andrea Bartolini, Francesco Casella, Alberto Leva and Valeria Motterle, &ldquo;A Simulation Study of the Flue Gas Path Control System in a Coal-Fired Power Plant&rdquo;. In <i>Proceedings ANIPLA International Congress 2006</i>, Rome, Italy,vNov. 13-15, 2006. </li>
<li>Francesco Schiavo and Francesco Casella, &ldquo;Object-oriented modelling and simulation of heat exchangers with finite element methods&rdquo;. <i>Mathematical and Computer Modeling of Dynamical Sytems</i>, vol. 13, n. 3, pp. 211-235, Jun. 2007. <a href=\"http://dx.doi.org/10.1080/13873950600821766\">Online</a>. </li>
<li>Laura Savoldi Richard, Francesco Casella, Barbara Fiori and Roberto Zanino, &ldquo;Development of the Cryogenic Circuit Conductor and Coil (4C) Code for thermal-hydraulic modelling of ITER superconducting coils&rdquo;. In <i>Presented at the 22nd International Cryogenic Engineering Conference ICEC22</i>, Seoul, Korea, July 21-25, 2008. </li>
<li>Francesco Casella, &ldquo;Object-Oriented Modelling of Power Plants: a Structured Approach&rdquo;. In <i>Proceedings of the IFAC Symposium on Power Plants and Power Systems Control</i>, Tampere, Finland, July 5-8, 2009. </li>
<li>Laura Savoldi Richard, Francesco Casella, Barbara Fiori and Roberto Zanino, &ldquo;The 4C code for the cryogenic circuit conductor and coil modeling in ITER&rdquo;. <i>Cryogenics</i>, vol. 50, n. 3, pp. 167-176, Mar 2010. <a href=\"http://dx.doi.org/10.1016/j.cryogenics.2009.07.008\">Online</a>. </li>
<li>Antonio Cammi, Francesco Casella, Marco Enrico Ricotti and Francesco Schiavo, &ldquo;An object-oriented approach to simulation of IRIS dynamic response&rdquo;. <i>Progress in Nuclear Energy</i>, vol. 53, n. 1, pp. 48-58, Jan. 2011. <a href=\"http://dx.doi.org/10.1016/j.pnucene.2010.09.004\">Online</a>. </li>
<li>Francesco Casella and Piero Colonna, &ldquo;Development of a Modelica dynamic model of solar supercritical CO2 Brayton cycle power plants for control studies&rdquo;. In <i>Proceedings of the Supercritical CO2 Power Cycle Symposium</i>, Boulder, Colorado, USA, May 24-25, 2011, pp. 1-7. <a href=\"http://www.sco2powercyclesymposium.org/resource_center/system_modeling_control\">Online</a>. </li>
<li>Roberto Bonifetto, Francesco Casella, Laura Savoldi Richard and Roberto Zanino, &ldquo;Dynamic modeling of a SHe closed loop with the 4C code&rdquo;. In <i>Transactions of the Cryogenic Engineering Conference - CEC: Advances in Cryogenic Engineering</i>, Spokane, Washington, USA, Jun. 13-17, 2011, pp. 1-8. </li>
<li>Roberto Zanino, Roberto Bonifetto, Francesco Casella and Laura Savoldi Richard, &ldquo;Validation of the 4C code against data from the HELIOS loop at CEA Grenoble&rdquo;. <i>Cryogenics</i>, vol. 0, pp. 1-6, 2012. In press; available online 6 May 2012. <a href=\"http://dx.doi.org/10.1016/j.cryogenics.2012.04.010\">Online</a>. </li>
<li>Francesco Casella and Piero Colonna, &ldquo;Dynamic modelling of IGCC power plants&rdquo;. <i>Applied Thermal Engineering</i>, vol. 35, pp. 91-111, 2012. <a href=\"http://dx.doi.org/10.1016/j.applthermaleng.2011.10.011\">Online</a>. </li>
</ul></p>

<b>Release notes:</b>
<p><b></font><font style=\"font-size: 10pt; \">Version 2.1 (<i>6 Jul 2009</i>)</b></p>
<p>The 2.1 release of ThermoPower contains several additions and a few bug fixes with respect to version 2.0. We tried to keep the new version backwards-compatible with the old one, but there might be a few cases where small adaptations could be required.</p><p>ThermoPower 2.1 requires the Modelica Standard Library version 2.2.1 or 2.2.2. It has been tested with Dymola 6.1 (using MSL 2.2.1) and with Dymola 7.1 (using MSL 2.2.2). It is planned to be usable also with other tools, in particular OpenModelica, MathModelica and SimulationX, but this is not possible with the currently released versions of those tools. It is expected that this should become at least partially possible within the year 2009. </p><p>ThermoPower 2.1 is the last major revision compatible with Modelica 2.1 and the Modelica Standard Library 2.2.x. The next version is planned to use Modelica 3.1 and the Modelica Standard Library 3.1. It will use use stream connectors, which generalize the concept of Flange connectors, lifting the restrictions that only two complementary connectors can be bound.</p><p>This is a list of the main changes with respect to v. 2.0</p>
<li><ul>
<li>New PowerPlants package, containing a library of high-level reusable components for the modelling of combined-cycle power plants, including full models that can be simulated. </li>
<li>New examples cases in the Examples package. </li>
<li>New components in the Electrical package, to model the generator-grid connection by the swing equation </li>
<li>Three-way junctions (FlowJoin and FlowSplit) now have an option to describe unidirectional flow at each flange. This feature can substantially enhance numerical robustness and simulation performance in all cases when it is known a priori that no flow reversal will occur. </li>
<li>The Flow1D and Flow1D2ph models are now restricted to positive flow direction, since it was found that it is not possible to describe flow reversal consistently with the average-density approach adopted in this library. For full flow reversal support please use the Flow1Dfem model, which does not have any restriction in this respect. </li>
<li>A bug in Flow1D and Flow1D2ph has been corrected, which caused significant errors in the mass balance under dynamic conditions; this was potentially critical in closed-loop models, but has now been resolved.&nbsp; </li>
<li>The connectors for lumped- and distribute-parameters heat transfer with variable heat transfer coefficients have been split: HThtc and DHThtc now have an output qualifier on the h.t.c., while HThtc_in and DHThtc_in have an input qualifier. This was necessary to avoid incorrect connections, and is also required by tools to correctly checked if a model is balanced. This change should have no impact on most user-developed models. </li>
</ul></li>
</ul></p>
<p><b>Version 2.0 (<i>10 Jun 2005</i>)</b></p>
<li><ul>
<li>The new Modelica 2.2 standard library is used. </li>
<li>The ThermoPower library is now based on the Modelica.Media standard library for fluid property calculations. All the component models use a Modelica.Media compliant interface to specify the medium model. Standard water and gas models from the Modelica.Media library can be used, as well as custom-built water and gas models, compliant with the Modelica.Media interfaces. </li>
<li>Fully functional gas components are now available, including model for gas compressors and turbines, as well as compact gas turbine unit models. </li>
<li>Steady-state initialisation support has been added to all dynamic models. </li>
<li>Some components are still under development, and could be changed in the final 2.0 release: </li>
<li><ul>
<li>Moving boundary model for two-phase flow in once-through evaporators. </li>
<li>Stress models for headers and turbines. </li>
</ul></li>
</ul></li>
</ul></p>
<p><b>Version 1.2 (<i>18 Nov 2004</i>)</b></p>
<li><ul>
<li>Valve and pump models restructured using inheritance. </li>
<li>Simple model of a steam turbine unit added (requires the Modelica.Media library). </li>
<li>CISE example restructured and moved to the <code>Examples</code> package. </li>
<li>Preliminary version of gas components added in the <code>Gas</code> package. </li>
<li>Finite element model of thermohydraulic two-phase flow added. </li>
<li>Simplified models for the connection to the power system added in the <code>Electrical</code> package. </li>
</ul></li>
</ul></p>
<p><b>Version 1.1 (<i>15 Feb 2004</i>)</b></p>
<li><ul>
<li>No default values for parameters whose values must be set explicitly by the user. </li>
<li>Description of the meaning of the model variables added. </li>
<li><code>Pump</code>, <code>PumpMech</code>, <code>Accumulator</code> models added. </li>
<li>More rational geometric parameters for <code>Flow1D*</code> models. </li>
<li><code>Flow1D</code> model corrected to avoid numerical problems when the phase transition boundaries cross the nodes. </li>
<li><code>Flow1D2phDB</code> model updated. </li>
<li><code>Flow1D2phChen</code> models with two-phase heat transfer added. </li>
</ul></li>
</ul></p>
<p><b>Version 1.0 (<i>20 Oct 2003</i>)</b></p>
<li><ul>
<li>First release in the public domain</li>
</ul></li>
</ul></p>
<p><b></font><font style=\"font-size: 12pt; \">License agreement</b></p>
<p>The ThermoPower package is licensed by Politecnico di Milano under the <b><a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">Modelica License 2</a></b>. </p>
<p><h4>Copyright &copy; 2002-2013, Politecnico di Milano.</h4></p>
</html>"),
  uses(Modelica(version="3.2.1")),
  version="3.1");
end ThermoPower;
