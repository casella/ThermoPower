package Utilities 
  package FanCharacteristics "Functions for fan characteristics" 
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    
    partial block baseFlow "Base class for fan flow characteristics" 
      input VolumeFlowRate q_flow "Volumetric flow rate";
      input Real bladePos "Blade position";
      output SpecificEnergy H "Specific Energy";
    end baseFlow;
    
    partial block basePower 
      "Base class for fan power consumption characteristics" 
      input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
      input Real bladePos = 1 "Blade position";
      output Modelica.SIunits.Power consumption "Power consumption";
    end basePower;
    
    partial block baseEfficiency "Base class for efficiency characteristics" 
      input Modelica.SIunits.VolumeFlowRate q_flow "Volumetric flow rate";
      input Real bladePos = 1 "Blade position";
      output Real eta "Efficiency";
    end baseEfficiency;
    
    block linearFlow "Linear flow characteristic, fixed blades" 
      extends baseFlow;
      parameter Modelica.SIunits.VolumeFlowRate q_nom[2] 
        "Volume flow rate for two operating points (single fan)";
      parameter Modelica.SIunits.Height H_nom[2] 
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
    
    block quadraticFlow "Quadratic flow characteristic, fixed blades" 
      extends baseFlow;
      parameter Modelica.SIunits.VolumeFlowRate q_nom[3] 
        "Volume flow rate for three operating points (single fan)";
      parameter Modelica.SIunits.Height H_nom[3] 
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
    
    block quadraticFlowBlades "Quadratic flow characteristic, movable blades" 
      extends baseFlow;
      parameter Real bladePos_nom[:];
      parameter Modelica.SIunits.VolumeFlowRate q_nom[3,:] 
        "Volume flow rate for three operating points at N_pos blade positionings";
      parameter Modelica.SIunits.Height H_nom[3,:] 
        "Specific work for three operating points at N_pos blade positionings";
      parameter Real slope_s(unit = "(J/kg)/(m3/s)", max = 0) = 0 
        "Slope of flow characteristic at stalling conditions (must be negative)";
    protected 
      parameter Integer N_pos=size(bladePos_nom,1);
      Real q_nom2[3];
      Real c[3,N_pos] "Coefficients of quadratic specific work characteristic";
      Integer i;
      Real alpha;
      Real q_s "Volume flow rate at stalling conditions";
      
    // initialization of coefficients
    algorithm 
      for j in 1:N_pos loop
       q_nom2 := {q_nom[1, j]^2,q_nom[2, j]^2,q_nom[3, j]^2};
       c[:,j] := Modelica.Math.Matrices.solve([ones(3),q_nom[:,j],q_nom2], H_nom[:,j]);
      end for;
      
    // computation of specific energy
    algorithm 
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
    
    block polynomialFlow "Polynomial flow characteristic, fixed blades" 
      extends baseFlow;
      parameter Modelica.SIunits.VolumeFlowRate q_nom[:] 
        "Volume flow rate for N operating points (single fan)";
      parameter Modelica.SIunits.Height H_nom[:] 
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
    equation 
      // Flow equation (example N=3): H = c[1] + q_flow*c[2] + q_flow^2*c[3];
      // Note: the implementation is numerically efficient only for low values of Na
      H = sum(q_flow^(i-1)*c[i] for i in 1:N);
    end polynomialFlow;
    
    block constantEfficiency "Constant efficiency characteristic" 
       extends baseEfficiency;
       input Real eta_nom "Nominal efficiency";
    equation 
      eta = eta_nom;
    end constantEfficiency;
    
    block quadraticPower 
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
    equation 
      consumption =  c[1] + q_flow*c[2] + q_flow^2*c[3];
    end quadraticPower;
    
  end FanCharacteristics;
end Utilities;
