within ThermoPower;

package Friction "Friction models"
  extends Modelica.Icons.Package;

  package Friction1DFV "Friction models for 1DFV components"
  extends Modelica.Icons.Package;

    model NoFriction "No friction is applied"
      extends ThermoPower.Friction.Interfaces.FrictionBase1DFV;

    equation
      NoFriction = true;
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
      NoFriction = false;
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

    model OperatingPoint "Operating point"
      extends Friction.Interfaces.FrictionBase1DFV;
      parameter Medium.Density rhonom "Nominal inlet density";

    equation
      NoFriction = false;
      Kf = dpnom*rhonom/(wnom/Nt)^2*Kfc;
      Cf = 2*Kf*A^3/(omega_hyd*L);

      annotation(
        Documentation(info = "<html><head></head><body>Friction factor is calculated starting from a nominal operating point;</body></html>", revisions = "<html><head></head><body><ul>
        <li><i>12 Mar 2026</i>
        by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
           First release.</li>
        </ul>
        </body></html>"));
    end OperatingPoint;

    model NominalCf "Nominal Cf Fanning friction factor"
      extends Friction.Interfaces.FrictionBase1DFV;
      parameter SI.PerUnit Cfnom=0 "Nominal Fanning friction factor";

    equation
      NoFriction = false;
      Kf = Cf*omega_hyd*L/(2*A^3);
      Cf = Cfnom*Kfc;

      annotation(
        Documentation(info = "<html><head></head><body>Nominal Cf Fanning friction factor is applied;</body></html>", revisions = "<html><head></head><body><ul>
        <li><i>15 Oct 2025</i>
        by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
           First release.</li>
        </ul>
        </body></html>"));
    end NominalCf;

    model Colebrook_ph "Colebrook's equation"
      extends Friction.Interfaces.FrictionBase1DFV;
      parameter SI.PerUnit e=0 "Relative roughness (ratio roughness/diameter)";

    equation
      NoFriction = false;
      Kf = Cf*omega_hyd*L/(2*A^3);
      Cf = ThermoPower.FluidPh.f_colebrook(
             w,
             Dhyd/A,
             e,
             Medium.dynamicViscosity(fluidState[integer(N/2)]))*Kfc;

      annotation(
        Documentation(info = "<html><head></head><body><p>This friction model can be used with the <code>Fow1DFV</code> model in the <code>FluidPh</code> package.</p><p>Fanning friction factor is computed by Colebrook's equation (assuming Re > 2100, e.g. turbulent flow).</p></body></html>", revisions = "<html><head></head><body><ul>
            <li><i>12 Mar 2026</i>
            by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
               First release.</li>
            </ul>
            </body></html>"));
    end Colebrook_ph;

    model Colebrook_gas "Colebrook's equation"
      extends Friction.Interfaces.FrictionBase1DFV;
      parameter SI.PerUnit e = 0 "Relative roughness (ratio roughness/diameter)";

    equation
      NoFriction = false;
      Kf = Cf*omega_hyd*L/(2*A^3);
      Cf = ThermoPower.IdealGas.f_colebrook(
             w,
             Dhyd/A,
             e,
             Medium.dynamicViscosity(fluidState[integer(N/2)]))*Kfc;

      annotation(
        Documentation(info = "<html><head></head><body><p>This friction model can be used with the <code>Fow1DFV</code> model in the <code>IdealGas</code> package.</p><p>Fanning friction factor is computed by Colebrook's equation (assuming Re > 2100, e.g. turbulent flow).</p></body></html>", revisions = "<html><head></head><body><ul>
                <li><i>12 Mar 2026</i>
                by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
                   First release.</li>
                </ul>
                </body></html>"));
    end Colebrook_gas;

  end Friction1DFV;

  package Friction1DFV2ph
  extends Modelica.Icons.Package;

    model NoFriction "No friction is applied"
      extends ThermoPower.Friction.Interfaces.FrictionBase1DFV2ph;

    equation
      NoFriction = true;
      Kf = zeros(N-1);
      Kfl = zeros(N-1);
      Cf = zeros(N-1);

    annotation(
        Documentation(info = "<html><head></head><body>No friction is applied;</body></html>", revisions = "<html><head></head><body><ul>
    <li><i>13 Mar 2026</i>
    by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
       First release.</li>
    </ul>
    </body></html>"));
    end NoFriction;

    model NominalKf "Nominal Kf friction factor"
      extends ThermoPower.Friction.Interfaces.FrictionBase1DFV2ph;
      parameter Real Kfnom "Nominal hydraulic resistance coefficient (DP = Kfnom*w^2/rho)";
    
    equation
      NoFriction = false;
      Kf = fill(Kfnom*Kfc/(N-1),(N-1));
      Cf = {2*Kf[j]*A^3/(omega_hyd*l) for j in 1:N-1};
      Kfl = {wnom/Nt*wnf*Kf[j] for j in 1:N-1};
    
    annotation(
        Documentation(info = "<html><head></head><body>Nominal Kf friction factor is applied;</body></html>", revisions = "<html><head></head><body><ul>
    <li><i>13 Mar 2026</i>
    by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
       First release.</li>
    </ul>
    </body></html>"));
    end NominalKf;

    model OperatingPoint "Operating point"
      extends Friction.Interfaces.FrictionBase1DFV2ph;
      parameter Medium.Density rhonom "Nominal inlet density";
    
    equation
      NoFriction = false;
      Kf = fill(dpnom*rhonom/(wnom/Nt)^2/(N-1)*Kfc,(N-1));
      Cf = {2*Kf[j]*A^3/(omega_hyd*l) for j in 1:N-1};
      Kfl = {wnom/Nt*wnf*Kf[j] for j in 1:N-1};
      
      annotation(
        Documentation(info = "<html><head></head><body>Friction factor is calculated starting from a nominal operating point;</body></html>", revisions = "<html><head></head><body><ul>
        <li><i>12 Mar 2026</i>
        by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
           First release.</li>
        </ul>
        </body></html>"));
    end OperatingPoint;
  end Friction1DFV2ph;

  package Interfaces
  extends Modelica.Icons.InterfacesPackage;

    partial model FrictionBase1DFV "Friction base model for 1DFV components"
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium model"
        constrainedby Modelica.Media.Interfaces.PartialMedium
        annotation(choicesAllMatching = true);

      parameter SI.Length Dhyd "Hydraulic Diameter (single element in parallel)";
      parameter SI.PerUnit Kfc "Friction factor correction coefficient";
      parameter Integer Nt = 1 "Number of tubes in parallel";
      parameter Integer N(min = 2) = 2 "Number of nodes for thermal variables";
      parameter SI.Length L "Tube length";
      parameter SI.Area A "Cross-sectional area (single element in parallel)";

      parameter Medium.MassFlowRate wnom "Nominal mass flowrate (total)";
      parameter SI.PressureDifference dpnom "Nominal pressure drop";

      final parameter SI.Length omega_hyd = 4*A/Dhyd "Wet perimeter (single tube)";

      input Medium.ThermodynamicState[N] fluidState "Thermodynamic state of the fluid at the nodes";
      input Medium.MassFlowRate w "Mass flowrate (single tube)";

      output Real Kf "Hydraulic friction coefficient";
      output SI.PerUnit Cf "Fanning friction factor";
      output Boolean NoFriction "=true, if no friction is used";

      annotation(
        Documentation(info = "<html><head></head><body>Base model for <code>replaceable</code> friction models to be used to <code>redeclare</code> the fricion model in the <code>Flow1DFV</code> components;</body></html>", revisions = "<html><head></head><body><ul>
<li><i>15 Oct 2025</i>
    by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
       First release.</li>
</ul>
</body></html>"));
    end FrictionBase1DFV;

    partial model FrictionBase1DFV2ph "Friction base model for 1DFV2ph components"
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium "Medium model"
        constrainedby Modelica.Media.Interfaces.PartialMedium
        annotation(choicesAllMatching = true);

      parameter SI.Length Dhyd "Hydraulic Diameter (single element in parallel)";
      parameter SI.PerUnit Kfc "Friction factor correction coefficient";
      parameter Integer Nt = 1 "Number of tubes in parallel";
      parameter Integer N(min = 2) = 2 "Number of nodes for thermal variables";
      parameter SI.Length L "Tube length";
      parameter SI.Area A "Cross-sectional area (single element in parallel)";
      parameter SI.PerUnit wnf "Fraction of nominal flow rate at which linear friction equals turbulent friction";
      parameter Medium.MassFlowRate wnom "Nominal mass flowrate (total)";
      parameter SI.PressureDifference dpnom "Nominal pressure drop";

      final parameter SI.Length omega_hyd = 4*A/Dhyd "Wet perimeter (single tube)";
      final parameter SI.Length l=L/(N-1) "Length of a single volume";

      input Medium.SaturationProperties sat "Properties of saturated fluid";
      input Medium.MassFlowRate w "Mass flowrate (single tube)";
      input Medium.SpecificEnthalpy hl "Saturated liquid temperature";
      input Medium.SpecificEnthalpy hv "Saturated vapour temperature";
      input Medium.SpecificEnthalpy htilde[N - 1] "Enthalpy state variables";

      output Real Kf[N-1] "Friction coefficient";
      output Real Kfl[N-1] "Linear friction coefficient";
      output Real Cf[N-1] "Fanning friction factor";
      output Boolean NoFriction "=true, if no friction is used";

      annotation(
        Documentation(info = "<html><head></head><body>Base model for <code>replaceable</code> friction models to be used to <code>redeclare</code> the fricion model in the <code>Flow1DFV2ph</code> components;</body></html>", revisions = "<html><head></head><body><ul>
    <li><i>15 Oct 2025</i>
        by <a href=\"mailto:andrea.bartolini@dynamica-it.com\">Andrea Bartolini</a>:<br>
           First release.</li>
    </ul>
    </body></html>"));
    end FrictionBase1DFV2ph;
  end Interfaces;
end Friction;