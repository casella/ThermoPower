within ThermoPower;
package Examples "Application examples"
  extends Modelica.Icons.ExamplesPackage;

  package CISE "CISE plant models"
    extends Modelica.Icons.ExamplesPackage;

    package Models
      model CISEPlant "Model of the CISE lab steam generator"
        package Medium = Modelica.Media.Water.WaterIF97_ph (smoothModel=true);
        Water.Drum Drum(
          redeclare package Medium = Medium,
          rint=0.115,
          rext=0.125,
          L=1.455,
          Cm=4.08e6*1.195e-2,
          tauev=15,
          Kcs=0.01,
          lm=19,
          DrumOrientation=1,
          afd=0.0,
          gl=300,
          Ks=100,
          hvstart=2.78e6,
          tauc=5,
          gv=150,
          hlstart=1.15e5,
          pstart=6000000)                                       annotation (
            Placement(transformation(extent={{-120,6},{-60,66}},  rotation=0)));
        Water.SourceMassFlow
                      FeedWater(h=1.1059e6,
          use_in_w0=true,
          use_in_h=true)                    annotation (Placement(transformation(
                extent={{-176,16},{-146,46}}, rotation=0)));
        Water.Flow1DFV2ph
                        Downcomer(
          redeclare package Medium = Medium,
          N=2,
          L=15.923,
          Dhyd=0.04922,
          omega=0.1546,
          A=1.903e-3,
          wnom=0.23,
          wnf=0.3,
          H=-15.923,
          Cfnom=0.01,
          Kfc=1,
          e=6.1e-4,
          hstartin=1.15e6,
          hstartout=1.15e6,
          DynamicMomentum=false,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Colebrook,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=1800),
          dpnom=100,
          pstart=6000000) annotation (Placement(transformation(
              origin={-149,-60},
              extent={{-20,-19},{20,19}},
              rotation=270)));
        Water.Flow1DFV2ph
                        Risers(
          redeclare package Medium = Medium,
          Nt=6,
          L=14.16,
          H=14.16,
          Dhyd=0.02096,
          omega=0.06584,
          wnf=0.3,
          Kfc=1,
          Cfnom=0.013,
          hstartout=1.5e6,
          A=3.45e-4,
          N=7,
          e=1.2e-3,
          wnom=0.23,
          hstartin=1.15e6,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Colebrook,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=10000),
          dpnom=3000,
          pstart=6118000) annotation (Placement(transformation(
              origin={-22,-129},
              extent={{-19,18},{19,-18}},
              rotation=90)));
        Water.Flow1DFV2ph
                        Pipe2Drum(
          redeclare package Medium = Medium,
          N=2,
          Nt=1,
          L=2.779,
          H=2.779,
          Dhyd=0.0266,
          omega=0.0835,
          A=5.557e-4,
          wnom=0.23,
          wnf=0.1,
          Cfnom=0.01,
          e=9.9e-4,
          hstartin=1.6e6,
          hstartout=1.6e6,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Upstream,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=10000),
          dpnom=17000,
          pstart=6000000,
          noInitialPressure=true)
                          annotation (Placement(transformation(
              origin={-22,-25},
              extent={{-19,18},{19,-18}},
              rotation=90)));
        Water.SinkMassFlow
                    Blowdown(w0=0) annotation (Placement(transformation(extent={{-80,-38},
                  {-50,-8}},          rotation=0)));
        Water.Flow1DFV
                     Pipe2SH(
          redeclare package Medium = Medium,
          N=2,
          Nt=1,
          L=11.48,
          Dhyd=0.0205,
          omega=0.0644,
          A=3.301e-4,
          wnom=0.06,
          DynamicMomentum=false,
          H=0,
          hstartin=2.777e6,
          hstartout=2.777e6,
          Cfnom=0.004,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=3000),
          dpnom=2000,
          pstart=6000000) annotation (Placement(transformation(extent={{-56,44},{
                  -18,80}},  rotation=0)));
        Water.Flow1DFV2ph SH(
          redeclare package Medium = Medium,
          Nt=1,
          L=30,
          Dhyd=0.011,
          omega=0.0346,
          A=9.503e-5,
          Cfnom=0.0059,
          DynamicMomentum=false,
          wnom=0.06,
          hstartin=2.8e6,
          hstartout=2.8e6,
          N=5,
          e=1.7e-3,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Colebrook,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.HeatTransfer2phDB(gamma_b=20000),
          dpnom=170000,
          pstart=5900000,
          noInitialPressure=true)
                          annotation (Placement(transformation(extent={{-4,44},{
                  32,80}},  rotation=0)));
        Water.Flow1DFV2ph
                        Pipe2Valve(
          redeclare package Medium = Medium,
          N=2,
          Nt=1,
          L=6.6,
          omega=0.0628,
          Dhyd=0.02,
          A=3.142e-4,
          wnom=0.06,
          wnf=0.1,
          DynamicMomentum=false,
          H=0,
          hstartin=2.8e6,
          hstartout=2.8e6,
          Cfnom=0.004,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Upstream,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=3000),
          dpnom=1000,
          pstart=5600000) annotation (Placement(transformation(extent={{48,44},{
                  86,80}},  rotation=0)));
        Water.ValveVap Valve(
          redeclare package Medium = Medium,
          pnom=54.497e5,
          wnom=2*0.06,
          Av=2.7e-5,
          CvData=ThermoPower.Choices.Valve.CvTypes.Av,
          dpnom=4899700) annotation (Placement(transformation(extent={{100,44},{
                  136,80}},  rotation=0)));
        Water.SinkPressure
                    Sink(p0=5.5e5) annotation (Placement(transformation(extent={{156,48},
                  {186,78}},          rotation=0)));
        Thermal.HeatSource1DFV
                             HeatSourceSH(Nw=4)
               annotation (Placement(transformation(extent={{-8,102},{38,138}},
                rotation=0)));
        Thermal.HeatSource1DFV
                             HeatSourceRisers(Nw=6)
               annotation (Placement(transformation(
              origin={42,-130},
              extent={{-20,-18},{20,18}},
              rotation=270)));
        Water.Header HeaderLower(
          redeclare package Medium = Medium,
          V=8.372e-4,
          S=7.184e-2,
          gamma=2000,
          Cm=4.08e6*4.51e-4,
          hstart=1.1e6,
          pstart=6118000,
          Tmstart=540,
          noInitialPressure=true)                                  annotation (
            Placement(transformation(extent={{-128,-186},{-88,-146}},  rotation=0)));
        Water.Header HeaderUpper(
          redeclare package Medium = Medium,
          V=8.372e-4,
          S=7.184e-2,
          gamma=2000,
          Cm=4.08e6*4.51e-4,
          hstart=1.6e6,
          pstart=6020000,
          Tmstart=540,
          noInitialPressure=true)                                  annotation (
            Placement(transformation(
              origin={-21,-78},
              extent={{-16,-17},{16,17}},
              rotation=90)));
        Thermal.MetalTubeFV
                          DowncomerWall(
          L=15.923,
          rint=0.02461,
          rext=0.03015,
          rhomcm=4.08e6,
          lambda=19,
          WallRes=true,
          Nw=1,
          Tstart1=540,
          TstartN=540)                                          annotation (
            Placement(transformation(
              origin={-123,-60},
              extent={{-20,-17},{20,17}},
              rotation=90)));
        Thermal.MetalTubeFV
                          RisersWalls(
          L=14.16,
          rint=0.01048,
          rext=0.01335,
          lambda=19,
          rhomcm=4.08e6,
          WallRes=true,
          Nw=6,
          Nt=6,
          Tstart1=548,
          TstartN=548)                                          annotation (
            Placement(transformation(
              origin={1,-129},
              extent={{-19,-17},{19,17}},
              rotation=90)));
        Thermal.MetalTubeFV
                          Pipe2DrumWall(
          L=2.779,
          rint=0.0133,
          rext=0.0167,
          rhomcm=4.08e6,
          lambda=19,
          WallRes=true,
          Nw=1,
          Tstart1=548,
          TstartN=548)                                          annotation (
            Placement(transformation(
              origin={-1.77636e-015,-25},
              extent={{-21,-16},{21,16}},
              rotation=90)));
        Thermal.MetalTubeFV
                          Pipe2SHWall(
          L=11.480,
          rint=0.01025,
          rext=0.01305,
          rhomcm=4.08e6,
          lambda=19,
          WallRes=true,
          Nw=1,
          Tstart1=548,
          TstartN=548)                                          annotation (
            Placement(transformation(
              origin={-36,86},
              extent={{-20,-18},{20,18}},
              rotation=180)));
        Thermal.MetalTubeFV
                          SHWall(
          L=30,
          rint=0.0055,
          rext=0.0100,
          rhomcm=4.08e6,
          lambda=19,
          WallRes=true,
          Nw=4,
          Tstart1=551,
          TstartN=551)                                          annotation (
            Placement(transformation(
              origin={15,86},
              extent={{-21,-18},{21,18}},
              rotation=180)));
        Thermal.MetalTubeFV
                          Pipe2ValveWall(
          L=6.6,
          rint=0.0100,
          rext=0.01275,
          rhomcm=4.08e6,
          lambda=19,
          WallRes=true,
          Nw=1,
          Tstart1=548,
          TstartN=548)                                          annotation (
            Placement(transformation(
              origin={67,87},
              extent={{-21,-19},{21,19}},
              rotation=180)));
        Water.PressDrop PressDrop(
          redeclare package Medium = Medium,
          wnom=0.23,
          wnf=0.1,
          K=3,
          A=5.62e-5,
          Kfc=2,
          FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kinetic,
          dpnom=80000,
          state(d(start=750)))
                   annotation (Placement(transformation(extent={{-70,-180},{-40,
                  -150}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput DrumPressure annotation (Placement(
              transformation(extent={{162,-14},{182,6}}, rotation=0),
              iconTransformation(extent={{90,20},{110,40}})));
        Modelica.Blocks.Interfaces.RealOutput DrumLevel annotation (Placement(
              transformation(extent={{162,-48},{182,-28}}, rotation=0),
              iconTransformation(extent={{90,-50},{110,-30}})));
        Modelica.Blocks.Interfaces.RealInput FeedWaterFlow annotation (Placement(
              transformation(extent={{-192,48},{-172,68}},  rotation=0),
              iconTransformation(extent={{-120,72},{-102,89}})));
        Modelica.Blocks.Interfaces.RealInput RiserPower annotation (Placement(
              transformation(extent={{86,-140},{66,-120}},   rotation=0),
              iconTransformation(extent={{-120,-48},{-102,-30}})));
        Modelica.Blocks.Interfaces.RealInput ValveOpening annotation (Placement(
              transformation(extent={{152,92},{132,112}}, rotation=0),
              iconTransformation(extent={{-120,-9},{-102,9}})));
        Modelica.Blocks.Interfaces.RealInput SHPower annotation (Placement(
              transformation(extent={{54,130},{34,150}},   rotation=0),
              iconTransformation(extent={{-120,-88},{-103,-71}})));
        Modelica.Blocks.Interfaces.RealInput FeedWaterEnthalpy annotation (
            Placement(transformation(extent={{-190,76},{-170,96}},   rotation=0),
              iconTransformation(extent={{-120,31},{-102,49}})));
        inner System system(allowFlowReversal=false, initOpt=ThermoPower.Choices.Init.Options.steadyState)
          annotation (Placement(transformation(extent={{146,-130},{184,-94}})));
      equation
        connect(Pipe2Drum.infl, HeaderUpper.outlet) annotation (Line(
            points={{-22,-44},{-21,-44},{-21,-62}},
            color={0,0,255},
            thickness=0.5));
        connect(HeaderUpper.inlet, Risers.outfl) annotation (Line(
            points={{-21,-94.16},{-21,-94.16},{-21,-110},{-22,-110}},
            color={0,0,255},
            thickness=0.5));
        connect(SH.outfl, Pipe2Valve.infl) annotation (Line(
            points={{32,62},{48,62}},
            color={0,0,255},
            thickness=0.5));
        connect(Valve.outlet, Sink.flange) annotation (Line(
            points={{136,62},{136,62},{136,63},{156,63}},
            color={0,0,255},
            thickness=0.5));
        connect(Pipe2Valve.outfl, Valve.inlet) annotation (Line(
            points={{86,62},{100,62}},
            color={0,0,255},
            thickness=0.5));
        connect(HeaderLower.outlet, PressDrop.inlet) annotation (Line(
            points={{-88,-166},{-86,-166},{-86,-165},{-70,-165}},
            color={0,0,255},
            thickness=0.5));
        connect(PressDrop.outlet, Risers.infl) annotation (Line(
            points={{-40,-165},{-22,-165},{-22,-148}},
            color={0,0,255},
            thickness=0.5));
        connect(RisersWalls.ext, HeatSourceRisers.wall) annotation (Line(points={{6.27,
                -129},{36.6,-129},{36.6,-130}},
                                           color={255,127,0}));
        DrumPressure = Drum.p;
        DrumLevel = Drum.y;
        connect(Blowdown.flange, Drum.blowdown) annotation (Line(
            points={{-80,-23},{-90,-23},{-90,6.6}},
            thickness=0.5,
            color={0,0,255}));
        connect(SH.infl, Pipe2SH.outfl) annotation (Line(
            points={{-4,62},{-4,62},{-18,62}},
            thickness=0.5,
            color={0,0,255}));
        connect(HeaderLower.inlet, Downcomer.outfl) annotation (Line(
            points={{-128.2,-166},{-149,-166},{-149,-80}},
            thickness=0.5,
            color={0,0,255}));
        connect(Downcomer.infl, Drum.downcomer) annotation (Line(
            points={{-149,-40},{-111,15}},
            thickness=0.5,
            color={0,0,255}));
        connect(Pipe2Drum.outfl, Drum.riser) annotation (Line(
            points={{-22,-6},{-66.6,18.9}},
            thickness=0.5,
            color={0,0,255}));
        connect(Pipe2SH.infl, Drum.steam) annotation (Line(
            points={{-56,62},{-72.6,57}},
            thickness=0.5,
            color={0,0,255}));
        connect(FeedWater.flange, Drum.feedwater) annotation (Line(
            points={{-146,31},{-119.1,31.5}},
            thickness=0.5,
            color={0,0,255}));
        connect(FeedWaterEnthalpy, FeedWater.in_h) annotation (Line(points={{-180,86},
                {-153.2,86},{-153.2,39.4}}, color={0,0,127}));
        connect(FeedWaterFlow, FeedWater.in_w0) annotation (Line(points={{-182,58},
                {-167,58},{-167,39.4}},     color={0,0,127}));
        connect(RiserPower, HeatSourceRisers.power) annotation (Line(points={{76,-130},
                {76,-130},{49.2,-130}},                 color={0,0,127}));
        connect(ValveOpening, Valve.theta) annotation (Line(points={{142,102},{
                142,102},{118,102},{118,76.4}},          color={0,0,127}));
        connect(SHPower, HeatSourceSH.power) annotation (Line(points={{44,140},{
                44,140},{15,140},{15,127.2}},        color={0,0,127}));
        connect(SHWall.ext, HeatSourceSH.wall)
          annotation (Line(points={{15,91.58},{15,91.58},{15,114.6}},
                                                          color={255,127,0}));
        connect(Downcomer.wall, DowncomerWall.int) annotation (Line(
            points={{-139.5,-60},{-128.1,-60}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(Risers.wall, RisersWalls.int) annotation (Line(
            points={{-13,-129},{-4.1,-129}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(Pipe2Drum.wall, Pipe2DrumWall.int) annotation (Line(
            points={{-13,-25},{-4.8,-25}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(SHWall.int, SH.wall) annotation (Line(
            points={{15,80.6},{15,71},{14,71}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(Pipe2SHWall.int, Pipe2SH.wall) annotation (Line(
            points={{-36,80.6},{-36,71},{-37,71}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(Pipe2ValveWall.int, Pipe2Valve.wall) annotation (Line(
            points={{67,81.3},{67,71}},
            color={255,127,0},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-220,-200},{200,180}},
              initialScale=0.1)),
          Documentation(info="<HTML>
<p>This is the model of the CISE steam generation plant described in the paper: F. Casella, A. Leva, \"Modelica open library for power plant simulation: design and experimental validation\", <i>Proceedings of the 2003 Modelica Conference</i>, Link&ouml eping, Sweden, 2003.
<p>The geometric parameters are already set. The start values set in the model parameters are guess values around the nominal full load steady state (60 bar drum pressure).
<p><b>This model cannot be simulated alone</b>, as the boundary conditions (feedwater flowrate and enthalpy, steam valve opening, power to the risers and power to the superheater) are not set. See the <tt>CiseSim</tt> model instead.
</HTML>
",       revisions="<html>
<ul>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Initialization by steady-state initial equations.</li>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       New heat transfer components.</li>
<li><i>15 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>3 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Input/Output connectors added.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"),Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              initialScale=0.1,
              grid={1,1}),       graphics={Rectangle(
                extent={{-100,100},{100,-101}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-88,78},{90,-78}},
                lineColor={0,0,255},
                textString="P")}));
      end CISEPlant;

      model CISEPlant2States "Simplified model of the CISE lab steam generator"
        package Medium = Modelica.Media.Water.WaterIF97_ph;
        constant Real pi=Modelica.Constants.pi;
        parameter SI.Length r=0.115 "Drum diameter";
        parameter SI.Length H=1.455 "Drum height";
        SI.Pressure DrumPressure;
        SI.Length DrumLevel;
        Water.SourceMassFlow
                      FeedWater(h=1.1059e6,
          use_in_w0=true,
          use_in_h=true)                    annotation (Placement(transformation(
                extent={{-92,0},{-72,20}}, rotation=0)));
        Water.Flow1DFV
                     Pipe2SH(
          redeclare package Medium = Medium,
          Nt=1,
          L=11.48,
          Dhyd=0.0205,
          omega=0.0644,
          A=3.301e-4,
          wnom=0.06,
          DynamicMomentum=false,
          H=0,
          hstartin=2.777e6,
          hstartout=2.777e6,
          Cfnom=0.004,
          wnf=1,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          N=2,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          dpnom=1000,
          pstart=6000000,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=3000))
                          annotation (Placement(transformation(extent={{-38,20},{
                  -18,40}}, rotation=0)));
        Water.Flow1DFV2ph SH(
          redeclare package Medium = Medium,
          Nt=1,
          L=30,
          Dhyd=0.011,
          omega=0.0346,
          A=9.503e-5,
          Cfnom=0.0059,
          DynamicMomentum=false,
          wnom=0.06,
          hstartin=2.8e6,
          hstartout=2.8e6,
          N=5,
          e=1.7e-3,
          wnf=0.1,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Colebrook,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.HeatTransfer2phDB,
          dpnom=170000,
          pstart=5900000) annotation (Placement(transformation(extent={{-8,20},{
                  12,40}}, rotation=0)));

        Water.Flow1DFV  Pipe2Valve(
          redeclare package Medium = Medium,
          N=2,
          Nt=1,
          L=6.6,
          omega=0.0628,
          Dhyd=0.02,
          A=3.142e-4,
          wnom=0.06,
          DynamicMomentum=false,
          H=0,
          hstartin=2.8e6,
          hstartout=2.8e6,
          Cfnom=0.004,
          wnf=1,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Upstream,
          dpnom=10000,
          pstart=5600000,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=3000))
                          annotation (Placement(transformation(extent={{22,20},{
                  42,40}}, rotation=0)));
        Water.ValveVap Valve(
          redeclare package Medium = Medium,
          pnom=54.497e5,
          wnom=2*0.06,
          Av=2.7e-5,
          b=0.1,
          CvData=ThermoPower.Choices.Valve.CvTypes.Av,
          dpnom=4899700) annotation (Placement(transformation(extent={{50,40},{70,
                  20}}, rotation=0)));
        Water.SinkPressure
                    Sink(p0=5.5e5) annotation (Placement(transformation(extent={{
                  80,20},{100,40}}, rotation=0)));
        Thermal.HeatSource1DFV
                             HeatSourceSH(Nw=4)
               annotation (Placement(transformation(extent={{-8,58},{12,78}},
                rotation=0)));
        Thermal.MetalTubeFV
                          Pipe2SHWall(
          L=11.480,
          rint=0.01025,
          rext=0.01305,
          rhomcm=4.08e6,
          lambda=19,
          WallRes=true,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          Nw=1,
          Tstart1=548,
          TstartN=548)                                          annotation (
            Placement(transformation(
              origin={-28,48},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Thermal.MetalTubeFV
                          SHWall(
          L=30,
          rint=0.0055,
          rext=0.0100,
          rhomcm=4.08e6,
          lambda=19,
          WallRes=true,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          Nw=4,
          Tstart1=551,
          TstartN=551)                                          annotation (
            Placement(transformation(
              origin={2,48},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Thermal.MetalTubeFV
                          Pipe2ValveWall(
          L=6.6,
          rint=0.0100,
          rext=0.01275,
          rhomcm=4.08e6,
          lambda=19,
          WallRes=true,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          Nw=1,
          Tstart1=548,
          TstartN=548)                                          annotation (
            Placement(transformation(
              origin={32,48},
              extent={{-10,-10},{10,10}},
              rotation=180)));
        Water.Drum2States DrumBoiler(
          redeclare package Medium = Medium,
          Vd=0.0604,
          cm=523,
          pstart=60e5,
          Vldstart=pi*r^2*H/2,
          Vdcr=0.0628,
          Mmd=93,
          Mmdcr=270,
          initOpt=ThermoPower.Choices.Init.Options.steadyState) annotation (
            Placement(transformation(extent={{-64,4},{-44,24}}, rotation=0)));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow RisersHeat
          annotation (Placement(transformation(
              origin={-54,-22},
              extent={{-10,-10},{10,10}},
              rotation=90)));
        Modelica.Blocks.Interfaces.RealInput SHPower annotation (Placement(
              transformation(extent={{-110,74},{-90,94}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput ValveOpening annotation (Placement(
              transformation(extent={{-110,-84},{-90,-64}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput RiserPower annotation (Placement(
              transformation(extent={{-110,-54},{-90,-34}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput FeedWaterEnthalpy annotation (
            Placement(transformation(extent={{-110,48},{-90,66}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput FeedWaterFlow annotation (Placement(
              transformation(extent={{-110,20},{-90,40}}, rotation=0)));
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        DrumLevel = DrumBoiler.Vld/(pi*r^2) - H/2;
        DrumPressure = DrumBoiler.p;
        connect(HeatSourceSH.wall, SHWall.ext) annotation (Line(points={{2,65},{2,
                51.1}},                    color={255,127,0}));
        connect(DrumBoiler.heat, RisersHeat.port)
          annotation (Line(points={{-54,5},{-54,-12}}, color={191,0,0}));
        connect(Pipe2SH.outfl, SH.infl) annotation (Line(
            points={{-18,30},{-8,30}},
            thickness=0.5,
            color={0,0,255}));
        connect(SH.outfl, Pipe2Valve.infl) annotation (Line(
            points={{12,30},{22,30}},
            thickness=0.5,
            color={0,0,255}));
        connect(Pipe2Valve.outfl, Valve.inlet) annotation (Line(
            points={{42,30},{50,30}},
            thickness=0.5,
            color={0,0,255}));
        connect(Valve.outlet, Sink.flange) annotation (Line(
            points={{70,30},{80,30}},
            thickness=0.5,
            color={0,0,255}));
        connect(Pipe2SH.infl, DrumBoiler.steam) annotation (Line(
            points={{-38,30},{-47.2,21.2}},
            thickness=0.5,
            color={0,0,255}));
        connect(DrumBoiler.feed, FeedWater.flange) annotation (Line(
            points={{-63,9.6},{-72,10}},
            thickness=0.5,
            color={0,0,255}));
        connect(RiserPower, RisersHeat.Q_flow) annotation (Line(points={{-100,-44},
                {-54,-44},{-54,-32}}, color={0,0,127}));
        connect(ValveOpening, Valve.theta) annotation (Line(points={{-100,-74},{
                60,-74},{60,22}}, color={0,0,127}));
        connect(SHPower, HeatSourceSH.power) annotation (Line(points={{-100,84},{
                -60,84},{2,84},{2,72}},          color={0,0,127}));
        connect(FeedWaterEnthalpy, FeedWater.in_h) annotation (Line(points={{-100,57},
                {-76.8,57},{-76.8,15.6}},
                                        color={0,0,127}));
        connect(FeedWaterFlow, FeedWater.in_w0) annotation (Line(points={{-100,30},
                {-86,30},{-86,15.6}},
                                    color={0,0,127}));
        connect(Pipe2SHWall.int, Pipe2SH.wall) annotation (Line(
            points={{-28,45},{-28,35}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(SHWall.int, SH.wall) annotation (Line(
            points={{2,45},{2,35}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(Pipe2ValveWall.int, Pipe2Valve.wall) annotation (Line(
            points={{32,45},{32,35}},
            color={255,127,0},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                  graphics),
          Documentation(info="<HTML>
<p>This is a simplified model of the CISE steam generation plant described in the paper: F. Casella, A. Leva, \"Modelica open library for power plant simulation: design and experimental validation\", <i>Proceedings of the 2003 Modelica Conference</i>, Link&ouml eping, Sweden, 2003. The drum model is based on the assumption of thermodynamic equilibrium between the liquid and vapour phases, thus leading to a drum model with only two states (pressure and liquid volume).
<p>The geometric parameters are already set. The start values set in the model parameters are guess values around the nominal full load steady state (60 bar drum pressure).
<p><b>This model cannot be simulated alone</b>, as the boundary conditions (feedwater flowrate and enthalpy, steam valve opening, power to the risers and power to the superheater) are not set. See the <tt>CiseSim2States</tt> model instead.
</HTML>
",       revisions=
               "<html>
<ul>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Initialization by steady-state initial equations.</li>
<li><i>16 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Model restructured.</li>
<li><i>1 May 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"),Icon(graphics={Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-56,76},{64,-60}},
                lineColor={0,0,255},
                lineThickness=0.5,
                textString="P")}));
      end CISEPlant2States;

      partial model CISESim
        "CISE Plant model with boundary conditions and initial steady-state computation"
        parameter SI.MassFlowRate wfeed_offset(fixed=false, start = 6.0e-2)
          "Offset of feedwater flow rate";
        parameter Real ValveOpening_offset(fixed=false, start = 0.4)
          "Offset of valve opening";
        parameter SI.Pressure InitialDrumPressure=5.9359e+006;
        parameter SI.Length InitialDrumLevel=-0.091;

        Modelica.Blocks.Sources.Constant Qsh(k=4928) annotation (Placement(
              transformation(extent={{40,-140},{60,-120}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp Qev(
          duration=1,
          height=0,
          offset=1.0141e5) annotation (Placement(transformation(extent={{40,-100},
                  {60,-80}},rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed1(
          duration=1,
          height=0,
          startTime=50,
          offset=wfeed_offset) annotation (Placement(transformation(extent={{-140,
                  100},{-120,120}}, rotation=0)));
        Modelica.Blocks.Math.Add3 wfeed annotation (Placement(transformation(
                extent={{40,100},{60,120}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed2(
          duration=1,
          height=0,
          offset=0,
          startTime=0) annotation (Placement(transformation(extent={{-140,70},{-120,
                  90}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp ValveOpening1(
          duration=1,
          height=0,
          offset=ValveOpening_offset) annotation (Placement(transformation(extent=
                 {{-80,-20},{-60,0}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp ValveOpening2(
          duration=1,
          height=0,
          offset=0) annotation (Placement(transformation(extent={{-80,-60},{-60,-40}},
                rotation=0)));
        Modelica.Blocks.Math.Add3 sum_1 annotation (Placement(transformation(
                extent={{-80,70},{-60,90}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed3(
          duration=1,
          height=0,
          offset=0,
          startTime=0) annotation (Placement(transformation(extent={{-140,42},{-120,
                  62}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed5(
          duration=1,
          height=0,
          offset=0,
          startTime=0) annotation (Placement(transformation(extent={{-80,130},{-60,
                  150}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed4(
          duration=1,
          height=0,
          offset=0,
          startTime=0) annotation (Placement(transformation(extent={{-80,100},{-60,
                  120}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp hfeed1(
          duration=1,
          height=0,
          offset=0) annotation (Placement(transformation(extent={{-20,62},{0,82}},
                rotation=0)));
        Modelica.Blocks.Sources.Ramp hfeed2(
          duration=1,
          height=0,
          offset=0) annotation (Placement(transformation(extent={{-20,30},{0,50}},
                rotation=0)));
        Modelica.Blocks.Math.Add3 hfeed annotation (Placement(transformation(
                extent={{40,30},{60,50}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp hfeed3(
          duration=1,
          height=0,
          offset=0) annotation (Placement(transformation(extent={{-20,0},{0,20}},
                rotation=0)));
        Modelica.Blocks.Math.Add sum_3 annotation (Placement(transformation(
                extent={{-20,-40},{0,-20}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp ValveOpening3(
          duration=1,
          height=0,
          offset=0) annotation (Placement(transformation(extent={{-20,-80},{0,-60}},
                rotation=0)));
        Modelica.Blocks.Math.Add ValveOpening annotation (Placement(
              transformation(extent={{40,-60},{60,-40}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{182,140},{202,160}})));
        Models.CISEPlant Plant
          annotation (Placement(transformation(extent={{120,-40},{180,20}})));
      initial equation
        // Additional equations to determine the non-fixed parameters
        Plant.Drum.y = InitialDrumLevel;
        Plant.Drum.p = InitialDrumPressure;

      equation
        connect(wfeed5.y, wfeed.u1) annotation (Line(points={{-59,140},{-40,140},
                {-40,118},{38,118}}, color={0,0,127}));
        connect(wfeed4.y, wfeed.u2)
          annotation (Line(points={{-59,110},{38,110}}, color={0,0,127}));
        connect(sum_1.y, wfeed.u3) annotation (Line(points={{-59,80},{-40,80},{-40,
                102},{38,102}}, color={0,0,127}));
        connect(hfeed.u1, hfeed1.y) annotation (Line(points={{38,48},{20,48},{20,
                72},{1,72}}, color={0,0,127}));
        connect(hfeed.u2, hfeed2.y)
          annotation (Line(points={{38,40},{1,40}}, color={0,0,127}));
        connect(hfeed.u3, hfeed3.y) annotation (Line(points={{38,32},{20,32},{20,
                10},{1,10}}, color={0,0,127}));
        connect(ValveOpening.u1, sum_3.y) annotation (Line(points={{38,-44},{20,-44},
                {20,-30},{1,-30}}, color={0,0,127}));
        connect(ValveOpening.u2, ValveOpening3.y) annotation (Line(points={{38,-56},
                {20,-56},{20,-70},{1,-70}}, color={0,0,127}));
        connect(sum_3.u1, ValveOpening1.y) annotation (Line(points={{-22,-24},{-40,
                -24},{-40,-10},{-59,-10}}, color={0,0,127}));
        connect(ValveOpening2.y, sum_3.u2) annotation (Line(points={{-59,-50},{-40,
                -50},{-40,-36},{-22,-36}}, color={0,0,127}));
        connect(sum_1.u3, wfeed3.y) annotation (Line(points={{-82,72},{-100,72},{
                -100,52},{-119,52}}, color={0,0,127}));
        connect(sum_1.u2, wfeed2.y)
          annotation (Line(points={{-82,80},{-119,80}}, color={0,0,127}));
        connect(sum_1.u1, wfeed1.y) annotation (Line(points={{-82,88},{-100,88},{
                -100,110},{-119,110}}, color={0,0,127}));
        connect(wfeed.y, Plant.FeedWaterFlow) annotation (Line(
            points={{61,110},{108,110},{108,14.15},{116.7,14.15}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(hfeed.y, Plant.FeedWaterEnthalpy) annotation (Line(
            points={{61,40},{94,40},{94,2},{116.7,2}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(ValveOpening.y, Plant.ValveOpening) annotation (Line(
            points={{61,-50},{74,-50},{74,-10},{116.7,-10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Qev.y, Plant.RiserPower) annotation (Line(
            points={{61,-90},{92,-90},{92,-21.7},{116.7,-21.7}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Qsh.y, Plant.SHPower) annotation (Line(
            points={{61,-130},{106,-130},{106,-33.85},{116.55,-33.85}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-160,-160},{200,160}},
              initialScale=0.1), graphics),
          Documentation(info="<HTML>
<p>This model provides the boundary condition values to the <tt>CISEPlant</tt>model; it can be used to simulate open-loop transients.
<p>The steady state is obtained by setting the derivatives of all the state variables to zero in the <tt>initial equation</tt> section. The offset values for <tt>ValveOpening1</tt> and <tt>wfeed1</tt>, i.e. the parameters <tt>ValveOpening_offset</tt> and <tt>wfeed_offset</tt> have a <tt>fixed=false</tt> attribute. Their actual values are set by the two additional initial equations specifying the initial drum level and pressure.
<p>The <tt>CISESim120501</tt>, <tt>CISESim180503</tt>, <tt>CISESim180504</tt> models extend <tt>CISESim</tt> by adding suitable numerical values to the boundary condition signal generators.
</HTML>
",       revisions=
               "<html>
<ul>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Initialisation by initial equations.</li>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       New heat transfer components.</li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br> 
    First release.</li>
</ul>
</html>"),Icon(coordinateSystem(extent={{-160,-160},{200,160}})));
      end CISESim;

      model CISESim2States
        "CISE plant reduced model with boundary conditions and initial steady-state computation"
        parameter SI.MassFlowRate wfeed_offset(fixed=false, start = 6.0e-2)
          "Offset of feedwater flow rate";
        parameter Real ValveOpening_offset(fixed=false, start = 0.4)
          "Offset of valve opening";
        parameter SI.Pressure InitialDrumPressure=5.9359e+006;
        parameter SI.Length InitialDrumLevel=-0.091;
        Models.CISEPlant2States Plant annotation (Placement(transformation(
                extent={{100,-20},{160,40}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Qsh(k=4928) annotation (Placement(
              transformation(extent={{20,120},{40,140}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp Qev(
          duration=1,
          height=0,
          offset=1.0141e5) annotation (Placement(transformation(extent={{0,-60},{
                  20,-40}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed1(
          duration=1,
          height=0,
          startTime=50,
          offset=wfeed_offset) annotation (Placement(transformation(extent={{-140,
                  0},{-120,20}}, rotation=0)));
        Modelica.Blocks.Math.Add3 wfeed annotation (Placement(transformation(
                extent={{-20,0},{0,20}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed2(
          duration=1,
          height=0,
          offset=0,
          startTime=0) annotation (Placement(transformation(extent={{-140,-30},{-120,
                  -10}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp ValveOpening1(
          duration=1,
          height=0,
          offset=ValveOpening_offset) annotation (Placement(transformation(extent=
                 {{-80,-100},{-60,-80}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp ValveOpening2(
          duration=1,
          height=0,
          offset=0) annotation (Placement(transformation(extent={{-80,-140},{-60,
                  -120}}, rotation=0)));
        Modelica.Blocks.Math.Add3 sum_1 annotation (Placement(transformation(
                extent={{-80,-30},{-60,-10}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed3(
          duration=1,
          height=0,
          offset=0,
          startTime=0) annotation (Placement(transformation(extent={{-140,-60},{-120,
                  -40}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed5(
          duration=1,
          height=0,
          offset=0,
          startTime=0) annotation (Placement(transformation(extent={{-80,30},{-60,
                  50}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp wfeed4(
          duration=1,
          height=0,
          offset=0,
          startTime=0) annotation (Placement(transformation(extent={{-80,0},{-60,
                  20}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp hfeed1(
          duration=1,
          height=0,
          offset=0) annotation (Placement(transformation(extent={{-140,110},{-120,
                  130}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp hfeed2(
          duration=1,
          height=0,
          offset=0) annotation (Placement(transformation(extent={{-140,80},{-120,
                  100}}, rotation=0)));
        Modelica.Blocks.Math.Add3 hfeed annotation (Placement(transformation(
                extent={{-80,80},{-60,100}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp hfeed3(
          duration=1,
          height=0,
          offset=0) annotation (Placement(transformation(extent={{-140,50},{-120,
                  70}}, rotation=0)));
        Modelica.Blocks.Math.Add ValveOpening annotation (Placement(
              transformation(extent={{-20,-120},{0,-100}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{140,140},{160,160}})));
      equation
        connect(wfeed3.y, sum_1.u3) annotation (Line(points={{-119,-50},{-100,-50},
                {-100,-28},{-82,-28}}, color={0,0,127}));
        connect(wfeed2.y, sum_1.u2)
          annotation (Line(points={{-119,-20},{-82,-20}}, color={0,0,127}));
        connect(wfeed1.y, sum_1.u1) annotation (Line(points={{-119,10},{-100,10},
                {-100,-12},{-82,-12}}, color={0,0,127}));
        connect(sum_1.y, wfeed.u3) annotation (Line(points={{-59,-20},{-46,-20},{
                -46,2},{-22,2}}, color={0,0,127}));
      initial equation
        // Additional equations to determine the non-fixed parameters
        Plant.DrumLevel = InitialDrumLevel;
        Plant.DrumPressure = InitialDrumPressure;

      equation
        connect(hfeed.y, Plant.FeedWaterEnthalpy) annotation (Line(points={{-59,
                90},{60,90},{60,27.1},{100,27.1}}, color={0,0,127}));
        connect(Qsh.y, Plant.SHPower) annotation (Line(points={{41,130},{80,130},
                {80,35.2},{100,35.2}}, color={0,0,127}));
        connect(Qev.y, Plant.RiserPower) annotation (Line(points={{21,-50},{60,-50},
                {60,-3.2},{100,-3.2}}, color={0,0,127}));
        connect(ValveOpening.y, Plant.ValveOpening) annotation (Line(points={{1,-110},
                {80,-110},{80,-12.2},{100,-12.2}}, color={0,0,127}));
        connect(wfeed.y, Plant.FeedWaterFlow) annotation (Line(points={{1,10},{40,
                10},{40,19},{100,19}}, color={0,0,127}));
        connect(hfeed1.y, hfeed.u1) annotation (Line(points={{-119,120},{-100,120},
                {-100,98},{-82,98}}, color={0,0,127}));
        connect(hfeed2.y, hfeed.u2)
          annotation (Line(points={{-119,90},{-82,90}}, color={0,0,127}));
        connect(hfeed3.y, hfeed.u3) annotation (Line(points={{-119,60},{-100,60},
                {-100,82},{-82,82}}, color={0,0,127}));
        connect(wfeed5.y, wfeed.u1) annotation (Line(points={{-59,40},{-40,40},{-40,
                18},{-22,18}}, color={0,0,127}));
        connect(wfeed4.y, wfeed.u2)
          annotation (Line(points={{-59,10},{-22,10}}, color={0,0,127}));
        connect(ValveOpening1.y, ValveOpening.u1) annotation (Line(points={{-59,-90},
                {-40,-90},{-40,-104},{-22,-104}}, color={0,0,127}));
        connect(ValveOpening2.y, ValveOpening.u2) annotation (Line(points={{-59,-130},
                {-40,-130},{-40,-116},{-22,-116}}, color={0,0,127}));
        annotation (Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-160,-160},{160,160}},
              initialScale=0.1), graphics), Documentation(info="<HTML>
<p>This model provides the boundary condition values to the <tt>CISEPlant2States</tt>model; it can be used to simulate open-loop transients.
<p>The steady state is obtained by setting the derivatives of all the state variables to zero in the <tt>initial equation</tt> section. The offset values for <tt>ValveOpening1</tt> and <tt>wfeed1</tt>, i.e. the parameters <tt>ValveOpening_offset</tt> and <tt>wfeed_offset</tt> have a <tt>fixed=false</tt> attribute. Their actual values are set by the two additional initial equations specifying the initial drum level and pressure.
<p>The <tt>CISESim2States120501</tt> model extends <tt>CISESim2States</tt> by adding suitable numerical values to the boundary condition signal generators.
</HTML>
",       revisions=
               "<html>
<ul>
<li><i>16 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Model restructured.</li>
<li><i>1 May 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
      end CISESim2States;
    end Models;

    package Simulators
      extends Modelica.Icons.ExamplesPackage;
      model CISESim120501
        extends Modelica.Icons.Example;
        extends Models.CISESim(
          InitialDrumPressure=59.359e5,
          InitialDrumLevel=-0.091,
          wfeed_offset(start=6.0e-2),
          ValveOpening_offset(start=0.4),
          hfeed1(offset=1.10593e6),
          wfeed1(
            startTime=63,
            height=0.0017,
            duration=16),
          wfeed2(
            startTime=80,
            height=0.0009,
            duration=540),
          Qev(
            offset=1.0141e5,
            startTime=63,
            height=-11.4e3,
            duration=7),
          Qsh(k=4928));
        annotation (Documentation(info="<html>
This model extends <tt>CISESim</tt> with the appropriate steady-state values of the boundary conditions for the 120501 transient.
<p>This model starts from the required steady-state, and can be simulated for 1200 s to replicate the experimental data.
</html>",   revisions="<html>
<ul>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Initialization by steady-state initial equations.</li>
<li><i>5 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release as extension of <tt>CISESim</tt>.</li>
</ul>
</html>"),   experiment(
            StopTime=1200,
            NumberOfIntervals=1000,
            Tolerance=1e-007));
      end CISESim120501;

      model CISESim180503
        extends Modelica.Icons.Example;
        extends Models.CISESim(
          InitialDrumPressure=34.070e5,
          InitialDrumLevel=-0.0507,
          wfeed_offset(start=2.89e-2),
          ValveOpening_offset(start=0.4),
          hfeed1(
            offset=9.7371109e5,
            startTime=0,
            duration=400,
            height=5000),
          hfeed2(
            startTime=400,
            duration=300,
            height=-4200),
          hfeed3(
            startTime=700,
            duration=500,
            height=14000),
          wfeed1(
            startTime=80,
            height=0.0015,
            duration=60),
          wfeed2(
            startTime=160,
            height=-0.0021,
            duration=15),
          wfeed3(
            startTime=200,
            height=0.002,
            duration=650),
          wfeed4(
            startTime=865,
            height=0.0016,
            duration=3),
          wfeed5(
            startTime=868,
            height=0.001,
            duration=340),
          ValveOpening1(
            startTime=72,
            duration=12,
            height=0.062),
          Qev(
            offset=5.296179e4,
            startTime=150,
            height=-200,
            duration=350),
          Qsh(k=4570.7));
        annotation (Documentation(info="<html>
This model extends <tt>CISESim</tt> with the appropriate steady-state values of the boundary conditions for the 180503 transient.
<p>This model starts from the required steady-state, and can be simulated for 1200 s to replicate the experimental data.
</html>",   revisions="<html>
<ul>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Initialization by steady-state initial equations.</li>
<li><i>5 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release as extension of <tt>CISESim</tt>.</li>
</ul>
</html>"),   experiment(
            StopTime=1200,
            NumberOfIntervals=1000,
            Tolerance=1e-007));
      end CISESim180503;

      model CISESim180504
        extends Modelica.Icons.Example;
        extends Models.CISESim(
          InitialDrumPressure=29.3052e5,
          InitialDrumLevel=-0.0574,
          wfeed_offset(start=2.838e-2),
          ValveOpening_offset(start=0.4),
          ValveOpening1(
            startTime=72,
            duration=40,
            height=-0.0135),
          ValveOpening2(
            startTime=112,
            duration=60,
            height=-0.0080),
          ValveOpening3(
            startTime=172,
            duration=140,
            height=-0.0040),
          hfeed1(
            offset=9.7371109e5,
            startTime=140,
            duration=460,
            height=-17000),
          hfeed2(
            startTime=600,
            duration=200,
            height=11000),
          hfeed3(
            startTime=800,
            duration=400,
            height=7000),
          wfeed1(
            startTime=68,
            height=-0.006,
            duration=3),
          wfeed2(
            startTime=71,
            height=-0.005,
            duration=75),
          wfeed3(
            startTime=400,
            height=-0.001,
            duration=450),
          Qev(
            offset=5.1825e4,
            startTime=150,
            duration=0.1,
            height=-200),
          Qsh(k=4661.7));

        annotation (Documentation(info="<html>
This model extends <tt>CISESim</tt> with the appropriate steady-state values of the boundary conditions for the 180504 transient.
<p>This model starts from the required steady-state, and can be simulated for 1200 s to replicate the experimental data.

</html>",   revisions="<html>
<ul>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Initialization by steady-state initial equations.</li>
<li><i>5 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release as extension of <tt>CISESim</tt>.</li>
</ul>
</html>"),   experiment(
            StopTime=1200,
            NumberOfIntervals=1000,
            Tolerance=1e-007));
      end CISESim180504;

      model CISESim2States120501
        extends Modelica.Icons.Example;
        extends Models.CISESim2States(
          InitialDrumPressure=59.359e5,
          InitialDrumLevel=-0.091,
          wfeed_offset(start=6.0e-2),
          ValveOpening_offset(start=0.4),
          hfeed1(offset=1.10593e6),
          wfeed1(
            startTime=63,
            height=0.0017,
            duration=16),
          wfeed2(
            startTime=80,
            height=0.0009,
            duration=540),
          Qev(
            offset=1.0141e5,
            startTime=63,
            height=-11.4e3,
            duration=7),
          Qsh(k=4928));
        annotation (Documentation(info="<html>
This model extends <tt>CISESim2States</tt> with the appropriate steady-state values of the boundary conditions for the 120501 transient.
<p>This model must be simulated for 20000 s to obtain the required steady state. The actual transient can then be simulated by importing the final steady state, setting the controller gains to zero, and setting the appropriate values to the signal generators height parameters: <p>
importInitial() <p>
ValveOpening.steadyStateGain=0.0 <br>
wfeed.steadyStateGain=0.0 <p>
Qev.startTime={63};<br>
Qev.height={-11.4e3};<br>
Qev.duration={7};<br>
wfeed1.startTime={63};<br>
wfeed1.height={0.0017};<br>
wfeed1.duration={16};<br>
wfeed2.startTime={80};<br>
wfeed2.height={0.0009};<br>
wfeed2.duration={540};<br>
<p>The whole simulation sequence can be obtained by running the 120501_2s.mos Dymola script.
</html>",   revisions="<html>
<ul>
<li><i>25 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release as extension of <tt>CISESim2States</tt>.</li>
</ul>
</html>"),   experiment(
            StopTime=1200,
            NumberOfIntervals=1000,
            Tolerance=1e-007));
      end CISESim2States120501;
    end Simulators;
    annotation (Documentation(info="<html>
This package contain the CISE plant models, described in the papers:
<ul>
<li>F. Casella, A. Leva, \"Modelica open library for power plant simulation: design and experimental validation\", <i>Proceedings of the 2003 Modelica Conference</i>, Link&ouml ping, Sweden, 2003.
<li>A. Leva, C., Maffezzoni and G. Benelli,,
\"Validation of drum boiler models through complete dynamic tests\", <i>Control Engineering Practice</i>, 7, 1999, pp. 11-26.
</ul>
<p>The <tt>CISEPlant</tt> model contains the full plant model, with input connectors for the boundary conditions, and output connectors for the drum pressure and level variable. The <tt>CISESim</tt> model contains the full plant model, plus signal generators to reproduce the boundary conditions. The other <tt>CISESim*</tt> models extend the <tt>CISESim</tt> model with the appropriate numerical values required to reproduce a specific experimental transient. 
<p>All simulation are initialized at steady-state by appropriate initial equations.
<p>The CISE-data_2_0.zip file contains the data files of three experimental transients, which can be compared with the simulation results.
</html>", revisions="<html>
<ul>
<li><i>19 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Initialization by steady-state initial equations.</li>
<li><i>15 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Adapted to Modelica.Media.</li>
<li><i>5 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Package created, and structure of the CISE plant simulations revisited.</li>
</ul>
</html>"), Icon(graphics));
  end CISE;

  package HRB "Heat recovery boiler models"
    extends Modelica.Icons.ExamplesPackage;

    package Models
      extends Modelica.Icons.Package;
      model HeatExchanger "Base class for heat exchanger fluid - gas"
        constant Real pi=Modelica.Constants.pi;
        replaceable package GasMedium =
            Modelica.Media.IdealGases.MixtureGases.CombustionAir constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package WaterMedium = Water.StandardWater constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        parameter Boolean StaticGasBalances=false;
        parameter Integer Nr = 2 "Number of tube rows";
        parameter Integer Nt = 2 "Number of parallel tubes in each row";
        parameter SI.Length Lt "Length of a tube in a row";
        parameter SI.Length Dint "Internal diameter of each tube";
        parameter SI.Length Dext "External diameter of each tube";
        parameter SI.Density rhom "Density of the tube metal walls";
        parameter SI.SpecificHeatCapacity cm
          "Specific heat capacity of the tube metal walls";
        parameter SI.Area Sb "Cross-section of the boiler (including tubes)";
        final parameter SI.Area Sb_net = Sb - Nr*Nt*Dext*pi*Lt
          "Net cross-section of the boiler";
        parameter SI.Length Lb "Length of the boiler";
        parameter SI.Area St=Dext*pi*Lt*Nt*Nr
          "Total area of the heat exchange surface";
        parameter SI.CoefficientOfHeatTransfer gamma_nom=150
          "Nominal heat transfer coefficient - gas side";

        Gas.FlangeA gasIn(redeclare package Medium = GasMedium) annotation (
            Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
        Gas.FlangeB gasOut(redeclare package Medium = GasMedium) annotation (
            Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
        Water.FlangeA waterIn(redeclare package Medium = WaterMedium) annotation (
           Placement(transformation(extent={{-20,80},{20,120}}, rotation=0)));
        Water.FlangeB waterOut(redeclare package Medium = WaterMedium)
          annotation (Placement(transformation(extent={{-20,-120},{20,-80}},
                rotation=0)));
        Water.Flow1DFV WaterSide(
          redeclare package Medium = WaterMedium,
          Nt=Nt,
          A=pi*Dint^2/4,
          omega=pi*Dint,
          Dhyd=Dint,
          wnom=20,
          Cfnom=0.005,
          L=Lt*Nr,
          N=Nr + 1,
          hstartin=1e5,
          hstartout=2.7e5,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          redeclare model HeatTransfer =
              ThermoPower.Thermal.HeatTransferFV.DittusBoelter,
          dpnom=1000) annotation (Placement(
              transformation(extent={{-20,-70},{20,-30}}, rotation=0)));
        Thermal.MetalTubeFV TubeWalls(
          rint=Dint/2,
          rext=Dext/2,
          rhomcm=rhom*cm,
          lambda=20,
          L=Lt*Nr,
          Nw=Nr,
          Tstart1=300,
          TstartN=340) "Tube"
          annotation (Placement(transformation(extent={{-20,0},{20,-40}},
                rotation=0)));
        Gas.Flow1DFV GasSide(
          redeclare package Medium = GasMedium,
          L=Lb,
          omega=St/Lb,
          wnom=10,
          A=Sb,
          Dhyd=St/Lb,
          N=Nr + 1,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          QuasiStatic=StaticGasBalances,
          redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.FlowDependentHeatTransferCoefficient(gamma_nom=gamma_nom, alpha=0.6),
          Tstartin=670,
          Tstartout=370) annotation (Placement(transformation(extent={{-20,60},{20,20}},
                           rotation=0)));
        Thermal.CounterCurrentFV
                               CounterCurrent1(Nw=Nr)    annotation (Placement(
              transformation(extent={{-20,-8},{20,32}},rotation=0)));
      equation
        connect(CounterCurrent1.side2, TubeWalls.ext)
          annotation (Line(points={{0,5.8},{0,5.8},{0,-13.8}},
                                                      color={255,127,0}));
        connect(GasSide.infl, gasIn) annotation (Line(
            points={{-20,40},{-60,40},{-60,0},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(GasSide.outfl, gasOut) annotation (Line(
            points={{20,40},{60,40},{60,0},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(WaterSide.outfl, waterOut) annotation (Line(
            points={{20,-50},{40,-50},{40,-70},{0,-70},{0,-100}},
            thickness=0.5,
            color={0,0,255}));
        connect(WaterSide.infl, waterIn) annotation (Line(
            points={{-20,-50},{-40,-50},{-40,70},{0,70},{0,100}},
            thickness=0.5,
            color={0,0,255}));
        connect(GasSide.wall, CounterCurrent1.side1) annotation (Line(
            points={{0,30},{0,18}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(TubeWalls.int, WaterSide.wall) annotation (Line(
            points={{0,-26},{0,-40}},
            color={255,127,0},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}),
                  graphics),
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
                textString="%name")}),
          Documentation(revisions="<html>
<ul>
<li><i>12 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       Model restructured.</li>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>",   info="<html>
This is the model of a very simple heat exchanger. The modelling assumptions are as follows:
<ul>
<li> The boiler contains <tt>Nr</tt> rows of tubes, connected in series; each one is made of <tt>Nt</tt> identical tubes in parallel. 
<li>Each tube has a length <tt>L</tt>, internal and external diameters <tt>Dint</tt> and <tt>Dext</tt>, and is made of a metal having density <tt>rhom</tt> and a specific heat capacity of <tt>cm</tt>. 
<li>The series connection of the tubes is discretised with <tt>Nr+1</tt> nodes, so that each cell between two nodes corresponds to a single row.
<li>The gas flow is also discretised with <tt>Nr+1</tt> nodes, so that each gas cell interacts with a single tube row. 
<li>The gas flows through a volume having a (net) cross-section <tt>Sb</tt> and a (net) length <tt>Lb</tt>. 
<li>Mass and energy dynamic balances are assumed for the water side.
<li>The mass and energy balances for the gas side are either static or dynamic, depending on the value of the <tt>StaticGasBalances</tt> parameter.
<li>The fluid in the water side remains liquid throughout the boiler.
<li>The heat transfer coefficient on the water side is computed by Dittus-Boelter's correlation.
<li>The external heat transfer coefficient is computed according to the simple law declared <tt>Flow1DGasHT</tt>. To change that correlation, it is only necessary to change equations in that model.
</ul>
</html>"));
      end HeatExchanger;

      model Evaporator
        "Fire tube boiler, fixed heat transfer coefficient, no radiative heat transfer"

        replaceable package FlueGasMedium = ThermoPower.Media.FlueGas
          constrainedby Modelica.Media.Interfaces.PartialMedium
          "Flue gas model";
        replaceable package FluidMedium = ThermoPower.Water.StandardWater
          constrainedby Modelica.Media.Interfaces.PartialPureSubstance
          "Fluid model";

        parameter Integer N=2 "Number of node of the gas side";

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
        parameter SI.Area exchSurface
          "Exchange surface between gas - metal tube";
        parameter SI.Volume gasVol "Gas volume";
        parameter SI.Volume fluidVol "Fluid volume";
        parameter SI.Volume metalVol "Volume of the metal part in the tubes";
        parameter SI.Density rhom "Metal density";
        parameter SI.SpecificHeatCapacity cm
          "Specific heat capacity of the metal";

        //Start value
        parameter SI.Temperature Tstart "Average gas temperature start value"
          annotation (Dialog(tab="Initialization"));
        parameter SI.CoefficientOfHeatTransfer gamma
          "Constant heat transfer coefficient in the gas side";
        parameter Choices.Flow1D.FFtypes FFtype_G=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
          "Friction Factor Type, gas side";
        parameter Real Kfnom_G=0
          "Nominal hydraulic resistance coefficient, gas side";
        parameter SI.PressureDifference dpnom_G=0
          "Nominal pressure drop, gas side (friction term only!)";
        parameter SI.Density rhonom_G=0 "Nominal inlet density, gas side";
        parameter Real Cfnom_G=0 "Nominal Fanning friction factor, gsa side";
        parameter Boolean gasQuasiStatic=false
          "Quasi-static model of the flue gas (mass, energy and momentum static balances";
        constant Real pi=Modelica.Constants.pi;
        Water.DrumEquilibrium water(
          cm=cm,
          redeclare package Medium = FluidMedium,
          Vd=fluidVol,
          Mm=metalVol*rhom,
          pstart=fluidNomPressure,
          Vlstart=fluidVol*0.8)
          annotation (Placement(transformation(extent={{-24,18},{24,66}},
                rotation=0)));
        Thermal.HT_DHTVolumes      adapter(N=N - 1)
          annotation (Placement(transformation(
              origin={0,-8},
              extent={{-10,-10},{10,10}},
              rotation=270)));
        Water.FlangeA waterIn(redeclare package Medium = FluidMedium) annotation (
           Placement(transformation(extent={{-20,80},{20,120}}, rotation=0)));
        Water.FlangeB waterOut(redeclare package Medium = FluidMedium)
          annotation (Placement(transformation(extent={{-20,-120},{20,-80}},
                rotation=0)));
        Gas.FlangeA gasIn(redeclare package Medium = FlueGasMedium) annotation (
            Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
        Gas.FlangeB gasOut(redeclare package Medium = FlueGasMedium) annotation (
            Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
        Gas.Flow1DFV
                   gasFlow(
          Dhyd=1,
          wnom=gasNomFlowRate,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
          redeclare package Medium = FlueGasMedium,
          QuasiStatic=gasQuasiStatic,
          N=N,
          L=L,
          A=gasVol/L,
          omega=exchSurface/L,
          Tstartbar=Tstart,
          redeclare model HeatTransfer =
              Thermal.HeatTransferFV.ConstantHeatTransferCoefficient (gamma=gamma))
                            annotation (Placement(transformation(
              origin={0,-40},
              extent={{14,14},{-14,-14}},
              rotation=180)));

        Modelica.Blocks.Interfaces.RealOutput voidFraction annotation (Placement(
              transformation(extent={{96,50},{116,70}}, rotation=0)));
        final parameter SI.Distance L=1 "Tube length";
        Modelica.Blocks.Sources.RealExpression realExpression
          annotation (Placement(transformation(extent={{18,108},{38,128}})));
        Modelica.Blocks.Sources.RealExpression output1(y=water.Vv/water.Vd)
          annotation (Placement(transformation(extent={{54,52},{86,70}})));
      equation
        connect(water.feed, waterIn) annotation (Line(
            points={{-21.6,31.44},{-52,31.44},{-52,100},{0,100}},
            thickness=0.5,
            color={0,0,255}));
        connect(water.steam, waterOut) annotation (Line(
            points={{16.32,59.28},{40,59.28},{40,-70},{0,-70},{0,-100}},
            thickness=0.5,
            color={0,0,255}));
        connect(gasFlow.infl, gasIn) annotation (Line(
            points={{-14,-40},{-60,-40},{-60,0},{-100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(gasFlow.outfl, gasOut) annotation (Line(
            points={{14,-40},{60,-40},{60,0},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(output1.y, voidFraction) annotation (Line(points={{87.6,61},{96,61},{96,
                60},{106,60}}, color={0,0,127}));
        connect(adapter.DHT_port, gasFlow.wall) annotation (Line(points={{-1.9984e-15,
                -19},{-1.9984e-15,-32},{-8.88178e-16,-32},{-8.88178e-16,-33}}, color={
                255,127,0}));
        connect(adapter.HT_port, water.wall) annotation (Line(points={{2.19269e-15,4},
                {0,4},{0,20.4}}, color={191,0,0}));
        annotation (                   Icon(graphics={
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
                textString="%name")}));
      end Evaporator;

      model HRBPlant "Simple plant model with HRB"
        replaceable package GasMedium =
            Modelica.Media.IdealGases.MixtureGases.CombustionAir constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package WaterMedium = Modelica.Media.Water.WaterIF97_ph
          constrainedby Modelica.Media.Interfaces.PartialMedium;
        parameter SI.Time Ts=4 "Temperature sensor time constant";
        Models.HeatExchanger Boiler(
          redeclare package GasMedium = GasMedium,
          Nr=10,
          Lt=3,
          Dint=0.01,
          Dext=0.012,
          rhom=7800,
          cm=650,
          Sb=8,
          Lb=2,
          redeclare package WaterMedium = WaterMedium,
          StaticGasBalances=false,
          Nt=250)                  annotation (Placement(transformation(extent={{
                  -20,-20},{20,20}}, rotation=0)));
        Water.ValveLin Valve(Kv=20/4e5, redeclare package Medium = WaterMedium)
          annotation (Placement(transformation(extent={{36,-50},{56,-70}},
                rotation=0)));
        Water.SinkPressure SinkP1(redeclare package Medium = WaterMedium, p0=100000)
          annotation (Placement(transformation(extent={{70,-70},{90,-50}},
                rotation=0)));
        Gas.SourceMassFlow SourceW2(
          redeclare package Medium = GasMedium,
          w0=10,
          use_in_w0=true,
          p0=100000,
          T=670) annotation (Placement(transformation(extent={{-96,-10},{-76,10}},
                rotation=0)));
        Gas.SinkPressure
                  SinkP2(redeclare package Medium = GasMedium, T=300) annotation (
           Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        Gas.PressDropLin PressDropLin1(redeclare package Medium = GasMedium, R=
              1000/10) annotation (Placement(transformation(extent={{60,-10},{80,
                  10}}, rotation=0)));
        Water.SensT WaterIn(redeclare package Medium = WaterMedium) annotation (
            Placement(transformation(extent={{-40,44},{-20,64}}, rotation=0)));
        Water.SensT WaterOut(redeclare package Medium = WaterMedium) annotation (
            Placement(transformation(extent={{6,-66},{26,-46}}, rotation=0)));
        Gas.SensT GasOut(redeclare package Medium = GasMedium) annotation (
            Placement(transformation(extent={{30,-6},{50,14}}, rotation=0)));
        Gas.SensT GasIn(redeclare package Medium = GasMedium) annotation (
            Placement(transformation(extent={{-60,-6},{-40,14}}, rotation=0)));
        Water.SourcePressure SourceP1(redeclare package Medium = WaterMedium, p0=500000)
          annotation (Placement(transformation(extent={{-80,40},{-60,60}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealInput ValveOpening annotation (Placement(
              transformation(extent={{-170,-90},{-150,-70}}, rotation=0),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Blocks.Interfaces.RealOutput WaterOut_T annotation (Placement(
              transformation(extent={{160,-50},{180,-30}}, rotation=0),
              iconTransformation(extent={{94,-30},{114,-10}})));
        Modelica.Blocks.Interfaces.RealOutput WaterIn_T annotation (Placement(
              transformation(extent={{160,-110},{180,-90}}, rotation=0),
              iconTransformation(extent={{94,-70},{114,-50}})));
        Modelica.Blocks.Interfaces.RealOutput GasOut_T annotation (Placement(
              transformation(extent={{160,90},{180,110}}, rotation=0),
              iconTransformation(extent={{92,50},{112,70}})));
        Modelica.Blocks.Interfaces.RealOutput GasIn_T annotation (Placement(
              transformation(extent={{160,30},{180,50}}, rotation=0),
              iconTransformation(extent={{94,10},{114,30}})));
        Modelica.Blocks.Interfaces.RealInput GasFlowRate annotation (Placement(
              transformation(extent={{-170,70},{-150,90}}, rotation=0),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Blocks.Continuous.FirstOrder GasFlowActuator(
          k=1,
          T=1,
          y_start=5,
          initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(
              transformation(extent={{-130,70},{-110,90}}, rotation=0)));
        Modelica.Blocks.Continuous.FirstOrder WaterInTSensor(
          k=1,
          T=Ts,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=296) annotation (Placement(transformation(extent={{120,-110},{
                  140,-90}}, rotation=0)));
        Modelica.Blocks.Continuous.FirstOrder WaterOutTSensor(
          k=1,
          T=Ts,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=330) annotation (Placement(transformation(extent={{120,-50},{
                  140,-30}}, rotation=0)));
        Modelica.Blocks.Continuous.FirstOrder GasInTSensor(
          k=1,
          T=Ts,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=670) annotation (Placement(transformation(extent={{120,30},{140,
                  50}}, rotation=0)));
        Modelica.Blocks.Continuous.FirstOrder GasOutTSensor(
          k=1,
          T=Ts,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=350) annotation (Placement(transformation(extent={{120,90},{140,
                  110}}, rotation=0)));
        Modelica.Blocks.Continuous.FirstOrder ValveOpeningActuator(
          k=1,
          T=1,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=1) annotation (Placement(transformation(extent={{-130,-90},{-110,
                  -70}}, rotation=0)));
        inner System system(allowFlowReversal=false, initOpt=ThermoPower.Choices.Init.Options.steadyState)
          annotation (Placement(transformation(extent={{140,140},{160,160}})));
      equation
        connect(GasFlowActuator.y, SourceW2.in_w0) annotation (Line(points={{-109,
                80},{-92,80},{-92,5}}, color={0,0,127}));
        connect(GasInTSensor.u, GasIn.T) annotation (Line(points={{118,40},{-32,
                40},{-32,10},{-43,10}}, color={0,0,127}));
        connect(GasOut.T, GasOutTSensor.u) annotation (Line(points={{47,10},{60,
                10},{60,100},{118,100}}, color={0,0,127}));
        connect(GasOutTSensor.y, GasOut_T)
          annotation (Line(points={{141,100},{170,100}}, color={0,0,127}));
        connect(WaterIn.T, WaterInTSensor.u) annotation (Line(points={{-22,60},{
                94,60},{94,-100},{118,-100}}, color={0,0,127}));
        connect(WaterOut.T, WaterOutTSensor.u) annotation (Line(points={{24,-50},
                {24,-40},{118,-40}}, color={0,0,127}));
        connect(WaterOutTSensor.y, WaterOut_T)
          annotation (Line(points={{141,-40},{170,-40}}, color={0,0,127}));
        connect(GasInTSensor.y, GasIn_T)
          annotation (Line(points={{141,40},{170,40}}, color={0,0,127}));
        connect(Valve.cmd, ValveOpeningActuator.y) annotation (Line(points={{46,-68},
                {46,-80},{-109,-80}}, color={0,0,127}));
        connect(WaterInTSensor.y, WaterIn_T)
          annotation (Line(points={{141,-100},{170,-100}}, color={0,0,127}));
        connect(WaterOut.inlet, Boiler.waterOut) annotation (Line(
            points={{10,-60},{0,-60},{0,-20}},
            thickness=0.5,
            color={0,0,255}));
        connect(Boiler.gasIn, GasIn.outlet) annotation (Line(
            points={{-20,0},{-44,0}},
            color={159,159,223},
            thickness=0.5));
        connect(GasOut.inlet, Boiler.gasOut) annotation (Line(
            points={{34,0},{20,0}},
            color={159,159,223},
            thickness=0.5));
        connect(Boiler.waterIn, WaterIn.outlet) annotation (Line(
            points={{0,20},{0,50},{-24,50}},
            thickness=0.5,
            color={0,0,255}));
        connect(SourceP1.flange, WaterIn.inlet) annotation (Line(
            points={{-60,50},{-36,50}},
            thickness=0.5,
            color={0,0,255}));
        connect(WaterOut.outlet, Valve.inlet) annotation (Line(
            points={{22,-60},{36,-60}},
            thickness=0.5,
            color={0,0,255}));
        connect(Valve.outlet, SinkP1.flange) annotation (Line(
            points={{56,-60},{70,-60}},
            thickness=0.5,
            color={0,0,255}));
        connect(PressDropLin1.outlet, SinkP2.flange) annotation (Line(
            points={{80,0},{100,0}},
            color={159,159,223},
            thickness=0.5));
        connect(GasOut.outlet, PressDropLin1.inlet) annotation (Line(
            points={{46,0},{60,0}},
            color={159,159,223},
            thickness=0.5));
        connect(SourceW2.flange, GasIn.inlet) annotation (Line(
            points={{-76,0},{-56,0}},
            color={159,159,223},
            thickness=0.5));
        connect(GasFlowActuator.u, GasFlowRate)
          annotation (Line(points={{-132,80},{-160,80}}, color={0,0,127}));
        connect(ValveOpeningActuator.u, ValveOpening)
          annotation (Line(points={{-132,-80},{-160,-80}}, color={0,0,127}));
        annotation (
          Diagram(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-160,-160},{160,160}},
              initialScale=0.1), graphics),
          Documentation(revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
",     info=
          "<html>
Very simple plant model, providing boundary conditions to the <tt>HRB</tt> model.
</html>"),Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              initialScale=0.1), graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-72,74},{78,-60}},
                lineColor={0,0,255},
                lineThickness=0.5,
                textString="P")}));
      end HRBPlant;

      model DigitalPI
        extends Modelica.Blocks.Interfaces.DiscreteBlock;
        parameter Real Kp "Gain";
        parameter SI.Time Ti(min=0) "Integral time";
        parameter Real b(min=0) = 1 "Set-point weight (proportional action)";
        parameter Real CSmax "Control signal saturation upper bound";
        parameter Real CSmin "Control signal saturation lower bound";
        parameter Real CSstart(
          min=CSmin,
          max=CSmax) = 0 "Control signal start value";
        parameter Boolean StartSteadyState=false
          "True=steady state initial equations activated";

        discrete Real e "Sampled error signal";
        discrete Real e_int(start = CSstart/Kp*Ti) "Integrated error";
        discrete Real e_int_wind
          "Integrated error before anti-windup filtering";
        discrete Real CSwind "Control signal before anti-windup filtering";
        final parameter SI.Time Ts=samplePeriod "Sampling Time";
      public
        Modelica.Blocks.Interfaces.RealInput SP annotation (Placement(
              transformation(extent={{-120,40},{-80,80}},  rotation=0),
              iconTransformation(extent={{-120,40},{-80,80}})));
        Modelica.Blocks.Interfaces.RealOutput CS annotation (Placement(
              transformation(extent={{80,-20},{120,20}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput PV annotation (Placement(
              transformation(extent={{-120,-80},{-80,-40}}, rotation=0)));
      equation
        when {initial(),sampleTrigger} then
          e = SP - PV;
          e_int_wind = pre(e_int) + Ts*e;
          CSwind = Kp*(e_int_wind/Ti + e);
          if CSwind > CSmax then
            CS = CSmax;
            e_int = (CS/Kp - e)*Ti;
          elseif CSwind < CSmin then
            CS = CSmin;
            e_int = (CS/Kp - e)*Ti;
          else
            CS = CSwind;
            e_int = e_int_wind;
          end if;
        end when;

      initial equation
        if StartSteadyState then
          pre(e_int) = e_int;
        end if;

        annotation (
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
               graphics={
              Text(extent={{-56,96},{14,28}},  textString="SP"),
              Text(extent={{-58,-28},{14,-98}},  textString="PV"),
              Text(extent={{70,-20},{134,-86}}, textString="CS")}),
          Diagram(graphics),
          Documentation(info="<html>
This is the model of a digital PI controller, complete with auto/man and tracking functionalies.
</html>",   revisions="<html>
<ul>
<li><i>15 Sep 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</html>"));
      end DigitalPI;

    end Models;

    package Simulators "Simulation models for the HRB example"
        extends Modelica.Icons.ExamplesPackage;

      model OpenLoopSimulator "Open loop plant simulator"
        extends Modelica.Icons.Example;

        Models.HRBPlant
                 Plant(system(initOpt=ThermoPower.Choices.Init.Options.fixedState))
                       annotation (Placement(transformation(extent={{-10,-40},{
                  70,40}}, rotation=0)));
        Modelica.Blocks.Sources.Step ValveOpening(
          height=-0.1,
          offset=1,
          startTime=100)
                        annotation (Placement(transformation(extent={{-88,-40},
                  {-68,-20}},rotation=0)));
        Modelica.Blocks.Sources.Ramp GasFlowRate(
          offset=10,
          height=1,
          duration=0.1,
          startTime=200) annotation (Placement(transformation(extent={{-88,18},
                  {-68,38}}, rotation=0)));
        Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(
                extent={{-46,24},{-26,44}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput GasFlowRateInput annotation (
            Placement(transformation(extent={{-108,50},{-88,70}}, rotation=0),
              iconTransformation(extent={{-108,50},{-88,70}})));
        Modelica.Blocks.Interfaces.RealInput ValveOpeningInput annotation (
            Placement(transformation(extent={{-108,-70},{-88,-50}},rotation=0),
              iconTransformation(extent={{-108,-70},{-88,-50}})));
        Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(
                extent={{-44,-34},{-24,-14}},
                                            rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput TGoutOutput annotation (Placement(
              transformation(extent={{92,50},{112,70}}, rotation=0),
              iconTransformation(extent={{92,50},{112,70}})));
        Modelica.Blocks.Interfaces.RealOutput TWoutOutput annotation (Placement(
              transformation(extent={{90,-70},{110,-50}}, rotation=0)));
      equation
        connect(Plant.GasOut_T, TGoutOutput) annotation (Line(points={{70.8,24},
                {80,24},{80,60},{102,60}}, color={0,0,127}));
        connect(Plant.WaterOut_T, TWoutOutput) annotation (Line(points={{71.6,-8},
                {80,-8},{80,-60},{100,-60}},color={0,0,127}));
        connect(Add1.u2, GasFlowRate.y)
          annotation (Line(points={{-48,28},{-67,28}}, color={0,0,127}));
        connect(Add1.u1, GasFlowRateInput) annotation (Line(points={{-48,40},{
                -60,40},{-60,60},{-98,60}},
                                         color={0,0,127}));
        connect(Plant.GasFlowRate, Add1.y)
          annotation (Line(points={{-10,24},{-18,24},{-18,34},{-25,34}},
                                                       color={0,0,127}));
        connect(Plant.ValveOpening, Add2.y)
          annotation (Line(points={{-10,-24},{-18,-24},{-18,-24},{-23,-24}},
                                                       color={0,0,127}));
        connect(Add2.u2, ValveOpening.y) annotation (Line(points={{-46,-30},{
                -60,-30},{-67,-30}},       color={0,0,127}));
        connect(Add2.u1, ValveOpeningInput)
          annotation (Line(points={{-46,-18},{-74,-18},{-74,-60},{-98,-60}},
                                                      color={0,0,127}));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                  graphics),
          experiment(StopTime=300, Tolerance=1e-006),
          Documentation(revisions="<html>
<ul>
<li><i>20 Sep 2013</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    Updated and improved models and documentation.</li>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
",     info="<html>
<p>This model allows to simulate an open loop transient, using start attributes to select the initial values of the state variables. After about 50s, the plant reaches a steady state. </p>
<p>At time t =100 s, the water valve is closed by 10&percnt;. At time t = 200 s, the gas flow rate is increased by 10&percnt;.</p>
<p>The simulator is provided with external inputs to apply changes to the system input. If the system is simulated alone, these are taken to be zero by default, so the step responses can be computed. If the system is linearized at time t = 99, the A,B,C,D matrices of the linearized model around the initial steady state can be obtained.</p>
</html>"),__Dymola_experimentSetupOutput,
          Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255})}));
      end OpenLoopSimulator;

      model OpenLoopSimulatorSS
        "Open loop plant simulator, steady-state initialization"
        extends OpenLoopSimulator(Plant(system(initOpt=ThermoPower.Choices.Init.Options.steadyState)));
        annotation (
          Diagram(graphics),
          experiment(StopTime=300, Tolerance=1e-006),
          Documentation(revisions="<html>
<ul>
<li><i>20 Sep 2013</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    Updated and improved models and documentation.</li>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
",     info="<html>
<p>This model is the same as OpenLoopSimulator, except that it starts directly from a steady state. This requires the solution of a system of nonlinear equations, which might lead to some numerical problems. If the solver is successful, the first relaxation transient of OpenLoopSimulator, which has no physical meaning, is avoided. </p>
<p>At time t = 100 s, the water valve is closed by 10&percnt;. At time t = 200 s, the gas flow rate is increased by 10&percnt;. </p>
<p>The simulator is provided with external inputs to apply changes to the system input. If the system is simulated alone, these are taken to be zero by default, so the step responses can be computed. If the system is linearized at t = 0, the A,B,C,D matrices of the linearized model around the steady state can be obtained.</p>
</html>"),__Dymola_experimentSetupOutput);
      end OpenLoopSimulatorSS;

      model OpenLoopSimulatorHtc
        "Open-loop plant simulator with parameter computation"
        extends OpenLoopSimulatorSS(Plant(Boiler(gamma_nom = gamma_unknown)));
        parameter SI.CoefficientOfHeatTransfer gamma_unknown(fixed = false, start = 150);
      initial equation
        Plant.GasOut.T = Modelica.Units.Conversions.from_degC(130);
        annotation (Documentation(revisions="<html>
<ul>
<li><i>20 Sep 2013</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    Updated and improved models and documentation.</li>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
",     info="<html>
<p>This example shows how to use a Modelica model to solve for some unknown parameters, given some desired system output (please look at the Modelica textual code). In this case, the nominal heat transfer coefficient <code>Plant.Boiler.gamma_nom</code> is computed in order to obtain an initial value of the gas outlet temperature equal to 130 degrees Celsius. This can be used to match the model to known design data. Note that steady-state initial conditions are required to make the computation meaningful.</p>
<p>This is performed by defining a <code>gamma_unknown</code> parameter at the top level, with a <code>fixed = false</code> attribute (meaning that its value is a unknown) and with a <code>start = 150</code> attribute to provide a reasonable initial guess for the solver. This parameter is then used to override the value of <code>Plant.Boiler.gamma_nom</code>. In order to obtain a closed initialization problem, a corresponding initial equation to set the desired value of <code>Plant.GasOut.T is added.</code> </p>
<p>The transient starts at steady state, with the desired values of the heat transfer coefficient and gas outlet temperature. At time t = 100 s, the water valve is closed by 10&percnt;. At time t = 200 s, the gas flow rate is increased by 10&percnt;. </p>
</html>"), experiment(StopTime=300, Tolerance=1e-006),
          __Dymola_experimentSetupOutput);
      end OpenLoopSimulatorHtc;

      model OpenLoopSimulatorSimplified
        "Open loop plant simulator with simplified fluid models"
        extends OpenLoopSimulatorSS(
            Plant(
              redeclare package WaterMedium =
                Modelica.Media.CompressibleLiquids.LinearWater_pT_Ambient,
              redeclare package GasMedium =
                Modelica.Media.IdealGases.MixtureGases.CombustionAir (fixedX=true)));
        annotation (experiment(StopTime=300, Tolerance=1e-006),
                                              Documentation(info="<html>
<p>This model extends <code>OpenLoopSimulatorSS</code>, with some modifiers to obtain a simplified version: the water medium model is replaced by a simpler one, the gas medium is assumed at fixed composition, and static balances are assumed for the gas side. As a result, the simulation is much faster.</p>
</html>", revisions="<html>
<ul>
<li><i>20 Sep 2013</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    Updated and improved models and documentation.</li>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
"),       __Dymola_experimentSetupOutput);
      end OpenLoopSimulatorSimplified;

      model ClosedLoopSimulator
        "Plant simulation with analogue temperature controller"
        extends Modelica.Icons.Example;

        Models.HRBPlant
                 Plant(Boiler(
            GasSide(initOpt=ThermoPower.Choices.Init.Options.steadyState),
            WaterSide(initOpt=ThermoPower.Choices.Init.Options.steadyState),
            TubeWalls(initOpt=ThermoPower.Choices.Init.Options.steadyState)))
                       annotation (Placement(transformation(extent={{26,-32},{76,20}},
                           rotation=0)));
        Modelica.Blocks.Sources.Step ValveOpening(
          offset=1,
          startTime=50,
          height=-0.1) annotation (Placement(transformation(extent={{-20,-32},{0,-12}},
                             rotation=0)));
        Modelica.Blocks.Continuous.PI TempController(
          initType=Modelica.Blocks.Types.Init.SteadyState,
          k=0.4,
          T=20)                                                   annotation (
            Placement(transformation(extent={{-20,0},{0,20}}, rotation=0)));
        Modelica.Blocks.Math.Feedback Feedback1 annotation (Placement(
              transformation(extent={{-50,20},{-30,0}}, rotation=0)));
        Modelica.Blocks.Sources.Step TWOutSetPoint(
          offset=330,
          height=10,
          startTime=200) annotation (Placement(transformation(extent={{-80,0},{
                  -60,20}}, rotation=0)));
      equation
        connect(ValveOpening.y, Plant.ValveOpening) annotation (Line(points={{1,-22},
                {26,-22},{26,-21.6}},           color={0,0,127}));
        connect(TempController.y, Plant.GasFlowRate) annotation (Line(points={{1,10},{
                26,10},{26,9.6}},             color={0,0,127}));
        connect(Feedback1.y, TempController.u)
          annotation (Line(points={{-31,10},{-22,10}}, color={0,0,127}));
        connect(Plant.WaterOut_T, Feedback1.u2) annotation (Line(points={{77,-11.2},{94,
                -11.2},{94,40},{-40,40},{-40,18}},                   color={0,0,
                127}));
        connect(TWOutSetPoint.y, Feedback1.u1)
          annotation (Line(points={{-59,10},{-48,10}}, color={0,0,127}));

        annotation (
          Diagram(graphics),
          experiment(StopTime=400),
          Documentation(revisions="<html>
<ul>
<li><i>20 Sep 2013</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    Updated and improved models and documentation.</li>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
",     info="<html>
<p>This model simulates a simple continuous-time control system for the HRB. The water outlet temperature is controlled to the set point by a PI controller acting on the gas flow rate, rejecting the disturbances due to the changing water flow rate. </p>
<p>The system starts at steady state; at t = 50 s, the water flow rate is reduced by 10&percnt;; at t = 200 s, the water temperature set point is increased by 10 K. </p>
</html>"),__Dymola_experimentSetupOutput);
      end ClosedLoopSimulator;

      model ClosedLoopDigitalSimulator
        "Plant simulation with digital temperature controller"
        extends Modelica.Icons.Example;

        Models.HRBPlant
                 Plant(Boiler(
            GasSide(initOpt=ThermoPower.Choices.Init.Options.steadyState),
            WaterSide(initOpt=ThermoPower.Choices.Init.Options.steadyState),
            TubeWalls(initOpt=ThermoPower.Choices.Init.Options.steadyState)))
                       annotation (Placement(transformation(extent={{10,-30},{60,20}},
                           rotation=0)));
        Modelica.Blocks.Sources.Step ValveOpening(
          height=-0.1,
          offset=1,
          startTime=50) annotation (Placement(transformation(extent={{-36,-46},{-16,-26}},
                             rotation=0)));
        Modelica.Blocks.Sources.Step TWOutSetPoint(
          offset=330,
          height=10,
          startTime=200) annotation (Placement(transformation(extent={{-76,-6},{-56,14}},
                            rotation=0)));
        Models.DigitalPI
                  DigitalPI1(
          CSmin=5,
          CSstart=6.2,
          StartSteadyState=true,
          Kp=0.4,
          Ti=20,
          CSmax=15,
          samplePeriod=3)        annotation (Placement(transformation(extent={{-36,20},
                  {-16,0}},         rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(ValveOpening.y, Plant.ValveOpening) annotation (Line(points={{-15,-36},
                {-2,-36},{-2,-20},{10,-20}},    color={0,0,127}));
        connect(TWOutSetPoint.y, DigitalPI1.SP) annotation (Line(
            points={{-55,4},{-36,4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(DigitalPI1.CS, Plant.GasFlowRate) annotation (Line(
            points={{-16,10},{10,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Plant.WaterOut_T, DigitalPI1.PV) annotation (Line(
            points={{61,-10},{94,-10},{94,40},{-48,40},{-48,16},{-36,16}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}),
                  graphics),
          experiment(
            StopTime=400,
            Tolerance=1e-006,
            __Dymola_Algorithm="Dassl"),
          Documentation(revisions="<html>
<ul>
<li><i>20 Sep 2013</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    Updated and improved models and documentation.</li>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
",     info="<html>
<p>This model simulates the same scenario as ClosedLoopSimulator, using a digital PI controller with a sample time of 2 s.</p>
</html>"),__Dymola_experimentSetupOutput);
      end ClosedLoopDigitalSimulator;

      model ClosedLoopDigitalSimulatorSimplified
        "Plant simulation with digital temperature controller and simplified fluid models"

        extends ClosedLoopDigitalSimulator(Plant(
            redeclare package WaterMedium =
                Modelica.Media.CompressibleLiquids.LinearWater_pT_Ambient,
            redeclare package GasMedium =
                Modelica.Media.IdealGases.MixtureGases.CombustionAir (
                 fixedX=true)));
            //redeclare package WaterMedium = Media.LiquidWaterConstant,
        annotation (experiment(
            StopTime=300,
            Tolerance=1e-006,
            __Dymola_Algorithm="Dassl"),
                                Documentation(info="<html>
<p>This model is the same as ClosedLoopDigitalSimulator, using the simplified process model. The simulation speed is approximately three times faster than in the case of the full model.</p>
</html>", revisions="<html>
<ul>
<li><i>20 Sep 2013</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    Updated and improved models and documentation.</li>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
"),       __Dymola_experimentSetupOutput);
      end ClosedLoopDigitalSimulatorSimplified;

      model TestPI "Test model for digital PI controller"
        extends Modelica.Icons.Example;

        ThermoPower.Examples.HRB.Models.DigitalPI digitalPI(
          Kp=4,
          Ti=8,
          CSmax=1,
          CSmin=-1,
          samplePeriod=1)
          annotation (Placement(transformation(extent={{-20,0},{0,20}})));
        Modelica.Blocks.Continuous.Integrator integrator(k=0.1)
          annotation (Placement(transformation(extent={{40,0},{60,20}})));
        Modelica.Blocks.Sources.TimeTable timeTable(table=[0,0; 1,0; 1,1; 40,1;
              40,1.2; 80,1.2; 80,0; 200.0,0.0])
          annotation (Placement(transformation(extent={{-76,6},{-56,26}})));
      equation
        connect(digitalPI.CS, integrator.u) annotation (Line(
            points={{0,10},{38,10}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, digitalPI.PV) annotation (Line(
            points={{61,10},{80,10},{80,-22},{-32,-22},{-32,4},{-20,4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(timeTable.y, digitalPI.SP) annotation (Line(
            points={{-55,16},{-20,16}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics),
          experiment(StopTime=120),
          __Dymola_experimentSetupOutput);
      end TestPI;
    end Simulators;
    annotation (Documentation(revisions="<html>
<ul>
<li><i>26 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
This package contains models of a simple Heat Recovery Boiler. Different simulation models are provided, demonstrating how to initialise and run open-loop as well as closed loop simulations.
</html>"));
  end HRB;
end Examples;
