within ThermoPower;
package PowerPlants "Models of thermoelectrical power plants components"
  import SI = Modelica.SIunits;
  import ThermoPower.Choices.Init.Options;

  package GasTurbine
    "Models and tests of the gas turbine and its main components"
    package Interfaces "Interface definitions"

      partial model GasTurbine "Base class for Gas Turbine"
        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package AirMedium = ThermoPower.Media.Air constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package FuelMedium = ThermoPower.Media.NaturalGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        Gas.FlangeA FuelInlet(            redeclare package Medium = FuelMedium)
          annotation (Placement(transformation(extent={{-20,180},{20,220}},
                rotation=0)));
        Gas.FlangeA AirInlet(            redeclare package Medium = AirMedium)
          annotation (Placement(transformation(extent={{-220,140},{-180,180}},
                rotation=0)));
        Gas.FlangeB FlueGasOutlet(            redeclare package Medium =
              FlueGasMedium)
          annotation (Placement(transformation(extent={{180,140},{220,180}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        ThermoPower.PowerPlants.Buses.Sensors SensorsBus
                                 annotation (Placement(transformation(extent={{
                  180,-120},{220,-80}}, rotation=0)));
        ThermoPower.PowerPlants.Buses.Actuators ActuatorsBus
                                     annotation (Placement(transformation(
                extent={{220,-180},{180,-140}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),  Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-200,12},{200,-12}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Ellipse(
                extent={{-30,150},{30,90}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={255,0,0}),
              Polygon(
                points={{-30,30},{-40,30},{-40,120},{-30,120},{-30,30}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{30,30},{40,30},{40,120},{30,120},{30,30}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{-130,112},{-120,106},{-120,166},{-200,166},{-200,154},
                    {-130,154},{-130,112}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{130,112},{120,108},{120,166},{200,166},{200,154},{130,
                    154},{130,112}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{-130,120},{-30,40},{-30,-40},{-130,-120},{-130,120}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{130,120},{30,40},{30,-40},{130,-120},{130,-120},{130,
                    120}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{4,150},{-4,150},{-8,200},{8,200},{4,150}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255})}));
      end GasTurbine;

      partial model GasTurbineSimplified
        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas
          constrainedby Modelica.Media.Interfaces.PartialMedium;
        Gas.FlangeB flueGasOut(            redeclare package Medium =
              FlueGasMedium)               annotation (Placement(transformation(
                extent={{90,70},{110,90}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput GTLoad "GT unit load in p.u."
          annotation (Placement(transformation(extent={{-112,-12},{-88,12}},
                rotation=0)));
        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-44,8},{38,-6}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Ellipse(
                extent={{-20,80},{20,40}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={255,0,0}),
              Polygon(
                points={{-20,18},{-24,24},{-24,64},{-20,64},{-20,18}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{20,18},{24,24},{24,64},{20,64},{20,18}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{80,60},{76,56},{76,82},{100,82},{100,78},{80,78},{80,
                    60}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{-80,70},{-20,30},{-20,-30},{-80,-70},{-80,70}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255}),
              Polygon(
                points={{80,70},{20,30},{20,-30},{80,-70},{80,-70},{80,70}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={170,170,255})}));
      end GasTurbineSimplified;
    end Interfaces;

    package Examples "Example implementations"

      model GasTurbineSimplified
        extends
          ThermoPower.PowerPlants.GasTurbine.Interfaces.GasTurbineSimplified;
        parameter Modelica.SIunits.Power maxPower=235e6;
        parameter Modelica.SIunits.MassFlowRate flueGasNomFlowRate=614
          "Nominal flue gas flow rate";
        parameter Modelica.SIunits.MassFlowRate flueGasMinFlowRate=454
          "Minimum flue gas flow rate";
        parameter Modelica.SIunits.MassFlowRate flueGasOffFlowRate=
            flueGasMinFlowRate/100 "Flue gas flow rate with GT switched off";
        parameter Modelica.SIunits.MassFlowRate fuelNomFlowRate=12.1
          "Nominal fuel flow rate";
        parameter Modelica.SIunits.MassFlowRate fuelIntFlowRate=7.08
          "Intermediate fuel flow rate";
        parameter Modelica.SIunits.MassFlowRate fuelMinFlowRate=4.58
          "Minimum fuel flow rate";
        parameter Modelica.SIunits.MassFlowRate fuelOffFlowRate=0.1
          "Flue gas flow rate with GT switched off";
        parameter Real constTempLoad = 0.60
          "Fraction of load from which the temperature is kept constant";
        parameter Real intLoad = 0.42
          "Intermediate load for fuel consumption computations";
        parameter Modelica.SIunits.Temperature flueGasNomTemp=843
          "Maximum flue gas temperature";
        parameter Modelica.SIunits.Temperature flueGasMinTemp=548
          "Minimum flue gas temperature (zero electrical load)";
        parameter Modelica.SIunits.Temperature flueGasOffTemp=363.15
          "Flue gas temperature with GT switched off";
        parameter Modelica.SIunits.SpecificEnthalpy fuel_LHV=49e6
          "Fuel Lower Heating Value";
        parameter Modelica.SIunits.SpecificEnthalpy fuel_HHV=55e6
          "Fuel Higher Heating Value";
        FlueGasMedium.BaseProperties gas;
        Modelica.SIunits.MassFlowRate w;
        Modelica.SIunits.Power P_el=noEvent(if GTLoad > 0 then GTLoad*maxPower else
                  0) "Electrical power output";
        Modelica.SIunits.MassFlowRate fuelFlowRate "Fuel flow rate";
      equation
        gas.p = flueGasOut.p;
        gas.Xi = FlueGasMedium.reference_X[1:FlueGasMedium.nXi];
        gas.T = noEvent(
          if GTLoad > constTempLoad then flueGasNomTemp else
          if GTLoad > 0 then flueGasMinTemp +
            GTLoad/constTempLoad*(flueGasNomTemp-flueGasMinTemp) else
          flueGasMinTemp * (1+GTLoad) - flueGasOffTemp * GTLoad);
        w = noEvent(
          if GTLoad > constTempLoad then flueGasMinFlowRate + (GTLoad-constTempLoad)/
            (1-constTempLoad)*(flueGasNomFlowRate-flueGasMinFlowRate) else
          if GTLoad > 0 then flueGasMinFlowRate else
          flueGasMinFlowRate * (1+GTLoad) - flueGasOffFlowRate * GTLoad);
        fuelFlowRate = noEvent(
          if GTLoad > intLoad then fuelIntFlowRate + (GTLoad-intLoad)/
            (1-intLoad)*(fuelNomFlowRate-fuelIntFlowRate) else
          if GTLoad > 0 then fuelMinFlowRate + GTLoad/intLoad *
            (fuelIntFlowRate-fuelMinFlowRate) else
          fuelMinFlowRate * (1+GTLoad) - fuelOffFlowRate * GTLoad);

        flueGasOut.m_flow = -w;
        flueGasOut.h_outflow = gas.h;
        flueGasOut.Xi_outflow = gas.Xi;
        annotation (Diagram(graphics));
      end GasTurbineSimplified;
    end Examples;

    package Tests "Test cases"
      model TestGasTurbine

        Examples.GasTurbineSimplified gasTurbine
          annotation (Placement(transformation(extent={{-40,-40},{0,0}},
                rotation=0)));
        ThermoPower.Gas.SinkP sinkP(redeclare package Medium =
              ThermoPower.Media.FlueGas)
          annotation (Placement(transformation(extent={{62,-14},{82,6}},
                rotation=0)));
        Modelica.Blocks.Sources.Constant const
          annotation (Placement(transformation(extent={{-90,-30},{-70,-10}},
                rotation=0)));
        ThermoPower.PowerPlants.HRSG.Components.StateReader_gas stateReader_gas(
            redeclare package Medium = ThermoPower.Media.FlueGas)
          annotation (Placement(transformation(extent={{20,-14},{40,6}},
                rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{70,70},{90,90}})));
      equation
        connect(const.y, gasTurbine.GTLoad) annotation (Line(points={{-69,-20},
                {-40,-20}}, color={0,0,127}));
        connect(stateReader_gas.inlet, gasTurbine.flueGasOut) annotation (Line(
            points={{24,-4},{0,-4}},
            color={159,159,223},
            thickness=0.5));
        connect(stateReader_gas.outlet, sinkP.flange) annotation (Line(
            points={{36,-4},{62,-4}},
            color={159,159,223},
            thickness=0.5));
        annotation (Diagram(graphics));
      end TestGasTurbine;
    end Tests;
    annotation (Documentation(revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
  end GasTurbine;

  package HRSG "Models and tests of the HRSG and its main components"
    package Interfaces "Interface definitions"
      partial model HeatExchanger "Base class for heat exchanger fluid - gas"

        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium "Flue gas model";
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance "Fluid model";

        parameter Integer N_G=2 "Number of node of the gas side";
        parameter Integer N_F=2 "Number of node of the fluid side";

        //Nominal parameter
        parameter SI.MassFlowRate gasNomFlowRate
          "Nominal flow rate through the gas side";
        parameter SI.MassFlowRate fluidNomFlowRate
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure gasNomPressure
          "Nominal pressure in the gas side inlet";
        parameter SI.Pressure fluidNomPressure
          "Nominal pressure in the fluid side inlet";

        //Physical Parameter
        parameter SI.Area exchSurface_G
          "Exchange surface between gas - metal tube";
        parameter SI.Area exchSurface_F
          "Exchange surface between metal tube - fluid";
        parameter SI.Area extSurfaceTub "Total external surface of the tubes";
        parameter SI.Volume gasVol "Gas volume";
        parameter SI.Volume fluidVol "Fluid volume";
        parameter SI.Volume metalVol "Volume of the metal part in the tubes";
        parameter Real rhomcm "Metal heat capacity per unit volume [J/m^3.K]";
        parameter SI.ThermalConductivity lambda
          "Thermal conductivity of the metal (density by specific heat capacity)";

        //Start value
        parameter SI.Temperature Tstartbar_G
          "Start value of the average gas temperature"   annotation(Dialog(tab = "Initialization"));
        parameter SI.Pressure pstart_G=gasNomPressure
          "Pressure start value, gas side"
                                          annotation(Dialog(tab = "Initialization"));
        parameter SI.Temperature Tstartbar_M = Tstartbar_G-50
          "Start value of the average metal temperature" annotation(Dialog(tab = "Initialization"));
        parameter SI.Pressure pstart_F=50e5 "Pressure start value, fluid side" annotation(Dialog(tab = "Initialization"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));

        Gas.FlangeA gasIn(redeclare package Medium = FlueGasMedium)
                            annotation (Placement(transformation(extent={{-120,
                  -20},{-80,20}}, rotation=0)));
        Gas.FlangeB gasOut(redeclare package Medium = FlueGasMedium)
                            annotation (Placement(transformation(extent={{80,
                  -20},{120,20}}, rotation=0)));
        Water.FlangeA waterIn(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-20,80},{20,120}},
                rotation=0)));
        Water.FlangeB waterOut(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-20,-120},{20,-80}},
                rotation=0)));

        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,-80},{0,-40},{40,-20},{-40,20},{0,40},{0,80}},
                color={0,0,255},
                thickness=0.5),
              Text(
                extent={{-100,-115},{100,-145}},
                lineColor={85,170,255},
                textString=
                     "%name")}));
      end HeatExchanger;

      partial model ParallelHE
        "Base class for Parallel Heat Exchanger (two fluid with one gas)"

        Gas.FlangeA gasIn(            redeclare package Medium = FlueGasMedium)
                            annotation (Placement(transformation(extent={{-120,
                  -20},{-80,20}}, rotation=0)));
        Gas.FlangeB gasOut(            redeclare package Medium = FlueGasMedium)
                            annotation (Placement(transformation(extent={{80,
                  -20},{120,20}}, rotation=0)));
        Water.FlangeA waterInA(            redeclare package Medium =
              FluidMedium) "water/steam first inlet"
          annotation (Placement(transformation(extent={{-60,80},{-20,120}},
                rotation=0)));
        Water.FlangeB waterOutA(            redeclare package Medium =
              FluidMedium) "water/steam first outlet"
          annotation (Placement(transformation(extent={{-60,-120},{-20,-80}},
                rotation=0)));
        Water.FlangeA waterInB(            redeclare package Medium =
              FluidMedium) "water/steam second inlet"
          annotation (Placement(transformation(extent={{20,80},{60,120}},
                rotation=0)));
        Water.FlangeB waterOutB(            redeclare package Medium =
              FluidMedium) "water/steam second outlet"
          annotation (Placement(transformation(extent={{20,-120},{60,-80}},
                rotation=0)));
        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        parameter Integer N_G=2 "Number of node of the gas side";
        parameter Integer N_F_A=2 "Number of node of the fluid side"   annotation (Dialog(group = "side A"));
        parameter Integer N_F_B=2 "Number of node of the fluid side"   annotation (Dialog(group = "side B"));

        //Nominal parameter
        parameter SI.MassFlowRate gasNomFlowRate
          "Nominal flow rate through the gas side";
        parameter SI.MassFlowRate fluidNomFlowRate_A
          "Nominal flow rate through the fluid side"     annotation (Dialog(group = "side A"));
        parameter SI.MassFlowRate fluidNomFlowRate_B
          "Nominal flow rate through the fluid side"     annotation (Dialog(group = "side B"));
        parameter SI.Pressure gasNomPressure
          "Nominal pressure in the gas side inlet";
        parameter SI.Pressure fluidNomPressure_A
          "Nominal pressure in the fluid side inlet"     annotation (Dialog(group = "side A"));
        parameter SI.Pressure fluidNomPressure_B
          "Nominal pressure in the fluid side inlet"     annotation (Dialog(group = "side B"));

        //Physical Parameter
        parameter SI.Area exchSurface_G_A
          "Exchange surface between gas - metal tube,"     annotation (Dialog(group = "side A"));
        parameter SI.Area exchSurface_G_B
          "Exchange surface between gas - metal tube,"     annotation (Dialog(group = "side B"));
        parameter SI.Area exchSurface_F_A
          "Exchange surface between metal tube - fluid,"     annotation (Dialog(group = "side A"));
        parameter SI.Area exchSurface_F_B
          "Exchange surface between metal tube - fluid,"     annotation (Dialog(group = "side B"));
        parameter SI.Area extSurfaceTub_A "Total external surface of the tubes"
                                                             annotation (Dialog(group = "side A"));
        parameter SI.Area extSurfaceTub_B "Total external surface of the tubes"
                                                             annotation (Dialog(group = "side B"));
        parameter SI.Volume gasVol "Gas volume";
        parameter SI.Volume fluidVol_A "Fluid volume"     annotation (Dialog(group = "side A"));
        parameter SI.Volume fluidVol_B "Fluid volume"     annotation (Dialog(group = "side B"));
        parameter SI.Volume metalVol_A "Volume of the metal part in the tube"     annotation (Dialog(group = "side A"));
        parameter SI.Volume metalVol_B "Volume of the metal part in the tube"     annotation (Dialog(group = "side B"));
        parameter Real rhomcm_A "Metal heat capacity per unit volume [J/m^3.K]"
                                                                                annotation (Dialog(group = "side A"));
        parameter Real rhomcm_B "Metal heat capacity per unit volume [J/m^3.K]"
                                                                                annotation (Dialog(group = "side B"));
        parameter SI.ThermalConductivity lambda
          "Thermal conductivity of the metal (density by specific heat capacity)";

        //Initialization
        parameter SI.Temperature Tstartbar_G
          "Start value of the average gas temperature"   annotation(Dialog(tab = "Initialization"));
        parameter SI.Pressure pstart_G=gasNomPressure
          "Pressure start value, gas side"
            annotation(Dialog(tab = "Initialization"));
        //A
        parameter SI.Temperature Tstartbar_M_A = Tstartbar_G-50
          "Start value of the average metal temperature"   annotation(Dialog(tab = "Initialization",group = "side A"));
        parameter SI.Pressure pstart_F_A=50e5 "Pressure start value"
                                                                    annotation(Dialog(tab="Initialization",group="side A"));
        //B
        parameter SI.Temperature Tstartbar_M_B = Tstartbar_G-50
          "Start value of the average metal temperature"   annotation(Dialog(tab = "Initialization",group = "side B"));
        parameter SI.Pressure pstart_F_B=50e5 "Pressure start value"
                                                                    annotation(Dialog(tab="Initialization",group="side B"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));

        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-40,80},{-40,60},{-10,60},{-10,42},{-42,20},{20,-20},{
                    -10,-40},{-10,-60},{-40,-60},{-40,-80}},
                color={0,0,255},
                thickness=0.5),
              Line(
                points={{40,80},{40,60},{10,60},{10,40},{-20,20},{42,-20},{10,
                    -40},{10,-60},{40,-60},{40,-80}},
                color={0,0,255},
                thickness=0.5),
              Text(
                extent={{-100,-115},{100,-145}},
                lineColor={85,170,255},
                textString=
                     "%name")}));
      end ParallelHE;

      partial model ParallelHE_Des
        "Base class for parallel Heat Exchanger (two fluid with one gas) with desuperheater"

        Gas.FlangeA gasIn(            redeclare package Medium = FlueGasMedium)
                            annotation (Placement(transformation(extent={{-120,
                  -20},{-80,20}}, rotation=0)));
        Gas.FlangeB gasOut(            redeclare package Medium = FlueGasMedium)
                            annotation (Placement(transformation(extent={{80,
                  -20},{120,20}}, rotation=0)));
        Water.FlangeA waterInA(            redeclare package Medium =
              FluidMedium) "water/steam first inlet"
          annotation (Placement(transformation(extent={{-60,80},{-20,120}},
                rotation=0)));
        Water.FlangeB waterOutA(            redeclare package Medium =
              FluidMedium) "water/steam first outlet"
          annotation (Placement(transformation(extent={{-60,-120},{-20,-80}},
                rotation=0)));
        Water.FlangeA waterInB(            redeclare package Medium =
              FluidMedium) "water/steam second inlet "
          annotation (Placement(transformation(extent={{20,80},{60,120}},
                rotation=0)));
        Water.FlangeB waterOutB(            redeclare package Medium =
              FluidMedium) "water/steam second outlet"
          annotation (Placement(transformation(extent={{20,-120},{60,-80}},
                rotation=0)));
        Water.FlangeA LiquidWaterIn_A(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-110,-52},{-90,-32}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput T_intermedA
          "Intermediate temperature of the HE_A"
          annotation (Placement(transformation(extent={{94,52},{108,66}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput T_intermedB
          "Intermediate temperature of the HE_B"
          annotation (Placement(transformation(extent={{94,32},{108,46}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealInput theta_valveA
          annotation (Placement(transformation(extent={{108,-50},{94,-34}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealInput theta_valveB
          annotation (Placement(transformation(extent={{108,-70},{94,-56}},
                rotation=0)));
        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Nominal parameter
        parameter SI.MassFlowRate gasNomFlowRate
          "Nominal flow rate through the gas side";
        parameter SI.MassFlowRate fluidNomFlowRate_A
          "Nominal flow rate through the fluid side "    annotation (Dialog(group = "side A"));
        parameter SI.MassFlowRate fluidNomFlowRate_B
          "Nominal flow rate through the fluid side"     annotation (Dialog(group = "side B"));
        parameter SI.Pressure gasNomPressure
          "Nominal pressure in the gas side inlet";
        parameter SI.Pressure fluidNomPressure_A
          "Nominal pressure in the fluid side inlet"     annotation (Dialog(group = "side A"));
        parameter SI.Pressure fluidNomPressure_B
          "Nominal pressure in the fluid side inlet"     annotation (Dialog(group = "side B"));

        //Other common parameter
        parameter SI.ThermalConductivity lambda
          "Thermal conductivity of the metal (density by specific heat capacity)";

        //Parameter for first parallel heat exchangers
        parameter Integer N_G_p1=2 "Number of node of the gas side"
                                                                  annotation (Dialog(tab = "pHE-1"));
        parameter Integer N_F_A_p1=2 "Number of node of the fluid side"   annotation (Dialog(tab = "pHE-1",
                                                                                             group = "side A"));
        parameter Integer N_F_B_p1=2 "Number of node of the fluid side"   annotation (Dialog(tab = "pHE-1",
                                                                                             group = "side B"));
        //Physical Parameter
        parameter SI.Area exchSurface_G_A_p1
          "Exchange surface between gas - metal tube,"     annotation (Dialog(tab = "pHE-1",
                                                                              group = "side A"));
        parameter SI.Area exchSurface_G_B_p1
          "Exchange surface between gas - metal tube,"     annotation (Dialog(tab = "pHE-1",
                                                                              group = "side B"));
        parameter SI.Area exchSurface_F_A_p1
          "Exchange surface between metal tube - fluid,"     annotation (Dialog(tab = "pHE-1",
                                                                                group = "side A"));
        parameter SI.Area exchSurface_F_B_p1
          "Exchange surface between metal tube - fluid,"     annotation (Dialog(tab = "pHE-1",
                                                                                group = "side B"));
        parameter SI.Area extSurfaceTub_A_p1
          "Total external surface of the tubes"                                        annotation (Dialog(tab = "pHE-1",
                                                                                                    group = "side A"));
        parameter SI.Area extSurfaceTub_B_p1
          "Total external surface of the tubes"                                        annotation (Dialog(tab = "pHE-1",
                                                                                                    group = "side B"));
        parameter SI.Volume gasVol_p1 "Gas volume" annotation (Dialog(tab = "pHE-1"));
        parameter SI.Volume fluidVol_A_p1 "Fluid volume"     annotation (Dialog(tab = "pHE-1",
                                                                                group = "side A"));
        parameter SI.Volume fluidVol_B_p1 "Fluid volume"     annotation (Dialog(tab = "pHE-1",
                                                                                group = "side B"));
        parameter SI.Volume metalVol_A_p1
          "Volume of the metal part in the tube"                                     annotation (Dialog(tab = "pHE-1",
                                                                                                    group = "side A"));
        parameter SI.Volume metalVol_B_p1
          "Volume of the metal part in the tube"                                     annotation (Dialog(tab = "pHE-1",
                                                                                                    group = "side B"));
        parameter Real rhomcm_A_p1
          "Metal heat capacity per unit volume [J/m^3.K]"                          annotation (Dialog(tab = "pHE-1",
                                                                                                    group = "side A"));
        parameter Real rhomcm_B_p1
          "Metal heat capacity per unit volume [J/m^3.K]"                          annotation (Dialog(tab = "pHE-1",
                                                                                                    group = "side B"));

        //Parameter for second parallel heat exchangers
        parameter Integer N_G_p2=2 "Number of node of the gas side"
                                                                  annotation (Dialog(tab = "pHE-2"));
        parameter Integer N_F_A_p2=2 "Number of node of the fluid side"   annotation (Dialog(tab = "pHE-2",
                                                                                             group = "side A"));
        parameter Integer N_F_B_p2=2 "Number of node of the fluid side"   annotation (Dialog(tab = "pHE-2",
                                                                                             group = "side B"));
        //Physical Parameter
        parameter SI.Area exchSurface_G_A_p2
          "Exchange surface between gas - metal tube,"     annotation (Dialog(tab = "pHE-2",
                                                                              group = "side A"));
        parameter SI.Area exchSurface_G_B_p2
          "Exchange surface between gas - metal tube,"     annotation (Dialog(tab = "pHE-2",
                                                                              group = "side B"));
        parameter SI.Area exchSurface_F_A_p2
          "Exchange surface between metal tube - fluid,"     annotation (Dialog(tab = "pHE-2",
                                                                                group = "side A"));
        parameter SI.Area exchSurface_F_B_p2
          "Exchange surface between metal tube - fluid,"     annotation (Dialog(tab = "pHE-2",
                                                                                group = "side B"));
        parameter SI.Area extSurfaceTub_A_p2
          "Total external surface of the tubes"                                        annotation (Dialog(tab = "pHE-2",
                                                                                                    group = "side A"));
        parameter SI.Area extSurfaceTub_B_p2
          "Total external surface of the tubes"                                        annotation (Dialog(tab = "pHE-2",
                                                                                                    group = "side B"));
        parameter SI.Volume gasVol_p2 "Gas volume" annotation (Dialog(tab = "pHE-2"));
        parameter SI.Volume fluidVol_A_p2 "Fluid volume"     annotation (Dialog(tab = "pHE-2",
                                                                                group = "side A"));
        parameter SI.Volume fluidVol_B_p2 "Fluid volume"     annotation (Dialog(tab = "pHE-2",
                                                                                group = "side B"));
        parameter SI.Volume metalVol_A_p2
          "Volume of the metal part in the tube"                                     annotation (Dialog(tab = "pHE-2",
                                                                                                    group = "side A"));
        parameter SI.Volume metalVol_B_p2
          "Volume of the metal part in the tube"                                     annotation (Dialog(tab = "pHE-2",
                                                                                                    group = "side B"));
        parameter Real rhomcm_A_p2
          "Metal heat capacity per unit volume [J/m^3.K]"                          annotation (Dialog(tab = "pHE-2",
                                                                                                    group = "side A"));
        parameter Real rhomcm_B_p2
          "Metal heat capacity per unit volume [J/m^3.K]"                          annotation (Dialog(tab = "pHE-2",
                                                                                                    group = "side B"));

        //Initialization
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));

        //Start value pHE1
        parameter SI.Temperature Tstartbar_G_p1
          "Start value of the averaget gas temperature"
                                                 annotation(Dialog(tab = "Initialization (pHE-1)"));
        parameter SI.Pressure pstart_G_p1=gasNomPressure
          "Pressure start value, gas side" annotation(Dialog(tab = "Initialization (pHE-1)"));
        //A
        parameter SI.Temperature Tstartbar_M_A_p1= Tstartbar_G_p1-50
          "Start value of the averaget metal temperature"
            annotation(Dialog(tab = "Initialization (pHE-1)",
                              group = "side A"));
        parameter SI.Pressure pstart_F_A_p1=1e5 "Pressure start value"
            annotation(Dialog(tab = "Initialization (pHE-1)",
                              group = "side A"));
        //B
        parameter SI.Temperature Tstartbar_M_B_p1=Tstartbar_G_p1-50
          "Start value of the averaget metal temperature"
            annotation(Dialog(tab = "Initialization (pHE-1)",
                              group = "side B"));
        parameter SI.Pressure pstart_F_B_p1=1e5 "Pressure start value"
            annotation(Dialog(tab = "Initialization (pHE-1)",
                              group = "side B"));

        //Start value pHE2
        parameter SI.Temperature Tstartbar_G_p2
          "Start value of the averaget gas temperature"
                                                 annotation(Dialog(tab = "Initialization (pHE-2)"));
        parameter SI.Pressure pstart_G_p2=gasNomPressure
          "Pressure start value, gas side" annotation(Dialog(tab = "Initialization (pHE-2)"));
        //A
        parameter SI.Temperature Tstartbar_M_A_p2=Tstartbar_G_p2-50
          "Start value of the averaget metal temperature"
            annotation(Dialog(tab = "Initialization (pHE-2)",
                              group = "side A"));
        parameter SI.Pressure pstart_F_A_p2=1e5 "Pressure start value"
            annotation(Dialog(tab = "Initialization (pHE-2)",
                              group = "side A"));
        //B
        parameter SI.Temperature Tstartbar_M_B_p2=Tstartbar_G_p2-50
          "Start value of the averaget metal temperature"
            annotation(Dialog(tab = "Initialization (pHE-2)",
                              group = "side B"));
        parameter SI.Pressure pstart_F_B_p2=1e5 "Pressure start value"
            annotation(Dialog(tab = "Initialization (pHE-2)",
                              group = "side B"));

        Water.FlangeA LiquidWaterIn_B(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-110,-80},{-90,-60}},
                rotation=0)));
        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-40,80},{-40,60},{-10,60},{-10,42},{-42,20},{20,-20},{
                    -10,-40},{-10,-60},{-40,-60},{-40,-80}},
                color={0,0,255},
                thickness=0.5),
              Line(
                points={{40,80},{40,60},{10,60},{10,40},{-20,20},{42,-20},{10,
                    -40},{10,-60},{40,-60},{40,-80}},
                color={0,0,255},
                thickness=0.5),
              Text(
                extent={{-100,-115},{100,-145}},
                lineColor={85,170,255},
                textString=
                     "%name"),
              Polygon(
                points={{-58,-40},{-68,-32},{-46,-26},{-56,-18},{-58,-40}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-42,-54},{-52,-46},{-30,-40},{-40,-32},{-42,-54}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-48,-50},{-68,-70},{-96,-70},{-98,-70}}, color={0,0,
                    255}),
              Line(points={{-62,-36},{-68,-42},{-100,-42},{-102,-42}}, color={0,
                    0,255})}));
      end ParallelHE_Des;

      partial model HEG_2L
        "Base class for Heat Exchangers Group with two pressure levels and desuperheater"

        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Common Parameter
        parameter SI.MassFlowRate gasNomFlowRate
          "Nominal flow rate through the gas side";
        parameter SI.Pressure gasNomPressure
          "Nominal pressure in the gas side inlet";

        //Nominal parameter
        parameter SI.MassFlowRate fluidHPNomFlowRate_Sh "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Pressure fluidHPNomPressure_Sh "Nominal pressure" annotation (Dialog(tab = "HP", group= "Sh"));
        parameter SI.MassFlowRate fluidHPNomFlowRate_Ev "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Pressure fluidHPNomPressure_Ev "Nominal pressure" annotation (Dialog(tab = "HP", group= "Ev"));
        parameter SI.MassFlowRate fluidHPNomFlowRate_Ec "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Pressure fluidHPNomPressure_Ec "Nominal pressure" annotation (Dialog(tab = "HP", group= "Ec"));
        parameter SI.MassFlowRate fluidLPNomFlowRate_Sh "Nominal mass flowrate"
                                                                                annotation (Dialog(tab = "LP", group= "Sh"));
        parameter SI.Pressure fluidLPNomPressure_Sh "Nominal pressure" annotation (Dialog(tab = "LP", group= "Sh"));
        parameter SI.MassFlowRate fluidLPNomFlowRate_Ev "Nominal mass flowrate"
                                                                                annotation (Dialog(tab = "LP", group= "Ev"));
        parameter SI.Pressure fluidLPNomPressure_Ev "Nominal pressure" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.MassFlowRate fluidLPNomFlowRate_Ec "Nominal mass flowrate"
                                                                                annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Pressure fluidLPNomPressure_Ec "Nominal pressure" annotation (Dialog(tab = "LP", group = "Ec"));

        //Physical Parameter
        //Sh2_HP
        parameter Integer Sh2_HP_N_G=2 "Number of node of the gas side, Sh2"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter Integer Sh2_HP_N_F=2 "Number of node of the fluid side, Sh2"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh2_HP_exchSurface_G
          "Exchange surface between gas - metal tube, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh2_HP_exchSurface_F
          "Exchange surface between metal tube - fluid, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh2_HP_extSurfaceTub
          "Total external surface of the tubes, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh2_HP_gasVol "Gas volume, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh2_HP_fluidVol "Fluid volume, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh2_HP_metalVol
          "Volume of the metal part in the tube, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        //Sh1_HP
        parameter Integer Sh1_HP_N_G=2 "Number of node of the gas side, Sh1"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter Integer Sh1_HP_N_F=2 "Number of node of the fluid side, Sh1"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh1_HP_exchSurface_G
          "Exchange surface between gas - metal tube, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh1_HP_exchSurface_F
          "Exchange surface between metal tube - fluid, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh1_HP_extSurfaceTub
          "Total external surface of the tubes, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh1_HP_gasVol "Gas volume, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh1_HP_fluidVol "Fluid volume, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh1_HP_metalVol
          "Volume of the metal part in the tube, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        //Ev_HP
        parameter Integer Ev_HP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "HP",group = "Ev"));
        parameter Integer Ev_HP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Area Ev_HP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Area Ev_HP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Area Ev_HP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Volume Ev_HP_gasVol "Gas volume" annotation (Dialog(tab = "HP", group= "Ev"));
        parameter SI.Volume Ev_HP_fluidVol "Fluid volume" annotation (Dialog(tab = "HP", group= "Ev"));
        parameter SI.Volume Ev_HP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab= "HP", group= "Ev"));
        //Ec_HP
        parameter Integer Ec_HP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab= "HP", group= "Ec"));
        parameter Integer Ec_HP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Area Ec_HP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Area Ec_HP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Area Ec_HP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Volume Ec_HP_gasVol "Gas volume" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Volume Ec_HP_fluidVol "Fluid volume" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Volume Ec_HP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab= "HP", group= "Ec"));
        //Sh_LP
        parameter Integer Sh_LP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "LP", group = "Sh"));
        parameter Integer Sh_LP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Area Sh_LP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Area Sh_LP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Area Sh_LP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Volume Sh_LP_gasVol "Gas volume" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Volume Sh_LP_fluidVol "Fluid volume" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Volume Sh_LP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "LP", group = "Sh"));
        //Ev_LP
        parameter Integer Ev_LP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "LP", group = "Ev"));
        parameter Integer Ev_LP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Area Ev_LP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Area Ev_LP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Area Ev_LP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Volume Ev_LP_gasVol "Gas volume" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Volume Ev_LP_fluidVol "Fluid volume" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Volume Ev_LP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "LP", group = "Ev"));
        //Ec_LP
        parameter Integer Ec_LP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "LP", group = "Ec"));
        parameter Integer Ec_LP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Area Ec_LP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Area Ec_LP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Area Ec_LP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Volume Ec_LP_gasVol "Gas volume" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Volume Ec_LP_fluidVol "Fluid volume" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Volume Ec_LP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "LP", group = "Ec"));

        //Initialization conditions
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization Conditions"));

        //Start values
        //Sh2_HP
        parameter SI.Temperature Sh2_HP_Tstartbar
          "Start value of the average gas temperature - Sh2"
                                                            annotation(Dialog(tab = "Initialization (HP)", group = "Sh"));

        //Sh1_HP
        parameter SI.Temperature Sh1_HP_Tstartbar
          "Start value of the average gas temperature - Sh1"
                                                            annotation(Dialog(tab = "Initialization (HP)", group = "Sh"));

        //Ev_HP
        parameter SI.Temperature Ev_HP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (HP)", group = "Ev"));

        //Ec_HP
        parameter SI.Temperature Ec_HP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (HP)", group = "Ec"));

        //Sh_LP
        parameter SI.Temperature Sh_LP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (LP)", group = "Sh"));

        //Ev_LP
        parameter SI.Temperature Ev_LP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (LP)", group = "Ev"));

        //Ec_LP
        parameter SI.Temperature Ec_LP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (LP)", group = "Ec"));

        Water.FlangeA Sh_HP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-294,186},{-266,214}},
                rotation=0)));
        Water.FlangeB Ev_HP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-254,186},{-226,214}},
                rotation=0)));
        Water.FlangeA Ev_HP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-214,186},{-186,214}},
                rotation=0)));
        Water.FlangeB Ec_HP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-174,186},{-146,214}},
                rotation=0)));
        Water.FlangeA Ec_HP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-134,186},{-106,214}},
                rotation=0)));
        Water.FlangeB Sh_HP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-214,-214},{-186,-186}},
                rotation=0)));
        Gas.FlangeA GasIn(redeclare package Medium = FlueGasMedium)
                          annotation (Placement(transformation(extent={{-414,
                  -14},{-386,14}}, rotation=0)));
        Gas.FlangeB GasOut(redeclare package Medium = FlueGasMedium)
                           annotation (Placement(transformation(extent={{386,
                  -14},{414,14}}, rotation=0)));
        Water.FlangeA Sh_LP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{46,186},{74,214}},
                rotation=0)));
        Water.FlangeB Ev_LP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{86,186},{114,214}},
                rotation=0)));
        Water.FlangeA Ev_LP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{126,186},{154,214}},
                rotation=0)));
        Water.FlangeB Ec_LP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{166,186},{194,214}},
                rotation=0)));
        Water.FlangeA Ec_LP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{206,186},{234,214}},
                rotation=0)));
        Water.FlangeB Sh_LP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{126,-214},{154,-186}},
                rotation=0)));
        Buses.Sensors SensorsBus
                              annotation (Placement(transformation(extent={{380,
                  120},{420,160}}, rotation=0)));
        Buses.Actuators ActuatorsBus
                                  annotation (Placement(transformation(extent={
                  {420,60},{380,100}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-400,-200},{400,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-400,200},{400,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(points={{-120,200},{-120,-100}}, color={0,0,255}),
              Line(points={{-160,-100},{-156,-110},{-144,-120},{-136,-120},{
                    -124,-110},{-120,-100}}, color={0,0,255}),
              Line(points={{-160,200},{-160,-100}}, color={0,0,255}),
              Line(points={{-200,200},{-200,-102}}, color={0,0,255}),
              Line(points={{-240,-100},{-236,-110},{-224,-120},{-216,-120},{
                    -204,-110},{-200,-100}}, color={0,0,255}),
              Line(points={{-240,200},{-240,-100}}, color={0,0,255}),
              Line(points={{-200,-200},{-200,-140},{-280,-140},{-280,204},{-278,
                    200}}, color={0,0,255}),
              Line(
                points={{-400,80},{400,80}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,60},{400,60}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,40},{400,40}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,100},{400,100}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,0},{400,0}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-20},{400,-20}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-40},{400,-40}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,20},{400,20}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-80},{400,-80}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-100},{400,-100}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-60},{400,-60}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(points={{140,-200},{140,-140},{60,-140},{60,204},{62,200}},
                  color={0,0,255}),
              Line(points={{100,-100},{104,-110},{116,-120},{124,-120},{136,
                    -110},{140,-100}}, color={0,0,255}),
              Line(points={{100,200},{100,-102}}, color={0,0,255}),
              Line(points={{140,200},{140,-102}}, color={0,0,255}),
              Line(points={{180,200},{180,-102}}, color={0,0,255}),
              Line(points={{220,200},{220,-102}}, color={0,0,255}),
              Line(points={{180,-100},{184,-110},{196,-120},{204,-120},{216,
                    -110},{220,-100}}, color={0,0,255}),
              Polygon(points={{-126,138},{-114,138},{-120,122},{-126,138}},
                  lineColor={0,0,255}),
              Polygon(points={{-166,144},{-154,144},{-160,160},{-166,144}},
                  lineColor={0,0,255}),
              Polygon(points={{-246,144},{-234,144},{-240,160},{-246,144}},
                  lineColor={0,0,255}),
              Polygon(points={{-206,138},{-194,138},{-200,122},{-206,138}},
                  lineColor={0,0,255}),
              Polygon(points={{94,144},{106,144},{100,160},{94,144}}, lineColor=
                   {0,0,255}),
              Polygon(points={{134,138},{146,138},{140,122},{134,138}},
                  lineColor={0,0,255}),
              Polygon(points={{174,144},{186,144},{180,160},{174,144}},
                  lineColor={0,0,255}),
              Polygon(points={{214,138},{226,138},{220,122},{214,138}},
                  lineColor={0,0,255}),
              Polygon(points={{54,138},{66,138},{60,122},{54,138}}, lineColor={
                    0,0,255}),
              Polygon(points={{-286,138},{-274,138},{-280,122},{-286,138}},
                  lineColor={0,0,255})}),
                             Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-400,-200},{400,200}},
              initialScale=0.1), graphics));
      end HEG_2L;

      partial model HEG_2LRh
        "Base class for Heat Exchangers Group with two pressure levels"

        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Common Parameter
        parameter SI.MassFlowRate gasNomFlowRate
          "Nominal flow rate through the gas side";
        parameter SI.Pressure gasNomPressure
          "Nominal pressure in the gas side inlet";

        //Nominal parameter
        parameter SI.MassFlowRate fluidHPNomFlowRate_Sh "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Pressure fluidHPNomPressure_Sh "Nominal pressure" annotation (Dialog(tab = "HP", group= "Sh"));
        parameter SI.MassFlowRate fluidHPNomFlowRate_Ev "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Pressure fluidHPNomPressure_Ev "Nominal pressure" annotation (Dialog(tab = "HP", group= "Ev"));
        parameter SI.MassFlowRate fluidHPNomFlowRate_Ec "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Pressure fluidHPNomPressure_Ec "Nominal pressure" annotation (Dialog(tab = "HP", group= "Ec"));
        parameter SI.MassFlowRate fluidLPNomFlowRate_Sh "Nominal mass flowrate"
                                                                                annotation (Dialog(tab = "LP", group= "Sh"));
        parameter SI.Pressure fluidLPNomPressure_Sh "Nominal pressure" annotation (Dialog(tab = "LP", group= "Sh"));
        parameter SI.MassFlowRate fluidLPNomFlowRate_Ev "Nominal mass flowrate"
                                                                                annotation (Dialog(tab = "LP", group= "Ev"));
        parameter SI.Pressure fluidLPNomPressure_Ev "Nominal pressure" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.MassFlowRate fluidLPNomFlowRate_Ec "Nominal mass flowrate"
                                                                                annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Pressure fluidLPNomPressure_Ec "Nominal pressure" annotation (Dialog(tab = "LP", group = "Ec"));

        //Physical Parameter
        //Sh2_HP
        parameter Integer Sh2_HP_N_G=2 "Number of node of the gas side, Sh2"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter Integer Sh2_HP_N_F=2 "Number of node of the fluid side, Sh2"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh2_HP_exchSurface_G
          "Exchange surface between gas - metal tube, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh2_HP_exchSurface_F
          "Exchange surface between metal tube - fluid, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh2_HP_extSurfaceTub
          "Total external surface of the tubes, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh2_HP_gasVol "Gas volume, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh2_HP_fluidVol "Fluid volume, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh2_HP_metalVol
          "Volume of the metal part in the tube, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        //Sh1_HP
        parameter Integer Sh1_HP_N_G=2 "Number of node of the gas side, Sh1"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter Integer Sh1_HP_N_F=2 "Number of node of the fluid side, Sh1"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh1_HP_exchSurface_G
          "Exchange surface between gas - metal tube, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh1_HP_exchSurface_F
          "Exchange surface between metal tube - fluid, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh1_HP_extSurfaceTub
          "Total external surface of the tubes, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh1_HP_gasVol "Gas volume, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh1_HP_fluidVol "Fluid volume, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh1_HP_metalVol
          "Volume of the metal part in the tube, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        //Ev_HP
        parameter Integer Ev_HP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "HP",group = "Ev"));
        parameter Integer Ev_HP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Area Ev_HP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Area Ev_HP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Area Ev_HP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Volume Ev_HP_gasVol "Gas volume" annotation (Dialog(tab = "HP", group= "Ev"));
        parameter SI.Volume Ev_HP_fluidVol "Fluid volume" annotation (Dialog(tab = "HP", group= "Ev"));
        parameter SI.Volume Ev_HP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab= "HP", group= "Ev"));
        //Ec_HP
        parameter Integer Ec_HP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab= "HP", group= "Ec"));
        parameter Integer Ec_HP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Area Ec_HP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Area Ec_HP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Area Ec_HP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Volume Ec_HP_gasVol "Gas volume" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Volume Ec_HP_fluidVol "Fluid volume" annotation (Dialog(tab= "HP", group= "Ec"));
        parameter SI.Volume Ec_HP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab= "HP", group= "Ec"));
        //Rh2_IP
        parameter Integer Rh2_IP_N_G=2 "Number of node of the gas side, Rh2"
            annotation (Dialog(tab = "IP", group = "Rh"));
        parameter Integer Rh2_IP_N_F=2 "Number of node of the fluid side, Rh2"
            annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh2_IP_exchSurface_G
          "Exchange surface between gas - metal tube, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh2_IP_exchSurface_F
          "Exchange surface between metal tube - fluid, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh2_IP_extSurfaceTub
          "Total external surface of the tubes, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh2_IP_gasVol "Gas volume, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh2_IP_fluidVol "Fluid volume, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh2_IP_metalVol
          "Volume of the metal part in the tube, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        //Rh1_IP
        parameter Integer Rh1_IP_N_G=2 "Number of node of the gas side, Rh1"  annotation (Dialog(tab = "IP", group = "Rh"));
        parameter Integer Rh1_IP_N_F=2 "Number of node of the fluid side, Rh1"  annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh1_IP_exchSurface_G
          "Exchange surface between gas - metal tube, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh1_IP_exchSurface_F
          "Exchange surface between metal tube - fluid, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh1_IP_extSurfaceTub
          "Total external surface of the tubes, Rh1"                                      annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh1_IP_gasVol "Gas volume, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh1_IP_fluidVol "Fluid volume, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh1_IP_metalVol
          "Volume of the metal part in the tube, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        //Sh_LP
        parameter Integer Sh_LP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "LP", group = "Sh"));
        parameter Integer Sh_LP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Area Sh_LP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Area Sh_LP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Area Sh_LP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Volume Sh_LP_gasVol "Gas volume" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Volume Sh_LP_fluidVol "Fluid volume" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Volume Sh_LP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "LP", group = "Sh"));
        //Ev_LP
        parameter Integer Ev_LP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "LP", group = "Ev"));
        parameter Integer Ev_LP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Area Ev_LP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Area Ev_LP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Area Ev_LP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Volume Ev_LP_gasVol "Gas volume" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Volume Ev_LP_fluidVol "Fluid volume" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Volume Ev_LP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "LP", group = "Ev"));
        //Ec_LP
        parameter Integer Ec_LP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "LP", group = "Ec"));
        parameter Integer Ec_LP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Area Ec_LP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Area Ec_LP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Area Ec_LP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Volume Ec_LP_gasVol "Gas volume" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Volume Ec_LP_fluidVol "Fluid volume" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Volume Ec_LP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "LP", group = "Ec"));

       //Initialization conditions
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization Conditions"));

        //Start values
        //Sh2_HP
        parameter SI.Temperature Sh2_HP_Tstartbar
          "Start value of the average gas temperature - Sh2"
                                                            annotation(Dialog(tab = "Initialization (HP)", group = "Sh"));

        //Sh1_HP
        parameter SI.Temperature Sh1_HP_Tstartbar
          "Start value of the average gas temperature - Sh1"
                                                            annotation(Dialog(tab = "Initialization (HP)", group = "Sh"));

        //Ev_HP
        parameter SI.Temperature Ev_HP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (HP)", group = "Ev"));

        //Ec_HP
        parameter SI.Temperature Ec_HP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (HP)", group = "Ec"));

        //Rh2_IP
        parameter SI.Temperature Rh2_IP_Tstartbar
          "Start value of the average gas temperature - Rh2"                                      annotation(Dialog(tab = "Initialization (IP)", group = "Rh"));

        //Rh1_HP
        parameter SI.Temperature Rh1_IP_Tstartbar
          "Start value of the average gas temperature - Rh1"                                      annotation(Dialog(tab = "Initialization (IP)", group = "Rh"));

        //Sh_LP
        parameter SI.Temperature Sh_LP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (LP)", group = "Sh"));

        //Ev_LP
        parameter SI.Temperature Ev_LP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (LP)", group = "Ev"));

        //Ec_LP
        parameter SI.Temperature Ec_LP_Tstartbar
          "Start value of the average gas temperature"                                      annotation(Dialog(tab = "Initialization (LP)", group = "Ec"));

        Water.FlangeA Sh_HP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-294,186},{-266,214}},
                rotation=0)));
        Water.FlangeB Ev_HP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-254,186},{-226,214}},
                rotation=0)));
        Water.FlangeA Ev_HP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-214,186},{-186,214}},
                rotation=0)));
        Water.FlangeB Ec_HP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-174,186},{-146,214}},
                rotation=0)));
        Water.FlangeA Ec_HP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-134,186},{-106,214}},
                rotation=0)));
        Water.FlangeB Sh_HP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-214,-214},{-186,-186}},
                rotation=0)));
        Gas.FlangeA GasIn(redeclare package Medium = FlueGasMedium)
                          annotation (Placement(transformation(extent={{-414,
                  -14},{-386,14}}, rotation=0)));
        Gas.FlangeA GasOut(redeclare package Medium = FlueGasMedium)
                           annotation (Placement(transformation(extent={{386,
                  -14},{414,14}}, rotation=0)));
        Water.FlangeA Sh_LP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{46,186},{74,214}},
                rotation=0)));
        Water.FlangeB Ev_LP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{86,186},{114,214}},
                rotation=0)));
        Water.FlangeA Ev_LP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{126,186},{154,214}},
                rotation=0)));
        Water.FlangeB Ec_LP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{166,186},{194,214}},
                rotation=0)));
        Water.FlangeA Ec_LP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{206,186},{234,214}},
                rotation=0)));
        Water.FlangeA Rh_IP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-14,-214},{14,-186}},
                rotation=0)));
        Water.FlangeB Rh_IP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-74,-214},{-46,-186}},
                rotation=0)));
        Water.FlangeB Sh_LP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{126,-214},{154,-186}},
                rotation=0)));
        Buses.Sensors SensorsBus
                              annotation (Placement(transformation(extent={{380,
                  120},{420,160}}, rotation=0)));
        Buses.Actuators ActuatorsBus
                                  annotation (Placement(transformation(extent={
                  {420,60},{380,100}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-400,-200},{400,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-400,200},{400,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(points={{-120,200},{-120,-100}}, color={0,0,255}),
              Line(points={{-160,-100},{-156,-110},{-144,-120},{-136,-120},{
                    -124,-110},{-120,-100}}, color={0,0,255}),
              Line(points={{-160,200},{-160,-100}}, color={0,0,255}),
              Line(points={{-200,200},{-200,-100}}, color={0,0,255}),
              Line(points={{-240,-100},{-236,-110},{-224,-120},{-216,-120},{
                    -204,-110},{-200,-100}}, color={0,0,255}),
              Line(points={{-240,200},{-240,-100}}, color={0,0,255}),
              Line(points={{-200,-200},{-200,-140},{-280,-140},{-280,204},{-278,
                    200}}, color={0,0,255}),
              Line(
                points={{-400,80},{400,80}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,60},{400,60}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,40},{400,40}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,100},{400,100}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,0},{400,0}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-20},{400,-20}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-40},{400,-40}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,20},{400,20}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-80},{400,-80}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-100},{400,-100}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-400,-60},{400,-60}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(points={{-60,100},{-50,114},{-34,120},{-26,120},{-10,114},{0,
                    100}}, color={0,0,255}),
              Line(points={{-60,100},{-60,-198}}, color={0,0,255}),
              Line(points={{0,100},{0,-198}}, color={0,0,255}),
              Line(points={{140,-200},{140,-140},{60,-140},{60,204},{62,200}},
                  color={0,0,255}),
              Line(points={{100,-100},{104,-110},{116,-120},{124,-120},{136,
                    -110},{140,-100}}, color={0,0,255}),
              Line(points={{100,200},{100,-100}}, color={0,0,255}),
              Line(points={{140,200},{140,-100}}, color={0,0,255}),
              Line(points={{180,202},{180,-100}}, color={0,0,255}),
              Line(points={{220,202},{220,-100}}, color={0,0,255}),
              Line(points={{180,-100},{184,-110},{196,-120},{204,-120},{216,
                    -110},{220,-100}}, color={0,0,255}),
              Polygon(points={{-286,138},{-274,138},{-280,122},{-286,138}},
                  lineColor={0,0,255}),
              Polygon(points={{-246,144},{-234,144},{-240,160},{-246,144}},
                  lineColor={0,0,255}),
              Polygon(points={{-206,138},{-194,138},{-200,122},{-206,138}},
                  lineColor={0,0,255}),
              Polygon(points={{-166,144},{-154,144},{-160,160},{-166,144}},
                  lineColor={0,0,255}),
              Polygon(points={{-126,138},{-114,138},{-120,122},{-126,138}},
                  lineColor={0,0,255}),
              Polygon(points={{54,138},{66,138},{60,122},{54,138}}, lineColor={
                    0,0,255}),
              Polygon(points={{94,144},{106,144},{100,160},{94,144}}, lineColor=
                   {0,0,255}),
              Polygon(points={{134,138},{146,138},{140,122},{134,138}},
                  lineColor={0,0,255}),
              Polygon(points={{174,144},{186,144},{180,160},{174,144}},
                  lineColor={0,0,255}),
              Polygon(points={{214,138},{226,138},{220,122},{214,138}},
                  lineColor={0,0,255}),
              Polygon(points={{-66,-142},{-54,-142},{-60,-158},{-66,-142}},
                  lineColor={0,0,255}),
              Polygon(points={{-6,-136},{6,-136},{0,-120},{-6,-136}}, lineColor=
                   {0,0,255}),
              Text(
                extent={{-78,-132},{22,-152}},
                lineColor={0,0,255},
                lineThickness=0.5,
                textString=
                     "Rh")}),Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-400,-200},{400,200}},
              initialScale=0.1), graphics));
      end HEG_2LRh;

      partial model HEG_3LRh
        "Base class for Heat Exchangers Group with three pressure levels and reheat"

        Water.FlangeA Sh_HP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-394,186},{-366,214}},
                rotation=0)));
        Water.FlangeB Ev_HP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-354,186},{-326,214}},
                rotation=0)));
        Water.FlangeA Ev_HP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-314,186},{-286,214}},
                rotation=0)));
        Water.FlangeB Ec_HP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-274,186},{-246,214}},
                rotation=0)));
        Water.FlangeA Ec_HP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-234,186},{-206,214}},
                rotation=0)));
        Water.FlangeA Sh_IP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-94,186},{-66,214}},
                rotation=0)));
        Water.FlangeB Ev_IP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-54,186},{-26,214}},
                rotation=0)));
        Water.FlangeA Ev_IP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-14,186},{14,214}},
                rotation=0)));
        Water.FlangeB Ec_IP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{26,186},{54,214}},
                rotation=0)));
        Water.FlangeA Ec_IP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{66,186},{94,214}},
                rotation=0)));
        Water.FlangeB Sh_HP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-314,-214},{-286,-186}},
                rotation=0)));
        Gas.FlangeA GasIn(redeclare package Medium = FlueGasMedium)
                          annotation (Placement(transformation(extent={{-514,
                  -14},{-486,14}}, rotation=0)));
        Gas.FlangeB GasOut(redeclare package Medium = FlueGasMedium)
                           annotation (Placement(transformation(extent={{486,
                  -14},{514,14}}, rotation=0)));
        Water.FlangeA Sh_LP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{206,186},{234,214}},
                rotation=0)));
        Water.FlangeB Ev_LP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{246,186},{274,214}},
                rotation=0)));
        Water.FlangeA Ev_LP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{286,186},{314,214}},
                rotation=0)));
        Water.FlangeB Ec_LP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{326,186},{354,214}},
                rotation=0)));
        Water.FlangeA Ec_LP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{366,186},{394,214}},
                rotation=0)));
        Water.FlangeA Rh_IP_In(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-144,-214},{-116,-186}},
                rotation=0)));
        Water.FlangeB Rh_IP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-204,-214},{-176,-186}},
                rotation=0)));
        Water.FlangeB Sh_LP_Out(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{286,-212},{314,-184}},
                rotation=0)));
        Buses.Sensors SensorsBus
                              annotation (Placement(transformation(extent={{480,
                  120},{520,160}}, rotation=0)));
        Buses.Actuators ActuatorsBus
                                  annotation (Placement(transformation(extent={
                  {520,60},{480,100}}, rotation=0)));
        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Common Parameter
        parameter SI.MassFlowRate gasNomFlowRate
          "Nominal flow rate through the gas side";
        parameter SI.Pressure gasNomPressure
          "Nominal pressure in the gas side inlet";

        //Nominal parameter
        parameter SI.MassFlowRate fluidHPNomFlowRate_Sh "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "HP", group = "Sh"));
        parameter SI.Pressure fluidHPNomPressure_Sh "Nominal pressure" annotation (Dialog(tab= "HP", group = "Sh"));
        parameter SI.MassFlowRate fluidHPNomFlowRate_Ev "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "HP", group = "Ev"));
        parameter SI.Pressure fluidHPNomPressure_Ev "Nominal pressure" annotation (Dialog(tab= "HP", group = "Ev"));
        parameter SI.MassFlowRate fluidHPNomFlowRate_Ec "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "HP", group = "Ec"));
        parameter SI.Pressure fluidHPNomPressure_Ec "Nominal pressure" annotation (Dialog(tab= "HP", group = "Ec"));
        parameter SI.MassFlowRate fluidIPNomFlowRate_Rh "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "IP", group = "Rh"));
        parameter SI.Pressure fluidIPNomPressure_Rh "Nominal pressure" annotation (Dialog(tab= "IP", group = "Rh"));
        parameter SI.MassFlowRate fluidIPNomFlowRate_Sh "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "IP", group = "Sh"));
        parameter SI.Pressure fluidIPNomPressure_Sh "Nominal pressure" annotation (Dialog(tab= "IP", group = "Sh"));
        parameter SI.MassFlowRate fluidIPNomFlowRate_Ev "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "IP", group = "Ev"));
        parameter SI.Pressure fluidIPNomPressure_Ev "Nominal pressure" annotation (Dialog(tab= "IP", group = "Ev"));
        parameter SI.MassFlowRate fluidIPNomFlowRate_Ec "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "IP", group = "Ec"));
        parameter SI.Pressure fluidIPNomPressure_Ec "Nominal pressure" annotation (Dialog(tab= "IP", group = "Ec"));
        parameter SI.MassFlowRate fluidLPNomFlowRate_Sh "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "LP", group = "Sh"));
        parameter SI.Pressure fluidLPNomPressure_Sh "Nominal pressure" annotation (Dialog(tab= "LP", group = "Sh"));
        parameter SI.MassFlowRate fluidLPNomFlowRate_Ev "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "LP", group = "Ev"));
        parameter SI.Pressure fluidLPNomPressure_Ev "Nominal pressure" annotation (Dialog(tab= "LP", group = "Ev"));
        parameter SI.MassFlowRate fluidLPNomFlowRate_Ec "Nominal mass flowrate"
                                                                                annotation (Dialog(tab= "LP", group = "Ec"));
        parameter SI.Pressure fluidLPNomPressure_Ec "Nominal pressure" annotation (Dialog(tab= "LP", group = "Ec"));

        //Physical Parameter
        //Sh2_HP
        parameter Integer Sh2_HP_N_G=2 "Number of node of the gas side, Sh2"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter Integer Sh2_HP_N_F=2 "Number of node of the fluid side, Sh2"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh2_HP_exchSurface_G
          "Exchange surface between gas - metal tube, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh2_HP_exchSurface_F
          "Exchange surface between metal tube - fluid, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh2_HP_extSurfaceTub
          "Total external surface of the tubes, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh2_HP_gasVol "Gas volume, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh2_HP_fluidVol "Fluid volume, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh2_HP_metalVol
          "Volume of the metal part in the tube, Sh2" annotation (Dialog(tab= "HP", group= "Sh"));
        //Sh1_HP
        parameter Integer Sh1_HP_N_G=2 "Number of node of the gas side, Sh1"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter Integer Sh1_HP_N_F=2 "Number of node of the fluid side, Sh1"
            annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh1_HP_exchSurface_G
          "Exchange surface between gas - metal tube, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh1_HP_exchSurface_F
          "Exchange surface between metal tube - fluid, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Area Sh1_HP_extSurfaceTub
          "Total external surface of the tubes, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh1_HP_gasVol "Gas volume, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh1_HP_fluidVol "Fluid volume, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        parameter SI.Volume Sh1_HP_metalVol
          "Volume of the metal part in the tube, Sh1" annotation (Dialog(tab= "HP", group= "Sh"));
        //Ev_HP
        parameter Integer Ev_HP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "HP",group = "Ev"));
        parameter Integer Ev_HP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Area Ev_HP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Area Ev_HP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Area Ev_HP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab= "HP", group= "Ev"));
        parameter SI.Volume Ev_HP_gasVol "Gas volume" annotation (Dialog(tab = "HP", group= "Ev"));
        parameter SI.Volume Ev_HP_fluidVol "Fluid volume" annotation (Dialog(tab = "HP", group= "Ev"));
        parameter SI.Volume Ev_HP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab= "HP", group= "Ev"));
        //Ec2_HP
        parameter Integer Ec2_HP_N_G=2 "Number of node of the gas side, Ec2"
            annotation (Dialog(tab = "HP", group = "Ec"));
        parameter Integer Ec2_HP_N_F=2 "Number of node of the fluid side, Ec2"
            annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Area Ec2_HP_exchSurface_G
          "Exchange surface between gas - metal tube, Ec2" annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Area Ec2_HP_exchSurface_F
          "Exchange surface between metal tube - fluid, Ec2" annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Area Ec2_HP_extSurfaceTub
          "Total external surface of the tubes, Ec2"
                                                annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Volume Ec2_HP_gasVol "Gas volume, Ec2" annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Volume Ec2_HP_fluidVol "Fluid volume, Ec2" annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Volume Ec2_HP_metalVol
          "Volume of the metal part in the tube, Ec2"
                                                 annotation (Dialog(tab = "HP", group = "Ec"));
        //Ec1_HP
        parameter Integer Ec1_HP_N_G=2 "Number of node of the gas side, Ec1"
            annotation (Dialog(tab = "HP", group = "Ec"));
        parameter Integer Ec1_HP_N_F=2 "Number of node of the fluid side, Ec1"
            annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Area Ec1_HP_exchSurface_G
          "Exchange surface between gas - metal tube, Ec1" annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Area Ec1_HP_exchSurface_F
          "Exchange surface between metal tube - fluid, Ec1" annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Area Ec1_HP_extSurfaceTub
          "Total external surface of the tubes, Ec1"
                                                annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Volume Ec1_HP_gasVol "Gas volume, Ec1" annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Volume Ec1_HP_fluidVol "Fluid volume, Ec1" annotation (Dialog(tab = "HP", group = "Ec"));
        parameter SI.Volume Ec1_HP_metalVol
          "Volume of the metal part in the tube, Ec1"
                                                 annotation (Dialog(tab = "HP", group = "Ec"));
        //Rh2_IP
        parameter Integer Rh2_IP_N_G=2 "Number of node of the gas side, Rh2"
            annotation (Dialog(tab = "IP", group = "Rh"));
        parameter Integer Rh2_IP_N_F=2 "Number of node of the fluid side, Rh2"
            annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh2_IP_exchSurface_G
          "Exchange surface between gas - metal tube, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh2_IP_exchSurface_F
          "Exchange surface between metal tube - fluid, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh2_IP_extSurfaceTub
          "Total external surface of the tubes, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh2_IP_gasVol "Gas volume, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh2_IP_fluidVol "Fluid volume, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh2_IP_metalVol
          "Volume of the metal part in the tube, Rh2" annotation (Dialog(tab = "IP", group = "Rh"));
        //Rh1_IP
        parameter Integer Rh1_IP_N_G=2 "Number of node of the gas side, Rh1"  annotation (Dialog(tab = "IP", group = "Rh"));
        parameter Integer Rh1_IP_N_F=2 "Number of node of the fluid side, Rh1"  annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh1_IP_exchSurface_G
          "Exchange surface between gas - metal tube, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh1_IP_exchSurface_F
          "Exchange surface between metal tube - fluid, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Area Rh1_IP_extSurfaceTub
          "Total external surface of the tubes, Rh1"                                      annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh1_IP_gasVol "Gas volume, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh1_IP_fluidVol "Fluid volume, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        parameter SI.Volume Rh1_IP_metalVol
          "Volume of the metal part in the tube, Rh1" annotation (Dialog(tab = "IP", group = "Rh"));
        //Sh_IP
        parameter Integer Sh_IP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "IP", group = "Sh"));
        parameter Integer Sh_IP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "IP", group = "Sh"));
        parameter SI.Area Sh_IP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "IP", group = "Sh"));
        parameter SI.Area Sh_IP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "IP", group = "Sh"));
        parameter SI.Area Sh_IP_extSurfaceTub
          "Total external surface of the tube" annotation (Dialog(tab = "IP", group = "Sh"));
        parameter SI.Volume Sh_IP_gasVol "Gas volume" annotation (Dialog(tab = "IP", group = "Sh"));
        parameter SI.Volume Sh_IP_fluidVol "Fluid volume" annotation (Dialog(tab = "IP", group = "Sh"));
        parameter SI.Volume Sh_IP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "IP", group = "Sh"));
        //Ev_IP
        parameter Integer Ev_IP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "IP", group = "Ev"));
        parameter Integer Ev_IP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "IP", group = "Ev"));
        parameter SI.Area Ev_IP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "IP", group = "Ev"));
        parameter SI.Area Ev_IP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "IP", group = "Ev"));
        parameter SI.Area Ev_IP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "IP", group = "Ev"));
        parameter SI.Volume Ev_IP_gasVol "Gas volume" annotation (Dialog(tab = "IP", group = "Ev"));
        parameter SI.Volume Ev_IP_fluidVol "Fluid volume" annotation (Dialog(tab = "IP", group = "Ev"));
        parameter SI.Volume Ev_IP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "IP", group = "Ev"));
        //Ec_IP
        parameter Integer Ec_IP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "IP", group = "Ec"));
        parameter Integer Ec_IP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "IP", group = "Ec"));
        parameter SI.Area Ec_IP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "IP", group = "Ec"));
        parameter SI.Area Ec_IP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "IP", group = "Ec"));
        parameter SI.Area Ec_IP_extSurfaceTub
          "Total external surface of the tube" annotation (Dialog(tab = "IP", group = "Ec"));
        parameter SI.Volume Ec_IP_gasVol "Gas volume" annotation (Dialog(tab = "IP", group = "Ec"));
        parameter SI.Volume Ec_IP_fluidVol "Fluid volume" annotation (Dialog(tab = "IP", group = "Ec"));
        parameter SI.Volume Ec_IP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "IP", group = "Ec"));
        //Sh_LP
        parameter Integer Sh_LP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "LP", group = "Sh"));
        parameter Integer Sh_LP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Area Sh_LP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Area Sh_LP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Area Sh_LP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Volume Sh_LP_gasVol "Gas volume" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Volume Sh_LP_fluidVol "Fluid volume" annotation (Dialog(tab = "LP", group = "Sh"));
        parameter SI.Volume Sh_LP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "LP", group = "Sh"));
        //Ev_LP
        parameter Integer Ev_LP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "LP", group = "Ev"));
        parameter Integer Ev_LP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Area Ev_LP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Area Ev_LP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Area Ev_LP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Volume Ev_LP_gasVol "Gas volume" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Volume Ev_LP_fluidVol "Fluid volume" annotation (Dialog(tab = "LP", group = "Ev"));
        parameter SI.Volume Ev_LP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "LP", group = "Ev"));
        //Ec_LP
        parameter Integer Ec_LP_N_G=2 "Number of node of the gas side"
            annotation (Dialog(tab = "LP", group = "Ec"));
        parameter Integer Ec_LP_N_F=2 "Number of node of the fluid side"
            annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Area Ec_LP_exchSurface_G
          "Exchange surface between gas - metal tube" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Area Ec_LP_exchSurface_F
          "Exchange surface between metal tube - fluid" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Area Ec_LP_extSurfaceTub
          "Total external surface of the tubes" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Volume Ec_LP_gasVol "Gas volume" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Volume Ec_LP_fluidVol "Fluid volume" annotation (Dialog(tab = "LP", group = "Ec"));
        parameter SI.Volume Ec_LP_metalVol
          "Volume of the metal part in the tube" annotation (Dialog(tab = "LP", group = "Ec"));

        //Initialization conditions
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization Conditions"));

        //Start values
        //Sh2_HP
        parameter SI.Temperature Sh2_HP_Tstartbar
          "Start value of the average gas temperature - Sh2"
                                                            annotation(Dialog(tab = "Initialization (HP)", group = "Sh"));

        //Sh1_HP
        parameter SI.Temperature Sh1_HP_Tstartbar
          "Start value of the average gas temperature - Sh1"
                                                            annotation(Dialog(tab = "Initialization (HP)", group = "Sh"));

        //Ev_HP
        parameter SI.Temperature Ev_HP_Tstartbar
          "Start value of the average gas temperature"
                                                      annotation(Dialog(tab = "Initialization (HP)", group = "Ev"));

        //Ec2_HP
        parameter SI.Temperature Ec2_HP_Tstartbar
          "Start value of the average gas temperature - Ec2"
                                                            annotation(Dialog(tab = "Initialization (HP)", group = "Ec"));

        //Ec1_HP
        parameter SI.Temperature Ec1_HP_Tstartbar
          "Start value of the average gas temperature - Ec1" annotation(Dialog(tab = "Initialization (HP)", group = "Ec"));

        //Rh2_IP
        parameter SI.Temperature Rh2_IP_Tstartbar
          "Start value of the average gas temperature - Rh2"
                                                            annotation(Dialog(tab = "Initialization (IP)", group = "Rh"));

        //Rh1_HP
        parameter SI.Temperature Rh1_IP_Tstartbar
          "Start value of the average gas temperature - Rh1"
                                                            annotation(Dialog(tab = "Initialization (IP)", group = "Rh"));

        //Sh_IP
        parameter SI.Temperature Sh_IP_Tstartbar
          "Start value of the average gas temperature"
                                                      annotation(Dialog(tab = "Initialization (IP)", group = "Sh"));

        //Ev_IP
        parameter SI.Temperature Ev_IP_Tstartbar
          "Start value of the average gas temperature"
                                                      annotation(Dialog(tab = "Initialization (IP)", group = "Ev"));

        //Ec_IP
        parameter SI.Temperature Ec_IP_Tstartbar
          "Start value of the average gas temperature"
                                                      annotation(Dialog(tab = "Initialization (IP)", group = "Ec"));

        //Sh_LP
        parameter SI.Temperature Sh_LP_Tstartbar
          "Start value of the average gas temperature"
                                                      annotation(Dialog(tab = "Initialization (LP)", group = "Sh"));

        //Ev_LP
        parameter SI.Temperature Ev_LP_Tstartbar
          "Start value of the average gas temperature"
                                                      annotation(Dialog(tab = "Initialization (LP)", group = "Ev"));

        //Ec_LP
        parameter SI.Temperature Ec_LP_Tstartbar
          "Start value of the average gas temperature"
                                                      annotation(Dialog(tab = "Initialization (LP)", group = "Ec"));

        annotation (Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-500,-200},{500,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-500,200},{500,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-210,-140},{-110,-160}},
                lineColor={0,0,255},
                lineThickness=0.5,
                textString=
                     "Rh"),
              Line(points={{380,202},{380,-100}}, color={0,0,255}),
              Line(points={{340,-100},{344,-110},{356,-120},{364,-120},{376,
                    -110},{380,-100}}, color={0,0,255}),
              Line(points={{340,202},{340,-100}}, color={0,0,255}),
              Line(points={{300,202},{300,-100}}, color={0,0,255}),
              Line(points={{260,-100},{264,-110},{276,-120},{284,-120},{296,
                    -110},{300,-100}}, color={0,0,255}),
              Line(points={{260,202},{260,-100}}, color={0,0,255}),
              Line(points={{80,200},{80,-100}}, color={0,0,255}),
              Line(points={{40,-100},{44,-110},{56,-120},{64,-120},{76,-110},{
                    80,-100}}, color={0,0,255}),
              Line(points={{40,202},{40,-100}}, color={0,0,255}),
              Line(points={{0,200},{0,-100}}, color={0,0,255}),
              Line(points={{-40,-100},{-36,-110},{-24,-120},{-16,-120},{-4,-110},
                    {0,-100}}, color={0,0,255}),
              Line(points={{-40,200},{-40,-100}}, color={0,0,255}),
              Line(points={{-220,200},{-220,-100}}, color={0,0,255}),
              Line(points={{-260,-100},{-256,-110},{-244,-120},{-236,-120},{
                    -224,-110},{-220,-100}}, color={0,0,255}),
              Line(points={{-260,200},{-260,-100}}, color={0,0,255}),
              Line(points={{-300,202},{-300,-100}}, color={0,0,255}),
              Line(points={{-340,-100},{-336,-110},{-324,-120},{-316,-120},{
                    -304,-110},{-300,-100}}, color={0,0,255}),
              Line(points={{-340,200},{-340,-100}}, color={0,0,255}),
              Line(points={{-300,-200},{-300,-140},{-380,-140},{-380,204},{-378,
                    200}}, color={0,0,255}),
              Line(points={{-130,-140},{-80,-140},{-80,-140},{-80,204},{-78,200}},
                  color={0,0,255}),
              Line(points={{300,-200},{300,-140},{220,-140},{220,204},{222,200}},
                  color={0,0,255}),
              Line(points={{-192,100},{-180,114},{-164,120},{-156,120},{-140,
                    114},{-130,100}}, color={0,0,255}),
              Line(points={{-130,100},{-130,-198}}, color={0,0,255}),
              Line(points={{-190,100},{-190,-198}}, color={0,0,255}),
              Line(
                points={{-500,80},{500,80}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,60},{500,60}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,40},{500,40}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,100},{500,100}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,0},{500,0}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,-20},{500,-20}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,-40},{500,-40}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,20},{500,20}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,-80},{500,-80}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,-100},{500,-100}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Line(
                points={{-500,-60},{500,-60}},
                color={170,170,255},
                pattern=LinePattern.Dash,
                thickness=0.5),
              Polygon(points={{-386,138},{-374,138},{-380,122},{-386,138}},
                  lineColor={0,0,255}),
              Polygon(points={{-346,144},{-334,144},{-340,160},{-346,144}},
                  lineColor={0,0,255}),
              Polygon(points={{-306,138},{-294,138},{-300,122},{-306,138}},
                  lineColor={0,0,255}),
              Polygon(points={{-266,144},{-254,144},{-260,160},{-266,144}},
                  lineColor={0,0,255}),
              Polygon(points={{-226,138},{-214,138},{-220,122},{-226,138}},
                  lineColor={0,0,255}),
              Polygon(points={{-86,138},{-74,138},{-80,122},{-86,138}},
                  lineColor={0,0,255}),
              Polygon(points={{-46,144},{-34,144},{-40,160},{-46,144}},
                  lineColor={0,0,255}),
              Polygon(points={{-6,138},{6,138},{0,122},{-6,138}}, lineColor={0,
                    0,255}),
              Polygon(points={{34,144},{46,144},{40,160},{34,144}}, lineColor={
                    0,0,255}),
              Polygon(points={{74,138},{86,138},{80,122},{74,138}}, lineColor={
                    0,0,255}),
              Polygon(points={{214,138},{226,138},{220,122},{214,138}},
                  lineColor={0,0,255}),
              Polygon(points={{254,144},{266,144},{260,160},{254,144}},
                  lineColor={0,0,255}),
              Polygon(points={{294,138},{306,138},{300,122},{294,138}},
                  lineColor={0,0,255}),
              Polygon(points={{334,144},{346,144},{340,160},{334,144}},
                  lineColor={0,0,255}),
              Polygon(points={{374,138},{386,138},{380,122},{374,138}},
                  lineColor={0,0,255}),
              Polygon(points={{-196,-144},{-184,-144},{-190,-160},{-196,-144}},
                  lineColor={0,0,255}),
              Polygon(points={{-136,-170},{-124,-170},{-130,-154},{-136,-170}},
                  lineColor={0,0,255}),
              Polygon(points={{-136,-124},{-124,-124},{-130,-108},{-136,-124}},
                  lineColor={0,0,255}),
              Polygon(points={{-98,-146},{-98,-134},{-114,-140},{-98,-146}},
                  lineColor={0,0,255}),
              Ellipse(
                extent={{-134,-136},{-126,-144}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-500,-200},{500,200}},
              initialScale=0.1), graphics));
      end HEG_3LRh;

      partial model DG_2L "Base class for Drums Group with two pressure levels"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Charateristics
        //HP drum
        parameter SI.Pressure fluidHPNomPressure "Nominal internal pressure"
                                                     annotation (Dialog(group = "HP drum"));
        parameter SI.Length HPd_rint "Internal radius"                annotation (Dialog(group = "HP drum"));
        parameter SI.Length HPd_rext "External radius"                annotation (Dialog(group = "HP drum"));
        parameter SI.Length HPd_L "Length"                annotation (Dialog(group = "HP drum"));
        parameter SI.HeatCapacity HPd_Cm
          "Total Heat Capacity of the metal wall"          annotation (Dialog(group = "HP drum"));
        //LP drum
        parameter SI.Pressure fluidLPNomPressure "Nominal internal pressure"
                                                     annotation (Dialog(group = "LP drum"));
        parameter SI.Length LPd_rint "Internal radius"                annotation (Dialog(group = "LP drum"));
        parameter SI.Length LPd_rext "External radius"                annotation (Dialog(group = "LP drum"));
        parameter SI.Length LPd_L "Length"                annotation (Dialog(group = "LP drum"));
        parameter SI.HeatCapacity LPd_Cm
          "Total Heat Capacity of the metal wall"          annotation (Dialog(group = "LP drum"));

        //Initialization
        parameter Boolean SSInit = false "Steady-state initialisation" annotation(Dialog(tab = "Initialisation"));
        //HP drum
        parameter SI.Pressure HPd_pstart=fluidHPNomPressure
          "Pressure start value"
          annotation(Dialog(tab = "Initialisation", group = "HP drum"));
        parameter SI.Temperature HPd_Tmstart=300
          "Metal wall temperature start value"
          annotation(Dialog(tab = "Initialisation", group = "HP drum"));
        //LP drum
        parameter SI.Pressure LPd_pstart=fluidLPNomPressure
          "Pressure start value"
          annotation(Dialog(tab = "Initialisation", group = "LP drum"));
        parameter SI.Temperature LPd_Tmstart=300
          "Metal wall temperature start value"
          annotation(Dialog(tab = "Initialisation", group = "LP drum"));

        constant Real g=Modelica.Constants.g_n;
        constant Real pi=Modelica.Constants.pi;

        Water.FlangeB Steam_HP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-294,-314},{-266,-286}},
                rotation=0)));
        Water.FlangeA Riser_HP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-254,-314},{-226,-286}},
                rotation=0)));
        Water.FlangeB Downcomer_HP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-214,-314},{-186,-286}},
                rotation=0)));
        Water.FlangeA Feed_HP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-174,-314},{-146,-286}},
                rotation=0)));
        Water.FlangeB WaterForHP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-134,-314},{-106,-286}},
                rotation=0)));
        Water.FlangeB Steam_LP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{46,-314},{74,-286}},
                rotation=0)));
        Water.FlangeA Riser_LP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{86,-314},{114,-286}},
                rotation=0)));
        Water.FlangeB Downcomer_LP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{126,-314},{154,-286}},
                rotation=0)));
        Water.FlangeA Feed_LP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{166,-314},{194,-286}},
                rotation=0)));
        Buses.Sensors SensorsBus
                              annotation (Placement(transformation(extent={{380,
                  60},{420,100}}, rotation=0)));
        Buses.Actuators ActuatorsBus
                                  annotation (Placement(transformation(extent={
                  {420,0},{380,40}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-400,-300},{400,300}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-400,300},{400,-300}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(points={{140,10},{-120,10},{-120,-300}}, color={0,0,255}),
              Ellipse(
                extent={{80,80},{180,-20}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{180,-300},{180,-20},{140,30}}, color={0,0,255}),
              Line(points={{140,-300},{140,72}}, color={0,0,255}),
              Line(points={{100,-296},{100,-6}}, color={0,0,255}),
              Line(points={{60,-296},{60,-50},{60,-10},{60,80},{80,80},{130,30},
                    {130,30}}, color={0,0,255}),
              Polygon(
                points={{80,30},{180,30},{180,38},{178,48},{172,58},{166,66},{
                    158,72},{148,78},{138,80},{130,80},{122,80},{112,78},{102,
                    72},{94,66},{88,58},{82,48},{80,38},{80,38},{80,30}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-260,80},{-160,-20}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-160,-290},{-160,-20},{-200,30}}, color={0,0,255}),
              Line(points={{-200,-300},{-200,-2}}, color={0,0,255}),
              Line(points={{-240,-298},{-240,-6}}, color={0,0,255}),
              Line(points={{-280,-298},{-280,-50},{-280,-10},{-280,80},{-260,80},
                    {-210,30},{-210,30}}, color={0,0,255}),
              Polygon(
                points={{-260,30},{-160,30},{-160,38},{-162,48},{-168,58},{-174,
                    66},{-182,72},{-192,78},{-202,80},{-210,80},{-218,80},{-228,
                    78},{-238,72},{-246,66},{-252,58},{-258,48},{-260,38},{-260,
                    38},{-260,30}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-60,30},{-20,-10}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-20,10},{-60,10},{-30,28},{-60,10},{-32,-8}}, color=
                   {0,0,255}),
              Polygon(points={{-286,-204},{-274,-204},{-280,-220},{-286,-204}},
                  lineColor={0,0,255}),
              Polygon(points={{-246,-198},{-234,-198},{-240,-182},{-246,-198}},
                  lineColor={0,0,255}),
              Polygon(points={{-206,-204},{-194,-204},{-200,-220},{-206,-204}},
                  lineColor={0,0,255}),
              Polygon(points={{-166,-198},{-154,-198},{-160,-182},{-166,-198}},
                  lineColor={0,0,255}),
              Polygon(points={{-126,-204},{-114,-204},{-120,-220},{-126,-204}},
                  lineColor={0,0,255}),
              Polygon(points={{54,-204},{66,-204},{60,-220},{54,-204}},
                  lineColor={0,0,255}),
              Polygon(points={{94,-198},{106,-198},{100,-182},{94,-198}},
                  lineColor={0,0,255}),
              Polygon(points={{134,-204},{146,-204},{140,-220},{134,-204}},
                  lineColor={0,0,255}),
              Polygon(points={{174,-198},{186,-198},{180,-182},{174,-198}},
                  lineColor={0,0,255})}),
                             Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-400,-300},{400,300}},
              initialScale=0.1), graphics));

      end DG_2L;

      partial model DG_3L_s
        "Base class for Drums Group with three pressure levels, series feedwater pumps"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Charateristics
        //HP drum
        parameter SI.Pressure fluidHPNomPressure "Nominal internal pressure"
                                                     annotation (Dialog(group = "HP drum"));
        parameter SI.Length HPd_rint "Internal radius"                annotation (Dialog(group = "HP drum"));
        parameter SI.Length HPd_rext "External radius"                annotation (Dialog(group = "HP drum"));
        parameter SI.Length HPd_L "Length"                annotation (Dialog(group = "HP drum"));
        parameter SI.HeatCapacity HPd_Cm
          "Total Heat Capacity of the metal wall"          annotation (Dialog(group = "HP drum"));
        //IP drum
        parameter SI.Pressure fluidIPNomPressure "Nominal internal pressure"
                                                     annotation (Dialog(group = "IP drum"));
        parameter SI.Length IPd_rint "Internal radius"                annotation (Dialog(group = "IP drum"));
        parameter SI.Length IPd_rext "External radius"                annotation (Dialog(group = "IP drum"));
        parameter SI.Length IPd_L "Length"                annotation (Dialog(group = "IP drum"));
        parameter SI.HeatCapacity IPd_Cm
          "Total Heat Capacity of the metal wall"          annotation (Dialog(group = "IP drum"));
        //LP drum
        parameter SI.Pressure fluidLPNomPressure "Nominal internal pressure"
                                                     annotation (Dialog(group = "LP drum"));
        parameter SI.Length LPd_rint "Internal radius"                annotation (Dialog(group = "LP drum"));
        parameter SI.Length LPd_rext "External radius"                annotation (Dialog(group = "LP drum"));
        parameter SI.Length LPd_L "Length"                annotation (Dialog(group = "LP drum"));
        parameter SI.HeatCapacity LPd_Cm
          "Total Heat Capacity of the metal wall"          annotation (Dialog(group = "LP drum"));

        //Initialization
        parameter Boolean SSInit = false "Steady-state initialisation" annotation(Dialog(tab = "Initialisation"));
        //HP drum
        parameter SI.Pressure HPd_pstart=fluidHPNomPressure
          "Pressure start value"
          annotation(Dialog(tab = "Initialisation", group = "HP drum"));
        parameter SI.Temperature HPd_Tmstart=300
          "Metal wall temperature start value"
          annotation(Dialog(tab = "Initialisation", group = "HP drum"));
        //IP drum
        parameter SI.Pressure IPd_pstart=fluidIPNomPressure
          "Pressure start value"
          annotation(Dialog(tab = "Initialisation", group = "IP drum"));
        parameter SI.Temperature IPd_Tmstart=300
          "Metal wall temperature start value"
          annotation(Dialog(tab = "Initialisation", group = "IP drum"));
        //LP drum
        parameter SI.Pressure LPd_pstart=fluidLPNomPressure
          "Pressure start value"
          annotation(Dialog(tab = "Initialisation", group = "LP drum"));
        parameter SI.Temperature LPd_Tmstart=300
          "Metal wall temperature start value"
          annotation(Dialog(tab = "Initialisation", group = "LP drum"));

        constant Real g=Modelica.Constants.g_n;
        constant Real pi=Modelica.Constants.pi;

        Water.FlangeB Steam_HP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-394,-314},{-366,-286}},
                rotation=0)));
        Water.FlangeA Riser_HP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-354,-314},{-326,-286}},
                rotation=0)));
        Water.FlangeB Downcomer_HP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-314,-314},{-286,-286}},
                rotation=0)));
        Water.FlangeA Feed_HP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-274,-314},{-246,-286}},
                rotation=0)));
        Water.FlangeB WaterForHP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-234,-314},{-206,-286}},
                rotation=0)));
        Water.FlangeB Steam_IP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-94,-314},{-66,-286}},
                rotation=0)));
        Water.FlangeA Riser_IP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-54,-314},{-26,-286}},
                rotation=0)));
        Water.FlangeB Downcomer_IP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-14,-314},{14,-286}},
                rotation=0)));
        Water.FlangeA Feed_IP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{26,-314},{54,-286}},
                rotation=0)));
        Water.FlangeB WaterForIP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{66,-314},{94,-286}},
                rotation=0)));
        Water.FlangeB Steam_LP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{206,-314},{234,-286}},
                rotation=0)));
        Water.FlangeA Riser_LP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{246,-314},{274,-286}},
                rotation=0)));
        Water.FlangeB Downcomer_LP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{286,-314},{314,-286}},
                rotation=0)));
        Water.FlangeA Feed_LP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{326,-314},{354,-286}},
                rotation=0)));
        Buses.Sensors SensorsBus
                              annotation (Placement(transformation(extent={{480,
                  60},{520,100}}, rotation=0)));
        Buses.Actuators ActuatorsBus
                                  annotation (Placement(transformation(extent={
                  {520,0},{480,40}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-500,-300},{500,300}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-500,300},{500,-300}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{240,80},{340,-20}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{340,-302},{340,-20},{300,30}}, color={0,0,255}),
              Line(points={{300,-300},{300,-2}}, color={0,0,255}),
              Line(points={{260,-300},{260,-6}}, color={0,0,255}),
              Line(points={{220,-300},{220,-50},{220,-10},{220,80},{240,80},{
                    290,30},{290,30}}, color={0,0,255}),
              Polygon(
                points={{240,30},{340,30},{340,38},{338,48},{332,58},{326,66},{
                    318,72},{308,78},{298,80},{290,80},{282,80},{272,78},{262,
                    72},{254,66},{248,58},{242,48},{240,38},{240,38},{240,30}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Line(points={{300,8},{80,8},{80,-300}}, color={0,0,255}),
              Line(points={{80,-120},{-220,-120},{-220,-302}}, color={0,0,255}),
              Ellipse(
                extent={{-60,80},{40,-20}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{40,-300},{40,-20},{0,30}}, color={0,0,255}),
              Line(points={{0,-300},{0,72}}, color={0,0,255}),
              Line(points={{-40,-296},{-40,-6}}, color={0,0,255}),
              Line(points={{-80,-296},{-80,-50},{-80,-10},{-80,80},{-60,80},{
                    -10,30},{-10,30}}, color={0,0,255}),
              Polygon(
                points={{-60,30},{40,30},{40,38},{38,48},{32,58},{26,66},{18,72},
                    {8,78},{-2,80},{-10,80},{-18,80},{-28,78},{-38,72},{-46,66},
                    {-52,58},{-58,48},{-60,38},{-60,38},{-60,30}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-360,80},{-260,-20}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-260,-290},{-260,-20},{-300,30}}, color={0,0,255}),
              Line(points={{-300,-300},{-300,-2}}, color={0,0,255}),
              Line(points={{-340,-298},{-340,-6}}, color={0,0,255}),
              Line(points={{-380,-298},{-380,-50},{-380,-10},{-380,80},{-360,80},
                    {-310,30},{-310,30}}, color={0,0,255}),
              Polygon(
                points={{-360,30},{-260,30},{-260,38},{-262,48},{-268,58},{-274,
                    66},{-282,72},{-292,78},{-302,80},{-310,80},{-318,80},{-328,
                    78},{-338,72},{-346,66},{-352,58},{-358,48},{-360,38},{-360,
                    38},{-360,30}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{132,28},{172,-12}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{172,8},{132,8},{162,26},{132,8},{160,-10}}, color={
                    0,0,255}),
              Ellipse(
                extent={{-180,-100},{-140,-140}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-140,-120},{-180,-120},{-150,-102},{-180,-120},{
                    -152,-138}}, color={0,0,255}),
              Polygon(points={{-386,-234},{-374,-234},{-380,-250},{-386,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{-346,-228},{-334,-228},{-340,-212},{-346,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{-306,-234},{-294,-234},{-300,-250},{-306,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{-266,-228},{-254,-228},{-260,-212},{-266,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{-226,-234},{-214,-234},{-220,-250},{-226,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{-86,-234},{-74,-234},{-80,-250},{-86,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{-46,-228},{-34,-228},{-40,-212},{-46,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{-6,-234},{6,-234},{0,-250},{-6,-234}}, lineColor=
                   {0,0,255}),
              Polygon(points={{34,-228},{46,-228},{40,-212},{34,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{74,-234},{86,-234},{80,-250},{74,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{214,-234},{226,-234},{220,-250},{214,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{254,-228},{266,-228},{260,-212},{254,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{294,-234},{306,-234},{300,-250},{294,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{334,-228},{346,-228},{340,-212},{334,-228}},
                  lineColor={0,0,255}),
              Ellipse(
                extent={{76,-116},{84,-124}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{74,-60},{86,-60},{80,-76},{74,-60}}, lineColor={
                    0,0,255})}),
                             Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-500,-300},{500,300}},
              initialScale=0.1), graphics));

      end DG_3L_s;

      partial model DG_3L_p
        "Base class for Drums Group with three pressure levels, parallel feedwater pumps"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Charateristics
        //HP drum
        parameter SI.Pressure fluidHPNomPressure "Nominal internal pressure"
                                                     annotation (Dialog(group = "HP drum"));
        parameter SI.Length HPd_rint "Internal radius"                annotation (Dialog(group = "HP drum"));
        parameter SI.Length HPd_rext "External radius"                annotation (Dialog(group = "HP drum"));
        parameter SI.Length HPd_L "Length"                annotation (Dialog(group = "HP drum"));
        parameter SI.HeatCapacity HPd_Cm
          "Total Heat Capacity of the metal wall"          annotation (Dialog(group = "HP drum"));
        //IP drum
        parameter SI.Pressure fluidIPNomPressure "Nominal internal pressure"
                                                     annotation (Dialog(group = "IP drum"));
        parameter SI.Length IPd_rint "Internal radius"                annotation (Dialog(group = "IP drum"));
        parameter SI.Length IPd_rext "External radius"                annotation (Dialog(group = "IP drum"));
        parameter SI.Length IPd_L "Length"                annotation (Dialog(group = "IP drum"));
        parameter SI.HeatCapacity IPd_Cm
          "Total Heat Capacity of the metal wall"          annotation (Dialog(group = "IP drum"));
        //LP drum
        parameter SI.Pressure fluidLPNomPressure "Nominal internal pressure"
                                                     annotation (Dialog(group = "LP drum"));
        parameter SI.Length LPd_rint "Internal radius"                annotation (Dialog(group = "LP drum"));
        parameter SI.Length LPd_rext "External radius"                annotation (Dialog(group = "LP drum"));
        parameter SI.Length LPd_L "Length"                annotation (Dialog(group = "LP drum"));
        parameter SI.HeatCapacity LPd_Cm
          "Total Heat Capacity of the metal wall"          annotation (Dialog(group = "LP drum"));

        //Initialization
        parameter Boolean SSInit = false "Steady-state initialisation" annotation(Dialog(tab = "Initialisation"));
        //HP drum
        parameter SI.Pressure HPd_pstart=fluidHPNomPressure
          "Pressure start value"
          annotation(Dialog(tab = "Initialisation", group = "HP drum"));

        //IP drum
        parameter SI.Pressure IPd_pstart=fluidIPNomPressure
          "Pressure start value"
          annotation(Dialog(tab = "Initialisation", group = "IP drum"));

        //LP drum
        parameter SI.Pressure LPd_pstart=fluidLPNomPressure
          "Pressure start value"
          annotation(Dialog(tab = "Initialisation", group = "LP drum"));

        constant Real g=Modelica.Constants.g_n;
        constant Real pi=Modelica.Constants.pi;

        Water.FlangeB Steam_HP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-394,-314},{-366,-286}},
                rotation=0)));
        Water.FlangeA Riser_HP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-354,-314},{-326,-286}},
                rotation=0)));
        Water.FlangeB Downcomer_HP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-314,-314},{-286,-286}},
                rotation=0)));
        Water.FlangeA Feed_HP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-274,-314},{-246,-286}},
                rotation=0)));
        Water.FlangeB WaterForHP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-234,-314},{-206,-286}},
                rotation=0)));
        Water.FlangeB Steam_IP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-94,-314},{-66,-286}},
                rotation=0)));
        Water.FlangeA Riser_IP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-54,-314},{-26,-286}},
                rotation=0)));
        Water.FlangeB Downcomer_IP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-14,-314},{14,-286}},
                rotation=0)));
        Water.FlangeA Feed_IP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{26,-314},{54,-286}},
                rotation=0)));
        Water.FlangeB WaterForIP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{66,-314},{94,-286}},
                rotation=0)));
        Water.FlangeB Steam_LP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{206,-314},{234,-286}},
                rotation=0)));
        Water.FlangeA Riser_LP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{246,-314},{274,-286}},
                rotation=0)));
        Water.FlangeB Downcomer_LP(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{286,-314},{314,-286}},
                rotation=0)));
        Water.FlangeA Feed_LP(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{326,-314},{354,-286}},
                rotation=0)));
        Buses.Sensors SensorsBus
                              annotation (Placement(transformation(extent={{480,
                  60},{520,100}}, rotation=0)));
        Buses.Actuators ActuatorsBus
                                  annotation (Placement(transformation(extent={
                  {520,0},{480,40}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-500,-300},{500,300}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-500,300},{500,-300}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{240,80},{340,-20}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{340,-302},{340,-20},{300,30}}, color={0,0,255}),
              Line(points={{300,-300},{300,-2}}, color={0,0,255}),
              Line(points={{260,-300},{260,-6}}, color={0,0,255}),
              Line(points={{220,-300},{220,-50},{220,-10},{220,80},{240,80},{
                    290,30},{290,30}}, color={0,0,255}),
              Polygon(
                points={{240,30},{340,30},{340,38},{338,48},{332,58},{326,66},{
                    318,72},{308,78},{298,80},{290,80},{282,80},{272,78},{262,
                    72},{254,66},{248,58},{242,48},{240,38},{240,38},{240,30}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-60,80},{40,-20}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{40,-300},{40,-20},{0,30}}, color={0,0,255}),
              Line(points={{0,-300},{0,72}}, color={0,0,255}),
              Line(points={{-40,-296},{-40,-6}}, color={0,0,255}),
              Line(points={{-80,-296},{-80,-50},{-80,-10},{-80,80},{-60,80},{
                    -10,30},{-10,30}}, color={0,0,255}),
              Polygon(
                points={{-60,30},{40,30},{40,38},{38,48},{32,58},{26,66},{18,72},
                    {8,78},{-2,80},{-10,80},{-18,80},{-28,78},{-38,72},{-46,66},
                    {-52,58},{-58,48},{-60,38},{-60,38},{-60,30}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-360,80},{-260,-20}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-260,-290},{-260,-20},{-300,30}}, color={0,0,255}),
              Line(points={{-300,-300},{-300,-2}}, color={0,0,255}),
              Line(points={{-340,-298},{-340,-6}}, color={0,0,255}),
              Line(points={{-380,-298},{-380,-50},{-380,-10},{-380,80},{-360,80},
                    {-310,30},{-310,30}}, color={0,0,255}),
              Polygon(
                points={{-360,30},{-260,30},{-260,38},{-262,48},{-268,58},{-274,
                    66},{-282,72},{-292,78},{-302,80},{-310,80},{-318,80},{-328,
                    78},{-338,72},{-346,66},{-352,58},{-358,48},{-360,38},{-360,
                    38},{-360,30}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Line(points={{300,8},{80,8},{80,-300}}, color={0,0,255}),
              Line(points={{80,-120},{-220,-120},{-220,-302}}, color={0,0,255}),
              Ellipse(
                extent={{78,-118},{82,-122}},
                lineColor={0,0,255},
                lineThickness=0.5),
              Ellipse(
                extent={{-240,-160},{-200,-200}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-220,-160},{-220,-200},{-238,-172},{-220,-200},{
                    -202,-172}}, color={0,0,255}),
              Ellipse(
                extent={{60,-160},{100,-200}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{80,-160},{80,-200},{62,-172},{80,-200},{98,-172}},
                  color={0,0,255}),
              Polygon(points={{-386,-234},{-374,-234},{-380,-250},{-386,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{-346,-228},{-334,-228},{-340,-212},{-346,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{-306,-234},{-294,-234},{-300,-250},{-306,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{-266,-228},{-254,-228},{-260,-212},{-266,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{-226,-234},{-214,-234},{-220,-250},{-226,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{-86,-234},{-74,-234},{-80,-250},{-86,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{-46,-228},{-34,-228},{-40,-212},{-46,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{-6,-234},{6,-234},{0,-250},{-6,-234}}, lineColor=
                   {0,0,255}),
              Polygon(points={{34,-228},{46,-228},{40,-212},{34,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{74,-234},{86,-234},{80,-250},{74,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{214,-234},{226,-234},{220,-250},{214,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{254,-228},{266,-228},{260,-212},{254,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{294,-234},{306,-234},{300,-250},{294,-234}},
                  lineColor={0,0,255}),
              Polygon(points={{334,-228},{346,-228},{340,-212},{334,-228}},
                  lineColor={0,0,255}),
              Polygon(points={{74,-52},{86,-52},{80,-68},{74,-52}}, lineColor={
                    0,0,255})}),
                             Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-500,-300},{500,300}},
              initialScale=0.1), graphics));

      end DG_3L_p;

      partial model HRSG_2L
        "Base class for Heat Recovery Steam Generator with two pressure levels"
        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        Water.FlangeA WaterIn(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{140,-220},{180,-180}},
                rotation=0)));

        Water.FlangeB Sh_HP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-140,-220},{-100,-180}},
                rotation=0)));
        Gas.FlangeA GasIn(redeclare package Medium = FlueGasMedium)
                          annotation (Placement(transformation(extent={{-220,
                  -60},{-180,-20}}, rotation=0)));
        Gas.FlangeB GasOut(redeclare package Medium = FlueGasMedium)
                           annotation (Placement(transformation(extent={{180,
                  -60},{220,-20}}, rotation=0)));
        Water.FlangeB Sh_LP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-20,-220},{20,-180}},
                rotation=0)));
        Buses.Sensors SensorsBus
                              annotation (Placement(transformation(extent={{180,
                  140},{220,180}}, rotation=0)));
        Buses.Actuators ActuatorsBus
                                  annotation (Placement(transformation(extent={
                  {220,80},{180,120}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-130,160},{-70,100}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-130,130},{-70,130},{-70,134},{-70,134},{-72,142},{-74,
                    146},{-78,152},{-84,156},{-88,158},{-96,160},{-100,160},{
                    -104,160},{-112,158},{-116,156},{-122,152},{-126,146},{-128,
                    142},{-130,134},{-130,130}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{70,160},{130,100}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{70,130},{130,130},{130,134},{130,134},{128,142},{126,
                    146},{122,152},{116,156},{112,158},{104,160},{100,160},{96,
                    160},{88,158},{84,156},{78,152},{74,146},{72,142},{70,134},
                    {70,130}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-200,60},{200,-140}},
                lineColor={170,170,255},
                fillColor={215,215,215},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-100,60},{-100,20},{-60,0},{-140,-40},{-60,-80},{-100,
                    -100},{-100,-140}},
                color={0,0,255},
                thickness=0.5),
              Line(
                points={{100,60},{100,20},{140,0},{60,-40},{140,-80},{100,-100},
                    {100,-140}},
                color={0,0,255},
                thickness=0.5)}), Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics));
      end HRSG_2L;

      partial model HRSG_2LRh
        "Base class for Heat Recovery Steam Generator with two pressure levels and reheat"
        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        Water.FlangeA WaterIn(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{140,-220},{180,-180}},
                rotation=0)));

        Water.FlangeB Sh_HP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-180,-220},{-140,-180}},
                rotation=0)));
        Gas.FlangeA GasIn(redeclare package Medium = FlueGasMedium)
                          annotation (Placement(transformation(extent={{-220,
                  -60},{-180,-20}}, rotation=0)));
        Gas.FlangeB GasOut(redeclare package Medium = FlueGasMedium)
                           annotation (Placement(transformation(extent={{180,
                  -60},{220,-20}}, rotation=0)));
        Water.FlangeA Rh_IP_In(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-120,-220},{-80,-180}},
                rotation=0)));
        Water.FlangeB Rh_IP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-60,-220},{-20,-180}},
                rotation=0)));
        Water.FlangeB Sh_LP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{60,-220},{100,-180}},
                rotation=0)));
        Buses.Sensors SensorsBus
                              annotation (Placement(transformation(extent={{180,
                  140},{220,180}}, rotation=0)));
        Buses.Actuators ActuatorsBus
                                  annotation (Placement(transformation(extent={
                  {220,80},{180,120}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-130,160},{-70,100}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-130,130},{-70,130},{-70,134},{-70,134},{-72,142},{-74,
                    146},{-78,152},{-84,156},{-88,158},{-96,160},{-100,160},{
                    -104,160},{-112,158},{-116,156},{-122,152},{-126,146},{-128,
                    142},{-130,134},{-130,130}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{70,160},{130,100}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{70,130},{130,130},{130,134},{130,134},{128,142},{126,
                    146},{122,152},{116,156},{112,158},{104,160},{100,160},{96,
                    160},{88,158},{84,156},{78,152},{74,146},{72,142},{70,134},
                    {70,130}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-200,60},{200,-140}},
                lineColor={170,170,255},
                fillColor={215,215,215},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-100,60},{-100,20},{-60,0},{-140,-40},{-60,-80},{-100,
                    -100},{-100,-140}},
                color={0,0,255},
                thickness=0.5),
              Line(
                points={{100,60},{100,20},{140,0},{60,-40},{140,-80},{100,-100},
                    {100,-140}},
                color={0,0,255},
                thickness=0.5)}), Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics));
      end HRSG_2LRh;

      partial model HRSG_3LRh
        "Base class for Heat Recovery Steam Generator with three pressure levels and reheat"
        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        Water.FlangeA WaterIn(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{140,-220},{180,-180}},
                rotation=0)));

        Water.FlangeB Sh_HP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-180,-220},{-140,-180}},
                rotation=0)));
        Gas.FlangeA GasIn(redeclare package Medium = FlueGasMedium)
                          annotation (Placement(transformation(extent={{-220,
                  -60},{-180,-20}}, rotation=0)));
        Gas.FlangeB GasOut(redeclare package Medium = FlueGasMedium)
                           annotation (Placement(transformation(extent={{180,
                  -60},{220,-20}}, rotation=0)));
        Water.FlangeA Rh_IP_In(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-120,-220},{-80,-180}},
                rotation=0)));
        Water.FlangeB Rh_IP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{-60,-220},{-20,-180}},
                rotation=0)));
        Water.FlangeB Sh_LP_Out(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(extent={{60,-220},{100,-180}},
                rotation=0)));
        Buses.Sensors SensorsBus
                              annotation (Placement(transformation(extent={{180,
                  140},{220,180}}, rotation=0)));
        Buses.Actuators ActuatorsBus
                                  annotation (Placement(transformation(extent={
                  {220,80},{180,120}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-140,160},{-80,100}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-140,130},{-80,130},{-80,134},{-80,134},{-82,142},{-84,
                    146},{-88,152},{-94,156},{-98,158},{-106,160},{-110,160},{
                    -114,160},{-122,158},{-126,156},{-132,152},{-136,146},{-138,
                    142},{-140,134},{-140,130}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-30,160},{30,100}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-30,130},{30,130},{30,134},{30,134},{28,142},{26,146},
                    {22,152},{16,156},{12,158},{4,160},{0,160},{-4,160},{-12,
                    158},{-16,156},{-22,152},{-26,146},{-28,142},{-30,134},{-30,
                    130}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{80,160},{140,100}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{80,130},{140,130},{140,134},{140,134},{138,142},{136,
                    146},{132,152},{126,156},{122,158},{114,160},{110,160},{106,
                    160},{98,158},{94,156},{88,152},{84,146},{82,142},{80,134},
                    {80,130}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-200,60},{200,-140}},
                lineColor={170,170,255},
                fillColor={215,215,215},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-110,60},{-110,20},{-70,0},{-150,-40},{-70,-80},{-110,
                    -100},{-110,-140}},
                color={0,0,255},
                thickness=0.5),
              Line(
                points={{0,60},{0,20},{40,0},{-40,-40},{40,-80},{0,-100},{0,
                    -140}},
                color={0,0,255},
                thickness=0.5),
              Line(
                points={{110,60},{110,20},{150,0},{70,-40},{150,-80},{110,-100},
                    {110,-140}},
                color={0,0,255},
                thickness=0.5)}),
            Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics));
      end HRSG_3LRh;

    end Interfaces;

    package Components "HRSG component models"

      model HE "Heat Exchanger fluid - gas"
        extends Interfaces.HeatExchanger;

        parameter SI.CoefficientOfHeatTransfer gamma_G
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F
          "Constant heat transfer coefficient in the fluid side";
        parameter Choices.Flow1D.FFtypes FFtype_G=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
          "Friction Factor Type, gas side";
        parameter Real Kfnom_G=0
          "Nominal hydraulic resistance coefficient, gas side";
        parameter SI.Pressure dpnom_G=0
          "Nominal pressure drop, gas side (friction term only!)";
        parameter SI.Density rhonom_G=0 "Nominal inlet density, gas side";
        parameter Real Cfnom_G=0 "Nominal Fanning friction factor, gas side";
        parameter Choices.Flow1D.FFtypes FFtype_F=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
          "Friction Factor Type, fluid side";
        parameter Real Kfnom_F=0 "Nominal hydraulic resistance coefficient";
        parameter SI.Pressure dpnom_F=0
          "Nominal pressure drop fluid side (friction term only!)";
        parameter SI.Density rhonom_F=0 "Nominal inlet density fluid side";
        parameter Real Cfnom_F=0 "Nominal Fanning friction factor";
        parameter Choices.Flow1D.HCtypes HCtype_F=ThermoPower.Choices.Flow1D.HCtypes.Downstream
          "Location of the hydraulic capacitance, fluid side";
        parameter Boolean counterCurrent=true "Counter-current flow";
        parameter Boolean gasQuasiStatic=false
          "Quasi-static model of the flue gas (mass, energy and momentum static balances";
        constant Real pi=Modelica.Constants.pi;

      Water.Flow1D fluidFlow(
          Nt=1,
          N=N_F,
          wnom=fluidNomFlowRate,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          L=exchSurface_F^2/(fluidVol*pi*4),
          A=(fluidVol*4/exchSurface_F)^2/4*pi,
          omega=fluidVol*4/exchSurface_F*pi,
          Dhyd=fluidVol*4/exchSurface_F,
          FFtype=FFtype_F,
          HydraulicCapacitance=HCtype_F,
          Kfnom=Kfnom_F,
          dpnom=dpnom_F,
          rhonom=rhonom_F,
          Cfnom=Cfnom_F,
          FluidPhaseStart=FluidPhaseStart,
          pstart=pstart_F)       annotation (Placement(transformation(extent={{
                  -10,-60},{10,-40}}, rotation=0)));
        Thermal.ConvHT convHT(               N=N_F,
          gamma=gamma_F)
          annotation (Placement(transformation(extent={{-10,-40},{10,-20}},
                rotation=0)));
        Thermal.MetalTube metalTube(
          rhomcm=rhomcm,
          lambda=lambda,
          N=N_F,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          L=exchSurface_F^2/(fluidVol*pi*4),
          rint=fluidVol*4/exchSurface_F/2,
          WallRes=false,
          rext=(metalVol + fluidVol)*4/extSurfaceTub/2,
          Tstartbar=Tstartbar_M)
                 annotation (Placement(transformation(extent={{-10,-6},{10,-26}},
                rotation=0)));
        Gas.Flow1D gasFlow(
          Dhyd=1,
          wnom=gasNomFlowRate,
          N=N_G,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FlueGasMedium,
          QuasiStatic=gasQuasiStatic,
          pstart=pstart_G,
          L=L,
          A=gasVol/L,
          omega=exchSurface_G/L,
          FFtype=FFtype_G,
          Kfnom=Kfnom_G,
          dpnom=dpnom_G,
          rhonom=rhonom_G,
          Cfnom=Cfnom_G,
          Tstartbar=Tstartbar_G)  annotation (Placement(transformation(extent={{
                  -12,58},{12,38}}, rotation=0)));
        Thermal.CounterCurrent cC(                                    N=N_F,
            counterCurrent=counterCurrent)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=0)));
        Thermal.HeatFlowDistribution heatFlowDistribution(
          N=N_F,
          A1=exchSurface_G,
          A2=extSurfaceTub)
          annotation (Placement(transformation(extent={{-10,4},{10,24}},
                rotation=0)));
        Thermal.ConvHT2N convHT2N(
          N1=N_G,
          N2=N_F,
          gamma=gamma_G)       annotation (Placement(transformation(extent={{
                  -10,20},{10,40}}, rotation=0)));

        final parameter SI.Distance L=1 "Tube length";
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart=Choices.FluidPhase.FluidPhases.Liquid
          "Fluid phase (only for initialization!)" annotation(Dialog(tab="Initialization"));
      equation
        connect(fluidFlow.wall, convHT.side2)
                                           annotation (Line(points={{0,-45},{0,
                -33.1}}, color={255,127,0}));
        connect(gasFlow.infl, gasIn) annotation (Line(
            points={{-12,48},{-100,48},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(gasFlow.outfl, gasOut) annotation (Line(
            points={{12,48},{100,48},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(fluidFlow.outfl, waterOut)
                                        annotation (Line(points={{10,-50},{40,
                -50},{40,-100},{0,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidFlow.infl, waterIn)
                                      annotation (Line(points={{-10,-50},{-40,
                -50},{-40,100},{0,100}}, thickness=0.5,
            color={0,0,255}));
        connect(heatFlowDistribution.side2, cC.side1) annotation (Line(points={
                {0,10.9},{0,3}}, color={255,127,0}));
        connect(convHT2N.side1, gasFlow.wall) annotation (Line(points={{0,33},{
                0,43}}, color={255,127,0}));
        connect(heatFlowDistribution.side1, convHT2N.side2) annotation (Line(
              points={{0,17},{0,26.9}}, color={255,127,0}));
        connect(metalTube.int, convHT.side1) annotation (Line(points={{0,-19},{
                0,-27}}, color={255,127,0}));
        connect(metalTube.ext, cC.side2) annotation (Line(points={{0,-12.9},{0,
                -3.1}}, color={255,127,0}));
        annotation (Diagram(graphics));
      end HE;

      model HE2ph "Heat Exchanger fluid - gas (2phases)"
        extends Interfaces.HeatExchanger;

        parameter SI.CoefficientOfHeatTransfer gamma_G
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F
          "Constant heat transfer coefficient in the fluid side";
        parameter Choices.Flow1D.FFtypes FFtype_G=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
          "Friction Factor Type, gas side";
        parameter Real Kfnom_G=0
          "Nominal hydraulic resistance coefficient, gas side";
        parameter SI.Pressure dpnom_G=0
          "Nominal pressure drop, gas side (friction term only!)";
        parameter SI.Density rhonom_G=0 "Nominal inlet density, gas side";
        parameter Real Cfnom_G=0 "Nominal Fanning friction factor, gas side";
        parameter Choices.Flow1D.FFtypes FFtype_F=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
          "Friction Factor Type, fluid side";
        parameter Real Kfnom_F=0 "Nominal hydraulic resistance coefficient";
        parameter SI.Pressure dpnom_F=0
          "Nominal pressure drop fluid side (friction term only!)";
        parameter SI.Density rhonom_F=0 "Nominal inlet density fluid side";
        parameter Real Cfnom_F=0 "Nominal Fanning friction factor";
        parameter Choices.Flow1D.HCtypes HCtype_F=ThermoPower.Choices.Flow1D.HCtypes.Downstream
          "Location of the hydraulic capacitance, fluid side";
        parameter Boolean counterCurrent=true "Counter-current flow";
        parameter Boolean gasQuasiStatic=false
          "Quasi-static model of the flue gas (mass, energy and momentum static balances";
        constant Real pi=Modelica.Constants.pi;

      Water.Flow1D2ph fluidFlow(
          Nt=1,
          N=N_F,
          wnom=fluidNomFlowRate,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          L=exchSurface_F^2/(fluidVol*pi*4),
          A=(fluidVol*4/exchSurface_F)^2/4*pi,
          omega=fluidVol*4/exchSurface_F*pi,
          Dhyd=fluidVol*4/exchSurface_F,
          FFtype=FFtype_F,
          HydraulicCapacitance=HCtype_F,
          Kfnom=Kfnom_F,
          dpnom=dpnom_F,
          rhonom=rhonom_F,
          Cfnom=Cfnom_F,
          FluidPhaseStart=FluidPhaseStart,
          pstart=pstart_F)       annotation (Placement(transformation(extent={{
                  -10,-60},{10,-40}}, rotation=0)));
        Thermal.ConvHT convHT(               N=N_F,
          gamma=gamma_F)
          annotation (Placement(transformation(extent={{-10,-40},{10,-20}},
                rotation=0)));
        Thermal.MetalTube metalTube(
          rhomcm=rhomcm,
          lambda=lambda,
          N=N_F,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          L=exchSurface_F^2/(fluidVol*pi*4),
          rint=fluidVol*4/exchSurface_F/2,
          WallRes=false,
          rext=(metalVol + fluidVol)*4/extSurfaceTub/2,
          Tstartbar=Tstartbar_M)
                 annotation (Placement(transformation(extent={{-10,-6},{10,-26}},
                rotation=0)));
        Gas.Flow1D gasFlow(
          Dhyd=1,
          wnom=gasNomFlowRate,
          N=N_G,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FlueGasMedium,
          QuasiStatic=gasQuasiStatic,
          pstart=pstart_G,
          L=L,
          A=gasVol/L,
          omega=exchSurface_G/L,
          FFtype=FFtype_G,
          Kfnom=Kfnom_G,
          dpnom=dpnom_G,
          rhonom=rhonom_G,
          Cfnom=Cfnom_G,
          Tstartbar=Tstartbar_G)  annotation (Placement(transformation(extent={{
                  -12,58},{12,38}}, rotation=0)));
        Thermal.CounterCurrent cC(                                    N=N_F,
            counterCurrent=counterCurrent)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=0)));
        Thermal.HeatFlowDistribution heatFlowDistribution(
          N=N_F,
          A1=exchSurface_G,
          A2=extSurfaceTub)
          annotation (Placement(transformation(extent={{-10,4},{10,24}},
                rotation=0)));
        Thermal.ConvHT2N convHT2N(
          N1=N_G,
          N2=N_F,
          gamma=gamma_G)       annotation (Placement(transformation(extent={{
                  -10,20},{10,40}}, rotation=0)));

        final parameter SI.Distance L=1 "Tube length";
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart=Choices.FluidPhase.FluidPhases.TwoPhases
          "Fluid phase (only for initialization!)" annotation(Dialog(tab="Initialization"));
      equation
        connect(fluidFlow.wall, convHT.side2)
                                           annotation (Line(points={{0,-45},{0,
                -33.1}}, color={255,127,0}));
        connect(gasFlow.infl, gasIn) annotation (Line(
            points={{-12,48},{-100,48},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(gasFlow.outfl, gasOut) annotation (Line(
            points={{12,48},{100,48},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(fluidFlow.outfl, waterOut)
                                        annotation (Line(points={{10,-50},{40,
                -50},{40,-100},{0,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidFlow.infl, waterIn)
                                      annotation (Line(points={{-10,-50},{-40,
                -50},{-40,100},{0,100}}, thickness=0.5,
            color={0,0,255}));
        connect(heatFlowDistribution.side2, cC.side1) annotation (Line(points={
                {0,10.9},{0,3}}, color={255,127,0}));
        connect(convHT2N.side1, gasFlow.wall) annotation (Line(points={{0,33},{
                0,43}}, color={255,127,0}));
        connect(heatFlowDistribution.side1, convHT2N.side2) annotation (Line(
              points={{0,17},{0,26.9}}, color={255,127,0}));
        connect(metalTube.int, convHT.side1) annotation (Line(points={{0,-19},{
                0,-27}}, color={255,127,0}));
        connect(metalTube.ext, cC.side2) annotation (Line(points={{0,-12.9},{0,
                -3.1}}, color={255,127,0}));
        annotation (Diagram(graphics));
      end HE2ph;

      model ParHE "Parallel heat exchangers fluid - gas"
        extends Interfaces.ParallelHE;

        parameter SI.CoefficientOfHeatTransfer gamma_G_A
          "Constant heat transfer coefficient in the gas side"     annotation (Dialog(group = "side A"));
        parameter SI.CoefficientOfHeatTransfer gamma_G_B
          "Constant heat transfer coefficient in the gas side"     annotation (Dialog(group = "side B"));
        parameter SI.CoefficientOfHeatTransfer gamma_F_A
          "Constant heat transfer coefficient in the fluid side"     annotation (Dialog(group = "side A"));
        parameter SI.CoefficientOfHeatTransfer gamma_F_B
          "Constant heat transfer coefficient in the fluid side"     annotation (Dialog(group = "side B"));
        parameter Choices.Flow1D.FFtypes FFtype_G=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
          "Friction Factor Type, gas side";
        parameter Real Kfnom_G=0
          "Nominal hydraulic resistance coefficient, gas side";
        parameter SI.Pressure dpnom_G=0
          "Nominal pressure drop, gas side (friction term only!)";
        parameter SI.Density rhonom_G=0 "Nominal inlet density, gas side";
        parameter Real Cfnom_G=0 "Nominal Fanning friction factor, gas side";
        parameter Choices.Flow1D.FFtypes FFtype_F_A=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
          "Friction Factor Type, fluid side"     annotation (Dialog(group = "side A"));
        parameter Real Kfnom_F_A=0 "Nominal hydraulic resistance coefficient"
                                                                             annotation (Dialog(group = "side A"));
        parameter SI.Pressure dpnom_F_A=0
          "Nominal pressure drop fluid side (friction term only!)"     annotation (Dialog(group = "side A"));
        parameter SI.Density rhonom_F_A=0 "Nominal inlet density fluid side"   annotation (Dialog(group = "side A"));
        parameter Real Cfnom_F_A=0 "Nominal Fanning friction factor"
                                                                    annotation (Dialog(group = "side A"));
        parameter Choices.Flow1D.FFtypes FFtype_F_B=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
          "Friction Factor Type, fluid side"     annotation (Dialog(group = "side B"));
        parameter Real Kfnom_F_B=0 "Nominal hydraulic resistance coefficient"
                                                                             annotation (Dialog(group = "side B"));
        parameter SI.Pressure dpnom_F_B=0
          "Nominal pressure drop fluid side (friction term only!)"   annotation (Dialog(group = "side B"));
        parameter SI.Density rhonom_F_B=0 "Nominal inlet density fluid side"   annotation (Dialog(group = "side B"));
        parameter Real Cfnom_F_B=0 "Nominal Fanning friction factor"
                                                                    annotation (Dialog(group = "side B"));
        parameter Choices.Flow1D.HCtypes HCtype_F_A=ThermoPower.Choices.Flow1D.HCtypes.Downstream
          "Location of the hydraulic capacitance, fluid side"     annotation (Dialog(group = "side A"));
        parameter Choices.Flow1D.HCtypes HCtype_F_B=ThermoPower.Choices.Flow1D.HCtypes.Downstream
          "Location of the hydraulic capacitance, fluid side"     annotation (Dialog(group = "side B"));
        parameter Boolean counterCurrent_A = true "Counter-current flow"     annotation (Dialog(group = "side A"));
        parameter Boolean counterCurrent_B = true "Counter-current flow"     annotation (Dialog(group = "side B"));

        parameter Boolean gasQuasiStatic=false
          "Quasi-static model of the flue gas (mass, energy and momentum static balances";
        constant Real pi=Modelica.Constants.pi;

        ConvParallel convParallel(
          N=N_G,
          As=exchSurface_G_A + exchSurface_G_B,
          Aa=exchSurface_G_A,
          Ab=exchSurface_G_B)
                             annotation (Placement(transformation(extent={{-10,
                  12},{10,32}}, rotation=0)));
      Water.Flow1D fluidAFlow(
          Nt=1,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          N=N_F_A,
          L=exchSurface_F_A^2/(fluidVol_A*pi*4),
          A=(fluidVol_A*4/exchSurface_F_A)^2/4*pi,
          omega=fluidVol_A*4/exchSurface_F_A*pi,
          Dhyd=fluidVol_A*4/exchSurface_F_A,
          wnom=fluidNomFlowRate_A,
          FFtype=FFtype_F_A,
          HydraulicCapacitance=HCtype_F_A,
          Kfnom=Kfnom_F_A,
          dpnom=dpnom_F_A,
          rhonom=rhonom_F_A,
          Cfnom=Cfnom_F_A,
          FluidPhaseStart=FluidPhaseStart_A,
          pstart=pstart_F_A)     annotation (Placement(transformation(extent={{
                  -38,-56},{-18,-36}}, rotation=0)));
        Thermal.ConvHT convHT_A(
          N=N_F_A,
          gamma=gamma_F_A)
          annotation (Placement(transformation(extent={{-38,-38},{-18,-18}},
                rotation=0)));
        Thermal.MetalTube metalTube_A(
          lambda=lambda,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          N=N_F_A,
          L=exchSurface_F_A^2/(fluidVol_A*pi*4),
          rint=fluidVol_A*4/exchSurface_F_A/2,
          WallRes=false,
          rext=(metalVol_A + fluidVol_A)*4/extSurfaceTub_A/2,
          rhomcm=rhomcm_A,
          Tstartbar=Tstartbar_M_A)
                 annotation (Placement(transformation(extent={{-38,-6},{-18,-26}},
                rotation=0)));
        Gas.Flow1D gasFlow(
          Dhyd=1,
          wnom=gasNomFlowRate,
          N=N_G,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FlueGasMedium,
          QuasiStatic=gasQuasiStatic,
          pstart=pstart_G,
          L=L,
          A=gasVol/L,
          omega=(exchSurface_G_A + exchSurface_G_B)/L,
          FFtype=FFtype_G,
          Kfnom=Kfnom_G,
          dpnom=dpnom_G,
          rhonom=rhonom_G,
          Cfnom=Cfnom_G,
          Tstartbar=Tstartbar_G)  annotation (Placement(transformation(extent={{
                  -12,60},{12,40}}, rotation=0)));
      Water.Flow1D fluidBFlow(
          Nt=1,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          N=N_F_B,
          L=exchSurface_F_B^2/(fluidVol_B*pi*4),
          A=(fluidVol_B*4/exchSurface_F_B)^2/4*pi,
          omega=fluidVol_B*4/exchSurface_F_B*pi,
          Dhyd=fluidVol_B*4/exchSurface_F_B,
          wnom=fluidNomFlowRate_B,
          FFtype=FFtype_F_B,
          HydraulicCapacitance=HCtype_F_B,
          Kfnom=Kfnom_F_B,
          dpnom=dpnom_F_B,
          rhonom=rhonom_F_B,
          Cfnom=Cfnom_F_B,
          FluidPhaseStart=FluidPhaseStart_B,
          pstart=pstart_F_B)     annotation (Placement(transformation(extent={{
                  38,-56},{18,-36}}, rotation=0)));
        Thermal.ConvHT convHT_B(
          N=N_F_B,
          gamma=gamma_F_B)
          annotation (Placement(transformation(extent={{18,-38},{38,-18}},
                rotation=0)));
        Thermal.MetalTube metalTube_B(
          lambda=lambda,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          L=exchSurface_F_B^2/(fluidVol_B*pi*4),
          rint=fluidVol_B*4/exchSurface_F_B/2,
          N=N_F_B,
          WallRes=false,
          rext=(metalVol_B + fluidVol_B)*4/extSurfaceTub_B/2,
          rhomcm=rhomcm_B,
          Tstartbar=Tstartbar_M_B)
                 annotation (Placement(transformation(extent={{18,-6},{38,-26}},
                rotation=0)));
        Thermal.CounterCurrent cC_A(N=N_F_A, counterCurrent=counterCurrent_A)
          annotation (Placement(transformation(extent={{-38,-8},{-18,12}},
                rotation=0)));
        Thermal.HeatFlowDistribution heatFlowDistribution_A(
          N=N_F_A,
          A1=exchSurface_G_A,
          A2=extSurfaceTub_A)
          annotation (Placement(transformation(extent={{-38,8},{-18,28}},
                rotation=0)));
        Thermal.CounterCurrent cC_B(N=N_F_B, counterCurrent=counterCurrent_B)
          annotation (Placement(transformation(extent={{18,-8},{38,12}},
                rotation=0)));
        Thermal.HeatFlowDistribution heatFlowDistribution_B(
          N=N_F_B,
          A1=exchSurface_G_B,
          A2=extSurfaceTub_B)
          annotation (Placement(transformation(extent={{18,8},{38,28}},
                rotation=0)));
        Thermal.ConvHT2N convHT2N_A(
          N1=N_G,
          N2=N_F_A,
          gamma=gamma_G_A)       annotation (Placement(transformation(extent={{
                  -38,24},{-18,44}}, rotation=0)));
        Thermal.ConvHT2N convHT2N_B(
          N1=N_G,
          N2=N_F_B,
          gamma=gamma_G_B)       annotation (Placement(transformation(extent={{
                  18,24},{38,44}}, rotation=0)));

        final parameter SI.Distance L=1 "Tube length";
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart_A=Choices.FluidPhase.FluidPhases.Liquid
          "Fluid phase (only for initialization!)"
                                                  annotation(Dialog(tab="Initialization",group = "side A"));
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart_B=Choices.FluidPhase.FluidPhases.Liquid
          "Fluid phase (only for initialization!)"
                                                  annotation(Dialog(tab="Initialization",group = "side B"));
      equation
        connect(heatFlowDistribution_A.side2, cC_A.side1) annotation (Line(
              points={{-28,14.9},{-28,5}}, color={255,127,0}));
        connect(convHT_A.side2, fluidAFlow.wall)    annotation (Line(points={{
                -28,-31.1},{-28,-41}}, color={255,127,0}));
        connect(heatFlowDistribution_B.side2, cC_B.side1) annotation (Line(
              points={{28,14.9},{28,5}}, color={255,127,0}));
        connect(convHT_B.side2, fluidBFlow.wall)    annotation (Line(points={{
                28,-31.1},{28,-41}}, color={255,127,0}));
        connect(fluidBFlow.outfl, waterOutB)    annotation (Line(points={{18,
                -46},{8,-46},{8,-100},{40,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidAFlow.outfl, waterOutA)    annotation (Line(points={{-18,
                -46},{-8,-46},{-8,-100},{-40,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidAFlow.infl, waterInA)    annotation (Line(points={{-38,-46},
                {-50,-46},{-50,100},{-40,100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidBFlow.infl, waterInB)    annotation (Line(points={{38,-46},
                {52,-46},{52,100},{40,100}}, thickness=0.5,
            color={0,0,255}));
        connect(gasFlow.outfl, gasOut)   annotation (Line(
            points={{12,50},{100,50},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(gasFlow.infl, gasIn)   annotation (Line(
            points={{-12,50},{-100,50},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(convParallel.source, gasFlow.wall)   annotation (Line(points={{
                0,29},{0,45}}, color={255,127,0}));
        connect(heatFlowDistribution_A.side1, convHT2N_A.side2)
                                                              annotation (Line(
              points={{-28,21},{-28,30.9}}, color={255,127,0}));
        connect(convHT2N_A.side1, convParallel.objectA)
                                                      annotation (Line(points={
                {-28,37},{-28,42},{-14,42},{-14,4},{-6,4},{-6,19}}, color={255,
                127,0}));
        connect(convHT2N_B.side2, heatFlowDistribution_B.side1)
                                                               annotation (Line(
              points={{28,30.9},{28,21}}, color={255,127,0}));
        connect(convHT2N_B.side1, convParallel.objectB)
                                                       annotation (Line(points=
                {{28,37},{28,42},{16,42},{16,4},{6,4},{6,19}}, color={255,127,0}));
        connect(metalTube_B.ext, cC_B.side2) annotation (Line(points={{28,-12.9},
                {28,-1.1}}, color={255,127,0}));
        connect(metalTube_B.int, convHT_B.side1) annotation (Line(points={{28,
                -19},{28,-25}}, color={255,127,0}));
        connect(metalTube_A.int, convHT_A.side1) annotation (Line(points={{-28,
                -19},{-28,-25}}, color={255,127,0}));
        connect(metalTube_A.ext, cC_A.side2) annotation (Line(points={{-28,
                -12.9},{-28,-1.1}}, color={255,127,0}));
        annotation (Diagram(graphics));
      end ParHE;

      model ParHE_Des
        "Parallel Heat Exchanger (two fluid with one gas) with Desuperheater"
        extends ThermoPower.PowerPlants.HRSG.Interfaces.ParallelHE_Des;

        parameter SI.CoefficientOfHeatTransfer gamma_G_A_p1
          "Constant heat transfer coefficient in the gas side"            annotation (Dialog(tab = "pHE-1", group = "side A"));
        parameter SI.CoefficientOfHeatTransfer gamma_G_B_p1
          "Constant heat transfer coefficient in the gas side"            annotation (Dialog(tab = "pHE-1", group = "side B"));
        parameter SI.CoefficientOfHeatTransfer gamma_F_A_p1
          "Constant heat transfer coefficient in the fluid side"            annotation (Dialog(tab = "pHE-1", group = "side A"));
        parameter SI.CoefficientOfHeatTransfer gamma_F_B_p1
          "Constant heat transfer coefficient in the fluid side"            annotation (Dialog(tab = "pHE-1", group = "side B"));
        parameter Choices.Flow1D.HCtypes HCtype_F_A_p1=ThermoPower.Choices.Flow1D.HCtypes.Downstream
          "Location of the hydraulic capacitance, fluid side"            annotation (Dialog(tab = "pHE-1", group = "side A"));
        parameter Choices.Flow1D.HCtypes HCtype_F_B_p1=ThermoPower.Choices.Flow1D.HCtypes.Downstream
          "Location of the hydraulic capacitance, fluid side"            annotation (Dialog(tab = "pHE-1", group = "side B"));
        parameter Boolean counterCurrent_A_p1 = true "Counter-current flow"
                                            annotation (Dialog(tab = "pHE-1", group = "side A"));
        parameter Boolean counterCurrent_B_p1 = true "Counter-current flow"
                                            annotation (Dialog(tab = "pHE-1", group = "side B"));
        parameter SI.CoefficientOfHeatTransfer gamma_G_A_p2
          "Constant heat transfer coefficient in the gas side"            annotation (Dialog(tab = "pHE-2", group = "side A"));
        parameter SI.CoefficientOfHeatTransfer gamma_G_B_p2
          "Constant heat transfer coefficient in the gas side"            annotation (Dialog(tab = "pHE-2", group = "side B"));
        parameter SI.CoefficientOfHeatTransfer gamma_F_A_p2
          "Constant heat transfer coefficient in the fluid side"            annotation (Dialog(tab = "pHE-2", group = "side A"));
        parameter SI.CoefficientOfHeatTransfer gamma_F_B_p2
          "Constant heat transfer coefficient in the fluid side"            annotation (Dialog(tab = "pHE-2", group = "side B"));
        parameter Choices.Flow1D.HCtypes HCtype_F_A_p2=ThermoPower.Choices.Flow1D.HCtypes.Downstream
          "Location of the hydraulic capacitance, fluid side"            annotation (Dialog(tab = "pHE-2", group = "side A"));
        parameter Choices.Flow1D.HCtypes HCtype_F_B_p2=ThermoPower.Choices.Flow1D.HCtypes.Downstream
          "Location of the hydraulic capacitance, fluid side"            annotation (Dialog(tab = "pHE-2", group = "side B"));
        parameter Boolean counterCurrent_A_p2 = true "Counter-current flow"
                                            annotation (Dialog(tab = "pHE-2", group = "side A"));
        parameter Boolean counterCurrent_B_p2 = true "Counter-current flow"
                                            annotation (Dialog(tab = "pHE-2", group = "side B"));
        parameter Boolean gasQuasiStatic=false
          "Quasi-static model of the flue gas (mass, energy and momentum static balances";
        constant Real pi=Modelica.Constants.pi;

        //Valves parameters
        parameter Real Cv_valA "Cv (US) flow coefficient, valve A" annotation (Dialog(group = "Desuperheater A"));
        parameter SI.Pressure pnom_valA "Nominal inlet pressure, valve A" annotation (Dialog(group = "Desuperheater A"));
        parameter SI.Pressure dpnom_valA "Nominal pressure drop, valve A" annotation (Dialog(group = "Desuperheater A"));
        parameter SI.MassFlowRate wnom_valA "Nominal mass flowrate, valve A" annotation (Dialog(group = "Desuperheater A"));
        parameter SI.SpecificEnthalpy hstart_valA=1e5
          "Specific enthalpy start value, valve A" annotation (Dialog(group = "Desuperheater A"));
        parameter Real Cv_valB "Cv (US) flow coefficient, valve B" annotation (Dialog(group = "Desuperheater B"));
        parameter SI.Pressure pnom_valB "Nominal inlet pressure, valve B" annotation (Dialog(group = "Desuperheater B"));
        parameter SI.Pressure dpnom_valB "Nominal pressure drop, valve B" annotation (Dialog(group = "Desuperheater B"));
        parameter SI.MassFlowRate wnom_valB "Nominal mass flowrate, valve B" annotation (Dialog(group = "Desuperheater B"));
        parameter SI.SpecificEnthalpy hstart_valB=1e5
          "Specific enthalpy start value, valve B" annotation (Dialog(group = "Desuperheater B"));

        ParHE pHE1(
          redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=N_G_p1,
          N_F_A=N_F_A_p1,
          N_F_B=N_F_B_p1,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate_A=fluidNomFlowRate_A,
          fluidNomFlowRate_B=fluidNomFlowRate_B,
          gasNomPressure=gasNomPressure,
          fluidNomPressure_A=fluidNomPressure_A,
          fluidNomPressure_B=fluidNomPressure_B,
          exchSurface_G_A=exchSurface_G_A_p1,
          exchSurface_G_B=exchSurface_G_B_p1,
          exchSurface_F_A=exchSurface_F_A_p1,
          exchSurface_F_B=exchSurface_F_B_p1,
          gasVol=gasVol_p1,
          fluidVol_A=fluidVol_A_p1,
          fluidVol_B=fluidVol_B_p1,
          metalVol_A=metalVol_A_p1,
          metalVol_B=metalVol_B_p1,
          gamma_G_A=gamma_G_A_p1,
          gamma_G_B=gamma_G_B_p1,
          gamma_F_A=gamma_F_A_p1,
          gamma_F_B=gamma_F_B_p1,
          HCtype_F_A=HCtype_F_A_p1,
          HCtype_F_B=HCtype_F_B_p1,
          counterCurrent_A=counterCurrent_A_p1,
          counterCurrent_B=counterCurrent_B_p1,
          gasQuasiStatic=gasQuasiStatic,
          lambda=lambda,
          extSurfaceTub_A=extSurfaceTub_A_p1,
          extSurfaceTub_B=extSurfaceTub_B_p1,
          SSInit=SSInit,
          pstart_G=pstart_G_p1,
          rhomcm_A=rhomcm_A_p1,
          rhomcm_B=rhomcm_B_p1,
          FluidPhaseStart_A=FluidPhaseStart_A,
          FluidPhaseStart_B=FluidPhaseStart_B,
          pstart_F_A=pstart_F_A_p1,
          pstart_F_B=pstart_F_B_p1,
          Tstartbar_G=Tstartbar_G_p1)
          annotation (Placement(transformation(extent={{-46,28},{-26,48}},
                rotation=0)));
        Water.ValveLiq valveA(
          redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          Cv=Cv_valA,
          pnom=pnom_valA,
          dpnom=dpnom_valA,
          wnom=wnom_valA,
          CheckValve=true)     annotation (Placement(transformation(
              origin={-26,-24},
              extent={{8,-8},{-8,8}},
              rotation=180)));
        Water.ValveLiq valveB(
          redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          Cv=Cv_valB,
          pnom=pnom_valB,
          dpnom=dpnom_valB,
          wnom=wnom_valB,
          CheckValve=true)    annotation (Placement(transformation(
              origin={-26,10},
              extent={{8,-8},{-8,8}},
              rotation=180)));
        Water.Mixer flowJoinA(
          redeclare package Medium = FluidMedium,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          V=0.3,
          FluidPhaseStart=FluidPhaseStart_A,
          pstart=pstart_F_A_p1) annotation (Placement(transformation(extent={{
                  -10,-18},{10,2}}, rotation=0)));
        Water.Mixer flowJoinB(   redeclare package Medium = FluidMedium,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          V=0.3,
          FluidPhaseStart=FluidPhaseStart_B,
          pstart=pstart_F_B_p1)
          annotation (Placement(transformation(extent={{-10,6},{10,26}},
                rotation=0)));
        ParHE pHE2(
          redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=N_G_p2,
          N_F_A=N_F_A_p2,
          N_F_B=N_F_B_p2,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate_A=fluidNomFlowRate_A,
          fluidNomFlowRate_B=fluidNomFlowRate_B,
          gasNomPressure=gasNomPressure,
          fluidNomPressure_A=fluidNomPressure_A,
          fluidNomPressure_B=fluidNomPressure_B,
          exchSurface_G_A=exchSurface_G_A_p2,
          exchSurface_G_B=exchSurface_G_B_p2,
          exchSurface_F_A=exchSurface_F_A_p2,
          exchSurface_F_B=exchSurface_F_B_p2,
          gasVol=gasVol_p2,
          fluidVol_A=fluidVol_A_p2,
          fluidVol_B=fluidVol_B_p2,
          metalVol_A=metalVol_A_p2,
          metalVol_B=metalVol_B_p2,
          gamma_G_A=gamma_G_A_p2,
          gamma_G_B=gamma_G_B_p2,
          gamma_F_A=gamma_F_A_p2,
          gamma_F_B=gamma_F_B_p2,
          HCtype_F_A=HCtype_F_A_p2,
          HCtype_F_B=HCtype_F_B_p2,
          counterCurrent_A=counterCurrent_A_p2,
          counterCurrent_B=counterCurrent_B_p2,
          gasQuasiStatic=gasQuasiStatic,
          lambda=lambda,
          extSurfaceTub_A=extSurfaceTub_A_p2,
          extSurfaceTub_B=extSurfaceTub_B_p2,
          SSInit=SSInit,
          pstart_G=pstart_G_p2,
          rhomcm_A=rhomcm_A_p2,
          rhomcm_B=rhomcm_B_p2,
          FluidPhaseStart_A=FluidPhaseStart_A,
          FluidPhaseStart_B=FluidPhaseStart_B,
          pstart_F_A=pstart_F_A_p2,
          pstart_F_B=pstart_F_B_p2,
          Tstartbar_G=Tstartbar_G_p2)
          annotation (Placement(transformation(extent={{26,-36},{46,-16}},
                rotation=0)));
        Water.SensT intermediate_B(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{16,12},{30,26}},
                rotation=0)));
        Water.SensT intermediate_A(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{16,-12},{30,2}},
                rotation=0)));
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart_A=Choices.FluidPhase.FluidPhases.Liquid
          "Fluid phase (only for initialization!)";
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart_B=Choices.FluidPhase.FluidPhases.Liquid
          "Fluid phase (only for initialization!)";
      equation
        connect(pHE1.waterInB, waterInB)  annotation (Line(points={{-32,48},{
                -32,54},{12,54},{12,100},{40,100}}, thickness=0.5,
            color={0,0,255}));
        connect(pHE1.waterInA, waterInA)
          annotation (Line(points={{-40,48},{-40,100}}, thickness=0.5,
            color={0,0,255}));
        connect(pHE1.gasIn, gasIn)  annotation (Line(
            points={{-46,38},{-100,38},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(pHE2.gasOut, gasOut) annotation (Line(
            points={{46,-26},{100,-26},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(pHE2.gasIn, pHE1.gasOut) annotation (Line(
            points={{26,-26},{14,-26},{14,38},{-26,38}},
            color={159,159,223},
            thickness=0.5));
        connect(valveA.outlet, flowJoinA.in2) annotation (Line(points={{-18,-24},
                {-14,-24},{-14,-14},{-8,-14}},   thickness=0.5,
            color={0,0,255}));
        connect(flowJoinA.in1, pHE1.waterOutA)
                                              annotation (Line(points={{-8,-2},
                {-14,-2},{-14,16},{-40,16},{-40,28}}, thickness=0.5,
            color={0,0,255}));
        connect(flowJoinB.in1, pHE1.waterOutB) annotation (Line(points={{-8,22},
                {-32,22},{-32,28}}, thickness=0.5,
            color={0,0,255}));
        connect(valveB.outlet,flowJoinB. in2) annotation (Line(points={{-18,10},
                {-12.95,10},{-8,10}},               thickness=0.5,
            color={0,0,255}));
        connect(intermediate_A.outlet, pHE2.waterInA)
          annotation (Line(points={{27.2,-7.8},{32,-7.8},{32,-16}}, thickness=0.5,
            color={0,0,255}));
        connect(intermediate_A.inlet, flowJoinA.out)
          annotation (Line(points={{18.8,-7.8},{18.8,-8},{10,-8}}, thickness=0.5,
            color={0,0,255}));
        connect(intermediate_B.inlet,flowJoinB. out) annotation (Line(points={{
                18.8,16.2},{19.4,16.2},{19.4,16},{10,16}}, thickness=0.5,
            color={0,0,255}));
        connect(intermediate_B.outlet, pHE2.waterInB) annotation (Line(points={
                {27.2,16.2},{27.2,16},{40,16},{40,-16}}, thickness=0.5,
            color={0,0,255}));
        connect(waterOutB, pHE2.waterOutB)
          annotation (Line(points={{40,-100},{40,-36}}, thickness=0.5,
            color={0,0,255}));
        connect(pHE2.waterOutA, waterOutA) annotation (Line(points={{32,-36},{
                32,-50},{-40,-50},{-40,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(T_intermedB, intermediate_B.T) annotation (Line(points={{101,39},
                {40,39},{40,23.2},{28.6,23.2}}, color={0,0,127}));
        connect(intermediate_A.T, T_intermedA) annotation (Line(points={{28.6,
                -0.8},{52,-0.8},{52,59},{101,59}}, color={0,0,127}));
        connect(theta_valveA, valveA.theta)  annotation (Line(points={{101,-42},
                {-26,-42},{-26,-30.4}}, color={0,0,127}));
        connect(theta_valveB, valveB.theta) annotation (Line(points={{101,-63},
                {60,-63},{60,-46},{-36,-46},{-36,-10},{-26,-10},{-26,3.6}},
              color={0,0,127}));
        connect(LiquidWaterIn_A, valveA.inlet) annotation (Line(points={{-100,
                -42},{-60,-42},{-60,-24},{-34,-24}}, thickness=0.5,
            color={0,0,255}));
        connect(LiquidWaterIn_B, valveB.inlet) annotation (Line(points={{-100,
                -70},{-70,-70},{-70,10},{-34,10}}, thickness=0.5,
            color={0,0,255}));
        annotation (Diagram(graphics));
      end ParHE_Des;

      model HE_simp "Simplified Heat Exchanger fluid - gas"
        extends Interfaces.HeatExchanger(extSurfaceTub = exchSurface_G);

        parameter SI.CoefficientOfHeatTransfer gamma_G
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F
          "Constant heat transfer coefficient in the fluid side";
        constant Real pi=Modelica.Constants.pi;

      Water.Flow1D fluidFlow(
          Nt=1,
          N=N_F,
          wnom=fluidNomFlowRate,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          L=exchSurface_F^2/(fluidVol*pi*4),
          A=(fluidVol*4/exchSurface_F)^2/4*pi,
          omega=fluidVol*4/exchSurface_F*pi,
          Dhyd=fluidVol*4/exchSurface_F,
          FluidPhaseStart=FluidPhaseStart,
          pstart=pstart_F)       annotation (Placement(transformation(extent={{
                  -10,-50},{10,-30}}, rotation=0)));
        Thermal.ConvHT convHT(gamma=gamma_F, N=N_F)
          annotation (Placement(transformation(extent={{-10,-30},{10,-10}},
                rotation=0)));
        Thermal.MetalTube metalTube(
          rhomcm=rhomcm,
          lambda=lambda,
          N=N_F,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          L=exchSurface_F^2/(fluidVol*pi*4),
          rint=fluidVol*4/exchSurface_F/2,
          WallRes=false,
          rext=(metalVol + fluidVol)*4/extSurfaceTub/2,
          Tstartbar=Tstartbar_M)
                 annotation (Placement(transformation(extent={{-10,10},{10,-10}},
                rotation=0)));
        Gas.Flow1D gasFlow(
          Dhyd=1,
          wnom=gasNomFlowRate,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          QuasiStatic=true,
          N=N_G,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FlueGasMedium,
          pstart=pstart_G,
          L=L,
          A=gasVol/L,
          omega=exchSurface_G/L,
          Tstartbar=Tstartbar_G)  annotation (Placement(transformation(extent={{
                  -12,50},{12,30}}, rotation=0)));
        Thermal.ConvHT2N convHT2N(
          N1=N_G,
          N2=N_F,
          gamma=gamma_G)       annotation (Placement(transformation(extent={{
                  -10,10},{10,30}}, rotation=0)));
        final parameter SI.Distance L=1 "Tube length";
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart=Choices.FluidPhase.FluidPhases.Liquid
          "Fluid phase (only for initialization!)"
                                                  annotation(Dialog(tab="Initialization"));
      equation
        connect(fluidFlow.wall, convHT.side2)
                                           annotation (Line(points={{0,-35},{0,
                -23.1}}, color={255,127,0}));
        connect(gasFlow.infl, gasIn) annotation (Line(
            points={{-12,40},{-100,40},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(gasFlow.outfl, gasOut) annotation (Line(
            points={{12,40},{100,40},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(fluidFlow.outfl, waterOut)
                                        annotation (Line(points={{10,-40},{60,
                -40},{60,-100},{0,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidFlow.infl, waterIn)
                                      annotation (Line(points={{-10,-40},{-40,
                -40},{-40,100},{0,100}}, thickness=0.5,
            color={0,0,255}));
        connect(convHT2N.side1,gasFlow. wall) annotation (Line(points={{0,23},{
                0,35}}, color={255,127,0}));
        connect(metalTube.int, convHT.side1) annotation (Line(points={{0,-3},{0,
                -17}}, color={255,127,0}));
        connect(metalTube.ext, convHT2N.side2) annotation (Line(points={{0,3.1},
                {0,16.9}}, color={255,127,0}));
        annotation (Diagram(graphics));
      end HE_simp;

      model HE2ph_simp "Simplified Heat Exchanger fluid - gas (2phases)"
        extends Interfaces.HeatExchanger(extSurfaceTub = exchSurface_G);

        parameter SI.CoefficientOfHeatTransfer gamma_G
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F
          "Constant heat transfer coefficient in the fluid side";
        constant Real pi=Modelica.Constants.pi;

      Water.Flow1D2ph fluidFlow(
          Nt=1,
          N=N_F,
          wnom=fluidNomFlowRate,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          L=exchSurface_F^2/(fluidVol*pi*4),
          A=(fluidVol*4/exchSurface_F)^2/4*pi,
          omega=fluidVol*4/exchSurface_F*pi,
          Dhyd=fluidVol*4/exchSurface_F,
          FluidPhaseStart=FluidPhaseStart,
          pstart=pstart_F)       annotation (Placement(transformation(extent={{
                  -10,-50},{10,-30}}, rotation=0)));
        Thermal.ConvHT convHT(gamma=gamma_F, N=N_F)
          annotation (Placement(transformation(extent={{-10,-30},{10,-10}},
                rotation=0)));
        Thermal.MetalTube metalTube(
          rhomcm=rhomcm,
          lambda=lambda,
          N=N_F,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          L=exchSurface_F^2/(fluidVol*pi*4),
          rint=fluidVol*4/exchSurface_F/2,
          WallRes=false,
          rext=(metalVol + fluidVol)*4/extSurfaceTub/2,
          Tstartbar=Tstartbar_M)
                 annotation (Placement(transformation(extent={{-10,10},{10,-10}},
                rotation=0)));
        Gas.Flow1D gasFlow(
          Dhyd=1,
          wnom=gasNomFlowRate,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          QuasiStatic=true,
          N=N_G,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FlueGasMedium,
          pstart=pstart_G,
          L=L,
          A=gasVol/L,
          omega=exchSurface_G/L,
          Tstartbar=Tstartbar_G)  annotation (Placement(transformation(extent={{
                  -12,50},{12,30}}, rotation=0)));
        Thermal.ConvHT2N convHT2N(
          N1=N_G,
          N2=N_F,
          gamma=gamma_G)       annotation (Placement(transformation(extent={{
                  -10,10},{10,30}}, rotation=0)));
        final parameter SI.Distance L=1 "Tube length";
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart=Choices.FluidPhase.FluidPhases.TwoPhases
          "Fluid phase (only for initialization!)"
                                                  annotation(Dialog(tab="Initialization"));
      equation
        connect(fluidFlow.wall, convHT.side2)
                                           annotation (Line(points={{0,-35},{0,
                -23.1}}, color={255,127,0}));
        connect(gasFlow.infl, gasIn) annotation (Line(
            points={{-12,40},{-100,40},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(gasFlow.outfl, gasOut) annotation (Line(
            points={{12,40},{100,40},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(fluidFlow.outfl, waterOut)
                                        annotation (Line(points={{10,-40},{60,
                -40},{60,-100},{0,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidFlow.infl, waterIn)
                                      annotation (Line(points={{-10,-40},{-40,
                -40},{-40,100},{0,100}}, thickness=0.5,
            color={0,0,255}));
        connect(convHT2N.side1,gasFlow. wall) annotation (Line(points={{0,23},{
                0,35}}, color={255,127,0}));
        connect(metalTube.int, convHT.side1) annotation (Line(points={{0,-3},{0,
                -17}}, color={255,127,0}));
        connect(metalTube.ext, convHT2N.side2) annotation (Line(points={{0,3.1},
                {0,16.9}}, color={255,127,0}));
        annotation (Diagram(graphics));
      end HE2ph_simp;

      model ParHE_simp "Simplified parallel heat exchangers fluid - gas"
        extends Interfaces.ParallelHE(extSurfaceTub_A = exchSurface_G_A,
                                      extSurfaceTub_B = exchSurface_G_B);

        parameter SI.CoefficientOfHeatTransfer gamma_G_A
          "Constant heat transfer coefficient in the gas side"     annotation (Dialog(group = "side A"));
        parameter SI.CoefficientOfHeatTransfer gamma_G_B
          "Constant heat transfer coefficient in the gas side"     annotation (Dialog(group = "side B"));
        parameter SI.CoefficientOfHeatTransfer gamma_F_A
          "Constant heat transfer coefficient in the fluid side"     annotation (Dialog(group = "side A"));
        parameter SI.CoefficientOfHeatTransfer gamma_F_B
          "Constant heat transfer coefficient in the fluid side"     annotation (Dialog(group = "side B"));
        constant Real pi=Modelica.Constants.pi;

        ConvParallel convParallel(
          N=N_G,
          As=exchSurface_G_A + exchSurface_G_B,
          Aa=exchSurface_G_A,
          Ab=exchSurface_G_B)
                             annotation (Placement(transformation(extent={{-10,
                  16},{10,36}}, rotation=0)));
      Water.Flow1D fluidAFlow(
          Nt=1,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          N=N_F_A,
          L=exchSurface_F_A^2/(fluidVol_A*pi*4),
          A=(fluidVol_A*4/exchSurface_F_A)^2/4*pi,
          omega=fluidVol_A*4/exchSurface_F_A*pi,
          Dhyd=fluidVol_A*4/exchSurface_F_A,
          wnom=fluidNomFlowRate_A,
          FluidPhaseStart=FluidPhaseStart_A,
          pstart=pstart_F_A)     annotation (Placement(transformation(extent={{
                  -38,-52},{-18,-32}}, rotation=0)));
        Thermal.ConvHT convHT_A(
          N=N_F_A,
          gamma=gamma_F_A)
          annotation (Placement(transformation(extent={{-38,-30},{-18,-10}},
                rotation=0)));
        Thermal.MetalTube metalTube_A(
          lambda=lambda,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          N=N_F_A,
          L=exchSurface_F_A^2/(fluidVol_A*pi*4),
          rint=fluidVol_A*4/exchSurface_F_A/2,
          WallRes=false,
          rext=(metalVol_A + fluidVol_A)*4/extSurfaceTub_A/2,
          rhomcm=rhomcm_A,
          Tstartbar=Tstartbar_M_A)
                 annotation (Placement(transformation(extent={{-38,6},{-18,-14}},
                rotation=0)));
        Gas.Flow1D gasFlow(
          Dhyd=1,
          wnom=gasNomFlowRate,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          QuasiStatic=true,
          N=N_G,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FlueGasMedium,
          pstart=pstart_G,
          L=L,
          A=gasVol/L,
          omega=(exchSurface_G_A + exchSurface_G_B)/L,
          Tstartbar=Tstartbar_G)  annotation (Placement(transformation(extent={{
                  -12,64},{12,44}}, rotation=0)));
      Water.Flow1D fluidBFlow(
          Nt=1,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          N=N_F_B,
          L=exchSurface_F_B^2/(fluidVol_B*pi*4),
          A=(fluidVol_B*4/exchSurface_F_B)^2/4*pi,
          omega=fluidVol_B*4/exchSurface_F_B*pi,
          Dhyd=fluidVol_B*4/exchSurface_F_B,
          wnom=fluidNomFlowRate_B,
          FluidPhaseStart=FluidPhaseStart_B,
          pstart=pstart_F_B)     annotation (Placement(transformation(extent={{
                  38,-52},{18,-32}}, rotation=0)));
        Thermal.ConvHT convHT_B(
          N=N_F_B,
          gamma=gamma_F_B)
          annotation (Placement(transformation(extent={{18,-30},{38,-10}},
                rotation=0)));
        Thermal.MetalTube metalTube_B(
          lambda=lambda,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          L=exchSurface_F_B^2/(fluidVol_B*pi*4),
          rint=fluidVol_B*4/exchSurface_F_B/2,
          N=N_F_B,
          WallRes=false,
          rext=(metalVol_B + fluidVol_B)*4/extSurfaceTub_B/2,
          rhomcm=rhomcm_B,
          Tstartbar=Tstartbar_M_B)
                 annotation (Placement(transformation(extent={{18,6},{38,-14}},
                rotation=0)));
        Thermal.ConvHT2N convHT2N_A(
          N1=N_G,
          N2=N_F_A,
          gamma=gamma_G_A)       annotation (Placement(transformation(extent={{
                  -38,10},{-18,30}}, rotation=0)));
        Thermal.ConvHT2N convHT2N_B(
          N1=N_G,
          N2=N_F_B,
          gamma=gamma_G_B)       annotation (Placement(transformation(extent={{
                  18,10},{38,30}}, rotation=0)));
        final parameter SI.Distance L=1 "Tube length";
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart_A=Choices.FluidPhase.FluidPhases.Liquid
          "Fluid phase (only for initialization!)"
                                                  annotation(Dialog(tab="Initialization",group = "side A"));
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart_B=Choices.FluidPhase.FluidPhases.Liquid
          "Fluid phase (only for initialization!)"
                                                  annotation(Dialog(tab="Initialization",group = "side B"));
      equation
        connect(convHT_A.side2, fluidAFlow.wall)    annotation (Line(points={{
                -28,-23.1},{-28,-37}}, color={255,127,0}));
        connect(convHT_B.side2, fluidBFlow.wall)    annotation (Line(points={{
                28,-23.1},{28,-37}}, color={255,127,0}));
        connect(fluidBFlow.outfl, waterOutB)    annotation (Line(points={{18,
                -42},{8,-42},{8,-100},{40,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidAFlow.outfl, waterOutA)    annotation (Line(points={{-18,
                -42},{-8,-42},{-8,-100},{-40,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidAFlow.infl, waterInA)    annotation (Line(points={{-38,-42},
                {-50,-42},{-50,100},{-40,100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidBFlow.infl, waterInB)    annotation (Line(points={{38,-42},
                {52,-42},{52,100},{40,100}}, thickness=0.5,
            color={0,0,255}));
        connect(gasFlow.outfl, gasOut)   annotation (Line(
            points={{12,54},{100,54},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(gasFlow.infl, gasIn)   annotation (Line(
            points={{-12,54},{-100,54},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(convParallel.source, gasFlow.wall)   annotation (Line(points={{
                0,33},{0,49}}, color={255,127,0}));
        connect(convHT2N_A.side1, convParallel.objectA)
                                                      annotation (Line(points={
                {-28,23},{-28,36},{-14,36},{-14,6},{-6,6},{-6,23}}, color={255,
                127,0}));
        connect(convParallel.objectB, convHT2N_B.side1)
                                                       annotation (Line(points=
                {{6,23},{6,6},{14,6},{14,36},{28,36},{28,23}}, color={255,127,0}));
        connect(metalTube_A.int, convHT_A.side1) annotation (Line(points={{-28,
                -7},{-28,-17}}, color={255,127,0}));
        connect(metalTube_A.ext, convHT2N_A.side2)
                                                 annotation (Line(points={{-28,
                -0.9},{-28,16.9}}, color={255,127,0}));
        connect(convHT_B.side1, metalTube_B.int) annotation (Line(points={{28,
                -17},{28,-7}}, color={255,127,0}));
        connect(metalTube_B.ext, convHT2N_B.side2)
                                                  annotation (Line(points={{28,-0.9},
                {28,16.9}},       color={255,127,0}));
        annotation (Diagram(graphics));
      end ParHE_simp;

      model HEhtc_f
        "Heat Exchanger fluid - gas, with variable heat transfer coefficient only fluid side"
        extends Interfaces.HeatExchanger;

        parameter SI.CoefficientOfHeatTransfer gamma_nom_G
          "Nominal h.t.c. coefficient gas side";
        parameter Real kw_G
          "Exponent of the mass flow rate in the h.t.c. correlation gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F
          "Constant heat transfer coefficient in the fluid side";
        parameter Boolean gasQuasiStatic=false
          "Quasi-static model of the flue gas (mass, energy and momentum static balances";
        parameter Boolean counterCurrent=true "Counter-current flow";
        constant Real pi=Modelica.Constants.pi;

        Thermal.MetalTube metalTube(
          rhomcm=rhomcm,
          lambda=lambda,
          N=N_F,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          L=exchSurface_F^2/(fluidVol*pi*4),
          rint=fluidVol*4/exchSurface_F/2,
          WallRes=false,
          rext=(metalVol + fluidVol)*4/extSurfaceTub/2,
          Tstartbar=Tstartbar_M)
                 annotation (Placement(transformation(extent={{-10,-4},{10,-24}},
                rotation=0)));
        FlowGas1Dhtc gasFlow(
          Dhyd=1,
          wnom=gasNomFlowRate,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          N=N_G,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FlueGasMedium,
          pstart=pstart_G,
          QuasiStatic=gasQuasiStatic,
          L=L,
          A=gasVol/L,
          omega=exchSurface_G/L,
          gamma_nom=gamma_nom_G,
          kw=kw_G,
          Tstartbar=Tstartbar_G) annotation (Placement(transformation(extent={{-12,66},
                  {12,46}},         rotation=0)));
        Thermal.CounterCurrent cC(counterCurrent=counterCurrent, N=N_F)
          annotation (Placement(transformation(extent={{-10,-8},{10,12}},
                rotation=0)));
        Thermal.HeatFlowDistribution heatFlowDistribution(
          N=N_F,
          A1=exchSurface_G,
          A2=extSurfaceTub)
          annotation (Placement(transformation(extent={{-10,8},{10,28}},
                rotation=0)));
        Water.Flow1D fluidFlow_Extension(         Nt=1,
          N=N_F,
          wnom=fluidNomFlowRate,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          L=exchSurface_F^2/(fluidVol*pi*4),
          A=(fluidVol*4/exchSurface_F)^2/4*pi,
          omega=fluidVol*4/exchSurface_F*pi,
          Dhyd=fluidVol*4/exchSurface_F,
          FluidPhaseStart=FluidPhaseStart,
          pstart=pstart_F)
          annotation (Placement(transformation(extent={{-10,-56},{10,-36}},
                rotation=0)));
        Thermal.ConvHT convHT_htc(
          N=N_F, gamma=gamma_F)
                               annotation (Placement(transformation(extent={{
                  -10,-20},{10,-40}}, rotation=0)));
        Thermal.ConvHT2N_htc convHT2N(
          N1=N_G,
          N2=N_F)              annotation (Placement(transformation(extent={{
                  -10,24},{10,44}}, rotation=0)));
        final parameter SI.Distance L=1 "Tube length";
        parameter Choices.FluidPhase.FluidPhases FluidPhaseStart=Choices.FluidPhase.FluidPhases.Liquid
          "Fluid phase (only for initialization!)"
                                                  annotation(Dialog(tab="Initialization"));
      equation
        connect(gasFlow.infl, gasIn) annotation (Line(
            points={{-12,56},{-100,56},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(gasFlow.outfl, gasOut) annotation (Line(
            points={{12,56},{100,56},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(heatFlowDistribution.side2,cC. side1) annotation (Line(points={
                {0,14.9},{0,5}}, color={255,127,0}));
        connect(fluidFlow_Extension.infl, waterIn)   annotation (Line(points={{
                -10,-46},{-40,-46},{-40,100},{0,100}}, thickness=0.5,
            color={0,0,255}));
        connect(fluidFlow_Extension.outfl, waterOut)   annotation (Line(points=
                {{10,-46},{40,-46},{40,-100},{0,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(convHT2N.side2, heatFlowDistribution.side1) annotation (Line(
              points={{0,30.9},{0,21}}, color={255,127,0}));
        connect(metalTube.ext, cC.side2) annotation (Line(points={{0,-10.9},{0,
                -1.1}}, color={255,127,0}));
        connect(convHT2N.side1, gasFlow.wall) annotation (Line(
            points={{0,37},{0,51}},
            color={0,0,255},
            smooth=Smooth.None));
        connect(convHT_htc.side2, metalTube.int) annotation (Line(
            points={{0,-26.9},{0,-17}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(fluidFlow_Extension.wall, convHT_htc.side1) annotation (Line(
            points={{0,-41},{0,-33}},
            color={255,127,0},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end HEhtc_f;

      model DrumSensors
        extends Water.Drum;
        Modelica.Blocks.Interfaces.RealOutput p_out "Pressure sensor output"
                                                 annotation (Placement(
              transformation(extent={{-26,64},{-46,84}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput y_out "Level sensor output"
                                            annotation (Placement(
              transformation(extent={{-58,30},{-78,50}}, rotation=0)));
      equation
        y_out = y;
        p_out = p;
        annotation (Icon(graphics={Text(
                extent={{-76,102},{-4,82}},
                lineColor={0,0,0},
                textString=
                     "p"), Text(
                extent={{-106,70},{-34,50}},
                lineColor={0,0,0},
                textString=
                     "y")}),
                          Diagram(graphics));
      end DrumSensors;

      model Flow1Dhtc
        "Extension of the Water.Flow1D for fluid flow model with variable heat transfer coefficient"
        extends ThermoPower.Water.Flow1D(redeclare ThermoPower.Thermal.DHThtc
            wall);
        parameter SI.CoefficientOfHeatTransfer gamma_nom
          "Nominal h.t.c. coefficient";
        parameter Real kw
          "Exponent of the mass flow rate in the h.t.c. correlation";
      equation
        for j in 1:N loop
          wall.gamma[j] = homotopy(gamma_nom*noEvent(abs(infl.m_flow/wnom)^kw), gamma_nom);
        end for;
        annotation (Diagram(graphics));
      end Flow1Dhtc;

      model Flow1D2phhtc
        "Extension of the Water.Flow1D2ph for fluid flow model with variable heat transfer coefficient"
        extends ThermoPower.Water.Flow1D2ph(redeclare
            ThermoPower.Thermal.DHThtc wall);
        parameter SI.CoefficientOfHeatTransfer gamma_nom
          "Nominal h.t.c. coefficient";
        parameter Real kw
          "Exponent of the mass flow rate in the h.t.c. correlation";
      equation
        for j in 1:N loop
          wall.gamma[j] = homotopy(gamma_nom*noEvent(abs(infl.m_flow/wnom)^kw), gamma_nom);
        end for;
        annotation (Diagram(graphics));
      end Flow1D2phhtc;

      model FlowGas1Dhtc
        "Extension of the Gas.Flow1D for fluid flow model with variable heat transfer coefficient"
        extends Gas.Flow1D( redeclare ThermoPower.Thermal.DHThtc wall);
        parameter SI.CoefficientOfHeatTransfer gamma_nom
          "Nominal h.t.c. coefficient";
        parameter Real kw
          "Exponent of the mass flow rate in the h.t.c. correlation";
      equation
        for j in 1:N loop
          wall.gamma[j] = homotopy(gamma_nom*noEvent(abs(infl.m_flow/wnom)^kw), gamma_nom);
        end for;
        annotation (Diagram(graphics));
      end FlowGas1Dhtc;

      model ConvParallel
        "Convective heat transfer between one source and two objects in parallel"
        import Modelica.SIunits.*;
        parameter Integer N=2 "Number of Nodes";
        parameter Area As = Aa+Ab "Area of source" annotation(Evaluate=true);
        parameter Area Aa = 1 "Area of object a" annotation(Evaluate=true);
        parameter Area Ab = 1 "Area of object b" annotation(Evaluate=true);
        ThermoPower.Thermal.DHT source(N=N)
                       annotation (Placement(transformation(extent={{-40,60},{
                  40,80}}, rotation=0)));
        ThermoPower.Thermal.DHT objectA(N=N)
                       annotation (Placement(transformation(extent={{-100,-40},
                  {-20,-20}}, rotation=0)));
        ThermoPower.Thermal.DHT objectB(N=N)
                       annotation (Placement(transformation(extent={{20,-40},{
                  100,-20}}, rotation=0)));

      equation
        source.phi*As + objectA.phi*Aa + objectB.phi*Ab = zeros(N)
          "Energy balance";
        source.T = objectA.T;
        source.T = objectB.T;
        annotation (Icon(graphics={
              Text(
                extent={{-100,-42},{-20,-80}},
                lineColor={191,95,0},
                textString=
                     "A"),
              Rectangle(
                extent={{-100,60},{100,-20}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Forward),
              Line(
                points={{-8,60},{-60,-20}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-56,-2},{-60,-20},{-44,-12}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{60,-2},{62,-20},{48,-8}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{10,60},{62,-20}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{26,50},{10,60},{12,42}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-24,52},{-8,60},{-12,44}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-110,-74},{112,-100}},
                lineColor={191,95,0},
                textString=
                     "%name"),
              Text(
                extent={{20,-40},{100,-80}},
                lineColor={191,95,0},
                textString=
                     "B")}),     Documentation(info="<HTML>
<p>The model connected to the <tt>source</tt> connector exchanges power \"in parallel\" with the models connected to the <tt>objectA</tt> and <tt>objectB</tt> connectors.
</HTML>",     revisions=""),
          Diagram(graphics));
      end ConvParallel;

      model BaseReader_water
        "Base reader for the visualization of the state in the simulation (water)"
        replaceable package Medium = Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance "Medium model";
        parameter Boolean allowFlowReversal = system.allowFlowReversal
          "= true to allow flow reversal, false restricts to design direction";
        outer ThermoPower.System system "System wide properties";

        Water.FlangeA inlet( redeclare package Medium = Medium, m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
                                        annotation (Placement(transformation(
                extent={{-80,-20},{-40,20}}, rotation=0)));
        Water.FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0))
                                         annotation (Placement(transformation(
                extent={{40,-20},{80,20}}, rotation=0)));
      equation
        inlet.m_flow + outlet.m_flow = 0 "Mass balance";
        inlet.p = outlet.p "No pressure drop";

        // Boundary conditions
        inlet.h_outflow = inStream(outlet.h_outflow);
        inStream(inlet.h_outflow) = outlet.h_outflow;
        annotation (
          Diagram(graphics),
          Icon(graphics={Polygon(
                points={{-80,0},{0,32},{80,0},{0,-32},{-80,0}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-80,20},{80,-20}},
                lineColor={255,255,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "S")}),
          Documentation(info="<HTML>
<p>This component can be inserted in a hydraulic circuit to measure the temperature of the fluid flowing through it.
<p>Flow reversal is supported.
</HTML>",   revisions="<html>
<ul>
<li><i>16 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Standard medium definition added.</li>
<li><i>1 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
      end BaseReader_water;

      model StateReader_water
        "State reader for the visualization of the state in the simulation (water)"
        extends ThermoPower.PowerPlants.HRSG.Components.BaseReader_water;
        SI.Temperature T "Temperature";
        SI.Pressure p "Pressure";
        SI.SpecificEnthalpy h "Specific enthalpy";
        SI.MassFlowRate w "Mass flow rate";
        Medium.ThermodynamicState fluidState "Thermodynamic state of the fluid";
      equation
        // Set fluid state
        p = inlet.p;
        h = homotopy(if not allowFlowReversal then inStream(inlet.h_outflow) else actualStream(inlet.h_outflow),
                     inStream(inlet.h_outflow));
        fluidState = Medium.setState_ph(p,h);
        T = Medium.temperature(fluidState);
        w = inlet.m_flow;
      end StateReader_water;

      model BaseReader_gas
        "Base reader for the visualization of the state in the simulation (gas)"
        replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
        parameter Boolean allowFlowReversal = system.allowFlowReversal
          "= true to allow flow reversal, false restricts to design direction";
        outer ThermoPower.System system "System wide properties";
        Gas.FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
          annotation (Placement(transformation(extent={{-80,-20},{-40,20}},
                rotation=0)));
        Gas.FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0))
          annotation (Placement(transformation(extent={{40,-20},{80,20}},
                rotation=0)));
      equation
        inlet.m_flow + outlet.m_flow=0 "Mass balance";
        inlet.p = outlet.p "Momentum balance";
        // Energy balance
        inlet.h_outflow = inStream(outlet.h_outflow);
        inStream(inlet.h_outflow) = outlet.h_outflow;
        // Independent composition mass balances
        inlet.Xi_outflow = inStream(outlet.Xi_outflow);
        inStream(inlet.Xi_outflow) = outlet.Xi_outflow;
        annotation (Diagram(graphics),
          Icon(graphics={Polygon(
                points={{-80,0},{0,30},{80,0},{0,-30},{-80,0}},
                lineColor={170,170,255},
                fillColor={170,170,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-80,20},{80,-20}},
                lineColor={255,255,255},
                fillColor={170,170,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "S")}));
      end BaseReader_gas;

      model StateReader_gas
        "State reader for the visualization of the state in the simulation (gas)"
        extends BaseReader_gas;
        Medium.BaseProperties gas;
        SI.Temperature T "Temperature";
        SI.Pressure p "Pressure";
        SI.SpecificEnthalpy h "Specific enthalpy";
        SI.MassFlowRate w "Mass flow rate";

      equation
        // Set gas properties
        inlet.p = gas.p;

        gas.h = homotopy(if not allowFlowReversal then inStream(inlet.h_outflow) else actualStream(inlet.h_outflow),
                         inStream(inlet.h_outflow));
        gas.Xi = homotopy(if not allowFlowReversal then inStream(inlet.Xi_outflow) else actualStream(inlet.Xi_outflow),
                          inStream(inlet.Xi_outflow));

        T = gas.T;
        p = gas.p;
        h = gas.h;
        w = inlet.m_flow;
      end StateReader_gas;

      model PrescribedSpeedPump "Prescribed speed pump"
        replaceable package WaterMedium =
            Modelica.Media.Interfaces.PartialTwoPhaseMedium;
        parameter SI.VolumeFlowRate q_nom[3] "Nominal volume flow rates";
        parameter SI.Height head_nom[3] "Nominal heads";
        parameter Integer Np0=1 "Nominal number of pumps in parallel";
        parameter SI.Volume V=0 "Pump Internal Volume";
        parameter SI.Density rho0 "Nominal density";
        parameter SI.Conversions.NonSIunits.AngularVelocity_rpm n0
          "Nominal rpm";
        parameter SI.Pressure nominalOutletPressure "Nominal outlet pressure";
        parameter SI.Pressure nominalInletPressure "Nominal inlet pressure";
        parameter SI.MassFlowRate nominalFlow "Nominal mass flow rate";
        parameter SI.SpecificEnthalpy hstart=1e5
          "Fluid Specific Enthalpy Start Value"
                                               annotation(Dialog(tab = "Initialization"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));
        function flowCharacteristic =
            ThermoPower.Functions.PumpCharacteristics.quadraticFlow (
              q_nom = q_nom, head_nom = head_nom);

        Water.FlangeA inlet(
          redeclare package Medium = WaterMedium)
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}},
                rotation=0)));
        Water.FlangeA outlet(
          redeclare package Medium = WaterMedium)
          annotation (Placement(transformation(extent={{80,-20},{120,20}},
                rotation=0)));
        Water.Pump feedWaterPump(     redeclare package Medium =
              WaterMedium,
          redeclare function flowCharacteristic = flowCharacteristic,
          n0=n0,
          hstart=hstart,
          Np0=Np0,
          rho0=rho0,
          V=V,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
              ThermoPower.Choices.Init.Options.noInit,
          dp0=nominalOutletPressure - nominalInletPressure,
          wstart=nominalFlow,
          w0=nominalFlow)
          annotation (Placement(transformation(extent={{-40,-24},{0,16}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealInput pumpSpeed_rpm
                                         annotation (Placement(transformation(
                extent={{-92,40},{-52,80}},  rotation=0), iconTransformation(extent={{
                  -92,40},{-52,80}})));

      equation
        connect(inlet, feedWaterPump.infl)
          annotation (Line(points={{-100,0},{-67,0},{-36,0}},
              thickness=0.5,
            color={0,0,255}));
        connect(pumpSpeed_rpm, feedWaterPump.in_n) annotation (Line(points={{-72,60},{
                -25.2,60},{-25.2,12}},           color={0,0,127}));
        connect(outlet, feedWaterPump.outfl) annotation (Line(points={{100,0},{
                10,0},{10,10},{-8,10}},     thickness=0.5,
            color={0,0,255}));
        annotation (Icon(graphics={
              Text(
                extent={{-100,-118},{100,-144}},
                lineColor={0,0,255},
                textString=
                     "%name"),
              Ellipse(
                extent={{-80,80},{80,-80}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere),
              Polygon(
                points={{-40,40},{-40,-40},{50,0},{-40,40}},
                lineColor={0,0,255},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={255,255,255})}),
                                Diagram(graphics));
      end PrescribedSpeedPump;

      model PumpControlledFlowRate "Pump with flow rate control"
        import ThermoPower;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialTwoPhaseMedium;

        parameter SI.VolumeFlowRate q_nom[3] "Nominal volume flow rates";
        parameter SI.Height head_nom[3] "Nominal heads";
        parameter Integer Np0=1 "Nominal number of pumps in parallel";
        parameter SI.Volume V=0 "Pump Internal Volume";
        parameter SI.Density rho0 "Nominal density";
        parameter SI.Conversions.NonSIunits.AngularVelocity_rpm n0
          "Nominal rpm";
        parameter SI.Pressure nominalOutletPressure "Nominal outlet pressure";
        parameter SI.Pressure nominalInletPressure "Nominal inlet pressure";
        parameter SI.MassFlowRate nominalFlow "Nominal mass flow rate";
        parameter SI.SpecificEnthalpy hstart=1e5
          "Fluid Specific Enthalpy Start Value"
                                               annotation(Dialog(tab = "Initialization"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));

        //PID for flow rate control
        parameter Real Kp=4 "Proportional gain (normalised units)"
          annotation (Dialog(tab="PID"));
        parameter SI.Time Ti=200 "Integral time"
          annotation (Dialog(tab="PID"));
        parameter SI.Time Td=0 "Derivative time"
          annotation (Dialog(tab="PID"));
        parameter Real PVmin=-1 "Minimum value of process variable for scaling"
          annotation (Dialog(tab="PID"));
        parameter Real PVmax=1 "Maximum value of process variable for scaling"
          annotation (Dialog(tab="PID"));
        parameter Real CSmin=500 "Minimum value of control signal for scaling"
          annotation (Dialog(tab="PID"));
        parameter Real CSmax=2500 "Maximum value of control signal for scaling"
          annotation (Dialog(tab="PID"));
        parameter Real PVstart=0.5 "Start value of PV (scaled)"
          annotation (Dialog(tab="PID"));
        parameter Real CSstart=0.5 "Start value of CS (scaled)"
          annotation (Dialog(tab="PID"));
        parameter SI.Time T_filter=1 "Time Constant of the filter"
          annotation (Dialog(tab="PID"));

      public
        ThermoPower.PowerPlants.HRSG.Components.PrescribedSpeedPump pump(
          redeclare package WaterMedium = FluidMedium,
          q_nom=q_nom,
          head_nom=head_nom,
          n0=n0,
          hstart=hstart,
          Np0=Np0,
          V=V,
          rho0=rho0,
          nominalOutletPressure=nominalOutletPressure,
          nominalInletPressure=nominalInletPressure,
          nominalFlow=nominalFlow,
          SSInit=SSInit)        annotation (Placement(transformation(
              origin={-24,0},
              extent={{16,16},{-16,-16}},
              rotation=180)));
        ThermoPower.Water.SensW feed_w(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={30,4},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        ThermoPower.Water.FlangeA inlet(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}},
                rotation=0)));
        ThermoPower.Water.FlangeB outlet(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{80,-20},{120,20}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealInput setpoint_FlowRate
                                         annotation (Placement(transformation(
                extent={{-120,54},{-88,86}}, rotation=0)));
        ThermoPower.PowerPlants.Control.PID pID(
          Kp=Kp,
          Ti=Ti,
          Td=Td,
          PVmin=PVmin,
          PVmax=PVmax,
          CSmin=CSmin,
          CSmax=CSmax,
          PVstart=PVstart,
          CSstart=CSstart,
          steadyStateInit=SSInit)
                           annotation (Placement(transformation(
              origin={0,50},
              extent={{-10,10},{10,-10}},
              rotation=180)));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(T=T_filter, y_start=n0,
          initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else Modelica.Blocks.Types.Init.NoInit)
          annotation (Placement(transformation(extent={{-26,40},{-46,60}},
                rotation=0)));

      equation
        connect(pID.PV, feed_w.w) annotation (Line(points={{10,46},{60,46},{60,
                10},{38,10}}, color={0,0,127}));
        connect(pID.SP, setpoint_FlowRate) annotation (Line(points={{10,54},{20,
                54},{20,70},{-104,70}}, color={0,0,127}));
        connect(firstOrder.u, pID.CS) annotation (Line(points={{-24,50},{-10,50}},
                      color={0,0,127}));
        connect(firstOrder.y, pump.pumpSpeed_rpm)          annotation (Line(
              points={{-47,50},{-60,50},{-60,9.6},{-35.52,9.6}}, color={0,0,127}));
        connect(outlet, feed_w.outlet) annotation (Line(
            points={{100,0},{68,0},{68,-8.88178e-016},{36,-8.88178e-016}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(feed_w.inlet, pump.outlet) annotation (Line(
            points={{24,8.88178e-016},{8,8.88178e-016},{8,-1.95943e-015},{-8,-1.95943e-015}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(pump.inlet, inlet) annotation (Line(
            points={{-40,1.95943e-015},{-66,1.95943e-015},{-66,0},{-100,0}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,255},
                fillColor={240,240,240},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,-118},{100,-144}},
                lineColor={0,0,255},
                textString=
                     "%name"),
              Ellipse(
                extent={{-62,60},{58,-60}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere),
              Polygon(
                points={{-32,32},{-32,-28},{46,0},{-32,32}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={255,255,255}),
              Rectangle(
                extent={{-88,90},{-48,50}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-86,88},{-50,52}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "C"),
              Line(points={{-48,70},{-2,70},{-2,60}}, color={0,0,127}),
              Line(
                points={{-62,0},{-80,0}},
                color={0,0,255},
                thickness=0.5),
              Line(points={{-70,0},{-70,50}}, color={0,0,255}),
              Polygon(
                points={{-70,46},{-72,40},{-68,40},{-70,46}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-30,72},{-30,68},{-24,70},{-30,72}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)}),
                                Diagram(graphics));
      end PumpControlledFlowRate;

      model PumpFilter "Pump with filter"
        import ThermoPower;
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialTwoPhaseMedium;

        parameter SI.VolumeFlowRate q_nom[3] "Nominal volume flow rates";
        parameter SI.Height head_nom[3] "Nominal heads";
        parameter Integer Np0=1 "Nominal number of pumps in parallel";
        parameter SI.Volume V=0 "Pump Internal Volume";
        parameter SI.Density rho0 "Nominal density";
        parameter SI.Conversions.NonSIunits.AngularVelocity_rpm n0
          "Nominal rpm";
        parameter SI.Pressure nominalOutletPressure "Nominal outlet pressure";
        parameter SI.Pressure nominalInletPressure "Nominal inlet pressure";
        parameter SI.MassFlowRate nominalFlow "Nominal mass flow rate";
        parameter SI.Time T_filter=1 "Time Constant of the filter"
          annotation (Dialog(group="Filter"));
        parameter SI.SpecificEnthalpy hstart=1e5
          "Fluid Specific Enthalpy Start Value"
                                               annotation(Dialog(tab = "Initialization"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));

      public
        ThermoPower.PowerPlants.HRSG.Components.PrescribedSpeedPump pump(
          redeclare package WaterMedium = FluidMedium,
          q_nom=q_nom,
          head_nom=head_nom,
          n0=n0,
          hstart=hstart,
          Np0=Np0,
          V=V,
          rho0=rho0,
          nominalOutletPressure=nominalOutletPressure,
          nominalInletPressure=nominalInletPressure,
          nominalFlow=nominalFlow,
          SSInit=SSInit)        annotation (Placement(transformation(
              origin={-4,0},
              extent={{16,16},{-16,-16}},
              rotation=180)));
        ThermoPower.Water.Flange inlet( redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}},
                rotation=0)));
        ThermoPower.Water.Flange outlet( redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{80,-20},{120,20}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealInput setpoint_FlowRate
                                         annotation (Placement(transformation(
                extent={{-120,54},{-88,86}}, rotation=0)));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(T=T_filter, y_start=n0,
          initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else Modelica.Blocks.Types.Init.NoInit)
          annotation (Placement(transformation(extent={{-10,40},{-30,60}},
                rotation=0)));
      equation
        connect(firstOrder.y, pump.pumpSpeed_rpm)          annotation (Line(
              points={{-31,50},{-60,50},{-60,9.6},{-15.52,9.6}},
                                                              color={0,0,127}));
        connect(firstOrder.u, setpoint_FlowRate) annotation (Line(points={{-8,
                50},{20,50},{20,70},{-104,70}}, color={0,0,127}));
        connect(pump.inlet, inlet) annotation (Line(
            points={{-20,1.95943e-015},{-59,1.95943e-015},{-59,0},{-100,0}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(pump.outlet, outlet) annotation (Line(
            points={{12,-1.95943e-015},{58,-1.95943e-015},{58,0},{100,0}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,255},
                fillColor={240,240,240},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-100,-118},{100,-144}},
                lineColor={0,0,255},
                textString=
                     "%name"),
              Ellipse(
                extent={{-62,60},{58,-60}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere),
              Polygon(
                points={{-32,32},{-32,-28},{46,0},{-32,32}},
                lineColor={0,0,0},
                pattern=LinePattern.None,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={255,255,255}),
              Rectangle(
                extent={{-88,90},{-48,50}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-86,88},{-50,52}},
                lineColor={0,0,255},
                fillColor={170,213,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "F"),
              Line(points={{-48,70},{-2,70},{-2,60}}, color={0,0,127}),
              Line(
                points={{-62,0},{-80,0}},
                color={0,0,255},
                thickness=0.5),
              Polygon(
                points={{-30,72},{-30,68},{-24,70},{-30,72}},
                lineColor={0,0,127},
                fillColor={0,0,127},
                fillPattern=FillPattern.Solid)}),
                                Diagram(graphics));
      end PumpFilter;
    end Components;

    package Control
      partial model InterfacesControl "Base of class for control"
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  -120,-20},{-80,20}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{80,-20},{120,20}}, rotation=0)));
        annotation (Icon(graphics={Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={240,240,240},
                fillPattern=FillPattern.Solid), Text(
                extent={{-80,80},{80,-80}},
                lineColor={0,0,0},
                textString=
                     "C")}),Diagram(graphics));
      end InterfacesControl;

      model levelsControl "PID controllers for levels control"
        extends InterfacesControl;

        //PID for level HP control
        parameter Real Kp_levelHP=3 "Proportional gain (normalised units)"
          annotation (Dialog(tab="PID - level HP"));
        parameter SI.Time Ti_levelHP=400 "Integral time"
          annotation (Dialog(tab="PID - level HP"));
        parameter SI.Time Td_levelHP=0 "Derivative time"
          annotation (Dialog(tab="PID - level HP"));
        parameter Real PVmin_levelHP=-1
          "Minimum value of process variable for scaling"
          annotation (Dialog(tab="PID - level HP"));
        parameter Real PVmax_levelHP=1
          "Maximum value of process variable for scaling"
          annotation (Dialog(tab="PID - level HP"));
        parameter Real CSmin_levelHP=30
          "Minimum value of control signal for scaling"
          annotation (Dialog(tab="PID - level HP"));
        parameter Real CSmax_levelHP=100
          "Maximum value of control signal for scaling"
          annotation (Dialog(tab="PID - level HP"));
        parameter Real PVstart_levelHP=0.5 "Start value of PV (scaled)"
          annotation (Dialog(tab="PID - level HP"));
        parameter Real CSstart_levelHP=0.5 "Start value of CS (scaled)"
          annotation (Dialog(tab="PID - level HP"));
        parameter SI.Length setPoint_levelHP=0 "Set point level of HP drum";

        //PID for level IP control
        parameter Real Kp_levelIP=3 "Proportional gain (normalised units)"
          annotation (Dialog(tab="PID - level IP"));
        parameter SI.Time Ti_levelIP=600 "Integral time"
          annotation (Dialog(tab="PID - level IP"));
        parameter SI.Time Td_levelIP=0 "Derivative time"
          annotation (Dialog(tab="PID - level IP"));
        parameter Real PVmin_levelIP=-1
          "Minimum value of process variable for scaling"
          annotation (Dialog(tab="PID - level IP"));
        parameter Real PVmax_levelIP=1
          "Maximum value of process variable for scaling"
          annotation (Dialog(tab="PID - level IP"));
        parameter Real CSmin_levelIP=8
          "Minimum value of control signal for scaling"
          annotation (Dialog(tab="PID - level IP"));
        parameter Real CSmax_levelIP=20
          "Maximum value of control signal for scaling"
          annotation (Dialog(tab="PID - level IP"));
        parameter Real PVstart_levelIP=0.5 "Start value of PV (scaled)"
          annotation (Dialog(tab="PID - level IP"));
        parameter Real CSstart_levelIP=0.5 "Start value of CS (scaled)"
          annotation (Dialog(tab="PID - level IP"));
        parameter SI.Length setPoint_levelIP=0 "Set point level of IP drum";

        //PID for level LP control
        parameter Real Kp_levelLP=3 "Proportional gain (normalised units)"
          annotation (Dialog(tab="PID - level LP"));
        parameter SI.Time Ti_levelLP=800 "Integral time"
          annotation (Dialog(tab="PID - level LP"));
        parameter SI.Time Td_levelLP=0 "Derivative time"
          annotation (Dialog(tab="PID - level LP"));
        parameter Real PVmin_levelLP=-1
          "Minimum value of process variable for scaling"
          annotation (Dialog(tab="PID - level LP"));
        parameter Real PVmax_levelLP=1
          "Maximum value of process variable for scaling"
          annotation (Dialog(tab="PID - level LP"));
        parameter Real CSmin_levelLP=500
          "Minimum value of control signal for scaling"
          annotation (Dialog(tab="PID - level LP"));
        parameter Real CSmax_levelLP=2500
          "Maximum value of control signal for scaling"
          annotation (Dialog(tab="PID - level LP"));
        parameter Real PVstart_levelLP=0.5 "Start value of PV (scaled)"
          annotation (Dialog(tab="PID - level LP"));
        parameter Real CSstart_levelLP=0.5 "Start value of CS (scaled)"
          annotation (Dialog(tab="PID - level LP"));
        parameter SI.Length setPoint_levelLP=0 "Set point level of LP drum";

         PowerPlants.Control.PID Level_HP(
          Kp=Kp_levelHP,
          Td=Td_levelHP,
          Ti=Ti_levelHP,
          PVmin=PVmin_levelHP,
          PVmax=PVmax_levelHP,
          CSmin=CSmin_levelHP,
          CSmax=CSmax_levelHP,
          PVstart=PVstart_levelHP,
          CSstart=CSstart_levelHP)
                      annotation (Placement(transformation(extent={{20,40},{40,
                  60}}, rotation=0)));
         PowerPlants.Control.PID Level_IP(
          Kp=Kp_levelIP,
          Td=Td_levelIP,
          Ti=Ti_levelIP,
          PVmin=PVmin_levelIP,
          PVmax=PVmax_levelIP,
          CSmin=CSmin_levelIP,
          CSmax=CSmax_levelIP,
          PVstart=PVstart_levelIP,
          CSstart=CSstart_levelIP)
                     annotation (Placement(transformation(extent={{20,-10},{40,
                  10}}, rotation=0)));
         PowerPlants.Control.PID Level_LP(
          Kp=Kp_levelLP,
          Td=Td_levelLP,
          Ti=Ti_levelLP,
          PVmin=PVmin_levelLP,
          PVmax=PVmax_levelLP,
          CSmin=CSmin_levelLP,
          CSmax=CSmax_levelLP,
          PVstart=PVstart_levelLP,
          CSstart=CSstart_levelLP)
                     annotation (Placement(transformation(extent={{20,-54},{40,
                  -34}}, rotation=0)));
      public
        Modelica.Blocks.Sources.Constant levelHP_SP(k=setPoint_levelHP)
          annotation (Placement(transformation(
              origin={-30,54},
              extent={{10,10},{-10,-10}},
              rotation=180)));
      public
        Modelica.Blocks.Sources.Constant levelIP_SP(k=setPoint_levelIP)
          annotation (Placement(transformation(
              origin={-30,4},
              extent={{10,10},{-10,-10}},
              rotation=180)));
      public
        Modelica.Blocks.Sources.Constant levelLP_SP(k=setPoint_levelLP)
          annotation (Placement(transformation(
              origin={-30,-40},
              extent={{10,10},{-10,-10}},
              rotation=180)));
      equation
        connect(SensorsBus.y_drumHP, Level_HP.PV) annotation (Line(points={{-100,0},
                {-60,0},{-60,30},{0,30},{0,46},{20,46}},    color={255,170,213}));
        connect(SensorsBus.y_drumIP, Level_IP.PV) annotation (Line(points={{
                -100,0},{-60,0},{-60,-20},{0,-20},{0,-4},{20,-4}}, color={255,
                170,213}));
        connect(SensorsBus.y_drumLP, Level_LP.PV) annotation (Line(points={{-100,0},
                {-60,0},{-60,-66},{0,-66},{0,-48},{20,-48}},    color={255,170,
                213}));
        connect(ActuatorsBus.flowRate_feedIP, Level_IP.CS) annotation (Line(
              points={{100,0},{40,0}},   color={213,255,170}));
        connect(ActuatorsBus.flowRate_feedHP, Level_HP.CS) annotation (Line(
              points={{100,0},{60,0},{60,50},{40,50}},   color={213,255,170}));
        connect(levelHP_SP.y, Level_HP.SP) annotation (Line(points={{-19,54},{
                20,54}}, color={0,0,127}));
        connect(levelIP_SP.y, Level_IP.SP) annotation (Line(points={{-19,4},{
                0.5,4},{0.5,4},{20,4}}, color={0,0,127}));
        connect(levelLP_SP.y, Level_LP.SP) annotation (Line(points={{-19,-40},{
                20,-40}}, color={0,0,127}));
        connect(ActuatorsBus.nPump_feedLP, Level_LP.CS) annotation (Line(points=
               {{100,0},{60,0},{60,-44},{40,-44}}, color={213,255,170}));
        annotation (Diagram(graphics));
      end levelsControl;

    end Control;

    package Examples "Example implementations"

      model HEG_2L "Heat Exchangers Group with two pressure level"
        extends ThermoPower.PowerPlants.HRSG.Interfaces.HEG_2L;

        parameter Real rhomcm
          "Metal heat capacity per unit volume (density by specific heat capacity)[J/m^3.K]";
        parameter SI.ThermalConductivity lambda
          "Thermal conductivity of the metal";
        constant Real pi=Modelica.Constants.pi;

        //Valve parameter
        parameter Real Cv_attShHP
          "Cv (US) flow coefficient, valve for Sh_HP attemperation" annotation (Dialog(group = "Attemperation"));
        parameter SI.Pressure pnom_attShHP
          "Nominal inlet pressure, valve for Sh_HP attemperation" annotation (Dialog(group = "Attemperation"));
        parameter SI.Pressure dpnom_attShHP
          "Nominal pressure drop, valve for Sh_HP attemperation" annotation (Dialog(group = "Attemperation"));
        parameter SI.MassFlowRate wnom_attShHP
          "Nominal mass flowrate, valve for Sh_HP attemperation" annotation (Dialog(group = "Attemperation"));
        parameter SI.SpecificEnthalpy valShHP_hstart=1e5
          "Start value of specific enthalpy, valve for Sh_HP attemperation" annotation (Dialog(group = "Attemperation"));

        replaceable Components.HE Sh2_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh2_HP_N_G,
          N_F=Sh2_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Sh,
          fluidNomPressure=fluidHPNomPressure_Sh,
          exchSurface_G=Sh2_HP_exchSurface_G,
          exchSurface_F=Sh2_HP_exchSurface_F,
          extSurfaceTub=Sh2_HP_extSurfaceTub,
          gasVol=Sh2_HP_gasVol,
          fluidVol=Sh2_HP_fluidVol,
          metalVol=Sh2_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Sh2_HP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh2_HP_N_G,
          N_F=Sh2_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Sh,
          fluidNomPressure=fluidHPNomPressure_Sh,
          exchSurface_G=Sh2_HP_exchSurface_G,
          exchSurface_F=Sh2_HP_exchSurface_F,
          extSurfaceTub=Sh2_HP_extSurfaceTub,
          gasVol=Sh2_HP_gasVol,
          fluidVol=Sh2_HP_fluidVol,
          metalVol=Sh2_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Sh2_HP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
          annotation (Placement(transformation(extent={{-350,-10},{-330,10}},
                rotation=0)));
        replaceable Components.HE Sh1_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh1_HP_N_G,
          N_F=Sh1_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidHPNomFlowRate_Sh,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidHPNomPressure_Sh,
          exchSurface_G=Sh1_HP_exchSurface_G,
          exchSurface_F=Sh1_HP_exchSurface_F,
          extSurfaceTub=Sh1_HP_extSurfaceTub,
          gasVol=Sh1_HP_gasVol,
          fluidVol=Sh1_HP_fluidVol,
          metalVol=Sh1_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Sh1_HP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh1_HP_N_G,
          N_F=Sh1_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidHPNomFlowRate_Sh,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidHPNomPressure_Sh,
          exchSurface_G=Sh1_HP_exchSurface_G,
          exchSurface_F=Sh1_HP_exchSurface_F,
          extSurfaceTub=Sh1_HP_extSurfaceTub,
          gasVol=Sh1_HP_gasVol,
          fluidVol=Sh1_HP_fluidVol,
          metalVol=Sh1_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Sh1_HP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
          annotation (Placement(transformation(extent={{-230,-10},{-210,10}},
                rotation=0)));
        replaceable Components.HE2ph Ev_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_HP_N_G,
          N_F=Ev_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidHPNomFlowRate_Ev,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidHPNomPressure_Ev,
          exchSurface_G=Ev_HP_exchSurface_G,
          exchSurface_F=Ev_HP_exchSurface_F,
          extSurfaceTub=Ev_HP_extSurfaceTub,
          gasVol=Ev_HP_gasVol,
          fluidVol=Ev_HP_fluidVol,
          metalVol=Ev_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ev_HP_Tstartbar)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_HP_N_G,
          N_F=Ev_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidHPNomFlowRate_Ev,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidHPNomPressure_Ev,
          exchSurface_G=Ev_HP_exchSurface_G,
          exchSurface_F=Ev_HP_exchSurface_F,
          extSurfaceTub=Ev_HP_extSurfaceTub,
          gasVol=Ev_HP_gasVol,
          fluidVol=Ev_HP_fluidVol,
          metalVol=Ev_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ev_HP_Tstartbar)
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                rotation=0)));
        replaceable Components.HE Ec_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_HP_N_G,
          N_F=Ec_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidHPNomFlowRate_Ec,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidHPNomPressure_Ec,
          exchSurface_G=Ec_HP_exchSurface_G,
          exchSurface_F=Ec_HP_exchSurface_F,
          extSurfaceTub=Ec_HP_extSurfaceTub,
          gasVol=Ec_HP_gasVol,
          fluidVol=Ec_HP_fluidVol,
          metalVol=Ec_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec_HP_Tstartbar)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
           N_G=Ec_HP_N_G,
          N_F=Ec_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidHPNomFlowRate_Ec,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidHPNomPressure_Ec,
          exchSurface_G=Ec_HP_exchSurface_G,
          exchSurface_F=Ec_HP_exchSurface_F,
          extSurfaceTub=Ec_HP_extSurfaceTub,
          gasVol=Ec_HP_gasVol,
          fluidVol=Ec_HP_fluidVol,
          metalVol=Ec_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec_HP_Tstartbar)
          annotation (Placement(transformation(extent={{30,-10},{50,10}},
                rotation=0)));
        replaceable Components.HE Sh_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_LP_N_G,
          N_F=Sh_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidLPNomFlowRate_Sh,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Sh,
          exchSurface_G=Sh_LP_exchSurface_G,
          exchSurface_F=Sh_LP_exchSurface_F,
          extSurfaceTub=Sh_LP_extSurfaceTub,
          gasVol=Sh_LP_gasVol,
          fluidVol=Sh_LP_fluidVol,
          metalVol=Sh_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Sh_LP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_LP_N_G,
          N_F=Sh_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidLPNomFlowRate_Sh,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Sh,
          exchSurface_G=Sh_LP_exchSurface_G,
          exchSurface_F=Sh_LP_exchSurface_F,
          extSurfaceTub=Sh_LP_extSurfaceTub,
          gasVol=Sh_LP_gasVol,
          fluidVol=Sh_LP_fluidVol,
          metalVol=Sh_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Sh_LP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
          annotation (Placement(transformation(extent={{-30,-10},{-10,10}},
                rotation=0)));
        replaceable Components.HE2ph Ev_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_LP_N_G,
          N_F=Ev_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidLPNomFlowRate_Ev,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Ev,
          exchSurface_G=Ev_LP_exchSurface_G,
          exchSurface_F=Ev_LP_exchSurface_F,
          extSurfaceTub=Ev_LP_extSurfaceTub,
          gasVol=Ev_LP_gasVol,
          fluidVol=Ev_LP_fluidVol,
          metalVol=Ev_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          FFtype_F=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          Tstartbar_G=Ev_LP_Tstartbar)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_LP_N_G,
          N_F=Ev_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidLPNomFlowRate_Ev,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Ev,
          exchSurface_G=Ev_LP_exchSurface_G,
          exchSurface_F=Ev_LP_exchSurface_F,
          extSurfaceTub=Ev_LP_extSurfaceTub,
          gasVol=Ev_LP_gasVol,
          fluidVol=Ev_LP_fluidVol,
          metalVol=Ev_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          FFtype_F=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          Tstartbar_G=Ev_LP_Tstartbar)
                         annotation (Placement(transformation(extent={{130,-10},
                  {150,10}}, rotation=0)));
        replaceable Components.HE Ec_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_LP_N_G,
          N_F=Ec_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Ec,
          fluidNomFlowRate=fluidLPNomFlowRate_Ec,
          exchSurface_G=Ec_LP_exchSurface_G,
          exchSurface_F=Ec_LP_exchSurface_F,
          extSurfaceTub=Ec_LP_extSurfaceTub,
          gasVol=Ec_LP_gasVol,
          fluidVol=Ec_LP_fluidVol,
          metalVol=Ec_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec_LP_Tstartbar)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_LP_N_G,
          N_F=Ec_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Ec,
          fluidNomFlowRate=fluidLPNomFlowRate_Ec,
          exchSurface_G=Ec_LP_exchSurface_G,
          exchSurface_F=Ec_LP_exchSurface_F,
          extSurfaceTub=Ec_LP_extSurfaceTub,
          gasVol=Ec_LP_gasVol,
          fluidVol=Ec_LP_fluidVol,
          metalVol=Ec_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec_LP_Tstartbar)                annotation (Placement(transformation(
                extent={{210,-10},{230,10}}, rotation=0)));
        Water.Mixer mixAtt(
          redeclare package Medium = FluidMedium,
          V=1,
          pstart=fluidHPNomPressure_Sh,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
          annotation (Placement(transformation(
              origin={-340,92},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.ValveLiq valveAttSh(
          redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          CheckValve=true,
          pnom=pnom_attShHP,
          dpnom=dpnom_attShHP,
          wnom=wnom_attShHP,
          Cv=Cv_attShHP) "valve for attemperation of the Sh"
                                annotation (Placement(transformation(
              origin={-346,130},
              extent={{-8,-8},{8,8}},
              rotation=270)));
        Water.SensT Sh2HPIn_T(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-344,48},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Water.SensT Sh2HPOut_T(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-344,-52},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        Water.FlowSplit flowSplit2(           redeclare package Medium =
              FluidMedium,
          rev_in1=false,
          rev_out1=false,
          rev_out2=false)
          annotation (Placement(transformation(
              origin={-120,166},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      equation
        connect(SensorsBus.T_Sh2HP_In, Sh2HPIn_T.T) annotation (Line(
            points={{400,140},{-148,140},{-148,-80},{-292,-80},{-292,16},{-350,16},{-350,
                40}},
            color={255,170,213},
            thickness=0.25));
        connect(SensorsBus.T_Sh2HP_Out, Sh2HPOut_T.T) annotation (Line(points={{400,140},
                {-148,140},{-148,-80},{-350,-80},{-350,-60}},           color={
                255,170,213}));
        connect(ActuatorsBus.theta_attShHP, valveAttSh.theta) annotation (Line(
            points={{400,80},{-320,80},{-320,130},{-339.6,130}},
            color={213,255,170},
            thickness=0.25));
        connect(mixAtt.in1, Sh1_HP.waterOut) annotation (Line(points={{-334,100},
                {-334,110},{-300,110},{-300,-40},{-220,-40},{-220,-10}},
              thickness=0.5,
            color={0,0,255}));
        connect(Sh2HPOut_T.inlet, Sh2_HP.waterOut) annotation (Line(points={{-340,-46},
                {-340,-28},{-340,-10}},thickness=0.5,
            color={0,0,255}));
        connect(Sh2_HP.waterIn, Sh2HPIn_T.outlet) annotation (Line(points={{-340,10},{
                -340,42}},           thickness=0.5,
            color={0,0,255}));
        connect(Sh2HPIn_T.inlet, mixAtt.out) annotation (Line(points={{-340,54},{-340,
                54},{-340,82}},
                            thickness=0.5,
            color={0,0,255}));
        connect(Sh1_HP.waterIn, Sh_HP_In) annotation (Line(points={{-220,10},{
                -220,40},{-280,40},{-280,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ev_HP.waterOut, Ev_HP_Out) annotation (Line(points={{-100,-10},
                {-100,-40},{-136,-40},{-136,60},{-240,60},{-240,200}},
              thickness=0.5,
            color={0,0,255}));
        connect(Ev_HP.waterIn, Ev_HP_In) annotation (Line(points={{-100,10},{
                -100,70},{-200,70},{-200,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ec_HP.waterOut, Ec_HP_Out) annotation (Line(points={{40,-10},{
                40,-40},{20,-40},{20,100},{-160,100},{-160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Sh_LP.waterIn, Sh_LP_In) annotation (Line(points={{-20,10},{-20,
                52},{60,52},{60,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Sh_LP.waterOut, Sh_LP_Out) annotation (Line(points={{-20,-10},{
                -20,-80},{140,-80},{140,-200}}, thickness=0.5,
            color={0,0,255}));
        connect(Sh_HP_Out, Sh2HPOut_T.outlet) annotation (Line(points={{-200,-200},{-200,
                -140},{-340,-140},{-340,-58}},             thickness=0.5,
            color={0,0,255}));
        connect(Ev_LP.waterIn, Ev_LP_In) annotation (Line(points={{140,10},{140,
                200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ev_LP.waterOut, Ev_LP_Out) annotation (Line(points={{140,-10},{
                140,-40},{100,-40},{100,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ec_LP.waterOut, Ec_LP_Out) annotation (Line(points={{220,-10},{
                220,-40},{180,-40},{180,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ec_LP.waterIn, Ec_LP_In) annotation (Line(points={{220,10},{220,
                200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ec_LP.gasOut, GasOut) annotation (Line(
            points={{230,0},{237,0},{237,1.77636e-015},{400,1.77636e-015}},
            color={159,159,223},
            thickness=0.5));
        connect(Ec_LP.gasIn, Ev_LP.gasOut) annotation (Line(
            points={{210,0},{150,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_LP.gasIn, Ec_HP.gasOut) annotation (Line(
            points={{130,0},{50,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ec_HP.gasIn, Sh_LP.gasOut) annotation (Line(
            points={{30,0},{-10,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh_LP.gasIn, Ev_HP.gasOut) annotation (Line(
            points={{-30,0},{-90,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_HP.gasIn, Sh1_HP.gasOut) annotation (Line(
            points={{-110,0},{-210,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh1_HP.gasIn, Sh2_HP.gasOut) annotation (Line(
            points={{-230,0},{-330,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh2_HP.gasIn, GasIn) annotation (Line(
            points={{-350,0},{-355,0},{-355,1.77636e-015},{-400,1.77636e-015}},
            color={159,159,223},
            thickness=0.5));

        connect(mixAtt.in2, valveAttSh.outlet) annotation (Line(points={{-346,
                100},{-346,122}},  thickness=0.5,
            color={0,0,255}));
        connect(flowSplit2.in1, Ec_HP_In)
          annotation (Line(points={{-120,172},{-120,200}}, thickness=0.5,
            color={0,0,255}));
        connect(flowSplit2.out2, valveAttSh.inlet) annotation (Line(points={{
                -124,160},{-124,150},{-346,150},{-346,138}}, thickness=0.5,
            color={0,0,255}));
        connect(flowSplit2.out1, Ec_HP.waterIn) annotation (Line(points={{-116,
                160},{-116,150},{40,150},{40,10}},          thickness=0.5,
            color={0,0,255}));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-400,
                  -200},{400,200}}),
                            graphics));
      end HEG_2L;

      model HEG_2LRh "Heat Exchangers Group with two pressure level and reheat"
        extends ThermoPower.PowerPlants.HRSG.Interfaces.HEG_2LRh(
                                    Rh1_IP_Tstartbar = Sh1_HP_Tstartbar,
                                    Rh2_IP_Tstartbar = Sh2_HP_Tstartbar,
                                    Rh2_IP_N_G = Sh2_HP_N_G,
                                    Rh1_IP_N_G = Sh1_HP_N_G,
                                    Rh2_IP_gasVol = Sh2_HP_gasVol,
                                    Rh1_IP_gasVol = Sh1_HP_gasVol);

        parameter Real rhomcm
          "Metal heat capacity per unit volume (density by specific heat capacity) [J/m^3.K]";
        parameter SI.ThermalConductivity lambda
          "Thermal conductivity of the metal";
        constant Real pi=Modelica.Constants.pi;

        //Valves parameters
        parameter Real Cv_attShHP
          "Cv (US) flow coefficient, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter SI.Pressure pnom_attShHP
          "Nominal inlet pressure, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter SI.Pressure dpnom_attShHP
          "Nominal pressure drop, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter SI.MassFlowRate wnom_attShHP
          "Nominal mass flowrate, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter SI.SpecificEnthalpy valShHP_hstart
          "Specific enthalpy start value, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter Real Cv_attRhIP
          "Cv (US) flow coefficient, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));
        parameter SI.Pressure pnom_attRhIP
          "Nominal inlet pressure, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));
        parameter SI.Pressure dpnom_attRhIP
          "Nominal pressure drop, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));
        parameter SI.MassFlowRate wnom_attRhIP
          "Nominal mass flowrate, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));
        parameter SI.SpecificEnthalpy valRhIP_hstart
          "Specific enthalpy start value, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));

        replaceable Components.HE2ph Ev_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_HP_N_G,
          N_F=Ev_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ev,
          fluidNomPressure=fluidHPNomPressure_Ev,
          exchSurface_G=Ev_HP_exchSurface_G,
          exchSurface_F=Ev_HP_exchSurface_F,
          extSurfaceTub=Ev_HP_extSurfaceTub,
          gasVol=Ev_HP_gasVol,
          fluidVol=Ev_HP_fluidVol,
          metalVol=Ev_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ev_HP_Tstartbar)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_HP_N_G,
          N_F=Ev_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ev,
          fluidNomPressure=fluidHPNomPressure_Ev,
          exchSurface_G=Ev_HP_exchSurface_G,
          exchSurface_F=Ev_HP_exchSurface_F,
          extSurfaceTub=Ev_HP_extSurfaceTub,
          gasVol=Ev_HP_gasVol,
          fluidVol=Ev_HP_fluidVol,
          metalVol=Ev_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ev_HP_Tstartbar)
          annotation (Placement(transformation(extent={{-210,-10},{-190,10}},
                rotation=0)));
        replaceable Components.HE Ec_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_HP_N_G,
          N_F=Ec_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ec,
          fluidNomPressure=fluidHPNomPressure_Ec,
          exchSurface_G=Ec_HP_exchSurface_G,
          exchSurface_F=Ec_HP_exchSurface_F,
          extSurfaceTub=Ec_HP_extSurfaceTub,
          gasVol=Ec_HP_gasVol,
          fluidVol=Ec_HP_fluidVol,
          metalVol=Ec_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec_HP_Tstartbar)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_HP_N_G,
          N_F=Ec_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ec,
          fluidNomPressure=fluidHPNomPressure_Ec,
          exchSurface_G=Ec_HP_exchSurface_G,
          exchSurface_F=Ec_HP_exchSurface_F,
          extSurfaceTub=Ec_HP_extSurfaceTub,
          gasVol=Ec_HP_gasVol,
          fluidVol=Ec_HP_fluidVol,
          metalVol=Ec_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec_HP_Tstartbar)          annotation (Placement(transformation(extent={{38,-10},
                  {58,10}},           rotation=0)));
        replaceable Components.HE Sh_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_LP_N_G,
          N_F=Sh_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidLPNomFlowRate_Sh,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Sh,
          exchSurface_G=Sh_LP_exchSurface_G,
          exchSurface_F=Sh_LP_exchSurface_F,
          gasVol=Sh_LP_gasVol,
          fluidVol=Sh_LP_fluidVol,
          metalVol=Sh_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Sh_LP_extSurfaceTub,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh_LP_Tstartbar)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_LP_N_G,
          N_F=Sh_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidLPNomFlowRate_Sh,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Sh,
          exchSurface_G=Sh_LP_exchSurface_G,
          exchSurface_F=Sh_LP_exchSurface_F,
          gasVol=Sh_LP_gasVol,
          fluidVol=Sh_LP_fluidVol,
          metalVol=Sh_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Sh_LP_extSurfaceTub,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh_LP_Tstartbar)           annotation (Placement(transformation(extent=
                  {{-30,-10},{-10,10}}, rotation=0)));
        replaceable Components.HE2ph Ev_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_LP_N_G,
          N_F=Ev_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidLPNomFlowRate_Ev,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Ev,
          exchSurface_G=Ev_LP_exchSurface_G,
          exchSurface_F=Ev_LP_exchSurface_F,
          gasVol=Ev_LP_gasVol,
          fluidVol=Ev_LP_fluidVol,
          metalVol=Ev_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ev_LP_extSurfaceTub,
          Tstartbar_G=Ev_LP_Tstartbar)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_LP_N_G,
          N_F=Ev_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidLPNomFlowRate_Ev,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Ev,
          exchSurface_G=Ev_LP_exchSurface_G,
          exchSurface_F=Ev_LP_exchSurface_F,
          gasVol=Ev_LP_gasVol,
          fluidVol=Ev_LP_fluidVol,
          metalVol=Ev_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ev_LP_extSurfaceTub,
          Tstartbar_G=Ev_LP_Tstartbar) annotation (Placement(transformation(extent={{130,-10},
                  {150,10}}, rotation=0)));
        replaceable Components.HE Ec_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_LP_N_G,
          N_F=Ec_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Ec,
          fluidNomFlowRate=fluidLPNomFlowRate_Ec,
          exchSurface_G=Ec_LP_exchSurface_G,
          exchSurface_F=Ec_LP_exchSurface_F,
          extSurfaceTub=Ec_LP_extSurfaceTub,
          gasVol=Ec_LP_gasVol,
          fluidVol=Ec_LP_fluidVol,
          metalVol=Ec_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec_LP_Tstartbar)
                         constrainedby Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_LP_N_G,
          N_F=Ec_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomPressure=fluidLPNomPressure_Ec,
          fluidNomFlowRate=fluidLPNomFlowRate_Ec,
          exchSurface_G=Ec_LP_exchSurface_G,
          exchSurface_F=Ec_LP_exchSurface_F,
          extSurfaceTub=Ec_LP_extSurfaceTub,
          gasVol=Ec_LP_gasVol,
          fluidVol=Ec_LP_fluidVol,
          metalVol=Ec_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec_LP_Tstartbar)                annotation (Placement(transformation(
                extent={{210,-10},{230,10}}, rotation=0)));
        replaceable Components.ParHE Sh1HP_Rh1IP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          SSInit=SSInit,
          lambda=lambda,
          N_G=Sh1_HP_N_G,
          N_F_A=Sh1_HP_N_F,
          N_F_B=Rh1_IP_N_F,
          exchSurface_G_A=Sh1_HP_exchSurface_G,
          exchSurface_G_B=Rh1_IP_exchSurface_G,
          exchSurface_F_A=Sh1_HP_exchSurface_F,
          exchSurface_F_B=Rh1_IP_exchSurface_F,
          extSurfaceTub_A=Sh1_HP_extSurfaceTub,
          extSurfaceTub_B=Rh1_IP_extSurfaceTub,
          gasVol=Sh1_HP_gasVol,
          fluidVol_A=Sh1_HP_fluidVol,
          fluidVol_B=Rh1_IP_fluidVol,
          metalVol_A=Sh1_HP_metalVol,
          metalVol_B=Rh1_IP_metalVol,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          fluidNomFlowRate_B=fluidHPNomFlowRate_Sh,
          fluidNomPressure_B=fluidHPNomPressure_Sh,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh1_HP_Tstartbar)
                         constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.ParallelHE(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          SSInit=SSInit,
          lambda=lambda,
          N_G=Sh1_HP_N_G,
          N_F_A=Sh1_HP_N_F,
          N_F_B=Rh1_IP_N_F,
          exchSurface_G_A=Sh1_HP_exchSurface_G,
          exchSurface_G_B=Rh1_IP_exchSurface_G,
          exchSurface_F_A=Sh1_HP_exchSurface_F,
          exchSurface_F_B=Rh1_IP_exchSurface_F,
          extSurfaceTub_A=Sh1_HP_extSurfaceTub,
          extSurfaceTub_B=Rh1_IP_extSurfaceTub,
          gasVol=Sh1_HP_gasVol,
          fluidVol_A=Sh1_HP_fluidVol,
          fluidVol_B=Rh1_IP_fluidVol,
          metalVol_A=Sh1_HP_metalVol,
          metalVol_B=Rh1_IP_metalVol,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          fluidNomFlowRate_B=fluidHPNomFlowRate_Sh,
          fluidNomPressure_B=fluidHPNomPressure_Sh,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh1_HP_Tstartbar)
                         annotation (Placement(transformation(extent={{-288,-12},
                  {-264,12}}, rotation=0)));
        replaceable Components.ParHE Sh2HP_Rh2IP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          SSInit=SSInit,
          lambda=lambda,
          N_G=Sh2_HP_N_G,
          N_F_A=Sh2_HP_N_F,
          N_F_B=Rh2_IP_N_F,
          exchSurface_G_A=Sh2_HP_exchSurface_G,
          exchSurface_G_B=Rh2_IP_exchSurface_G,
          exchSurface_F_A=Sh2_HP_exchSurface_F,
          exchSurface_F_B=Rh2_IP_exchSurface_F,
          extSurfaceTub_A=Sh2_HP_extSurfaceTub,
          extSurfaceTub_B=Rh2_IP_extSurfaceTub,
          gasVol=Sh2_HP_gasVol,
          fluidVol_A=Sh2_HP_fluidVol,
          fluidVol_B=Rh2_IP_fluidVol,
          metalVol_A=Sh2_HP_metalVol,
          metalVol_B=Rh2_IP_metalVol,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          fluidNomPressure_B=fluidHPNomPressure_Sh,
          fluidNomFlowRate_B=fluidHPNomFlowRate_Sh,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh2_HP_Tstartbar)
                         constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.ParallelHE(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          SSInit=SSInit,
          lambda=lambda,
          N_G=Sh2_HP_N_G,
          N_F_A=Sh2_HP_N_F,
          N_F_B=Rh2_IP_N_F,
          exchSurface_G_A=Sh2_HP_exchSurface_G,
          exchSurface_G_B=Rh2_IP_exchSurface_G,
          exchSurface_F_A=Sh2_HP_exchSurface_F,
          exchSurface_F_B=Rh2_IP_exchSurface_F,
          extSurfaceTub_A=Sh2_HP_extSurfaceTub,
          extSurfaceTub_B=Rh2_IP_extSurfaceTub,
          gasVol=Sh2_HP_gasVol,
          fluidVol_A=Sh2_HP_fluidVol,
          fluidVol_B=Rh2_IP_fluidVol,
          metalVol_A=Sh2_HP_metalVol,
          metalVol_B=Rh2_IP_metalVol,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          fluidNomPressure_B=fluidHPNomPressure_Sh,
          fluidNomFlowRate_B=fluidHPNomFlowRate_Sh,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh2_HP_Tstartbar)
                         annotation (Placement(transformation(extent={{-360,-12},
                  {-336,12}}, rotation=0)));
      equation
        connect(Ec_LP.waterIn, Ec_LP_In) annotation (Line(points={{220,10},{220,
                200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ec_LP.waterOut, Ec_LP_Out) annotation (Line(points={{220,-10},{
                220,-40},{180,-40},{180,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ev_LP.waterOut, Ev_LP_Out) annotation (Line(points={{140,-10},{
                140,-40},{100,-40},{100,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ev_LP.waterIn, Ev_LP_In) annotation (Line(points={{140,10},{140,
                200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ec_LP.gasIn, Ev_LP.gasOut) annotation (Line(
            points={{210,0},{150,0}},
            color={159,159,223},
            thickness=0.5));
        connect(GasOut, Ec_LP.gasOut) annotation (Line(
            points={{400,1.77636e-015},{262,1.77636e-015},{262,0},{230,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_LP.gasIn, Ec_HP.gasOut) annotation (Line(
            points={{130,0},{58,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ec_HP.gasIn, Sh_LP.gasOut) annotation (Line(
            points={{38,0},{-10,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh_LP.gasIn, Ev_HP.gasOut) annotation (Line(
            points={{-30,0},{-190,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_HP.waterOut, Ev_HP_Out) annotation (Line(points={{-200,-10},
                {-200,-60},{-240,-60},{-240,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ev_HP.waterIn, Ev_HP_In) annotation (Line(points={{-200,10},{
                -200,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Sh_LP.waterIn, Sh_LP_In) annotation (Line(points={{-20,10},{-20,
                80},{60,80},{60,200}}, thickness=0.5,
            color={0,0,255}));
        connect(Ec_HP.waterIn, Ec_HP_In) annotation (Line(points={{48,10},{48,68},{-120,
                68},{-120,200}},           thickness=0.5,
            color={0,0,255}));
        connect(Ec_HP.waterOut, Ec_HP_Out) annotation (Line(points={{48,-10},{48,-40},
                {-160,-40},{-160,200}},         thickness=0.5,
            color={0,0,255}));
        connect(Sh_LP.waterOut, Sh_LP_Out) annotation (Line(points={{-20,-10},{
                -20,-60},{140,-60},{140,-200}}, thickness=0.5,
            color={0,0,255}));
        connect(Sh2HP_Rh2IP.gasIn, GasIn) annotation (Line(
            points={{-360,0},{-384,0},{-384,1.77636e-015},{-400,1.77636e-015}},
            color={159,159,223},
            thickness=0.5));

        connect(Sh1HP_Rh1IP.gasIn,Sh2HP_Rh2IP. gasOut) annotation (Line(
            points={{-288,0},{-336,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_HP.gasIn, Sh1HP_Rh1IP.gasOut) annotation (Line(
            points={{-210,0},{-264,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh1HP_Rh1IP.waterInB, Rh_IP_In) annotation (Line(points={{-271.2,
                12},{-271.2,44},{-252,44},{-252,-94},{1.77636e-015,-94},{
                1.77636e-015,-200}},  thickness=0.5,
            color={0,0,255}));
        connect(Sh1HP_Rh1IP.waterOutB, Sh2HP_Rh2IP.waterInB) annotation (Line(
              points={{-271.2,-12},{-270,-12},{-270,-58},{-324,-58},{-324,28},{
                -343.2,28},{-343.2,12}}, thickness=0.5,
            color={0,0,255}));
        connect(Sh1HP_Rh1IP.waterOutA, Sh2HP_Rh2IP.waterInA) annotation (Line(
              points={{-280.8,-12},{-280.8,-40},{-312,-40},{-312,50},{-352.8,50},
                {-352.8,12}}, thickness=0.5,
            color={0,0,255}));
        connect(Sh2HP_Rh2IP.waterOutA, Sh_HP_Out) annotation (Line(points={{
                -352.8,-12},{-352,-12},{-352,-148},{-200,-148},{-200,-200}},
              thickness=0.5,
            color={0,0,255}));
        connect(Sh1HP_Rh1IP.waterInA, Sh_HP_In) annotation (Line(points={{-280.8,
                12},{-280.8,103},{-280,103},{-280,200}},        thickness=0.5,
            color={0,0,255}));
        connect(Rh_IP_Out, Sh2HP_Rh2IP.waterOutB) annotation (Line(
            points={{-60,-200},{-60,-120},{-343.2,-120},{-343.2,-12}},
            color={0,0,255},
            thickness=0.5));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-400,-200},
                  {400,200}}),
                            graphics),
                             Icon(graphics));
      end HEG_2LRh;

      model HEG_3LRh
        "Heat Exchangers Group with three pressure level and reheat"
        extends ThermoPower.PowerPlants.HRSG.Interfaces.HEG_3LRh(
                                    Ec_IP_Tstartbar = Ec1_HP_Tstartbar,
                                    Rh1_IP_Tstartbar = Sh1_HP_Tstartbar,
                                    Rh2_IP_Tstartbar = Sh2_HP_Tstartbar,
                                    Rh2_IP_N_G = Sh2_HP_N_G,
                                    Rh1_IP_N_G = Sh1_HP_N_G,
                                    Rh2_IP_gasVol = Sh2_HP_gasVol,
                                    Rh1_IP_gasVol = Sh1_HP_gasVol,
                                    Ec_IP_N_G = Ec1_HP_N_G,
                                    Ec_IP_gasVol = Ec1_HP_gasVol);

        parameter Real rhomcm
          "Metal heat capacity per unit volume (density by specific heat capacity) [J/m^3.K]";
        parameter SI.ThermalConductivity lambda
          "Thermal conductivity of the metal";
        constant Real pi=Modelica.Constants.pi;

        parameter SI.Volume mixIP_V=3 "Internal volume of the IP mixer";

        replaceable Components.ParHE Sh1HP_Rh1IP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          SSInit=SSInit,
          lambda=lambda,
          N_G=Sh1_HP_N_G,
          N_F_A=Sh1_HP_N_F,
          N_F_B=Rh1_IP_N_F,
          exchSurface_G_A=Sh1_HP_exchSurface_G,
          exchSurface_G_B=Rh1_IP_exchSurface_G,
          exchSurface_F_A=Sh1_HP_exchSurface_F,
          exchSurface_F_B=Rh1_IP_exchSurface_F,
          extSurfaceTub_A=Sh1_HP_extSurfaceTub,
          extSurfaceTub_B=Rh1_IP_extSurfaceTub,
          gasVol=Sh1_HP_gasVol,
          fluidVol_A=Sh1_HP_fluidVol,
          fluidVol_B=Rh1_IP_fluidVol,
          metalVol_A=Sh1_HP_metalVol,
          metalVol_B=Rh1_IP_metalVol,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Rh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          fluidNomPressure_B=fluidIPNomPressure_Rh,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh1_HP_Tstartbar)
                         constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.ParallelHE(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          SSInit=SSInit,
          lambda=lambda,
          N_G=Sh1_HP_N_G,
          N_F_A=Sh1_HP_N_F,
          N_F_B=Rh1_IP_N_F,
          exchSurface_G_A=Sh1_HP_exchSurface_G,
          exchSurface_G_B=Rh1_IP_exchSurface_G,
          exchSurface_F_A=Sh1_HP_exchSurface_F,
          exchSurface_F_B=Rh1_IP_exchSurface_F,
          extSurfaceTub_A=Sh1_HP_extSurfaceTub,
          extSurfaceTub_B=Rh1_IP_extSurfaceTub,
          gasVol=Sh1_HP_gasVol,
          fluidVol_A=Sh1_HP_fluidVol,
          fluidVol_B=Rh1_IP_fluidVol,
          metalVol_A=Sh1_HP_metalVol,
          metalVol_B=Rh1_IP_metalVol,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Rh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          fluidNomPressure_B=fluidIPNomPressure_Rh,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh1_HP_Tstartbar)
                         annotation (Placement(transformation(extent={{-388,-12},
                  {-364,12}}, rotation=0)));
        replaceable Components.ParHE Sh2HP_Rh2IP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          SSInit=SSInit,
          lambda=lambda,
          N_G=Sh2_HP_N_G,
          N_F_A=Sh2_HP_N_F,
          N_F_B=Rh2_IP_N_F,
          exchSurface_G_A=Sh2_HP_exchSurface_G,
          exchSurface_G_B=Rh2_IP_exchSurface_G,
          exchSurface_F_A=Sh2_HP_exchSurface_F,
          exchSurface_F_B=Rh2_IP_exchSurface_F,
          extSurfaceTub_A=Sh2_HP_extSurfaceTub,
          extSurfaceTub_B=Rh2_IP_extSurfaceTub,
          gasVol=Sh2_HP_gasVol,
          fluidVol_A=Sh2_HP_fluidVol,
          fluidVol_B=Rh2_IP_fluidVol,
          metalVol_A=Sh2_HP_metalVol,
          metalVol_B=Rh2_IP_metalVol,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Rh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          fluidNomPressure_B=fluidIPNomPressure_Rh,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh2_HP_Tstartbar)
                         constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.ParallelHE(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          SSInit=SSInit,
          lambda=lambda,
          N_G=Sh2_HP_N_G,
          N_F_A=Sh2_HP_N_F,
          N_F_B=Rh2_IP_N_F,
          exchSurface_G_A=Sh2_HP_exchSurface_G,
          exchSurface_G_B=Rh2_IP_exchSurface_G,
          exchSurface_F_A=Sh2_HP_exchSurface_F,
          exchSurface_F_B=Rh2_IP_exchSurface_F,
          extSurfaceTub_A=Sh2_HP_extSurfaceTub,
          extSurfaceTub_B=Rh2_IP_extSurfaceTub,
          gasVol=Sh2_HP_gasVol,
          fluidVol_A=Sh2_HP_fluidVol,
          fluidVol_B=Rh2_IP_fluidVol,
          metalVol_A=Sh2_HP_metalVol,
          metalVol_B=Rh2_IP_metalVol,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Rh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          fluidNomPressure_B=fluidIPNomPressure_Rh,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G=Sh2_HP_Tstartbar)
                         annotation (Placement(transformation(extent={{-460,-12},
                  {-436,12}}, rotation=0)));
        replaceable Components.HE Ec2_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec2_HP_N_G,
          N_F=Ec2_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ec,
          fluidNomPressure=fluidHPNomPressure_Ec,
          exchSurface_G=Ec2_HP_exchSurface_G,
          exchSurface_F=Ec2_HP_exchSurface_F,
          extSurfaceTub=Ec2_HP_extSurfaceTub,
          gasVol=Ec2_HP_gasVol,
          fluidVol=Ec2_HP_fluidVol,
          metalVol=Ec2_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec2_HP_Tstartbar)
                          constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec2_HP_N_G,
          N_F=Ec2_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ec,
          fluidNomPressure=fluidHPNomPressure_Ec,
          exchSurface_G=Ec2_HP_exchSurface_G,
          exchSurface_F=Ec2_HP_exchSurface_F,
          extSurfaceTub=Ec2_HP_extSurfaceTub,
          gasVol=Ec2_HP_gasVol,
          fluidVol=Ec2_HP_fluidVol,
          metalVol=Ec2_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec2_HP_Tstartbar)          annotation (Placement(transformation(extent={{-90,12},
                  {-66,-12}},           rotation=0)));
        replaceable Components.ParHE Ec1HP_EcIP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec1_HP_N_G,
          N_F_A=Ec1_HP_N_F,
          N_F_B=Ec_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G_A=Ec1_HP_exchSurface_G,
          exchSurface_G_B=Ec_IP_exchSurface_G,
          exchSurface_F_A=Ec1_HP_exchSurface_F,
          exchSurface_F_B=Ec_IP_exchSurface_F,
          gasVol=Ec1_HP_gasVol,
          fluidVol_A=Ec1_HP_fluidVol,
          fluidVol_B=Ec_IP_fluidVol,
          metalVol_A=Ec1_HP_metalVol,
          metalVol_B=Ec_IP_metalVol,
          SSInit=SSInit,
          lambda=lambda,
          extSurfaceTub_A=Ec1_HP_extSurfaceTub,
          extSurfaceTub_B=Ec_IP_extSurfaceTub,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Ec,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Ec,
          fluidNomPressure_A=fluidHPNomPressure_Ec,
          fluidNomPressure_B=fluidIPNomPressure_Ec,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          Tstartbar_G=Ec1_HP_Tstartbar)
                           constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.ParallelHE(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec1_HP_N_G,
          N_F_A=Ec1_HP_N_F,
          N_F_B=Ec_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G_A=Ec1_HP_exchSurface_G,
          exchSurface_G_B=Ec_IP_exchSurface_G,
          exchSurface_F_A=Ec1_HP_exchSurface_F,
          exchSurface_F_B=Ec_IP_exchSurface_F,
          gasVol=Ec1_HP_gasVol,
          fluidVol_A=Ec1_HP_fluidVol,
          fluidVol_B=Ec_IP_fluidVol,
          metalVol_A=Ec1_HP_metalVol,
          metalVol_B=Ec_IP_metalVol,
          SSInit=SSInit,
          lambda=lambda,
          extSurfaceTub_A=Ec1_HP_extSurfaceTub,
          extSurfaceTub_B=Ec_IP_extSurfaceTub,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Ec,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Ec,
          fluidNomPressure_A=fluidHPNomPressure_Ec,
          fluidNomPressure_B=fluidIPNomPressure_Ec,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          Tstartbar_G=Ec1_HP_Tstartbar)
                         annotation (Placement(transformation(extent={{178,-12},
                  {202,12}}, rotation=0)));
        replaceable Components.HE Ec_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_LP_N_G,
          N_F=Ec_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ec_LP_exchSurface_G,
          exchSurface_F=Ec_LP_exchSurface_F,
          gasVol=Ec_LP_gasVol,
          fluidVol=Ec_LP_fluidVol,
          metalVol=Ec_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ec_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Ec,
          fluidNomPressure=fluidLPNomPressure_Ec,
          Tstartbar_G=Ec_LP_Tstartbar)              constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_LP_N_G,
          N_F=Ec_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ec_LP_exchSurface_G,
          exchSurface_F=Ec_LP_exchSurface_F,
          gasVol=Ec_LP_gasVol,
          fluidVol=Ec_LP_fluidVol,
          metalVol=Ec_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ec_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Ec,
          fluidNomPressure=fluidLPNomPressure_Ec,
          Tstartbar_G=Ec_LP_Tstartbar)       annotation (Placement(transformation(
                extent={{368,-12},{392,12}}, rotation=0)));
        replaceable Components.HE2ph Ev_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_LP_N_G,
          N_F=Ev_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ev_LP_exchSurface_G,
          exchSurface_F=Ev_LP_exchSurface_F,
          gasVol=Ev_LP_gasVol,
          fluidVol=Ev_LP_fluidVol,
          metalVol=Ev_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ev_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Ev,
          fluidNomPressure=fluidLPNomPressure_Ev,
          Tstartbar_G=Ev_LP_Tstartbar)            constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_LP_N_G,
          N_F=Ev_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ev_LP_exchSurface_G,
          exchSurface_F=Ev_LP_exchSurface_F,
          gasVol=Ev_LP_gasVol,
          fluidVol=Ev_LP_fluidVol,
          metalVol=Ev_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ev_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Ev,
          fluidNomPressure=fluidLPNomPressure_Ev,
          Tstartbar_G=Ev_LP_Tstartbar)
                         annotation (Placement(transformation(extent={{288,-14},{312,10}},
                             rotation=0)));
        replaceable Components.HE Ev_IP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_IP_N_G,
          N_F=Ev_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ev_IP_exchSurface_G,
          exchSurface_F=Ev_IP_exchSurface_F,
          gasVol=Ev_IP_gasVol,
          fluidVol=Ev_IP_fluidVol,
          metalVol=Ev_IP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ev_IP_extSurfaceTub,
          fluidNomFlowRate=fluidIPNomFlowRate_Ev,
          fluidNomPressure=fluidIPNomPressure_Ev,
          Tstartbar_G=Ev_IP_Tstartbar)            constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_IP_N_G,
          N_F=Ev_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ev_IP_exchSurface_G,
          exchSurface_F=Ev_IP_exchSurface_F,
          gasVol=Ev_IP_gasVol,
          fluidVol=Ev_IP_fluidVol,
          metalVol=Ev_IP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ev_IP_extSurfaceTub,
          fluidNomFlowRate=fluidIPNomFlowRate_Ev,
          fluidNomPressure=fluidIPNomPressure_Ev,
          Tstartbar_G=Ev_IP_Tstartbar)
          annotation (Placement(transformation(extent={{-12,-12},{12,12}},
                rotation=0)));
        replaceable Components.HE Sh_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_LP_N_G,
          N_F=Sh_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Sh_LP_exchSurface_G,
          exchSurface_F=Sh_LP_exchSurface_F,
          gasVol=Sh_LP_gasVol,
          fluidVol=Sh_LP_fluidVol,
          metalVol=Sh_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Sh_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Sh,
          fluidNomPressure=fluidLPNomPressure_Sh,
          Tstartbar_G=Sh_LP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                                                  constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_LP_N_G,
          N_F=Sh_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Sh_LP_exchSurface_G,
          exchSurface_F=Sh_LP_exchSurface_F,
          gasVol=Sh_LP_gasVol,
          fluidVol=Sh_LP_fluidVol,
          metalVol=Sh_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Sh_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Sh,
          fluidNomPressure=fluidLPNomPressure_Sh,
          Tstartbar_G=Sh_LP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                                   annotation (Placement(transformation(extent={{108,-12},
                  {132,12}},            rotation=0)));
        replaceable Components.HE2ph Ev_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_HP_N_G,
          N_F=Ev_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ev,
          fluidNomPressure=fluidHPNomPressure_Ev,
          exchSurface_G=Ev_HP_exchSurface_G,
          exchSurface_F=Ev_HP_exchSurface_F,
          extSurfaceTub=Ev_HP_extSurfaceTub,
          gasVol=Ev_HP_gasVol,
          fluidVol=Ev_HP_fluidVol,
          metalVol=Ev_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ev_HP_Tstartbar)
                          constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_HP_N_G,
          N_F=Ev_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ev,
          fluidNomPressure=fluidHPNomPressure_Ev,
          exchSurface_G=Ev_HP_exchSurface_G,
          exchSurface_F=Ev_HP_exchSurface_F,
          extSurfaceTub=Ev_HP_extSurfaceTub,
          gasVol=Ev_HP_gasVol,
          fluidVol=Ev_HP_fluidVol,
          metalVol=Ev_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ev_HP_Tstartbar)
          annotation (Placement(transformation(extent={{-312,-12},{-288,12}},
                rotation=0)));
        replaceable Components.HE Sh_IP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_IP_N_G,
          N_F=Sh_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidIPNomFlowRate_Sh,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Sh_IP_exchSurface_G,
          exchSurface_F=Sh_IP_exchSurface_F,
          extSurfaceTub=Sh_IP_extSurfaceTub,
          gasVol=Sh_IP_gasVol,
          fluidVol=Sh_IP_fluidVol,
          metalVol=Sh_IP_metalVol,
          rhomcm=rhomcm,
          SSInit=SSInit,
          fluidNomPressure=fluidIPNomPressure_Sh,
          lambda=lambda,
          Tstartbar_G=Sh_IP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                         constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_IP_N_G,
          N_F=Sh_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidIPNomFlowRate_Sh,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Sh_IP_exchSurface_G,
          exchSurface_F=Sh_IP_exchSurface_F,
          extSurfaceTub=Sh_IP_extSurfaceTub,
          gasVol=Sh_IP_gasVol,
          fluidVol=Sh_IP_fluidVol,
          metalVol=Sh_IP_metalVol,
          rhomcm=rhomcm,
          SSInit=SSInit,
          fluidNomPressure=fluidIPNomPressure_Sh,
          lambda=lambda,
          Tstartbar_G=Sh_IP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam) annotation (Placement(transformation(
                extent={{-218,-12},{-194,12}}, rotation=0)));
        Water.Mixer mixIP(
          redeclare package Medium = FluidMedium,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          V=mixIP_V,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          pstart=fluidIPNomPressure_Sh)
                          annotation (Placement(transformation(
              origin={-252,-110},
              extent={{-10,-10},{10,10}},
              rotation=180)));
      equation

        connect(Sh1HP_Rh1IP.gasIn, Sh2HP_Rh2IP.gasOut) annotation (Line(
            points={{-388,0},{-436,0}},
            color={159,159,223},
            thickness=0.5));
        connect(GasOut,Ec_LP. gasOut) annotation (Line(
            points={{500,1.77636e-015},{392,1.77636e-015},{392,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh_IP.gasIn,Ev_HP. gasOut) annotation (Line(
            points={{-218,0},{-288,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ec2_HP.gasIn,Sh_IP. gasOut) annotation (Line(
            points={{-90,0},{-90,0},{-194,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_IP.gasIn,Ec2_HP. gasOut) annotation (Line(
            points={{-12,0},{-12,0},{-66,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh_LP.gasIn,Ev_IP. gasOut) annotation (Line(
            points={{108,0},{84,0},{60,0},{12,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ec1HP_EcIP.gasIn,Sh_LP. gasOut) annotation (Line(
            points={{178,0},{132,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_LP.gasIn,Ec1HP_EcIP. gasOut) annotation (Line(
            points={{288,-2},{288,0},{202,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ec_LP.gasIn,Ev_LP. gasOut) annotation (Line(
            points={{368,0},{368,-2},{312,-2}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_HP.gasIn, Sh1HP_Rh1IP.gasOut) annotation (Line(
            points={{-312,0},{-364,0}},
            color={159,159,223},
            thickness=0.5));
        connect(mixIP.in1, Rh_IP_In) annotation (Line(points={{-244,-116},{-130,-116},
                {-130,-200}},       thickness=0.5,
            color={0,0,255}));
        connect(GasIn, Sh2HP_Rh2IP.gasIn) annotation (Line(
            points={{-500,1.77636e-015},{-480,1.77636e-015},{-480,0},{-460,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));

        connect(Ec_LP.waterIn, Ec_LP_In) annotation (Line(
            points={{380,12},{380,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec_LP.waterOut, Ec_LP_Out) annotation (Line(
            points={{380,-12},{380,-42},{340,-42},{340,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_LP.waterIn, Ev_LP_In) annotation (Line(
            points={{300,10},{300,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_LP_Out, Ev_LP.waterOut) annotation (Line(
            points={{260,200},{260,-40},{300,-40},{300,-14}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh_LP.waterIn, Sh_LP_In) annotation (Line(
            points={{120,12},{120,102},{220,102},{220,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh_LP.waterOut, Sh_LP_Out) annotation (Line(
            points={{120,-12},{120,-140},{300,-140},{300,-198}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec1HP_EcIP.waterOutB, Ec_IP_Out) annotation (Line(
            points={{194.8,-12},{194,-12},{194,-80},{40,-80},{40,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec1HP_EcIP.waterInB, Ec_IP_In) annotation (Line(
            points={{194.8,12},{194.8,160},{80,160},{80,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec1HP_EcIP.waterInA, Ec_HP_In) annotation (Line(
            points={{185.2,12},{184,12},{184,140},{-220,140},{-220,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec1HP_EcIP.waterOutA, Ec2_HP.waterIn) annotation (Line(
            points={{185.2,-12},{185.2,-60},{-78,-60},{-78,-12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_IP.waterIn, Ev_IP_In) annotation (Line(
            points={{0,12},{0,200},{1.77636e-015,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_IP.waterOut, Ev_IP_Out) annotation (Line(
            points={{0,-12},{0,-40},{-40,-40},{-40,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh_IP.waterIn, Sh_IP_In) annotation (Line(
            points={{-206,12},{-206,80},{-80,80},{-80,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh_IP.waterOut, mixIP.in2) annotation (Line(
            points={{-206,-12},{-206,-102},{-244,-102},{-244,-104}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(mixIP.out, Sh1HP_Rh1IP.waterInB) annotation (Line(
            points={{-262,-110},{-348,-110},{-348,38},{-371.2,38},{-371.2,12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh1HP_Rh1IP.waterOutB, Sh2HP_Rh2IP.waterInB) annotation (Line(
            points={{-371.2,-12},{-371.2,-50},{-420,-50},{-420,30},{-443.2,30},{-443.2,
                12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh1HP_Rh1IP.waterOutA, Sh2HP_Rh2IP.waterInA) annotation (Line(
            points={{-380.8,-12},{-380.8,-40},{-410,-40},{-410,40},{-452.8,40},{-452.8,
                12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh1HP_Rh1IP.waterInA, Sh_HP_In) annotation (Line(
            points={{-380.8,12},{-380.8,104},{-380,104},{-380,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh2HP_Rh2IP.waterOutA, Sh_HP_Out) annotation (Line(
            points={{-452.8,-12},{-452.8,-160},{-300,-160},{-300,-200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Rh_IP_Out, Sh2HP_Rh2IP.waterOutB) annotation (Line(
            points={{-190,-200},{-190,-140},{-443.2,-140},{-443.2,-12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_HP.waterIn, Ev_HP_In) annotation (Line(
            points={{-300,12},{-300,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_HP.waterOut, Ev_HP_Out) annotation (Line(
            points={{-300,-12},{-300,-42},{-340,-42},{-340,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec2_HP.waterOut, Ec_HP_Out) annotation (Line(
            points={{-78,12},{-78,60},{-260,60},{-260,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-500,-200},
                  {500,200}}),
                            graphics),
                             Icon(graphics),
          DymolaStoredErrors);
      end HEG_3LRh;

      model HEG_3LRh_des
        "Heat Exchangers Group with three pressure level, reheat and desuperheater"
        extends ThermoPower.PowerPlants.HRSG.Interfaces.HEG_3LRh(
                                    Ec_IP_Tstartbar = Ec1_HP_Tstartbar,
                                    Rh1_IP_Tstartbar = Sh1_HP_Tstartbar,
                                    Rh2_IP_Tstartbar = Sh2_HP_Tstartbar,
                                    Rh2_IP_N_G = Sh2_HP_N_G,
                                    Rh1_IP_N_G = Sh1_HP_N_G,
                                    Rh2_IP_gasVol = Sh2_HP_gasVol,
                                    Rh1_IP_gasVol = Sh1_HP_gasVol,
                                    Ec_IP_N_G = Ec1_HP_N_G,
                                    Ec_IP_gasVol = Ec1_HP_gasVol);

        parameter Real rhomcm
          "Metal heat capacity per unit volume (density by specific heat capacity) [J/m^3.K]";
        parameter SI.ThermalConductivity lambda
          "Thermal conductivity of the metal";
        constant Real pi=Modelica.Constants.pi;

        //Valves parameters
        parameter Real Cv_attShHP
          "Cv (US) flow coefficient, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter SI.Pressure pnom_attShHP
          "Nominal inlet pressure, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter SI.Pressure dpnom_attShHP
          "Nominal pressure drop, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter SI.MassFlowRate wnom_attShHP
          "Nominal mass flowrate, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter SI.SpecificEnthalpy valShHP_hstart
          "Specific enthalpy start value, valve for Sh_HP attemperation" annotation (dialog(group = "Attemperation Sh"));
        parameter Real Cv_attRhIP
          "Cv (US) flow coefficient, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));
        parameter SI.Pressure pnom_attRhIP
          "Nominal inlet pressure, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));
        parameter SI.Pressure dpnom_attRhIP
          "Nominal pressure drop, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));
        parameter SI.MassFlowRate wnom_attRhIP
          "Nominal mass flowrate, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));
        parameter SI.SpecificEnthalpy valRhIP_hstart
          "Specific enthalpy start value, valve for Rh_IP attemperation" annotation (dialog(group = "Attemperation Rh"));

        parameter SI.Volume mixIP_V=3 "Internal volume of the IP mixer";

        replaceable Components.ParHE_Des ShHP_RhIP(
          Cv_valA=Cv_attShHP,
          pnom_valA=pnom_attShHP,
          dpnom_valA=dpnom_attShHP,
          wnom_valA=wnom_attShHP,
          hstart_valA=valShHP_hstart,
          Cv_valB=Cv_attRhIP,
          pnom_valB=pnom_attRhIP,
          dpnom_valB=dpnom_attRhIP,
          wnom_valB=wnom_attRhIP,
          hstart_valB=valRhIP_hstart,
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          fluidNomPressure_B=fluidIPNomPressure_Rh,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Rh,
          rhomcm_A_p1=rhomcm,
          rhomcm_B_p1=rhomcm,
          rhomcm_A_p2=rhomcm,
          rhomcm_B_p2=rhomcm,
          lambda=lambda,
          N_G_p1=Sh1_HP_N_G,
          N_F_A_p1=Sh1_HP_N_F,
          N_F_B_p1=Rh1_IP_N_F,
          exchSurface_G_A_p1=Sh1_HP_exchSurface_G,
          exchSurface_G_B_p1=Rh1_IP_exchSurface_G,
          exchSurface_F_A_p1=Sh1_HP_exchSurface_F,
          exchSurface_F_B_p1=Rh1_IP_exchSurface_F,
          extSurfaceTub_A_p1=Sh1_HP_extSurfaceTub,
          extSurfaceTub_B_p1=Rh1_IP_extSurfaceTub,
          gasVol_p1=Sh1_HP_gasVol,
          fluidVol_A_p1=Sh1_HP_fluidVol,
          fluidVol_B_p1=Rh1_IP_fluidVol,
          metalVol_A_p1=Sh1_HP_metalVol,
          metalVol_B_p1=Rh1_IP_metalVol,
          N_G_p2=Sh2_HP_N_G,
          N_F_A_p2=Sh2_HP_N_F,
          N_F_B_p2=Rh2_IP_N_F,
          exchSurface_G_A_p2=Sh2_HP_exchSurface_G,
          exchSurface_G_B_p2=Rh2_IP_exchSurface_G,
          exchSurface_F_A_p2=Sh2_HP_exchSurface_F,
          exchSurface_F_B_p2=Rh2_IP_exchSurface_F,
          extSurfaceTub_A_p2=Sh2_HP_extSurfaceTub,
          extSurfaceTub_B_p2=Rh2_IP_extSurfaceTub,
          gasVol_p2=Sh2_HP_gasVol,
          fluidVol_A_p2=Sh2_HP_fluidVol,
          fluidVol_B_p2=Rh2_IP_fluidVol,
          metalVol_A_p2=Sh2_HP_metalVol,
          metalVol_B_p2=Rh2_IP_metalVol,
          SSInit=SSInit,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Liquid,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_G_p1=Sh2_HP_Tstartbar,
          Tstartbar_G_p2=Sh1_HP_Tstartbar)
                          constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.ParallelHE_Des(
                                                                     Cv_valA=Cv_attShHP,
          pnom_valA=pnom_attShHP,
          dpnom_valA=dpnom_attShHP,
          wnom_valA=wnom_attShHP,
          hstart_valA=valShHP_hstart,
          Cv_valB=Cv_attRhIP,
          pnom_valB=pnom_attRhIP,
          dpnom_valB=dpnom_attRhIP,
          wnom_valB=wnom_attRhIP,
          hstart_valB=valRhIP_hstart,
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Sh,
          fluidNomPressure_A=fluidHPNomPressure_Sh,
          fluidNomPressure_B=fluidIPNomPressure_Rh,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Rh,
          rhomcm_A_p1=rhomcm,
          rhomcm_B_p1=rhomcm,
          rhomcm_A_p2=rhomcm,
          rhomcm_B_p2=rhomcm,
          lambda=lambda,
          N_G_p1=Sh1_HP_N_G,
          N_F_A_p1=Sh1_HP_N_F,
          N_F_B_p1=Rh1_IP_N_F,
          exchSurface_G_A_p1=Sh1_HP_exchSurface_G,
          exchSurface_G_B_p1=Rh1_IP_exchSurface_G,
          exchSurface_F_A_p1=Sh1_HP_exchSurface_F,
          exchSurface_F_B_p1=Rh1_IP_exchSurface_F,
          extSurfaceTub_A_p1=Sh1_HP_extSurfaceTub,
          extSurfaceTub_B_p1=Rh1_IP_extSurfaceTub,
          gasVol_p1=Sh1_HP_gasVol,
          fluidVol_A_p1=Sh1_HP_fluidVol,
          fluidVol_B_p1=Rh1_IP_fluidVol,
          metalVol_A_p1=Sh1_HP_metalVol,
          metalVol_B_p1=Rh1_IP_metalVol,
          N_G_p2=Sh2_HP_N_G,
          N_F_A_p2=Sh2_HP_N_F,
          N_F_B_p2=Rh2_IP_N_F,
          exchSurface_G_A_p2=Sh2_HP_exchSurface_G,
          exchSurface_G_B_p2=Rh2_IP_exchSurface_G,
          exchSurface_F_A_p2=Sh2_HP_exchSurface_F,
          exchSurface_F_B_p2=Rh2_IP_exchSurface_F,
          extSurfaceTub_A_p2=Sh2_HP_extSurfaceTub,
          extSurfaceTub_B_p2=Rh2_IP_extSurfaceTub,
          gasVol_p2=Sh2_HP_gasVol,
          fluidVol_A_p2=Sh2_HP_fluidVol,
          fluidVol_B_p2=Rh2_IP_fluidVol,
          metalVol_A_p2=Sh2_HP_metalVol,
          metalVol_B_p2=Rh2_IP_metalVol,
          SSInit=SSInit,
          Tstartbar_G_p1=Sh2_HP_Tstartbar,
          Tstartbar_G_p2=Sh1_HP_Tstartbar,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Liquid,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)         annotation (Placement(transformation(extent={
                  {-454,-24},{-406,24}}, rotation=0)));
        Water.SensT ShHPOut_T(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-370,-156},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Water.SensT RhIPOut_T(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-380,-140},{-360,-120}},
                rotation=0)));

        Water.Mixer mixIP(
          redeclare package Medium = FluidMedium,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          V=mixIP_V,
          pstart=fluidIPNomPressure_Rh,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                          annotation (Placement(transformation(
              origin={-270,-110},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Water.FlowSplit flowSplit2(           redeclare package Medium =
              FluidMedium,
          rev_in1=false,
          rev_out1=false,
          rev_out2=false)
          annotation (Placement(transformation(
              origin={-220,150},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.FlowSplit flowSplit1(           redeclare package Medium =
              FluidMedium,
          rev_in1=false,
          rev_out1=false,
          rev_out2=false)
          annotation (Placement(transformation(
              origin={80,160},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        replaceable Components.HE Ec2_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec2_HP_N_G,
          N_F=Ec2_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ec,
          fluidNomPressure=fluidHPNomPressure_Ec,
          exchSurface_G=Ec2_HP_exchSurface_G,
          exchSurface_F=Ec2_HP_exchSurface_F,
          extSurfaceTub=Ec2_HP_extSurfaceTub,
          gasVol=Ec2_HP_gasVol,
          fluidVol=Ec2_HP_fluidVol,
          metalVol=Ec2_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec2_HP_Tstartbar)
                          constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec2_HP_N_G,
          N_F=Ec2_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ec,
          fluidNomPressure=fluidHPNomPressure_Ec,
          exchSurface_G=Ec2_HP_exchSurface_G,
          exchSurface_F=Ec2_HP_exchSurface_F,
          extSurfaceTub=Ec2_HP_extSurfaceTub,
          gasVol=Ec2_HP_gasVol,
          fluidVol=Ec2_HP_fluidVol,
          metalVol=Ec2_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ec2_HP_Tstartbar)          annotation (Placement(transformation(extent={{-92,12},
                  {-68,-12}},           rotation=0)));
        replaceable Components.ParHE Ec1HP_EcIP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec1_HP_N_G,
          N_F_A=Ec1_HP_N_F,
          N_F_B=Ec_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G_A=Ec1_HP_exchSurface_G,
          exchSurface_G_B=Ec_IP_exchSurface_G,
          exchSurface_F_A=Ec1_HP_exchSurface_F,
          exchSurface_F_B=Ec_IP_exchSurface_F,
          gasVol=Ec1_HP_gasVol,
          fluidVol_A=Ec1_HP_fluidVol,
          fluidVol_B=Ec_IP_fluidVol,
          metalVol_A=Ec1_HP_metalVol,
          metalVol_B=Ec_IP_metalVol,
          SSInit=SSInit,
          lambda=lambda,
          extSurfaceTub_A=Ec1_HP_extSurfaceTub,
          extSurfaceTub_B=Ec_IP_extSurfaceTub,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Ec,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Ec,
          fluidNomPressure_A=fluidHPNomPressure_Ec,
          fluidNomPressure_B=fluidIPNomPressure_Ec,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          Tstartbar_G=Ec1_HP_Tstartbar)
                           constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.ParallelHE(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec1_HP_N_G,
          N_F_A=Ec1_HP_N_F,
          N_F_B=Ec_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G_A=Ec1_HP_exchSurface_G,
          exchSurface_G_B=Ec_IP_exchSurface_G,
          exchSurface_F_A=Ec1_HP_exchSurface_F,
          exchSurface_F_B=Ec_IP_exchSurface_F,
          gasVol=Ec1_HP_gasVol,
          fluidVol_A=Ec1_HP_fluidVol,
          fluidVol_B=Ec_IP_fluidVol,
          metalVol_A=Ec1_HP_metalVol,
          metalVol_B=Ec_IP_metalVol,
          SSInit=SSInit,
          lambda=lambda,
          extSurfaceTub_A=Ec1_HP_extSurfaceTub,
          extSurfaceTub_B=Ec_IP_extSurfaceTub,
          fluidNomFlowRate_A=fluidHPNomFlowRate_Ec,
          fluidNomFlowRate_B=fluidIPNomFlowRate_Ec,
          fluidNomPressure_A=fluidHPNomPressure_Ec,
          fluidNomPressure_B=fluidIPNomPressure_Ec,
          rhomcm_A=rhomcm,
          rhomcm_B=rhomcm,
          Tstartbar_G=Ec1_HP_Tstartbar)
                         annotation (Placement(transformation(extent={{178,-12},{202,12}},
                             rotation=0)));
        replaceable Components.HE Ec_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_LP_N_G,
          N_F=Ec_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ec_LP_exchSurface_G,
          exchSurface_F=Ec_LP_exchSurface_F,
          gasVol=Ec_LP_gasVol,
          fluidVol=Ec_LP_fluidVol,
          metalVol=Ec_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ec_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Ec,
          fluidNomPressure=fluidLPNomPressure_Ec,
          Tstartbar_G=Ec_LP_Tstartbar)                constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_LP_N_G,
          N_F=Ec_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ec_LP_exchSurface_G,
          exchSurface_F=Ec_LP_exchSurface_F,
          gasVol=Ec_LP_gasVol,
          fluidVol=Ec_LP_fluidVol,
          metalVol=Ec_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ec_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Ec,
          fluidNomPressure=fluidLPNomPressure_Ec,
          Tstartbar_G=Ec_LP_Tstartbar)       annotation (Placement(transformation(
                extent={{368,-12},{392,12}}, rotation=0)));
        replaceable Components.HE2ph Ev_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_LP_N_G,
          N_F=Ev_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ev_LP_exchSurface_G,
          exchSurface_F=Ev_LP_exchSurface_F,
          gasVol=Ev_LP_gasVol,
          fluidVol=Ev_LP_fluidVol,
          metalVol=Ev_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ev_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Ev,
          fluidNomPressure=fluidLPNomPressure_Ev,
          Tstartbar_G=Ev_LP_Tstartbar)                constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ec_LP_N_G,
          N_F=Ec_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ec_LP_exchSurface_G,
          exchSurface_F=Ec_LP_exchSurface_F,
          gasVol=Ec_LP_gasVol,
          fluidVol=Ec_LP_fluidVol,
          metalVol=Ec_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ec_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Ec,
          fluidNomPressure=fluidLPNomPressure_Ec,
          Tstartbar_G=Ec_LP_Tstartbar)
                         annotation (Placement(transformation(extent={{288,-12},{312,12}},
                             rotation=0)));
        replaceable Components.HE2ph Ev_IP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_IP_N_G,
          N_F=Ev_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ev_IP_exchSurface_G,
          exchSurface_F=Ev_IP_exchSurface_F,
          gasVol=Ev_IP_gasVol,
          fluidVol=Ev_IP_fluidVol,
          metalVol=Ev_IP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ev_IP_extSurfaceTub,
          fluidNomFlowRate=fluidIPNomFlowRate_Ev,
          fluidNomPressure=fluidIPNomPressure_Ev,
          Tstartbar_G=Ev_IP_Tstartbar)                constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_IP_N_G,
          N_F=Ev_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Ev_IP_exchSurface_G,
          exchSurface_F=Ev_IP_exchSurface_F,
          gasVol=Ev_IP_gasVol,
          fluidVol=Ev_IP_fluidVol,
          metalVol=Ev_IP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Ev_IP_extSurfaceTub,
          fluidNomFlowRate=fluidIPNomFlowRate_Ev,
          fluidNomPressure=fluidIPNomPressure_Ev,
          Tstartbar_G=Ev_IP_Tstartbar)
          annotation (Placement(transformation(extent={{-12,-12},{12,12}},
                rotation=0)));
        replaceable Components.HE Sh_LP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_LP_N_G,
          N_F=Sh_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Sh_LP_exchSurface_G,
          exchSurface_F=Sh_LP_exchSurface_F,
          gasVol=Sh_LP_gasVol,
          fluidVol=Sh_LP_fluidVol,
          metalVol=Sh_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Sh_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Sh,
          fluidNomPressure=fluidLPNomPressure_Sh,
          Tstartbar_G=Sh_LP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                                                  constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_LP_N_G,
          N_F=Sh_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Sh_LP_exchSurface_G,
          exchSurface_F=Sh_LP_exchSurface_F,
          gasVol=Sh_LP_gasVol,
          fluidVol=Sh_LP_fluidVol,
          metalVol=Sh_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Sh_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Sh,
          fluidNomPressure=fluidLPNomPressure_Sh,
          Tstartbar_G=Sh_LP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                                   annotation (Placement(transformation(extent={{108,-12},
                  {132,12}},            rotation=0)));
        replaceable Components.HE2ph Ev_HP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_HP_N_G,
          N_F=Ev_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ev,
          fluidNomPressure=fluidHPNomPressure_Ev,
          exchSurface_G=Ev_HP_exchSurface_G,
          exchSurface_F=Ev_HP_exchSurface_F,
          extSurfaceTub=Ev_HP_extSurfaceTub,
          gasVol=Ev_HP_gasVol,
          fluidVol=Ev_HP_fluidVol,
          metalVol=Ev_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ev_HP_Tstartbar)
                          constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Ev_HP_N_G,
          N_F=Ev_HP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          fluidNomFlowRate=fluidHPNomFlowRate_Ev,
          fluidNomPressure=fluidHPNomPressure_Ev,
          exchSurface_G=Ev_HP_exchSurface_G,
          exchSurface_F=Ev_HP_exchSurface_F,
          extSurfaceTub=Ev_HP_extSurfaceTub,
          gasVol=Ev_HP_gasVol,
          fluidVol=Ev_HP_fluidVol,
          metalVol=Ev_HP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          Tstartbar_G=Ev_HP_Tstartbar)
          annotation (Placement(transformation(extent={{-312,-12},{-288,12}},
                rotation=0)));
        replaceable Components.HE Sh_IP(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_IP_N_G,
          N_F=Sh_IP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate=fluidIPNomFlowRate_Sh,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Sh_IP_exchSurface_G,
          exchSurface_F=Sh_IP_exchSurface_F,
          extSurfaceTub=Sh_IP_extSurfaceTub,
          gasVol=Sh_IP_gasVol,
          fluidVol=Sh_IP_fluidVol,
          metalVol=Sh_IP_metalVol,
          rhomcm=rhomcm,
          SSInit=SSInit,
          fluidNomPressure=fluidIPNomPressure_Sh,
          lambda=lambda,
          Tstartbar_G=Sh_IP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                         constrainedby
          ThermoPower.PowerPlants.HRSG.Interfaces.HeatExchanger(
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          N_G=Sh_LP_N_G,
          N_F=Sh_LP_N_F,
          gasNomFlowRate=gasNomFlowRate,
          gasNomPressure=gasNomPressure,
          exchSurface_G=Sh_LP_exchSurface_G,
          exchSurface_F=Sh_LP_exchSurface_F,
          gasVol=Sh_LP_gasVol,
          fluidVol=Sh_LP_fluidVol,
          metalVol=Sh_LP_metalVol,
          SSInit=SSInit,
          rhomcm=rhomcm,
          lambda=lambda,
          extSurfaceTub=Sh_LP_extSurfaceTub,
          fluidNomFlowRate=fluidLPNomFlowRate_Sh,
          fluidNomPressure=fluidLPNomPressure_Sh,
          Tstartbar_G=Sh_LP_Tstartbar,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam) annotation (Placement(transformation(
                extent={{-218,-12},{-194,12}}, rotation=0)));
      equation
        connect(SensorsBus.T_Sh2HP_In, ShHP_RhIP.T_intermedA) annotation (Line(
              points={{500,140},{-360,140},{-360,14},{-382,14},{-405.76,14.16}},
              color={255,170,213}));
        connect(SensorsBus.T_Rh2IP_In, ShHP_RhIP.T_intermedB) annotation (Line(
            points={{500,140},{-360,140},{-360,10},{-382,10},{-405.76,9.36}},
            color={255,170,213},
            thickness=0.25));
        connect(SensorsBus.T_Sh2HP_Out, ShHPOut_T.T) annotation (Line(points={{
                500,140},{-250,140},{-250,-150},{-362,-150}}, color={255,170,
                213}));
        connect(SensorsBus.T_Rh2IP_Out, RhIPOut_T.T) annotation (Line(points={{
                500,140},{-250,140},{-250,-124},{-362,-124}}, color={255,170,
                213}));
        connect(ActuatorsBus.theta_attShHP, ShHP_RhIP.theta_valveA) annotation (Line(
              points={{500,80},{440,80},{440,-92},{-360,-92},{-360,-8},{-362,
                -10},{-405.76,-10.08}}, color={213,255,170}));
        connect(ActuatorsBus.theta_attRhIP, ShHP_RhIP.theta_valveB) annotation (Line(
              points={{500,80},{440,80},{440,-92},{-360,-92},{-360,-16},{-382,
                -16},{-405.76,-15.12}}, color={213,255,170}));
        connect(RhIPOut_T.outlet, Rh_IP_Out) annotation (Line(points={{-364,
                -134},{-190,-134},{-190,-200}}, thickness=0.5,
            color={0,0,255}));
        connect(ShHPOut_T.outlet, Sh_HP_Out) annotation (Line(points={{-364,
                -160},{-300,-160},{-300,-200}}, thickness=0.5,
            color={0,0,255}));
        connect(ShHP_RhIP.gasIn, GasIn) annotation (Line(
            points={{-454,0},{-462,0},{-462,1.77636e-015},{-500,1.77636e-015}},
            color={159,159,223},
            thickness=0.5));

        connect(Rh_IP_In, mixIP.in1) annotation (Line(points={{-130,-200},{-130,
                -116},{-262,-116}}, thickness=0.5,
            color={0,0,255}));
        connect(flowSplit2.in1, Ec_HP_In)
          annotation (Line(points={{-220,156},{-220,200}}, thickness=0.5,
            color={0,0,255}));
        connect(flowSplit2.out2, ShHP_RhIP.LiquidWaterIn_A) annotation (Line(
              points={{-224,144},{-224,110},{-472,110},{-472,-10.08},{-454,
                -10.08}}, thickness=0.5,
            color={0,0,255}));
        connect(flowSplit1.in1, Ec_IP_In)
          annotation (Line(points={{80,166},{80,200}}, thickness=0.5,
            color={0,0,255}));
        connect(flowSplit1.out2, ShHP_RhIP.LiquidWaterIn_B) annotation (Line(
              points={{76,154},{76,120},{-480,120},{-480,-16.8},{-454,-16.8}},
              thickness=0.5,
            color={0,0,255}));
        connect(GasOut,Ec_LP. gasOut) annotation (Line(
            points={{500,1.77636e-015},{426,1.77636e-015},{392,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh_IP.gasIn,Ev_HP. gasOut) annotation (Line(
            points={{-218,0},{-288,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ec2_HP.gasIn,Sh_IP. gasOut) annotation (Line(
            points={{-92,0},{-194,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_IP.gasIn,Ec2_HP. gasOut) annotation (Line(
            points={{-12,0},{-68,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh_LP.gasIn,Ev_IP. gasOut) annotation (Line(
            points={{108,0},{12,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ec1HP_EcIP.gasIn,Sh_LP. gasOut) annotation (Line(
            points={{178,0},{132,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ev_LP.gasIn,Ec1HP_EcIP. gasOut) annotation (Line(
            points={{288,0},{202,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Ec_LP.gasIn,Ev_LP. gasOut) annotation (Line(
            points={{368,0},{312,0}},
            color={159,159,223},
            thickness=0.5));
        connect(ShHP_RhIP.gasOut, Ev_HP.gasIn) annotation (Line(
            points={{-406,0},{-312,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_HP.waterIn, Ev_HP_In) annotation (Line(
            points={{-300,12},{-300,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_HP.waterOut, Ev_HP_Out) annotation (Line(
            points={{-300,-12},{-300,-40},{-340,-40},{-340,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_LP.waterIn, Ev_LP_In) annotation (Line(
            points={{300,12},{300,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_LP.waterOut, Ev_LP_Out) annotation (Line(
            points={{300,-12},{300,-40},{262,-40},{262,200},{260,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec_LP.waterIn, Ec_LP_In) annotation (Line(
            points={{380,12},{380,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec_LP.waterOut, Ec_LP_Out) annotation (Line(
            points={{380,-12},{380,-40},{340,-40},{340,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh_LP.waterIn, Sh_LP_In) annotation (Line(
            points={{120,12},{120,80},{220,80},{220,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_IP.waterIn, Ev_IP_In) annotation (Line(
            points={{0,12},{0,106},{0,200},{1.77636e-015,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ev_IP.waterOut, Ev_IP_Out) annotation (Line(
            points={{0,-12},{0,-40},{-40,-40},{-40,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec_IP_Out, Ec1HP_EcIP.waterOutB) annotation (Line(
            points={{40,200},{40,-70},{194,-70},{194,-42},{194.8,-12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec1HP_EcIP.waterInB, flowSplit1.out1) annotation (Line(
            points={{194.8,12},{194.8,120},{84,120},{84,154}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec1HP_EcIP.waterInA, flowSplit2.out1) annotation (Line(
            points={{185.2,12},{185.2,100},{-216,100},{-216,144}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec1HP_EcIP.waterOutA, Ec2_HP.waterIn) annotation (Line(
            points={{185.2,-12},{185.2,-60},{-80,-60},{-80,-12}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh_LP.waterOut, Sh_LP_Out) annotation (Line(
            points={{120,-12},{120,-140},{300,-140},{300,-198}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Ec2_HP.waterOut, Ec_HP_Out) annotation (Line(
            points={{-80,12},{-80,80},{-260,80},{-260,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh_IP.waterIn, Sh_IP_In) annotation (Line(
            points={{-206,12},{-206,90},{-80,90},{-80,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Sh_IP.waterOut, mixIP.in2) annotation (Line(
            points={{-206,-12},{-208,-12},{-208,-104},{-262,-104}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(mixIP.out, ShHP_RhIP.waterInB) annotation (Line(
            points={{-280,-110},{-380,-110},{-380,58},{-420.4,58},{-420.4,24}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ShHP_RhIP.waterInA, Sh_HP_In) annotation (Line(
            points={{-439.6,24},{-440,52},{-440,78},{-380,78},{-380,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(RhIPOut_T.inlet, ShHP_RhIP.waterOutB) annotation (Line(
            points={{-376,-134},{-422,-134},{-422,-24},{-420.4,-24}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ShHPOut_T.inlet, ShHP_RhIP.waterOutA) annotation (Line(
            points={{-376,-160},{-439.6,-160},{-439.6,-24}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-500,
                  -200},{500,200}}),
                            graphics),
                             Icon(graphics));
      end HEG_3LRh_des;

      model DG_2L_NC
        "Drums Group with two pressure level, natural circulation, all ideal feed pumps and desuperheater"
        extends ThermoPower.PowerPlants.HRSG.Interfaces.DG_2L;
        Water.SinkW blowDownHP(            redeclare package Medium =
              FluidMedium, w0=0)
          annotation (Placement(transformation(
              origin={-228,-80},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Components.DrumSensors HPd(
          redeclare package Medium = FluidMedium,
          rint=HPd_rint,
          rext=HPd_rext,
          L=HPd_L,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          pstart=HPd_pstart,
          Cm=HPd_Cm) "HP drum"
                        annotation (Placement(transformation(extent={{-188,-20},{-268,
                  60}},       rotation=0)));
        Water.SensW steamHP_w(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(
              origin={-288,-220},
              extent={{20,-20},{-20,20}},
              rotation=90)));
        Water.SinkW blowDownLP(            redeclare package Medium =
              FluidMedium,
            w0=0)
          annotation (Placement(transformation(
              origin={112,-80},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Components.DrumSensors LPd(
          redeclare package Medium = FluidMedium,
          rint=LPd_rint,
          rext=LPd_rext,
          L=LPd_L,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          pstart=LPd_pstart,
          Cm=LPd_Cm) "LP drum"
                        annotation (Placement(transformation(extent={{152,-20},{72,60}},
                           rotation=0)));
        Water.SensW steamLP_w(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(
              origin={52,-220},
              extent={{20,-20},{-20,20}},
              rotation=90)));
        Water.ThroughW IPfeedPump(redeclare package Medium = FluidMedium)
                                annotation (Placement(transformation(extent={{
                  -30,-188},{-70,-148}}, rotation=0)));
      equation
        connect(SensorsBus.p_drumHP,HPd. p_out) annotation (Line(points={{400,80},{200,
                80},{200,120},{-60,120},{-60,50},{-213.6,50},{-213.6,49.6}},
                        color={255,170,213}));
        connect(SensorsBus.y_drumHP,HPd. y_out) annotation (Line(points={{400,80},{200,
                80},{200,120},{-60,120},{-60,36},{-200.8,36}},          color={
                255,170,213}));
        connect(Steam_HP_Out,steamHP_w. outlet) annotation (Line(points={{-280,
                -300},{-280,-232}}, thickness=0.5,
            color={0,0,255}));
        connect(steamHP_w.inlet,HPd. steam) annotation (Line(points={{-280,-208},{-280,
                80},{-252,80},{-252,48},{-251.2,48}},       thickness=0.5,
            color={0,0,255}));
        connect(Feed_HP,HPd. feedwater) annotation (Line(points={{-160,-300},{-160,14},
                {-189.2,14}},          thickness=0.5,
            color={0,0,255}));
        connect(blowDownHP.flange,HPd. blowdown) annotation (Line(points={{-228,-60},
                {-228,-19.2},{-228,-19.2}},
                                    thickness=0.5,
            color={0,0,255}));
        connect(SensorsBus.p_drumLP,LPd. p_out) annotation (Line(points={{400,80},{200,
                80},{200,54},{126.4,54},{126.4,49.6}},          color={255,170,
                213}));
        connect(SensorsBus.y_drumLP,LPd. y_out) annotation (Line(points={{400,80},{300,
                80},{200,80},{200,36},{139.2,36}}, color={255,170,213}));
        connect(steamLP_w.inlet,LPd. steam) annotation (Line(points={{60,-208},{60,78},
                {88.8,78},{88.8,48}},         thickness=0.5,
            color={0,0,255}));
        connect(Feed_LP,LPd. feedwater) annotation (Line(points={{180,-300},{180,14},
                {150.8,14}},         thickness=0.5,
            color={0,0,255}));
        connect(blowDownLP.flange,LPd. blowdown)
          annotation (Line(points={{112,-60},{112,-19.2}},       thickness=0.5,
            color={0,0,255}));
        connect(Steam_LP_Out, steamLP_w.outlet) annotation (Line(points={{60,
                -300},{60,-232}}, thickness=0.5,
            color={0,0,255}));
        connect(ActuatorsBus.flowRate_feedHP, IPfeedPump.in_w0) annotation (Line(
              points={{400,20},{302,20},{302,-140},{-42,-140},{-42,-156}},
              color={213,255,170}));
        connect(WaterForHP, IPfeedPump.outlet) annotation (Line(points={{-120,
                -300},{-120,-168},{-70,-168}}, thickness=0.5,
            color={0,0,255}));
        connect(Downcomer_HP, HPd.downcomer) annotation (Line(points={{-200,-300},{-200,
                -8}},                       thickness=0.5,
            color={0,0,255}));
        connect(Riser_HP, HPd.riser) annotation (Line(points={{-240,-300},{-240,-120},
                {-259.2,-120},{-259.2,-2.8}},       thickness=0.5,
            color={0,0,255}));
        connect(Riser_LP, LPd.riser) annotation (Line(points={{100,-300},{100,-120},
                {80.8,-120},{80.8,-2.8}},     thickness=0.5,
            color={0,0,255}));
        connect(IPfeedPump.inlet, LPd.downcomer) annotation (Line(
            points={{-30,-168},{140,-168},{140,-8}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(Downcomer_LP, LPd.downcomer) annotation (Line(
            points={{140,-300},{140,-8}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={
                  {-400,-300},{400,300}}),
                            graphics),
                             Icon(graphics));
      end DG_2L_NC;

      model DG_3L_CC
        "Drums Group with three pressure level, controlled circulation"
        extends ThermoPower.PowerPlants.HRSG.Interfaces.DG_3L_p;
        parameter SI.MassFlowRate RiserHPFlowRate=0
          "Nominal mass flowrate through the riser of HP";
        parameter SI.MassFlowRate RiserIPFlowRate=0
          "Nominal mass flowrate through the riser of IP";
        parameter SI.MassFlowRate RiserLPFlowRate=0
          "Nominal mass flowrate through the riser of LP";

        Water.ThroughW feedPumpIP(            redeclare package Medium =
              FluidMedium)      annotation (Placement(transformation(
              origin={80,-182},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Water.ThroughW feedPumpHP(            redeclare package Medium =
              FluidMedium)      annotation (Placement(transformation(
              origin={-220,-180},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Water.ThroughW circulationPumpLP(            redeclare package Medium
            = FluidMedium, w0=RiserLPFlowRate)
                                annotation (Placement(transformation(
              origin={300,-208},
              extent={{20,-20},{-20,20}},
              rotation=90)));
        Water.SinkW blowDownHP(            redeclare package Medium =
              FluidMedium, w0=0)
          annotation (Placement(transformation(
              origin={-328,-58},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Water.SinkW blowDownLP(            redeclare package Medium =
              FluidMedium,
            w0=0)
          annotation (Placement(transformation(
              origin={272,-56},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Water.SinkW blowDownIP(            redeclare package Medium =
              FluidMedium,
            w0=0)
          annotation (Placement(transformation(
              origin={-28,-64},
              extent={{-20,-20},{20,20}},
              rotation=270)));
        Components.DrumSensors HPd(
          redeclare package Medium = FluidMedium,
          rint=HPd_rint,
          rext=HPd_rext,
          L=HPd_L,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          pstart=HPd_pstart,
          Cm=HPd_Cm) "HP drum"
                        annotation (Placement(transformation(extent={{-288,-4},{-368,
                  76}},      rotation=0)));
        Components.DrumSensors IPd(
          redeclare package Medium = FluidMedium,
          rint=IPd_rint,
          rext=IPd_rext,
          L=IPd_L,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          pstart=IPd_pstart,
          Cm=IPd_Cm) "IP drum"
                        annotation (Placement(transformation(extent={{10,-4},{-70,76}},
                            rotation=0)));
        Components.DrumSensors LPd(
          redeclare package Medium = FluidMedium,
          rint=LPd_rint,
          rext=LPd_rext,
          L=LPd_L,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          pstart=LPd_pstart,
          Cm=LPd_Cm) "LP drum"
                        annotation (Placement(transformation(extent={{306,-4},{226,76}},
                            rotation=0)));
        Water.ThroughW circulationPumpIP(            redeclare package Medium
            = FluidMedium, w0=RiserIPFlowRate)
                                annotation (Placement(transformation(
              origin={0,-180},
              extent={{-20,20},{20,-20}},
              rotation=270)));
        Water.ThroughW circulationPumpHP(            redeclare package Medium
            = FluidMedium, w0=RiserHPFlowRate)
                                annotation (Placement(transformation(
              origin={-300,-180},
              extent={{-20,20},{20,-20}},
              rotation=270)));
        Water.SensW steamHP_w(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(
              origin={-388,-220},
              extent={{20,-20},{-20,20}},
              rotation=90)));
        Water.SensW steamIP_w(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(
              origin={-88,-220},
              extent={{20,-20},{-20,20}},
              rotation=90)));
        Water.SensW steamLP_w(            redeclare package Medium =
              FluidMedium)
          annotation (Placement(transformation(
              origin={212,-220},
              extent={{20,-20},{-20,20}},
              rotation=90)));
        Water.FlowSplit flowSplit             annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={150,-134})));
        Water.FlowSplit flowSplit1             annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={292,-122})));
      equation
        connect(ActuatorsBus.flowRate_feedHP,feedPumpHP. in_w0) annotation (Line(
              points={{500,20},{440,20},{440,-20},{-140,-20},{-140,-172},{-208,
                -172}}, color={213,255,170}));
        connect(ActuatorsBus.flowRate_feedIP,feedPumpIP. in_w0) annotation (Line(
              points={{500,20},{440,20},{440,-20},{120,-20},{120,-174},{92,-174}},
              color={213,255,170}));
        connect(SensorsBus.w_steamHP,steamHP_w. w) annotation (Line(points={{
                500,80},{400,80},{400,160},{-420,160},{-420,-260},{-400,-260},{
                -400,-236}}, color={255,170,213}));
        connect(SensorsBus.w_steamIP,steamIP_w. w) annotation (Line(points={{
                500,80},{400,80},{400,160},{-120,160},{-120,-260},{-100,-260},{
                -100,-236}}, color={255,170,213}));
        connect(SensorsBus.w_steamLP,steamLP_w. w) annotation (Line(points={{
                500,80},{400,80},{400,160},{180,160},{180,-260},{200,-260},{200,
                -236}}, color={255,170,213}));
        connect(SensorsBus.p_drumHP,HPd. p_out) annotation (Line(points={{500,80},{400,
                80},{400,160},{-160,160},{-160,68},{-313.6,68},{-313.6,65.6}},
                        color={255,170,213}));
        connect(SensorsBus.p_drumIP,IPd. p_out) annotation (Line(points={{500,80},{400,
                80},{400,160},{40,160},{40,63.6},{-15.6,65.6}},          color=
                {255,170,213}));
        connect(SensorsBus.p_drumLP,LPd. p_out) annotation (Line(points={{500,80},{400,
                80},{400,68},{280.4,68},{280.4,65.6}},          color={255,170,
                213}));
        connect(SensorsBus.y_drumHP,HPd. y_out) annotation (Line(points={{500,80},{400,
                80},{400,160},{-160,160},{-160,54},{-300.8,54},{-300.8,52}},
                                                                          color=
               {255,170,213}));
        connect(SensorsBus.y_drumIP,IPd. y_out) annotation (Line(points={{500,80},{400,
                80},{400,160},{40,160},{40,52},{-2.8,52}},          color={255,
                170,213}));
        connect(SensorsBus.y_drumLP,LPd. y_out) annotation (Line(points={{500,80},{400,
                80},{400,52},{293.2,52}},          color={255,170,213}));
        connect(Steam_HP_Out,steamHP_w. outlet) annotation (Line(points={{-380,
                -300},{-380,-232}}, thickness=0.5,
            color={0,0,255}));
        connect(steamHP_w.inlet,HPd. steam) annotation (Line(points={{-380,-208},{-380,
                100},{-352,100},{-352,64},{-351.2,64}},       thickness=0.5,
            color={0,0,255}));
        connect(circulationPumpHP.inlet,HPd. downcomer) annotation (Line(points={{-300,
                -160},{-300,8}},        thickness=0.5,
            color={0,0,255}));
        connect(Feed_HP,HPd. feedwater) annotation (Line(points={{-260,-300},{-260,30},
                {-289.2,30}},          thickness=0.5,
            color={0,0,255}));
        connect(Steam_IP_Out,steamIP_w. outlet) annotation (Line(points={{-80,
                -300},{-80,-232}}, thickness=0.5,
            color={0,0,255}));
        connect(circulationPumpIP.inlet,IPd. downcomer) annotation (Line(points={{3.67394e-015,
                -160},{0,-160},{0,6},{-2,8}},                  thickness=0.5,
            color={0,0,255}));
        connect(steamIP_w.inlet,IPd. steam) annotation (Line(points={{-80,-208},{-80,
                80},{-52,80},{-52,62},{-53.2,64}},      thickness=0.5,
            color={0,0,255}));
        connect(Feed_IP,IPd. feedwater) annotation (Line(points={{40,-300},{40,30},{
                8.8,30}},      thickness=0.5,
            color={0,0,255}));
        connect(steamLP_w.inlet,LPd. steam) annotation (Line(points={{220,-208},{220,
                80},{242.8,80},{242.8,64}},      thickness=0.5,
            color={0,0,255}));
        connect(Steam_LP_Out,steamLP_w. outlet) annotation (Line(points={{220,
                -300},{220,-232}}, thickness=0.5,
            color={0,0,255}));
        connect(Feed_LP,LPd. feedwater) annotation (Line(points={{340,-300},{340,30},
                {304.8,30}},         thickness=0.5,
            color={0,0,255}));
        connect(blowDownHP.flange,HPd. blowdown) annotation (Line(points={{-328,-38},
                {-328,-3.2}},     thickness=0.5,
            color={0,0,255}));
        connect(blowDownIP.flange,IPd. blowdown)
          annotation (Line(points={{-28,-44},{-28,-3.2},{-30,-3.2}},
                                                                   thickness=0.5,
            color={0,0,255}));
        connect(blowDownLP.flange,LPd. blowdown)
          annotation (Line(points={{272,-36},{272,-20},{272,-3.2},{266,-3.2}},
                                                          thickness=0.5,
            color={0,0,255}));
        connect(WaterForHP, feedPumpHP.outlet) annotation (Line(points={{-220,
                -300},{-220,-200}}, thickness=0.5,
            color={0,0,255}));
        connect(WaterForIP, feedPumpIP.outlet) annotation (Line(points={{80,
                -300},{80,-202}}, thickness=0.5,
            color={0,0,255}));
        connect(Riser_LP, LPd.riser) annotation (Line(points={{260,-300},{260,-100},
                {234.8,-100},{234.8,13.2}},       thickness=0.5,
            color={0,0,255}));
        connect(Downcomer_LP, circulationPumpLP.outlet) annotation (Line(points=
               {{300,-300},{300,-300},{300,-228}}, thickness=0.5,
            color={0,0,255}));
        connect(Downcomer_IP, circulationPumpIP.outlet) annotation (Line(points={{1.77636e-015,
                -300},{1.77636e-015,-252},{-3.67394e-015,-252},{-3.67394e-015,-200}},
                                     thickness=0.5,
            color={0,0,255}));
        connect(Riser_IP, IPd.riser) annotation (Line(points={{-40,-300},{-40,-100},
                {-61.2,-100},{-61.2,13.2}},       thickness=0.5,
            color={0,0,255}));
        connect(Downcomer_HP, circulationPumpHP.outlet) annotation (Line(points=
               {{-300,-300},{-300,-200}}, thickness=0.5,
            color={0,0,255}));
        connect(Riser_HP, HPd.riser) annotation (Line(points={{-340,-300},{-340,-100},
                {-359.2,-100},{-359.2,13.2}},       thickness=0.5,
            color={0,0,255}));

        connect(flowSplit.out1, feedPumpIP.inlet) annotation (Line(
            points={{138,-142},{80,-142},{80,-162}},
            color={0,0,255},
            smooth=Smooth.None,
            thickness=0.5));
        connect(flowSplit.out2, feedPumpHP.inlet) annotation (Line(
            points={{138,-126},{-220,-126},{-220,-160}},
            color={0,0,255},
            smooth=Smooth.None,
            thickness=0.5));
        connect(flowSplit1.in1, LPd.downcomer) annotation (Line(
            points={{292,-110},{294,-110},{294,8}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(circulationPumpLP.inlet, flowSplit1.out1) annotation (Line(
            points={{300,-188},{300,-134}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(flowSplit1.out2, flowSplit.in1) annotation (Line(
            points={{284,-134},{162,-134}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-500,
                  -300},{500,300}}),
                            graphics));
      end DG_3L_CC;

      model HRSG_3LRh
        "Heat Recovery Steam Generator with three pressure level and reheat"
        extends Interfaces.HRSG_3LRh;
        parameter Boolean SSInit=false "Steady-state initialization";

        DG_3L_CC drums(
          HPd_rint=1.067,
          HPd_rext=1.167,
          HPd_L=11.920,
          HPd_Cm=0,
          IPd_rint=0.915,
          IPd_rext=1.015,
          IPd_L=7,
          IPd_Cm=0,
          LPd_rint=1.143,
          LPd_rext=1.243,
          LPd_L=11.503,
          LPd_Cm=0,
          RiserHPFlowRate=175.5,
          RiserIPFlowRate=67.5,
          RiserLPFlowRate=41.5,
          redeclare package FluidMedium = FluidMedium,
          SSInit=SSInit,
          fluidHPNomPressure=13060000,
          fluidIPNomPressure=3381600,
          fluidLPNomPressure=719048)
                                annotation (Placement(transformation(extent={{
                  -102,40},{98,160}}, rotation=0)));
        HEG_3LRh HeatExchangersGroup(
          gasNomFlowRate=585.5,
          fluidHPNomFlowRate_Sh=70.59,
          fluidHPNomFlowRate_Ev=175.5,
          fluidHPNomFlowRate_Ec=70.10,
          fluidIPNomFlowRate_Rh=81.10,
          fluidIPNomFlowRate_Sh=13.5,
          fluidIPNomFlowRate_Ev=67.5,
          fluidIPNomFlowRate_Ec=21.8,
          fluidLPNomFlowRate_Sh=6.91,
          fluidLPNomFlowRate_Ev=41.49,
          fluidLPNomFlowRate_Ec=122.4,
          Sh2_HP_N_G=3,
          Sh2_HP_N_F=5,
          Sh2_HP_exchSurface_G=3636,
          Sh2_HP_exchSurface_F=421.844,
          Sh2_HP_extSurfaceTub=540.913,
          Sh2_HP_gasVol=10,
          Sh2_HP_fluidVol=2.615,
          Sh2_HP_metalVol=1.685,
          Sh1_HP_N_G=3,
          Sh1_HP_N_F=7,
          Sh1_HP_exchSurface_G=8137.2,
          Sh1_HP_exchSurface_F=612.387,
          Sh1_HP_extSurfaceTub=721.256,
          Sh1_HP_gasVol=10,
          Sh1_HP_fluidVol=4.134,
          Sh1_HP_metalVol=1.600,
          Ev_HP_N_G=4,
          Ev_HP_N_F=4,
          Ev_HP_exchSurface_G=30501.9,
          Ev_HP_exchSurface_F=2296.328,
          Ev_HP_extSurfaceTub=2704.564,
          Ev_HP_gasVol=10,
          Ev_HP_fluidVol=15.500,
          Ev_HP_metalVol=6.001,
          Ec2_HP_N_G=3,
          Ec2_HP_N_F=6,
          Ec2_HP_exchSurface_G=20335,
          Ec2_HP_exchSurface_F=1451.506,
          Ec2_HP_extSurfaceTub=1803.043,
          Ec2_HP_gasVol=10,
          Ec2_HP_fluidVol=9.290,
          Ec2_HP_metalVol=5.045,
          Ec1_HP_N_G=3,
          Ec1_HP_N_F=5,
          Ec1_HP_exchSurface_G=12201.2,
          Ec1_HP_exchSurface_F=870.904,
          Ec1_HP_extSurfaceTub=1081.826,
          Ec1_HP_gasVol=10,
          Ec1_HP_fluidVol=5.574,
          Ec1_HP_metalVol=3.027,
          Rh2_IP_N_F=7,
          Rh2_IP_exchSurface_G=4630.2,
          Rh2_IP_exchSurface_F=873.079,
          Rh2_IP_extSurfaceTub=1009.143,
          Rh2_IP_fluidVol=8.403,
          Rh2_IP_metalVol=2.823,
          Rh1_IP_N_F=5,
          Rh1_IP_exchSurface_G=4630,
          Rh1_IP_exchSurface_F=900.387,
          Rh1_IP_extSurfaceTub=1009.250,
          Rh1_IP_fluidVol=8.936,
          Rh1_IP_metalVol=2.292,
          Sh_IP_N_G=3,
          Sh_IP_N_F=7,
          Sh_IP_exchSurface_G=2314.8,
          Sh_IP_exchSurface_F=450.218,
          Sh_IP_extSurfaceTub=504.652,
          Sh_IP_gasVol=10,
          Sh_IP_fluidVol=4.468,
          Sh_IP_metalVol=1.146,
          Ev_IP_N_G=4,
          Ev_IP_N_F=4,
          Ev_IP_exchSurface_G=24402,
          Ev_IP_exchSurface_F=1837.063,
          Ev_IP_extSurfaceTub=2163.652,
          Ev_IP_gasVol=10,
          Ev_IP_fluidVol=12.400,
          Ev_IP_metalVol=4.801,
          Ec_IP_N_G=3,
          Ec_IP_N_F=5,
          Ec_IP_exchSurface_G=4067.2,
          Ec_IP_exchSurface_F=306.177,
          Ec_IP_extSurfaceTub=360.609,
          Ec_IP_gasVol=10,
          Ec_IP_fluidVol=2.067,
          Ec_IP_metalVol=0.800,
          Sh_LP_N_G=3,
          Sh_LP_N_F=7,
          Sh_LP_exchSurface_G=1708.2,
          Sh_LP_exchSurface_F=225.073,
          Sh_LP_extSurfaceTub=252.286,
          Sh_LP_gasVol=10,
          Sh_LP_fluidVol=2.234,
          Sh_LP_metalVol=0.573,
          Ev_LP_N_G=4,
          Ev_LP_N_F=4,
          Ev_LP_exchSurface_G=24402,
          Ev_LP_exchSurface_F=2292.926,
          Ev_LP_extSurfaceTub=2592.300,
          Ev_LP_gasVol=10,
          Ev_LP_fluidVol=19.318,
          Ev_LP_metalVol=5.374,
          Ec_LP_N_G=3,
          Ec_LP_N_F=6,
          Ec_LP_exchSurface_G=40095.9,
          Ec_LP_exchSurface_F=3439.389,
          Ec_LP_extSurfaceTub=3888.449,
          Ec_LP_gasVol=10,
          Ec_LP_fluidVol=28.977,
          Ec_LP_metalVol=8.061,
          rhomcm=7900*578.05,
          lambda=20,
          Ec_LP(gamma_G=46.8, gamma_F=4000),
          Ev_LP(gamma_G=127, gamma_F=20000),
          Ec1HP_EcIP(
            gamma_G_A=42,
            gamma_G_B=45,
            gamma_F_A=4000,
            gamma_F_B=4000),
          Sh_LP(gamma_G=16.6, gamma_F=4000),
          Ev_IP(gamma_G=58.5, gamma_F=20000),
          Ec2_HP(gamma_G=56, gamma_F=4000),
          Sh_IP(gamma_G=33, gamma_F=4000),
          Ev_HP(gamma_G=46.5, gamma_F=20000),
          Sh1HP_Rh1IP(
            gamma_G_A=70,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000),
          Sh2HP_Rh2IP(
            gamma_G_A=83.97,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000),
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          SSInit=SSInit,
          gasNomPressure=100000,
          fluidHPNomPressure_Sh=13430000,
          fluidHPNomPressure_Ev=13710000,
          fluidHPNomPressure_Ec=13890000,
          fluidIPNomPressure_Rh=2840000,
          fluidIPNomPressure_Sh=2950000,
          fluidIPNomPressure_Ev=3716000,
          fluidIPNomPressure_Ec=4860000,
          fluidLPNomPressure_Sh=660000,
          fluidLPNomPressure_Ev=1534000,
          fluidLPNomPressure_Ec=1980000,
          Sh2_HP_Tstartbar=873.15,
          Sh1_HP_Tstartbar=823.15,
          Ev_HP_Tstartbar=723.15,
          Ec2_HP_Tstartbar=573.15,
          Ec1_HP_Tstartbar=523.15,
          Sh_IP_Tstartbar=623.15,
          Ev_IP_Tstartbar=553.15,
          Sh_LP_Tstartbar=523.15,
          Ev_LP_Tstartbar=473.15,
          Ec_LP_Tstartbar=423.15)
                             annotation (Placement(transformation(extent={{-102,
                  -80},{98,0}}, rotation=0)));
      equation
        connect(ActuatorsBus, drums.ActuatorsBus)           annotation (Line(
              points={{200,100},{158,100},{158,104},{98,104}}, color={213,255,
                170}));
        connect(drums.SensorsBus, SensorsBus)           annotation (Line(points=
               {{98,116},{140,116},{140,160},{200,160}}, color={255,170,213}));
        connect(HeatExchangersGroup.GasIn, GasIn) annotation (Line(
            points={{-102,-40},{-200,-40}},
            color={159,159,223},
            thickness=0.5));
        connect(HeatExchangersGroup.GasOut, GasOut) annotation (Line(
            points={{98,-40},{200,-40}},
            color={159,159,223},
            thickness=0.5));
        connect(Sh_HP_Out, HeatExchangersGroup.Sh_HP_Out) annotation (Line(
              points={{-160,-200},{-160,-106},{-62,-106},{-62,-80}}, thickness=0.5,
            color={0,0,255}));
        connect(Sh_LP_Out, HeatExchangersGroup.Sh_LP_Out) annotation (Line(
              points={{80,-200},{80,-160},{58,-160},{58,-79.6}}, thickness=0.5,
            color={0,0,255}));
        connect(Rh_IP_Out, HeatExchangersGroup.Rh_IP_Out) annotation (Line(
              points={{-40,-200},{-40,-80}}, thickness=0.5,
            color={0,0,255}));
        connect(Rh_IP_In, HeatExchangersGroup.Rh_IP_In) annotation (Line(points=
               {{-100,-200},{-100,-120},{-28,-120},{-28,-80}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.SensorsBus, drums.SensorsBus) annotation (Line(
              points={{98,-12},{140,-12},{140,116},{98,116}}, color={255,170,
                213}));
        connect(HeatExchangersGroup.ActuatorsBus, drums.ActuatorsBus)
          annotation (Line(points={{98,-24},{128,-24},{128,104},{98,104}},
              color={213,255,170}));
        connect(HeatExchangersGroup.Sh_HP_In, drums.Steam_HP_Out) annotation (Line(
              points={{-78,0},{-78,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ev_HP_Out, drums.Riser_HP) annotation (Line(
              points={{-70,0},{-70,0},{-70,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ev_HP_In, drums.Downcomer_HP) annotation (Line(
              points={{-62,0},{-62,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ec_HP_Out, drums.Feed_HP) annotation (Line(
              points={{-54,0},{-54,40}},          thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ec_HP_In, drums.WaterForHP) annotation (Line(
              points={{-46,0},{-46,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Sh_IP_In, drums.Steam_IP_Out) annotation (Line(
              points={{-18,0},{-18,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ev_IP_Out, drums.Riser_IP) annotation (Line(
              points={{-10,0},{-10,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ec_IP_Out, drums.Feed_IP) annotation (Line(
              points={{6,0},{6,40}},        thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ec_IP_In, drums.WaterForIP) annotation (Line(
              points={{14,0},{14,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Sh_LP_In, drums.Steam_LP_Out) annotation (Line(
              points={{42,0},{42,0},{42,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ev_LP_Out, drums.Riser_LP) annotation (Line(
              points={{50,0},{50,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ev_LP_In, drums.Downcomer_LP) annotation (Line(
              points={{58,0},{58,40}}, thickness=0.5,
            color={0,0,255}));
        connect(HeatExchangersGroup.Ec_LP_Out, drums.Feed_LP) annotation (Line(
              points={{66,0},{66,40}}, thickness=0.5,
            color={0,0,255}));
        connect(drums.Downcomer_IP, HeatExchangersGroup.Ev_IP_In) annotation (
            Line(
            points={{-2,40},{-2,30},{-2,30},{-2,20},{-2,0},{-2,0}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(WaterIn, HeatExchangersGroup.Ec_LP_In) annotation (Line(
            points={{160,-200},{160,20},{74,20},{74,0}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,
                  -200},{200,200}}),
                            graphics));
      end HRSG_3LRh;

    end Examples;

    package Tests "Test cases"
      model computation_states
        package FluidMedium = ThermoPower.Water.StandardWater;
        parameter SI.SpecificEnthalpy h=2.39102e6 "value of specific enthalpy";
        parameter SI.Pressure p=5389.2 "value of pressure";
        parameter SI.Temperature T=288 "value of temperature";

        SI.Temperature Tf "Temperature (p,h)";
        SI.SpecificEnthalpy hf "Specific enthalpy (p,T)";
        SI.Temperature Ts "Saturation temperature (p)";
        SI.SpecificEnthalpy hv "Dew specific enthalpy (p)";
        SI.SpecificEnthalpy hl "Bubble specific enthalpy (p)";
        SI.Density rhov "Dew density (p)";
        SI.Density rhol "Bubble density (p)";
        FluidMedium.SaturationProperties sat "Saturation properties";

      equation
        sat.psat = p;
        sat.Tsat = FluidMedium.saturationTemperature(p);

        Ts = sat.Tsat;
        hl=FluidMedium.bubbleEnthalpy(sat);
        hv=FluidMedium.dewEnthalpy(sat);
        Tf=FluidMedium.temperature_ph(p,h);
        hf=FluidMedium.specificEnthalpy_pT(p,T);
        rhov=FluidMedium.density_ph(p,h);
        rhol=FluidMedium.bubbleDensity(sat);
      end computation_states;

      model TestSh2HP_Rh2IP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5
          "Nominal flow rate through the gas side";
        parameter SI.Temperature Tstart_G_In=884.65
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=823.15
          "Outlet gas temperature start value";

        //fluid A
        parameter SI.MassFlowRate fluidNomFlowRate_A=70.59
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure_A=130.5e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G_A(fixed=false)=40
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F_A=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_A_In=Tstart_F_A_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_A_Out=Tstart_F_A_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_A_In=769.486
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_A_Out=823.28
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_A_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure_A,Tstart_F_A_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_A_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure_A,Tstart_F_A_Out)
          "Nominal specific enthalpy";

        //fluid B
        parameter SI.MassFlowRate fluidNomFlowRate_B=81.1
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure_B=28.2e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G_B(fixed=false)=40
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F_B=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_B_In=Tstart_F_B_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_B_Out=Tstart_F_B_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_B_In=757.896
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_B_Out=813.09
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_B_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure_B,Tstart_F_B_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_B_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure_B,Tstart_F_B_Out)
          "Nominal specific enthalpy";

        Components.ParHE hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=3,
          gasVol=10,
          lambda=20,
          gasNomPressure=0,
          N_F_A=5,
          exchSurface_G_A=3636,
          exchSurface_F_A=421.844,
          extSurfaceTub_A=540.913,
          fluidVol_A=2.615,
          metalVol_A=1.685,
          rhomcm_A=7780*688.31,
          N_F_B=7,
          exchSurface_F_B=4630.2,
          exchSurface_G_B=873.079,
          extSurfaceTub_B=1009.143,
          fluidVol_B=8.403,
          metalVol_B=2.823,
          rhomcm_B=7800*574.93,
          counterCurrent_A=true,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate_A=fluidNomFlowRate_A,
          fluidNomFlowRate_B=fluidNomFlowRate_B,
          fluidNomPressure_A=fluidNomPressure_A,
          fluidNomPressure_B=fluidNomPressure_B,
          gamma_G_A=gamma_G_A,
          gamma_G_B=gamma_G_B,
          gamma_F_A=gamma_F_A,
          gamma_F_B=gamma_F_B,
          counterCurrent_B=true,
          Tstartbar_G=Tstart_G,
          Tstartbar_M_A=Tstart_M_A,
          Tstartbar_M_B=Tstart_M_B,
          SSInit=SSInit,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));

        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M_A = (Tstart_M_A_In+Tstart_M_A_Out)/2;
        parameter SI.Temperature Tstart_M_B = (Tstart_M_B_In+Tstart_M_B_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SourceW sourseW_water_A(
          redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate_A,
          p0=fluidNomPressure_A,
          h=hstart_F_A_In)    annotation (Placement(transformation(
              origin={-20,68},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Water.SinkP sinkP_water_A(
          redeclare package Medium = FluidMedium,
          p0=fluidNomPressure_A,
          h=hstart_F_A_Out)
                          annotation (Placement(transformation(
              origin={-20,-70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},{80,10}},
                            rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          T=Tstart_G_In,
          w0=gasNomFlowRate) annotation (Placement(transformation(extent={{-70,-10},{-50,
                  10}},           rotation=0)));
        Water.SinkP sinkP_water_B(
          redeclare package Medium = FluidMedium,
          p0=fluidNomPressure_B,
          h=hstart_F_B_Out)
                          annotation (Placement(transformation(
              origin={20,-70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SourceW sourseW_water_B(
          redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate_B,
          p0=fluidNomPressure_B,
          h=hstart_F_B_In)    annotation (Placement(transformation(
              origin={20,68},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SensT T_waterIn_A(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-12,40},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Water.SensT T_waterOut_A(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-12,-40},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Water.SensT T_waterOut_B(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={12,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SensT T_waterIn_B(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={12,40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));
      initial equation
      //  hstart_F_A_Out = hE.waterOutA.h_outflow;
      //  hstart_F_B_Out = hE.waterOutB.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet,sinkP_gas. flange) annotation (Line(
            points={{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_waterOut_A.outlet,sinkP_water_A. flange) annotation (Line(
              points={{-8,-46},{-8,-46},{-8,-60},{-20,-60}},    thickness=0.5,
            color={0,0,255}));
        connect(sinkP_water_B.flange,T_waterOut_B. outlet) annotation (Line(
              points={{20,-60},{20,-60},{8,-60},{8,-46}},
              thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut_B.inlet, hE.waterOutB) annotation (Line(points={{8,-34},{
                8,-27},{8,-20}},                 thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut_A.inlet, hE.waterOutA) annotation (Line(points={{-8,-34},
                {-8,-27},{-8,-20}},                  thickness=0.5,
            color={0,0,255}));
        connect(hE.waterInA,T_waterIn_A. outlet) annotation (Line(points={{-8,20},{-8,
                20},{-8,24},{-8,34}},            thickness=0.5,
            color={0,0,255}));
        connect(hE.waterInB,T_waterIn_B. outlet)
          annotation (Line(points={{8,20},{8,22},{8,34}},          thickness=0.5,
            color={0,0,255}));
        connect(T_waterIn_B.inlet,sourseW_water_B. flange)
          annotation (Line(points={{8,46},{8,58},{20,58}},
              thickness=0.5,
            color={0,0,255}));
        connect(T_waterIn_A.inlet,sourseW_water_A. flange) annotation (Line(
              points={{-8,46},{-8,50},{-8,58},{-20,58}},    thickness=0.5,
            color={0,0,255}));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestSh2HP_Rh2IP;

      model TestSh1HP_Rh1IP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5
          "Nominal flow rate through the gas side";
        parameter SI.Temperature Tstart_G_In=837.15
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=748.6
          "Outlet gas temperature start value";

        //fluid A
        parameter SI.MassFlowRate fluidNomFlowRate_A=70.59
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure_A=134.3e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G_A(fixed=false)=40
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F_A=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_A_In=Tstart_F_A_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_A_Out=Tstart_F_A_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_A_In=606.59
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_A_Out=743.18
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_A_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure_A,Tstart_F_A_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_A_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure_A,Tstart_F_A_Out)
          "Nominal specific enthalpy";

        //fluid B
        parameter SI.MassFlowRate fluidNomFlowRate_B=81.1
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure_B=28.4e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G_B(fixed=false)=40
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F_B=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_B_In=Tstart_F_B_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_B_Out=Tstart_F_B_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_B_In=618.31
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_B_Out=717.34
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_B_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure_B,Tstart_F_B_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_B_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure_B,Tstart_F_B_Out)
          "Nominal specific enthalpy";

        Components.ParHE hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=3,
          gasVol=10,
          lambda=20,
          gasNomPressure=0,
          N_F_A=7,
          exchSurface_G_A=8137.2,
          exchSurface_F_A=612.387,
          extSurfaceTub_A=721.256,
          fluidVol_A=4.134,
          metalVol_A=1.600,
          rhomcm_A=7800*575.22,
          N_F_B=5,
          exchSurface_F_B=4630,
          exchSurface_G_B=900.387,
          extSurfaceTub_B=1009.250,
          fluidVol_B=8.936,
          metalVol_B=2.292,
          rhomcm_B=7850*575.64,
          counterCurrent_A=true,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate_A=fluidNomFlowRate_A,
          fluidNomFlowRate_B=fluidNomFlowRate_B,
          fluidNomPressure_A=fluidNomPressure_A,
          fluidNomPressure_B=fluidNomPressure_B,
          gamma_G_A=gamma_G_A,
          gamma_G_B=gamma_G_B,
          gamma_F_A=gamma_F_A,
          gamma_F_B=gamma_F_B,
          counterCurrent_B=true,
          Tstartbar_G=Tstart_G,
          Tstartbar_M_A=Tstart_M_A,
          Tstartbar_M_B=Tstart_M_B,
          SSInit=SSInit,
          FluidPhaseStart_A=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          FluidPhaseStart_B=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M_A = (Tstart_M_A_In+Tstart_M_A_Out)/2;
        parameter SI.Temperature Tstart_M_B = (Tstart_M_B_In+Tstart_M_B_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SourceW sourseW_water_A(
          redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate_A,
          p0=fluidNomPressure_A,
          h=hstart_F_A_In)    annotation (Placement(transformation(
              origin={-20,68},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Water.SinkP sinkP_water_A(
          redeclare package Medium = FluidMedium,
          p0=fluidNomPressure_A,
          h=hstart_F_A_Out)
                          annotation (Placement(transformation(
              origin={-20,-70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          T=Tstart_G_In,
          w0=gasNomFlowRate) annotation (Placement(transformation(extent={{-70,-10},
                  {-50,10}},      rotation=0)));
        Water.SinkP sinkP_water_B(
          redeclare package Medium = FluidMedium,
          p0=fluidNomPressure_B,
          h=hstart_F_B_Out)
                          annotation (Placement(transformation(
              origin={20,-70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SourceW sourseW_water_B(
          redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate_B,
          p0=fluidNomPressure_B,
          h=hstart_F_B_In)    annotation (Placement(transformation(
              origin={20,68},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SensT T_waterIn_A(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-12,40},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Water.SensT T_waterOut_A(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-12,-40},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Water.SensT T_waterOut_B(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={12,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SensT T_waterIn_B(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={12,40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));
      initial equation
        hstart_F_A_Out = hE.waterOutA.h_outflow;
        hstart_F_B_Out = hE.waterOutB.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet,sinkP_gas. flange) annotation (Line(
            points={{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_waterOut_A.outlet,sinkP_water_A. flange) annotation (Line(
              points={{-8,-46},{-8,-46},{-8,-60},{-20,-60}},    thickness=0.5,
            color={0,0,255}));
        connect(sinkP_water_B.flange,T_waterOut_B. outlet) annotation (Line(
              points={{20,-60},{20,-60},{8,-60},{8,-46}},
              thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut_B.inlet, hE.waterOutB) annotation (Line(points={{8,-34},
                {8,-27},{8,-20}},                thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut_A.inlet, hE.waterOutA) annotation (Line(points={{-8,-34},
                {-8,-32},{-10,-32},{-10,-28},{-8,-28},{-8,-20}},
                                                     thickness=0.5,
            color={0,0,255}));
        connect(hE.waterInA,T_waterIn_A. outlet) annotation (Line(points={{-8,20},
                {-8,28},{-8,34}},                thickness=0.5,
            color={0,0,255}));
        connect(hE.waterInB,T_waterIn_B. outlet)
          annotation (Line(points={{8,20},{8,20},{8,34}},          thickness=0.5,
            color={0,0,255}));
        connect(T_waterIn_B.inlet,sourseW_water_B. flange)
          annotation (Line(points={{8,46},{8,58},{20,58}},
              thickness=0.5,
            color={0,0,255}));
        connect(T_waterIn_A.inlet,sourseW_water_A. flange) annotation (Line(
              points={{-8,46},{-8,50},{-8,58},{-20,58}},    thickness=0.5,
            color={0,0,255}));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestSh1HP_Rh1IP;

      model TestEvHP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5 "Nominal mass flowrate";
        parameter SI.Temperature Tstart_G_In=747.15
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=620.3
          "Outlet gas temperature start value";

        //fluid
        parameter SI.MassFlowRate fluidNomFlowRate=175.5
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure=137.1e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G(fixed=false)=40
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_In=Tstart_F_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_Out=Tstart_F_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_In=FluidMedium.temperature_ph(fluidNomPressure,hstart_F_In)
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_Out=FluidMedium.temperature_ph(fluidNomPressure,hstart_F_Out)
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_In=1.514e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_Out=2.002e6
          "Nominal specific enthalpy";

        Components.HE2ph hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=4,
          N_F=4,
          exchSurface_G=30501.9,
          exchSurface_F=2296.328,
          extSurfaceTub=2704.564,
          gasVol=10,
          fluidVol=15.500,
          metalVol=6.001,
          rhomcm=7900*612.58,
          lambda=20,
          gasNomFlowRate=585.5,
          gasNomPressure=0,
          fluidNomFlowRate=fluidNomFlowRate,
          fluidNomPressure=fluidNomPressure,
          gamma_G=gamma_G,
          gamma_F=gamma_F,
          Tstartbar_G=Tstart_G,
          Tstartbar_M=Tstart_M,
          SSInit=SSInit)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M = (Tstart_M_In+Tstart_M_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate,
          p0=fluidNomPressure,
          h=hstart_F_In)      annotation (Placement(transformation(
              origin={0,60},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
          p0=fluidNomPressure,
          h=hstart_F_Out) annotation (Placement(transformation(
              origin={0,-80},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          w0=gasNomFlowRate,
          T=Tstart_G_In)     annotation (Placement(transformation(extent={{-70,-10},
                  {-50,10}},      rotation=0)));
        Water.SensT T_waterOut(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={4,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));
      initial equation
        hstart_F_Out = hE.waterOut.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet,sinkP_gas. flange) annotation (Line(
            points={{46,0},{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(sinkP_water.flange,T_waterOut. outlet) annotation (Line(points={{1.83697e-015,
                -70},{1.83697e-015,-56},{-8.88178e-016,-56}},
                                                           thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut.inlet, hE.waterOut)
          annotation (Line(points={{8.88178e-016,-44},{8.88178e-016,-20},{0,-20}},
                                                         thickness=0.5,
            color={0,0,255}));
        connect(sourseW_water.flange, hE.waterIn) annotation (Line(
            points={{-1.83697e-015,50},{-1.83697e-015,20},{0,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestEvHP;

      model TestEc2HP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5 "Nominal mass flowrate";
        parameter SI.Temperature Tstart_G_In=614.15
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=558.98
          "Outlet gas temperature start value";

        //fluid
        parameter SI.MassFlowRate fluidNomFlowRate=70.1
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure=138.6e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G(fixed=false)=60
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_In=Tstart_F_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_Out=Tstart_F_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_In=484.77
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_Out=594.14
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure,Tstart_F_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure,Tstart_F_Out)
          "Nominal specific enthalpy";

        Components.HE hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=3,
          N_F=6,
          exchSurface_G=20335,
          exchSurface_F=1451.506,
          extSurfaceTub=1803.043,
          gasVol=10,
          fluidVol=9.290,
          metalVol=5.045,
          rhomcm=7900*578.05,
          lambda=20,
          gasNomFlowRate=585.5,
          gasNomPressure=0,
          fluidNomFlowRate=fluidNomFlowRate,
          fluidNomPressure=fluidNomPressure,
          gamma_G=gamma_G,
          gamma_F=gamma_F,
          Tstartbar_G=Tstart_G,
          Tstartbar_M=Tstart_M,
          SSInit=SSInit)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M = (Tstart_M_In+Tstart_M_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate,
          p0=fluidNomPressure,
          h=hstart_F_In)      annotation (Placement(transformation(
              origin={0,60},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
          p0=fluidNomPressure,
          h=hstart_F_Out) annotation (Placement(transformation(
              origin={0,-80},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          w0=gasNomFlowRate,
          T=Tstart_G_In)     annotation (Placement(transformation(extent={{-70,-10},
                  {-50,10}},      rotation=0)));
        Water.SensT T_waterOut(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={4,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));
      initial equation
        hstart_F_Out = hE.waterOut.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet,sinkP_gas. flange) annotation (Line(
            points={{46,0},{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(sinkP_water.flange,T_waterOut. outlet) annotation (Line(points={{
                1.83697e-015,-70},{1.83697e-015,-56},{-8.88178e-016,-56}},
                                                           thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut.inlet, hE.waterOut)
          annotation (Line(points={{8.88178e-016,-44},{8.88178e-016,-20},{0,-20}},
                                                         thickness=0.5,
            color={0,0,255}));
        connect(sourseW_water.flange, hE.waterIn) annotation (Line(
            points={{-1.83697e-015,50},{-1.83697e-015,20},{0,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestEc2HP;

      model TestShIP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5 "Nominal mass flowrate";
        parameter SI.Temperature Tstart_G_In=620.14
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=614.5
          "Outlet gas temperature start value";

        //fluid
        parameter SI.MassFlowRate fluidNomFlowRate=13.5
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure=29.5e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G(fixed=false)=33
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_In=Tstart_F_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_Out=Tstart_F_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_In=506.08
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_Out=605.11
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure,Tstart_F_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure,Tstart_F_Out)
          "Nominal specific enthalpy";

        Components.HE hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=3,
          N_F=7,
          exchSurface_G=2314.8,
          exchSurface_F=450.218,
          extSurfaceTub=504.652,
          gasVol=10,
          fluidVol=4.468,
          metalVol=1.146,
          rhomcm=7900*578.05,
          lambda=20,
          gasNomFlowRate=585.5,
          gasNomPressure=0,
          fluidNomFlowRate=fluidNomFlowRate,
          fluidNomPressure=fluidNomPressure,
          gamma_G=gamma_G,
          gamma_F=gamma_F,
          Tstartbar_G=Tstart_G,
          Tstartbar_M=Tstart_M,
          SSInit=SSInit,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M = (Tstart_M_In+Tstart_M_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate,
          p0=fluidNomPressure,
          h=hstart_F_In)      annotation (Placement(transformation(
              origin={0,60},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
          p0=fluidNomPressure,
          h=hstart_F_Out) annotation (Placement(transformation(
              origin={0,-80},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          w0=gasNomFlowRate,
          T=Tstart_G_In)     annotation (Placement(transformation(extent={{-70,-10},
                  {-50,10}},      rotation=0)));
        Water.SensT T_waterOut(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={4,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));
      initial equation
        hstart_F_Out = hE.waterOut.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet,sinkP_gas. flange) annotation (Line(
            points={{46,0},{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(sinkP_water.flange,T_waterOut. outlet) annotation (Line(points={{
                1.83697e-015,-70},{1.83697e-015,-56},{-8.88178e-016,-56}},
                                                           thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut.inlet, hE.waterOut)
          annotation (Line(points={{8.88178e-016,-44},{8.88178e-016,-20},{0,-20}},
                                                         thickness=0.5,
            color={0,0,255}));
        connect(sourseW_water.flange, hE.waterIn) annotation (Line(
            points={{-1.83697e-015,50},{-1.83697e-015,20},{0,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestShIP;

      model TestEvIP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5 "Nominal mass flowrate";
        parameter SI.Temperature Tstart_G_In=558.15
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=518.51
          "Outlet gas temperature start value";

        //fluid
        parameter SI.MassFlowRate fluidNomFlowRate=67.5
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure=37.16e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G(fixed=false)=40
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_In=Tstart_F_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_Out=Tstart_F_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_In=FluidMedium.temperature_ph(fluidNomPressure,hstart_F_In)
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_Out=FluidMedium.temperature_ph(fluidNomPressure,hstart_F_Out)
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_In=9.920e5
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_Out=1.370e6
          "Nominal specific enthalpy";

        Components.HE2ph hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=4,
          N_F=4,
          exchSurface_G=24402,
          exchSurface_F=1837.063,
          extSurfaceTub=2163.652,
          gasVol=10,
          fluidVol=12.400,
          metalVol=4.801,
          rhomcm=7900*578.05,
          lambda=20,
          gasNomFlowRate=585.5,
          gasNomPressure=0,
          fluidNomFlowRate=fluidNomFlowRate,
          fluidNomPressure=fluidNomPressure,
          gamma_G=gamma_G,
          gamma_F=gamma_F,
          Tstartbar_G=Tstart_G,
          Tstartbar_M=Tstart_M,
          SSInit=SSInit)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M = (Tstart_M_In+Tstart_M_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate,
          p0=fluidNomPressure,
          h=hstart_F_In)      annotation (Placement(transformation(
              origin={0,60},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
          p0=fluidNomPressure,
          h=hstart_F_Out) annotation (Placement(transformation(
              origin={0,-80},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          w0=gasNomFlowRate,
          T=Tstart_G_In)     annotation (Placement(transformation(extent={{-70,-10},
                  {-50,10}},      rotation=0)));
        Water.SensT T_waterOut(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={4,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));
      initial equation
        hstart_F_Out = hE.waterOut.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet,sinkP_gas. flange) annotation (Line(
            points={{46,0},{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(sinkP_water.flange,T_waterOut. outlet) annotation (Line(points={{
                1.83697e-015,-70},{1.83697e-015,-56},{-8.88178e-016,-56}},
                                                           thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut.inlet, hE.waterOut)
          annotation (Line(points={{8.88178e-016,-44},{8.88178e-016,-20},{0,-20}},
                                                         thickness=0.5,
            color={0,0,255}));
        connect(sourseW_water.flange, hE.waterIn) annotation (Line(
            points={{-1.83697e-015,50},{-1.83697e-015,20},{0,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestEvIP;

      model TestEc1HP_EcIP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5
          "Nominal flow rate through the gas side";
        parameter SI.Temperature Tstart_G_In=517.15
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=480.11
          "Outlet gas temperature start value";

        //fluid A
        parameter SI.MassFlowRate fluidNomFlowRate_A=70.1
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure_A=138.9e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G_A(fixed=false)=40
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F_A=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_A_In=Tstart_F_A_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_A_Out=Tstart_F_A_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_A_In=431.77
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_A_Out=494.67
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_A_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure_A,Tstart_F_A_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_A_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure_A,Tstart_F_A_Out)
          "Nominal specific enthalpy";

        //fluid B
        parameter SI.MassFlowRate fluidNomFlowRate_B=21.8
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure_B=48.6e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G_B(fixed=false)=40
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F_B=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_B_In=Tstart_F_B_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_B_Out=Tstart_F_B_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_B_In=430.24
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_B_Out=493.16
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_B_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure_B,Tstart_F_B_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_B_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure_B,Tstart_F_B_Out)
          "Nominal specific enthalpy";
        Water.SourceW sourseW_water_A(
          redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate_A,
          p0=fluidNomPressure_A,
          h=hstart_F_A_In)    annotation (Placement(transformation(
              origin={-20,68},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Water.SinkP sinkP_water_A(
          redeclare package Medium = FluidMedium,
          p0=fluidNomPressure_A,
          h=hstart_F_A_Out)
                          annotation (Placement(transformation(
              origin={-20,-70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          T=Tstart_G_In,
          w0=gasNomFlowRate) annotation (Placement(transformation(extent={{-70,-10},
                  {-50,10}},      rotation=0)));
        Components.ParHE hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=3,
          gasVol=10,
          lambda=20,
          N_F_A=5,
          exchSurface_G_A=12201.200,
          exchSurface_F_A=870.904,
          extSurfaceTub_A=1081.826,
          fluidVol_A=5.574,
          metalVol_A=3.027,
          rhomcm_A=7900*578.05,
          N_F_B=5,
          exchSurface_G_B=4067.200,
          exchSurface_F_B=306.177,
          extSurfaceTub_B=360.609,
          fluidVol_B=2.067,
          metalVol_B=0.800,
          rhomcm_B=7900*578.05,
          SSInit=true,
          counterCurrent_A=true,
          gasNomFlowRate=gasNomFlowRate,
          fluidNomFlowRate_A=fluidNomFlowRate_A,
          fluidNomFlowRate_B=fluidNomFlowRate_B,
          fluidNomPressure_A=fluidNomPressure_A,
          fluidNomPressure_B=fluidNomPressure_B,
          gamma_G_A=gamma_G_A,
          gamma_G_B=gamma_G_B,
          gamma_F_A=gamma_F_A,
          gamma_F_B=gamma_F_B,
          counterCurrent_B=true,
          gasNomPressure=100000,
          Tstartbar_G=Tstart_G,
          Tstartbar_M_A=Tstart_M_A,
          Tstartbar_M_B=Tstart_M_B)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        Water.SinkP sinkP_water_B(
          redeclare package Medium = FluidMedium,
          p0=fluidNomPressure_B,
          h=hstart_F_B_Out)
                          annotation (Placement(transformation(
              origin={20,-70},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SourceW sourseW_water_B(
          redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate_B,
          p0=fluidNomPressure_B,
          h=hstart_F_B_In)    annotation (Placement(transformation(
              origin={20,68},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SensT T_waterIn_A(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-12,40},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Water.SensT T_waterOut_A(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-12,-40},
              extent={{-10,10},{10,-10}},
              rotation=270)));
        Water.SensT T_waterOut_B(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={12,-40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SensT T_waterIn_B(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={12,40},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));

        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M_A = (Tstart_M_A_In+Tstart_M_A_Out)/2;
        parameter SI.Temperature Tstart_M_B = (Tstart_M_B_In+Tstart_M_B_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      initial equation
        hstart_F_A_Out = hE.waterOutA.h_outflow;
        hstart_F_B_Out = hE.waterOutB.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet, sinkP_gas.flange) annotation (Line(
            points={{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_waterOut_A.outlet, sinkP_water_A.flange) annotation (Line(
              points={{-8,-46},{-8,-46},{-8,-60},{-20,-60}},    thickness=0.5,
            color={0,0,255}));
        connect(sinkP_water_B.flange, T_waterOut_B.outlet) annotation (Line(
              points={{20,-60},{20,-60},{8,-60},{8,-46}},
              thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut_B.inlet, hE.waterOutB) annotation (Line(points={{8,-34},
                {8,-26},{8,-20}},                thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut_A.inlet, hE.waterOutA) annotation (Line(points={{-8,-34},
                {-8,-28},{-8,-20}},                  thickness=0.5,
            color={0,0,255}));
        connect(hE.waterInA, T_waterIn_A.outlet) annotation (Line(points={{-8,20},
                {-8,34}},                        thickness=0.5,
            color={0,0,255}));
        connect(hE.waterInB, T_waterIn_B.outlet)
          annotation (Line(points={{8,20},{8,34}},                 thickness=0.5,
            color={0,0,255}));
        connect(T_waterIn_B.inlet, sourseW_water_B.flange)
          annotation (Line(points={{8,46},{8,58},{20,58}},
              thickness=0.5,
            color={0,0,255}));
        connect(T_waterIn_A.inlet, sourseW_water_A.flange) annotation (Line(
              points={{-8,46},{-8,50},{-8,58},{-20,58}},    thickness=0.5,
            color={0,0,255}));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestEc1HP_EcIP;

      model TestShLP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5 "Nominal mass flowrate";
        parameter SI.Temperature Tstart_G_In=519.15
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=517.44
          "Outlet gas temperature start value";

        //fluid
        parameter SI.MassFlowRate fluidNomFlowRate=6.91
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure=6.6e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G(fixed=false)=50
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_In=Tstart_F_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_Out=Tstart_F_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_In=435.75
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_Out=505.04
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure,Tstart_F_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure,Tstart_F_Out)
          "Nominal specific enthalpy";

        Components.HE hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=3,
          N_F=7,
          exchSurface_G=1708.2,
          exchSurface_F=225.073,
          extSurfaceTub=252.286,
          gasVol=10,
          fluidVol=2.234,
          metalVol=0.573,
          rhomcm=7900*578.05,
          lambda=20,
          gasNomFlowRate=585.5,
          gasNomPressure=0,
          fluidNomFlowRate=fluidNomFlowRate,
          fluidNomPressure=fluidNomPressure,
          gamma_G=gamma_G,
          gamma_F=gamma_F,
          Tstartbar_G=Tstart_G,
          SSInit=SSInit,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          Tstartbar_M=Tstart_M)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M = (Tstart_M_In+Tstart_M_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate,
          p0=fluidNomPressure,
          h=hstart_F_In)      annotation (Placement(transformation(
              origin={0,60},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
          p0=fluidNomPressure,
          h=hstart_F_Out) annotation (Placement(transformation(
              origin={0,-80},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          w0=gasNomFlowRate,
          T=Tstart_G_In)     annotation (Placement(transformation(extent={{-70,-10},
                  {-50,10}},      rotation=0)));
        Water.SensT T_waterOut(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={4,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));
      initial equation
        hstart_F_Out = hE.waterOut.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet,sinkP_gas. flange) annotation (Line(
            points={{46,0},{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(sinkP_water.flange,T_waterOut. outlet) annotation (Line(points={{
                1.83697e-015,-70},{1.83697e-015,-56},{-8.88178e-016,-56}},
                                                           thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut.inlet, hE.waterOut)
          annotation (Line(points={{8.88178e-016,-44},{8.88178e-016,-20},{0,-20}},
                                                         thickness=0.5,
            color={0,0,255}));
        connect(sourseW_water.flange, hE.waterIn) annotation (Line(
            points={{-1.83697e-015,50},{-1.83697e-015,20},{0,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestShLP;

      model TestEvLP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5 "Nominal mass flowrate";
        parameter SI.Temperature Tstart_G_In=480
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=453.47
          "Outlet gas temperature start value";

        //fluid
        parameter SI.MassFlowRate fluidNomFlowRate=41.49
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure=15.34e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G(fixed=false)=40
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_In=Tstart_F_In
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_Out=Tstart_F_Out
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_In=FluidMedium.temperature_ph(fluidNomPressure,hstart_F_In)
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_Out=FluidMedium.temperature_ph(fluidNomPressure,hstart_F_Out)
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_In=6.626e5
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_Out=1.065e6
          "Nominal specific enthalpy";

        Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate,
          p0=fluidNomPressure,
          h=hstart_F_In)      annotation (Placement(transformation(
              origin={0,60},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
          p0=fluidNomPressure,
          h=hstart_F_Out) annotation (Placement(transformation(
              origin={0,-80},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          w0=gasNomFlowRate,
          T=Tstart_G_In)     annotation (Placement(transformation(extent={{-70,-10},
                  {-50,10}},      rotation=0)));
        Components.HE2ph hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=4,
          N_F=4,
          exchSurface_G=24402,
          exchSurface_F=2292.926,
          extSurfaceTub=2592.300,
          gasVol=10,
          fluidVol=19.318,
          metalVol=5.374,
          rhomcm=7900*578.05,
          lambda=20,
          gasNomFlowRate=585.5,
          gasNomPressure=0,
          fluidNomFlowRate=fluidNomFlowRate,
          fluidNomPressure=fluidNomPressure,
          gamma_G=gamma_G,
          gamma_F=gamma_F,
          Tstartbar_G=Tstart_G,
          Tstartbar_M=Tstart_M,
          SSInit=SSInit)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        Water.SensT T_waterOut(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={4,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));
        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M = (Tstart_M_In+Tstart_M_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      initial equation
        hstart_F_Out = hE.waterOut.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet, sinkP_gas.flange) annotation (Line(
            points={{46,0},{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(sinkP_water.flange, T_waterOut.outlet) annotation (Line(points={{
                1.83697e-015,-70},{1.83697e-015,-56},{-8.88178e-016,-56}},
                                                           thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut.inlet, hE.waterOut)
          annotation (Line(points={{8.88178e-016,-44},{8.88178e-016,-20},{0,-20}},
                                                         thickness=0.5,
            color={0,0,255}));
        connect(sourseW_water.flange, hE.waterIn) annotation (Line(
            points={{-1.83697e-015,50},{-1.83697e-015,20},{0,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestEvLP;

      model TestEcLP
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        //gas
        parameter SI.MassFlowRate gasNomFlowRate=585.5 "Nominal mass flowrate";
        parameter SI.Temperature Tstart_G_In=453.47
          "Inlet gas temperature start value";
        parameter SI.Temperature Tstart_G_Out=372.35
          "Outlet gas temperature start value";

        //fluid
        parameter SI.MassFlowRate fluidNomFlowRate=89.82
          "Nominal flow rate through the fluid side";
        parameter SI.Pressure fluidNomPressure=6e5
          "Nominal pressure in the fluid side inlet";
        parameter SI.CoefficientOfHeatTransfer gamma_G(fixed=false)=35
          "Constant heat transfer coefficient in the gas side";
        parameter SI.CoefficientOfHeatTransfer gamma_F=4000
          "Constant heat transfer coefficient in the fluid side";
        parameter SI.Temperature Tstart_M_In=307.05
          "Inlet metal wall temperature start value";
        parameter SI.Temperature Tstart_M_Out=428.09
          "Outlet metal wall temperature start value";
        parameter SI.Temperature Tstart_F_In=307.05
          "Inlet fluid temperature start value";
        parameter SI.Temperature Tstart_F_Out=428.09
          "Outlet fluid temperature start value";
        parameter SI.SpecificEnthalpy hstart_F_In=FluidMedium.specificEnthalpy_pT(fluidNomPressure,Tstart_F_In)
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy hstart_F_Out=FluidMedium.specificEnthalpy_pT(fluidNomPressure,Tstart_F_Out)
          "Nominal specific enthalpy";

        Components.HE hE(redeclare package FluidMedium = FluidMedium,
          redeclare package FlueGasMedium = FlueGasMedium,
          N_G=3,
          N_F=6,
          exchSurface_G=40095.9,
          exchSurface_F=3439.389,
          extSurfaceTub=3888.449,
          gasVol=10,
          fluidVol=28.977,
          metalVol=8.061,
          rhomcm=7900*578.05,
          lambda=20,
          gasNomFlowRate=585.5,
          fluidNomFlowRate=fluidNomFlowRate,
          fluidNomPressure=fluidNomPressure,
          gamma_G=gamma_G,
          gamma_F=gamma_F,
          SSInit=SSInit,
          Tstartbar_G=Tstart_G,
          Tstartbar_M=Tstart_M,
          gasNomPressure=500000)
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
                rotation=0)));
        //Start value
        parameter SI.Temperature Tstart_G = (Tstart_G_In+Tstart_G_Out)/2;
        parameter SI.Temperature Tstart_M = (Tstart_M_In+Tstart_M_Out)/2;
        parameter Boolean SSInit = true "Steady-state initialization";
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
          w0=fluidNomFlowRate,
          p0=fluidNomPressure,
          h=hstart_F_In)      annotation (Placement(transformation(
              origin={0,60},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
          p0=fluidNomPressure,
          h=hstart_F_Out) annotation (Placement(transformation(
              origin={0,-80},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out)
                         annotation (Placement(transformation(extent={{60,-10},
                  {80,10}}, rotation=0)));
        Gas.SourceW sourceW_gas(
          redeclare package Medium = FlueGasMedium,
          w0=gasNomFlowRate,
          T=Tstart_G_In)     annotation (Placement(transformation(extent={{-70,-10},
                  {-50,10}},      rotation=0)));
        Water.SensT T_waterOut(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={4,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Gas.SensT T_gasOut(redeclare package Medium = FlueGasMedium)
          annotation (Placement(transformation(extent={{30,-6},{50,14}},
                rotation=0)));
      initial equation
        hstart_F_Out = hE.waterOut.h_outflow;

      equation
        connect(T_gasOut.inlet, hE.gasOut) annotation (Line(
            points={{34,0},{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(T_gasOut.outlet,sinkP_gas. flange) annotation (Line(
            points={{46,0},{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(sinkP_water.flange,T_waterOut. outlet) annotation (Line(points={{
                1.83697e-015,-70},{1.83697e-015,-56},{-8.88178e-016,-56}},
                                                           thickness=0.5,
            color={0,0,255}));
        connect(T_waterOut.inlet, hE.waterOut)
          annotation (Line(points={{8.88178e-016,-44},{8.88178e-016,-20},{0,-20}},
                                                         thickness=0.5,
            color={0,0,255}));
        connect(sourseW_water.flange, hE.waterIn) annotation (Line(
            points={{-1.83697e-015,50},{-1.83697e-015,20},{0,20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sourceW_gas.flange, hE.gasIn) annotation (Line(
            points={{-50,0},{-20,0}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestEcLP;

      model TestHEG_3LRh
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;
        //HP
        parameter SI.MassFlowRate fluidHPNomFlowRate_Sh=67.6
          "Nominal mass flowrate";
        parameter SI.Pressure fluidHPNomPressure_Sh=138.9e5 "Nominal pressure";
        parameter SI.MassFlowRate fluidHPNomFlowRate_Ev=175.5
          "Nominal mass flowrate";
        parameter SI.Pressure fluidHPNomPressure_Ev=138.9e5 "Nominal pressure";
        parameter SI.MassFlowRate fluidHPNomFlowRate_Ec=67.6
          "Nominal mass flowrate";
        parameter SI.Pressure fluidHPNomPressure_Ec=138.9e5 "Nominal pressure";
        parameter SI.SpecificEnthalpy Sh1_HP_hstart_F_In= 2.657e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ev_HP_hstart_F_In= 1.514e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ev_HP_hstart_F_Out= 1.9423e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ec1_HP_hstart_F_In= 6.775e5
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ec2_HP_hstart_F_Out= 1.45077e6
          "Nominal specific enthalpy";

        //IP
        parameter SI.MassFlowRate fluidIPNomFlowRate_Rh=81.10
          "Nominal mass flowrate";
        parameter SI.Pressure fluidIPNomPressure_Rh=33.8e5 "Nominal pressure";
        parameter SI.MassFlowRate fluidIPNomFlowRate_Sh=13.5
          "Nominal mass flowrate";
        parameter SI.Pressure fluidIPNomPressure_Sh=33.8e5 "Nominal pressure";
        parameter SI.MassFlowRate fluidIPNomFlowRate_Ev=67.5
          "Nominal mass flowrate";
        parameter SI.Pressure fluidIPNomPressure_Ev=33.8e5 "Nominal pressure";
        parameter SI.MassFlowRate fluidIPNomFlowRate_Ec=13.5
          "Nominal mass flowrate";
        parameter SI.Pressure fluidIPNomPressure_Ec=33.8e5 "Nominal pressure";
        parameter SI.SpecificEnthalpy Rh1_IP_hstart_F_In= 3.22e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Rh2_IP_hstart_F_Out=3.64853e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Sh_IP_hstart_F_In=2.802e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ev_IP_hstart_F_In= 9.92e5
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ev_IP_hstart_F_Out= 1.36395e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ec_IP_hstart_F_In=6.654e5
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ec_IP_hstart_F_Out=9.70768e5
          "Nominal specific enthalpy";

        //LP
        parameter SI.MassFlowRate fluidLPNomFlowRate_Sh=8.72
          "Nominal mass flowrate";
        parameter SI.Pressure fluidLPNomPressure_Sh=7.19e5 "Nominal pressure";
        parameter SI.MassFlowRate fluidLPNomFlowRate_Ev=41.49
          "Nominal mass flowrate";
        parameter SI.Pressure fluidLPNomPressure_Ev=7.19e5 "Nominal pressure";
        parameter SI.MassFlowRate fluidLPNomFlowRate_Ec=89.82
          "Nominal mass flowrate";
        parameter SI.Pressure fluidLPNomPressure_Ec=7.19e5 "Nominal pressure";
        parameter SI.SpecificEnthalpy Sh_LP_hstart_F_In= 2.760e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ev_LP_hstart_F_In= 6.626e5
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ev_LP_hstart_F_Out=1.0227e6
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ec_LP_hstart_F_In=2.44e5
          "Nominal specific enthalpy";
        parameter SI.SpecificEnthalpy Ec_LP_hstart_F_Out=6.39929e5
          "Nominal specific enthalpy";

        Water.SinkP OutHP(redeclare package Medium = FluidMedium, p0=0)
                          annotation (Placement(transformation(extent={{-88,-90},
                  {-100,-78}}, rotation=0)));
        Gas.SinkP sinkGas(redeclare package Medium = FlueGasMedium, T=375.386)
                         annotation (Placement(transformation(extent={{88,-10},
                  {100,2}}, rotation=0)));
        Gas.SourceW sourceGas(
          redeclare package Medium = FlueGasMedium,
          w0=585.5,
          T=884.65)          annotation (Placement(transformation(extent={{-100,
                  -10},{-88,2}}, rotation=0)));
        Water.SinkP sinkEvHP(
          redeclare package Medium = FluidMedium,
          p0=fluidHPNomPressure_Ev,
          h=Ev_HP_hstart_F_Out)
                           annotation (Placement(transformation(
              origin={-60,76},
              extent={{-6,-6},{6,6}},
              rotation=90)));
        Water.ValveLin valveLinHP(redeclare package Medium = FluidMedium, Kv=
              fluidHPNomFlowRate_Sh/fluidHPNomPressure_Sh)
                                annotation (Placement(transformation(extent={{
                  -68,-78},{-80,-90}}, rotation=0)));
        Water.SinkP OutLP(redeclare package Medium = FluidMedium, p0=0)
                           annotation (Placement(transformation(extent={{70,-92},
                  {82,-80}}, rotation=0)));
        Water.ValveLin valveLinLP(redeclare package Medium = FluidMedium, Kv=
              fluidLPNomFlowRate_Sh/fluidLPNomPressure_Sh)
                                 annotation (Placement(transformation(extent={{
                  50,-80},{62,-92}}, rotation=0)));
        Water.SourceW sourceEvHP(
          redeclare package Medium = FluidMedium,
          w0=fluidHPNomFlowRate_Ev,
          p0=fluidHPNomPressure_Ev,
          h=Ev_HP_hstart_F_In)
                              annotation (Placement(transformation(
              origin={-52,64},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Water.SourceW sourceRhIP(
          redeclare package Medium = FluidMedium,
          w0=fluidIPNomFlowRate_Rh,
          p0=fluidIPNomPressure_Rh,
          h=Rh1_IP_hstart_F_In)
                              annotation (Placement(transformation(
              origin={-19,-53},
              extent={{-5,-5},{5,5}},
              rotation=90)));
        Water.SinkP sinkRhIP(
          redeclare package Medium = FluidMedium,
          p0=fluidIPNomPressure_Rh,
          h=Rh2_IP_hstart_F_Out)
                           annotation (Placement(transformation(
              origin={-26,-70},
              extent={{6,-6},{-6,6}},
              rotation=90)));
        Modelica.Blocks.Sources.Constant commandValve
          annotation (Placement(transformation(
              origin={-1,-85},
              extent={{-5,-5},{5,5}},
              rotation=270)));
        Water.SinkP sinkEcHP(
          redeclare package Medium = FluidMedium,
          p0=fluidHPNomPressure_Ec,
          h=Ec2_HP_hstart_F_Out)
                           annotation (Placement(transformation(
              origin={-44,76},
              extent={{-6,-6},{6,6}},
              rotation=90)));
        Water.SourceW sourceEcHP(
          redeclare package Medium = FluidMedium,
          w0=fluidHPNomFlowRate_Ec,
          p0=fluidHPNomPressure_Ec,
          h=Ec1_HP_hstart_F_In)
                              annotation (Placement(transformation(
              origin={-38,64},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Water.SinkP sinkEvIP(
          redeclare package Medium = FluidMedium,
          p0=fluidIPNomPressure_Ev,
          h=Ev_IP_hstart_F_Out)
                           annotation (Placement(transformation(
              origin={-10,76},
              extent={{-6,-6},{6,6}},
              rotation=90)));
        Water.SourceW sourceEvIP(
          redeclare package Medium = FluidMedium,
          w0=fluidIPNomFlowRate_Ev,
          p0=fluidIPNomPressure_Ev,
          h=Ev_IP_hstart_F_In)
                              annotation (Placement(transformation(
              origin={-6,64},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Water.SinkP sinkEcIP(
          redeclare package Medium = FluidMedium,
          p0=fluidIPNomPressure_Ec,
          h=Ec_IP_hstart_F_Out)
                           annotation (Placement(transformation(
              origin={4,76},
              extent={{-6,-6},{6,6}},
              rotation=90)));
        Water.SourceW sourceEcIP(
          redeclare package Medium = FluidMedium,
          w0=fluidIPNomFlowRate_Ec,
          p0=fluidIPNomPressure_Ec,
          h=Ec_IP_hstart_F_In)
                              annotation (Placement(transformation(
              origin={10,64},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Water.SinkP sinkEvLP(
          redeclare package Medium = FluidMedium,
          p0=fluidLPNomPressure_Ev,
          h=Ev_LP_hstart_F_Out)
                           annotation (Placement(transformation(
              origin={44,76},
              extent={{-6,-6},{6,6}},
              rotation=90)));
        Water.SourceW sourceEvLP(
          redeclare package Medium = FluidMedium,
          w0=fluidLPNomFlowRate_Ev,
          p0=fluidLPNomPressure_Ev,
          h=Ev_LP_hstart_F_In)
                              annotation (Placement(transformation(
              origin={52,64},
              extent={{6,-6},{-6,6}},
              rotation=90)));
        Water.SinkP sinkEcLP(
          redeclare package Medium = FluidMedium,
          p0=fluidLPNomPressure_Ec,
          h=Ec_LP_hstart_F_Out)
                           annotation (Placement(transformation(
              origin={60,76},
              extent={{-6,-6},{6,6}},
              rotation=90)));
        Water.SourceW sourceEcLP(
          redeclare package Medium = FluidMedium,
          w0=fluidLPNomFlowRate_Ec,
          p0=fluidLPNomPressure_Ec,
          h=Ec_LP_hstart_F_In)
                              annotation (Placement(transformation(
              origin={68,64},
              extent={{6,-6},{-6,6}},
              rotation=90)));
        Water.SourceP sourceShHP(p0=fluidHPNomPressure_Sh, h=Sh1_HP_hstart_F_In)
          annotation (Placement(transformation(
              origin={-68,64},
              extent={{-6,6},{6,-6}},
              rotation=270)));
        Water.SourceW sourceShIP(p0=fluidIPNomPressure_Sh, h=Sh_IP_hstart_F_In,
          w0=fluidIPNomFlowRate_Sh)
          annotation (Placement(transformation(
              origin={-20,64},
              extent={{-6,6},{6,-6}},
              rotation=270)));
        Water.SourceP sourceShLP(p0=fluidLPNomPressure_Sh, h=Sh_LP_hstart_F_In)
          annotation (Placement(transformation(
              origin={34,64},
              extent={{6,-6},{-6,6}},
              rotation=90)));
        ThermoPower.PowerPlants.HRSG.Components.StateReader_gas stateGas_out(
                                                redeclare package Medium =
              FlueGasMedium) annotation (Placement(transformation(extent={{64,
                  -12},{80,4}}, rotation=0)));
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Examples.HEG_3LRh HeatExchangersGroup(
          gasNomFlowRate=585.5,
          fluidHPNomFlowRate_Sh=70.59,
          fluidHPNomFlowRate_Ev=175.5,
          fluidHPNomFlowRate_Ec=70.10,
          fluidIPNomFlowRate_Rh=81.10,
          fluidIPNomFlowRate_Sh=13.5,
          fluidIPNomFlowRate_Ev=67.5,
          fluidIPNomFlowRate_Ec=21.8,
          fluidLPNomFlowRate_Sh=6.91,
          fluidLPNomFlowRate_Ev=41.49,
          fluidLPNomFlowRate_Ec=122.4,
          Sh2_HP_N_G=3,
          Sh2_HP_N_F=5,
          Sh2_HP_exchSurface_G=3636,
          Sh2_HP_exchSurface_F=421.844,
          Sh2_HP_extSurfaceTub=540.913,
          Sh2_HP_gasVol=10,
          Sh2_HP_fluidVol=2.615,
          Sh2_HP_metalVol=1.685,
          Sh1_HP_N_G=3,
          Sh1_HP_N_F=7,
          Sh1_HP_exchSurface_G=8137.2,
          Sh1_HP_exchSurface_F=612.387,
          Sh1_HP_extSurfaceTub=721.256,
          Sh1_HP_gasVol=10,
          Sh1_HP_fluidVol=4.134,
          Sh1_HP_metalVol=1.600,
          Ev_HP_N_G=4,
          Ev_HP_N_F=4,
          Ev_HP_exchSurface_G=30501.9,
          Ev_HP_exchSurface_F=2296.328,
          Ev_HP_extSurfaceTub=2704.564,
          Ev_HP_gasVol=10,
          Ev_HP_fluidVol=15.500,
          Ev_HP_metalVol=6.001,
          Ec2_HP_N_G=3,
          Ec2_HP_N_F=6,
          Ec2_HP_exchSurface_G=20335,
          Ec2_HP_exchSurface_F=1451.506,
          Ec2_HP_extSurfaceTub=1803.043,
          Ec2_HP_gasVol=10,
          Ec2_HP_fluidVol=9.290,
          Ec2_HP_metalVol=5.045,
          Ec1_HP_N_G=3,
          Ec1_HP_N_F=5,
          Ec1_HP_exchSurface_G=12201.2,
          Ec1_HP_exchSurface_F=870.904,
          Ec1_HP_extSurfaceTub=1081.826,
          Ec1_HP_gasVol=10,
          Ec1_HP_fluidVol=5.574,
          Ec1_HP_metalVol=3.027,
          Rh2_IP_N_F=7,
          Rh2_IP_exchSurface_G=4630.2,
          Rh2_IP_exchSurface_F=873.079,
          Rh2_IP_extSurfaceTub=1009.143,
          Rh2_IP_fluidVol=8.403,
          Rh2_IP_metalVol=2.823,
          Rh1_IP_N_F=5,
          Rh1_IP_exchSurface_G=4630,
          Rh1_IP_exchSurface_F=900.387,
          Rh1_IP_extSurfaceTub=1009.250,
          Rh1_IP_fluidVol=8.936,
          Rh1_IP_metalVol=2.292,
          Sh_IP_N_G=3,
          Sh_IP_N_F=7,
          Sh_IP_exchSurface_G=2314.8,
          Sh_IP_exchSurface_F=450.218,
          Sh_IP_extSurfaceTub=504.652,
          Sh_IP_gasVol=10,
          Sh_IP_fluidVol=4.468,
          Sh_IP_metalVol=1.146,
          Ev_IP_N_G=4,
          Ev_IP_N_F=4,
          Ev_IP_exchSurface_G=24402,
          Ev_IP_exchSurface_F=1837.063,
          Ev_IP_extSurfaceTub=2163.652,
          Ev_IP_gasVol=10,
          Ev_IP_fluidVol=12.400,
          Ev_IP_metalVol=4.801,
          Ec_IP_N_G=3,
          Ec_IP_N_F=5,
          Ec_IP_exchSurface_G=4067.2,
          Ec_IP_exchSurface_F=306.177,
          Ec_IP_extSurfaceTub=360.609,
          Ec_IP_gasVol=10,
          Ec_IP_fluidVol=2.067,
          Ec_IP_metalVol=0.800,
          Sh_LP_N_G=3,
          Sh_LP_N_F=7,
          Sh_LP_exchSurface_G=1708.2,
          Sh_LP_exchSurface_F=225.073,
          Sh_LP_extSurfaceTub=252.286,
          Sh_LP_gasVol=10,
          Sh_LP_fluidVol=2.234,
          Sh_LP_metalVol=0.573,
          Ev_LP_N_G=4,
          Ev_LP_N_F=4,
          Ev_LP_exchSurface_G=24402,
          Ev_LP_exchSurface_F=2292.926,
          Ev_LP_extSurfaceTub=2592.300,
          Ev_LP_gasVol=10,
          Ev_LP_fluidVol=19.318,
          Ev_LP_metalVol=5.374,
          Ec_LP_N_G=3,
          Ec_LP_N_F=6,
          Ec_LP_exchSurface_G=40095.9,
          Ec_LP_exchSurface_F=3439.389,
          Ec_LP_extSurfaceTub=3888.449,
          Ec_LP_gasVol=10,
          Ec_LP_fluidVol=28.977,
          Ec_LP_metalVol=8.061,
          rhomcm=7900*578.05,
          lambda=20,
          Ec_LP(gamma_G=46.8, gamma_F=4000),
          Ev_LP(gamma_G=127, gamma_F=20000),
          Ec1HP_EcIP(
            gamma_G_A=42,
            gamma_G_B=45,
            gamma_F_A=4000,
            gamma_F_B=4000),
          Sh_LP(gamma_G=16.6, gamma_F=4000),
          Ev_IP(gamma_G=58.5, gamma_F=20000),
          Ec2_HP(gamma_G=56, gamma_F=4000),
          Sh_IP(gamma_G=33, gamma_F=4000),
          Ev_HP(gamma_G=46.5, gamma_F=20000),
          Sh1HP_Rh1IP(
            gamma_G_A=70,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000),
          Sh2HP_Rh2IP(
            gamma_G_A=83.97,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000),
          redeclare package FlueGasMedium = FlueGasMedium,
          redeclare package FluidMedium = FluidMedium,
          SSInit=true,
          gasNomPressure=100000,
          fluidHPNomPressure_Sh=13430000,
          fluidHPNomPressure_Ev=13710000,
          fluidHPNomPressure_Ec=13890000,
          fluidIPNomPressure_Rh=2840000,
          fluidIPNomPressure_Sh=2950000,
          fluidIPNomPressure_Ev=3716000,
          fluidIPNomPressure_Ec=4860000,
          fluidLPNomPressure_Sh=660000,
          fluidLPNomPressure_Ev=1534000,
          fluidLPNomPressure_Ec=1980000,
          Sh2_HP_Tstartbar=873.15,
          Sh1_HP_Tstartbar=823.15,
          Ev_HP_Tstartbar=723.15,
          Ec2_HP_Tstartbar=573.15,
          Ec1_HP_Tstartbar=523.15,
          Sh_IP_Tstartbar=623.15,
          Ev_IP_Tstartbar=553.15,
          Sh_LP_Tstartbar=523.15,
          Ev_LP_Tstartbar=473.15,
          Ec_LP_Tstartbar=423.15)
                             annotation (Placement(transformation(extent={{-64,-30},
                  {58,22}},     rotation=0)));
      equation
        connect(OutHP.flange, valveLinHP.outlet)
          annotation (Line(points={{-88,-84},{-80,-84}}, thickness=0.5));
        connect(valveLinLP.outlet, OutLP.flange)
          annotation (Line(points={{62,-86},{70,-86}}, thickness=0.5));
        connect(commandValve.y, valveLinHP.cmd) annotation (Line(points={{-1,
                -90.5},{-1,-98},{-74,-98},{-74,-88.8}},  color={0,0,127}));
        connect(commandValve.y, valveLinLP.cmd) annotation (Line(points={{-1,
                -90.5},{-1,-98},{56,-98},{56,-90.8}},  color={0,0,127}));
        connect(sinkGas.flange, stateGas_out.outlet) annotation (Line(
            points={{88,-4},{76.8,-4}},
            color={159,159,223},
            thickness=0.5));
        connect(HeatExchangersGroup.GasOut, stateGas_out.inlet) annotation (
            Line(
            points={{58,-4},{62.6,-4},{62.6,-4},{67.2,-4}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.GasIn, sourceGas.flange) annotation (Line(
            points={{-64,-4},{-76,-4},{-76,-4},{-88,-4}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sourceRhIP.flange, HeatExchangersGroup.Rh_IP_In) annotation (
            Line(
            points={{-19,-48},{-18.86,-48},{-18.86,-30}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sinkRhIP.flange, HeatExchangersGroup.Rh_IP_Out) annotation (
            Line(
            points={{-26,-64},{-26.18,-64},{-26.18,-30}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(valveLinLP.inlet, HeatExchangersGroup.Sh_LP_Out) annotation (
            Line(
            points={{50,-86},{33.6,-86},{33.6,-29.74}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(valveLinHP.inlet, HeatExchangersGroup.Sh_HP_Out) annotation (
            Line(
            points={{-68,-84},{-39.6,-84},{-39.6,-30}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ec_IP_In, sourceEcIP.flange) annotation (
            Line(
            points={{6.76,22},{8,22},{8,58},{10,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ec_IP_Out, sinkEcIP.flange) annotation (
            Line(
            points={{1.88,22},{1.88,47},{4,47},{4,70}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ev_IP_In, sourceEvIP.flange) annotation (
            Line(
            points={{-3,22},{-3,48},{-6,48},{-6,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ev_IP_Out, sinkEvIP.flange) annotation (
            Line(
            points={{-7.88,22},{-8,22},{-8,44},{-10,44},{-10,70}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Sh_IP_In, sourceShIP.flange) annotation (
            Line(
            points={{-12.76,22},{-12.76,38},{-20,38},{-20,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Sh_LP_In, sourceShLP.flange) annotation (
            Line(
            points={{23.84,22},{23.84,52},{34,52},{34,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ev_LP_Out, sinkEvLP.flange) annotation (
            Line(
            points={{28.72,22},{28,22},{28,44},{44,44},{44,70}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ev_LP_In, sourceEvLP.flange) annotation (
            Line(
            points={{33.6,22},{34,22},{34,34},{52,34},{52,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ec_LP_Out, sinkEcLP.flange) annotation (
            Line(
            points={{38.48,22},{38.48,30},{60,30},{60,70}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ec_LP_In, sourceEcLP.flange) annotation (
            Line(
            points={{43.36,22},{43.36,28},{68,28},{68,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ec_HP_In, sourceEcHP.flange) annotation (
            Line(
            points={{-29.84,22},{-29.84,52},{-38,52},{-38,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ec_HP_Out, sinkEcHP.flange) annotation (
            Line(
            points={{-34.72,22},{-34.72,48},{-44,48},{-44,70}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ev_HP_In, sourceEvHP.flange) annotation (
            Line(
            points={{-39.6,22},{-39.6,42},{-52,42},{-52,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Ev_HP_Out, sinkEvHP.flange) annotation (
            Line(
            points={{-44.48,22},{-44.48,38},{-60,38},{-60,70}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HeatExchangersGroup.Sh_HP_In, sourceShHP.flange) annotation (
            Line(
            points={{-49.36,22},{-49.36,32},{-68,32},{-68,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics),
                             Icon(graphics));
      end TestHEG_3LRh;

    end Tests;

    package TestsControl "Closed-loop test cases"
      model TestPumpControl
        import ThermoPower;
        package FluidMedium = ThermoPower.Water.StandardWater;

        Water.SinkP sinkToEcLP_p(           h=2.440e5, p0=7.19e5)
          annotation (Placement(transformation(extent={{60,-20},{80,0}},
                rotation=0)));
        Water.SourceP sourceShLP(
          redeclare package Medium = FluidMedium,
          p0=5398.2,
          h=1.43495e5)
          annotation (Placement(transformation(
              origin={-70,-10},
              extent={{10,10},{-10,-10}},
              rotation=180)));
      public
        Modelica.Blocks.Sources.Ramp n_pump(
          duration=100,
          offset=89.9,
          startTime=500,
          height=0)
          annotation (Placement(transformation(extent={{64,34},{52,46}},
                rotation=0)));
        ThermoPower.PowerPlants.Control.PID pIDController(
          CSmin=500,
          PVmin=-1,
          PVmax=1,
          CSmax=2500,
          Ti=200,
          Kp=4,
          steadyStateInit=true)
                annotation (Placement(transformation(
              origin={22,36},
              extent={{-10,10},{10,-10}},
              rotation=180)));
      public
        ThermoPower.PowerPlants.HRSG.Components.PrescribedSpeedPump pump(
          redeclare package WaterMedium = FluidMedium,
          q_nom={0.0898,0,0.1},
          head_nom={72.74,130,0},
          nominalFlow=89.8,
          n0=1500,
          feedWaterPump(redeclare function efficiencyCharacteristic =
                Functions.PumpCharacteristics.constantEfficiency (eta_nom=0.6)),
          SSInit=true,
          rho0=1000,
          nominalOutletPressure=719048,
          nominalInletPressure=5398.2)
                                annotation (Placement(transformation(
              origin={-10,-10},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        ThermoPower.Water.SensW feed_w(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={26,-6},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(y_start=1512, T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState)
          annotation (Placement(transformation(extent={{-4,26},{-24,46}},
                rotation=0)));
        inner ThermoPower.System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(n_pump.y, pIDController.SP) annotation (Line(points={{51.4,40},
                {32,40}}, color={0,0,127}));
        connect(feed_w.inlet, pump.outlet)          annotation (Line(points={{20,-10},
                {10,-10},{10,-10},{0,-10}},         thickness=0.5,
            color={0,0,255}));
        connect(sourceShLP.flange, pump.inlet)          annotation (Line(points={{-60,-10},
                {-50,-10},{-20,-10},{-20,-10}},
              thickness=0.5,
            color={0,0,255}));
        connect(feed_w.outlet, sinkToEcLP_p.flange) annotation (Line(points={{
                32,-10},{60,-10}}, thickness=0.5,
            color={0,0,255}));
        connect(pIDController.PV, feed_w.w) annotation (Line(points={{32,32},{
                40,32},{40,-8.88178e-016},{34,-8.88178e-016}}, color={0,0,127}));
        connect(pIDController.CS, firstOrder.u) annotation (Line(points={{12,36},{-2,36}},
                              color={0,0,127}));
        connect(firstOrder.y, pump.pumpSpeed_rpm)          annotation (Line(
              points={{-25,36},{-40,36},{-40,-4},{-17.2,-4}}, color={0,0,127}));
        annotation (Diagram(graphics));
      end TestPumpControl;

      model TestHRSG_wac
        package FlueGasMedium = ThermoPower.Media.FlueGas;
        package FluidMedium = ThermoPower.Water.StandardWater;

        Gas.SourceW sourceGas(
          redeclare package Medium = FlueGasMedium,
          w0=585.5,
          T=884.65)          annotation (Placement(transformation(extent={{-88,18},
                  {-72,34}},     rotation=0)));
        Gas.SinkP sinkGas(redeclare package Medium = FlueGasMedium, T=379.448)
                         annotation (Placement(transformation(extent={{74,18},{
                  90,34}}, rotation=0)));
        ThermoPower.PowerPlants.HRSG.Components.StateReader_gas stateGas_out(
                                                redeclare package Medium =
              FlueGasMedium) annotation (Placement(transformation(extent={{42,
                  16},{62,36}}, rotation=0)));
        Examples.HRSG_3LRh hRSG(redeclare package FlueGasMedium =
              FlueGasMedium,                                                     redeclare
            package FluidMedium = FluidMedium,
          SSInit=true)
          annotation (Placement(transformation(extent={{-48,-6},{32,74}},
                rotation=0)));
        Water.SinkP OutLP(redeclare package Medium = FluidMedium,
          p0=5389.2,
          h=2.3854e6)      annotation (Placement(transformation(extent={{64,-80},
                  {76,-68}}, rotation=0)));
        Water.SteamTurbineStodola turbineHP(
          wstart=67.6,
          wnom=67.6,
          eta_iso_nom=0.833,
          Kt=0.0032078,
          PRstart=4,
          pnom=12000000)
                      annotation (Placement(transformation(extent={{-46,-92},{
                  -26,-72}}, rotation=0)));
        Water.SteamTurbineStodola turbineIP(
          wstart=81.10,
          wnom=81.10,
          eta_iso_nom=0.903,
          Kt=0.018883,
          PRstart=5,
          pnom=3000000)    annotation (Placement(transformation(extent={{-18,-92},
                  {2,-72}},       rotation=0)));
        Water.SteamTurbineStodola turbineLP(
          wstart=89.82,
          wnom=89.82,
          eta_iso_nom=0.903,
          Kt=0.078004,
          PRstart=5,
          pnom=500000)     annotation (Placement(transformation(extent={{34,-92},
                  {54,-72}}, rotation=0)));
        Water.Mixer mixLP(
          redeclare package Medium = FluidMedium,
          V=10,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          pstart=719000)  annotation (Placement(transformation(extent={{10,-76},
                  {20,-66}}, rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
                      annotation (Placement(transformation(extent={{98,-88},{88,
                  -78}}, rotation=0)));
        Water.SourceP sourceShLP(
          redeclare package Medium = FluidMedium,
          p0=5398.2,
          h=1.43495e5)
          annotation (Placement(transformation(
              origin={84,-40},
              extent={{-6,6},{6,-6}},
              rotation=180)));
        ThermoPower.PowerPlants.HRSG.Control.levelsControl
          levelsControlSimplified(
          Level_HP(steadyStateInit=true),
          Level_IP(steadyStateInit=true),
          Level_LP(steadyStateInit=true))
          annotation (Placement(transformation(extent={{60,60},{80,80}},
                rotation=0)));
        Components.PrescribedSpeedPump totalFeedPump(
          redeclare package WaterMedium = FluidMedium,
          rho0=1000,
          q_nom={0.0898,0,0.1},
          head_nom={72.74,130,0},
          nominalFlow=89.8,
          n0=1500,
          nominalOutletPressure=600000,
          nominalInletPressure=5398.2)
                                  annotation (Placement(transformation(
              origin={44,-40},
              extent={{-6,6},{6,-6}},
              rotation=180)));
      protected
        Buses.Actuators actuators annotation (Placement(transformation(extent={
                  {60,-20},{68,-12}}, rotation=0)));
      public
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(sinkGas.flange, stateGas_out.outlet) annotation (Line(
            points={{74,26},{58,26}},
            color={159,159,223},
            thickness=0.5));
        connect(stateGas_out.inlet, hRSG.GasOut) annotation (Line(
            points={{46,26},{32,26}},
            color={159,159,223},
            thickness=0.5));
        connect(OutLP.flange, turbineLP.outlet) annotation (Line(points={{64,
                -74},{52,-74}}, thickness=0.5,
            color={0,0,255}));
        connect(turbineHP.shaft_b, turbineIP.shaft_a) annotation (Line(points={{-29.6,
                -82},{-14.6,-82}},       color={0,0,0}));
        connect(turbineIP.shaft_b, turbineLP.shaft_a) annotation (Line(points={{-1.6,
                -82},{37.4,-82}},      color={0,0,0}));
        connect(mixLP.in2, turbineIP.outlet)
          annotation (Line(points={{11,-74},{0,-74}},    thickness=0.5,
            color={0,0,255}));
        connect(constantSpeed.flange, turbineLP.shaft_b) annotation (Line(
              points={{88,-83},{88,-82},{50.4,-82}}, color={0,0,0}));
        connect(turbineLP.inlet, mixLP.out) annotation (Line(points={{36,-74},{
                36,-71},{20,-71}}, thickness=0.5,
            color={0,0,255}));
        connect(levelsControlSimplified.SensorsBus, hRSG.SensorsBus)
          annotation (Line(points={{60,70},{46,70},{46,66},{32,66}}, color={255,
                170,213}));
        connect(levelsControlSimplified.ActuatorsBus, hRSG.ActuatorsBus)
          annotation (Line(points={{80,70},{92,70},{92,54},{32,54}}, color={213,
                255,170}));
        connect(sourceShLP.flange, totalFeedPump.inlet) annotation (Line(
            points={{78,-40},{50,-40}},
            color={0,0,255},
            thickness=0.5));
        connect(actuators, levelsControlSimplified.ActuatorsBus) annotation (Line(
              points={{64,-16},{92,-16},{92,70},{80,70}}, color={213,255,170}));
        connect(totalFeedPump.pumpSpeed_rpm, actuators.nPump_feedLP)
          annotation (Line(points={{48.32,-36.4},{64,-36.4},{64,-16}}, color={0,
                0,127}));
        connect(totalFeedPump.outlet, hRSG.WaterIn) annotation (Line(points={{
                38,-40},{24,-40},{24,-6}}, thickness=0.5,
            color={0,0,255}));
        connect(sourceGas.flange, hRSG.GasIn) annotation (Line(
            points={{-72,26},{-48,26}},
            color={159,159,223},
            thickness=0.5,
            smooth=Smooth.None));
        connect(mixLP.in1, hRSG.Sh_LP_Out) annotation (Line(
            points={{11,-68},{8,-68},{8,-6}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(turbineIP.inlet, hRSG.Rh_IP_Out) annotation (Line(
            points={{-16,-74},{-16,-6}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(turbineHP.outlet, hRSG.Rh_IP_In) annotation (Line(
            points={{-28,-74},{-28,-6}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(turbineHP.inlet, hRSG.Sh_HP_Out) annotation (Line(
            points={{-44,-74},{-44,-36},{-40,-36},{-40,-6}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestHRSG_wac;

    end TestsControl;
    annotation (Documentation(revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
  end HRSG;

  package SteamTurbineGroup
    "Models and tests of the steam turbine group and its main components"
    package Interfaces "Interface definitions"
      partial model ST_2L
        "Base class for Steam Turbine with two pressure levels"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Turbines parameter
        parameter SI.MassFlowRate steamHPNomFlowRate
          "Nominal HP steam flow rate";
        parameter SI.MassFlowRate steamLPNomFlowRate
          "Nominal LP steam flowr rate";
        parameter SI.Pressure steamHPNomPressure "Nominal HP steam pressure";
        parameter SI.Pressure steamLPNomPressure "Nominal LP steam pressure";
        parameter SI.Area HPT_Kt "Flow coefficient"           annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "HP Turbine"));
        parameter SI.Area LPT_Kt "Flow coefficient"           annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "LP Turbine"));

        //Start value
        parameter Boolean SSInit=false "Steady-state initialization"
                                       annotation (Dialog(tab = "Initialization"));
        //HPT
        parameter SI.Pressure HPT_pstart_in = steamHPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.Pressure HPT_pstart_out = steamLPNomPressure
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.MassFlowRate HPT_wstart = steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        //LPT
        parameter SI.Pressure LPT_pstart_in = steamLPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.Pressure LPT_pstart_out = pcond
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.MassFlowRate LPT_wstart = steamLPNomFlowRate + steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));

        //other parameter
        parameter SI.Pressure pcond "Condenser pressure";

        Water.FlangeA HPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-140,180},{-100,220}}, rotation=0)));
        Water.FlangeA LPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-20,180},{20,220}}, rotation=0)));

        Water.FlangeB LPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{40,-220},{80,-180}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-200,14},{200,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{-120,30},{-120,200}}, color={0,0,255}),
              Line(points={{0,30},{0,200}}, color={0,0,255}),
              Line(points={{60,-90},{60,-192}}, color={0,0,255}),
              Polygon(points={{-126,148},{-114,148},{-120,132},{-126,148}},
                  lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{-6,148},{6,148},{0,132},{-6,148}}, lineColor={0,
                    0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{54,-132},{66,-132},{60,-148},{54,-132}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(
                points={{-120,30},{-120,-30},{-60,-90},{-60,90},{-120,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{0,30},{0,-30},{60,-90},{60,90},{0,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid)}),
                                Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics));
      end ST_2L;

      partial model ST_3L
        "Base class for Steam Turbine with three pressure levels"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Turbines parameter
        parameter SI.MassFlowRate steamHPNomFlowRate
          "Nominal HP steam flow rate";
        parameter SI.MassFlowRate steamIPNomFlowRate
          "Nominal IP steam flow rate";
        parameter SI.MassFlowRate steamLPNomFlowRate
          "Nominal LP steam flowr rate";
        parameter SI.Pressure steamHPNomPressure "Nominal HP steam pressure";
        parameter SI.Pressure steamIPNomPressure "Nominal IP steam pressure";
        parameter SI.Pressure steamLPNomPressure "Nominal LP steam pressure";
        parameter SI.Area HPT_Kt "Flow coefficient"           annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "HP Turbine"));
        parameter SI.Area IPT_Kt "Flow coefficient"           annotation (Dialog(group = "IP Turbine"));
        parameter Real IPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "IP Turbine"));
        parameter Real IPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "IP Turbine"));
        parameter SI.Area LPT_Kt "Flow coefficient"           annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "LP Turbine"));

        //Start value
        parameter Boolean SSInit=false "Steady-state initialization"
                                       annotation (Dialog(tab = "Initialization"));
        //HPT
        parameter SI.Pressure HPT_pstart_in = steamHPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.Pressure HPT_pstart_out = steamIPNomPressure
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.MassFlowRate HPT_wstart = steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));

        //IPT
        parameter SI.Pressure IPT_pstart_in = steamIPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "IP Turbine"));
        parameter SI.Pressure IPT_pstart_out = steamLPNomPressure
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "IP Turbine"));
        parameter SI.MassFlowRate IPT_wstart = steamIPNomFlowRate + steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "IP Turbine"));

        //LPT
        parameter SI.Pressure LPT_pstart_in = steamLPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.Pressure LPT_pstart_out = pcond
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.MassFlowRate LPT_wstart = steamLPNomFlowRate + steamIPNomFlowRate + steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));

        //Other parameter
        parameter SI.Pressure pcond "Condenser pressure";

        Water.FlangeA HPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-180,180},{-140,220}}, rotation=0)));
        Water.FlangeB HPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{-120,180},{-80,220}}, rotation=0)));
        Water.FlangeA IPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-60,180},{-20,220}}, rotation=0)));
        Water.FlangeA LPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{60,180},{100,220}}, rotation=0)));
        Water.FlangeB LPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{120,-220},{160,-180}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-200,14},{200,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{-100,200},{-100,90}}, color={0,0,255}),
              Line(points={{-40,30},{-40,200}}, color={0,0,255}),
              Line(points={{80,30},{80,200}}, color={0,0,255}),
              Line(points={{20,90},{20,130},{80,130}}, color={0,0,255}),
              Ellipse(
                extent={{76,134},{84,126}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{140,-90},{140,-200}}, color={0,0,255}),
              Line(points={{-160,30},{-160,120},{-160,146},{-160,204}}, color={
                    0,0,255}),
              Polygon(points={{-166,148},{-154,148},{-160,132},{-166,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-46,148},{-34,148},{-40,132},{-46,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-106,134},{-94,134},{-100,150},{-106,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{40,136},{40,124},{56,130},{40,136}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,166},{86,166},{80,150},{74,166}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,106},{86,106},{80,90},{74,106}}, lineColor={0,
                    0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{134,-132},{146,-132},{140,-148},{134,-132}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(
                points={{-160,30},{-160,-30},{-100,-90},{-100,90},{-160,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-40,30},{-40,-30},{20,-90},{20,90},{-40,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{80,30},{80,-30},{140,-90},{140,90},{80,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid)}),
                                Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics));
      end ST_3L;

      partial model ST_2LHU
        "Base class for Steam Turbine with two pressure levels and with coupling Heat Usage"
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Turbines parameter
        parameter SI.MassFlowRate steamHPNomFlowRate
          "Nominal HP steam flow rate";
        parameter SI.MassFlowRate steamLPNomFlowRate
          "Nominal LP steam flowr rate";
        parameter SI.Pressure steamHPNomPressure "Nominal HP steam pressure";
        parameter SI.Pressure steamLPNomPressure "Nominal LP steam pressure";
        parameter SI.Area HPT_Kt "Flow coefficient"           annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "HP Turbine"));
        parameter SI.Area LPT_Kt "Flow coefficient"           annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "LP Turbine"));

        //Start value
        parameter Boolean SSInit=false "Steady-state initialization"
                                       annotation (Dialog(tab = "Initialization"));
        //HPT
        parameter SI.Pressure HPT_pstart_in = steamHPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.Pressure HPT_pstart_out = steamLPNomPressure
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.MassFlowRate HPT_wstart = steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));

        //LPT
        parameter SI.Pressure LPT_pstart_in = steamLPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.Pressure LPT_pstart_out = pcond
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.MassFlowRate LPT_wstart = steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));

        //other parameter
        parameter SI.Pressure pcond "Condenser pressure";

        Water.FlangeB SteamForHU(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-80,-220},{-40,-180}}, rotation=0)));
        Water.FlangeB LPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{28,-220},{68,-180}}, rotation=0)));

        Water.FlangeA HPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-140,180},{-100,220}}, rotation=0)));
        Water.FlangeA LPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-20,180},{20,220}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-20,134},{-12,126}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-60,-198},{-60,-140},{140,-140},{140,130},{0,130}},
                  color={0,0,255}),
              Line(points={{-60,90},{-60,130},{0,130}}, color={0,0,255}),
              Line(points={{0,130},{0,198}}, color={0,0,255}),
              Rectangle(
                extent={{-200,14},{200,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{-120,28},{-120,200}}, color={0,0,255}),
              Line(points={{48,-90},{48,-192}}, color={0,0,255}),
              Line(points={{-12,130},{-12,120},{-12,30}}, color={0,0,255}),
              Polygon(points={{-50,136},{-50,124},{-34,130},{-50,136}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-126,148},{-114,148},{-120,132},{-126,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-6,168},{6,168},{0,152},{-6,168}}, lineColor={0,
                    0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{42,-152},{54,-152},{48,-168},{42,-152}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-18,102},{-6,102},{-12,86},{-18,102}}, lineColor=
                    {0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{26,136},{26,124},{42,130},{26,136}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Ellipse(
                extent={{0,134},{8,126}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Rectangle(extent={{-16,134},{4,126}}, lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(
                points={{-120,30},{-120,-30},{-60,-90},{-60,90},{-120,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-12,30},{-12,-30},{48,-90},{48,90},{-12,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid)}),
                                Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics));
      end ST_2LHU;

      partial model ST_2LRhHU
        "Base class for Steam Turbine with two pressure levels, reheat and with coupling Heat Usage"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Turbines parameter
        parameter SI.MassFlowRate steamHPNomFlowRate
          "Nominal HP steam flow rate";
        parameter SI.MassFlowRate steamLPNomFlowRate
          "Nominal LP steam flowr rate";
        parameter SI.Pressure steamHPNomPressure "Nominal HP steam pressure";
        parameter SI.Pressure steamLPNomPressure "Nominal LP steam pressure";
        parameter SI.Area HPT_Kt "Flow coefficient"           annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "HP Turbine"));
        parameter SI.Area IPT_Kt "Flow coefficient"           annotation (Dialog(group = "IP Turbine"));
        parameter Real IPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "IP Turbine"));
        parameter Real IPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "IP Turbine"));
        parameter SI.Area LPT_Kt "Flow coefficient"           annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "LP Turbine"));

        //Start value
        parameter Boolean SSInit=false "Steady-state initialization"
                                       annotation (Dialog(tab = "Initialization"));
        //HPT
        parameter SI.Pressure HPT_pstart_in = steamHPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.Pressure HPT_pstart_out = steamLPNomPressure
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.MassFlowRate HPT_wstart = steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));

        //LPT
        parameter SI.Pressure LPT_pstart_in = steamLPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.Pressure LPT_pstart_out = pcond
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.MassFlowRate LPT_wstart = steamLPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));

        //other parameter
        parameter SI.Pressure pcond "Condenser pressure";

        Water.FlangeB SteamForHU(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-60,-220},{-20,-180}}, rotation=0)));
        Water.FlangeB LPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{60,-220},{100,-180}}, rotation=0)));
        Water.FlangeA HPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-180,180},{-140,220}}, rotation=0)));
        Water.FlangeB HPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{-120,180},{-80,220}}, rotation=0)));
        Water.FlangeA LPT_In_Rh(redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-60,180},{-20,220}}, rotation=0)));
        Water.FlangeA LPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{60,180},{100,220}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{76,136},{84,128}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-98,132},{140,132},{140,-140},{-40,-140},{-40,-198}},
                  color={0,0,255}),
              Line(points={{80,132},{80,192}}, color={0,0,255}),
              Line(points={{-160,198},{-160,30}}, color={0,0,255}),
              Line(points={{-100,200},{-100,88}}, color={0,0,255}),
              Line(points={{-40,200},{-40,30}}, color={0,0,255}),
              Rectangle(
                extent={{-200,14},{200,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{80,-90},{80,-198}}, color={0,0,255}),
              Ellipse(
                extent={{-104,136},{-96,128}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{-74,138},{-74,126},{-58,132},{-74,138}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-166,128},{-154,128},{-160,112},{-166,128}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{104,138},{104,126},{120,132},{104,138}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,170},{86,170},{80,154},{74,170}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-46,106},{-34,106},{-40,90},{-46,106}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,-152},{86,-152},{80,-168},{74,-152}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-106,152},{-94,152},{-100,168},{-106,152}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(
                points={{-160,30},{-160,-30},{-100,-90},{-100,90},{-160,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-40,30},{-40,-30},{80,-90},{80,90},{-40,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid)}),
                                Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics));
      end ST_2LRhHU;

      partial model ST_2LRh_3t
        "Base class for Steam Turbine with two pressure levels, reheat and three tappings"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Turbines parameter
        parameter SI.MassFlowRate steamHPNomFlowRate
          "Nominal HP steam flow rate";
        parameter SI.MassFlowRate steamIPNomFlowRate
          "Nominal IP steam flow rate";
        parameter SI.MassFlowRate steamLPNomFlowRate
          "Nominal LP steam flowr rate";
        parameter SI.Pressure steamHPNomPressure "Nominal HP steam pressure";
        parameter SI.Pressure steamIPNomPressure "Nominal IP steam pressure";
        parameter SI.Pressure steamLPNomPressure "Nominal LP steam pressure";
        parameter SI.Area HPT_Kt "Flow coefficient"           annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "HP Turbine"));
        parameter SI.Area IPT_Kt "Flow coefficient"           annotation (Dialog(group = "IP Turbine"));
        parameter Real IPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "IP Turbine"));
        parameter Real IPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "IP Turbine"));
        parameter SI.Area LPT_Kt "Flow coefficient"           annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "LP Turbine"));

        //Start value
        //HPT
        parameter SI.Pressure HPT_pstart_in = steamHPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.Pressure HPT_pstart_out = steamIPNomPressure
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.MassFlowRate HPT_wstart = steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));

        //IPT
        parameter SI.Pressure IPT_pstart_in = steamIPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "IP Turbine"));
        parameter SI.Pressure IPT_pstart_out = steamLPNomPressure
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "IP Turbine"));
        parameter SI.MassFlowRate IPT_wstart = steamIPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "IP Turbine"));

        //LPT
        parameter SI.Pressure LPT_pstart_in = steamLPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.Pressure LPT_pstart_out = pcond
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.MassFlowRate LPT_wstart = steamLPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));

        //other parameter
        parameter SI.Pressure pcond "Condenser pressure";

        Water.FlangeB Tap1(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{-140,-210},{-120,-190}}, rotation=0)));
        Water.FlangeB Tap2(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{-50,-210},{-30,-190}}, rotation=0)));
        Water.FlangeB Tap3(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{-10,-210},{10,-190}}, rotation=0)));

        Water.FlangeA HPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-180,180},{-140,220}}, rotation=0)));
        Water.FlangeB HPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{-120,180},{-80,220}}, rotation=0)));
        Water.FlangeA IPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-60,180},{-20,220}}, rotation=0)));
        Water.FlangeA LPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{60,180},{100,220}}, rotation=0)));
        Water.FlangeB LPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{60,-220},{100,-180}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(points={{-160,198},{-160,30}}, color={0,0,255}),
              Line(points={{-100,200},{-100,86}}, color={0,0,255}),
              Line(points={{-40,200},{-40,30}}, color={0,0,255}),
              Rectangle(
                extent={{-200,14},{202,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{20,52},{20,140},{80,140},{80,198}}, color={0,0,255}),
              Line(points={{80,-76},{80,-198}}, color={0,0,255}),
              Line(
                points={{-130,-50},{-130,-200}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Line(
                points={{-40,-200},{-40,-100},{-10,-100},{-10,-40}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Line(
                points={{0,-200},{0,-130},{50,-130},{50,-66}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Polygon(
                points={{-40,30},{-40,-30},{80,-90},{80,92},{-40,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-160,30},{-160,-30},{-100,-90},{-100,90},{-160,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{-166,148},{-154,148},{-160,132},{-166,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-106,134},{-94,134},{-100,150},{-106,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-46,148},{-34,148},{-40,132},{-46,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{14,108},{26,108},{20,92},{14,108}}, lineColor={0,
                    0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,-134},{86,-134},{80,-150},{74,-134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255})}));

      end ST_2LRh_3t;

      partial model ST_3LRh_7t
        "Base class for Steam Turbine with two pressure levels, reheat and seven tappings"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Turbines parameter
        parameter SI.MassFlowRate steamHPNomFlowRate
          "Nominal HP steam flow rate";
        parameter SI.MassFlowRate steamIPNomFlowRate
          "Nominal IP steam flow rate";
        parameter SI.MassFlowRate steamLPNomFlowRate
          "Nominal LP steam flowr rate";
        parameter SI.Pressure steamHPNomPressure "Nominal HP steam pressure";
        parameter SI.Pressure steamIPNomPressure "Nominal IP steam pressure";
        parameter SI.Pressure steamLPNomPressure "Nominal LP steam pressure";
        parameter SI.Area HPT_Kt "Flow coefficient"           annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "HP Turbine"));
        parameter Real HPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "HP Turbine"));
        parameter SI.Area IPT_Kt "Flow coefficient"           annotation (Dialog(group = "IP Turbine"));
        parameter Real IPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "IP Turbine"));
        parameter Real IPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "IP Turbine"));
        parameter SI.Area LPT_Kt "Flow coefficient"           annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_mech=0.98 "Mechanical efficiency"            annotation (Dialog(group = "LP Turbine"));
        parameter Real LPT_eta_iso_nom=0.92 "Nominal isentropic efficiency"
                                                     annotation (Dialog(group = "LP Turbine"));

        //Start value
        //HPT
        parameter SI.Pressure HPT_pstart_in = steamHPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.Pressure HPT_pstart_out = steamIPNomPressure
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));
        parameter SI.MassFlowRate HPT_wstart = steamHPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "HP Turbine"));

        //IPT
        parameter SI.Pressure IPT_pstart_in = steamIPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "IP Turbine"));
        parameter SI.Pressure IPT_pstart_out = steamLPNomPressure
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "IP Turbine"));
        parameter SI.MassFlowRate IPT_wstart = steamIPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "IP Turbine"));

        //LPT
        parameter SI.Pressure LPT_pstart_in = steamLPNomPressure
          "Inlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.Pressure LPT_pstart_out = pcond
          "Outlet pressure start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));
        parameter SI.MassFlowRate LPT_wstart = steamLPNomFlowRate
          "Mass flow rate start value"
           annotation (Dialog(tab = "Initialization",
                              group = "LP Turbine"));

        //other parameter
        parameter SI.Pressure pcond "Condenser pressure";

        Water.FlangeB Tap1(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{-180,-210},{-160,-190}}, rotation=0)));
        Water.FlangeB Tap2(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{-140,-210},{-120,-190}}, rotation=0)));
        Water.FlangeB Tap3(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{-100,-210},{-80,-190}}, rotation=0)));
        Water.FlangeB Tap4(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{-60,-210},{-40,-190}}, rotation=0)));
        Water.FlangeB Tap5(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{-20,-210},{0,-190}}, rotation=0)));
        Water.FlangeB Tap6(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{20,-210},{40,-190}}, rotation=0)));
        Water.FlangeB Tap7(            redeclare package Medium = FluidMedium)
                                          annotation (Placement(transformation(
                extent={{60,-210},{80,-190}}, rotation=0)));

        Water.FlangeA HPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-180,180},{-140,220}}, rotation=0)));
        Water.FlangeB HPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{-120,180},{-80,220}}, rotation=0)));
        Water.FlangeA IPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-60,180},{-20,220}}, rotation=0)));
        Water.FlangeB LPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{60,180},{100,220}}, rotation=0)));
        Water.FlangeB LPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{120,-220},{160,-180}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-202,14},{200,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{-100,200},{-100,88}}, color={0,0,255}),
              Line(points={{-40,30},{-40,200}}, color={0,0,255}),
              Line(points={{80,30},{80,200}}, color={0,0,255}),
              Line(points={{20,84},{20,130},{80,130}}, color={0,0,255}),
              Ellipse(
                extent={{76,134},{84,126}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{140,-84},{140,-200}}, color={0,0,255}),
              Line(points={{-160,30},{-160,120},{-160,146},{-160,204}}, color={
                    0,0,255}),
              Line(
                points={{-170,-200},{-170,-108},{-140,-108},{-140,-44}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Line(
                points={{-130,-200},{-130,-120},{-120,-120},{-120,-58}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Line(
                points={{-50,-196},{-50,-120},{0,-120},{0,-60}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Line(
                points={{-90,-198},{-90,-108},{-20,-108},{-20,-40}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Line(
                points={{70,-198},{70,-150},{124,-150},{124,-64}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Line(
                points={{30,-194},{30,-140},{110,-140},{110,-52}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Line(
                points={{-10,-198},{-10,-130},{92,-130},{92,-36}},
                color={0,0,255},
                pattern=LinePattern.Dash),
              Polygon(
                points={{-160,30},{-160,-30},{-100,-90},{-100,90},{-160,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-40,30},{-40,-30},{20,-90},{20,90},{-40,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{80,30},{80,-30},{140,-90},{140,90},{80,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{-166,148},{-154,148},{-160,132},{-166,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-106,134},{-94,134},{-100,150},{-106,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-46,148},{-34,148},{-40,132},{-46,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{134,-134},{146,-134},{140,-150},{134,-134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{40,136},{40,124},{56,130},{40,136}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,166},{86,166},{80,150},{74,166}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,106},{86,106},{80,90},{74,106}}, lineColor={0,
                    0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255})}));
      end ST_3LRh_7t;

      partial model Condenser "Base class for condenser"
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Nominal parameter
        parameter SI.MassFlowRate condNomFlowRate
          "Nominal flow rate through the condensing fluid side";
        parameter SI.MassFlowRate coolNomFlowRate
          "Nominal flow rate through the cooling fluid side";
        parameter SI.Pressure condNomPressure
          "Nominal pressure in the condensing fluid side inlet";
        parameter SI.Pressure coolNomPressure
          "Nominal pressure in the cooling fluid side inlet";

        //Physical Parameter
        parameter Integer N_cool=2 "Number of nodes of the cooling fluid side";
        parameter SI.Area condExchSurface
          "Exchange surface between condensing fluid - metal";
        parameter SI.Area coolExchSurface
          "Exchange surface between metal - cooling fluid";
        parameter SI.Volume condVol "Condensing fluid volume";
        parameter SI.Volume coolVol "Cooling fluid volume";
        parameter SI.Volume metalVol "Volume of the metal part in the tubes";
        parameter SI.SpecificHeatCapacity cm "Specific heat capacity of metal";
        parameter SI.Density rhoMetal "Density of metal";

        //Initialization conditions
        parameter SI.Pressure pstart_cond = condNomPressure
          "Condensing fluid pressure start value"                annotation(Dialog(tab = "Initialization"));
        parameter SI.Volume Vlstart_cond = condVol*0.15
          "Start value of the liquid water volume, condensation side"             annotation(Dialog(tab = "Initialization"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));

        Water.FlangeB waterOut(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{-30,-120},{10,-80}}, rotation=0)));
        Water.FlangeA coolingIn(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{80,-60},{120,-20}}, rotation=0)));
        Water.FlangeB coolingOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{80,40},{120,80}}, rotation=0)));
        Water.FlangeA steamIn(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{-30,80},{10,120}}, rotation=0)));

        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-100,100},{80,-60}},
                lineColor={0,0,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-90,-60},{70,-100}},
                lineColor={0,0,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(
                points={{100,-40},{-60,-40},{10,10},{-60,60},{100,60}},
                color={0,0,255},
                thickness=0.5),
              Text(
                extent={{-100,-113},{100,-143}},
                lineColor={85,170,255},
                textString=
                     "%name")}));
      end Condenser;

      partial model CondPlant_base
        "Base class for Condensation Plant (simplified version)"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;
        parameter SI.Pressure p "Pressure of condesation";
        parameter SI.Volume Vtot "Total volume condensing fluid side";
        parameter SI.Volume Vlstart "Start value of the liquid volume"
                                                                      annotation(Dialog(tab = "Initialization"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));
        Water.FlangeA SteamIn(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{-20,80},{20,120}}, rotation=0)));
        Water.FlangeB WaterOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{-20,-120},{20,-80}}, rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  88,-50},{108,-30}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{108,-82},{88,-62}}, rotation=0)));
        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-60,60},{60,-60}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{40,30},{-40,30},{38,0},{-40,-30},{40,-30}},
                color={0,0,255},
                thickness=0.5),
              Line(points={{0,60},{0,100}}, color={0,0,255}),
              Line(points={{0,-60},{0,-100}}, color={0,0,255})}));

      end CondPlant_base;

      partial model CondPlantHU_base
        "Base class for Condensation Plant with coupling Heat Usage (simplified version)"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        parameter SI.Pressure p "Pressure of condesation";
        parameter SI.Volume Vtot "Total volume condensing fluid side";
        parameter SI.Volume Vlstart "Start value of the liquid volume"
                                                                      annotation(Dialog(tab = "Initialization"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));
        Water.FlangeA CondensatedFromHU(            redeclare package Medium =
              FluidMedium)                  annotation (Placement(
              transformation(extent={{-70,80},{-30,120}}, rotation=0)));
        Water.FlangeA SteamIn(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{30,80},{70,120}}, rotation=0)));
        Water.FlangeB WaterOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{-20,-120},{20,-80}}, rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  88,-50},{108,-30}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{108,-82},{88,-62}}, rotation=0)));
        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-60,60},{60,-60}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{40,30},{-40,30},{38,0},{-40,-30},{40,-30}},
                color={0,0,255},
                thickness=0.5),
              Line(points={{0,-60},{0,-98}}, color={0,0,255}),
              Line(points={{-60,0},{-80,0},{-80,70},{-50,70},{-50,102}}, color=
                    {0,0,255}),
              Line(points={{0,60},{0,70},{50,70},{50,88}}, color={0,0,255})}));

      end CondPlantHU_base;

      partial model CondPlant "Base class for Condensation Plant"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Nominal parameter
        parameter SI.MassFlowRate condNomFlowRate
          "Nominal flow rate through the condensing fluid side";
        parameter SI.MassFlowRate coolNomFlowRate
          "Nominal flow rate through the cooling fluid side";
        parameter SI.Pressure condNomPressure
          "Nominal pressure in the condensing fluid side inlet";
        parameter SI.Pressure coolNomPressure
          "Nominal pressure in the cooling fluid side inlet";

        //Physical Parameter
        parameter Integer N_cool=2 "Number of node of the cooling fluid side";
        parameter SI.Area condExchSurface
          "Exchange surface between condensing fluid - metal";
        parameter SI.Area coolExchSurface
          "Exchange surface between metal - cooling fluid";
        parameter SI.Volume condVol "Condensing fluid volume";
        parameter SI.Volume coolVol "Cooling fluid volume";
        parameter SI.Volume metalVol "Volume of the metal part in the tubes";
        parameter SI.SpecificHeatCapacity cm "Specific heat capacity of metal";
        parameter SI.Density rhoMetal "Density of metal";

        //Initialization
        parameter SI.Pressure pstart_cond = condNomPressure
          "Condensing fluid pressure start value"                annotation(Dialog(tab = "Initialization"));
        parameter SI.Volume Vlstart_cond = condVol*0.15
          "Start value of the liquid water volume, condensation side"             annotation(Dialog(tab = "Initialization"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization Conditions"));

        Water.FlangeA SteamIn(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{-20,80},{20,120}}, rotation=0)));
        Water.FlangeB WaterOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{-20,-120},{20,-80}}, rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  88,-50},{108,-30}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{108,-82},{88,-62}}, rotation=0)));
        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-60,60},{60,-60}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{40,30},{-40,30},{38,0},{-40,-30},{40,-30}},
                color={0,0,255},
                thickness=0.5),
              Line(points={{0,60},{0,100}}, color={0,0,255}),
              Line(points={{0,-60},{0,-100}}, color={0,0,255})}));

      end CondPlant;

      partial model CondPlantHU
        "Base class for Condensation Plant with coupling Heat Usage"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Nominal parameter
        parameter SI.MassFlowRate condNomFlowRate
          "Nominal flow rate through the condensing fluid side";
        parameter SI.MassFlowRate coolNomFlowRate
          "Nominal flow rate through the cooling fluid side";
        parameter SI.Pressure condNomPressure
          "Nominal pressure in the condensing fluid side inlet";
        parameter SI.Pressure coolNomPressure
          "Nominal pressure in the cooling fluid side inlet";

        //Physical Parameter
        parameter Integer N_cool=2 "Number of node of the cooling fluid side";
        parameter SI.Area condExchSurface
          "Exchange surface between condensing fluid - metal";
        parameter SI.Area coolExchSurface
          "Exchange surface between metal - cooling fluid";
        parameter SI.Volume condVol "Condensing fluid volume";
        parameter SI.Volume coolVol "Cooling fluid volume";
        parameter SI.Volume metalVol "Volume of the metal part in the tubes";
        parameter SI.SpecificHeatCapacity cm "Specific heat capacity of metal";
        parameter SI.Density rhoMetal "Density of metal";

        //Initialization
        parameter SI.Pressure pstart_cond = condNomPressure
          "Condensing fluid pressure start value"                annotation(Dialog(tab = "Initialization"));
        parameter SI.Volume Vlstart_cond = condVol*0.15
          "Start value of the liquid water volume, condensation side"             annotation(Dialog(tab = "Initialization"));
        parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization"));

        Water.FlangeA CondensatedFromHU(            redeclare package Medium =
              FluidMedium)                  annotation (Placement(
              transformation(extent={{-70,80},{-30,120}}, rotation=0)));
        Water.FlangeA SteamIn(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{30,80},{70,120}}, rotation=0)));
        Water.FlangeB WaterOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{-20,-120},{20,-80}}, rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  88,-50},{108,-30}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{108,-82},{88,-62}}, rotation=0)));
        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-60,60},{60,-60}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{40,30},{-40,30},{38,0},{-40,-30},{40,-30}},
                color={0,0,255},
                thickness=0.5),
              Line(points={{0,-60},{0,-98}}, color={0,0,255}),
              Line(points={{-60,0},{-80,0},{-80,80},{-50,80},{-50,102}}, color=
                    {0,0,255}),
              Line(points={{0,60},{0,80},{50,80},{50,98}}, color={0,0,255})}));

      end CondPlantHU;

      partial model STGroup2L
        "Base class for Steam Turbine Group with two pressure levels"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;
         parameter Boolean SSInit=false "Steady-state initialization";

        Water.FlangeA From_SH_HP(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-140,180},{-100,220}}, rotation=0)));
        Water.FlangeA From_SH_LP(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-20,180},{20,220}}, rotation=0)));
        Water.FlangeB WaterOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{120,180},{160,220}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{46,-162},{74,-170}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{60,-126},{60,-78}}, color={0,0,255}),
              Ellipse(
                extent={{40,-126},{80,-166}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{70,-136},{50,-136},{70,-146},{50,-156},{70,-156},{
                    70,-156}}, color={0,0,255}),
              Line(points={{60,-170},{60,-180},{140,-180},{140,200}}, color={0,
                    0,255}),
              Ellipse(
                extent={{126,-132},{154,-160}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{140,-160},{140,-132},{152,-154},{140,-132},{128,
                    -154}}, color={0,0,255}),
              Rectangle(
                extent={{-200,14},{200,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{-120,30},{-120,200}}, color={0,0,255}),
              Line(points={{0,30},{0,200}}, color={0,0,255}),
              Polygon(points={{-126,148},{-114,148},{-120,132},{-126,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-6,148},{6,148},{0,132},{-6,148}}, lineColor={0,
                    0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(
                points={{-120,30},{-120,-30},{-60,-90},{-60,90},{-120,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{0,30},{0,-30},{60,-90},{60,90},{0,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{134,134},{146,134},{140,150},{134,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{94,-174},{94,-186},{110,-180},{94,-174}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255})}));
      end STGroup2L;

      partial model STGroup2LRh
        "Base class for Steam Turbine Group with two pressure levels and reheat"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;
        parameter Boolean SSInit=false "Steady-state initialization";
        Water.FlangeA From_SH_HP(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-180,180},{-140,220}}, rotation=0)));
        Water.FlangeB To_RH_IP(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{-120,180},{-80,220}}, rotation=0)));
        Water.FlangeA From_RH_IP(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-60,180},{-20,220}}, rotation=0)));
        Water.FlangeA From_SH_LP(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{60,180},{100,220}}, rotation=0)));
        Water.FlangeB WaterOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{140,180},{180,220}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{66,-162},{94,-170}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{80,-128},{80,-80}}, color={0,0,255}),
              Ellipse(
                extent={{60,-126},{100,-166}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{90,-136},{70,-136},{90,-146},{70,-156},{90,-156},{
                    90,-156}}, color={0,0,255}),
              Line(points={{80,-170},{80,-180},{160,-180},{160,196}}, color={0,
                    0,255}),
              Ellipse(
                extent={{146,-132},{174,-160}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{160,-160},{160,-132},{172,-154},{160,-132},{148,
                    -154}}, color={0,0,255}),
              Line(points={{-160,198},{-160,30}}, color={0,0,255}),
              Line(points={{-100,200},{-100,88}}, color={0,0,255}),
              Line(points={{-40,200},{-40,30}}, color={0,0,255}),
              Rectangle(
                extent={{-200,14},{200,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{20,58},{20,140},{80,140},{80,198}}, color={0,0,255}),
              Polygon(points={{-166,148},{-154,148},{-160,132},{-166,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-106,134},{-94,134},{-100,150},{-106,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-46,148},{-34,148},{-40,132},{-46,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{14,116},{26,116},{20,100},{14,116}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(
                points={{-160,30},{-160,-30},{-100,-90},{-100,90},{-160,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-40,30},{-40,-30},{80,-90},{80,90},{-40,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{154,134},{166,134},{160,150},{154,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{114,-174},{114,-186},{130,-180},{114,-174}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255})}));

      end STGroup2LRh;

      partial model STGroup3LRh
        "Base class for Steam Turbine Group with three pressure levels and reheat"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;
        parameter Boolean SSInit=false "Steady-state initialization";
        Water.FlangeA From_SH_HP(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-180,180},{-140,220}}, rotation=0)));
        Water.FlangeB To_RH_IP(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{-120,180},{-80,220}}, rotation=0)));
        Water.FlangeA From_RH_IP(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-60,180},{-20,220}}, rotation=0)));
        Water.FlangeA From_SH_LP(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{60,180},{100,220}}, rotation=0)));
        Water.FlangeB WaterOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{140,180},{180,220}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{86,-162},{114,-170}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{80,-126},{120,-166}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{110,-136},{90,-136},{110,-146},{90,-156},{110,-156},
                    {110,-156}}, color={0,0,255}),
              Line(points={{100,-168},{100,-186},{160,-186},{160,202}}, color={
                    0,0,255}),
              Line(points={{140,-88},{140,-110},{100,-110},{100,-126}}, color={
                    0,0,255}),
              Ellipse(
                extent={{146,-132},{174,-160}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{160,-160},{160,-132},{172,-154},{160,-132},{148,
                    -154}}, color={0,0,255}),
              Rectangle(
                extent={{-200,14},{200,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{-100,200},{-100,90}}, color={0,0,255}),
              Line(points={{-40,30},{-40,200}}, color={0,0,255}),
              Line(points={{80,30},{80,200}}, color={0,0,255}),
              Line(points={{20,90},{20,130},{80,130}}, color={0,0,255}),
              Ellipse(
                extent={{76,134},{84,126}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-160,30},{-160,120},{-160,146},{-160,204}}, color={
                    0,0,255}),
              Polygon(points={{-166,148},{-154,148},{-160,132},{-166,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-46,148},{-34,148},{-40,132},{-46,148}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-106,134},{-94,134},{-100,150},{-106,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{40,136},{40,124},{56,130},{40,136}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,166},{86,166},{80,150},{74,166}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,106},{86,106},{80,90},{74,106}}, lineColor={0,
                    0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(
                points={{-160,30},{-160,-30},{-100,-90},{-100,90},{-160,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-40,30},{-40,-30},{20,-90},{20,90},{-40,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{80,30},{80,-30},{140,-90},{140,90},{80,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{154,134},{166,134},{160,150},{154,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{126,-180},{126,-192},{142,-186},{126,-180}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255})}));
      end STGroup3LRh;

      partial model STGroup2LHU
        "Base class for Steam Turbine Group with two pressure levels and coupling Heat Usage"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;
        parameter Boolean SSInit=false "Steady-state initialization";
        Water.FlangeB WaterOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{120,180},{160,220}}, rotation=0)));
        Water.FlangeA WaterFromHU(            redeclare package Medium =
              FluidMedium)                    annotation (Placement(
              transformation(extent={{120,-220},{160,-180}}, rotation=0)));
        Water.FlangeB SteamForHU(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-80,-220},{-40,-180}}, rotation=0)));
        Water.FlangeA HPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-140,180},{-100,220}}, rotation=0)));
        Water.FlangeA LPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-20,180},{20,220}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{34,-168},{62,-176}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{48,-134},{48,-70}}, color={0,0,255}),
              Ellipse(
                extent={{28,-132},{68,-172}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{58,-142},{38,-142},{58,-152},{38,-162},{58,-162},{
                    58,-162}}, color={0,0,255}),
              Ellipse(
                extent={{136,-136},{144,-144}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{140,-140},{140,-198}}, color={0,0,255}),
              Line(points={{140,-140},{140,190}}, color={0,0,255}),
              Line(points={{48,-174},{48,-186},{110,-186},{110,-140},{140,-140}},
                  color={0,0,255}),
              Ellipse(
                extent={{126,-92},{154,-120}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{140,-120},{140,-92},{152,-114},{140,-92},{128,-114}},
                  color={0,0,255}),
              Ellipse(
                extent={{-20,136},{-12,128}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-60,-196},{-60,-110},{100,-110},{100,132},{0,132}},
                  color={0,0,255}),
              Line(points={{-60,92},{-60,132},{0,132}}, color={0,0,255}),
              Line(points={{0,132},{0,200}}, color={0,0,255}),
              Rectangle(
                extent={{-200,16},{200,-12}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(points={{-120,30},{-120,202}}, color={0,0,255}),
              Line(points={{-12,132},{-12,122},{-12,32}}, color={0,0,255}),
              Polygon(points={{-50,138},{-50,126},{-34,132},{-50,138}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-126,150},{-114,150},{-120,134},{-126,150}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-6,170},{6,170},{0,154},{-6,170}}, lineColor={0,
                    0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-18,104},{-6,104},{-12,88},{-18,104}}, lineColor=
                    {0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{26,138},{26,126},{42,132},{26,138}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Ellipse(
                extent={{0,136},{8,128}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Rectangle(extent={{-16,136},{4,128}}, lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(
                points={{-120,32},{-120,-28},{-60,-88},{-60,92},{-120,32}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-12,32},{-12,-28},{48,-88},{48,92},{-12,32}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{-66,-134},{-54,-134},{-60,-150},{-66,-134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{134,134},{146,134},{140,150},{134,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{134,-170},{146,-170},{140,-154},{134,-170}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{80,-180},{80,-192},{96,-186},{80,-180}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255})}));
      end STGroup2LHU;

      partial model STGroup2LRhHU
        "Base class for Steam Turbine Group with two pressure levels and reheat, and with coupling Heat Usage"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;
        parameter Boolean SSInit=false "Steady-state initialization";
        Water.FlangeB SteamForHU(            redeclare package Medium =
              FluidMedium)                   annotation (Placement(
              transformation(extent={{-58,-220},{-18,-180}}, rotation=0)));
        Water.FlangeA WaterFromHU(            redeclare package Medium =
              FluidMedium)                    annotation (Placement(
              transformation(extent={{140,-220},{180,-180}}, rotation=0)));
        Water.FlangeB WaterOut(            redeclare package Medium =
              FluidMedium)                 annotation (Placement(transformation(
                extent={{140,180},{180,220}}, rotation=0)));
        Water.FlangeA HPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-180,180},{-140,220}}, rotation=0)));
        Water.FlangeB HPT_Out(            redeclare package Medium =
              FluidMedium)                annotation (Placement(transformation(
                extent={{-120,180},{-80,220}}, rotation=0)));
        Water.FlangeA IPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-60,180},{-20,220}}, rotation=0)));
        Water.FlangeA LPT_In(            redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{60,180},{100,220}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b Shaft_b
          annotation (Placement(transformation(extent={{180,-20},{220,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a Shaft_a
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{66,-168},{94,-176}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{80,-134},{80,-74}}, color={0,0,255}),
              Ellipse(
                extent={{60,-132},{100,-172}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{90,-142},{70,-142},{90,-152},{70,-162},{90,-162},{
                    90,-162}}, color={0,0,255}),
              Ellipse(
                extent={{156,-136},{164,-144}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{160,-140},{160,-198}}, color={0,0,255}),
              Line(points={{160,-140},{160,194}}, color={0,0,255}),
              Line(points={{80,-176},{80,-186},{130,-186},{130,-140},{160,-140}},
                  color={0,0,255}),
              Ellipse(
                extent={{146,-92},{174,-120}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{160,-120},{160,-92},{172,-114},{160,-92},{148,-114}},
                  color={0,0,255}),
              Ellipse(
                extent={{76,136},{84,128}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-98,132},{134,132},{134,-110},{-40,-110},{-40,-198}},
                  color={0,0,255}),
              Line(points={{80,132},{80,192}}, color={0,0,255}),
              Line(points={{-160,198},{-160,30}}, color={0,0,255}),
              Line(points={{-100,200},{-100,88}}, color={0,0,255}),
              Line(points={{-40,200},{-40,30}}, color={0,0,255}),
              Rectangle(
                extent={{-200,14},{200,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Ellipse(
                extent={{-104,136},{-96,128}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{-74,138},{-74,126},{-58,132},{-74,138}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-166,128},{-154,128},{-160,112},{-166,128}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{104,138},{104,126},{120,132},{104,138}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{74,170},{86,170},{80,154},{74,170}}, lineColor={
                    0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-46,106},{-34,106},{-40,90},{-46,106}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-106,152},{-94,152},{-100,168},{-106,152}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(
                points={{-160,30},{-160,-30},{-100,-90},{-100,90},{-160,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-40,30},{-40,-30},{80,-90},{80,90},{-40,30}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(points={{154,-170},{166,-170},{160,-154},{154,-170}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{100,-180},{100,-192},{116,-186},{100,-180}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{-46,-134},{-34,-134},{-40,-150},{-46,-134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255}),
              Polygon(points={{154,134},{166,134},{160,150},{154,134}},
                  lineColor={0,0,255},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255})}));
      end STGroup2LRhHU;
    end Interfaces;

    package Components "Component definitions"

      model Condenser "Condenser"
        extends Interfaces.Condenser;
        parameter SI.CoefficientOfHeatTransfer gamma_cond
          "Coefficient of heat transfer on condensation surfaces";
        parameter SI.CoefficientOfHeatTransfer gamma_cool
          "Coefficient of heat transfer of cooling fluid side";
        parameter Choices.Flow1D.FFtypes FFtype_cool = Choices.Flow1D.FFtypes.NoFriction
          "Friction Factor Type";
        parameter Choices.Flow1D.HCtypes HCtype_cool = Choices.Flow1D.HCtypes.Downstream
          "Location of the hydraulic capacitance";
        parameter SI.Pressure dpnom_cool=0
          "Nominal pressure drop (friction term only!)";
        parameter Density rhonom_cool=0 "Nominal inlet density";

        //other data
        constant Real pi=Modelica.Constants.pi;

        Water.Flow1D flowCooling(
          Nt=1,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          L=coolExchSurface^2/(coolVol*pi*4),
          A=(coolVol*4/coolExchSurface)^2/4*pi,
          omega=coolVol*4/coolExchSurface*pi,
          Dhyd=coolVol*4/coolExchSurface,
          wnom=coolNomFlowRate,
          N=N_cool,
          FFtype=FFtype_cool,
          dpnom=dpnom_cool,
          rhonom=rhonom_cool,
          HydraulicCapacitance=HCtype_cool)
                            annotation (Placement(transformation(
              origin={20,10},
              extent={{-12,-10},{12,10}},
              rotation=90)));
        Thermal.ConvHT convHT(
          gamma=gamma_cool,
          N=N_cool)
          annotation (Placement(transformation(
              origin={-22,10},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        CondenserShell condenserShell(
          redeclare package Medium = FluidMedium,
          V=condVol,
          Mm=metalVol*rhoMetal,
          Ac=condExchSurface,
          Af=coolExchSurface,
          cm=cm,
          hc=gamma_cond,
          Nc=N_cool,
          pstart=pstart_cond,
          Vlstart=Vlstart_cond,
          initOpt=if SSInit then Options.steadyState else Options.noInit)
          annotation (Placement(transformation(extent={{-66,-6},{-34,26}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput ratio_VvonVtot
          annotation (Placement(transformation(
              origin={-100,10},
              extent={{-10,-10},{10,10}},
              rotation=180)));
      equation
        connect(flowCooling.infl, coolingIn)
          annotation (Line(points={{20,-2},{20,-40},{100,-40}}, thickness=0.5,
            color={0,0,255}));
        connect(flowCooling.outfl, coolingOut)
          annotation (Line(points={{20,22},{20,60},{100,60}}, thickness=0.5,
            color={0,0,255}));
        connect(convHT.side2,flowCooling. wall) annotation (Line(points={{-18.9,
                10},{15,10}}, color={255,127,0}));
        connect(condenserShell.steam, steamIn)
          annotation (Line(points={{-50,26},{-50,100},{-10,100}}, thickness=0.5,
            color={0,0,255}));
        connect(condenserShell.condensate, waterOut)
          annotation (Line(points={{-50,-6},{-50,-100},{-10,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(condenserShell.coolingFluid,convHT. side1) annotation (Line(
              points={{-50,10},{-46,10},{-40,10},{-25,10}},
                                          color={255,127,0}));
        connect(condenserShell.ratio_VvVtot, ratio_VvonVtot) annotation (Line(
              points={{-61.2,10},{-100,10}}, color={0,0,127}));
        annotation (Diagram(graphics),
                             Icon(graphics));
      end Condenser;

      model CondenserPreP "Ideal condenser with prescribed pressure"
        replaceable package Medium = Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialMedium "Medium model";
        //Parameters
        parameter SI.Pressure p "Nominal inlet pressure";
        parameter SI.Volume Vtot = 10 "Total volume of the fluid side";
        parameter SI.Volume Vlstart = 0.15*Vtot
          "Start value of the liquid water volume";
        parameter Boolean allowFlowReversal = system.allowFlowReversal
          "= true to allow flow reversal, false restricts to design direction";
        outer ThermoPower.System system "System wide properties";

        //Variable
        SI.Density rhol "Density of saturated liquid";
        SI.Density rhov "Density of saturated steam";
        Medium.SaturationProperties sat "Saturation properties";
        Medium.SpecificEnthalpy hl "Specific enthalpy of saturated liquid";
        Medium.SpecificEnthalpy hv "Specific enthalpy of saturated vapour";
        SI.Mass M( stateSelect=StateSelect.never) "Total mass, steam+liquid";
        SI.Mass Ml( stateSelect=StateSelect.never) "Liquid mass";
        SI.Mass Mv( stateSelect=StateSelect.never) "Steam mass";
        SI.Volume Vl(start=Vlstart, stateSelect=StateSelect.prefer)
          "Liquid volume";
        SI.Volume Vv(stateSelect=StateSelect.never) "Steam volume";
        SI.Energy E(stateSelect=StateSelect.never) "Internal energy";
        SI.Power Q "Thermal power";

        //Connectors
        Water.FlangeA steamIn( redeclare package Medium = Medium, m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
                       annotation (Placement(transformation(extent={{-20,80},{
                  20,120}}, rotation=0)));
        Water.FlangeB waterOut( redeclare package Medium = Medium, m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (Placement(
              transformation(extent={{-20,-120},{20,-80}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput Qcond annotation (Placement(
              transformation(
              origin={-100,40},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica.Blocks.Interfaces.RealOutput ratio_Vv_Vtot
          annotation (Placement(transformation(
              origin={-100,-20},
              extent={{-10,-10},{10,10}},
              rotation=180)));

      equation
        steamIn.p = p;
        steamIn.h_outflow = hv;
        sat.psat = p;
        sat.Tsat = Medium.saturationTemperature(p);
        hl = Medium.bubbleEnthalpy(sat);
        hv = Medium.dewEnthalpy(sat);
        waterOut.p = p;
        waterOut.h_outflow = hl;
        rhol = Medium.bubbleDensity(sat);
        rhov = Medium.dewDensity(sat);

        Ml = Vl*rhol;
        Mv = Vv*rhov;
        Vtot= Vv+Vl;
        M = Ml + Mv;
        E = Ml*hl + Mv*hv - p*Vtot;

        //Energy and Mass Balances
        der(M) = steamIn.m_flow + waterOut.m_flow;
        der(E) = steamIn.m_flow*hv + waterOut.m_flow*hl - Q;

        //Output signal
        ratio_Vv_Vtot=Vv/Vtot;
        Qcond = Q;

        annotation (
          Icon(graphics={
              Rectangle(
                extent={{-90,100},{90,-60}},
                lineColor={0,0,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-80,-60},{80,-100}},
                lineColor={0,0,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(
                points={{60,-40},{-60,-40},{30,10},{-60,60},{60,60}},
                color={0,0,255},
                thickness=0.5)}),
          Diagram(graphics));
      end CondenserPreP;

      model CondenserPreP_tap
        "Ideal condenser with prescribed pressure and external tapping for ratio control"
        replaceable package Medium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialTwoPhaseMedium;
        parameter SI.Pressure p "Nominal inlet pressure";
        parameter SI.Volume Vtot = 10 "Total volume of the fluid side";
        parameter SI.Volume Vlstart = 0.15*Vtot;
        parameter Boolean allowFlowReversal = system.allowFlowReversal
          "= true to allow flow reversal, false restricts to design direction";
        outer ThermoPower.System system "System wide properties";

        //Variable
        SI.Density rhol "Density of saturated liquid";
        SI.Density rhov "Density of saturated steam";
        Medium.SaturationProperties sat "Saturation properties";
        Medium.SpecificEnthalpy hl "Specific enthalpy of saturated liquid";
        Medium.SpecificEnthalpy hv "Specific enthalpy of saturated vapour";
        SI.Mass M( stateSelect=StateSelect.never) "Total mass, steam+liquid";
        SI.Mass Ml( stateSelect=StateSelect.never) "Liquid mass";
        SI.Mass Mv( stateSelect=StateSelect.never) "Steam mass";
        SI.Volume Vl(start=Vlstart, stateSelect=StateSelect.prefer)
          "Liquid volume";
        SI.Volume Vv(stateSelect=StateSelect.never) "Steam volume";
        SI.Energy E(stateSelect=StateSelect.never) "Internal energy";
        SI.Power Q "Thermal power";

        Water.FlangeA steamIn( redeclare package Medium = Medium, m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
                       annotation (Placement(transformation(extent={{-20,80},{
                  20,120}}, rotation=0)));
        Water.FlangeB waterOut( redeclare package Medium = Medium, m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0)) annotation (Placement(
              transformation(extent={{-20,-120},{20,-80}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput Qcond annotation (Placement(
              transformation(
              origin={-100,40},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Modelica.Blocks.Interfaces.RealOutput ratio_Vv_Vtot
          annotation (Placement(transformation(
              origin={-100,-20},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Water.FlangeB tapWater(redeclare package Medium = Medium)
                       annotation (Placement(transformation(extent={{-90,-90},{
                  -70,-70}}, rotation=0)));

      equation
        steamIn.p = p;
        steamIn.h_outflow = hv;
        sat.psat = p;
        sat.Tsat = Medium.saturationTemperature(p);
        hl = Medium.bubbleEnthalpy(sat);
        hv = Medium.dewEnthalpy(sat);
        waterOut.p = p;
        waterOut.h_outflow = hl;
        rhol = Medium.bubbleDensity(sat);
        rhov = Medium.dewDensity(sat);

        hl = tapWater.h_outflow;
        tapWater.p = p;

        Ml = Vl*rhol;
        Mv = Vv*rhov;
        Vtot = Vv + Vl;
        M = Ml + Mv;
        E = Ml*hl + Mv*hv - p*Vtot;

        //Energy and Mass Balances
        der(M) = steamIn.m_flow + (waterOut.m_flow + tapWater.m_flow);
        der(E) = steamIn.m_flow*hv + (waterOut.m_flow + tapWater.m_flow)*hl - Q;

        //Output signal
        ratio_Vv_Vtot = Vv/Vtot;
        Qcond = Q;

        annotation (
          Icon(graphics={
              Rectangle(
                extent={{-90,100},{90,-60}},
                lineColor={0,0,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-80,-60},{80,-100}},
                lineColor={0,0,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Line(
                points={{60,-40},{-60,-40},{30,10},{-60,60},{60,60}},
                color={0,0,255},
                thickness=0.5)}),
          Diagram(graphics));
      end CondenserPreP_tap;

      model CondenserShell
        replaceable package Medium =
            Modelica.Media.Interfaces.PartialTwoPhaseMedium "Medium model";
        parameter SI.Volume V "Total volume of condensation cavity";
        parameter SI.Mass Mm "Total mass of shell and tubes";
        parameter SI.Area Ac "Area of condensation surfaces";
        parameter SI.Area Af "Area of contact with the cooling fluid";
        parameter SI.CoefficientOfHeatTransfer hc
          "Coefficient of heat transfer on condensation surfaces";
        parameter SI.SpecificHeatCapacity cm
          "Specific heat capacity of the metal";
        parameter Integer Nc = 2 "Number of nodes for coolingFluid connector";
        parameter SI.Pressure pstart "Pressure start value"
          annotation(Dialog(tab = "Initialisation"));
        parameter SI.Volume Vlstart "Start value of the liquid water volume"
          annotation(Dialog(tab = "Initialisation"));
        parameter ThermoPower.Choices.Init.Options initOpt=ThermoPower.Choices.Init.Options.noInit
          "Initialisation option" annotation(Dialog(tab = "Initialisation"));
        parameter Boolean allowFlowReversal = system.allowFlowReversal
          "= true to allow flow reversal, false restricts to design direction";
        outer ThermoPower.System system "System wide properties";

        SI.Mass Ml "Liquid water mass";
        SI.Mass Mv "Steam mass";
        SI.Mass M "Total liquid+steam mass";
        SI.Energy E "Total liquid+steam energy";
        SI.Energy Em "Total energy of metal masses";
        SI.Volume Vl(start=Vlstart, stateSelect = StateSelect.prefer)
          "Liquid water total volume";
        SI.Volume Vv "Steam volume";
        Medium.SaturationProperties sat "Saturation properties";
        Medium.AbsolutePressure p(start=pstart,stateSelect=StateSelect.prefer)
          "Drum pressure";
        Medium.MassFlowRate ws "Steam mass flowrate";
        Medium.MassFlowRate wc "Condensate mass flowrate";
        SI.HeatFlowRate Qcool "Heat flow from the metal to the cooling fluid";
        SI.HeatFlowRate Qcond
          "Heat flow from the condensing fluid to the metal";
        Medium.SpecificEnthalpy hs "Specific enthalpy of entering steam";
        Medium.SpecificEnthalpy hl "Specific enthalpy of saturated liquid";
        Medium.SpecificEnthalpy hv "Specific enthalpy of saturated steam";
        Medium.Temperature Ts "Saturation temperature";
        Medium.Temperature Tm(start = Medium.saturationTemperature(pstart), stateSelect = StateSelect.prefer)
          "Average temperature of metal walls";
        Medium.Density rhol "Density of saturated liquid";
        Medium.Density rhov "Density of saturated steam";

        Water.FlangeA steam(redeclare package Medium = Medium, m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
                                        annotation (Placement(transformation(
                extent={{-20,80},{20,120}}, rotation=0)));
        Water.FlangeB condensate(redeclare package Medium = Medium, m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0))
                                             annotation (Placement(
              transformation(extent={{-20,-120},{20,-80}}, rotation=0)));
        ThermoPower.Thermal.DHT coolingFluid(N=Nc) annotation (Placement(
              transformation(extent={{-6,-40},{6,40}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput ratio_VvVtot
          annotation (Placement(transformation(
              origin={-70,0},
              extent={{-20,-20},{20,20}},
              rotation=180)));
      equation
        Ml = Vl*rhol "Mass of liquid";
        Mv = Vv*rhov "Mass of vapour";
        M = Ml+Mv "Total mass";
        V = Vl + Vv "Total volume";
        E = Ml*hl+Mv*hv-p*V "Total liquid+steam energy";
        Em = Mm*cm*Tm "Metal tubes energy";
        der(M) = ws - wc "Mass balance";
        der(E) = ws*hs - wc*hl - Qcond "Energy balance (liquid+steam)";
        der(Em) = Qcond - Qcool "Energy balance (metal tubes)";
        Qcond = hc*Ac*(Ts - Tm);

        // Boundary conditions
        p = steam.p;
        p = condensate.p;
        ws = steam.m_flow;
        hs = inStream(steam.h_outflow) "Flow reversal not supported";
        steam.h_outflow = hv;
        wc = -condensate.m_flow;
        condensate.h_outflow = hl;
        Qcool = -Af/(Nc-1)*sum(coolingFluid.phi[1:Nc-1]+coolingFluid.phi[2:Nc])/2;
        coolingFluid.T = ones(Nc)*Tm;

        // Fluid properties
        // sat = Medium.setSat_p(p);

        sat.psat = p;
        sat.Tsat = Medium.saturationTemperature(p);

        Ts = sat.Tsat;
        rhol = Medium.bubbleDensity(sat);
        rhov = Medium.dewDensity(sat);
        hl = Medium.bubbleEnthalpy(sat);
        hv = Medium.dewEnthalpy(sat);
        ratio_VvVtot = Vv/V;
      initial equation
        if initOpt == ThermoPower.Choices.Init.Options.noInit then
          // do nothing
        elseif initOpt == ThermoPower.Choices.Init.Options.steadyState then
          der(M) = 0;
          der(E) = 0;
        else
          assert(false, "Unsupported initialisation option");
        end if;
        annotation (Diagram(graphics),
                             Icon(graphics={
              Rectangle(
                extent={{-54,88},{-14,-86}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-14,88},{-6,-86}},
                lineColor={135,135,135},
                fillColor={135,135,135},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{6,88},{14,-86}},
                lineColor={135,135,135},
                fillColor={135,135,135},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{14,88},{54,-86}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-54,88},{54,-86}},
                lineColor={135,135,135},
                lineThickness=1),
              Text(
                extent={{-102,-130},{108,-148}},
                lineColor={0,0,255},
                textString=
                     "%name")}));
      end CondenserShell;

      model SteamTurbineVarEta "Steam turbine with variable efficiency"
        extends ThermoPower.Water.SteamTurbineBase;

        //Parameter
        parameter SI.Area Kt "Kt coefficient of Stodola's law";
        replaceable function curveEta_iso = Functions.curveEfficiency
          "Characteristich curve of efficiency";
        parameter Real eta_iso_nom=0.92 "Nominal isentropic efficiency";
        parameter Real x=0.5 "Degree of reaction";
        parameter Length Rm "Mean ray";
        parameter Integer n "Number of stages";

        //Variable
        Real y "Ratio uf/wiso";
        Real uf "Mean peripheral velocity of the rotor";
        Real viso "Mean velocity of the fluid in isentropic conditions";

      equation
        w = Kt*partialArc*sqrt(Medium.pressure(steamState_in)*Medium.density(steamState_in))*ThermoPower.Functions.sqrtReg(1-(1/PR)^2)
          "Stodola's law";

        uf = omega*Rm;
        viso = sqrt(2*(hin-hiso)/n);
        y = uf/viso;
        eta_iso = curveEta_iso(eta_iso_nom, y, x) "Variable efficiency";
      end SteamTurbineVarEta;

      model SteamTurbine_1tapping "Turbine with one tapping"

        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance;

        //Turbines parameters
        parameter SI.MassFlowRate wn "Inlet nominal flowrate";
        parameter SI.Area Kt "Coefficient of Stodola's law";
        parameter SI.Pressure pnom_in "Nominal inlet pressure";
        parameter SI.Pressure pnom_tap "Nominal tapping pressure";
        parameter SI.Pressure pnom_out "Nominal outlet pressure";

        //Start Value
        parameter SI.MassFlowRate wstart=wn "Mass flow rate start value"
            annotation (Dialog(tab= "Initialization"));

        Modelica.Blocks.Interfaces.RealInput partialArc
          annotation (Placement(transformation(extent={{-68,-48},{-48,-28}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_a
          annotation (Placement(transformation(extent={{-76,-10},{-56,10}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_b shaft_b
          annotation (Placement(transformation(extent={{56,-10},{76,10}},
                rotation=0)));
        Water.FlangeB tap1(redeclare package Medium = FluidMedium)
                                         annotation (Placement(transformation(
                extent={{-6,-88},{12,-70}}, rotation=0)));
        Water.SteamTurbineStodola ST_firstStages(
          redeclare package Medium = FluidMedium,
          wstart=wstart,
          wnom=wn,
          Kt=Kt,
          PRstart=pnom_in/pnom_out,
          pnom=pnom_in)
                    annotation (Placement(transformation(extent={{-44,-18},{-8,
                  18}}, rotation=0)));
        Water.SteamTurbineStodola ST_secondStages(
          redeclare package Medium = FluidMedium,
          wstart=wstart,
          wnom=wn,
          Kt=Kt,
          PRstart=pnom_tap/pnom_out,
          pnom=pnom_tap)
                    annotation (Placement(transformation(extent={{18,-18},{56,
                  18}}, rotation=0)));
        Water.FlangeA flangeA(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-90,62},{-56,96}},
                rotation=0)));
        Water.FlangeB flangeB(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{62,62},{96,96}},
                rotation=0)));

      equation
        connect(shaft_b, ST_secondStages.shaft_b) annotation (Line(
            points={{66,0},{49.16,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_secondStages.shaft_a, ST_firstStages.shaft_b) annotation (Line(
            points={{24.46,0},{-14.48,0}},
            color={0,0,0},
            thickness=0.5));
        connect(flangeA, ST_firstStages.inlet)
          annotation (Line(points={{-73,79},{-40.4,79},{-40.4,14.4}},
            color={0,0,255},
            thickness=0.5));
        connect(flangeB, ST_secondStages.outlet)
          annotation (Line(points={{79,79},{52.2,79},{52.2,14.4}},
            color={0,0,255},
            thickness=0.5));
        connect(partialArc, ST_firstStages.partialArc) annotation (Line(points={{-58,-38},
                {-36,-38},{-36,-26},{-52,-26},{-52,-7.2},{-35,-7.2}},
              color={0,0,127}));
        connect(ST_firstStages.shaft_a, shaft_a) annotation (Line(
            points={{-37.88,0},{-66,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_firstStages.outlet, ST_secondStages.inlet) annotation (Line(
            points={{-11.6,14.4},{-3.25,14.4},{-3.25,14.4},{5.1,14.4},{5.1,14.4},
                {21.8,14.4}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_firstStages.outlet, tap1) annotation (Line(
            points={{-11.6,14.4},{3,14.4},{3,-79}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics),
                             Icon(graphics={
              Polygon(
                points={{-26,76},{-26,28},{-20,28},{-20,82},{-58,82},{-58,76},{
                    -26,76}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{28,56},{34,56},{34,76},{62,76},{62,82},{28,82},{28,56}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-58,8},{62,-8}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={160,160,164}),
              Polygon(
                points={{-26,28},{-26,-26},{34,-60},{34,60},{-26,28}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid),
              Text(extent={{-126,136},{132,96}}, textString=
                                                         "%name"),
              Polygon(points={{2,-78},{4,-78},{4,-42},{2,-42},{2,-78}},
                  lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor={0,0,255})}));
      end SteamTurbine_1tapping;

      model PrescribedSpeed "Constant speed, not dependent on torque"
        extends Modelica.Mechanics.Rotational.Interfaces.PartialTorque;
        Modelica.SIunits.AngularVelocity w
          "Angular velocity of flange with respect to support (= der(phi))";
        Modelica.Blocks.Interfaces.RealInput w_fixed
                                         annotation (Placement(transformation(
                extent={{-116,44},{-84,76}}, rotation=0)));
      equation
        w = der(phi);
        w = w_fixed;
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}), graphics),
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Line(points={{0,-100},{0,100}}, color={0,
                    0,255}), Text(
                extent={{-116,-16},{128,-40}},
                lineColor={0,0,0},
                textString="%w_fixed")}),
          Documentation(info="<HTML>
<p>
Model of <b>fixed</b> angular verlocity of flange, not dependent on torque.
</p>
</HTML>"));
      end PrescribedSpeed;

      model EffectHE "Effect of ideal HE"
        extends Icons.Water.PressDrop;
        parameter SI.SpecificEnthalpy dh "Increase of specific enthalpy";
        parameter SI.Pressure dp "Drop pressure";

        Water.FlangeA in1 annotation (Placement(transformation(extent={{-140,
                  -40},{-62,40}}, rotation=0)));
        Water.FlangeB out1 annotation (Placement(transformation(extent={{60,-40},
                  {140,40}}, rotation=0)));
      equation
        out1.p = in1.p - dp;
        in1.m_flow + out1.m_flow = 0;
        in1.h_outflow + dh= inStream(out1.h_outflow);
        inStream(in1.h_outflow) = out1.h_outflow - dh;
        annotation (Icon(graphics={Text(extent={{-100,-56},{100,-84}},
                  textString=                         "%name")}), Diagram(graphics));
      end EffectHE;

      model Comp_bubble_h
        "Computation Specific enthalpy of saturated liquid, imposted pressure"
        replaceable package FluidMedium = ThermoPower.Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialTwoPhaseMedium;
        parameter SI.Pressure p "Pressure value";
        FluidMedium.SaturationProperties sat "Saturation properties";
        SI.SpecificEnthalpy hl "Specific enthalpy of saturated liquid";

        Modelica.Blocks.Interfaces.RealOutput h
          annotation (Placement(transformation(extent={{80,-10},{100,10}},
                rotation=0)));
      equation
        sat.psat = p;
        sat.Tsat = FluidMedium.saturationTemperature(p);
        hl = FluidMedium.bubbleEnthalpy(sat);

        //Output signal
        h = hl;
        annotation (Icon(graphics={Rectangle(
                extent={{-80,40},{80,-40}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-60,20},{60,-20}},
                lineColor={0,0,255},
                textString=
                     "Computation")}));
      end Comp_bubble_h;

      model BaseReader_water
        "Base reader for the visualization of the state in the simulation (water)"
        replaceable package Medium = Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialPureSubstance "Medium model";
        parameter Boolean allowFlowReversal = system.allowFlowReversal
          "= true to allow flow reversal, false restricts to design direction";
        outer ThermoPower.System system "System wide properties";
        Water.FlangeA inlet(redeclare package Medium = Medium, m_flow(min=if allowFlowReversal then -Modelica.Constants.inf else 0))
                                        annotation (Placement(transformation(
                extent={{-80,-20},{-40,20}}, rotation=0)));
        Water.FlangeB outlet(redeclare package Medium = Medium, m_flow(max=if allowFlowReversal then +Modelica.Constants.inf else 0))
                                         annotation (Placement(transformation(
                extent={{40,-20},{80,20}}, rotation=0)));
      equation
        inlet.m_flow + outlet.m_flow = 0 "Mass balance";
        inlet.p = outlet.p "No pressure drop";

        // Boundary conditions
        inlet.h_outflow = inStream(outlet.h_outflow);
        inStream(inlet.h_outflow) = outlet.h_outflow;
        annotation (
          Diagram(graphics),
          Icon(graphics={Polygon(
                points={{-80,0},{0,32},{80,0},{0,-32},{-80,0}},
                lineColor={0,0,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-80,20},{80,-20}},
                lineColor={255,255,255},
                fillColor={0,0,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "S")}),
          Documentation(info="<HTML>
<p>This component can be inserted in a hydraulic circuit to measure the temperature of the fluid flowing through it.
<p>Flow reversal is supported.
</HTML>",   revisions="<html>
<ul>
<li><i>16 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Standard medium definition added.</li>
<li><i>1 Jul 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
      end BaseReader_water;

      model StateReader_water
        "State reader for the visualization of the state in the simulation (water)"
        extends BaseReader_water;
        SI.Temperature T "Temperature";
        SI.Pressure p "Pressure";
        SI.SpecificEnthalpy h "Specific enthalpy";
        SI.MassFlowRate w "Mass flow rate";
        Medium.ThermodynamicState fluidState "Thermodynamic state of the fluid";
      equation
        // Set fluid state
        p = inlet.p;
        h = homotopy(if not allowFlowReversal then inStream(inlet.h_outflow) else actualStream(inlet.h_outflow),
                     inStream(inlet.h_outflow));
        fluidState = Medium.setState_ph(p,h);
        T = Medium.temperature(fluidState);
        w = inlet.m_flow;
      end StateReader_water;
    end Components;

    package Examples "Example implementations"

      model ST3L_base "Steam turbine with three pressure levels"
        extends ThermoPower.PowerPlants.SteamTurbineGroup.Interfaces.ST_3L;

        //Mixers Parameters
        parameter SI.Volume mixLP_V "Internal volume of the LP mixer";
        parameter SI.Pressure mixLP_pstart = steamLPNomPressure
          "Pressure start value of the LP mixer"
              annotation (Dialog(tab = "Initialization",
                                 group = "LP mixer"));

        Water.SteamTurbineStodola ST_HP(
          redeclare package Medium = FluidMedium,
          wnom=steamHPNomFlowRate,
          eta_mech=HPT_eta_mech,
          eta_iso_nom=HPT_eta_iso_nom,
          Kt=HPT_Kt,
          wstart=HPT_wstart,
          PRstart=steamHPNomPressure/steamIPNomPressure,
          pnom=steamHPNomPressure)      annotation (Placement(transformation(
                extent={{-152,-20},{-112,20}}, rotation=0)));
        Water.SteamTurbineStodola ST_IP(
          redeclare package Medium = FluidMedium,
          eta_mech=IPT_eta_mech,
          eta_iso_nom=IPT_eta_iso_nom,
          Kt=IPT_Kt,
          wstart=IPT_wstart,
          wnom=steamIPNomFlowRate + steamHPNomFlowRate,
          PRstart=steamIPNomPressure/steamLPNomPressure,
          pnom=steamIPNomPressure)      annotation (Placement(transformation(
                extent={{-20,-20},{20,20}}, rotation=0)));
        Water.SteamTurbineStodola ST_LP(
          redeclare package Medium = FluidMedium,
          eta_mech=LPT_eta_mech,
          eta_iso_nom=LPT_eta_iso_nom,
          Kt=LPT_Kt,
          wstart=LPT_wstart,
          wnom=steamLPNomFlowRate + steamIPNomFlowRate + steamHPNomFlowRate,
          PRstart=steamLPNomPressure/pcond,
          pnom=steamLPNomPressure)      annotation (Placement(transformation(
                extent={{100,-20},{140,20}}, rotation=0)));
        Water.Mixer mixLP(
          redeclare package Medium = FluidMedium,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          V=mixLP_V,
          pstart=mixLP_pstart,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                          annotation (Placement(transformation(
              origin={74,90},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      protected
        replaceable Components.BaseReader_water stateHPT_in(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={-160,70},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        replaceable Components.BaseReader_water stateHPT_out(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={-100,70},
              extent={{10,-10},{-10,10}},
              rotation=270)));
        replaceable Components.BaseReader_water stateIPT_in(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={-40,70},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        replaceable Components.BaseReader_water stateIPT_out(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={40,70},
              extent={{10,-10},{-10,10}},
              rotation=270)));
        replaceable Components.BaseReader_water stateLPT_in(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={74,50},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        replaceable Components.BaseReader_water stateLPT_out(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={160,-30},
              extent={{10,-10},{-10,10}},
              rotation=90)));
      equation
        connect(ST_HP.shaft_a, Shaft_a) annotation (Line(
            points={{-145.2,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(Shaft_b,ST_LP. shaft_b) annotation (Line(
            points={{200,0},{132.8,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_LP.shaft_a,ST_IP. shaft_b) annotation (Line(
            points={{106.8,0},{12.8,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_IP.shaft_a,ST_HP. shaft_b) annotation (Line(
            points={{-13.2,0},{-119.2,0}},
            color={0,0,0},
            thickness=0.5));
        connect(mixLP.in1, LPT_In)
          annotation (Line(points={{80,98},{80,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ST_HP.inlet, stateHPT_in.outlet) annotation (Line(points={{-148,16},{-160,
                16},{-160,64}},           thickness=0.5,
            color={0,0,255}));
        connect(stateHPT_in.inlet, HPT_In)
          annotation (Line(points={{-160,76},{-160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ST_HP.outlet, stateHPT_out.inlet) annotation (Line(points={{-116,16},{
                -100,16},{-100,64}},           thickness=0.5,
            color={0,0,255}));
        connect(ST_IP.inlet, stateIPT_in.outlet)
          annotation (Line(points={{-16,16},{-40,16},{-40,64}}, thickness=0.5,
            color={0,0,255}));
        connect(stateIPT_in.inlet, IPT_In)
          annotation (Line(points={{-40,76},{-40,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ST_IP.outlet, stateIPT_out.inlet)
          annotation (Line(points={{16,16},{40,16},{40,64}}, thickness=0.5,
            color={0,0,255}));
        connect(stateIPT_out.outlet, mixLP.in2) annotation (Line(points={{40,76},
                {40,120},{68,120},{68,98}},   thickness=0.5,
            color={0,0,255}));
        connect(stateLPT_in.inlet, mixLP.out)
          annotation (Line(points={{74,56},{74,80}}, thickness=0.5,
            color={0,0,255}));
        connect(stateLPT_in.outlet, ST_LP.inlet)
          annotation (Line(points={{74,44},{74,16},{104,16}}, thickness=0.5,
            color={0,0,255}));
        connect(ST_LP.outlet, stateLPT_out.inlet)
          annotation (Line(points={{136,16},{160,16},{160,-24}}, thickness=0.5,
            color={0,0,255}));
        connect(LPT_Out, stateLPT_out.outlet) annotation (Line(points={{140,
                -200},{140,-50},{160,-50},{160,-36}}, thickness=0.5,
            color={0,0,255}));
        connect(stateHPT_out.outlet, HPT_Out)
          annotation (Line(points={{-100,76},{-100,200}}, thickness=0.5,
            color={0,0,255}));
        annotation (Diagram(graphics));
      end ST3L_base;

      model ST3L_valve "Steam turbine with three pressure levels, inlet valves"
        extends ThermoPower.PowerPlants.SteamTurbineGroup.Interfaces.ST_3L;

        //Mixers Parameters
        parameter SI.Volume mixLP_V "Internal volume of the LP mixer";

        //Valves Parameters
        parameter Real valveHP_Cv=0 "Cv (US) flow coefficient of the HP valve" annotation(Dialog(group= "HP valve"));
        parameter SI.Pressure valveHP_dpnom
          "Nominal pressure drop of the HP valve"                                   annotation(Dialog(group= "HP valve"));
        parameter Real valveIP_Cv=0 "Cv (US) flow coefficient of the IP valve" annotation(Dialog(group= "IP valve"));
        parameter SI.Pressure valveIP_dpnom
          "Nominal pressure drop of the IP valve"                                   annotation(Dialog(group= "IP valve"));
        parameter Real valveLP_Cv=0 "Cv (US) flow coefficient of the LP valve" annotation(Dialog(group= "LP valve"));
        parameter SI.Pressure valveLP_dpnom
          "Nominal pressure drop of the LP valve"                                   annotation(Dialog(group= "LP valve"));

        Water.SteamTurbineStodola ST_HP(
          redeclare package Medium = FluidMedium,
          wnom=steamHPNomFlowRate,
          eta_mech=HPT_eta_mech,
          eta_iso_nom=HPT_eta_iso_nom,
          Kt=HPT_Kt,
          pnom=steamHPNomPressure,
          PRstart=steamHPNomPressure/steamIPNomPressure)
                                        annotation (Placement(transformation(
                extent={{-120,-20},{-80,20}}, rotation=0)));
        Water.SteamTurbineStodola ST_IP(
          redeclare package Medium = FluidMedium,
          eta_mech=IPT_eta_mech,
          eta_iso_nom=IPT_eta_iso_nom,
          Kt=IPT_Kt,
          wnom=steamIPNomFlowRate + steamHPNomFlowRate,
          pnom=steamIPNomPressure,
          PRstart=steamIPNomPressure/steamLPNomPressure)
                                        annotation (Placement(transformation(
                extent={{2,-20},{42,20}}, rotation=0)));
        Water.SteamTurbineStodola ST_LP(
          redeclare package Medium = FluidMedium,
          eta_mech=LPT_eta_mech,
          eta_iso_nom=LPT_eta_iso_nom,
          Kt=LPT_Kt,
          wnom=steamLPNomFlowRate + steamIPNomFlowRate + steamHPNomFlowRate,
          pnom=steamLPNomPressure,
          PRstart=steamLPNomPressure/pcond)
                                        annotation (Placement(transformation(
                extent={{122,-20},{162,20}}, rotation=0)));
        Water.Mixer mixLP(
          redeclare package Medium = FluidMedium,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          V=mixLP_V,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
          pstart=steamLPNomPressure)
                          annotation (Placement(transformation(
              origin={76,90},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.ValveVap valveHP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          Cv=valveHP_Cv,
          pnom=steamHPNomPressure,
          wnom=steamHPNomFlowRate,
          dpnom=valveHP_dpnom,
          redeclare package Medium = FluidMedium)
                               annotation (Placement(transformation(
              origin={-138,16},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Water.ValveVap valveIP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          Cv=valveIP_Cv,
          pnom=steamIPNomPressure,
          dpnom=valveIP_dpnom,
          redeclare package Medium = FluidMedium,
          wnom=steamIPNomFlowRate + steamHPNomFlowRate)
                               annotation (Placement(transformation(
              origin={-18,16},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Water.ValveVap valveLP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamLPNomPressure,
          dpnom=valveLP_dpnom,
          redeclare package Medium = FluidMedium,
          wnom=steamLPNomFlowRate + steamIPNomFlowRate + steamHPNomFlowRate,
          Cv=valveLP_Cv)       annotation (Placement(transformation(
              origin={102,16},
              extent={{10,10},{-10,-10}},
              rotation=180)));
      equation
        connect(valveIP.outlet,ST_IP. inlet) annotation (Line(points={{-8,16},{
                -1,16},{6,16}},         thickness=0.5,
            color={0,0,255}));
        connect(ActuatorsBus.Opening_valveHP,valveHP. theta) annotation (Line(
              points={{200,-140},{-178,-140},{-178,40},{-138,40},{-138,24}},
              color={213,255,170}));
        connect(ActuatorsBus.Opening_valveIP,valveIP. theta) annotation (Line(
              points={{200,-140},{-58,-140},{-58,40},{-18,40},{-18,24}}, color={
                213,255,170}));
        connect(ActuatorsBus.Opening_valveLP,valveLP. theta) annotation (Line(
              points={{200,-140},{62,-140},{62,40},{102,40},{102,24}}, color={213,
                255,170}));
        connect(ST_HP.inlet,valveHP. outlet) annotation (Line(points={{-116,16},
                {-128,16},{-128,16}},          thickness=0.5,
            color={0,0,255}));
        connect(ST_HP.shaft_a, Shaft_a) annotation (Line(
            points={{-113.2,0},{-165.6,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_LP.inlet,valveLP. outlet) annotation (Line(points={{126,16},
                {119,16},{119,16},{112,16}},thickness=0.5,
            color={0,0,255}));
        connect(Shaft_b,ST_LP. shaft_b) annotation (Line(
            points={{200,0},{168.4,0},{154.8,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_LP.shaft_a,ST_IP. shaft_b) annotation (Line(
            points={{128.8,0},{34.8,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_IP.shaft_a,ST_HP. shaft_b) annotation (Line(
            points={{8.8,0},{-87.2,0}},
            color={0,0,0},
            thickness=0.5));
        connect(mixLP.in1, LPT_In)
          annotation (Line(points={{82,98},{82,139},{82,200},{80,200}},
                                                      thickness=0.5,
            color={0,0,255}));
        connect(valveHP.inlet, HPT_In)
          annotation (Line(points={{-148,16},{-160,16},{-160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ST_HP.outlet, HPT_Out) annotation (Line(points={{-84,16},{-70,16},{-70,
                120},{-100,120},{-100,200}},      thickness=0.5,
            color={0,0,255}));
        connect(valveIP.inlet, IPT_In)
          annotation (Line(points={{-28,16},{-40,16},{-40,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ST_IP.outlet,mixLP. in2) annotation (Line(points={{38,16},{50,16},{50,
                120},{70,120},{70,98}},       thickness=0.5,
            color={0,0,255}));
        connect(valveLP.inlet,mixLP. out)
          annotation (Line(points={{92,16},{76,16},{76,80}}, thickness=0.5,
            color={0,0,255}));
        connect(LPT_Out,ST_LP. outlet) annotation (Line(points={{140,-200},{140,-40},{
                182,-40},{182,16},{158,16}},       thickness=0.5,
            color={0,0,255}));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},
                  {200,200}}),
                            graphics),
                             Icon(graphics));
      end ST3L_valve;

      model ST3L_bypass
        "Steam turbine with three pressure levels, inlet and by-pass valves "
        extends ThermoPower.PowerPlants.SteamTurbineGroup.Interfaces.ST_3L;

        //Mixers Parameters
        parameter SI.Volume mixLP_V "Internal volume of the LP mixer";
        parameter SI.Pressure mixLP_pstart = steamLPNomPressure
          "Pressure start value of the LP mixer"
              annotation (Dialog(tab = "Initialization",
                                 group = "LP mixer"));

        //Valves Parameters
        parameter Real valveHP_Cv=0 "Cv (US) flow coefficient of the HP valve" annotation(Dialog(group= "HP valves"));
        parameter Modelica.SIunits.Pressure valveHP_dpnom
          "Nominal pressure drop of the HP valve"                                   annotation(Dialog(group= "HP valves"));
        parameter Real bypassHP_Cv=0
          "Cv (US) flow coefficient of the HP valve of bypass"                                 annotation(Dialog(group= "HP valves"));
        parameter Real valveIP_Cv=0 "Cv (US) flow coefficient of the IP valve" annotation(Dialog(group= "IP valves"));
        parameter Modelica.SIunits.Pressure valveIP_dpnom
          "Nominal pressure drop of the IP valve"                                   annotation(Dialog(group= "IP valves"));
        parameter Real bypassIP_Cv=0
          "Cv (US) flow coefficient of the IP valve of bypass" annotation(Dialog(group= "IP valves"));
        parameter Real valveDrumIP_Cv=0
          "Cv (US) flow coefficient of the valve of pressurization IP drum"
                                                                          annotation(Dialog(group= "IP valves"));
        parameter Real valveLP_Cv=0 "Cv (US) flow coefficient of the LP valve" annotation(Dialog(group= "LP valves"));
        parameter Modelica.SIunits.Pressure valveLP_dpnom
          "Nominal pressure drop of the LP valve"                                   annotation(Dialog(group= "LP valves"));
        parameter Real bypassLP_Cv=0
          "Cv (US) flow coefficient of the HP valve of bypass" annotation(Dialog(group= "LP valves"));
        parameter Real valveDrumLP_Cv=0
          "Cv (US) flow coefficient of the valve of pressurization LP drum"
                                                                          annotation(Dialog(group= "LP valves"));

        Water.Mixer mixLP(
          redeclare package Medium = FluidMedium,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit,
          V=mixLP_V,
          pstart=mixLP_pstart,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                          annotation (Placement(transformation(
              origin={74,90},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.ValveVap valveHP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          Cv=valveHP_Cv,
          pnom=steamHPNomPressure,
          wnom=steamHPNomFlowRate,
          dpnom=valveHP_dpnom,
          redeclare package Medium = FluidMedium)
                               annotation (Placement(transformation(
              origin={-140,16},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Water.ValveVap valveIP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          Cv=valveIP_Cv,
          pnom=steamIPNomPressure,
          dpnom=valveIP_dpnom,
          redeclare package Medium = FluidMedium,
          wnom=steamIPNomFlowRate + steamHPNomFlowRate)
                               annotation (Placement(transformation(
              origin={-20,16},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Water.ValveVap valveLP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamLPNomPressure,
          dpnom=valveLP_dpnom,
          redeclare package Medium = FluidMedium,
          wnom=steamLPNomFlowRate + steamIPNomFlowRate + steamHPNomFlowRate,
          Cv=valveLP_Cv)       annotation (Placement(transformation(
              origin={100,16},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Water.ValveVap byPassHP(
          redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamHPNomPressure,
          wnom=steamHPNomFlowRate,
          dpnom=steamHPNomPressure - steamIPNomPressure,
          Cv=bypassHP_Cv)       annotation (Placement(transformation(
              origin={-120,40},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Water.ValveVap byPassIP(
          redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamIPNomPressure,
          dpnom=steamIPNomPressure - steamLPNomPressure,
          wnom=steamIPNomFlowRate + steamHPNomFlowRate,
          Cv=bypassIP_Cv)       annotation (Placement(transformation(
              origin={0,40},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Water.ValveVap byPassLP(
          redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamLPNomPressure,
          wnom=steamLPNomFlowRate + steamIPNomFlowRate + steamHPNomFlowRate,
          Cv=bypassLP_Cv,
          dpnom=steamLPNomPressure - pcond)
                                 annotation (Placement(transformation(
              origin={120,40},
              extent={{10,10},{-10,-10}},
              rotation=180)));
        Water.SensP p_ST_LP(            redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{90,74},{110,94}},
                rotation=0)));
      protected
        replaceable Components.BaseReader_water stateHPT_in(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={-160,90},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        replaceable Components.BaseReader_water stateHPT_out(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={-100,90},
              extent={{10,-10},{-10,10}},
              rotation=270)));
        replaceable Components.BaseReader_water stateIPT_in(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={-40,90},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        replaceable Components.BaseReader_water stateIPT_out(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={44,90},
              extent={{10,-10},{-10,10}},
              rotation=270)));
        replaceable Components.BaseReader_water stateLPT_in(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={74,62},
              extent={{10,-10},{-10,10}},
              rotation=90)));
        replaceable Components.BaseReader_water stateLPT_out(redeclare package
            Medium = FluidMedium) constrainedby Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(
              origin={176,-20},
              extent={{10,-10},{-10,10}},
              rotation=90)));
      public
        Water.SteamTurbineStodola ST_HP(
          redeclare package Medium = FluidMedium,
          wnom=steamHPNomFlowRate,
          eta_mech=HPT_eta_mech,
          eta_iso_nom=HPT_eta_iso_nom,
          Kt=HPT_Kt,
          wstart=HPT_wstart,
          PRstart=steamHPNomPressure/steamIPNomPressure,
          pnom=steamHPNomPressure)      annotation (Placement(transformation(
                extent={{-120,-20},{-80,20}},  rotation=0)));
        Water.SteamTurbineStodola ST_IP(
          redeclare package Medium = FluidMedium,
          eta_mech=IPT_eta_mech,
          eta_iso_nom=IPT_eta_iso_nom,
          Kt=IPT_Kt,
          wstart=IPT_wstart,
          wnom=steamIPNomFlowRate + steamHPNomFlowRate,
          PRstart=steamIPNomPressure/steamLPNomPressure,
          pnom=steamIPNomPressure)      annotation (Placement(transformation(
                extent={{8,-20},{48,20}},   rotation=0)));
        Water.SteamTurbineStodola ST_LP(
          redeclare package Medium = FluidMedium,
          eta_mech=LPT_eta_mech,
          eta_iso_nom=LPT_eta_iso_nom,
          Kt=LPT_Kt,
          wstart=LPT_wstart,
          wnom=steamLPNomFlowRate + steamIPNomFlowRate + steamHPNomFlowRate,
          PRstart=steamLPNomPressure/pcond,
          pnom=steamLPNomPressure)      annotation (Placement(transformation(
                extent={{120,-20},{160,20}}, rotation=0)));
      equation
        connect(ActuatorsBus.Opening_valveHP,valveHP. theta) annotation (Line(
              points={{200,-140},{-180,-140},{-180,30},{-140,30},{-140,24}},
              color={213,255,170}));
        connect(ActuatorsBus.Opening_valveIP,valveIP. theta) annotation (Line(
              points={{200,-140},{-60,-140},{-60,34},{-20,34},{-20,24}}, color=
                {213,255,170}));
        connect(ActuatorsBus.Opening_valveLP,valveLP. theta) annotation (Line(
              points={{200,-140},{60,-140},{60,32},{100,32},{100,24}}, color={
                213,255,170}));
        connect(ActuatorsBus.Opening_byPassHP,byPassHP. theta) annotation (Line(
              points={{200,-140},{-180,-140},{-180,30},{-140,30},{-140,60},{
                -120,60},{-120,48}}, color={213,255,170}));
        connect(ActuatorsBus.Opening_byPassIP,byPassIP. theta) annotation (Line(
              points={{200,-140},{-60,-140},{-60,34},{-20,34},{-20,60},{
                9.79717e-016,60},{9.79717e-016,48}}, color={213,255,170}));
        connect(ActuatorsBus.Opening_byPassLP,byPassLP. theta) annotation (Line(
              points={{200,-140},{60,-140},{60,32},{100,32},{100,60},{120,60},{
                120,48}}, color={213,255,170}));
        connect(SensorsBus.p_STLP_in,p_ST_LP. p) annotation (Line(points={{200,-80},
                {-60,-80},{-60,160},{134,160},{134,90},{108,90}},
                                                   color={255,170,213}));
        connect(p_ST_LP.flange,mixLP. out) annotation (Line(
            points={{100,80},{74,80}},
            color={0,0,255},
            thickness=0.5));
        connect(stateHPT_in.inlet, HPT_In)
          annotation (Line(points={{-160,96},{-160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(stateIPT_in.inlet, IPT_In)
          annotation (Line(points={{-40,96},{-40,200}}, thickness=0.5,
            color={0,0,255}));
        connect(stateIPT_out.outlet, mixLP.in2) annotation (Line(points={{44,96},
                {44,140},{68,140},{68,98}},   thickness=0.5,
            color={0,0,255}));
        connect(stateLPT_in.inlet, mixLP.out)
          annotation (Line(points={{74,68},{74,80}}, thickness=0.5));
        connect(LPT_Out, stateLPT_out.outlet) annotation (Line(points={{140,
                -200},{140,-40},{176,-40},{176,-26}}, thickness=0.5,
            color={0,0,255}));
        connect(stateHPT_out.outlet, HPT_Out)
          annotation (Line(points={{-100,96},{-100,200}}, thickness=0.5,
            color={0,0,255}));
        connect(mixLP.in1, LPT_In)
          annotation (Line(points={{80,98},{80,200}},          thickness=0.5,
            color={0,0,255}));
        connect(stateLPT_out.inlet, byPassLP.outlet) annotation (Line(
            points={{176,-14},{176,40},{130,40}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(valveLP.inlet, stateLPT_in.outlet) annotation (Line(
            points={{90,16},{74,16},{74,56}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassLP.inlet, stateLPT_in.outlet) annotation (Line(
            points={{110,40},{74,40},{74,56}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassIP.outlet, stateIPT_out.inlet) annotation (Line(
            points={{10,40},{44,40},{44,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassIP.inlet, stateIPT_in.outlet) annotation (Line(
            points={{-10,40},{-40,40},{-40,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(valveIP.inlet, stateIPT_in.outlet) annotation (Line(
            points={{-30,16},{-40,16},{-40,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassHP.outlet, stateHPT_out.inlet) annotation (Line(
            points={{-110,40},{-100,40},{-100,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassHP.inlet, stateHPT_in.outlet) annotation (Line(
            points={{-130,40},{-160,40},{-160,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(valveHP.inlet, stateHPT_in.outlet) annotation (Line(
            points={{-150,16},{-160,16},{-160,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_IP.shaft_a,ST_HP. shaft_b) annotation (Line(
            points={{14.8,0},{14.8,0},{-87.2,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_HP.shaft_a, Shaft_a) annotation (Line(
            points={{-113.2,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_LP.shaft_a,ST_IP. shaft_b) annotation (Line(
            points={{126.8,0},{126.8,0},{40.8,0}},
            color={0,0,0},
            thickness=0.5));
        connect(Shaft_b,ST_LP. shaft_b) annotation (Line(
            points={{200,0},{200,0},{152.8,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_HP.inlet, valveHP.outlet) annotation (Line(
            points={{-116,16},{-123,16},{-123,16},{-130,16}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_HP.outlet, stateHPT_out.inlet) annotation (Line(
            points={{-84,16},{-84,40},{-100,40},{-100,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_IP.outlet, stateIPT_out.inlet) annotation (Line(
            points={{44,16},{44,84}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_IP.inlet, valveIP.outlet) annotation (Line(
            points={{12,16},{1,16},{1,16},{-10,16}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(valveLP.outlet, ST_LP.inlet) annotation (Line(
            points={{110,16},{117,16},{117,16},{124,16}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_LP.outlet, stateLPT_out.inlet) annotation (Line(
            points={{156,16},{176,16},{176,-14}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,
                  -200},{200,200}}),
                            graphics),
                             Icon(graphics));
      end ST3L_bypass;

      model ST_2LHU
        "Steam Turbine Group (two pressure levels) with coupling Heat Usage"
        extends Interfaces.ST_2LHU;

        //Mixers Parameters
        parameter SI.Volume mixLP_V "Internal volume of the LP mixer";
        parameter SI.Pressure mixLP_pstart
          "Pressure start value of the LP mixer"
              annotation (Dialog(tab = "Initialization",
                                 group = "LP mixer"));

        //Valves Parameters
        parameter Real valveHP_Cv=0 "Cv (US) flow coefficient of the HP valve" annotation(Dialog(group= "HP valves"));
        parameter SI.Pressure valveHP_dpnom
          "Nominal pressure drop of the HP valve"                                   annotation(Dialog(group= "HP valves"));
        parameter Real bypassHP_Cv=0
          "Cv (US) flow coefficient of the HP valve of bypass"                                 annotation(Dialog(group= "HP valves"));
        parameter Real valveLP_Cv=0 "Cv (US) flow coefficient of the LP valve" annotation(Dialog(group= "LP valves"));
        parameter SI.Pressure valveLP_dpnom
          "Nominal pressure drop of the LP valve"                                   annotation(Dialog(group= "LP valves"));
        parameter Real bypassLP_Cv=0
          "Cv (US) flow coefficient of the HP valve of bypass" annotation(Dialog(group= "LP valves"));
        parameter Real valveHU_Cv=0
          "Cv (US) flow coefficient of the valve for HU"                           annotation(Dialog(group= "Heat Usage valve"));
        parameter SI.Pressure valveHU_dpnom
          "Nominal pressure drop of the valve for HU"                                   annotation(Dialog(group= "Heat Usage valve"));

        Water.SteamTurbineStodola ST_HP(
          redeclare package Medium = FluidMedium,
          wnom=steamHPNomFlowRate,
          eta_mech=HPT_eta_mech,
          eta_iso_nom=HPT_eta_iso_nom,
          Kt=HPT_Kt,
          wstart=HPT_wstart,
          PRstart=steamHPNomPressure/steamLPNomPressure,
          pnom=steamHPNomPressure)      annotation (Placement(transformation(
                extent={{-84,-20},{-44,20}}, rotation=0)));
        Water.SteamTurbineStodola ST_LP(
          redeclare package Medium = FluidMedium,
          eta_mech=LPT_eta_mech,
          eta_iso_nom=LPT_eta_iso_nom,
          Kt=LPT_Kt,
          wstart=LPT_wstart,
          wnom=steamHPNomFlowRate,
          PRstart=steamLPNomPressure/pcond,
          pnom=steamLPNomPressure)      annotation (Placement(transformation(
                extent={{94,-20},{134,20}}, rotation=0)));
        Water.Mixer mixLP(
          redeclare package Medium = FluidMedium,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          V=mixLP_V,
          pstart=mixLP_pstart,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                          annotation (Placement(transformation(
              origin={-40,-110},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Water.ValveVap valveHU(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          CheckValve=true,
          redeclare package Medium = FluidMedium,
          Cv=valveHU_Cv,
          dpnom=valveHU_dpnom,
          pnom=steamLPNomPressure,
          wnom=steamHPNomFlowRate)
                               annotation (Placement(transformation(
              origin={-19,-25},
              extent={{9,-9},{-9,9}},
              rotation=90)));
        Water.ValveVap valveLP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamLPNomPressure,
          CheckValve=true,
          dpnom=valveLP_dpnom,
          redeclare package Medium = FluidMedium,
          Cv=valveLP_Cv,
          wnom=steamHPNomFlowRate)
                               annotation (Placement(transformation(extent={{60,
                  6},{80,26}}, rotation=0)));
        Water.ValveVap valveHP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          Cv=valveHP_Cv,
          pnom=steamHPNomPressure,
          wnom=steamHPNomFlowRate,
          CheckValve=true,
          dpnom=valveHP_dpnom,
          redeclare package Medium = FluidMedium)
                               annotation (Placement(transformation(extent={{-114,6},{
                  -94,26}},          rotation=0)));
        Water.ValveVap byPassHP(redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamHPNomPressure,
          wnom=steamHPNomFlowRate,
          CheckValve=true,
          Cv=bypassHP_Cv,
          dpnom=steamHPNomPressure - steamLPNomPressure)
                                annotation (Placement(transformation(extent={{
                  -100,40},{-80,60}}, rotation=0)));
        Water.ValveVap byPassLP(redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamLPNomPressure,
          CheckValve=true,
          Cv=bypassLP_Cv,
          dpnom=steamLPNomPressure - pcond,
          wnom=steamHPNomFlowRate)
                                 annotation (Placement(transformation(extent={{
                  80,40},{100,60}}, rotation=0)));
      equation
        connect(ST_HP.shaft_a, Shaft_a) annotation (Line(
            points={{-77.2,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_LP.shaft_b, Shaft_b) annotation (Line(
            points={{126.8,0},{200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_LP.shaft_a, ST_HP.shaft_b) annotation (Line(
            points={{100.8,0},{-51.2,0}},
            color={0,0,0},
            thickness=0.5));
        connect(valveHP.outlet, ST_HP.inlet)
          annotation (Line(points={{-94,16},{-80,16}}, thickness=0.5,
            color={0,0,255}));
        connect(mixLP.out, SteamForHU)
          annotation (Line(points={{-50,-110},{-60,-110},{-60,-200}}, thickness=0.5,
            color={0,0,255}));
        connect(LPT_In, mixLP.in1) annotation (Line(points={{0,200},{0,-116},{
                -32,-116}}, thickness=0.5,
            color={0,0,255}));
        connect(valveLP.outlet, ST_LP.inlet)
          annotation (Line(points={{80,16},{98,16}}, thickness=0.5));
        connect(mixLP.in2, valveHU.outlet) annotation (Line(points={{-32,-104},{-19,-104},
                {-19,-34}},            thickness=0.5,
            color={0,0,255}));
        connect(ActuatorsBus.Opening_valveHP, valveHP.theta) annotation (Line(
              points={{200,-140},{-140,-140},{-140,32},{-104,32},{-104,24}},
              color={213,255,170}));
        connect(ActuatorsBus.Opening_valveLP, valveLP.theta) annotation (Line(
              points={{200,-140},{50,-140},{50,32},{70,32},{70,24}}, color={213,
                255,170}));
        connect(ActuatorsBus.Opening_byPassHP, byPassHP.theta) annotation (Line(
              points={{200,-140},{20,-140},{20,70},{-90,70},{-90,58}}, color={
                213,255,170}));
        connect(ActuatorsBus.Opening_byPassLP, byPassLP.theta) annotation (Line(
              points={{200,-140},{50,-140},{50,70},{90,70},{90,58}}, color={213,
                255,170}));
        connect(ActuatorsBus.Opening_valveHU, valveHU.theta) annotation (Line(
              points={{200,-140},{50,-140},{50,-60},{-40,-60},{-40,-25},{-26.2,-25}},
              color={213,255,170}));
        connect(ST_LP.outlet, LPT_Out) annotation (Line(
            points={{130,16},{160,16},{160,-160},{48,-160},{48,-200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));

        connect(byPassLP.outlet, LPT_Out) annotation (Line(
            points={{100,50},{160,50},{160,-160},{48,-160},{48,-200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassHP.inlet, HPT_In) annotation (Line(
            points={{-100,50},{-120,50},{-120,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(valveHP.inlet, HPT_In) annotation (Line(
            points={{-114,16},{-120,16},{-120,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_HP.outlet, valveLP.inlet) annotation (Line(
            points={{-48,16},{60,16}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(valveHU.inlet, ST_HP.outlet) annotation (Line(
            points={{-19,-16},{-19,16},{-48,16}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_HP.outlet, byPassHP.outlet) annotation (Line(
            points={{-48,16},{-34,16},{-34,50},{-80,50}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassLP.inlet, ST_HP.outlet) annotation (Line(
            points={{80,50},{40,50},{40,16},{-48,16}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},
                  {200,200}}),
                            graphics));
      end ST_2LHU;

      model ST_2LRhHU
        "Steam Turbine Group (two pressure levels and reheat) with coupling Heat Usage"
        extends Interfaces.ST_2LRhHU;

        //Mixers Parameters
        parameter SI.Volume mixLP_V "Internal volume of the LP mixer";
        parameter SI.Pressure mixLP_pstart
          "Pressure start value of the LP mixer"
              annotation (Dialog(tab = "Initialization",
                                 group = "LP mixer"));

        //Valves Parameters
        parameter Real valveHP_Cv=0 "Cv (US) flow coefficient of the HP valve" annotation(Dialog(group= "HP valves"));
        parameter SI.Pressure valveHP_dpnom
          "Nominal pressure drop of the HP valve"                                   annotation(Dialog(group= "HP valves"));
        parameter Real bypassHP_Cv=0
          "Cv (US) flow coefficient of the HP valve of bypass"                                 annotation(Dialog(group= "HP valves"));
        parameter Real valveLP_Cv=0 "Cv (US) flow coefficient of the LP valve" annotation(Dialog(group= "LP valves"));
        parameter SI.Pressure valveLP_dpnom
          "Nominal pressure drop of the LP valve"                                   annotation(Dialog(group= "LP valves"));
        parameter Real bypassLP_Cv=0
          "Cv (US) flow coefficient of the HP valve of bypass" annotation(Dialog(group= "LP valves"));

        Water.SteamTurbineStodola ST_HP(
          redeclare package Medium = FluidMedium,
          wnom=steamHPNomFlowRate,
          eta_mech=HPT_eta_mech,
          eta_iso_nom=HPT_eta_iso_nom,
          Kt=HPT_Kt,
          wstart=HPT_wstart,
          PRstart=steamHPNomPressure/steamLPNomPressure,
          pnom=steamHPNomPressure)      annotation (Placement(transformation(
                extent={{-116,-20},{-76,20}}, rotation=0)));
        Water.SteamTurbineStodola ST_LP(
          redeclare package Medium = FluidMedium,
          eta_mech=LPT_eta_mech,
          eta_iso_nom=LPT_eta_iso_nom,
          Kt=LPT_Kt,
          wstart=LPT_wstart,
          wnom=steamHPNomFlowRate,
          PRstart=steamLPNomPressure/pcond,
          pnom=steamLPNomPressure)      annotation (Placement(transformation(
                extent={{54,-20},{94,20}}, rotation=0)));
        Water.Mixer mixLP(
          redeclare package Medium = FluidMedium,
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          V=mixLP_V,
          pstart=mixLP_pstart,
          FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam)
                          annotation (Placement(transformation(
              origin={-60,56},
              extent={{-10,-10},{10,10}},
              rotation=0)));
        Water.ValveVap valveLP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamLPNomPressure,
          CheckValve=true,
          dpnom=valveLP_dpnom,
          redeclare package Medium = FluidMedium,
          Cv=valveLP_Cv,
          wnom=steamHPNomFlowRate)
                               annotation (Placement(transformation(extent={{20,
                  6},{40,26}}, rotation=0)));
        Water.ValveVap valveHP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          Cv=valveHP_Cv,
          pnom=steamHPNomPressure,
          wnom=steamHPNomFlowRate,
          CheckValve=true,
          dpnom=valveHP_dpnom,
          redeclare package Medium = FluidMedium)
                               annotation (Placement(transformation(extent={{-150,6},{
                  -130,26}},          rotation=0)));
        Water.ValveVap byPassHP(redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamHPNomPressure,
          wnom=steamHPNomFlowRate,
          CheckValve=true,
          Cv=bypassHP_Cv,
          dpnom=steamHPNomPressure - steamLPNomPressure)
                                annotation (Placement(transformation(extent={{
                  -140,40},{-120,60}}, rotation=0)));
        Water.ValveVap byPassLP(redeclare package Medium = FluidMedium,
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          pnom=steamLPNomPressure,
          CheckValve=true,
          Cv=bypassLP_Cv,
          dpnom=steamLPNomPressure - pcond,
          wnom=steamHPNomFlowRate)
                                 annotation (Placement(transformation(extent={{
                  40,40},{60,60}}, rotation=0)));
      equation
        connect(ST_HP.shaft_a, Shaft_a) annotation (Line(
            points={{-109.2,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_LP.shaft_b, Shaft_b) annotation (Line(
            points={{86.8,0},{144,0},{200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ST_LP.shaft_a,ST_HP. shaft_b) annotation (Line(
            points={{60.8,0},{-12,0},{-83.2,0}},
            color={0,0,0},
            thickness=0.5));
        connect(valveHP.outlet,ST_HP. inlet)
          annotation (Line(points={{-130,16},{-112,16}}, thickness=0.5,
            color={0,0,255}));
        connect(valveLP.outlet,ST_LP. inlet)
          annotation (Line(points={{40,16},{50,16},{58,16}},
                                                     thickness=0.5));
        connect(ActuatorsBus.Opening_valveHP,valveHP. theta) annotation (Line(
              points={{200,-140},{-180,-140},{-180,32},{-140,32},{-140,24}},
              color={213,255,170}));
        connect(ActuatorsBus.Opening_valveLP,valveLP. theta) annotation (Line(
              points={{200,-140},{10,-140},{10,32},{30,32},{30,24}}, color={213,
                255,170}));
        connect(ActuatorsBus.Opening_byPassHP,byPassHP. theta) annotation (Line(
              points={{200,-140},{-20,-140},{-20,70},{-130,70},{-130,58}},
              color={213,255,170}));
        connect(ActuatorsBus.Opening_byPassLP,byPassLP. theta) annotation (Line(
              points={{200,-140},{10,-140},{10,70},{50,70},{50,58}}, color={213,
                255,170}));
        connect(valveHP.inlet, HPT_In) annotation (Line(
            points={{-150,16},{-160,16},{-160,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassHP.inlet, HPT_In) annotation (Line(
            points={{-140,50},{-160,50},{-160,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_LP.outlet, LPT_Out) annotation (Line(
            points={{90,16},{120,16},{120,-120},{80,-120},{80,-200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassLP.outlet, LPT_Out) annotation (Line(
            points={{60,50},{120,50},{120,-120},{80,-120},{80,-200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassHP.outlet, mixLP.in2) annotation (Line(
            points={{-120,50},{-68,50}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ST_HP.outlet, mixLP.in2) annotation (Line(
            points={{-80,16},{-80,50},{-68,50}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(LPT_In, mixLP.in1) annotation (Line(
            points={{80,200},{80,80},{-80,80},{-80,62},{-68,62}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(mixLP.out, SteamForHU) annotation (Line(
            points={{-50,56},{-40,56},{-40,-200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(HPT_Out, SteamForHU) annotation (Line(
            points={{-100,200},{-100,110},{-40,110},{-40,-200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(valveLP.inlet, LPT_In_Rh) annotation (Line(
            points={{20,16},{0,16},{0,138},{-40,138},{-40,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(byPassLP.inlet, LPT_In_Rh) annotation (Line(
            points={{40,50},{0,50},{0,138},{-40,138},{-40,200}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,
                  -200},{200,200}}),
                            graphics));
      end ST_2LRhHU;

      model CondPlant "Condensation Plant"
        extends Interfaces.CondPlant;
        replaceable Components.Condenser condenser(
          redeclare package FluidMedium = FluidMedium,
          N_cool=N_cool,
          condNomFlowRate=condNomFlowRate,
          coolNomFlowRate=coolNomFlowRate,
          condNomPressure=condNomPressure,
          coolNomPressure=coolNomPressure,
          condExchSurface=condExchSurface,
          coolExchSurface=coolExchSurface,
          condVol=condVol,
          coolVol=coolVol,
          metalVol=metalVol,
          cm=cm,
          rhoMetal=rhoMetal,
          SSInit=SSInit,
          pstart_cond=pstart_cond)               constrainedby
          Interfaces.Condenser(
          redeclare package FluidMedium = FluidMedium,
          N_cool=N_cool,
          condNomFlowRate=condNomFlowRate,
          coolNomFlowRate=coolNomFlowRate,
          condNomPressure=condNomPressure,
          coolNomPressure=coolNomPressure,
          condExchSurface=condExchSurface,
          coolExchSurface=coolExchSurface,
          condVol=condVol,
          coolVol=coolVol,
          metalVol=metalVol,
          cm=cm,
          rhoMetal=rhoMetal,
          SSInit=SSInit,
          pstart_cond=pstart_cond)     annotation (Placement(transformation(
                extent={{-18,-22},{22,18}}, rotation=0)));
        Water.SourceW coolingIn(redeclare package Medium = FluidMedium,
          p0=coolNomPressure,
          w0=coolNomFlowRate,
          h=h_cool_in)        annotation (Placement(transformation(extent={{90,-20},{70,
                  0}},           rotation=0)));
        Water.SinkP coolingOut(redeclare package Medium = FluidMedium,
          p0=coolNomPressure)
                          annotation (Placement(transformation(extent={{70,0},{90,20}},
                            rotation=0)));
        replaceable Components.BaseReader_water stateCoolingOut(redeclare
            package Medium = FluidMedium) constrainedby
          Components.BaseReader_water(
            redeclare package Medium = FluidMedium)
                           annotation (Placement(transformation(extent={{36,0},{56,20}},
                            rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput ratio_VvonVtot
          annotation (Placement(transformation(
              origin={-106,0},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        parameter SI.SpecificEnthalpy h_cool_in=1e5 "Nominal specific enthalpy";
      equation
        connect(condenser.steamIn, SteamIn)
          annotation (Line(points={{0,18},{0,100}}, thickness=0.5,
            color={0,0,255}));
        connect(condenser.waterOut, WaterOut)
          annotation (Line(points={{0,-22},{0,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(stateCoolingOut.outlet, coolingOut.flange) annotation (Line(
              points={{52,10},{64,10},{70,10}},
                                        thickness=0.5,
            color={0,0,255}));
        connect(stateCoolingOut.inlet, condenser.coolingOut) annotation (Line(
              points={{40,10},{34,10},{22,10}},         thickness=0.5,
            color={0,0,255}));
        connect(condenser.ratio_VvonVtot, ratio_VvonVtot) annotation (Line(
              points={{-18,0},{-106,0}}, color={0,0,127}));
        connect(coolingIn.flange, condenser.coolingIn) annotation (Line(
            points={{70,-10},{22,-10}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end CondPlant;

      model CondPlant_open
        "Condensation plant with condenser ratio control (type ImpPressureCondenser_tap)"
        extends Interfaces.CondPlant_base;
        parameter Real setPoint_ratio
          "SetPoint ratio Steam Volume / Total Volume";

        ThermoPower.PowerPlants.SteamTurbineGroup.Components.Comp_bubble_h
          BubbleEnthalpy(redeclare package FluidMedium = FluidMedium, p=p)
                                annotation (Placement(transformation(extent={{68,-54},
                  {38,-34}},          rotation=0)));

        Water.SinkP sinkP(p0=p) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,30})));
        Water.SourceP sourceP(p0=p) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-40})));
      equation

        connect(sinkP.flange, SteamIn) annotation (Line(
            points={{1.83697e-015,40},{0,40},{0,100}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(WaterOut, sourceP.flange) annotation (Line(
            points={{0,-100},{0,-50},{-1.83697e-015,-50}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(BubbleEnthalpy.h, sourceP.in_h) annotation (Line(
            points={{39.5,-44},{9,-44}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end CondPlant_open;

      model CondPlant_cc
        "Condensation plant with condenser ratio control (type ImpPressureCondenser_tap)"
        extends Interfaces.CondPlant_base;
        parameter Real setPoint_ratio
          "SetPoint ratio Steam Volume / Total Volume";

        Control.PID pID(
          PVmax=1,
          PVmin=0.1,
          CSmin=-0.6,
          CSmax=0.6,
          Ti=2000,
          Kp=-3,
          steadyStateInit=SSInit)
                      annotation (Placement(transformation(extent={{-40,34},{
                  -60,54}}, rotation=0)));
        Modelica.Blocks.Sources.Constant setPoint(k=setPoint_ratio)
                    annotation (Placement(transformation(extent={{-6,42},{-18,
                  54}}, rotation=0)));
        Components.CondenserPreP_tap condenserIdeal_tap( redeclare package
            Medium = FluidMedium,
          p=p,
          Vtot=Vtot,
          Vlstart=Vlstart)                  annotation (Placement(
              transformation(extent={{16,-26},{76,34}}, rotation=0)));
        Water.SourceW sourceTap(
          redeclare package Medium = FluidMedium,
          p0=p,
          allowFlowReversal=true)
                      annotation (Placement(transformation(extent={{-80,-30},{
                  -60,-10}}, rotation=0)));
        ThermoPower.PowerPlants.SteamTurbineGroup.Components.Comp_bubble_h
          BubbleEnthalpy(redeclare package FluidMedium = FluidMedium, p=p)
                                annotation (Placement(transformation(extent={{
                  -30,-10},{-60,10}}, rotation=0)));
        parameter Boolean SSInit=false "Initialize in steady state";
      equation

        connect(setPoint.y, pID.SP)
                                 annotation (Line(points={{-18.6,48},{-40,48}},
              color={0,0,127}));
        connect(pID.CS,sourceTap. in_w0) annotation (Line(points={{-60,44},{-74,44},{-74,
                -14}},              color={0,0,127}));
        connect(pID.PV,condenserIdeal_tap. ratio_Vv_Vtot) annotation (Line(
              points={{-40,40},{-28,40},{-28,-2},{16,-2}}, color={0,0,127}));
        connect(condenserIdeal_tap.steamIn, SteamIn)
          annotation (Line(points={{46,34},{46,64},{0,64},{0,100}}, thickness=0.5,
            color={0,0,255}));
        connect(condenserIdeal_tap.waterOut, WaterOut) annotation (Line(points=
                {{46,-26},{46,-52},{0,-52},{0,-100}}, thickness=0.5,
            color={0,0,255}));
        connect(BubbleEnthalpy.h, sourceTap.in_h)                  annotation (Line(
              points={{-58.5,0},{-66,0},{-66,-14}}, color={0,0,127}));
        connect(SensorsBus.Cond_ratio, condenserIdeal_tap.ratio_Vv_Vtot)
          annotation (Line(points={{98,-40},{-8,-40},{-8,-2},{16,-2}}, color={
                255,170,213}));
        connect(SensorsBus.Cond_Q, condenserIdeal_tap.Qcond) annotation (Line(
              points={{98,-40},{-8,-40},{-8,16},{16,16}}, color={255,170,213}));
        connect(sourceTap.flange, condenserIdeal_tap.tapWater) annotation (Line(
            points={{-60,-20},{22,-20}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end CondPlant_cc;

      model CondPlantHU_cc
        "Condensation plant with condenser ratio control (type ImpPressureCondenser_tap) and coupling Heat Usage"
        extends Interfaces.CondPlantHU_base;
        parameter SI.Volume mixCondenser_V "Internal volume of the mixer";
        parameter SI.SpecificEnthalpy mixCondenser_hstart=1e5
          "Enthalpy start value";
        parameter SI.Pressure mixCondenser_pstart=1e5 "Pressure start value";

        CondPlant_cc condPlant_cc(
          p=p,
          Vtot=Vtot,
          Vlstart=Vlstart,
          setPoint_ratio=0.8,
          SSInit=SSInit)          annotation (Placement(transformation(extent={
                  {20,0},{80,60}}, rotation=0)));
        Water.Mixer mixCondenser(
          initOpt=if SSInit then Options.steadyState else Options.noInit,
          redeclare package Medium = FluidMedium,
          V=mixCondenser_V,
          pstart=mixCondenser_pstart)
                          annotation (Placement(transformation(
              origin={0,-50},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      equation
        connect(condPlant_cc.SteamIn, SteamIn)
          annotation (Line(points={{50,60},{50,100}}, thickness=0.5,
            color={0,0,255}));
        connect(WaterOut, mixCondenser.out) annotation (Line(points={{0,-100},{
                0,-60},{-1.83697e-015,-60}}, thickness=0.5,
            color={0,0,255}));
        connect(mixCondenser.in1, condPlant_cc.WaterOut)
          annotation (Line(points={{6,-42},{6,-20},{50,-20},{50,0}}, thickness=0.5,
            color={0,0,255}));
        connect(SensorsBus, condPlant_cc.SensorsBus) annotation (Line(points={{
                98,-40},{80,-40},{80,-20},{96,-20},{96,18},{79.4,18}}, color={
                255,170,213}));
        connect(ActuatorsBus, condPlant_cc.ActuatorsBus) annotation (Line(
              points={{98,-72},{72,-72},{72,-12},{88,-12},{88,8.4},{79.4,8.4}},
              color={213,255,170}));
        connect(mixCondenser.in2, CondensatedFromHU) annotation (Line(points={{-6,-42},
                {-6,-20},{-50,-20},{-50,100}},           thickness=0.5,
            color={0,0,255}));
        annotation (Diagram(graphics));
      end CondPlantHU_cc;

      model STG_3LRh "Steam turbine group (three pressure levels, reheat)"
        extends Interfaces.STGroup3LRh;
        ST3L_base steamTurbines(
          redeclare package FluidMedium = FluidMedium,
          steamHPNomFlowRate=67.6,
          HPT_eta_iso_nom=0.833,
          IPT_eta_iso_nom=0.903,
          LPT_eta_iso_nom=0.876,
          HPT_Kt=0.0032078,
          IPT_Kt=0.018883,
          LPT_Kt=0.078004,
          mixLP_V=5,
          steamIPNomFlowRate=81.3524 - 67.6,
          steamLPNomFlowRate=89.438 - 81.3524,
          steamHPNomPressure=12800000,
          steamIPNomPressure=2680000,
          steamLPNomPressure=600000,
          SSInit=SSInit,
          pcond=5398.2)
                       annotation (Placement(transformation(extent={{-80,-50},{
                  20,50}}, rotation=0)));
        HRSG.Components.PrescribedSpeedPump totalFeedPump(
          redeclare package WaterMedium = FluidMedium,
          rho0=1000,
          q_nom={0.0898,0,0.1},
          head_nom={72.74,130,0},
          nominalFlow=89.8,
          n0=1500,
          nominalOutletPressure=600000,
          nominalInletPressure=5398.2)
                                  annotation (Placement(transformation(
              origin={76,-164},
              extent={{16,16},{-16,-16}},
              rotation=180)));

        CondPlant_open controlledCondeser(
          redeclare package FluidMedium = FluidMedium,
          Vlstart=1.5,
          SSInit=SSInit,
          p=5398.2,
          Vtot=1,
          setPoint_ratio=1)    annotation (Placement(transformation(extent={{-24,
                  -140},{36,-80}},     rotation=0)));
      equation
        connect(steamTurbines.Shaft_b, Shaft_b) annotation (Line(
            points={{20,0},{200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(steamTurbines.Shaft_a, Shaft_a) annotation (Line(
            points={{-80,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(steamTurbines.IPT_In, From_RH_IP) annotation (Line(points={{-40,
                50},{-40,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_Out, To_RH_IP) annotation (Line(points={{-55,
                50},{-55,140},{-100,140},{-100,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.LPT_In, From_SH_LP) annotation (Line(points={{-10,
                50},{-10,100},{80,100},{80,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_In, From_SH_HP) annotation (Line(points={{-70,
                50},{-70,100},{-160,100},{-160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ActuatorsBus, steamTurbines.ActuatorsBus) annotation (Line(
              points={{200,-140},{60,-140},{60,-35},{20,-35}}, color={213,255,
                170}));
        connect(SensorsBus, steamTurbines.SensorsBus) annotation (Line(points={
                {200,-80},{76,-80},{76,-20},{20,-20}}, color={255,170,213}));
        connect(totalFeedPump.outlet, WaterOut) annotation (Line(points={{92,
                -164},{160,-164},{160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ActuatorsBus.nPump_feedLP, totalFeedPump.pumpSpeed_rpm)
          annotation (Line(points={{200,-140},{40,-140},{40,-154.4},{64.48,-154.4}},
                          color={213,255,170}));
        connect(controlledCondeser.SteamIn, steamTurbines.LPT_Out) annotation (
            Line(
            points={{6,-80},{6,-50},{5,-50}},
            color={0,0,255},
            smooth=Smooth.None,
            thickness=0.5));
        connect(controlledCondeser.WaterOut, totalFeedPump.inlet) annotation (
            Line(
            points={{6,-140},{6,-164},{60,-164}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end STG_3LRh;

      model STG_3LRh_valve
        "Steam turbine group (three pressure levels, reheat) with inlet valves"
        extends Interfaces.STGroup3LRh;
        ST3L_valve steamTurbines(
          redeclare package FluidMedium = FluidMedium,
          steamHPNomFlowRate=67.6,
          steamIPNomFlowRate=81.10 - 67.5,
          steamLPNomFlowRate=89.82 - 81.10,
          HPT_eta_iso_nom=0.833,
          IPT_eta_iso_nom=0.903,
          LPT_eta_iso_nom=0.876,
          mixLP_V=20,
          valveHP_Cv=1165,
          valveIP_Cv=5625,
          valveLP_Cv=14733,
          HPT_Kt=0.0032078,
          IPT_Kt=0.018883,
          LPT_Kt=0.078004,
          steamHPNomPressure=12800000,
          steamIPNomPressure=2680000,
          steamLPNomPressure=600000,
          SSInit=SSInit,
          pcond=5398.2,
          valveHP_dpnom=160000,
          valveIP_dpnom=50000,
          valveLP_dpnom=29640)
                       annotation (Placement(transformation(extent={{-80,-50},{
                  20,50}}, rotation=0)));
        HRSG.Components.PrescribedSpeedPump totalFeedPump(
          redeclare package WaterMedium = FluidMedium,
          rho0=1000,
          q_nom={0.0898,0,0.1},
          head_nom={72.74,130,0},
          nominalFlow=89.8,
          n0=1500,
          nominalOutletPressure=600000,
          nominalInletPressure=5398.2)
                                  annotation (Placement(transformation(
              origin={98,-180},
              extent={{16,16},{-16,-16}},
              rotation=180)));
        CondPlant_open controlledCondeser(
          redeclare package FluidMedium = FluidMedium,
          Vlstart=1.5,
          SSInit=SSInit,
          p=5398.2,
          Vtot=1,
          setPoint_ratio=1)    annotation (Placement(transformation(extent={{-24,
                  -150},{36,-90}},     rotation=0)));
      equation
        connect(steamTurbines.Shaft_a, Shaft_a) annotation (Line(
            points={{-80,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(steamTurbines.Shaft_b, Shaft_b) annotation (Line(
            points={{20,0},{200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ActuatorsBus, steamTurbines.ActuatorsBus) annotation (Line(
              points={{200,-140},{60,-140},{60,-35},{20,-35}}, color={213,255,
                170}));
        connect(steamTurbines.IPT_In, From_RH_IP) annotation (Line(points={{-40,
                50},{-40,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.LPT_In, From_SH_LP) annotation (Line(points={{-10,
                50},{-10,100},{80,100},{80,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_Out, To_RH_IP) annotation (Line(points={{-55,
                50},{-55,140},{-100,140},{-100,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_In, From_SH_HP) annotation (Line(points={{-70,
                50},{-70,100},{-160,100},{-160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(SensorsBus, steamTurbines.SensorsBus) annotation (Line(points={
                {200,-80},{66,-80},{66,-20},{20,-20}}, color={255,170,213}));
        connect(totalFeedPump.outlet, WaterOut) annotation (Line(points={{114,
                -180},{160,-180},{160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(controlledCondeser.SteamIn, steamTurbines.LPT_Out) annotation (
            Line(
            points={{6,-90},{6,-50},{5,-50}},
            color={0,0,255},
            smooth=Smooth.None,
            thickness=0.5));
        connect(controlledCondeser.WaterOut, totalFeedPump.inlet) annotation (
            Line(
            points={{6,-150},{6,-180},{82,-180}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(ActuatorsBus.nPump_feedLP, totalFeedPump.pumpSpeed_rpm)
          annotation (Line(points={{200,-140},{60,-140},{60,-170.4},{86.48,
                -170.4}}, color={213,255,170}));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={
                  {-200,-200},{200,200}}),
                            graphics));
      end STG_3LRh_valve;

      model STG_3LRh_cc
        "Steam turbine group (three pressure levels, reheat) and controlled condenser"
        extends Interfaces.STGroup3LRh;
        ST3L_base steamTurbines(
          redeclare package FluidMedium = FluidMedium,
          steamHPNomFlowRate=67.6,
          HPT_eta_iso_nom=0.833,
          IPT_eta_iso_nom=0.903,
          LPT_eta_iso_nom=0.876,
          HPT_Kt=0.0032078,
          IPT_Kt=0.018883,
          LPT_Kt=0.078004,
          mixLP_V=5,
          steamIPNomFlowRate=81.3524 - 67.6,
          steamLPNomFlowRate=89.438 - 81.3524,
          steamHPNomPressure=12800000,
          steamIPNomPressure=2680000,
          steamLPNomPressure=600000,
          SSInit=SSInit,
          pcond=5398.2)
                       annotation (Placement(transformation(extent={{-80,-50},{
                  20,50}}, rotation=0)));
        ThermoPower.PowerPlants.SteamTurbineGroup.Examples.CondPlant_cc
          controlledCondeser(
          redeclare package FluidMedium = FluidMedium,
          Vtot=10,
          Vlstart=1.5,
          setPoint_ratio=0.85,
          p=5398.2,
          SSInit=SSInit)       annotation (Placement(transformation(extent={{
                  -26,-140},{34,-80}}, rotation=0)));
        HRSG.Components.PrescribedSpeedPump totalFeedPump(
          redeclare package WaterMedium = FluidMedium,
          rho0=1000,
          q_nom={0.0898,0,0.1},
          head_nom={72.74,130,0},
          nominalFlow=89.8,
          n0=1500,
          nominalOutletPressure=600000,
          nominalInletPressure=5398.2)
                                  annotation (Placement(transformation(
              origin={84,-180},
              extent={{16,16},{-16,-16}},
              rotation=180)));
      equation
        connect(steamTurbines.Shaft_b, Shaft_b) annotation (Line(
            points={{20,0},{200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(steamTurbines.Shaft_a, Shaft_a) annotation (Line(
            points={{-80,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(controlledCondeser.SteamIn, steamTurbines.LPT_Out) annotation (Line(
              points={{4,-80},{4,-50},{5,-50}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.IPT_In, From_RH_IP) annotation (Line(points={{-40,
                50},{-40,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_Out, To_RH_IP) annotation (Line(points={{-55,
                50},{-55,140},{-100,140},{-100,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_In, From_SH_HP) annotation (Line(points={{-70,
                50},{-70,100},{-160,100},{-160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.LPT_In, From_SH_LP) annotation (Line(points={{-10,
                50},{-10,100},{80,100},{80,200}}, thickness=0.5,
            color={0,0,255}));
        connect(SensorsBus, steamTurbines.SensorsBus) annotation (Line(points={
                {200,-80},{80,-80},{80,-20},{20,-20}}, color={255,170,213}));
        connect(SensorsBus, controlledCondeser.SensorsBus) annotation (Line(
              points={{200,-80},{80,-80},{80,-122},{33.4,-122}}, color={255,170,
                213}));
        connect(ActuatorsBus, steamTurbines.ActuatorsBus) annotation (Line(
              points={{200,-140},{100,-140},{100,-35},{20,-35}}, color={213,255,
                170}));
        connect(ActuatorsBus, controlledCondeser.ActuatorsBus) annotation (Line(
              points={{200,-140},{100,-140},{100,-131.6},{33.4,-131.6}}, color=
                {213,255,170}));
        connect(totalFeedPump.outlet, WaterOut) annotation (Line(points={{100,
                -180},{160,-180},{160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ActuatorsBus.nPump_feedLP,totalFeedPump. pumpSpeed_rpm)
          annotation (Line(points={{200,-140},{48,-140},{48,-170.4},{72.48,
                -170.4}}, color={213,255,170}));
        connect(controlledCondeser.WaterOut, totalFeedPump.inlet) annotation (
            Line(
            points={{4,-140},{4,-180},{68,-180}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={
                  {-200,-200},{200,200}}),
                            graphics));
      end STG_3LRh_cc;

      model STG_3LRh_valve_cc
        "Steam turbine group (three pressure levels, reheat) with inlet valves and controlled condenser"
        extends Interfaces.STGroup3LRh;
        ST3L_valve steamTurbines(
          redeclare package FluidMedium = FluidMedium,
          steamHPNomFlowRate=67.6,
          HPT_eta_iso_nom=0.833,
          IPT_eta_iso_nom=0.903,
          LPT_eta_iso_nom=0.876,
          HPT_Kt=0.0032078,
          IPT_Kt=0.018883,
          LPT_Kt=0.078004,
          mixLP_V=5,
          steamIPNomFlowRate=81.3524 - 67.6,
          steamLPNomFlowRate=89.438 - 81.3524,
          valveHP_Cv=1165,
          valveIP_Cv=5625,
          valveLP_Cv=14733,
          steamHPNomPressure=12800000,
          steamIPNomPressure=2680000,
          steamLPNomPressure=600000,
          SSInit=SSInit,
          pcond=5398.2,
          valveHP_dpnom=160000,
          valveIP_dpnom=50000,
          valveLP_dpnom=29640)
                       annotation (Placement(transformation(extent={{-80,-50},{
                  20,50}}, rotation=0)));
        ThermoPower.PowerPlants.SteamTurbineGroup.Examples.CondPlant_cc
          controlledCondeser(
          redeclare package FluidMedium = FluidMedium,
          Vtot=10,
          Vlstart=1.5,
          setPoint_ratio=0.85,
          p=5398.2,
          SSInit=SSInit)       annotation (Placement(transformation(extent={{
                  -24,-140},{36,-80}}, rotation=0)));
        HRSG.Components.PrescribedSpeedPump totalFeedPump(
          redeclare package WaterMedium = FluidMedium,
          rho0=1000,
          q_nom={0.0898,0,0.1},
          head_nom={72.74,130,0},
          nominalFlow=89.8,
          n0=1500,
          nominalOutletPressure=600000,
          nominalInletPressure=5398.2)
                                  annotation (Placement(transformation(
              origin={94,-182},
              extent={{16,16},{-16,-16}},
              rotation=180)));
      equation
        connect(steamTurbines.Shaft_b, Shaft_b) annotation (Line(
            points={{20,0},{200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(steamTurbines.Shaft_a, Shaft_a) annotation (Line(
            points={{-80,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ActuatorsBus, steamTurbines.ActuatorsBus) annotation (Line(
              points={{200,-140},{100,-140},{100,-35},{20,-35}}, color={213,255,
                170}));
        connect(controlledCondeser.SteamIn, steamTurbines.LPT_Out) annotation (Line(
              points={{6,-80},{6,-50},{5,-50}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.IPT_In, From_RH_IP) annotation (Line(points={{-40,
                50},{-40,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_Out, To_RH_IP) annotation (Line(points={{-55,
                50},{-55,140},{-100,140},{-100,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.LPT_In, From_SH_LP) annotation (Line(points={{-10,
                50},{-10,100},{80,100},{80,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_In, From_SH_HP) annotation (Line(points={{-70,
                50},{-70,100},{-160,100},{-160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(SensorsBus, steamTurbines.SensorsBus) annotation (Line(points={
                {200,-80},{80,-80},{80,-20},{20,-20}}, color={255,170,213}));
        connect(SensorsBus, controlledCondeser.SensorsBus) annotation (Line(
              points={{200,-80},{80,-80},{80,-122},{35.4,-122}}, color={255,170,
                213}));
        connect(ActuatorsBus, controlledCondeser.ActuatorsBus) annotation (Line(
              points={{200,-140},{100,-140},{100,-131.6},{35.4,-131.6}}, color=
                {213,255,170}));
        connect(totalFeedPump.outlet, WaterOut) annotation (Line(points={{110,
                -182},{160,-182},{160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ActuatorsBus.nPump_feedLP,totalFeedPump. pumpSpeed_rpm)
          annotation (Line(points={{200,-140},{58,-140},{58,-172.4},{82.48,
                -172.4}}, color={213,255,170}));
        connect(controlledCondeser.WaterOut, totalFeedPump.inlet) annotation (
            Line(
            points={{6,-140},{6,-182},{78,-182}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={
                  {-200,-200},{200,200}}),
                            graphics));
      end STG_3LRh_valve_cc;

      model STG_3LRh_bypass_cc
        "Steam turbine group (three pressure levels, reheat) with inlet and bypass valves and controlled condenser"
        extends Interfaces.STGroup3LRh;
        ST3L_bypass steamTurbines(
          redeclare package FluidMedium = FluidMedium,
          steamHPNomFlowRate=67.6,
          HPT_eta_iso_nom=0.833,
          IPT_eta_iso_nom=0.903,
          LPT_eta_iso_nom=0.876,
          HPT_Kt=0.0032078,
          IPT_Kt=0.018883,
          LPT_Kt=0.078004,
          mixLP_V=5,
          steamIPNomFlowRate=81.3524 - 67.6,
          steamLPNomFlowRate=89.438 - 81.3524,
          valveHP_Cv=1165,
          valveIP_Cv=5625,
          valveLP_Cv=14733,
          bypassHP_Cv=272,
          bypassIP_Cv=1595,
          bypassLP_Cv=7540,
          steamHPNomPressure=12800000,
          steamIPNomPressure=2680000,
          steamLPNomPressure=600000,
          SSInit=SSInit,
          pcond=5398.2,
          valveHP_dpnom=160000,
          valveIP_dpnom=50000,
          valveLP_dpnom=29640)
                       annotation (Placement(transformation(extent={{-80,-50},{
                  20,50}}, rotation=0)));
        ThermoPower.PowerPlants.SteamTurbineGroup.Examples.CondPlant_cc
          controlledCondeser(
          redeclare package FluidMedium = FluidMedium,
          Vtot=10,
          Vlstart=1.5,
          setPoint_ratio=0.85,
          p=5398.2,
          SSInit=SSInit)       annotation (Placement(transformation(extent={{
                  -26,-140},{34,-80}}, rotation=0)));
        HRSG.Components.PrescribedSpeedPump totalFeedPump(
          redeclare package WaterMedium = FluidMedium,
          rho0=1000,
          q_nom={0.0898,0,0.1},
          head_nom={72.74,130,0},
          nominalFlow=89.8,
          n0=1500,
          nominalOutletPressure=600000,
          nominalInletPressure=5398.2)
                                  annotation (Placement(transformation(
              origin={88,-180},
              extent={{16,16},{-16,-16}},
              rotation=180)));
      equation
        connect(steamTurbines.Shaft_b, Shaft_b) annotation (Line(
            points={{20,0},{200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(steamTurbines.Shaft_a, Shaft_a) annotation (Line(
            points={{-80,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(ActuatorsBus, controlledCondeser.ActuatorsBus) annotation (Line(
              points={{200,-140},{80,-140},{80,-132},{33.4,-132},{33.4,-131.6}},
              color={213,255,170}));
        connect(ActuatorsBus, steamTurbines.ActuatorsBus) annotation (Line(
              points={{200,-140},{80,-140},{80,-35},{20,-35}}, color={213,255,
                170}));
        connect(SensorsBus, steamTurbines.SensorsBus) annotation (Line(points={
                {200,-80},{52,-80},{52,-20},{20,-20}}, color={255,170,213}));
        connect(SensorsBus, controlledCondeser.SensorsBus) annotation (Line(
              points={{200,-80},{52,-80},{52,-122},{33.4,-122}}, color={255,170,
                213}));
        connect(controlledCondeser.SteamIn, steamTurbines.LPT_Out) annotation (Line(
              points={{4,-80},{4,-50},{5,-50}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.LPT_In, From_SH_LP) annotation (Line(points={{-10,
                50},{-10,100},{80,100},{80,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.IPT_In, From_RH_IP) annotation (Line(points={{-40,
                50},{-40,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_Out, To_RH_IP) annotation (Line(points={{-55,
                50},{-55,140},{-100,140},{-100,200}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_In, From_SH_HP) annotation (Line(points={{-70,
                50},{-70,100},{-160,100},{-160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(totalFeedPump.outlet, WaterOut) annotation (Line(points={{104,
                -180},{160,-180},{160,200}}, thickness=0.5,
            color={0,0,255}));
        connect(ActuatorsBus.nPump_feedLP,totalFeedPump. pumpSpeed_rpm)
          annotation (Line(points={{200,-140},{52,-140},{52,-170.4},{76.48,
                -170.4}}, color={213,255,170}));
        connect(controlledCondeser.WaterOut, totalFeedPump.inlet) annotation (
            Line(
            points={{4,-140},{4,-180},{72,-180}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={
                  {-200,-200},{200,200}}),
                            graphics));
      end STG_3LRh_bypass_cc;
    end Examples;

    package Tests "Test cases"
      model computation_states
        package FluidMedium = ThermoPower.Water.StandardWater;
        parameter SI.SpecificEnthalpy h=2.39102e6 "value of specific enthalpy";
        parameter SI.Pressure p=2e5 "value of pressure";
        parameter SI.Temperature T=288 "value of temperature";

        SI.Temperature Tf "Temperature (p,h)";
        SI.SpecificEnthalpy hf "Specific enthalpy (p,T)";
        SI.Temperature Ts "Saturation temperature (p)";
        SI.SpecificEnthalpy hv "Dew specific enthalpy (p)";
        SI.SpecificEnthalpy hl "Bubble specific enthalpy (p)";
        SI.Density rhov "Dew density (p)";
        SI.Density rhol "Bubble density (p)";
        FluidMedium.SaturationProperties sat "Saturation properties";

      equation
        sat.psat = p;
        sat.Tsat = FluidMedium.saturationTemperature(p);

        Ts = sat.Tsat;
        hl=FluidMedium.bubbleEnthalpy(sat);
        hv=FluidMedium.dewEnthalpy(sat);
        Tf=FluidMedium.temperature_ph(p,h);
        hf=FluidMedium.specificEnthalpy_pT(p,T);
        rhov=FluidMedium.density_ph(p,h);
        rhol=FluidMedium.bubbleDensity(sat);
      end computation_states;

      model TestSettingTurbineHP
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=67.6,
          wnom=67.6,
          eta_iso_nom=0.833,
          Kt=0.0032078,
          PRstart=130/30,
          pnom=13000000)
                      annotation (Placement(transformation(extent={{-40,-40},{
                  20,20}}, rotation=0)));
        Water.SinkP sinkP(           h=3.1076e6, p0=2980000)
          annotation (Placement(transformation(extent={{30,60},{50,80}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
                      annotation (Placement(transformation(extent={{70,-20},{50,
                  0}}, rotation=0)));
        Water.SourceP sourceP(h=3.47e6, p0=12800000)
          annotation (Placement(transformation(extent={{-80,60},{-60,80}},
                rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(sinkP.flange, steamTurbineStodola.outlet) annotation (Line(
              points={{30,70},{14,70},{14,14}}, thickness=0.5,
            color={0,0,255}));
        connect(sourceP.flange, steamTurbineStodola.inlet) annotation (Line(
              points={{-60,70},{-34,70},{-34,14}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbineStodola.shaft_b, constantSpeed.flange) annotation (
            Line(
            points={{9.2,-10},{50,-10}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestSettingTurbineHP;

      model TestSettingTurbineIP
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=81.10,
          wnom=81.10,
          eta_iso_nom=0.903,
          Kt=0.018883,
          PRstart=27/6,
          pnom=2700000)    annotation (Placement(transformation(extent={{-40,
                  -40},{20,20}}, rotation=0)));
        Water.SinkP sinkP(        h=3.1281e6, p0=600000)
          annotation (Placement(transformation(extent={{30,60},{50,80}},
                rotation=0)));
        Water.SourceP sourceP(            h=3.554e6, p0=2680000)
          annotation (Placement(transformation(extent={{-80,60},{-60,80}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
                      annotation (Placement(transformation(extent={{70,-20},{50,
                  0}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(sinkP.flange, steamTurbineStodola.outlet) annotation (Line(
              points={{30,70},{14,70},{14,14}}, thickness=0.5,
            color={0,0,255}));
        connect(sourceP.flange, steamTurbineStodola.inlet) annotation (Line(
              points={{-60,70},{-34,70},{-34,14}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbineStodola.shaft_b, constantSpeed.flange) annotation (
            Line(
            points={{9.2,-10},{50,-10}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestSettingTurbineIP;

      model TestSettingTurbineLP
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=89.82,
          wnom=89.82,
          eta_iso_nom=0.903,
          Kt=0.078004,
          PRstart=6,
          pnom=600000)     annotation (Placement(transformation(extent={{-40,
                  -40},{20,20}}, rotation=0)));
        Water.SinkP sinkP(             h=2.3854e6, p0=5398.2)
          annotation (Placement(transformation(extent={{30,60},{50,80}},
                rotation=0)));
        Water.SourceP sourceP(        h=3.109e6, p0=6e5)
          annotation (Placement(transformation(extent={{-80,60},{-60,80}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
                      annotation (Placement(transformation(extent={{70,-20},{50,
                  0}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(sinkP.flange, steamTurbineStodola.outlet) annotation (Line(
              points={{30,70},{14,70},{14,14}}, thickness=0.5,
            color={0,0,255}));
        connect(sourceP.flange, steamTurbineStodola.inlet) annotation (Line(
              points={{-60,70},{-34,70},{-34,14}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbineStodola.shaft_b, constantSpeed.flange) annotation (
            Line(
            points={{9.2,-10},{50,-10}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestSettingTurbineLP;

      model TestValveTurbineHP
        Water.SinkP sinkP(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{30,60},{50,80}},
                rotation=0)));
        Water.ValveVap valveHP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          CheckValve=true,
          wnom=67.6,
          Cv=1165,
          pnom=12960000,
          dpnom=160000,
          thetanom=0.7)        annotation (Placement(transformation(
              origin={-32,50},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Water.SourceP sourceP(h=3.47e6, p0=1.296e7)
          annotation (Placement(transformation(extent={{-80,60},{-60,80}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_valveHP(k=0.7)
          annotation (Placement(transformation(extent={{6,40},{-14,60}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
                      annotation (Placement(transformation(extent={{70,-20},{50,
                  0}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=67.6,
          wnom=67.6,
          eta_iso_nom=0.833,
          Kt=0.0032078,
          PRstart=130/30,
          pnom=13000000)
                      annotation (Placement(transformation(extent={{-38,-40},{
                  22,20}}, rotation=0)));
      equation
        connect(sourceP.flange, valveHP.inlet)
          annotation (Line(points={{-60,70},{-32,70},{-32,60}}, thickness=0.5,
            color={0,0,255}));
        connect(com_valveHP.y, valveHP.theta) annotation (Line(points={{-15,50},
                {-24,50}}, color={0,0,127}));
        connect(steamTurbineStodola.shaft_b, constantSpeed.flange) annotation (
            Line(
            points={{11.2,-10},{50,-10}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None));
        connect(steamTurbineStodola.outlet, sinkP.flange) annotation (Line(
            points={{16,14},{16,70},{30,70}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(steamTurbineStodola.inlet, valveHP.outlet) annotation (Line(
            points={{-32,14},{-32,40}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestValveTurbineHP;

      model TestValveTurbineIP
        Water.SinkP sinkP(p0=6e5, h=3.1281e6)
          annotation (Placement(transformation(extent={{30,60},{50,80}},
                rotation=0)));
        Water.ValveVap valveIP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          CheckValve=true,
          wnom=81.1,
          Cv=5625,
          pnom=2730000,
          dpnom=50000)         annotation (Placement(transformation(
              origin={-36,50},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Water.SourceP sourceP(            h=3.554e6, p0=2730000)
          annotation (Placement(transformation(extent={{-80,60},{-60,80}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_valveHP
          annotation (Placement(transformation(extent={{4,40},{-16,60}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
                      annotation (Placement(transformation(extent={{70,-20},{50,
                  0}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=81.10,
          wnom=81.10,
          eta_iso_nom=0.903,
          Kt=0.018883,
          PRstart=27/6,
          pnom=2700000)    annotation (Placement(transformation(extent={{-42,-40},
                  {18,20}},      rotation=0)));
      equation
        connect(sourceP.flange,valveIP. inlet)
          annotation (Line(points={{-60,70},{-36,70},{-36,60}}, thickness=0.5,
            color={0,0,255}));
        connect(com_valveHP.y, valveIP.theta) annotation (Line(
            points={{-17,50},{-28,50}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(sinkP.flange,steamTurbineStodola. outlet) annotation (Line(
              points={{30,70},{12,70},{12,14}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbineStodola.shaft_b, constantSpeed.flange) annotation (
            Line(
            points={{7.2,-10},{50,-10}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None));
        connect(steamTurbineStodola.inlet, valveIP.outlet) annotation (Line(
            points={{-36,14},{-36,40}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestValveTurbineIP;

      model TestValveTurbineLP
        Water.SinkP sinkP(p0=5.3982e3, h=2.3854e6)
          annotation (Placement(transformation(extent={{30,60},{50,80}},
                rotation=0)));
        Water.ValveVap valveLP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          CheckValve=true,
          wnom=89.82,
          pnom=6.296e5,
          dpnom=2.964e4,
          Cv=14733)            annotation (Placement(transformation(
              origin={-34,50},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Water.SourceP sourceP(        h=3.109e6, p0=6.296e5)
          annotation (Placement(transformation(extent={{-80,60},{-60,80}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_valveHP
          annotation (Placement(transformation(extent={{4,40},{-16,60}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
                      annotation (Placement(transformation(extent={{70,-20},{50,
                  0}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=89.82,
          wnom=89.82,
          eta_iso_nom=0.903,
          Kt=0.078004,
          PRstart=6,
          pnom=600000)     annotation (Placement(transformation(extent={{-40,-40},
                  {20,20}},      rotation=0)));
      equation
        connect(valveLP.inlet, sourceP.flange) annotation (Line(
            points={{-34,60},{-34,70},{-60,70}},
            color={0,0,255},
            thickness=0.5));
        connect(com_valveHP.y, valveLP.theta) annotation (Line(points={{-17,50},
                {-26,50}}, color={0,0,127}));
        connect(sinkP.flange,steamTurbineStodola. outlet) annotation (Line(
              points={{30,70},{14,70},{14,14}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbineStodola.shaft_b, constantSpeed.flange) annotation (
            Line(
            points={{9.2,-10},{50,-10}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None));
        connect(steamTurbineStodola.inlet, valveLP.outlet) annotation (Line(
            points={{-34,14},{-34,40}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end TestValveTurbineLP;

      model TestTurbineHPefficiency

        Components.SteamTurbineVarEta steamTurbineVarEta(
          wstart=67.6,
          wnom=67.6,
          eta_iso_nom=0.833,
          Kt=0.0032078,
          n=20,
          Rm=0.936,
          PRstart=128/28,
          pnom=12800000)
                      annotation (Placement(transformation(extent={{-58,-90},{2,
                  -30}}, rotation=0)));
        Water.SinkP sinkP(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{10,10},{30,30}},
                rotation=0)));
        Water.ValveVap valveHP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          CheckValve=true,
          wnom=67.6,
          pnom=1.296e7,
          dpnom=1.6e5,
          Cv=1165)             annotation (Placement(transformation(
              origin={-52,0},
              extent={{10,10},{-10,-10}},
              rotation=90)));
        Water.SourceP sourceP(h=3.47e6, p0=1.296e7)
          annotation (Placement(transformation(extent={{-90,10},{-70,30}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Ramp com_valveHP(
          offset=1,
          height=-0.9,
          duration=50,
          startTime=1000)
          annotation (Placement(transformation(extent={{20,70},{0,90}},
                rotation=0)));
        ThermoPower.PowerPlants.SteamTurbineGroup.Components.PrescribedSpeed
          constantSpeed
          annotation (Placement(transformation(extent={{40,-70},{20,-50}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Ramp rif_velocity(
          height=-70,
          offset=314.16/2,
          duration=50,
          startTime=10)
          annotation (Placement(transformation(extent={{100,-50},{80,-30}},
                rotation=0)));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(
              origin={-28,64},
              extent={{-6,-6},{6,6}},
              rotation=180)));
        Modelica.Blocks.Math.Add add1
          annotation (Placement(transformation(
              origin={56,-54},
              extent={{-8,-8},{8,8}},
              rotation=180)));
      public
        Modelica.Blocks.Sources.Ramp com_valveHP1(
          offset=0,
          height=0.2,
          duration=50,
          startTime=80000)
          annotation (Placement(transformation(extent={{20,40},{0,60}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Ramp rif_velocity1(
          height=30,
          offset=0,
          duration=50,
          startTime=80)
          annotation (Placement(transformation(extent={{100,-90},{80,-70}},
                rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(sinkP.flange, steamTurbineVarEta.outlet)  annotation (Line(
              points={{10,20},{-4,20},{-4,-36}}, thickness=0.5,
            color={0,0,255}));
        connect(valveHP.outlet, steamTurbineVarEta.inlet)  annotation (Line(
              points={{-52,-10},{-52,-36}},          thickness=0.5,
            color={0,0,255}));
        connect(sourceP.flange, valveHP.inlet)
          annotation (Line(points={{-70,20},{-52,20},{-52,10}}, thickness=0.5,
            color={0,0,255}));
        connect(com_valveHP1.y, add.u1) annotation (Line(points={{-1,50},{-14,
                50},{-14,60.4},{-20.8,60.4}}, color={0,0,127}));
        connect(com_valveHP.y, add.u2) annotation (Line(points={{-1,80},{-14,80},
                {-14,68},{-20.8,68},{-20.8,67.6}},
                                                 color={0,0,127}));
        connect(add.y, valveHP.theta) annotation (Line(points={{-34.6,64},{-40,
                64},{-40,40},{-30,40},{-30,-4.89859e-016},{-44,-4.89859e-016}},
                                                        color={0,0,127}));
        connect(rif_velocity.y, add1.u2) annotation (Line(points={{79,-40},{72,
                -40},{72,-49.2},{65.6,-49.2}},              color={0,0,127}));
        connect(add1.y, constantSpeed.w_fixed) annotation (Line(points={{47.2,
                -54},{46,-54},{40,-54}},                     color={0,0,127}));
        connect(steamTurbineVarEta.shaft_b, constantSpeed.flange) annotation (
            Line(
            points={{-8.8,-60},{20,-60}},
            color={0,0,0},
            thickness=0.5,
            smooth=Smooth.None));
        connect(add1.u1, rif_velocity1.y) annotation (Line(
            points={{65.6,-58.8},{71.6,-58.8},{71.6,-80},{79,-80}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(graphics),
          experiment(StopTime=1000),
          experimentSetupOutput(equdistant=false));
      end TestTurbineHPefficiency;

      model TestST3LRh_base
        package FluidMedium = ThermoPower.Water.StandardWater;

        Examples.ST3L_base steamTurbines(
          redeclare package FluidMedium = FluidMedium,
          steamHPNomFlowRate=67.6,
          steamIPNomFlowRate=81.10 - 67.5,
          steamLPNomFlowRate=89.82 - 81.10,
          HPT_eta_iso_nom=0.833,
          IPT_eta_iso_nom=0.903,
          LPT_eta_iso_nom=0.876,
          HPT_Kt=0.0032078,
          IPT_Kt=0.018883,
          LPT_Kt=0.078004,
          mixLP_V=10,
          steamHPNomPressure=12800000,
          steamIPNomPressure=2680000,
          steamLPNomPressure=600000,
          pcond=5398.2)
                       annotation (Placement(transformation(extent={{-80,-40},{
                  0,40}}, rotation=0)));
        Water.SinkP sinkLPT(
          redeclare package Medium = FluidMedium,
          p0=5.3982e3,
          h=2.3854e6)      annotation (Placement(transformation(extent={{4,-66},
                  {16,-54}}, rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
          annotation (Placement(transformation(extent={{66,-10},{46,10}},
                rotation=0)));
        Water.SourceP sourceHPT(h=3.47e6, p0=1.28e7)
          annotation (Placement(transformation(
              origin={-72,66},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Water.SourceP sourceLPT(h=3.109e6, p0=6e5)
          annotation (Placement(transformation(
              origin={-24,60},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SinkP sinkP(           h=3.1076e6, p0=2980000)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=90,
              origin={-60,84})));
        Water.SourceP sourceP(            h=3.554e6, p0=2680000)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
              origin={-48,66})));
      equation
        connect(constantSpeed.flange, steamTurbines.Shaft_b)
                                                           annotation (Line(
            points={{46,0},{0,0}},
            color={0,0,0},
            thickness=0.5));
        connect(sinkLPT.flange, steamTurbines.LPT_Out)
          annotation (Line(points={{4,-60},{-12,-60},{-12,-40}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.LPT_In, sourceLPT.flange)
          annotation (Line(points={{-24,40},{-24,54}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_In, sourceHPT.flange)
          annotation (Line(points={{-72,40},{-72,54},{-72,60}},
                                                       thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_Out, sinkP.flange) annotation (Line(
            points={{-60,40},{-60,78}},
            color={0,0,255},
            smooth=Smooth.None,
            thickness=0.5));
        connect(steamTurbines.IPT_In, sourceP.flange) annotation (Line(
            points={{-48,40},{-48,60}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics),
          experiment(StopTime=1000),
          experimentSetupOutput(equdistant=false));
      end TestST3LRh_base;

      model TestST3LRh_valve
        package FluidMedium = ThermoPower.Water.StandardWater;

        Examples.ST3L_valve steamTurbines(
          redeclare package FluidMedium = FluidMedium,
          steamHPNomFlowRate=67.6,
          steamHPNomPressure=1.28e7,
          steamIPNomFlowRate=81.10 - 67.5,
          steamIPNomPressure=2.68e6,
          steamLPNomPressure=6e5,
          pcond=5.3982e3,
          steamLPNomFlowRate=89.82 - 81.10,
          valveHP_dpnom=1.6e5,
          valveIP_dpnom=5e4,
          HPT_eta_iso_nom=0.833,
          IPT_eta_iso_nom=0.903,
          LPT_eta_iso_nom=0.876,
          mixLP_V=20,
          valveHP_Cv=1165,
          valveIP_Cv=5625,
          valveLP_Cv=14733,
          valveLP_dpnom=2.964e4,
          HPT_Kt=0.0032078,
          IPT_Kt=0.018883,
          LPT_Kt=0.078004)
                       annotation (Placement(transformation(extent={{-80,-40},{
                  0,40}}, rotation=0)));
        Water.SinkP sinkLPT_p(
          redeclare package Medium = FluidMedium,
          p0=5.3982e3,
          h=2.3854e6)      annotation (Placement(transformation(extent={{-26,
                  -64},{-38,-52}}, rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
          annotation (Placement(transformation(extent={{66,30},{46,50}},
                rotation=0)));
      protected
        Buses.Actuators actuators annotation (Placement(transformation(
              origin={37,-40},
              extent={{-5,-20},{5,20}},
              rotation=180)));
      public
        Modelica.Blocks.Sources.Constant com_valveHP
          annotation (Placement(transformation(extent={{92,-10},{72,10}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_valveLP(k=1)
          annotation (Placement(transformation(extent={{92,-90},{72,-70}},
                rotation=0)));
        Water.SourceP sourceHPT_p(h=3.47e6, p0=1.296e7)
          annotation (Placement(transformation(
              origin={-72,64},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Water.SourceP sourceLPT(h=3.109e6, p0=6.296e5)
          annotation (Placement(transformation(
              origin={-24,64},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Modelica.Blocks.Sources.Ramp com_valveIP(
          duration=10,
          offset=1,
          startTime=40,
          height=-0.5)  annotation (Placement(transformation(extent={{92,-50},{
                  72,-30}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SinkP sinkP(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=90,
              origin={-60,78})));
        Water.SourceP sourceP(            h=3.554e6, p0=2730000)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
              origin={-48,64})));
      equation
        connect(actuators, steamTurbines.ActuatorsBus)   annotation (Line(
              points={{37,-40},{10,-40},{10,-28},{0,-28}}, color={213,255,170}));
        connect(constantSpeed.flange, steamTurbines.Shaft_b)   annotation (Line(
            points={{46,40},{24,40},{24,0},{0,0}},
            color={0,0,0},
            thickness=0.5));
        connect(sinkLPT_p.flange, steamTurbines.LPT_Out)
          annotation (Line(points={{-26,-58},{-12,-58},{-12,-40}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.LPT_In, sourceLPT.flange)
          annotation (Line(points={{-24,40},{-24,58}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_In, sourceHPT_p.flange)
          annotation (Line(points={{-72,40},{-72,58}}, thickness=0.5,
            color={0,0,255}));
        connect(com_valveHP.y, actuators.Opening_valveHP) annotation (Line(
              points={{71,0},{54,0},{54,-40},{37,-40},{37,-40}}, color={0,0,127}));
        connect(com_valveIP.y, actuators.Opening_valveIP) annotation (Line(
              points={{71,-40},{37,-40}}, color={0,0,127}));
        connect(com_valveLP.y, actuators.Opening_valveLP) annotation (Line(
              points={{71,-80},{54,-80},{54,-40},{37,-40}}, color={0,0,127}));
        connect(steamTurbines.HPT_Out, sinkP.flange) annotation (Line(
            points={{-60,40},{-60,72}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(steamTurbines.IPT_In, sourceP.flange) annotation (Line(
            points={{-48,40},{-48,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics),
          experiment(StopTime=1000),
          experimentSetupOutput(equdistant=false));
      end TestST3LRh_valve;

      model TestST3LRh_bypass
        package FluidMedium = ThermoPower.Water.StandardWater;

        Examples.ST3L_bypass steamTurbines(
          redeclare package FluidMedium = FluidMedium,
          steamHPNomFlowRate=67.6,
          steamHPNomPressure=1.28e7,
          steamIPNomFlowRate=81.10 - 67.5,
          steamIPNomPressure=2.68e6,
          steamLPNomPressure=6e5,
          pcond=5.3982e3,
          mixLP_V=50,
          steamLPNomFlowRate=89.82 - 81.10,
          valveHP_dpnom=1.6e5,
          valveIP_dpnom=5e4,
          valveLP_dpnom=2.64e4,
          HPT_eta_iso_nom=0.833,
          IPT_eta_iso_nom=0.903,
          LPT_eta_iso_nom=0.876,
          valveHP_Cv=1165,
          valveIP_Cv=5625,
          valveLP_Cv=14733,
          bypassHP_Cv=272,
          bypassIP_Cv=1595,
          bypassLP_Cv=7540,
          HPT_Kt=0.0032078,
          IPT_Kt=0.018883,
          LPT_Kt=0.078004,
          valveDrumIP_Cv=810,
          valveDrumLP_Cv=1670)
                       annotation (Placement(transformation(extent={{-94,-40},{
                  -14,40}}, rotation=0)));
        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
          annotation (Placement(transformation(extent={{20,-10},{0,10}},
                rotation=0)));
      protected
        Buses.Actuators actuators annotation (Placement(transformation(
              origin={66,-74},
              extent={{-20,-6},{20,6}},
              rotation=180)));
      public
        Modelica.Blocks.Sources.Constant com_valveHP(k=1)
          annotation (Placement(transformation(extent={{96,30},{76,50}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_valveIP(k=1)
          annotation (Placement(transformation(extent={{96,-10},{76,10}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_valveLP(k=1)
          annotation (Placement(transformation(extent={{96,-50},{76,-30}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_bypassHP(k=0)
          annotation (Placement(transformation(extent={{36,30},{56,50}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_bypassIP(k=0)
          annotation (Placement(transformation(extent={{36,-10},{56,10}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_bypassLP(k=0)
          annotation (Placement(transformation(extent={{36,-50},{56,-30}},
                rotation=0)));
        Water.SinkP sinkLPT_p(
          redeclare package Medium = FluidMedium,
          p0=5.3982e3,
          h=2.3854e6)      annotation (Placement(transformation(extent={{-34,
                  -66},{-46,-54}}, rotation=0)));
        Water.SourceP sourceHPT_p(h=3.47e6, p0=1.296e7)
          annotation (Placement(transformation(
              origin={-86,64},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Water.SourceP sourceLPT(h=3.109e6, p0=6.296e5)
          annotation (Placement(transformation(
              origin={-38,64},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SinkP sinkP(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=90,
              origin={-74,80})));
        Water.SourceP sourceP(            h=3.554e6, p0=2730000)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
              origin={-62,64})));
      equation
        connect(com_valveHP.y, actuators.Opening_valveHP)
                                                      annotation (Line(points={
                {75,40},{66,40},{66,-74}}, color={0,0,127}));
        connect(com_valveIP.y, actuators.Opening_valveIP)
                                                      annotation (Line(points={
                {75,0},{66,0},{66,-74}}, color={0,0,127}));
        connect(com_valveLP.y, actuators.Opening_valveLP)
                                                      annotation (Line(points={
                {75,-40},{66,-40},{66,-74}}, color={0,0,127}));
        connect(actuators,steamTurbines. ActuatorsBus) annotation (Line(points=
                {{66,-74},{18,-74},{18,-28},{-14,-28}}, color={213,255,170}));
        connect(steamTurbines.Shaft_b, constantSpeed.flange) annotation (Line(
            points={{-14,0},{0,0}},
            color={0,0,0},
            thickness=0.5));
        connect(com_bypassHP.y, actuators.Opening_byPassHP)
                                                        annotation (Line(points=
               {{57,40},{66,40},{66,-74}}, color={0,0,127}));
        connect(com_bypassIP.y, actuators.Opening_byPassIP)
                                                        annotation (Line(points=
               {{57,0},{66,0},{66,-74}}, color={0,0,127}));
        connect(com_bypassLP.y, actuators.Opening_byPassLP)
                                                        annotation (Line(points=
               {{57,-40},{66,-40},{66,-74}}, color={0,0,127}));
        connect(sinkLPT_p.flange, steamTurbines.LPT_Out)
          annotation (Line(points={{-34,-60},{-26,-60},{-26,-40}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.LPT_In,sourceLPT. flange)
          annotation (Line(points={{-38,40},{-38,58}}, thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_In,sourceHPT_p. flange)
          annotation (Line(points={{-86,40},{-86,50},{-86,58}},
                                                       thickness=0.5,
            color={0,0,255}));
        connect(steamTurbines.HPT_Out, sinkP.flange) annotation (Line(
            points={{-74,40},{-74,74}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(steamTurbines.IPT_In, sourceP.flange) annotation (Line(
            points={{-62,40},{-62,58}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics),
          experiment(StopTime=1000),
          experimentSetupOutput(equdistant=false));
      end TestST3LRh_bypass;

      model TestCondenserControl
        package FluidMedium = ThermoPower.Water.StandardWater;

        Control.PID pID(
          PVmax=1,
          PVmin=0.1,
          CSmin=-0.6,
          CSmax=0.6,
          Ti=2000,
          Kp=-3,
          steadyStateInit=true)
                      annotation (Placement(transformation(extent={{-18,-80},{2,
                  -60}}, rotation=0)));
        Water.SourceW sourceSteam(
          redeclare package Medium = FluidMedium,
          w0=89.8,
          h=2.3854e6,
          p0=5389.2)  annotation (Placement(transformation(extent={{-76,50},{
                  -56,70}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp const(
          offset=0.85,
          duration=500,
          startTime=8000,
          height=0.1)
                    annotation (Placement(transformation(extent={{-60,-66},{-48,
                  -54}}, rotation=0)));
        ThermoPower.PowerPlants.SteamTurbineGroup.Components.CondenserPreP_tap
          condenserIdeal_tap(                            redeclare package
            Medium = FluidMedium, p=5398.2) annotation (Placement(
              transformation(extent={{0,0},{40,40}}, rotation=0)));
        Water.SinkW sinkWater(
          redeclare package Medium = FluidMedium,
          p0=5398.2,
          h=1.43495e5,
          w0=89.8) annotation (Placement(transformation(extent={{70,-20},{90,0}},
                rotation=0)));
        Water.SourceW sourceTap(
          redeclare package Medium = FluidMedium,
          h=1.43495e5,
          p0=5389.2,
          allowFlowReversal=true)
                      annotation (Placement(transformation(extent={{-60,-6},{
                  -40,14}}, rotation=0)));
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(const.y, pID.SP) annotation (Line(points={{-47.4,-60},{-34,-60},
                {-34,-66},{-18,-66}}, color={0,0,127}));
        connect(pID.CS, sourceTap.in_w0) annotation (Line(points={{2,-70},{20,
                -70},{20,-20},{-70,-20},{-70,20},{-54,20},{-54,10}}, color={0,0,
                127}));
        connect(pID.PV, condenserIdeal_tap.ratio_Vv_Vtot) annotation (Line(
              points={{-18,-74},{-80,-74},{-80,24},{-20,24},{-20,16},{0,16}},
              color={0,0,127}));
        connect(sourceTap.flange, condenserIdeal_tap.tapWater) annotation (Line(
            points={{-40,4},{4,4}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(condenserIdeal_tap.waterOut, sinkWater.flange) annotation (Line(
            points={{20,0},{20,-10},{70,-10}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(condenserIdeal_tap.steamIn, sourceSteam.flange) annotation (
            Line(
            points={{20,40},{20,60},{-56,60}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics),
          experiment,
          experimentSetupOutput(equdistant=false));
      end TestCondenserControl;

      model TestSTG_cc "Test of STG with condenser control"
        package FluidMedium = ThermoPower.Water.StandardWater;

        Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(
                                                                  w_fixed=
              314.16/2, useSupport=false)
          annotation (Placement(transformation(extent={{30,-26},{10,-6}},
                rotation=0)));
        Water.SourceP sourceHPT(h=3.47e6, p0=1.28e7,
          redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-82,78},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Water.SourceP sourceLPT(h=3.109e6, p0=6e5,
          redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(
              origin={-34,64},
              extent={{-6,-6},{6,6}},
              rotation=270)));
        Examples.STG_3LRh_valve_cc sTG_3LRh(
                                   redeclare package FluidMedium = FluidMedium,
            steamTurbines(SSInit=true))
                                   annotation (Placement(transformation(extent=
                  {{-90,-56},{-10,24}}, rotation=0)));
        Water.SinkP sinkWater(
          redeclare package Medium = FluidMedium,
          h=1.43495e5,
          p0=6e5)  annotation (Placement(transformation(
              origin={-18,74},
              extent={{-6,6},{6,-6}},
              rotation=90)));
      public
        Modelica.Blocks.Sources.Constant com_valveHP(k=1)
          annotation (Placement(transformation(extent={{100,30},{80,50}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_valveIP(k=1)
          annotation (Placement(transformation(extent={{100,-10},{80,10}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Constant com_valveLP(k=1)
          annotation (Placement(transformation(extent={{100,-50},{80,-30}},
                rotation=0)));
      protected
        Buses.Actuators actuators annotation (Placement(transformation(
              origin={70,-74},
              extent={{-20,-6},{20,6}},
              rotation=180)));
      public
        Modelica.Blocks.Sources.Constant n_pump(k=1425)
          annotation (Placement(transformation(extent={{40,30},{60,50}},
                rotation=0)));
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Water.SinkP sinkP(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=90,
              origin={-70,66})));
        Water.SourceP sourceP(            h=3.554e6, p0=2730000)
          annotation (Placement(transformation(extent={{-6,-6},{6,6}},
                rotation=270,
              origin={-58,52})));
      equation
        connect(constantSpeed.flange, sTG_3LRh.Shaft_b) annotation (Line(
            points={{10,-16},{-10,-16}},
            color={0,0,0},
            thickness=0.5));
        connect(com_valveHP.y,actuators. Opening_valveHP)
                                                      annotation (Line(points={
                {79,40},{70,40},{70,-74}}, color={0,0,127}));
        connect(com_valveIP.y,actuators. Opening_valveIP)
                                                      annotation (Line(points={
                {79,0},{70,0},{70,-74}}, color={0,0,127}));
        connect(com_valveLP.y,actuators. Opening_valveLP)
                                                      annotation (Line(points={
                {79,-40},{70,-40},{70,-74}}, color={0,0,127}));
        connect(actuators, sTG_3LRh.ActuatorsBus) annotation (Line(points={{70,
                -74},{6,-74},{6,-44},{-10,-44}}, color={213,255,170}));
        connect(sTG_3LRh.WaterOut, sinkWater.flange)
          annotation (Line(points={{-18,24},{-18,68}}, thickness=0.5,
            color={0,0,255}));
        connect(sTG_3LRh.From_SH_LP, sourceLPT.flange)
          annotation (Line(points={{-34,24},{-34,58}}, thickness=0.5,
            color={0,0,255}));
        connect(sTG_3LRh.From_SH_HP, sourceHPT.flange)
          annotation (Line(points={{-82,24},{-82,72}}, thickness=0.5,
            color={0,0,255}));
        connect(n_pump.y, actuators.nPump_feedLP) annotation (Line(points={{61,40},
                {70,40},{70,-74}},     color={0,0,127}));
        connect(sinkP.flange, sTG_3LRh.To_RH_IP) annotation (Line(
            points={{-70,60},{-70,24}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        connect(sourceP.flange, sTG_3LRh.From_RH_IP) annotation (Line(
            points={{-58,46},{-58,24},{-58,24}},
            color={0,0,255},
            thickness=0.5,
            smooth=Smooth.None));
        annotation (Diagram(graphics),
                             experiment(StopTime=20000, NumberOfIntervals=10000),
          experimentSetupOutput(equdistant=false));
      end TestSTG_cc;

    end Tests;

    package Functions "Function definitions"

      function curveEfficiency "curve for efficiency calculation"
        input Real eta_nom "Nominal efficiency (maximum)";
        input Real k "Ratio uf/wiso";
        input Real x "Degree of reaction";
        output Real eta "Value of efficient correspondent";
      protected
        Real a;
      algorithm
        a:=sqrt(1 - x);
        eta:=2*k*((a - k) + sqrt((a - k)^2 + 1 - (a^2)))*eta_nom;
      end curveEfficiency;

    end Functions;
    annotation (Documentation(revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
  end SteamTurbineGroup;

  package ElectricGeneratorGroup
    "Models and tests of the electrical group (generator and network) and its main components"
    package Interfaces "Interface definitions"
      partial model SingleShaft
        "Base Class for alternator group, configuration single-shaft (one generator)"
        parameter SI.Frequency fn=50 "Nominal frequency of the grid";
        parameter SI.Power Pn "Nominal power installed on the grid";
        parameter Real eta=1 "Conversion efficiency of the electric generator";
        parameter SI.MomentOfInertia J_shaft=0 "Total inertia of the system";
        parameter Real d_shaft=0 "Damping constant of the shaft";
        parameter SI.AngularVelocity omega_nom=2*Modelica.Constants.pi*fn/2
          "Nominal angular velocity of the shaft";
        parameter Boolean SSInit=false "Steady-state initialization" annotation(Dialog(tab="Initialization"));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-202,14},{-122,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(
                points={{140,160},{140,-160}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{120,160},{120,-160}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{100,160},{100,-160}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,20},{100,20}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,0},{120,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,-20},{140,-20}},
                color={0,0,0},
                thickness=0.5),
              Ellipse(
                extent={{96,24},{104,16}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{116,4},{124,-4}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{136,-16},{144,-24}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-34,20},{20,20},{44,34}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-30,0},{20,0},{44,14}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-44,-20},{20,-20},{44,-6}},
                color={0,0,0},
                thickness=0.5),
              Ellipse(
                extent={{-140,60},{-20,-60}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-120,40},{-40,-40}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "G")}));
      end SingleShaft;

      partial model DoubleShaft
        "Base Class for alternator group, configuration double-shaft (two generator)"

        //grid
        parameter SI.Frequency fn=50 "Nominal frequency of the grid";
        parameter SI.Power Pn "Nominal power installed on the grid";

        //generators
        parameter Real eta_A=1
          "Conversion efficiency of the electric generator"                          annotation (Dialog(group = "Generator-Shaft A"));
        parameter Real eta_B=1
          "Conversion efficiency of the electric generator"                          annotation (Dialog(group = "Generator-Shaft B"));

        //other parameter
        parameter SI.MomentOfInertia J_shaft_A=0
          "Total inertia of the steam turbogenerator"                             annotation (Dialog(group = "Generator-Shaft A"));
        parameter Real d_shaft_A=0 "Damping constant of the shaft" annotation (Dialog(group = "Generator-Shaft A"));
        parameter SI.AngularVelocity omega_nom_A=2*Modelica.Constants.pi*fn/2
          "Nominal angular velocity of the shaft"                                  annotation (Dialog(group = "Generator-Shaft A"));
        parameter SI.MomentOfInertia J_shaft_B=0
          "Total inertia of the steam turbogenerator"                             annotation (Dialog(group = "Generator-Shaft B"));
        parameter Real d_shaft_B=0 "Damping constant of the shaft" annotation (Dialog(group = "Generator-Shaft B"));
        parameter SI.AngularVelocity omega_nom_B=2*Modelica.Constants.pi*fn/2
          "Nominal angular velocity of the shaft"                                  annotation (Dialog(group = "Generator-Shaft B"));
        parameter Boolean SSInit=false "Steady-state initialization"
                                                                    annotation(Dialog(tab="Initialization"));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_B
          annotation (Placement(transformation(extent={{-220,-120},{-180,-80}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_A
          annotation (Placement(transformation(extent={{-222,80},{-182,120}},
                rotation=0)));
        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-204,114},{-124,86}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(
                points={{140,160},{140,-160}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{120,160},{120,-160}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{100,160},{100,-160}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{48,120},{98,120}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{48,100},{118,100}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{48,80},{138,80}},
                color={0,0,0},
                thickness=0.5),
              Ellipse(
                extent={{96,124},{104,116}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{116,104},{124,96}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{136,84},{144,76}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-36,120},{18,120},{42,134}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-32,100},{18,100},{42,114}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-46,80},{18,80},{42,94}},
                color={0,0,0},
                thickness=0.5),
              Ellipse(
                extent={{-142,160},{-22,40}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-122,140},{-42,60}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "G"),
              Rectangle(
                extent={{-202,-86},{-122,-114}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(
                points={{50,-80},{100,-80}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,-100},{120,-100}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,-120},{140,-120}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-80},{20,-80},{44,-66}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-30,-100},{20,-100},{44,-86}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-44,-120},{20,-120},{44,-106}},
                color={0,0,0},
                thickness=0.5),
              Ellipse(
                extent={{-140,-40},{-20,-160}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-120,-60},{-40,-140}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "G"),
              Ellipse(
                extent={{96,-76},{104,-84}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{116,-96},{124,-104}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{136,-116},{144,-124}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}));
      end DoubleShaft;

      partial model TripleShaft
        "Base Class for alternator group, configuration triple-shaft (three generator)"

        //grid
        parameter SI.Frequency fn=50 "Nominal frequency of the grid";
        parameter SI.Power Pn "Nominal power installed on the grid";

        //generators
        parameter Real eta_A=1
          "Conversion efficiency of the electric generator"                          annotation (Dialog(group = "Generator-Shaft A"));
        parameter Real eta_B=1
          "Conversion efficiency of the electric generator"                          annotation (Dialog(group = "Generator-Shaft B"));
        parameter Real eta_C=1
          "Conversion efficiency of the electric generator"                          annotation (Dialog(group = "Generator-Shaft C"));

        //other parameter
        parameter SI.MomentOfInertia J_shaft_A=0
          "Total inertia of the steam turbogenerator"                             annotation (Dialog(group = "Generator-Shaft A"));
        parameter Real d_shaft_A=0 "Damping constant of the shaft" annotation (Dialog(group = "Generator-Shaft A"));
        parameter SI.AngularVelocity omega_nom_A=2*Modelica.Constants.pi*fn/2
          "Nominal angular velocity of the shaft"                                  annotation (Dialog(group = "Generator-Shaft A"));
        parameter SI.MomentOfInertia J_shaft_B=0
          "Total inertia of the steam turbogenerator"                             annotation (Dialog(group = "Generator-Shaft B"));
        parameter Real d_shaft_B=0 "Damping constant of the shaft" annotation (Dialog(group = "Generator-Shaft B"));
        parameter SI.AngularVelocity omega_nom_B=2*Modelica.Constants.pi*fn/2
          "Nominal angular velocity of the shaft"                                  annotation (Dialog(group = "Generator-Shaft B"));
        parameter SI.MomentOfInertia J_shaft_C=0
          "Total inertia of the steam turbogenerator"                             annotation (Dialog(group = "Generator-Shaft C"));
        parameter Real d_shaft_C=0 "Damping constant of the shaft" annotation (Dialog(group = "Generator-Shaft C"));
        parameter SI.AngularVelocity omega_nom_C=2*Modelica.Constants.pi*fn/2
          "Nominal angular velocity of the shaft"                                  annotation (Dialog(group = "Generator-Shaft C"));
        parameter Boolean SSInit=false "Steady-state initialization"
                                                                    annotation(Dialog(tab="Initialization"));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_B
          annotation (Placement(transformation(extent={{-220,-20},{-180,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_A
          annotation (Placement(transformation(extent={{-220,100},{-180,140}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_C
          annotation (Placement(transformation(extent={{-220,-140},{-180,-100}},
                rotation=0)));

        Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{
                  180,-100},{220,-60}}, rotation=0)));
        Buses.Actuators ActuatorsBus annotation (Placement(transformation(
                extent={{220,-160},{180,-120}}, rotation=0)));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics),
                             Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-200},{200,200}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-200,200},{200,-200}},
                lineColor={170,170,255},
                fillColor={230,230,230},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-200,134},{-120,106}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(
                points={{140,180},{140,-180}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{120,180},{120,-180}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{100,180},{100,-180}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,140},{100,140}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,120},{120,120}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,100},{140,100}},
                color={0,0,0},
                thickness=0.5),
              Ellipse(
                extent={{96,144},{104,136}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{116,124},{124,116}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{136,104},{144,96}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-34,140},{20,140},{44,154}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-30,120},{20,120},{44,134}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-44,100},{20,100},{44,114}},
                color={0,0,0},
                thickness=0.5),
              Ellipse(
                extent={{-136,176},{-24,64}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-120,160},{-40,80}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "G"),
              Rectangle(
                extent={{-200,-106},{-120,-134}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(
                points={{50,-100},{100,-100}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,-120},{120,-120}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,-140},{140,-140}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-100},{20,-100},{44,-86}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-30,-120},{20,-120},{44,-106}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-44,-140},{20,-140},{44,-126}},
                color={0,0,0},
                thickness=0.5),
              Ellipse(
                extent={{-136,-64},{-24,-176}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-120,-80},{-40,-160}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "G"),
              Ellipse(
                extent={{96,-96},{104,-104}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{116,-116},{124,-124}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{136,-136},{144,-144}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-200,14},{-120,-14}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={135,135,135}),
              Line(
                points={{50,20},{100,20}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,0},{120,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{50,-20},{140,-20}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,20},{20,20},{44,34}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-30,0},{20,0},{44,14}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-44,-20},{20,-20},{44,-6}},
                color={0,0,0},
                thickness=0.5),
              Ellipse(
                extent={{-136,56},{-24,-56}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-120,40},{-40,-40}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=
                     "G"),
              Ellipse(
                extent={{96,24},{104,16}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{116,4},{124,-4}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{136,-16},{144,-24}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}));
      end TripleShaft;
    end Interfaces;

    package Components "Xomponent definitions"
      model PowerSensor "Measures power flow through the component"
        Electrical.PowerConnection port_a
                               annotation (Placement(transformation(extent={{
                  -110,-10},{-90,10}}, rotation=0)));
        Electrical.PowerConnection port_b
                               annotation (Placement(transformation(extent={{90,
                  -12},{110,8}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput W
          "Power flowing from port_a to port_b"
            annotation (Placement(transformation(
              origin={0,-94},
              extent={{-10,-10},{10,10}},
              rotation=270)));
      equation
        port_a.W+port_b.W = 0;
        port_a.f = port_b.f;
        W = port_a.W;
      annotation (Diagram(graphics),
                           Icon(graphics={
              Ellipse(
                extent={{-70,70},{70,-70}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{0,70},{0,40}}, color={0,0,0}),
              Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),
              Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),
              Line(points={{37.6,13.7},{65.8,23.9}}, color={0,0,0}),
              Line(points={{-37.6,13.7},{-65.8,23.9}}, color={0,0,0}),
              Line(points={{0,0},{9.02,28.6}}, color={0,0,0}),
              Polygon(
                points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-5,5},{5,-5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-29,-11},{30,-70}},
                lineColor={0,0,0},
                textString=
                   "W"),
              Line(points={{-70,0},{-90,0}}, color={0,0,0}),
              Line(points={{100,0},{70,0}}, color={0,0,0}),
              Text(extent={{-148,88},{152,128}}, textString=
                                                     "%name"),
              Line(points={{0,-70},{0,-84}}, color={0,0,0})}));
      end PowerSensor;

      model FrequencySensor "Measures the frequency at the connector"
        Electrical.PowerConnection port
                             annotation (Placement(transformation(extent={{-110,
                  -10},{-90,10}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput f "Frequency at the connector"
            annotation (Placement(transformation(extent={{92,-10},{112,10}},
                rotation=0)));
      equation
        port.W = 0;
        f = port.f;
      annotation (Diagram(graphics),
                           Icon(graphics={
              Ellipse(
                extent={{-70,70},{70,-70}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{0,70},{0,40}}, color={0,0,0}),
              Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),
              Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),
              Line(points={{37.6,13.7},{65.8,23.9}}, color={0,0,0}),
              Line(points={{-37.6,13.7},{-65.8,23.9}}, color={0,0,0}),
              Line(points={{0,0},{9.02,28.6}}, color={0,0,0}),
              Polygon(
                points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{-5,5},{5,-5}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-29,-11},{30,-70}},
                lineColor={0,0,0},
                textString=
                   "f"),
              Line(points={{-70,0},{-90,0}}, color={0,0,0}),
              Line(points={{100,0},{70,0}}, color={0,0,0}),
              Text(extent={{-148,88},{152,128}}, textString=
                                                     "%name")}));
      end FrequencySensor;

      model Grid_2in "Ideal grid with finite droop and two inlet"
        parameter SI.Frequency fn=50 "Nominal frequency";
        parameter SI.Power Pn "Nominal power installed on the network";
        parameter Real droop(unit="pu")=0.05 "Network droop";
        SI.Power Wtot "Total power";
        Electrical.PowerConnection connection_A
                                   annotation (Placement(transformation(extent=
                  {{-100,26},{-72,54}}, rotation=0)));
        Electrical.PowerConnection connection_B
                                   annotation (Placement(transformation(extent=
                  {{-100,-54},{-72,-26}}, rotation=0)));
      equation
        connection_A.f = fn + droop*fn*connection_A.W/Pn;
        connection_B.f = fn + droop*fn*connection_B.W/Pn;
        Wtot = connection_A.W + connection_B.W;

        annotation (Diagram(graphics),
                             Icon(graphics={
              Line(points={{18,-16},{2,-38}}, color={0,0,0}),
              Line(points={{-72,-40},{-36,-20}}, color={0,0,0}),
              Ellipse(
                extent={{100,-68},{-40,68}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-40,0},{-6,0},{24,36},{54,50}}, color={0,0,0}),
              Line(points={{24,36},{36,-6}}, color={0,0,0}),
              Line(points={{-6,0},{16,-14},{40,-52}}, color={0,0,0}),
              Line(points={{18,-14},{34,-6},{70,-22}}, color={0,0,0}),
              Line(points={{68,18},{36,-4},{36,-4}}, color={0,0,0}),
              Ellipse(
                extent={{-8,2},{-2,-4}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{20,38},{26,32}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{52,54},{58,48}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{14,-12},{20,-18}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{66,22},{72,16}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{32,-2},{38,-8}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{38,-50},{44,-56}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{66,-18},{72,-24}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-72,40},{-36,20}}, color={0,0,0})}));
      end Grid_2in;

      model Grid_3in "Ideal grid with finite droop and three inlet"
        parameter SI.Frequency fn=50 "Nominal frequency";
        parameter SI.Power Pn "Nominal power installed on the network";
        parameter Real droop(unit="pu")=0.05 "Network droop";
        SI.Power Wtot "Total power";
        Electrical.PowerConnection connection_A
                                   annotation (Placement(transformation(extent=
                  {{-100,66},{-72,94}}, rotation=0)));
        Electrical.PowerConnection connection_B
                                   annotation (Placement(transformation(extent=
                  {{-100,-14},{-72,14}}, rotation=0)));
        Electrical.PowerConnection connection_C
                                   annotation (Placement(transformation(extent=
                  {{-100,-94},{-72,-66}}, rotation=0)));
      equation
        connection_A.f = fn + droop*fn*connection_A.W/Pn;
        connection_B.f = fn + droop*fn*connection_B.W/Pn;
        connection_C.f = fn + droop*fn*connection_C.W/Pn;
        Wtot = connection_A.W + connection_B.W + connection_C.W;

        annotation (Diagram(graphics),
                             Icon(graphics={
              Line(points={{18,-16},{2,-38}}, color={0,0,0}),
              Line(points={{-72,-80},{-20,-48}}, color={0,0,0}),
              Ellipse(
                extent={{100,-68},{-40,68}},
                lineColor={0,0,0},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-72,0},{-6,0},{24,36},{54,50}}, color={0,0,0}),
              Line(points={{24,36},{36,-6}}, color={0,0,0}),
              Line(points={{-6,0},{16,-14},{40,-52}}, color={0,0,0}),
              Line(points={{18,-14},{34,-6},{70,-22}}, color={0,0,0}),
              Line(points={{68,18},{36,-4},{36,-4}}, color={0,0,0}),
              Ellipse(
                extent={{-8,2},{-2,-4}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{20,38},{26,32}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{52,54},{58,48}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{14,-12},{20,-18}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{66,22},{72,16}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{32,-2},{38,-8}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{38,-50},{44,-56}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Ellipse(
                extent={{66,-18},{72,-24}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-72,80},{-26,40}}, color={0,0,0})}));
      end Grid_3in;

      package OldElementsSwingEquation
        model Generator_SE
          "Electric generator inclusive of approximate swing equation"
          //Parameter
          parameter Real eta=1 "Conversion efficiency";
          parameter Integer Np=2 "Number of couple of electrical poles";
          parameter SI.Power Pmax "Output maximum power";
          parameter Real J "Moment of inertia of the system-shaft";
          parameter Real r=0.3 "Damping of the system";
          parameter SI.AngularVelocity omega_nom
            "Nominal angulary velocity of shaft";
          parameter SI.Angle delta_start "Loaded angle start value";

          //Variable
          SI.AngularVelocity omega "Shaft angular velocity";
          SI.Conversions.NonSIunits.AngularVelocity_rpm n "Rotational speed";
          SI.Angle delta(start=delta_start) "Loaded angle";
          SI.AngularVelocity d_delta "Variation of loaded angle";
          SI.AngularVelocity omegaGrid "Angulary velocity in the grid";
          SI.Power Pe "Outlet electric power";
          SI.Power Pm "Inlet mechanical power";
          Real M "Auxiliary variable";
          Real D "Auxiliary variable";

          //Connector
          Electrical.PowerConnection powerConnection
                                            annotation (Placement(
                transformation(extent={{58,-14},{86,14}}, rotation=0)));
          Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                  rotation=0)));

        equation
          M=J/(Np^2)*omega_nom*Np;
          D=2*r*sqrt(Pmax*J*omega_nom*Np/(Np^2));
          omega=der(shaft.phi);
          Pm=omega*shaft.tau;
          n = Modelica.SIunits.Conversions.to_rpm(omega)
            "Rotational speed in rpm";
          omegaGrid = 2*Modelica.Constants.pi*powerConnection.f;
          powerConnection.W = - Pe;

          //Definition of loaded angle
          d_delta = omega*Np - omegaGrid;
          der(delta) = d_delta;

          //Swing Equation
          M*der(d_delta) + D*d_delta = Pm - Pe/eta;
          Pe = Pmax*Modelica.Math.sin(delta);

          annotation (Icon(graphics={
                Rectangle(
                  extent={{-60,8},{-90,-8}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={175,175,175}),
                Ellipse(
                  extent={{-60,60},{60,-60}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={230,230,230},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-60,60},{60,-20}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={230,230,230},
                  fillPattern=FillPattern.Solid,
                  textString=
                       "G"),
                Text(
                  extent={{-60,-10},{60,-50}},
                  lineColor={0,127,0},
                  textString=
                       "SE")}),
                              Diagram(graphics));
        end Generator_SE;

        model Generator_SE_com
          "Electric generator inclusive of complex swing equation"
          parameter Real eta=1 "Conversion efficiency";
          parameter Integer Np=2 "Number of couple of electrical poles";
          parameter SI.Power Pmax "Output maximum power";
          parameter Real J "Moment of inertia of the system-shaft";
          parameter Real r=0.3 "Damping of the system";
          parameter SI.Angle delta_start "Start value of loaded angle";

          SI.AngularVelocity omega "Shaft angular velocity";
          SI.Conversions.NonSIunits.AngularVelocity_rpm n "Rotational speed";
          SI.Angle delta(start=delta_start) "Loaded angle";
          SI.AngularVelocity d_delta "Variation of loaded angle";
          SI.AngularVelocity omegaGrid "Angulary velocity in the grid";
          SI.Power Pe "Outlet electric power";
          SI.Power Pm "Inlet mechanical power";
          Real M "Auxiliary variable";
          Real D "Auxiliary variable";

          Electrical.PowerConnection powerConnection
                                            annotation (Placement(
                transformation(extent={{58,-14},{86,14}}, rotation=0)));
          Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                  rotation=0)));

        equation
          M=J/(Np^2)*omega*Np;
          D=2*r*sqrt(Pmax*J*omega*Np/(Np^2));
          omega=der(shaft.phi);
          Pm=omega*shaft.tau;
          n = Modelica.SIunits.Conversions.to_rpm(omega)
            "Rotational speed in rpm";
          omegaGrid = 2*Modelica.Constants.pi*powerConnection.f;
          powerConnection.W = - Pe;

          //Definition of loaded angle
          d_delta = omega*Np - omegaGrid;
          der(delta) = d_delta;

          //Swing Equation
          M*der(d_delta) + D*d_delta = Pm - Pe;
          Pe = Pmax*Modelica.Math.sin(delta);

          annotation (Icon(graphics={
                Rectangle(
                  extent={{-60,8},{-90,-8}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={175,175,175}),
                Ellipse(
                  extent={{-60,60},{60,-60}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={230,230,230},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-60,60},{60,-20}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={230,230,230},
                  fillPattern=FillPattern.Solid,
                  textString=
                       "G"),
                Text(
                  extent={{-60,-10},{60,-50}},
                  lineColor={0,127,0},
                  textString=
                       "SE")}),
                              Diagram(graphics));
        end Generator_SE_com;

        model Generator_SE_Breaker
          "Electic generator inclusive of approximate swing equation and breaker for connection grid"
          //Parameters
          parameter Real eta=1 "Conversion efficiency";
          parameter Integer Np=2 "Number of couple of electrical poles";
          parameter SI.Power Pmax "Maximum power of generator";
          parameter Real J "Moment of inertia of the system-shaft";
          parameter Real r=0.3 "Damping of the system";
          parameter SI.AngularVelocity omega_nom
            "Nominal angulary velocity of shaft";
          parameter SI.Angle delta_start "Loaded angle start value";
          parameter SI.AngularVelocity omega_start
            "Angulaty velocity of shaft start value";

          SI.AngularVelocity omega(start=omega_start) "Shaft angular velocity";
          SI.Conversions.NonSIunits.AngularVelocity_rpm n "Rotational speed";
          SI.Angle delta(start=delta_start) "Loaded angle";
          SI.AngularVelocity d_delta "Variation of loaded angle";
          SI.AngularVelocity omegaGrid "Angulary velocity in the grid";
          SI.Power Pe "Outlet electric power";
          SI.Power Pm "Inlet mechanical power";
          Real M "Auxiliary variable";
          Real D "Auxiliary variable";

          Electrical.PowerConnection powerConnection
                                            annotation (Placement(
                transformation(extent={{58,-14},{86,14}}, rotation=0)));
          Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                  rotation=0)));
          Modelica.Blocks.Interfaces.BooleanInput closed
            annotation (Placement(transformation(
                origin={0,68},
                extent={{-10,-10},{10,10}},
                rotation=270)));
          Modelica.Blocks.Interfaces.RealOutput delta_out
            annotation (Placement(transformation(
                origin={0,-68},
                extent={{-10,-10},{10,10}},
                rotation=270)));
        equation
          M=J/(Np^2)*omega_nom*Np;
          D=2*r*sqrt(Pmax*J*omega_nom*Np/(Np^2));
          omega=der(shaft.phi);
          Pm=omega*shaft.tau;
          n = Modelica.SIunits.Conversions.to_rpm(omega)
            "Rotational speed in rpm";
          omegaGrid = 2*Modelica.Constants.pi*powerConnection.f;
          powerConnection.W = - Pe;

          //Definition loaded angle
          d_delta = omega*Np - omegaGrid;
          der(delta) = d_delta;

          //swing equation
          M*der(d_delta) + D*d_delta = Pm - Pe/eta;
          if closed then
            Pe = Pmax*Modelica.Math.sin(delta);
          else
            //Free turbine and not connection a grid
            Pe = 0;
          end if;

          //Output signal
          delta_out = delta - integer(delta/(2*Modelica.Constants.pi))*2*Modelica.Constants.pi;

          annotation (Icon(graphics={
                Rectangle(
                  extent={{-60,8},{-90,-8}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={175,175,175}),
                Ellipse(
                  extent={{-60,60},{60,-60}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={230,230,230},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-60,60},{60,-20}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={230,230,230},
                  fillPattern=FillPattern.Solid,
                  textString=
                       "G"),
                Text(
                  extent={{-60,-10},{60,-50}},
                  lineColor={0,127,0},
                  textString=
                       "SE")}),
                              Diagram(graphics),
                             Diagram);
        end Generator_SE_Breaker;

      end OldElementsSwingEquation;
    end Components;

    package Examples "Example implementations"
      model SingleShaft_static
        "Alternator group in configuration single-shaft (one generator)"
        extends
          ThermoPower.PowerPlants.ElectricGeneratorGroup.Interfaces.SingleShaft;

        Electrical.Grid grid(fn=fn, Pn=Pn) annotation (Placement(transformation(
                extent={{100,-20},{140,20}}, rotation=0)));
        Electrical.Generator generator(eta=eta, initOpt=if SSInit then
              ThermoPower.Choices.Init.Options.steadyState else ThermoPower.Choices.Init.Options.noInit)
                 annotation (Placement(transformation(extent={{-78,-30},{-18,30}},
                rotation=0)));
        Components.PowerSensor powerSensor annotation (Placement(transformation(
                extent={{12,-8},{28,8}}, rotation=0)));
        Components.FrequencySensor frequencySensor
          annotation (Placement(transformation(extent={{10,-68},{26,-52}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Inertia inertia(
                                                      J=J_shaft,
          a(fixed=if ((Options.steadyState) == 2 or (Options.steadyState) == 6
                 or (Options.steadyState) == 7 or (Options.steadyState) == 8
                 or (Options.steadyState) == 9) then true else false),
          phi(fixed=if ((Options.steadyState) == 3 or (Options.steadyState) ==
                4 or (Options.steadyState) == 7 or (Options.steadyState) == 9) then
                      true else false),
          w(fixed=if ((Options.steadyState) == 2 or (Options.steadyState) == 3
                 or (Options.steadyState) == 5 or (Options.steadyState) == 8
                 or (Options.steadyState) == 9) then true else false, start=
                omega_nom))
          annotation (Placement(transformation(extent={{-120,-10},{-100,10}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Damper damper(
                                                    d=d_shaft)
          annotation (Placement(transformation(extent={{-118,-70},{-98,-50}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(extent={{-80,-80},{-60,-60}},
                rotation=0)));
        Electrical.Breaker breaker annotation (Placement(transformation(extent=
                  {{48,20},{88,-20}}, rotation=0)));
      equation
        connect(inertia.flange_a, shaft) annotation (Line(
            points={{-120,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(damper.flange_a, shaft) annotation (Line(
            points={{-118,-60},{-140,-60},{-140,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(damper.flange_b,fixed.flange)    annotation (Line(
            points={{-98,-60},{-70,-60},{-70,-70}},
            color={0,0,0},
            thickness=0.5));
        connect(generator.powerConnection, powerSensor.port_a) annotation (Line(
            points={{-22.2,5.32907e-016},{0.6,5.32907e-016},{0.6,0},{12,0}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(frequencySensor.port, generator.powerConnection) annotation (Line(
            points={{10,-60},{0,-60},{0,5.32907e-016},{-22.2,5.32907e-016}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(powerSensor.port_b, breaker.connection1) annotation (Line(
            points={{28,-0.16},{34,-0.16},{34,-3.55271e-016},{50.8,
                -3.55271e-016}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(breaker.connection2, grid.connection) annotation (Line(
            points={{85.2,-3.55271e-016},{86,-3.1606e-022},{86,0},{94,0},{94,
                3.55271e-016},{102.8,3.55271e-016}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(ActuatorsBus.breakerClosed, breaker.closed) annotation (Line(
              points={{200,-140},{68,-140},{68,-16}}, color={213,255,170}));
        connect(SensorsBus.power, powerSensor.W) annotation (Line(points={{200,-80},
                {100,-80},{100,-40},{20,-40},{20,-7.52}},        color={255,170,
                213}));
        connect(SensorsBus.frequency, frequencySensor.f) annotation (Line(
              points={{200,-80},{100,-80},{100,-60},{26.16,-60}},   color={255,
                170,213}));
        connect(generator.shaft, inertia.flange_b) annotation (Line(
            points={{-73.8,5.32907e-016},{-85.9,5.32907e-016},{-85.9,0},{-100,0}},
            color={0,0,0},
            thickness=0.5));

        annotation (Diagram(graphics));
      end SingleShaft_static;

      model DoubleShaft_static
        "Alternator group in configuration double-shaft (two generator)"
        extends
          ThermoPower.PowerPlants.ElectricGeneratorGroup.Interfaces.DoubleShaft;
        Electrical.Generator generator_A(eta=eta_A, initOpt=if SSInit then
              ThermoPower.Choices.Init.Options.steadyState else ThermoPower.Choices.Init.Options.noInit)
                                       annotation (Placement(transformation(
                extent={{-80,70},{-20,130}}, rotation=0)));
        Modelica.Mechanics.Rotational.Components.Inertia inertia_A(
                                                        J=J_shaft_A, w(start=
                omega_nom_A))
          annotation (Placement(transformation(extent={{-120,90},{-100,110}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Damper damper_A(
                                                      d=d_shaft_A)
          annotation (Placement(transformation(extent={{-120,10},{-100,30}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(extent={{-50,-46},{-30,-26}},
                rotation=0)));
        Electrical.Breaker breaker_A
                                   annotation (Placement(transformation(extent=
                  {{60,120},{100,80}}, rotation=0)));
        Electrical.Generator generator_B(eta=eta_B, initOpt=if SSInit then
              ThermoPower.Choices.Init.Options.steadyState else ThermoPower.Choices.Init.Options.noInit)
                                        annotation (Placement(transformation(
                extent={{-80,-130},{-20,-70}}, rotation=0)));
        Modelica.Mechanics.Rotational.Components.Inertia inertia_B(
                                                        J=J_shaft_B, w(start=
                omega_nom_B))
          annotation (Placement(transformation(extent={{-120,-110},{-100,-90}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Damper damper_B(
                                                      d=d_shaft_B)
          annotation (Placement(transformation(extent={{-120,-30},{-100,-10}},
                rotation=0)));
        Electrical.Breaker breaker_B
                                    annotation (Placement(transformation(extent=
                 {{60,-120},{100,-80}}, rotation=0)));
        Components.PowerSensor powerSensor_A
                                            annotation (Placement(
              transformation(extent={{10,90},{30,110}}, rotation=0)));
        Components.FrequencySensor frequencySensor_A
          annotation (Placement(transformation(extent={{10,160},{30,180}},
                rotation=0)));
        Components.PowerSensor powerSensor_B
                                            annotation (Placement(
              transformation(extent={{10,-110},{30,-90}}, rotation=0)));
        Components.FrequencySensor frequencySensor_B
          annotation (Placement(transformation(extent={{8,-170},{28,-150}},
                rotation=0)));
        ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.Grid_2in grid(
            Pn=Pn, fn=fn)
                   annotation (Placement(transformation(extent={{140,0},{180,40}},
                rotation=0)));
      equation
        connect(inertia_B.flange_a, shaft_B) annotation (Line(
            points={{-120,-100},{-200,-100}},
            color={0,0,0},
            thickness=0.5));
        connect(generator_B.shaft, inertia_B.flange_b) annotation (Line(
            points={{-75.8,-100},{-100,-100}},
            color={0,0,0},
            thickness=0.5));
        connect(powerSensor_B.port_a, generator_B.powerConnection)
                                                                  annotation (Line(
            points={{10,-100},{-24.2,-100}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(frequencySensor_B.port, generator_B.powerConnection)
                                                                    annotation (Line(
            points={{8,-160},{0,-160},{0,-100},{-24.2,-100}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(breaker_B.connection1, powerSensor_B.port_b)
                                                           annotation (Line(
            points={{62.8,-100},{35.7,-100},{35.7,-100.2},{30,-100.2}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(breaker_A.connection1, powerSensor_A.port_b)
                                                          annotation (Line(
            points={{62.8,100},{35.7,100},{35.7,99.8},{30,99.8}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(powerSensor_A.port_a, generator_A.powerConnection)
                                                                  annotation (Line(
            points={{10,100},{-24.2,100}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(frequencySensor_A.port, generator_A.powerConnection)
                                                                    annotation (Line(
            points={{10,170},{0,170},{0,100},{-24.2,100}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(damper_B.flange_a, shaft_B) annotation (Line(
            points={{-120,-20},{-140,-20},{-140,-100},{-200,-100}},
            color={0,0,0},
            thickness=0.5));
        connect(damper_B.flange_b,fixed.flange)    annotation (Line(
            points={{-100,-20},{-40,-20},{-40,-36}},
            color={0,0,0},
            thickness=0.5));
        connect(damper_A.flange_b,fixed.flange)    annotation (Line(
            points={{-100,20},{-40,20},{-40,-36}},
            color={0,0,0},
            thickness=0.5));
        connect(damper_A.flange_a, shaft_A) annotation (Line(
            points={{-120,20},{-140,20},{-140,100},{-202,100}},
            color={0,0,0},
            thickness=0.5));
        connect(inertia_A.flange_a, shaft_A) annotation (Line(
            points={{-120,100},{-202,100}},
            color={0,0,0},
            thickness=0.5));
        connect(inertia_A.flange_b, generator_A.shaft) annotation (Line(
            points={{-100,100},{-75.8,100}},
            color={0,0,0},
            thickness=0.5));
        connect(ActuatorsBus.breakerClosed_shaftA, breaker_A.closed)
          annotation (Line(points={{200,-140},{110,-140},{110,0},{80,0},{80,84}},
              color={213,255,170}));
        connect(ActuatorsBus.breakerClosed_shaftB, breaker_B.closed)
          annotation (Line(points={{200,-140},{110,-140},{110,0},{80,0},{80,-84}},
              color={213,255,170}));
        connect(SensorsBus.power_shaftA, powerSensor_A.W) annotation (Line(
              points={{200,-80},{140,-80},{140,-140},{40,-140},{40,40},{20,40},
                {20,90.6}}, color={255,170,213}));
        connect(SensorsBus.power_shaftB, powerSensor_B.W) annotation (Line(
              points={{200,-80},{140,-80},{140,-140},{20,-140},{20,-109.4}},
              color={255,170,213}));
        connect(SensorsBus.frequency_shaftA, frequencySensor_A.f) annotation (Line(
              points={{200,-80},{140,-80},{140,-140},{40,-140},{40,170},{30.2,
                170}}, color={255,170,213}));
        connect(SensorsBus.frequency_shaftB, frequencySensor_B.f) annotation (Line(
              points={{200,-80},{140,-80},{140,-140},{60,-140},{60,-160},{28.2,
                -160}},      color={255,170,213}));
        connect(grid.connection_B, breaker_B.connection2) annotation (Line(
            points={{142.8,12},{120,12},{120,-100},{97.2,-100}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(grid.connection_A, breaker_A.connection2) annotation (Line(
            points={{142.8,28},{120,28},{120,100},{97.2,100}},
            pattern=LinePattern.None,
            thickness=0.5));
        annotation (Diagram(graphics));
      end DoubleShaft_static;

      model TripleShaft_static
        "Alternator group in configuration triple-shaft (three generator)"
        extends
          ThermoPower.PowerPlants.ElectricGeneratorGroup.Interfaces.TripleShaft;
        Electrical.Generator generator_A(eta=eta_A, initOpt=if SSInit then
              ThermoPower.Choices.Init.Options.steadyState else ThermoPower.Choices.Init.Options.noInit)
                                       annotation (Placement(transformation(
                extent={{-80,90},{-20,150}}, rotation=0)));
        Components.PowerSensor powerSensor_A
                                           annotation (Placement(transformation(
                extent={{20,110},{40,130}}, rotation=0)));
        Components.FrequencySensor frequencySensor_A
          annotation (Placement(transformation(extent={{20,150},{40,170}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Inertia inertia_A(
                                                        J=J_shaft_A, w(start=
                omega_nom_A))
          annotation (Placement(transformation(extent={{-140,110},{-120,130}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Damper damper_A(
                                                      d=d_shaft_A)
          annotation (Placement(transformation(extent={{-140,70},{-120,90}},
                rotation=0)));
        Electrical.Breaker breaker_A
                                   annotation (Placement(transformation(extent=
                  {{60,100},{100,140}}, rotation=0)));
        Electrical.Generator generator_B(eta=eta_B, initOpt=if SSInit then
              ThermoPower.Choices.Init.Options.steadyState else ThermoPower.Choices.Init.Options.noInit)
                                        annotation (Placement(transformation(
                extent={{-80,-30},{-20,30}}, rotation=0)));
        Components.PowerSensor powerSensor_B
                                            annotation (Placement(
              transformation(extent={{20,-10},{40,10}}, rotation=0)));
        Components.FrequencySensor frequencySensor_B
          annotation (Placement(transformation(extent={{20,30},{40,50}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Inertia inertia_B(
                                                        J=J_shaft_B, w(start=
                omega_nom_B))
          annotation (Placement(transformation(extent={{-140,-10},{-120,10}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Damper damper_B(
                                                      d=d_shaft_B)
          annotation (Placement(transformation(extent={{-140,-50},{-120,-30}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(extent={{-110,-186},{-90,-166}},
                rotation=0)));
        Electrical.Breaker breaker_B
                                    annotation (Placement(transformation(extent=
                 {{60,-20},{100,20}}, rotation=0)));
        Electrical.Generator generator_C(eta=eta_C, initOpt=if SSInit then
              ThermoPower.Choices.Init.Options.steadyState else ThermoPower.Choices.Init.Options.noInit)
                                        annotation (Placement(transformation(
                extent={{-80,-150},{-20,-90}}, rotation=0)));
        Components.PowerSensor powerSensor_C
                                            annotation (Placement(
              transformation(extent={{20,-130},{40,-110}}, rotation=0)));
        Components.FrequencySensor frequencySensor_C
          annotation (Placement(transformation(extent={{20,-90},{40,-70}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Inertia inertia_C(
                                                        J=J_shaft_C, w(start=
                omega_nom_C))
          annotation (Placement(transformation(extent={{-140,-130},{-120,-110}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Damper damper_C(
                                                      d=d_shaft_C)
          annotation (Placement(transformation(extent={{-140,-170},{-120,-150}},
                rotation=0)));
        Electrical.Breaker breaker_C
                                    annotation (Placement(transformation(extent=
                 {{60,-140},{100,-100}}, rotation=0)));
        Components.Grid_3in grid_3in(Pn=Pn, fn=fn)
          annotation (Placement(transformation(extent={{140,-20},{180,20}},
                rotation=0)));
      equation
        connect(fixed.flange,   damper_B.flange_b) annotation (Line(
            points={{-100,-176},{-100,-40},{-120,-40}},
            color={0,0,0},
            thickness=0.5));
        connect(damper_C.flange_b,fixed.flange)    annotation (Line(
            points={{-120,-160},{-100,-160},{-100,-176}},
            color={0,0,0},
            thickness=0.5));
        connect(fixed.flange,   damper_A.flange_b) annotation (Line(
            points={{-100,-176},{-100,80},{-120,80}},
            color={0,0,0},
            thickness=0.5));
        connect(inertia_C.flange_b, generator_C.shaft) annotation (Line(
            points={{-120,-120},{-75.8,-120}},
            color={0,0,0},
            thickness=0.5));
        connect(generator_C.powerConnection, powerSensor_C.port_a) annotation (Line(
            points={{-24.2,-120},{20,-120}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(powerSensor_C.port_b, breaker_C.connection1) annotation (Line(
            points={{40,-120.2},{48,-120.2},{48,-120},{62.8,-120}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(breaker_B.connection1, powerSensor_B.port_b) annotation (Line(
            points={{62.8,3.55271e-016},{53.55,3.55271e-016},{53.55,-0.2},{40,
                -0.2}},
            pattern=LinePattern.None,
            thickness=0.5));

        connect(powerSensor_B.port_a, generator_B.powerConnection) annotation (Line(
            points={{20,0},{13.6,0},{13.6,5.32907e-016},{-24.2,5.32907e-016}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(generator_B.shaft, inertia_B.flange_b) annotation (Line(
            points={{-75.8,5.32907e-016},{-76,5.32907e-016},{-76,0},{-120,0}},
            color={0,0,0},
            thickness=0.5));
        connect(inertia_B.flange_a, shaft_B) annotation (Line(
            points={{-140,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(inertia_C.flange_a, shaft_C) annotation (Line(
            points={{-140,-120},{-200,-120}},
            color={0,0,0},
            thickness=0.5));
        connect(inertia_A.flange_a, shaft_A) annotation (Line(
            points={{-140,120},{-200,120}},
            color={0,0,0},
            thickness=0.5));
        connect(inertia_A.flange_b, generator_A.shaft) annotation (Line(
            points={{-120,120},{-75.8,120}},
            color={0,0,0},
            thickness=0.5));
        connect(generator_A.powerConnection, powerSensor_A.port_a) annotation (Line(
            points={{-24.2,120},{20,120}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(powerSensor_A.port_b, breaker_A.connection1) annotation (Line(
            points={{40,119.8},{48,119.8},{48,120},{62.8,120}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(frequencySensor_A.port, generator_A.powerConnection)
          annotation (Line(
            points={{20,160},{0,160},{0,120},{-24.2,120}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(frequencySensor_B.port, generator_B.powerConnection)
          annotation (Line(
            points={{20,40},{0,40},{0,0},{-6,0},{-6,5.32907e-016},{-24.2,
                5.32907e-016}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(frequencySensor_C.port, generator_C.powerConnection)
          annotation (Line(
            points={{20,-80},{0,-80},{0,-120},{-24.2,-120}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(damper_C.flange_a, shaft_C) annotation (Line(
            points={{-140,-160},{-160,-160},{-160,-120},{-200,-120}},
            color={0,0,0},
            thickness=0.5));
        connect(damper_B.flange_a, shaft_B) annotation (Line(
            points={{-140,-40},{-160,-40},{-160,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(damper_A.flange_a, shaft_A) annotation (Line(
            points={{-140,80},{-160,80},{-160,120},{-200,120}},
            color={0,0,0},
            thickness=0.5));
        connect(ActuatorsBus.breakerClosed_shaftC, breaker_C.closed)
          annotation (Line(points={{200,-140},{110,-140},{110,-80},{80,-80},{80,
                -104}}, color={213,255,170}));
        connect(ActuatorsBus.breakerClosed_shaftB, breaker_B.closed)
          annotation (Line(points={{200,-140},{110,-140},{110,40},{80,40},{80,
                16}}, color={213,255,170}));
        connect(ActuatorsBus.breakerClosed_shaftA, breaker_A.closed)
          annotation (Line(points={{200,-140},{110,-140},{110,150},{80,150},{80,
                136}}, color={213,255,170}));
        connect(SensorsBus.power_shaftC, powerSensor_C.W) annotation (Line(
              points={{200,-80},{160,-80},{160,-60},{54,-60},{54,-100},{30,-100},
                {30,-129.4}},       color={255,170,213}));
        connect(SensorsBus.frequency_shaftC, frequencySensor_C.f) annotation (Line(
              points={{200,-80},{160,-80},{160,-60},{54,-60},{54,-80},{40.2,-80}},
                       color={255,170,213}));
        connect(SensorsBus.power_shaftB, powerSensor_B.W) annotation (Line(
              points={{200,-80},{160,-80},{160,-60},{54,-60},{54,-20},{30,-20},
                {30,-9.4}}, color={255,170,213}));
        connect(SensorsBus.frequency_shaftB, frequencySensor_B.f) annotation (Line(
              points={{200,-80},{160,-80},{160,-60},{54,-60},{54,40},{40.2,40}},
              color={255,170,213}));
        connect(SensorsBus.power_shaftA, powerSensor_A.W) annotation (Line(
              points={{200,-80},{160,-80},{160,-60},{54,-60},{54,100},{30,100},
                {30,110.6}}, color={255,170,213}));
        connect(SensorsBus.frequency_shaftA, frequencySensor_A.f) annotation (Line(
              points={{200,-80},{160,-80},{160,-60},{54,-60},{54,160},{40.2,160}},
                       color={255,170,213}));
        connect(grid_3in.connection_B, breaker_B.connection2) annotation (Line(
            points={{142.8,3.55271e-016},{96,-3.1606e-022},{96,3.55271e-016},{
                97.2,3.55271e-016}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(grid_3in.connection_C, breaker_C.connection2) annotation (Line(
            points={{142.8,-16},{120,-16},{120,-120},{97.2,-120}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(grid_3in.connection_A, breaker_A.connection2) annotation (Line(
            points={{142.8,16},{120,16},{120,120},{97.2,120}},
            pattern=LinePattern.None,
            thickness=0.5));
        annotation (Diagram(graphics));
      end TripleShaft_static;

      model GeneratorGroup
        "Alternator group in configuration single-shaft (one generator)"
        extends Interfaces.SingleShaft( final Pn = 0, final omega_nom = 0);
        parameter Modelica.SIunits.Power Pmax "Outlet maximum power";
        parameter Real r_electrical=0.2
          "Electrical damping of generator/shaft system";
        parameter Modelica.SIunits.Angle delta_start = 0
          "Loaded angle start value";

        ThermoPower.Electrical.PowerSensor powerSensor
                                           annotation (Placement(transformation(
                extent={{20,-10},{40,10}}, rotation=0)));
        ThermoPower.Electrical.FrequencySensor frequencySensor
          annotation (Placement(transformation(extent={{20,40},{40,60}},
                rotation=0)));
        ThermoPower.Electrical.Generator generator(eta=eta, J=J_shaft,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit)
                                  annotation (Placement(transformation(extent={
                  {-100,-30},{-40,30}}, rotation=0)));
        ThermoPower.Electrical.NetworkGrid_Pmax network(
          hasBreaker=true,
          Pmax=Pmax,
          J=J_shaft,
          deltaStart=delta_start,
          fnom=fn,
          r=r_electrical,
          initOpt=if SSInit then ThermoPower.Choices.Init.Options.steadyState else
                    ThermoPower.Choices.Init.Options.noInit)
               annotation (Placement(transformation(extent={{80,-20},{120,20}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Damper damper(
                                                    d=d_shaft)
          annotation (Placement(transformation(extent={{-100,-60},{-80,-40}},
                rotation=0)));
        Modelica.Mechanics.Rotational.Components.Fixed fixed
          annotation (Placement(transformation(extent={{-50,-86},{-30,-66}},
                rotation=0)));
      equation
        connect(SensorsBus.power, powerSensor.W) annotation (Line(points={{200,-80},
                {30,-80},{30,-9.4}},        color={255,170,213}));
        connect(SensorsBus.frequency, frequencySensor.f) annotation (Line(
              points={{200,-80},{60,-80},{60,50},{40.2,50}},   color={255,170,
                213}));
        connect(generator.shaft, shaft)    annotation (Line(
            points={{-95.8,5.32907e-016},{-100,5.32907e-016},{-100,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));

        connect(generator.powerConnection, powerSensor.port_a)    annotation (Line(
            points={{-44.2,5.32907e-016},{20,5.32907e-016},{20,0}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(frequencySensor.port, generator.powerConnection)    annotation (Line(
            points={{20,50},{-20,50},{-20,5.32907e-016},{-44.2,5.32907e-016}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(network.powerConnection, powerSensor.port_b) annotation (Line(
            points={{80,3.55271e-016},{40,3.55271e-016},{40,-0.2}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(ActuatorsBus.ConnectedGenerator, network.closed) annotation (Line(
              points={{200,-140},{140,-140},{140,40},{100,40},{100,19.4}},
              color={213,255,170}));
        connect(damper.flange_a, shaft) annotation (Line(
            points={{-100,-50},{-140,-50},{-140,0},{-200,0}},
            color={0,0,0},
            thickness=0.5));
        connect(fixed.flange,   damper.flange_b) annotation (Line(
            points={{-40,-76},{-40,-50},{-80,-50}},
            color={0,0,0},
            thickness=0.5));
        connect(SensorsBus.loadedAngle, network.delta_out) annotation (Line(
              points={{200,-80},{100,-80},{100,-18}},   color={255,170,213}));
        annotation (Diagram(graphics));
      end GeneratorGroup;

      package OldSwingEquation
        model SingleShaft_SE
          "Alternator group in configuration single-shaft (one generator)"
          extends
            ThermoPower.PowerPlants.ElectricGeneratorGroup.Interfaces.SingleShaft;
          parameter SI.Power Pmax "Outlet maximum power";
          parameter SI.Angle delta_start "Loaded angle start value";

          Electrical.Grid grid(fn=fn, Pn=Pn) annotation (Placement(
                transformation(extent={{60,-20},{100,20}}, rotation=0)));
          Components.PowerSensor powerSensor annotation (Placement(
                transformation(extent={{0,-10},{20,10}}, rotation=0)));
          Components.FrequencySensor frequencySensor
            annotation (Placement(transformation(extent={{0,20},{20,40}},
                  rotation=0)));
          ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.OldElementsSwingEquation.Generator_SE
            generator_SE(
            eta=eta,
            Pmax=Pmax,
            J=J_shaft,
            delta_start=delta_start,
            omega_nom=omega_nom)    annotation (Placement(transformation(extent=
                   {{-120,-30},{-60,30}}, rotation=0)));
        equation
          connect(SensorsBus.power, powerSensor.W) annotation (Line(points={{
                  200,-100},{10,-100},{10,-9.4}}, color={255,170,213}));
          connect(SensorsBus.frequency, frequencySensor.f) annotation (Line(
                points={{200,-100},{34,-100},{34,30},{20.2,30}}, color={255,170,
                  213}));
          connect(generator_SE.shaft, shaft) annotation (Line(
              points={{-117,0},{-200,0}},
              color={0,0,0},
              thickness=0.5));
          connect(generator_SE.powerConnection, powerSensor.port_a) annotation (Line(
              points={{-68.4,5.32907e-016},{-8.8,5.32907e-016},{-8.8,0},{0,0}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(powerSensor.port_b, grid.connection) annotation (Line(
              points={{20,-0.2},{48,-0.2},{48,3.55271e-016},{62.8,3.55271e-016}},
              pattern=LinePattern.None,
              thickness=0.5));

          connect(frequencySensor.port, generator_SE.powerConnection) annotation (Line(
              points={{0,30},{-20,30},{-20,5.32907e-016},{-68.4,5.32907e-016}},
              pattern=LinePattern.None,
              thickness=0.5));
          annotation (Diagram(graphics));
        end SingleShaft_SE;

        model DoubleShaft_SE
          "Alternator group in configuration double-shaft (two generator)"
          extends
            ThermoPower.PowerPlants.ElectricGeneratorGroup.Interfaces.DoubleShaft;
          parameter SI.Power Pmax_A "Outlet maximum power" annotation (Dialog(group = "Generator-Shaft A"));
          parameter SI.Angle delta_start_A "Loaded angle start value"
                                           annotation (Dialog(group = "Generator-Shaft A"));
          parameter SI.Power Pmax_B "Outlet maximum power" annotation (Dialog(group = "Generator-Shaft B"));
          parameter SI.Angle delta_start_B "Loaded angle start value"
                                           annotation (Dialog(group = "Generator-Shaft B"));

          Components.PowerSensor powerSensor_A
                                              annotation (Placement(
                transformation(extent={{20,90},{40,110}}, rotation=0)));
          Components.FrequencySensor frequencySensor_A
            annotation (Placement(transformation(extent={{20,130},{40,150}},
                  rotation=0)));
          Components.PowerSensor powerSensor_B
                                              annotation (Placement(
                transformation(extent={{20,-110},{40,-90}}, rotation=0)));
          Components.FrequencySensor frequencySensor_B
            annotation (Placement(transformation(extent={{20,-70},{40,-50}},
                  rotation=0)));
          ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.Grid_2in
            grid(
              Pn=Pn, fn=fn)
                     annotation (Placement(transformation(extent={{140,-20},{
                    178,20}}, rotation=0)));
          Components.OldElementsSwingEquation.Generator_SE generator_SE_A(
            eta=eta_A,
            Pmax=Pmax_A,
            J=J_shaft_A,
            delta_start=delta_start_A,
            omega_nom=omega_nom_A)    annotation (Placement(transformation(
                  extent={{-100,70},{-40,130}}, rotation=0)));
          ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.OldElementsSwingEquation.Generator_SE
            generator_SE_B(
            eta=eta_B,
            Pmax=Pmax_B,
            J=J_shaft_B,
            delta_start=delta_start_B,
            omega_nom=omega_nom_B)    annotation (Placement(transformation(
                  extent={{-100,-130},{-40,-70}}, rotation=0)));

        equation
          connect(SensorsBus.power_shaftA, powerSensor_A.W) annotation (Line(
                points={{200,-100},{140,-100},{140,-60},{80,-60},{80,40},{30,40},
                  {30,90.6}}, color={255,170,213}));
          connect(SensorsBus.power_shaftB, powerSensor_B.W) annotation (Line(
                points={{200,-100},{140,-100},{140,-120},{30,-120},{30,-109.4}},
                color={255,170,213}));
          connect(SensorsBus.frequency_shaftA, frequencySensor_A.f) annotation (Line(
                points={{200,-100},{140,-100},{140,-60},{80,-60},{80,140},{40.2,
                  140}}, color={255,170,213}));
          connect(SensorsBus.frequency_shaftB, frequencySensor_B.f) annotation (Line(
                points={{200,-100},{140,-100},{140,-60},{40.2,-60}}, color={255,
                  170,213}));
          connect(powerSensor_B.port_b, grid.connection_B) annotation (Line(
              points={{40,-100.2},{46,-100.2},{46,-100},{100,-100},{100,-8},{
                  142.66,-8}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(grid.connection_A, powerSensor_A.port_b) annotation (Line(
              points={{142.66,8},{100,8},{100,99.8},{40,99.8}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(generator_SE_B.powerConnection, powerSensor_B.port_a)
            annotation (Line(
              points={{-48.4,-100},{20,-100}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(frequencySensor_B.port, generator_SE_B.powerConnection)
            annotation (Line(
              points={{20,-60},{0,-60},{0,-100},{-48.4,-100}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(powerSensor_A.port_a, generator_SE_A.powerConnection)
            annotation (Line(
              points={{20,100},{-48.4,100}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(frequencySensor_A.port, generator_SE_A.powerConnection)
            annotation (Line(
              points={{20,140},{0,140},{0,100},{-48.4,100}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(generator_SE_A.shaft, shaft_A) annotation (Line(
              points={{-97,100},{-202,100}},
              color={0,0,0},
              thickness=0.5));
          connect(generator_SE_B.shaft, shaft_B) annotation (Line(
              points={{-97,-100},{-200,-100}},
              color={0,0,0},
              thickness=0.5));
          annotation (Diagram(graphics));
        end DoubleShaft_SE;

        model TripleShaft_SE
          "Alternator group in configuration triple-shaft (three generator)"
          extends
            ThermoPower.PowerPlants.ElectricGeneratorGroup.Interfaces.TripleShaft;
          parameter SI.Power Pmax_A "Outlet maximum power" annotation (Dialog(group = "Generator-Shaft A"));
          parameter SI.Angle delta_start_A "Loaded angle start value"
                                           annotation (Dialog(group = "Generator-Shaft A"));
          parameter SI.Power Pmax_B "Outlet maximum power" annotation (Dialog(group = "Generator-Shaft B"));
          parameter SI.Angle delta_start_B "Loaded angle start value"
                                           annotation (Dialog(group = "Generator-Shaft B"));
          parameter SI.Power Pmax_C "Outlet maximum power" annotation (Dialog(group = "Generator-Shaft C"));
          parameter SI.Angle delta_start_C "Loaded angle start value"
                                           annotation (Dialog(group = "Generator-Shaft C"));

          Components.PowerSensor powerSensor_A
                                             annotation (Placement(
                transformation(extent={{10,110},{30,130}}, rotation=0)));
          Components.FrequencySensor frequencySensor_A
            annotation (Placement(transformation(extent={{10,150},{30,170}},
                  rotation=0)));
          Components.PowerSensor powerSensor_B
                                              annotation (Placement(
                transformation(extent={{10,-10},{30,10}}, rotation=0)));
          Components.FrequencySensor frequencySensor_B
            annotation (Placement(transformation(extent={{10,30},{30,50}},
                  rotation=0)));
          Components.PowerSensor powerSensor_C
                                              annotation (Placement(
                transformation(extent={{10,-130},{30,-110}}, rotation=0)));
          Components.FrequencySensor frequencySensor_C
            annotation (Placement(transformation(extent={{10,-90},{30,-70}},
                  rotation=0)));
          Components.Grid_3in grid_3in(Pn=Pn, fn=fn)
            annotation (Placement(transformation(extent={{140,-20},{180,20}},
                  rotation=0)));
          ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.OldElementsSwingEquation.Generator_SE
            generator_SE_A(
            eta=eta_A,
            Pmax=Pmax_A,
            J=J_shaft_A,
            delta_start=delta_start_A,
            omega_nom=omega_nom_A)    annotation (Placement(transformation(
                  extent={{-120,90},{-60,150}}, rotation=0)));
          ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.OldElementsSwingEquation.Generator_SE
            generator_SE_B(
            eta=eta_B,
            Pmax=Pmax_B,
            J=J_shaft_B,
            delta_start=delta_start_B,
            omega_nom=omega_nom_B)    annotation (Placement(transformation(
                  extent={{-120,-30},{-60,30}}, rotation=0)));
          ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.OldElementsSwingEquation.Generator_SE
            generator_SE_B1(
            eta=eta_C,
            Pmax=Pmax_C,
            J=J_shaft_C,
            delta_start=delta_start_C,
            omega_nom=omega_nom_C)    annotation (Placement(transformation(
                  extent={{-120,-150},{-60,-90}}, rotation=0)));
        equation
          connect(SensorsBus.power_shaftC, powerSensor_C.W) annotation (Line(
                points={{200,-100},{120,-100},{120,-140},{20,-140},{20,-129.4}},
                color={255,170,213}));
          connect(SensorsBus.frequency_shaftC, frequencySensor_C.f) annotation (Line(
                points={{200,-100},{60,-100},{60,-80},{30.2,-80}}, color={255,
                  170,213}));
          connect(SensorsBus.power_shaftB, powerSensor_B.W) annotation (Line(
                points={{200,-100},{60,-100},{60,-20},{20,-20},{20,-9.4}},
                color={255,170,213}));
          connect(SensorsBus.frequency_shaftB, frequencySensor_B.f) annotation (Line(
                points={{200,-100},{60,-100},{60,40},{30.2,40}}, color={255,170,
                  213}));
          connect(SensorsBus.power_shaftA, powerSensor_A.W) annotation (Line(
                points={{200,-100},{60,-100},{60,100},{20,100},{20,110.6}},
                color={255,170,213}));
          connect(SensorsBus.frequency_shaftA, frequencySensor_A.f) annotation (Line(
                points={{200,-100},{60,-100},{60,160},{30.2,160}}, color={255,
                  170,213}));
          connect(generator_SE_B1.powerConnection, powerSensor_C.port_a)
            annotation (Line(
              points={{-68.4,-120},{10,-120}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(frequencySensor_C.port, generator_SE_B1.powerConnection)
            annotation (Line(
              points={{10,-80},{-20,-80},{-20,-120},{-68.4,-120}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(powerSensor_B.port_a, generator_SE_B.powerConnection)
            annotation (Line(
              points={{10,0},{-6.8,0},{-6.8,5.32907e-016},{-68.4,5.32907e-016}},
              pattern=LinePattern.None,
              thickness=0.5));

          connect(frequencySensor_B.port, generator_SE_B.powerConnection)
            annotation (Line(
              points={{10,40},{-20,40},{-20,5.32907e-016},{-68.4,5.32907e-016}},
              pattern=LinePattern.None,
              thickness=0.5));

          connect(powerSensor_A.port_a, generator_SE_A.powerConnection)
            annotation (Line(
              points={{10,120},{-68.4,120}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(frequencySensor_A.port, generator_SE_A.powerConnection)
            annotation (Line(
              points={{10,160},{-20,160},{-20,120},{-68.4,120}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(generator_SE_A.shaft, shaft_A) annotation (Line(
              points={{-117,120},{-200,120}},
              color={0,0,0},
              thickness=0.5));
          connect(generator_SE_B.shaft, shaft_B) annotation (Line(
              points={{-117,0},{-200,0}},
              color={0,0,0},
              thickness=0.5));
          connect(generator_SE_B1.shaft, shaft_C) annotation (Line(
              points={{-117,-120},{-200,-120}},
              color={0,0,0},
              thickness=0.5));
          connect(grid_3in.connection_A, powerSensor_A.port_b) annotation (Line(
              points={{142.8,16},{100,16},{100,119.8},{30,119.8}},
              pattern=LinePattern.None,
              thickness=0.5));
          connect(grid_3in.connection_B, powerSensor_B.port_b) annotation (Line(
              points={{142.8,3.55271e-016},{51.7,3.55271e-016},{51.7,-0.2},{30,-0.2}},
              pattern=LinePattern.None,
              thickness=0.5));

          connect(grid_3in.connection_C, powerSensor_C.port_b) annotation (Line(
              points={{142.8,-16},{100,-16},{100,-120.2},{30,-120.2}},
              pattern=LinePattern.None,
              thickness=0.5));
          annotation (Diagram(graphics));
        end TripleShaft_SE;
      end OldSwingEquation;
    end Examples;

    package Tests "Test cases"

      model Test_Generator_SE
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=67.6,
          wnom=67.6,
          eta_iso_nom=0.833,
          Kt=0.0032078,
          PRstart=5,
          pnom=12800000)
                      annotation (Placement(transformation(extent={{-80,-24},{
                  -48,8}}, rotation=0)));
        Water.SinkP sinkP(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{-44,34},{-32,46}},
                rotation=0)));
        Water.ValveVap valveHP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          CheckValve=true,
          wnom=67.6,
          Cv=1165,
          pnom=12960000,
          dpnom=160000)        annotation (Placement(transformation(
              origin={-76,24},
              extent={{6,6},{-6,-6}},
              rotation=90)));
        Water.SourceP sourceP(h=3.47e6, p0=1.296e7)
          annotation (Placement(transformation(extent={{-96,34},{-84,46}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Ramp com_valveHP_a(
          offset=0.2,
          startTime=5,
          height=+0.7,
          duration=3)
          annotation (Placement(transformation(extent={{0,76},{-12,88}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Ramp com_valveHP_b(
          offset=0,
          duration=5,
          height=-0.8,
          startTime=15)
          annotation (Placement(transformation(extent={{0,54},{-12,66}},
                rotation=0)));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(
              origin={-49,69},
              extent={{-7,-7},{7,7}},
              rotation=180)));
        ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.OldElementsSwingEquation.Generator_SE
          generator_SE(
          Pmax=30e6,
          eta=0.96,
          r=0.2,
          J=15000,
          delta_start=0.5073,
          omega_nom=157.08)
                     annotation (Placement(transformation(extent={{-30,-48},{50,
                  32}}, rotation=0)));
        Electrical.Grid grid(Pn=50e8, droop=0)
          annotation (Placement(transformation(extent={{66,-18},{86,2}},
                rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(sinkP.flange,steamTurbineStodola. outlet) annotation (Line(
              points={{-44,40},{-51.2,40},{-51.2,4.8}}, thickness=0.5,
            color={0,0,255}));
        connect(valveHP.outlet,steamTurbineStodola. inlet) annotation (Line(
              points={{-76,18},{-76,11.4},{-76,4.8},{-76.8,4.8}}, thickness=0.5,
            color={0,0,255}));
        connect(sourceP.flange,valveHP. inlet)
          annotation (Line(points={{-84,40},{-76,40},{-76,30}}, thickness=0.5,
            color={0,0,255}));
        connect(add.y, valveHP.theta) annotation (Line(points={{-56.7,69},{-62,
                69},{-62,24},{-71.2,24}}, color={0,0,127}));
        connect(com_valveHP_b.y, add.u1) annotation (Line(points={{-12.6,60},{
                -30,60},{-30,64},{-40.6,64},{-40.6,64.8}},
                                                         color={0,0,127}));
        connect(com_valveHP_a.y, add.u2) annotation (Line(points={{-12.6,82},{
                -30,82},{-30,74},{-40.6,74},{-40.6,73.2}}, color={0,0,127}));
        connect(generator_SE.shaft, steamTurbineStodola.shaft_b) annotation (Line(
            points={{-26,-8},{-53.76,-8}},
            color={0,0,0},
            thickness=0.5));
        connect(grid.connection, generator_SE.powerConnection) annotation (Line(
            points={{67.4,-8},{53.1,-8},{53.1,-8},{38.8,-8}},
            pattern=LinePattern.None,
            thickness=0.5));
        annotation (Diagram(graphics),
                             experiment(StopTime=32, NumberOfIntervals=50000));
      end Test_Generator_SE;

      model Test_Generator_SE_com
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=67.6,
          wnom=67.6,
          eta_iso_nom=0.833,
          Kt=0.0032078,
          PRstart=5,
          pnom=12800000)
                      annotation (Placement(transformation(extent={{-80,-24},{
                  -48,8}}, rotation=0)));
        Water.SinkP sinkP(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{-44,34},{-32,46}},
                rotation=0)));
        Water.ValveVap valveHP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          CheckValve=true,
          wnom=67.6,
          pnom=1.296e7,
          dpnom=1.6e5,
          Cv=1165)             annotation (Placement(transformation(
              origin={-76,24},
              extent={{6,6},{-6,-6}},
              rotation=90)));
        Water.SourceP sourceP(h=3.47e6, p0=1.296e7)
          annotation (Placement(transformation(extent={{-96,34},{-84,46}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Ramp com_valveHP_a(
          height=+0.8,
          offset=0.2,
          duration=5,
          startTime=1000)
          annotation (Placement(transformation(extent={{0,76},{-12,88}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Ramp com_valveHP_b(
          height=-0.9,
          offset=0,
          duration=5,
          startTime=2000)
          annotation (Placement(transformation(extent={{0,54},{-12,66}},
                rotation=0)));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(
              origin={-49,69},
              extent={{-7,-7},{7,7}},
              rotation=180)));
        ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.OldElementsSwingEquation.Generator_SE_com
          generator_SE(
          J=7000,
          delta_start=0.77,
          Pmax=20e6,
          r=0.2)     annotation (Placement(transformation(extent={{-30,-48},{50,
                  32}}, rotation=0)));
        Electrical.Grid grid(Pn=50e8, droop=0)
          annotation (Placement(transformation(extent={{66,-18},{86,2}},
                rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(sinkP.flange,steamTurbineStodola. outlet) annotation (Line(
              points={{-44,40},{-51.2,40},{-51.2,4.8}}, thickness=0.5,
            color={0,0,255}));
        connect(valveHP.outlet,steamTurbineStodola. inlet) annotation (Line(
              points={{-76,18},{-76,11.4},{-76,4.8},{-76.8,4.8}}, thickness=0.5,
            color={0,0,255}));
        connect(sourceP.flange,valveHP. inlet)
          annotation (Line(points={{-84,40},{-76,40},{-76,30}}, thickness=0.5,
            color={0,0,255}));
        connect(add.y, valveHP.theta) annotation (Line(points={{-56.7,69},{-62,
                69},{-62,24},{-71.2,24}}, color={0,0,127}));
        connect(com_valveHP_b.y, add.u1) annotation (Line(points={{-12.6,60},{
                -30,60},{-30,64},{-40.6,64},{-40.6,64.8}},
                                                         color={0,0,127}));
        connect(com_valveHP_a.y, add.u2) annotation (Line(points={{-12.6,82},{
                -30,82},{-30,74},{-40.6,74},{-40.6,73.2}}, color={0,0,127}));
        connect(generator_SE.shaft, steamTurbineStodola.shaft_b) annotation (Line(
            points={{-26,-8},{-53.76,-8}},
            color={0,0,0},
            thickness=0.5));
        connect(grid.connection, generator_SE.powerConnection) annotation (Line(
            points={{67.4,-8},{53.1,-8},{53.1,-8},{38.8,-8}},
            pattern=LinePattern.None,
            thickness=0.5));
        annotation (Diagram(graphics),
                             experiment(StopTime=3000, NumberOfIntervals=30000));
      end Test_Generator_SE_com;

      model Test_Generator_SE_breaker
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=67.6,
          wnom=67.6,
          eta_iso_nom=0.833,
          Kt=0.0032078,
          PRstart=5,
          pnom=12800000)
                      annotation (Placement(transformation(extent={{-80,-24},{
                  -48,8}}, rotation=0)));
        Water.SinkP sinkP(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{-44,34},{-32,46}},
                rotation=0)));
        Water.ValveVap valveHP(
          CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
          CheckValve=true,
          wnom=67.6,
          pnom=1.296e7,
          dpnom=1.6e5,
          Cv=1165)             annotation (Placement(transformation(
              origin={-76,24},
              extent={{6,6},{-6,-6}},
              rotation=90)));
        Water.SourceP sourceP(h=3.47e6, p0=1.296e7)
          annotation (Placement(transformation(extent={{-96,34},{-84,46}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Ramp com_valveHP_a(
          offset=0.2,
          startTime=5,
          height=+0.7,
          duration=3)
          annotation (Placement(transformation(extent={{0,76},{-12,88}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.Ramp com_valveHP_b(
          offset=0,
          duration=5,
          height=-0.8,
          startTime=15)
          annotation (Placement(transformation(extent={{0,54},{-12,66}},
                rotation=0)));
        Modelica.Blocks.Math.Add add
          annotation (Placement(transformation(
              origin={-49,69},
              extent={{-7,-7},{7,7}},
              rotation=180)));
        ThermoPower.PowerPlants.ElectricGeneratorGroup.Components.OldElementsSwingEquation.Generator_SE_Breaker
          generator_SE(
          Pmax=30e6,
          omega_nom=157.08,
          eta=0.96,
          J=15000,
          omega_start=157.08,
          r=0.2,
          delta_start=0.5073)
                     annotation (Placement(transformation(extent={{-30,-48},{50,
                  32}}, rotation=0)));
        Electrical.Grid grid(Pn=50e8, droop=0)
          annotation (Placement(transformation(extent={{66,-18},{86,2}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
          annotation (Placement(transformation(extent={{38,46},{58,66}},
                rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(sinkP.flange,steamTurbineStodola. outlet) annotation (Line(
              points={{-44,40},{-51.2,40},{-51.2,4.8}}, thickness=0.5,
            color={0,0,255}));
        connect(valveHP.outlet,steamTurbineStodola. inlet) annotation (Line(
              points={{-76,18},{-76,11.4},{-76,4.8},{-76.8,4.8}}, thickness=0.5,
            color={0,0,255}));
        connect(sourceP.flange,valveHP. inlet)
          annotation (Line(points={{-84,40},{-76,40},{-76,30}}, thickness=0.5,
            color={0,0,255}));
        connect(add.y, valveHP.theta) annotation (Line(points={{-56.7,69},{-62,
                69},{-62,24},{-71.2,24}}, color={0,0,127}));
        connect(com_valveHP_b.y, add.u1) annotation (Line(points={{-12.6,60},{
                -30,60},{-30,64},{-40.6,64},{-40.6,64.8}},
                                                         color={0,0,127}));
        connect(com_valveHP_a.y, add.u2) annotation (Line(points={{-12.6,82},{
                -30,82},{-30,74},{-40.6,74},{-40.6,73.2}}, color={0,0,127}));
        connect(generator_SE.shaft, steamTurbineStodola.shaft_b) annotation (Line(
            points={{-26,-8},{-53.76,-8}},
            color={0,0,0},
            thickness=0.5));
        connect(grid.connection, generator_SE.powerConnection) annotation (Line(
            points={{67.4,-8},{38.8,-8},{38.8,-8}},
            pattern=LinePattern.None,
            thickness=0.5));
        connect(booleanConstant.y, generator_SE.closed) annotation (Line(points={{59,56},
                {78,56},{78,30},{10,30},{10,19.2}},         color={255,0,255}));
        annotation (Diagram(graphics),
                             experiment(StopTime=32, NumberOfIntervals=50000));
      end Test_Generator_SE_breaker;

      model TestSingleShaft
        ThermoPower.PowerPlants.ElectricGeneratorGroup.Examples.SingleShaft_static
          singleShaft(
          Pn=50e8,
          omega_nom=314.16/2,
          eta=0.9,
          J_shaft=100,
          d_shaft=0,
          SSInit=true)
                      annotation (Placement(transformation(extent={{0,-40},{80,
                  40}}, rotation=0)));
        Water.SteamTurbineStodola steamTurbineStodola(
          wstart=67.6,
          wnom=67.6,
          eta_iso_nom=0.83387,
          Kt=0.00307,
          PRstart=5,
          pnom=12800000)
                   annotation (Placement(transformation(extent={{-80,-20},{-40,
                  20}}, rotation=0)));
        Water.SourceW sourceW(
          h=3.47e6,
          w0=67.6,
          p0=128e5) annotation (Placement(transformation(extent={{-102,50},{-82,
                  70}}, rotation=0)));
        Water.SinkP sinkP(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{-36,50},{-16,70}},
                rotation=0)));
      protected
        Buses.Sensors sensors annotation (Placement(transformation(
              origin={72,50},
              extent={{-10,-6},{10,6}},
              rotation=180)));
        Buses.Actuators actuators
          annotation (Placement(transformation(extent={{64,-56},{84,-44}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
          annotation (Placement(transformation(extent={{10,-90},{30,-70}},
                rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(steamTurbineStodola.shaft_b, singleShaft.shaft) annotation (Line(
            points={{-47.2,0},{-22,0},{0,0}},
            color={0,0,0},
            thickness=0.5));
        connect(sourceW.flange, steamTurbineStodola.inlet) annotation (Line(
              points={{-82,60},{-76,60},{-76,16}},       thickness=0.5,
            color={0,0,255}));
        connect(sinkP.flange, steamTurbineStodola.outlet) annotation (Line(
              points={{-36,60},{-44,60},{-44,16}},       thickness=0.5,
            color={0,0,255}));
        connect(sensors, singleShaft.SensorsBus) annotation (Line(points={{72,50},
                {90,50},{90,-16},{80,-16}},     color={255,170,213}));
        connect(actuators, singleShaft.ActuatorsBus) annotation (Line(points={{74,-50},
                {90,-50},{90,-28},{80,-28}},         color={213,255,170}));
        connect(booleanConstant.y, actuators.breakerClosed) annotation (Line(
              points={{31,-80},{50,-80},{50,-50},{74,-50}}, color={255,0,255}));
        annotation (Diagram(graphics));
      end TestSingleShaft;

      model TestDoubleShaft
        Water.SteamTurbineStodola Turbine1(
          wstart=70.59,
          wnom=70.59,
          Kt=0.00307,
          eta_iso_nom=0.83,
          PRstart=5,
          pnom=12800000)
                     annotation (Placement(transformation(extent={{-76,8},{-36,
                  48}}, rotation=0)));
        Water.SourceW sourceW1(
          h=3.47e6,
          w0=67.6,
          p0=128e5) annotation (Placement(transformation(extent={{-96,54},{-82,
                  68}}, rotation=0)));
        Water.SinkP sinkP1(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{-30,54},{-18,66}},
                rotation=0)));
      protected
        Buses.Sensors sensors annotation (Placement(transformation(
              origin={72,50},
              extent={{-10,-6},{10,6}},
              rotation=180)));
        Buses.Actuators actuators
          annotation (Placement(transformation(extent={{64,-36},{84,-24}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
          annotation (Placement(transformation(extent={{20,-70},{40,-50}},
                rotation=0)));
        ThermoPower.PowerPlants.ElectricGeneratorGroup.Examples.DoubleShaft_static
          doubleShaft(
          Pn=50e8,
          J_shaft_A=2000,
          omega_nom_A=314.16/2,
          J_shaft_B=2000,
          omega_nom_B=314.16/2,
          SSInit=true)          annotation (Placement(transformation(extent={{
                  20,-20},{80,40}}, rotation=0)));
        Water.SteamTurbineStodola Turbine2(
          eta_iso_nom=0.9,
          Kt=0.01478,
          wstart=81.1,
          wnom=81.1,
          PRstart=5,
          pnom=2800000)
                   annotation (Placement(transformation(extent={{-76,-50},{-36,
                  -10}}, rotation=0)));
        Water.SourceW sourceW2(
          w0=81.1,
          p0=26.8e5,
          h=3.554e6) annotation (Placement(transformation(extent={{-96,-6},{-82,
                  8}}, rotation=0)));
        Water.SinkP sinkP2(p0=6e5, h=3.128e6)
          annotation (Placement(transformation(extent={{-30,-6},{-18,6}},
                rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(sourceW1.flange, Turbine1.inlet)
          annotation (Line(points={{-82,61},{-72,61},{-72,44}},   thickness=0.5,
            color={0,0,255}));
        connect(sinkP1.flange, Turbine1.outlet)
          annotation (Line(points={{-30,60},{-40,60},{-40,44}},     thickness=0.5,
            color={0,0,255}));
        connect(sourceW2.flange, Turbine2.inlet)
          annotation (Line(points={{-82,1},{-72,1},{-72,-14}},   thickness=0.5,
            color={0,0,255}));
        connect(sinkP2.flange, Turbine2.outlet)
          annotation (Line(points={{-30,0},{-40,0},{-40,-14}},     thickness=0.5,
            color={0,0,255}));
        connect(Turbine2.shaft_b, doubleShaft.shaft_B) annotation (Line(
            points={{-43.2,-30},{0,-30},{0,-5},{20,-5}},
            color={0,0,0},
            thickness=0.5));
        connect(Turbine1.shaft_b, doubleShaft.shaft_A) annotation (Line(
            points={{-43.2,28},{-11.75,28},{-11.75,25},{19.7,25}},
            color={0,0,0},
            thickness=0.5));
        connect(actuators, doubleShaft.ActuatorsBus) annotation (Line(points={{74,-30},
                {92,-30},{92,-11},{80,-11}},         color={213,255,170}));
        connect(booleanConstant.y, actuators.breakerClosed_shaftA) annotation (Line(
              points={{41,-60},{60,-60},{60,-30},{74,-30}}, color={255,0,255}));
        connect(booleanConstant.y, actuators.breakerClosed_shaftB) annotation (Line(
              points={{41,-60},{52,-60},{52,-30},{74,-30}}, color={255,0,255}));
        connect(doubleShaft.SensorsBus, sensors) annotation (Line(points={{80,-2},
                {92,-2},{92,50},{72,50}},     color={255,170,213}));
        annotation (Diagram(graphics));
      end TestDoubleShaft;

      model TestTripleShaft
      protected
        Buses.Sensors sensors annotation (Placement(transformation(
              origin={72,50},
              extent={{-10,-6},{10,6}},
              rotation=180)));
        Buses.Actuators actuators
          annotation (Placement(transformation(extent={{64,-56},{84,-44}},
                rotation=0)));
      public
        Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
          annotation (Placement(transformation(extent={{20,-98},{40,-78}},
                rotation=0)));
        ThermoPower.PowerPlants.ElectricGeneratorGroup.Examples.TripleShaft_static
          tripleShaft(
          Pn=50e8,
          J_shaft_A=2000,
          J_shaft_B=2000,
          J_shaft_C=2000,
          omega_nom_A=314.16/2,
          omega_nom_B=314.16/2,
          omega_nom_C=314.16/2,
          SSInit=true)          annotation (Placement(transformation(extent={{0,
                  -40},{80,40}}, rotation=0)));
        Water.SteamTurbineStodola Turbine1(
          wstart=70.59,
          wnom=70.59,
          Kt=0.00307,
          eta_iso_nom=0.83,
          PRstart=5,
          pnom=12800000)
                     annotation (Placement(transformation(extent={{-84,40},{-44,
                  80}}, rotation=0)));
        Water.SourceW sourceW1(
          h=3.47e6,
          w0=67.6,
          p0=128e5) annotation (Placement(transformation(extent={{-100,80},{-86,
                  94}}, rotation=0)));
        Water.SinkP sinkP1(p0=29.8e5, h=3.1076e6)
          annotation (Placement(transformation(extent={{-40,82},{-28,94}},
                rotation=0)));
        Water.SteamTurbineStodola Turbine2(
          eta_iso_nom=0.9,
          Kt=0.01478,
          wstart=81.1,
          wnom=81.1,
          PRstart=5,
          pnom=2700000)    annotation (Placement(transformation(extent={{-84,
                  -20},{-44,20}}, rotation=0)));
        Water.SourceW sourceW2(
          w0=81.1,
          p0=26.8e5,
          h=3.554e6) annotation (Placement(transformation(extent={{-100,24},{
                  -86,38}}, rotation=0)));
        Water.SinkP sinkP2(p0=6e5, h=3.128e6)
          annotation (Placement(transformation(extent={{-40,26},{-28,38}},
                rotation=0)));
        Water.SteamTurbineStodola Turbine3(
          wstart=89.82,
          wnom=89.82,
          Kt=0.0769,
          PRstart=5,
          pnom=600000)     annotation (Placement(transformation(extent={{-84,
                  -78},{-44,-38}}, rotation=0)));
        Water.SourceW sourceW3(
          w0=89.82,
          p0=6e5,
          h=3.109e6) annotation (Placement(transformation(extent={{-100,-36},{
                  -86,-22}}, rotation=0)));
        Water.SinkP sinkP3(p0=5.3982e3, h=2.3854)
                           annotation (Placement(transformation(extent={{-40,
                  -34},{-28,-22}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(tripleShaft.SensorsBus, sensors) annotation (Line(points={{80,-16},
                {92,-16},{92,50},{72,50}},      color={255,170,213}));
        connect(actuators, tripleShaft.ActuatorsBus) annotation (Line(points={{74,-50},
                {92,-50},{92,-28},{80,-28}},         color={213,255,170}));
        connect(booleanConstant.y, actuators.breakerClosed_shaftA) annotation (Line(
              points={{41,-88},{60,-88},{60,-50},{74,-50}}, color={255,0,255}));
        connect(booleanConstant.y, actuators.breakerClosed_shaftB) annotation (Line(
              points={{41,-88},{54,-88},{54,-50},{74,-50}}, color={255,0,255}));
        connect(booleanConstant.y, actuators.breakerClosed_shaftC) annotation (Line(
              points={{41,-88},{48,-88},{48,-50},{74,-50}}, color={255,0,255}));
        connect(sourceW1.flange, Turbine1.inlet)
          annotation (Line(points={{-86,87},{-80,87},{-80,76}},   thickness=0.5,
            color={0,0,255}));
        connect(sinkP1.flange, Turbine1.outlet)
          annotation (Line(points={{-40,88},{-48,88},{-48,76}},     thickness=0.5,
            color={0,0,255}));
        connect(sourceW2.flange, Turbine2.inlet)
          annotation (Line(points={{-86,31},{-80,31},{-80,16}},   thickness=0.5,
            color={0,0,255}));
        connect(sinkP2.flange, Turbine2.outlet)
          annotation (Line(points={{-40,32},{-48,32},{-48,16}},     thickness=0.5,
            color={0,0,255}));
        connect(Turbine1.shaft_b, tripleShaft.shaft_A) annotation (Line(
            points={{-51.2,60},{-20,60},{-20,24},{0,24}},
            color={0,0,0},
            thickness=0.5));
        connect(Turbine2.shaft_b, tripleShaft.shaft_B) annotation (Line(
            points={{-51.2,0},{0,0}},
            color={0,0,0},
            thickness=0.5));
        connect(sourceW3.flange, Turbine3.inlet) annotation (Line(points={{-86,-29},
                {-80,-29},{-80,-42}},        thickness=0.5,
            color={0,0,255}));
        connect(sinkP3.flange, Turbine3.outlet) annotation (Line(points={{-40,-28},
                {-48,-28},{-48,-42}},          thickness=0.5,
            color={0,0,255}));
        connect(Turbine3.shaft_b, tripleShaft.shaft_C) annotation (Line(
            points={{-51.2,-58},{-20,-58},{-20,-24},{0,-24}},
            color={0,0,0},
            thickness=0.5));
        annotation (Diagram(graphics));
      end TestTripleShaft;
    end Tests;
    annotation (Documentation(revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
  end ElectricGeneratorGroup;

  package Control "Models of the common control elements"

    model PID "PID controller with anti-windup"
      parameter Real Kp "Proportional gain (normalised units)";
      parameter Modelica.SIunits.Time Ti "Integral time";
      parameter Modelica.SIunits.Time Td=0 "Derivative time";
      parameter Real Nd = 1 "Derivative action up to Nd / Td rad/s";
      parameter Real Ni = 1
        "Ni*Ti is the time constant of anti-windup compensation";
      parameter Real b = 1 "Setpoint weight on proportional action";
      parameter Real c = 0 "Setpoint weight on derivative action";
      parameter Real PVmin "Minimum value of process variable for scaling";
      parameter Real PVmax "Maximum value of process variable for scaling";
      parameter Real CSmin "Minimum value of control signal for scaling";
      parameter Real CSmax "Maximum value of control signal for scaling";
      parameter Real PVstart = 0.5 "Start value of PV (scaled)";
      parameter Real CSstart = 0.5 "Start value of CS (scaled)";
      parameter Boolean holdWhenSimplified = false
        "Hold CSs at start value when homotopy=simplified";
      parameter Boolean steadyStateInit = false "Initialize in steady state";
      Real CSs_hom
        "Control signal scaled in per units, used when homotopy=simplified";

      Real P "Proportional action / Kp";
      Real I(start = CSstart/Kp) "Integral action / Kp";
      Real D "Derivative action / Kp";
      Real Dx(start = c*PVstart - PVstart) "State of approximated derivator";
      Real PVs "Process variable scaled in per unit";
      Real SPs "Setpoint variable scaled in per unit";
      Real CSs(start = CSstart) "Control signal scaled in per unit";
      Real CSbs(start = CSstart)
        "Control signal scaled in per unit before saturation";
      Real track "Tracking signal for anti-windup integral action";

      Modelica.Blocks.Interfaces.RealInput PV "Process variable signal"
                    annotation (Placement(transformation(extent={{-112,-52},{
                -88,-28}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput CS "Control signal"
        annotation (Placement(transformation(extent={{88,-12},{112,12}},
              rotation=0)));
      Modelica.Blocks.Interfaces.RealInput SP "Set point signal"
                    annotation (Placement(transformation(extent={{-112,28},{
                -88,52}}, rotation=0)));
    equation
      // Scaling
      SPs=(SP-PVmin)/(PVmax-PVmin);
      PVs=(PV-PVmin)/(PVmax-PVmin);
      CS = CSmin + CSs*(CSmax-CSmin);
      // Controller actions
      P = b*SPs - PVs;
      if Ti>0 then
        Ti*der(I) = SPs - PVs + track;
      else
        I = 0;
      end if;
      if Td > 0 then
        Td/Nd*der(Dx) + Dx = c*SPs - PVs
          "State equation of approximated derivator";
        D = Nd*((c*SPs - PVs) - Dx) "Output equation of approximated derivator";
      else
        Dx = 0;
        D = 0;
      end if;
      if holdWhenSimplified then
        CSs_hom = CSstart;
      else
        CSs_hom = CSbs;
      end if;
      CSbs = Kp*(P+I+D) "Control signal before saturation";
      CSs = homotopy(smooth(0, if CSbs > 1 then 1 else if CSbs < 0 then 0 else CSbs),
                     CSs_hom) "Saturated control signal";
      track = (CSs-CSbs)/(Kp*Ni);
    initial equation
      if steadyStateInit then
        if Ti > 0 then
          der(I) = 0;
        end if;
        if Td > 0 then
          D = 0;
        end if;
      end if;
      annotation (Diagram(graphics),
                           Icon(graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-54,40},{52,-34}},
              lineColor={0,0,255},
              textString=
                   "PID"),
            Text(
              extent={{-110,-108},{110,-142}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString=
                   "%name")}));
    end PID;

    model LevelSetPoint
      parameter Pressure p1;
      parameter Pressure p2;
      parameter Length y1;
      parameter Length y2;
      Modelica.Blocks.Interfaces.RealInput drumPressure
        annotation (Placement(transformation(extent={{-112,-12},{-88,12}},
              rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput levelSetPoint
        annotation (Placement(transformation(extent={{94,-12},{118,12}},
              rotation=0)));
    equation
      levelSetPoint = noEvent(
        if drumPressure < p1 then y1 else
        if drumPressure > p2 then y2 else y1 + (y2-y1)/(p2-p1)*(drumPressure-p1));
      annotation (Diagram(graphics),
                           Icon(graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={240,240,240},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-132,-104},{146,-154}},
              lineColor={0,0,255},
              textString=
                   "%name"),
            Text(
              extent={{-80,40},{80,-40}},
              lineColor={0,0,0},
              fillColor={240,240,240},
              fillPattern=FillPattern.Solid,
              textString=
                   "SetPoint")}));
    end LevelSetPoint;

    annotation (Documentation(revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
  end Control;

  package Buses "Expandable signal buses definitions"

    expandable connector Sensors
     // Empty connector, defined by expansion

      annotation (Icon(graphics={Polygon(
              points={{-100,100},{100,100},{100,0},{100,-100},{-100,-100},{-100,
                  100}},
              lineColor={255,170,213},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-60,60},{60,-60}},
              lineColor={255,255,255},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid,
              textString =       "S")}));
    end Sensors;

    expandable connector Actuators
     // Empty connector, defined by expansion
      annotation (Icon(graphics={Polygon(
              points={{-100,100},{100,100},{100,0},{100,-100},{-100,-100},{-100,
                  100}},
              lineColor={213,255,170},
              fillColor={0,127,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-60,60},{60,-60}},
              lineColor={255,255,255},
              fillColor={127,0,127},
              fillPattern=FillPattern.Solid,
              textString =      "A")}));
    end Actuators;
    annotation (Documentation(revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
  end Buses;

  package Simulators
    "Simulators for steam power plants and simple combined cycles"
    model SteamPlant_Sim1
      "Test total plant with levels control and ratio control on the condenser, inlet valves"
      package FlueGasMedium = ThermoPower.Media.FlueGas;
      package FluidMedium = ThermoPower.Water.StandardWater;
    public
      Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
        annotation (Placement(transformation(extent={{160,-60},{140,-40}},
              rotation=0)));
    public
      inner System system(allowFlowReversal=false)
        annotation (Placement(transformation(extent={{180,180},{200,200}})));
      HRSG.Examples.HRSG_3LRh hRSG(
        SSInit=true,
        drums(
          fluidHPNomPressure=12211600,
          fluidIPNomPressure=2636940,
          fluidLPNomPressure=604700),
        HeatExchangersGroup(
          fluidHPNomFlowRate_Sh=62.8,
          fluidHPNomFlowRate_Ec=64.5,
          fluidIPNomFlowRate_Rh=77.36,
          fluidIPNomFlowRate_Sh=14.5,
          fluidIPNomFlowRate_Ec=13.5,
          fluidLPNomFlowRate_Sh=10.95,
          fluidLPNomFlowRate_Ec=89.8,
          Sh_LP(gamma_G=30, gamma_F=4000),
          Sh_LP_N_F=4,
          Ec_LP(gamma_G=35, gamma_F=3000),
          Ev_LP(gamma_G=60, gamma_F=20000),
          Sh1HP_Rh1IP(
            gamma_G_A=70,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000,
            FFtype_F_B=ThermoPower.Choices.Flow1D.FFtypes.Kfnom,
            Kfnom_F_B=150,
            dpnom_F_B=0.3e5),
          Sh2HP_Rh2IP(
            gamma_G_A=83.97,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000,
            FFtype_F_B=ThermoPower.Choices.Flow1D.FFtypes.Kfnom,
            Kfnom_F_B=150,
            dpnom_F_B=0.3e5),
          fluidHPNomPressure_Sh=12211600,
          fluidHPNomPressure_Ev=12211600,
          fluidHPNomPressure_Ec=12211600,
          fluidIPNomPressure_Rh=2636940,
          fluidIPNomPressure_Sh=2636940,
          fluidIPNomPressure_Ev=2636940,
          fluidIPNomPressure_Ec=2636940,
          fluidLPNomPressure_Sh=604740,
          fluidLPNomPressure_Ev=604740,
          fluidLPNomPressure_Ec=604740,
          Sh2_HP_Tstartbar=800,
          Sh1_HP_Tstartbar=800,
          Ev_HP_Tstartbar=700,
          Ec2_HP_Tstartbar=600,
          Sh_IP_Tstartbar=600,
          Ev_IP_Tstartbar=550,
          Ec_IP_Tstartbar=500,
          Sh_LP_Tstartbar=550,
          Ev_LP_Tstartbar=500,
          Ec_LP_Tstartbar=450))
                              annotation (Placement(transformation(extent={{-120,20},
                {-20,120}},   rotation=0)));
      SteamTurbineGroup.Examples.STG_3LRh_valve_cc sTG_3LRh(
                              steamTurbines(
          steamHPNomFlowRate=62.8,
          steamIPNomFlowRate=14.5,
          steamLPNomFlowRate=10.9,
          ST_HP(pnom=120e5),
          ST_IP(pnom=28e5),
          ST_LP(pnom=6.5e5),
          steamHPNomPressure=12202000,
          steamIPNomPressure=2636810,
          steamLPNomPressure=604700,
          SSInit=true), totalFeedPump(SSInit=true, nominalOutletPressure=604700))
        annotation (Placement(transformation(extent={{-120,-180},{-20,-80}},
              rotation=0)));
    public
      HRSG.Control.levelsControl levelsControl(
        CSmin_levelHP=30,
        CSmax_levelHP=96,
        CSmin_levelIP=5,
        CSmax_levelIP=25,
        Level_HP(steadyStateInit=true),
        Level_IP(steadyStateInit=true),
        Level_LP(steadyStateInit=true),
        CSmax_levelLP=2400)
        annotation (Placement(transformation(extent={{40,100},{100,160}},
              rotation=0)));
      Gas.SourceW sourceGas(
        redeclare package Medium = FlueGasMedium,
        w0=585.5,
        T=884.65)          annotation (Placement(transformation(extent={{-160,50},{-140,
                70}},       rotation=0)));
      Modelica.Blocks.Sources.Ramp ramp(
        duration=500,
        offset=585.5,
        startTime=10,
        height=-50)     annotation (Placement(transformation(extent={{-190,90},{-170,
                110}},      rotation=0)));
      Gas.SinkP sinkGas(            redeclare package Medium =
            FlueGasMedium, T=362.309)
                       annotation (Placement(transformation(extent={{40,50},{60,70}},
                      rotation=0)));
    public
      Modelica.Blocks.Sources.Ramp valveHP_com(height=0, offset=1,
          duration=2)
        annotation (Placement(transformation(extent={{160,60},{140,80}}, rotation=
               0)));
      Modelica.Blocks.Sources.Ramp valveIP_com(height=0, offset=1,
          duration=2)
        annotation (Placement(transformation(extent={{160,20},{140,40}}, rotation=
               0)));
      Modelica.Blocks.Sources.Ramp valveLP_com(height=0, offset=1,
          duration=2)
        annotation (Placement(transformation(extent={{160,-20},{140,0}}, rotation=
               0)));
    protected
      Buses.Actuators actuators1
                                annotation (Placement(transformation(extent={{100,-60},
                {80,-40}},       rotation=0)));
    public
      ElectricGeneratorGroup.Examples.GeneratorGroup singleShaft(
        eta=0.9,
        J_shaft=15000,
        d_shaft=25,
        Pmax=150e6,
        SSInit=true,
        delta_start=0.7)
                    annotation (Placement(transformation(extent={{40,-180},{140,
                -80}}, rotation=0)));
    equation
      connect(sTG_3LRh.WaterOut,hRSG. WaterIn) annotation (Line(points={{-30,-80},
              {-30,-32},{-30,20}},
                         thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.From_SH_LP,hRSG. Sh_LP_Out) annotation (Line(points={{-50,-80},
              {-50,-32},{-50,20}},
                              thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.From_RH_IP,hRSG. Rh_IP_Out) annotation (Line(points={{-80,-80},
              {-80,-32},{-80,20}},
                              thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.From_SH_HP,hRSG. Sh_HP_Out) annotation (Line(points={{-110,
              -80},{-110,-32},{-110,20}},
                              thickness=0.5,
          color={0,0,255}));
      connect(ramp.y,sourceGas. in_w0) annotation (Line(points={{-169,100},{-156,100},
              {-156,65}},      color={0,0,127}));
      connect(valveHP_com.y, actuators1.Opening_valveHP)
                                                        annotation (Line(points={{139,70},
              {90,70},{90,-50}},            color={0,0,127}));
      connect(valveIP_com.y, actuators1.Opening_valveIP)
                                                        annotation (Line(points={{139,30},
              {90,30},{90,-50}},            color={0,0,127}));
      connect(valveLP_com.y, actuators1.Opening_valveLP)
                                                        annotation (Line(points={{139,-10},
              {90,-10},{90,-50}},             color={0,0,127}));
      connect(sTG_3LRh.To_RH_IP,hRSG. Rh_IP_In) annotation (Line(points={{-95,-80},
              {-94,-30},{-94,20},{-95,20}}, thickness=0.5,
          color={0,0,255}));
      connect(levelsControl.SensorsBus,hRSG. SensorsBus) annotation (Line(points={{40,130},
              {0,130},{0,110},{-20,110}},           color={255,170,213}));
      connect(hRSG.SensorsBus,sTG_3LRh. SensorsBus) annotation (Line(points={{-20,110},
              {0,110},{0,-150},{-20,-150}},      color={255,170,213}));
      connect(sTG_3LRh.ActuatorsBus,hRSG. ActuatorsBus) annotation (Line(points={{-20,
              -165},{-6,-165},{-6,95},{-20,95}},  color={213,255,170}));
      connect(actuators1, hRSG.ActuatorsBus)
                                            annotation (Line(points={{90,-50},{
              -6,-50},{-6,95},{-20,95}},
                                       color={213,255,170}));
      connect(levelsControl.ActuatorsBus,hRSG. ActuatorsBus) annotation (Line(
            points={{100,130},{120,130},{120,95},{-20,95}},
                                                          color={213,255,170}));
      connect(sinkGas.flange,hRSG. GasOut) annotation (Line(
          points={{40,60},{10,60},{-20,60}},
          color={159,159,223},
          thickness=0.5));
      connect(hRSG.GasIn,sourceGas. flange) annotation (Line(
          points={{-120,60},{-130,60},{-140,60}},
          color={159,159,223},
          thickness=0.5));
      connect(booleanConstant.y, actuators1.ConnectedGenerator) annotation (Line(
          points={{139,-50},{90,-50}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(singleShaft.shaft,sTG_3LRh. Shaft_b) annotation (Line(
          points={{40,-130},{-20,-130}},
          color={0,0,0},
          thickness=0.5));
      connect(sTG_3LRh.SensorsBus,singleShaft. SensorsBus) annotation (Line(
            points={{-20,-150},{20,-150},{20,-190},{160,-190},{160,-150},{140,
              -150}}, color={255,170,213}));
      connect(singleShaft.ActuatorsBus,sTG_3LRh. ActuatorsBus) annotation (Line(
            points={{140,-165},{152,-165},{152,-184},{14,-184},{14,-165},{-20,
              -165}}, color={213,255,170}));
      annotation (Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-200,-200},{200,200}},
            initialScale=0.1), graphics),
                           experiment(
          StopTime=6000,
          NumberOfIntervals=3000,
          Tolerance=1e-006),
        Documentation(info="<html>
<p>Characteristic simulations: variation of the gas flow rate.
</html>", revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"),
        experimentSetupOutput(equdistant=false));
    end SteamPlant_Sim1;

    model SteamPlant_Sim2
      "Test total plant with levels control and ratio control on the condenser, inlet valves"
      package FlueGasMedium = ThermoPower.Media.FlueGas;
      package FluidMedium = ThermoPower.Water.StandardWater;
    public
      Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
        annotation (Placement(transformation(extent={{180,-60},{160,-40}},
              rotation=0)));
    public
      Modelica.Blocks.Sources.Ramp valveHP_com(          offset=1,
        height=-0.5,
        duration=100,
        startTime=50)
        annotation (Placement(transformation(extent={{180,60},{160,80}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp valveIP_com(height=0, offset=1)
        annotation (Placement(transformation(extent={{180,20},{160,40}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp valveLP_com(height=0, offset=1)
        annotation (Placement(transformation(extent={{180,-20},{160,0}},
              rotation=0)));
    protected
      Buses.Actuators actuators annotation (Placement(transformation(extent={{
                120,-60},{100,-40}}, rotation=0)));
    public
      inner System system(allowFlowReversal=false)
        annotation (Placement(transformation(extent={{180,180},{200,200}})));
      HRSG.Examples.HRSG_3LRh hRSG(
        SSInit=true,
        drums(
          fluidHPNomPressure=12211600,
          fluidIPNomPressure=2636940,
          fluidLPNomPressure=604700),
        HeatExchangersGroup(
          fluidHPNomFlowRate_Sh=62.8,
          fluidHPNomFlowRate_Ec=64.5,
          fluidIPNomFlowRate_Rh=77.36,
          fluidIPNomFlowRate_Sh=14.5,
          fluidIPNomFlowRate_Ec=13.5,
          fluidLPNomFlowRate_Sh=10.95,
          fluidLPNomFlowRate_Ec=89.8,
          Sh_LP(gamma_G=30, gamma_F=4000),
          Sh_LP_N_F=4,
          Ec_LP(gamma_G=35, gamma_F=3000),
          Ev_LP(gamma_G=60, gamma_F=20000),
          Sh1HP_Rh1IP(
            gamma_G_A=70,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000,
            FFtype_F_B=ThermoPower.Choices.Flow1D.FFtypes.Kfnom,
            Kfnom_F_B=150,
            dpnom_F_B=0.3e5),
          Sh2HP_Rh2IP(
            gamma_G_A=83.97,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000,
            FFtype_F_B=ThermoPower.Choices.Flow1D.FFtypes.Kfnom,
            Kfnom_F_B=150,
            dpnom_F_B=0.3e5),
          fluidHPNomPressure_Sh=12211600,
          fluidHPNomPressure_Ev=12211600,
          fluidHPNomPressure_Ec=12211600,
          fluidIPNomPressure_Rh=2636940,
          fluidIPNomPressure_Sh=2636940,
          fluidIPNomPressure_Ev=2636940,
          fluidIPNomPressure_Ec=2636940,
          fluidLPNomPressure_Sh=604740,
          fluidLPNomPressure_Ev=604740,
          fluidLPNomPressure_Ec=604740,
          Sh2_HP_Tstartbar=800,
          Sh1_HP_Tstartbar=800,
          Ev_HP_Tstartbar=700,
          Ec2_HP_Tstartbar=600,
          Sh_IP_Tstartbar=600,
          Ev_IP_Tstartbar=550,
          Ec_IP_Tstartbar=500,
          Sh_LP_Tstartbar=550,
          Ev_LP_Tstartbar=500,
          Ec_LP_Tstartbar=450))
                              annotation (Placement(transformation(extent={{-120,20},
                {-20,120}},   rotation=0)));
      SteamTurbineGroup.Examples.STG_3LRh_valve_cc sTG_3LRh(
        SSInit=true,
        steamTurbines(
          steamHPNomFlowRate=62.8,
          steamIPNomFlowRate=14.5,
          steamLPNomFlowRate=10.9,
          ST_HP(pnom=120e5),
          ST_IP(pnom=28e5),
          ST_LP(pnom=6.5e5),
          steamHPNomPressure=12202000,
          steamIPNomPressure=2636810,
          steamLPNomPressure=604700),
        totalFeedPump(nominalOutletPressure=604700))
        annotation (Placement(transformation(extent={{-120,-180},{-20,-80}},
              rotation=0)));
    public
      HRSG.Control.levelsControl levelsControl(
        CSmin_levelHP=30,
        CSmax_levelHP=96,
        CSmin_levelIP=5,
        CSmax_levelIP=25,
        Level_HP(steadyStateInit=true),
        Level_IP(steadyStateInit=true),
        Level_LP(steadyStateInit=true),
        CSmax_levelLP=2400)
        annotation (Placement(transformation(extent={{40,100},{100,160}},
              rotation=0)));
      Gas.SourceW sourceGas(
        redeclare package Medium = FlueGasMedium,
        w0=585.5,
        T=884.65)          annotation (Placement(transformation(extent={{-160,50},
                {-140,70}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp ramp(
        duration=500,
        offset=585.5,
        height=0,
        startTime=10)   annotation (Placement(transformation(extent={{-190,90},
                {-170,110}},rotation=0)));
      Gas.SinkP sinkGas(            redeclare package Medium =
            FlueGasMedium, T=362.309)
                       annotation (Placement(transformation(extent={{40,50},{60,
                70}}, rotation=0)));
      ElectricGeneratorGroup.Examples.GeneratorGroup singleShaft(
        eta=0.9,
        J_shaft=15000,
        d_shaft=25,
        Pmax=150e6,
        SSInit=true,
        delta_start=0.7)
                    annotation (Placement(transformation(extent={{40,-180},{140,
                -80}}, rotation=0)));
    equation
      connect(valveHP_com.y, actuators.Opening_valveHP) annotation (Line(points=
             {{159,70},{110,70},{110,-50}}, color={0,0,127}));
      connect(valveIP_com.y, actuators.Opening_valveIP) annotation (Line(points=
             {{159,30},{110,30},{110,-50}}, color={0,0,127}));
      connect(valveLP_com.y, actuators.Opening_valveLP) annotation (Line(points=
             {{159,-10},{110,-10},{110,-50}}, color={0,0,127}));
      connect(booleanConstant.y, actuators.ConnectedGenerator) annotation (Line(
            points={{159,-50},{110,-50}}, color={255,0,255}));
      connect(sTG_3LRh.WaterOut,hRSG. WaterIn) annotation (Line(points={{-30,-80},
              {-30,20}}, thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.From_SH_LP,hRSG. Sh_LP_Out) annotation (Line(points={{-50,-80},
              {-50,20}},      thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.From_RH_IP,hRSG. Rh_IP_Out) annotation (Line(points={{-80,-80},
              {-80,20}},      thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.From_SH_HP,hRSG. Sh_HP_Out) annotation (Line(points={{-110,
              -80},{-110,20}},thickness=0.5,
          color={0,0,255}));
      connect(ramp.y,sourceGas. in_w0) annotation (Line(points={{-169,100},{
              -156,100},{-156,65}},
                               color={0,0,127}));
      connect(sTG_3LRh.To_RH_IP,hRSG. Rh_IP_In) annotation (Line(points={{-95,-80},
              {-94,-30},{-94,20},{-95,20}}, thickness=0.5,
          color={0,0,255}));
      connect(levelsControl.SensorsBus,hRSG. SensorsBus) annotation (Line(points={{40,130},
              {0,130},{0,110},{-20,110}},           color={255,170,213}));
      connect(hRSG.SensorsBus,sTG_3LRh. SensorsBus) annotation (Line(points={{-20,110},
              {0,110},{0,-150},{-20,-150}},      color={255,170,213}));
      connect(sTG_3LRh.ActuatorsBus,hRSG. ActuatorsBus) annotation (Line(points={{-20,
              -165},{-6,-165},{-6,95},{-20,95}},  color={213,255,170}));
      connect(levelsControl.ActuatorsBus,hRSG. ActuatorsBus) annotation (Line(
            points={{100,130},{120,130},{120,95},{-20,95}},
                                                          color={213,255,170}));
      connect(sinkGas.flange,hRSG. GasOut) annotation (Line(
          points={{40,60},{-20,60}},
          color={159,159,223},
          thickness=0.5));
      connect(hRSG.GasIn,sourceGas. flange) annotation (Line(
          points={{-120,60},{-140,60}},
          color={159,159,223},
          thickness=0.5));
      connect(singleShaft.shaft,sTG_3LRh. Shaft_b) annotation (Line(
          points={{40,-130},{-20,-130}},
          color={0,0,0},
          thickness=0.5));
      connect(sTG_3LRh.SensorsBus,singleShaft. SensorsBus) annotation (Line(
            points={{-20,-150},{20,-150},{20,-190},{160,-190},{160,-150},{140,
              -150}}, color={255,170,213}));
      connect(singleShaft.ActuatorsBus,sTG_3LRh. ActuatorsBus) annotation (Line(
            points={{140,-165},{152,-165},{152,-184},{14,-184},{14,-165},{-20,
              -165}}, color={213,255,170}));
      connect(actuators, hRSG.ActuatorsBus) annotation (Line(
          points={{110,-50},{-6,-50},{-6,95},{-20,95}},
          color={213,255,170},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-200,-200},{200,200}},
            initialScale=0.1), graphics),
                           experiment(
          StopTime=6000,
          NumberOfIntervals=3000,
          Tolerance=1e-006),
        Documentation(info="<html>
<p>Characteristic simulations: variation of the HP valve opening.
</html>", revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"),
        experimentSetupOutput(equdistant=false));
    end SteamPlant_Sim2;

    model CCPP_Sim3
      "Test total plant with levels control and ratio control on the condenser, inlet valves"
      package FlueGasMedium = ThermoPower.Media.FlueGas;
      package FluidMedium = ThermoPower.Water.StandardWater;
      Modelica.Blocks.Sources.Ramp ramp(
        duration=500,
        offset=1,
        height=-0.1,
        startTime=50)   annotation (Placement(transformation(extent={{-180,-30},
                {-160,-10}}, rotation=0)));
    public
      Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
        annotation (Placement(transformation(extent={{-180,40},{-160,60}},
              rotation=0)));
    public
      Modelica.Blocks.Sources.Ramp valveHP_com(height=0, offset=1)
        annotation (Placement(transformation(extent={{-180,160},{-160,180}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp valveIP_com(height=0, offset=1)
        annotation (Placement(transformation(extent={{-180,120},{-160,140}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp valveLP_com(height=0, offset=1)
        annotation (Placement(transformation(extent={{-180,80},{-160,100}},
              rotation=0)));
    protected
      Buses.Actuators actuators annotation (Placement(transformation(extent={{-70,100},
                {-90,120}},          rotation=0)));
    public
      ThermoPower.PowerPlants.GasTurbine.Examples.GasTurbineSimplified
        gasTurbine(redeclare package FlueGasMedium = FlueGasMedium)
        annotation (Placement(transformation(extent={{-140,-60},{-60,20}},
              rotation=0)));
      inner System system(allowFlowReversal=false)
        annotation (Placement(transformation(extent={{180,180},{200,200}})));
      HRSG.Examples.HRSG_3LRh hRSG(
        drums(
          fluidHPNomPressure=12211600,
          fluidIPNomPressure=2636940,
          fluidLPNomPressure=604700),
        HeatExchangersGroup(
          fluidHPNomFlowRate_Sh=62.8,
          fluidHPNomFlowRate_Ec=64.5,
          fluidIPNomFlowRate_Rh=77.36,
          fluidIPNomFlowRate_Sh=14.5,
          fluidIPNomFlowRate_Ec=13.5,
          fluidLPNomFlowRate_Sh=10.95,
          fluidLPNomFlowRate_Ec=89.8,
          Sh_LP(gamma_G=30, gamma_F=4000),
          Sh_LP_N_F=4,
          Ec_LP(gamma_G=35, gamma_F=3000),
          Ev_LP(gamma_G=60, gamma_F=20000),
          Sh1HP_Rh1IP(
            gamma_G_A=70,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000,
            FFtype_F_B=ThermoPower.Choices.Flow1D.FFtypes.Kfnom,
            Kfnom_F_B=150,
            dpnom_F_B=0.3e5),
          Sh2HP_Rh2IP(
            gamma_G_A=83.97,
            gamma_G_B=80,
            gamma_F_A=4000,
            gamma_F_B=4000,
            FFtype_F_B=ThermoPower.Choices.Flow1D.FFtypes.Kfnom,
            Kfnom_F_B=150,
            dpnom_F_B=0.3e5),
          fluidHPNomPressure_Sh=12211600,
          fluidHPNomPressure_Ev=12211600,
          fluidHPNomPressure_Ec=12211600,
          fluidIPNomPressure_Rh=2636940,
          fluidIPNomPressure_Sh=2636940,
          fluidIPNomPressure_Ev=2636940,
          fluidIPNomPressure_Ec=2636940,
          fluidLPNomPressure_Sh=604740,
          fluidLPNomPressure_Ev=604740,
          fluidLPNomPressure_Ec=604740,
          Sh2_HP_Tstartbar=800,
          Sh1_HP_Tstartbar=800,
          Ev_HP_Tstartbar=700,
          Ec2_HP_Tstartbar=600,
          Sh_IP_Tstartbar=600,
          Ev_IP_Tstartbar=550,
          Ec_IP_Tstartbar=500,
          Sh_LP_Tstartbar=550,
          Ev_LP_Tstartbar=500,
          Ec_LP_Tstartbar=450),
        SSInit=true)          annotation (Placement(transformation(extent={{-20,-20},
                {60,60}},     rotation=0)));
      Gas.SinkP sinkGas(            redeclare package Medium =
            FlueGasMedium, T=362.309)
                       annotation (Placement(transformation(extent={{96,2},{116,
                22}}, rotation=0)));
      ElectricGeneratorGroup.Examples.GeneratorGroup singleShaft(
        eta=0.9,
        J_shaft=15000,
        d_shaft=25,
        Pmax=150e6,
        SSInit=true,
        delta_start=0.7)
                    annotation (Placement(transformation(extent={{100,-160},{
                180,-80}},
                       rotation=0)));
      SteamTurbineGroup.Examples.STG_3LRh_valve_cc sTG_3LRh(
        steamTurbines(
          steamHPNomFlowRate=62.8,
          steamIPNomFlowRate=14.5,
          steamLPNomFlowRate=10.9,
          ST_HP(pnom=120e5),
          ST_IP(pnom=28e5),
          ST_LP(pnom=6.5e5),
          steamHPNomPressure=12202000,
          steamIPNomPressure=2636810,
          steamLPNomPressure=604700),
        totalFeedPump(nominalOutletPressure=604700),
        SSInit=true)
        annotation (Placement(transformation(extent={{-20,-160},{60,-80}},
              rotation=0)));
    public
      HRSG.Control.levelsControl levelsControl(
        CSmin_levelHP=30,
        CSmax_levelHP=96,
        CSmin_levelIP=5,
        CSmax_levelIP=25,
        Level_HP(steadyStateInit=true),
        Level_IP(steadyStateInit=true),
        Level_LP(steadyStateInit=true),
        CSmax_levelLP=2400)
        annotation (Placement(transformation(extent={{100,60},{160,120}},
              rotation=0)));
    equation
      connect(valveHP_com.y, actuators.Opening_valveHP) annotation (Line(points={{-159,
              170},{-80,170},{-80,110}},       color={0,0,127}));
      connect(valveIP_com.y, actuators.Opening_valveIP) annotation (Line(points={{-159,
              130},{-80,130},{-80,110}},       color={0,0,127}));
      connect(valveLP_com.y, actuators.Opening_valveLP) annotation (Line(points={{-159,90},
              {-80,90},{-80,110}},           color={0,0,127}));
      connect(booleanConstant.y, actuators.ConnectedGenerator) annotation (Line(
            points={{-159,50},{-80,50},{-80,110}}, color={255,0,255}));
      connect(gasTurbine.GTLoad, ramp.y) annotation (Line(points={{-140,-20},{
              -159,-20}}, color={0,0,127}));
      connect(hRSG.GasIn, gasTurbine.flueGasOut) annotation (Line(
          points={{-20,12},{-60,12}},
          color={159,159,223},
          smooth=Smooth.None,
          thickness=0.5));
      connect(hRSG.GasOut, sinkGas.flange) annotation (Line(
          points={{60,12},{96,12}},
          color={159,159,223},
          thickness=0.5,
          smooth=Smooth.None));
      connect(singleShaft.shaft,sTG_3LRh. Shaft_b) annotation (Line(
          points={{100,-120},{100,-120},{60,-120}},
          color={0,0,0},
          thickness=0.5));
      connect(sTG_3LRh.WaterOut, hRSG.WaterIn) annotation (Line(
          points={{52,-80},{52,-20}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5));
      connect(sTG_3LRh.From_SH_LP, hRSG.Sh_LP_Out) annotation (Line(
          points={{36,-80},{36,-20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sTG_3LRh.From_RH_IP, hRSG.Rh_IP_Out) annotation (Line(
          points={{12,-80},{12,-20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sTG_3LRh.To_RH_IP, hRSG.Rh_IP_In) annotation (Line(
          points={{0,-80},{0,-20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sTG_3LRh.From_SH_HP, hRSG.Sh_HP_Out) annotation (Line(
          points={{-12,-80},{-12,-20}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(hRSG.SensorsBus, levelsControl.SensorsBus) annotation (Line(
          points={{60,52},{80,52},{80,90},{100,90}},
          color={255,170,213},
          smooth=Smooth.None));
      connect(sTG_3LRh.SensorsBus, hRSG.SensorsBus) annotation (Line(
          points={{60,-136},{80,-136},{80,52},{60,52}},
          color={255,170,213},
          smooth=Smooth.None));
      connect(singleShaft.SensorsBus, hRSG.SensorsBus) annotation (Line(
          points={{180,-136},{200,-136},{200,-40},{80,-40},{80,52},{60,52}},
          color={255,170,213},
          smooth=Smooth.None));
      connect(hRSG.ActuatorsBus, levelsControl.ActuatorsBus) annotation (Line(
          points={{60,40},{180,40},{180,90},{160,90}},
          color={213,255,170},
          smooth=Smooth.None));
      connect(levelsControl.ActuatorsBus, actuators) annotation (Line(
          points={{160,90},{180,90},{180,140},{-40,140},{-40,110},{-80,110}},
          color={213,255,170},
          smooth=Smooth.None));
      connect(sTG_3LRh.ActuatorsBus, singleShaft.ActuatorsBus) annotation (Line(
          points={{60,-148},{72,-148},{72,-178},{190,-178},{190,-148},{180,-148}},
          color={213,255,170},
          smooth=Smooth.None));

      connect(sTG_3LRh.ActuatorsBus, hRSG.ActuatorsBus) annotation (Line(
          points={{60,-148},{70,-148},{70,40},{60,40}},
          color={213,255,170},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-200,-200},{200,200}},
            initialScale=0.1), graphics),
                           experiment(
          StopTime=7000,
          NumberOfIntervals=3000,
          Tolerance=1e-006),
        Documentation(revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"),
        experimentSetupOutput(equdistant=false));
    end CCPP_Sim3;

    model SteamPlant_Sim1_dp
      "Test total plant with levels control and ratio control on the condenser, inlet valves"
      package FlueGasMedium = ThermoPower.Media.FlueGas;
      package FluidMedium = ThermoPower.Water.StandardWater;

      parameter Boolean SSInit=true "Steady-state initialization";

      ThermoPower.Gas.SourceW sourceGas(
        redeclare package Medium = FlueGasMedium,
        w0=585.5,
        T=884.65)          annotation (Placement(transformation(extent={{-160,
                50},{-140,70}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp ramp(
        height=-50,
        duration=500,
        offset=585.5,
      startTime=4000)   annotation (Placement(transformation(extent={{-190,100},
                {-170,120}}, rotation=0)));
    public
      inner System system(allowFlowReversal=false)
        annotation (Placement(transformation(extent={{180,180},{200,200}})));
      HRSG.Examples.HRSG_3LRh hRSG(
        SSInit=true,
        HeatExchangersGroup(
          fluidHPNomPressure_Sh=1.22116e7,
          fluidHPNomPressure_Ev=1.22116e7,
          fluidHPNomPressure_Ec=1.22116e7,
          fluidIPNomPressure_Rh=2.63694e6,
          fluidIPNomPressure_Sh=2.63694e6,
          fluidIPNomPressure_Ev=2.63694e6,
          fluidIPNomPressure_Ec=2.63694e6,
          fluidLPNomPressure_Sh=6.0474e5,
          fluidLPNomPressure_Ev=6.0474e5,
          fluidLPNomPressure_Ec=6.0474e5,
          fluidHPNomFlowRate_Sh=62.8,
          fluidHPNomFlowRate_Ec=64.5,
          fluidIPNomFlowRate_Rh=77.36,
          fluidIPNomFlowRate_Sh=14.5,
          fluidIPNomFlowRate_Ec=13.5,
          fluidLPNomFlowRate_Sh=10.95,
          fluidLPNomFlowRate_Ec=89.8,
          Sh_LP(gamma_G=30, gamma_F=4000),
          Sh_LP_N_F=4,
          Ec_LP(gamma_G=35, gamma_F=3000),
          Ev_LP(gamma_G=60, gamma_F=20000),
          Sh1HP_Rh1IP(
            gamma_G_A=70,
            gamma_G_B=70,
            gamma_F_A=4000,
            gamma_F_B=4000),
          Sh2HP_Rh2IP(
            gamma_F_A=4000,
            gamma_F_B=4000,
            gamma_G_A=70,
            gamma_G_B=70)),
        drums(
          fluidHPNomPressure=12211600,
          fluidIPNomPressure=2636940,
          fluidLPNomPressure=604700))
                              annotation (Placement(transformation(extent={{-100,20},
                {0,120}},          rotation=0)));
    public
      Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=true)
        annotation (Placement(transformation(extent={{180,-60},{160,-40}},
              rotation=0)));
    public
      HRSG.Control.levelsControl levelsControl(
        CSmin_levelHP=30,
        CSmax_levelHP=96,
        CSmin_levelIP=5,
        CSmax_levelIP=25,
        Level_HP(steadyStateInit=true),
        Level_IP(steadyStateInit=true),
        Level_LP(steadyStateInit=true),
        CSmax_levelLP=2400)
        annotation (Placement(transformation(extent={{60,100},{120,160}},
              rotation=0)));
      Gas.SinkP sinkGas(            redeclare package Medium =
            FlueGasMedium, T=362.309)
                       annotation (Placement(transformation(extent={{60,50},{80,
                70}}, rotation=0)));
    public
      Modelica.Blocks.Sources.Ramp valveHP_com(height=0, offset=1,
          duration=2)
        annotation (Placement(transformation(extent={{180,60},{160,80}}, rotation=
               0)));
      Modelica.Blocks.Sources.Ramp valveIP_com(height=0, offset=1,
          duration=2)
        annotation (Placement(transformation(extent={{180,20},{160,40}}, rotation=
               0)));
      Modelica.Blocks.Sources.Ramp valveLP_com(height=0, offset=1,
          duration=2)
        annotation (Placement(transformation(extent={{180,-20},{160,0}}, rotation=
               0)));
      ElectricGeneratorGroup.Examples.GeneratorGroup singleShaft(
        eta=0.9,
        J_shaft=15000,
        d_shaft=25,
        Pmax=150e6,
        SSInit=true,
        delta_start=0.7)
                    annotation (Placement(transformation(extent={{60,-180},{160,
                -80}}, rotation=0)));
    protected
      Buses.Actuators actuators1
                                annotation (Placement(transformation(extent={{120,-60},
                {100,-40}},      rotation=0)));
    public
      SteamTurbineGroup.Examples.STG_3LRh_valve_cc sTG_3LRh(
        SSInit=true,
        steamTurbines(
          steamHPNomFlowRate=62.8,
          steamIPNomFlowRate=14.5,
          steamLPNomFlowRate=10.9,
          ST_HP(pnom=120e5),
          ST_IP(pnom=28e5),
          ST_LP(pnom=6.5e5),
          steamHPNomPressure=12202000,
          steamIPNomPressure=2636810,
          steamLPNomPressure=604700),
        totalFeedPump(nominalOutletPressure=604700))
        annotation (Placement(transformation(extent={{-100,-180},{0,-80}},
              rotation=0)));
    equation
      connect(ramp.y,sourceGas. in_w0) annotation (Line(points={{-169,110},{
              -156,110},{-156,65}}, color={0,0,127}));
      connect(sourceGas.flange, hRSG.GasIn) annotation (Line(
          points={{-140,60},{-100,60}},
          color={159,159,223},
          thickness=0.5,
          smooth=Smooth.None));
      connect(valveHP_com.y,actuators1. Opening_valveHP)
                                                        annotation (Line(points={{159,70},
              {110,70},{110,-50}},          color={0,0,127}));
      connect(valveIP_com.y,actuators1. Opening_valveIP)
                                                        annotation (Line(points={{159,30},
              {110,30},{110,-50}},          color={0,0,127}));
      connect(valveLP_com.y,actuators1. Opening_valveLP)
                                                        annotation (Line(points={{159,-10},
              {110,-10},{110,-50}},           color={0,0,127}));
      connect(levelsControl.SensorsBus,hRSG. SensorsBus) annotation (Line(points={{60,130},
              {20,130},{20,110},{0,110}},           color={255,170,213}));
      connect(hRSG.SensorsBus,sTG_3LRh. SensorsBus) annotation (Line(points={{0,110},
              {20,110},{20,-150},{0,-150}},      color={255,170,213}));
      connect(sTG_3LRh.ActuatorsBus,hRSG. ActuatorsBus) annotation (Line(points={{0,-165},
              {14,-165},{14,95},{0,95}},          color={213,255,170}));
      connect(actuators1, hRSG.ActuatorsBus)
                                            annotation (Line(points={{110,-50},
              {14,-50},{14,95},{0,95}},color={213,255,170}));
      connect(levelsControl.ActuatorsBus,hRSG. ActuatorsBus) annotation (Line(
            points={{120,130},{140,130},{140,95},{0,95}}, color={213,255,170}));
      connect(sinkGas.flange,hRSG. GasOut) annotation (Line(
          points={{60,60},{22,60},{0,60}},
          color={159,159,223},
          thickness=0.5));
      connect(booleanConstant.y,actuators1. ConnectedGenerator) annotation (Line(
          points={{159,-50},{110,-50}},
          color={255,0,255},
          smooth=Smooth.None));
      connect(singleShaft.shaft,sTG_3LRh. Shaft_b) annotation (Line(
          points={{60,-130},{0,-130}},
          color={0,0,0},
          thickness=0.5));
      connect(sTG_3LRh.SensorsBus,singleShaft. SensorsBus) annotation (Line(
            points={{0,-150},{40,-150},{40,-190},{180,-190},{180,-150},{160,
              -150}}, color={255,170,213}));
      connect(singleShaft.ActuatorsBus,sTG_3LRh. ActuatorsBus) annotation (Line(
            points={{160,-165},{172,-165},{172,-184},{34,-184},{34,-165},{0,
              -165}}, color={213,255,170}));
      connect(sTG_3LRh.WaterOut,hRSG. WaterIn) annotation (Line(points={{-10,-80},
              {-10,-36},{-10,20}},
                         thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.From_SH_LP,hRSG. Sh_LP_Out) annotation (Line(points={{-30,-80},
              {-30,-36},{-30,20}},
                              thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.From_RH_IP,hRSG. Rh_IP_Out) annotation (Line(points={{-60,-80},
              {-60,-36},{-60,20}},
                              thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.From_SH_HP,hRSG. Sh_HP_Out) annotation (Line(points={{-90,-80},
              {-90,-36},{-90,20}},
                              thickness=0.5,
          color={0,0,255}));
      connect(sTG_3LRh.To_RH_IP,hRSG. Rh_IP_In) annotation (Line(points={{-75,-80},
              {-74,-30},{-75,20}},          thickness=0.5,
          color={0,0,255}));
      annotation (Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-200,-200},{200,200}},
            initialScale=0.1), graphics),
                           experiment(
          StopTime=6000,
          NumberOfIntervals=3000,
          Tolerance=1e-006),
        Documentation(info="<html>
<p>Characteristic simulations: variation of the gas flow rate.
</html>", revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"),
        experimentSetupOutput(equdistant=false));
    end SteamPlant_Sim1_dp;
    annotation (Documentation(revisions="<html>
<ul>
<li><i>15 Apr 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
  end Simulators;
annotation (Documentation(revisions="<html>
</html>"));
end PowerPlants;
