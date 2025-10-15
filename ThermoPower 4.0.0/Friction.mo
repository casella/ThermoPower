within ThermoPower;

package Friction "Friction models"
  extends Modelica.Icons.Package;

  package BaseClasses
  extends Modelica.Icons.BasesPackage;

    partial model FrictionBase1D "Friction base model for 1D components"
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium model"
        constrainedby Modelica.Media.Interfaces.PartialMedium
        annotation(choicesAllMatching = true);

      parameter SI.Length Dhyd "Hydraulic Diameter (single element in parallel)";
      parameter SI.PerUnit Kfc=1 "Friction factor correction coefficient";

      parameter Integer Nt=1 "Number of tubes in parallel" annotation(
        Dialog(enable=false, tab = "Set by 1D model"));
      parameter Integer N=1 "Number of elements (volumes if FV, nodes if FEM)" annotation(
        Dialog(enable=false, tab = "Set by 1D model"));
      parameter SI.Length L "Tube length" annotation(
        Dialog(enable=false, tab = "Set by 1D model"));
      parameter SI.Area A "Cross-sectional area (single element in parallel)" annotation(
        Dialog(enable=false, tab = "Set by 1D model"));

      input Medium.ThermodynamicState[N] fluidState;
      input Medium.MassFlowRate[N] w;

      output Real Kf "Hydraulic friction coefficient";

  annotation(
        Documentation(info = "<html><head></head><body>Base model for <code>replaceable</code> friction models to be used to <code>redeclare</code> the fricion model in 1D components like the <code>Flow1Dxx</code> family;</body></html>", revisions = "<html><head></head><body><ul>
<li><i>15 Oct 2025</i>
    by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
       First release.</li>
</ul>
</body></html>"));
    end FrictionBase1D;
  end BaseClasses;
end Friction;
