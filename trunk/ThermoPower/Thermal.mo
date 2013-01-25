within ThermoPower;
package Thermal "Thermal models of heat transfer"
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
        Temperature T "Material temperature";
      end PartialMaterial;
    end Interfaces;

    package Common "Implementation of material property models"
      model MaterialTable
        "Material property model based on table data and polynomial interpolations"
        import Modelica.SIunits.*;

        import Poly =
          ThermoPower.Thermal.MaterialProperties.Functions.Polynomials_Temp;
        // Attenzione e' una funzione temporanea di Media!!!

        extends Interfaces.PartialMaterial(materialName="tableMaterial",
            materialDescription="tableMaterial");

        // Tables defining temperature dependent properties of material
      protected
        constant ModulusOfElasticity[:, :] tableYoungModulus=fill(
                  0,
                  0,
                  0) "Table for youngModulus(T)";
        constant Stress[:, :] tableYieldStress=fill(
                  0,
                  0,
                  0) "Table for yieldStress(T)";
        constant Stress[:, :] tableUltimateStress=fill(
                  0,
                  0,
                  0) "Table for ultimateStress(T)";
        constant SpecificHeatCapacity[:, :] tableSpecificHeatCapacity=fill(
                  0,
                  0,
                  0) "Table for cp(T)";
        constant LinearExpansionCoefficient[:, :]
          tableLinearExpansionCoefficient=fill(
                  0,
                  0,
                  0) "Table for alfa(T)";
        constant ThermalConductivity[:, :] tableThermalConductivity=fill(
                  0,
                  0,
                  0) "Table for kappa(T)";
        // Functions to interpolate table data
      public
        constant Integer npol=2 "degree of polynomial used for fitting";
      protected
        final constant ModulusOfElasticity poly_youngModulus[:]=if size(
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
  extends Modelica.Icons.Library;
  connector HT = Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a
    "Thermal port for lumped parameter heat transfer";
  connector DHTNodes "Distributed Heat Terminal"
    parameter Integer N(min=1) = 2 "Number of nodes";
    AbsoluteTemperature T[N] "Temperature at the nodes";
    flow HeatFlux phi[N] "Heat flux at the nodes";
    annotation (Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={255,127,0},
            fillColor={255,127,0},
            fillPattern=FillPattern.Solid)}));
  end DHTNodes;

  connector DHTVolumes "Distributed Heat Terminal"
    parameter Integer N(min=1) = 2 "Number of nodes";
    AbsoluteTemperature T[N] "Temperature at the nodes";
    flow Power Q[N] "Heat flow through the connector";
    annotation (Icon(graphics={Rectangle(
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
    parameter Area exchangeSurface "Area of heat transfer surface";
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

    // TO BE ADAPTED!!!

    parameter Integer N=1 "Number of nodes on DHT side";
    parameter Area exchangeSurface "Area of heat transfer surface";
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
  end HT_DHTVolumes;

  model ConvHTLumped "Lumped parameter convective heat transfer"
    extends Icons.HeatFlow;
    parameter ThermalConductance G "Constant thermal conductance";
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

  model ConvHT "1D Convective heat transfer"
    extends Icons.HeatFlow;
    parameter Integer N=2 "Number of Nodes";
    parameter CoefficientOfHeatTransfer gamma
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

  model HeatFlowDistribution "Same heat flow through two different surfaces"
    extends Icons.HeatFlow;
    parameter Integer N(min=1) = 2 "Number of nodes";
    parameter Area A1=1 "Side 1 surface area" annotation (Evaluate=true);
    parameter Area A2=1 "Side 2 surface area" annotation (Evaluate=true);

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

  model HeatSource1D "Distributed Heat Flow Source"
    extends Icons.HeatFlow;
    parameter Integer N=2 "Number of nodes";
    parameter Integer Nt=1 "Number of tubes";
    parameter Length L "Source length";
    parameter Length omega "Source perimeter (single tube)";
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

  model HeatSource1Dhtc "Distributed Heat Flow Source"
    extends HeatSource1D(redeclare Thermal.DHThtc_in wall);
  end HeatSource1Dhtc;

  model MetalTubeFV "Cylindrical metal tube - 1 radial node and N axial nodes"

    // TO BE ADAPTED!!!!

    extends Icons.MetalWall;
    parameter Integer N(min=1) = 2 "Number of nodes";
    parameter Length L "Tube length";
    parameter Length rint "Internal radius (single tube)";
    parameter Length rext "External radius (single tube)";
    parameter Real rhomcm "Metal heat capacity per unit volume [J/m^3.K]";
    parameter ThermalConductivity lambda "Thermal conductivity";
    parameter Boolean WallRes=true "Wall conduction resistance accounted for";
    parameter Temperature Tstartbar=300 "Avarage temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature Tstart1=Tstartbar
      "Temperature start value - first node"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature TstartN=Tstartbar
      "Temperature start value - last node"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature Tstart[N]=ThermoPower.Thermal.linspaceExt(
          Tstart1,
          TstartN,
          N) "Start value of temperature vector (initialized by default)"
      annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt=Choices.Init.Options.noInit
      "Initialisation option" annotation (Dialog(tab="Initialisation"));
    constant Real pi=Modelica.Constants.pi;
    AbsoluteTemperature T[N](start=Tstart) "Node temperatures";
    Area Am "Area of the metal tube cross-section";
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
  end MetalTubeFV;

  model MetalTubeFEM "Cylindrical metal tube - 1 radial node and N axial nodes"
    extends Icons.MetalWall;
    parameter Integer N(min=1) = 2 "Number of nodes";
    parameter Length L "Tube length";
    parameter Length rint "Internal radius (single tube)";
    parameter Length rext "External radius (single tube)";
    parameter Real rhomcm "Metal heat capacity per unit volume [J/m^3.K]";
    parameter ThermalConductivity lambda "Thermal conductivity";
    parameter Boolean WallRes=true "Wall conduction resistance accounted for";
    parameter Temperature Tstartbar=300 "Avarage temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature Tstart1=Tstartbar
      "Temperature start value - first node"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature TstartN=Tstartbar
      "Temperature start value - last node"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature Tstart[N]=ThermoPower.Thermal.linspaceExt(
          Tstart1,
          TstartN,
          N) "Start value of temperature vector (initialized by default)"
      annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt=Choices.Init.Options.noInit
      "Initialisation option" annotation (Dialog(tab="Initialisation"));
    constant Real pi=Modelica.Constants.pi;
    AbsoluteTemperature T[N](start=Tstart) "Node temperatures";
    Area Am "Area of the metal tube cross-section";
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

  model MetalWallFV "Generic metal wall - 1 radial node and N axial nodes"

    // TO BE ADAPTED!!!!

    extends ThermoPower.Icons.MetalWall;
    parameter Integer N(min=1) = 2 "Number of nodes";
    parameter Modelica.SIunits.Mass M "Mass";
    parameter Modelica.SIunits.Area Sint "Internal surface";
    parameter Modelica.SIunits.Area Sext "External surface";
    parameter Modelica.SIunits.SpecificHeatCapacity cm
      "Specific heat capacity of metal";
    parameter Temperature Tstartbar=300 "Avarage temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature Tstart1=Tstartbar
      "Temperature start value - first node"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature TstartN=Tstartbar
      "Temperature start value - last node"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature Tstart[N]=ThermoPower.Thermal.linspaceExt(
          Tstart1,
          TstartN,
          N) "Start value of temperature vector (initialized by default)"
      annotation (Dialog(tab="Initialisation"));
    parameter ThermoPower.Choices.Init.Options initOpt=ThermoPower.Choices.Init.Options.noInit
      "Initialisation option" annotation (Dialog(tab="Initialisation"));
    constant Real pi=Modelica.Constants.pi;
    ThermoPower.AbsoluteTemperature T[N](start=Tstart) "Node temperatures";
    ThermoPower.Thermal.DHT int(N=N, T(start=Tstart)) "Internal surface"
      annotation (Placement(transformation(extent={{-40,20},{40,40}}, rotation=
              0)));
    ThermoPower.Thermal.DHT ext(N=N, T(start=Tstart)) "External surface"
      annotation (Placement(transformation(extent={{-40,-42},{40,-20}},
            rotation=0)));
  equation
    (cm*M)*der(T) = Sint*int.phi + Sext*ext.phi "Energy balance";
    // No temperature gradients across the thickness
    int.T = T;
    ext.T = T;
  initial equation
    if initOpt == ThermoPower.Choices.Init.Options.noInit then
      // do nothing
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
  end MetalWallFV;

  model MetalWallFEM "Generic metal wall - 1 radial node and N axial nodes"
    extends ThermoPower.Icons.MetalWall;
    parameter Integer N(min=1) = 2 "Number of nodes";
    parameter Modelica.SIunits.Mass M "Mass";
    parameter Modelica.SIunits.Area Sint "Internal surface";
    parameter Modelica.SIunits.Area Sext "External surface";
    parameter Modelica.SIunits.SpecificHeatCapacity cm
      "Specific heat capacity of metal";
    parameter Temperature Tstartbar=300 "Avarage temperature"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature Tstart1=Tstartbar
      "Temperature start value - first node"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature TstartN=Tstartbar
      "Temperature start value - last node"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature Tstart[N]=ThermoPower.Thermal.linspaceExt(
          Tstart1,
          TstartN,
          N) "Start value of temperature vector (initialized by default)"
      annotation (Dialog(tab="Initialisation"));
    parameter ThermoPower.Choices.Init.Options initOpt=ThermoPower.Choices.Init.Options.noInit
      "Initialisation option" annotation (Dialog(tab="Initialisation"));
    constant Real pi=Modelica.Constants.pi;
    ThermoPower.AbsoluteTemperature T[N](start=Tstart) "Node temperatures";
    ThermoPower.Thermal.DHT int(N=N, T(start=Tstart)) "Internal surface"
      annotation (Placement(transformation(extent={{-40,20},{40,40}}, rotation=
              0)));
    ThermoPower.Thermal.DHT ext(N=N, T(start=Tstart)) "External surface"
      annotation (Placement(transformation(extent={{-40,-42},{40,-20}},
            rotation=0)));
  equation
    (cm*M)*der(T) = Sint*int.phi + Sext*ext.phi "Energy balance";
    // No temperature gradients across the thickness
    int.T = T;
    ext.T = T;
  initial equation
    if initOpt == ThermoPower.Choices.Init.Options.noInit then
      // do nothing
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

  connector HThtc
    "Thermal port for lumped parameter heat transfer with outgoing heat transfer coefficient"
    extends HT;
    output ThermalConductance G "Thermal conductance";
  end HThtc;

  connector HThtc_in
    "Thermal port for lumped parameter heat transfer with incoming heat transfer coefficient"
    extends HT;
    input ThermalConductance G "Thermal conductance";
  end HThtc_in;

  connector DHT "Distributed Heat Terminal"
    parameter Integer N(min=1) = 2 "Number of nodes";
    AbsoluteTemperature T[N] "Temperature at the nodes";
    flow HeatFlux phi[N] "Heat flux at the nodes";
    annotation (Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={255,127,0},
            fillColor={255,127,0},
            fillPattern=FillPattern.Solid)}));
  end DHT;

  connector DHThtc
    "Distributed Heat Terminal with heat transfer coefficient output"
    extends DHT;
    output CoefficientOfHeatTransfer gamma[N] "Heat transfer coefficient";
  end DHThtc;

  connector DHThtc_in
    "Distributed Heat Terminal with heat transfer coefficient input"
    extends DHT;
    input CoefficientOfHeatTransfer gamma[N] "Heat transfer coefficient";
  end DHThtc_in;

  model DHThtc_DHT "DHThtc to DHT adapter"

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
    parameter Integer N=1 "Number of nodes on DHT side";
    parameter Area exchangeSurface "Area of heat transfer surface";
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
    parameter Integer N=1 "Number of nodes on DHT side";
    parameter Area exchangeSurface "Heat exchange surface";
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

  model ConvHTLumped_htc
    "Lumped parameter convective heat transfer between a HT and a HThtc"
    extends Icons.HeatFlow;
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
    parameter Integer N1(min=1) = 2 "Number of nodes on side 1";
    parameter Integer N2(min=1) = 2 "Number of nodes on side 2";
    parameter CoefficientOfHeatTransfer gamma
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
    parameter Length rint "Internal radius";
    parameter Length rext "External radius";
    parameter Temperature Tstartint=300
      "Temperature start value at rint (first node)"
      annotation (Dialog(tab="Initialisation"));
    parameter Temperature Tstartext=300
      "Temperature start value at rext (last node)"
      annotation (Dialog(tab="Initialisation"));
    parameter Choices.Init.Options initOpt=Choices.Init.Options.noInit
      "Initialisation option" annotation (Dialog(tab="Initialisation"));

    Length r[Nr](fixed=false) "Node radii";
  protected
    Length r1_2[Nr - 1](fixed=false) "Slice mean radii";
    Length r_lin[Nr](fixed=false) "Linearly distributed radii";
    Real A[Nr](fixed=false);
    Real B[Nr](fixed=false);
    Real C[Nr](fixed=false);

  public
    Temperature T[Nr](start=linspace(
            Tstartint,
            Tstartext,
            Nr)) "Nodal temperatures";
    Temperature Tm "Mean temperature";
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

  function linspaceExt "Extended linspace handling also the N=1 case"
    input Real x1;
    input Real x2;
    input Integer N;
    output Real vec[N];
  algorithm
    vec := if N == 1 then {x1} else linspace(
        x1,
        x2,
        N);
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
