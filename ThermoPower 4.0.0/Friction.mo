within ThermoPower;

package Friction "Friction models"
  extends Modelica.Icons.Package;

  package Friction1DFV "Friction models for 1DFV components"
  extends Modelica.Icons.Package;

    model NoFriction "No friction is applied"
      extends ThermoPower.Friction.Interfaces.FrictionBase1DFV;
    
    equation
      Kf=0;
      Cf=0;
    
    annotation(
        Documentation(info = "<html><head></head><body>No friction is applied;</body></html>", revisions = "<html><head></head><body><ul>
    <li><i>15 Oct 2025</i>
    by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
       First release.</li>
    </ul>
    </body></html>"));
    end NoFriction;
    
    model NominalKf "Nominal Kf friction factor"
      extends ThermoPower.Friction.Interfaces.FrictionBase1DFV;
      parameter Real Kfnom "Nominal hydraulic resistance coefficient (DP = Kfnom*w^2/rho)";
    
    equation
      Kf = Kfnom*Kfc;
      Cf = 2*Kf*A^3/(omega_hyd*L);
    
    annotation(
        Documentation(info = "<html><head></head><body>Nominal Kf friction factor is applied;</body></html>", revisions = "<html><head></head><body><ul>
    <li><i>15 Oct 2025</i>
    by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
       First release.</li>
    </ul>
    </body></html>"));
    end NominalKf;

  end Friction1DFV;

  package Interfaces
  extends Modelica.Icons.InterfacesPackage;

    partial model FrictionBase1DFV "Friction base model for 1DFV components"
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium model" constrainedby Modelica.Media.Interfaces.PartialMedium annotation(
         choicesAllMatching = true);
      parameter SI.Length Dhyd "Hydraulic Diameter (single element in parallel)";
      parameter SI.PerUnit Kfc "Friction factor correction coefficient";
      parameter Integer Nt = 1 "Number of tubes in parallel";
      parameter Integer N(min = 2) = 2 "Number of nodes for thermal variables";
      parameter SI.Length L "Tube length";
      parameter SI.Area A "Cross-sectional area (single element in parallel)";
      final parameter SI.Length omega_hyd = 4*A/Dhyd "Wet perimeter (single tube)";
      input Medium.ThermodynamicState[N] fluidState;
      input Medium.MassFlowRate w;
      output Real Kf "Hydraulic friction coefficient";
      output SI.PerUnit Cf "Fanning friction factor";
      annotation(
        Documentation(info = "<html><head></head><body>Base model for <code>replaceable</code> friction models to be used to <code>redeclare</code> the fricion model in the <code>Flow1DFV</code> components;</body></html>", revisions = "<html><head></head><body><ul>
<li><i>15 Oct 2025</i>
    by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
       First release.</li>
</ul>
</body></html>"));
    end FrictionBase1DFV;
  end Interfaces;
end Friction;