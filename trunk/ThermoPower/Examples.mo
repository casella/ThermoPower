within ThermoPower;
package Examples "Application examples"
  extends Modelica.Icons.ExamplesPackage;

  package CISE "CISE plant models"
    extends Modelica.Icons.Library;
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
        pstart=60e5,
        hvstart=2.78e6,
        tauc=5,
        gv=150,
        hlstart=1.15e5,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) annotation (
          Placement(transformation(extent={{-120,24},{-60,84}}, rotation=0)));
      Water.SourceMassFlow
                    FeedWater(h=1.1059e6,
        use_in_w0=true,
        use_in_h=true)                    annotation (Placement(transformation(
              extent={{-176,34},{-146,64}}, rotation=0)));
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
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Colebrook,
        redeclare
          ThermoPower.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
          heatTransfer(gamma=1800),
        dpnom=1000,
        pstart=6000000) annotation (Placement(transformation(
            origin={-167,-67},
            extent={{-15,-15},{15,15}},
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
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Colebrook,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        redeclare
          ThermoPower.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
          heatTransfer(gamma=10000),
        dpnom=3000,
        pstart=6118000) annotation (Placement(transformation(
            origin={-19,-125},
            extent={{-15,15},{15,-15}},
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
        initOpt=ThermoPower.Choices.Init.Options.steadyStateNoP,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Upstream,
        redeclare
          ThermoPower.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
          heatTransfer(gamma=10000),
        dpnom=17000,
        pstart=6000000) annotation (Placement(transformation(
            origin={-19,-17},
            extent={{-15,15},{15,-15}},
            rotation=90)));
      Water.SinkMassFlow
                  Blowdown(w0=0) annotation (Placement(transformation(extent={{
                -80,-20},{-50,10}}, rotation=0)));
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
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        dpnom=2000,
        pstart=6000000,
        redeclare
          ThermoPower.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
          heatTransfer(gamma=3000))
                        annotation (Placement(transformation(extent={{-54,80},{
                -24,110}}, rotation=0)));
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
        initOpt=ThermoPower.Choices.Init.Options.steadyStateNoP,
        dpnom=170000,
        pstart=5900000,
        redeclare ThermoPower.Thermal.HeatTransfer.HeatTransfer2phDB
                                                                   heatTransfer(
            gamma_b=20000))
                        annotation (Placement(transformation(extent={{-6,80},{
                24,110}}, rotation=0)));
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
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Upstream,
        dpnom=1000,
        pstart=5600000,
        redeclare
          ThermoPower.Thermal.HeatTransfer.ConstantHeatTransferCoefficient
          heatTransfer(gamma=3000))
                        annotation (Placement(transformation(extent={{44,80},{
                74,110}}, rotation=0)));
      Water.ValveVap Valve(
        redeclare package Medium = Medium,
        pnom=54.497e5,
        wnom=2*0.06,
        Av=2.7e-5,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av,
        dpnom=4899700) annotation (Placement(transformation(extent={{92,80},{
                122,110}}, rotation=0)));
      Water.SinkPressure
                  Sink(p0=5.5e5) annotation (Placement(transformation(extent={{
                138,80},{168,110}}, rotation=0)));
      Thermal.HeatSource1DFV
                           HeatSourceSH(Nw=4)
             annotation (Placement(transformation(extent={{-6,126},{24,156}},
              rotation=0)));
      Thermal.HeatSource1DFV
                           HeatSourceRisers(Nw=6)
             annotation (Placement(transformation(
            origin={39,-125},
            extent={{-15,-15},{15,15}},
            rotation=270)));
      Water.Header HeaderLower(
        redeclare package Medium = Medium,
        V=8.372e-4,
        S=7.184e-2,
        gamma=2000,
        Cm=4.08e6*4.51e-4,
        hstart=1.1e6,
        Tmstart=540,
        pstart=61.18e5,
        initOpt=ThermoPower.Choices.Init.Options.steadyStateNoP) annotation (
          Placement(transformation(extent={{-140,-180},{-110,-150}}, rotation=0)));
      Water.Header HeaderUpper(
        redeclare package Medium = Medium,
        V=8.372e-4,
        S=7.184e-2,
        gamma=2000,
        Cm=4.08e6*4.51e-4,
        pstart=60.2e5,
        Tmstart=540,
        hstart=1.6e6,
        initOpt=ThermoPower.Choices.Init.Options.steadyStateNoP) annotation (
          Placement(transformation(
            origin={-19,-71},
            extent={{-15,-15},{15,15}},
            rotation=90)));
      Thermal.MetalTubeFV
                        DowncomerWall(
        L=15.923,
        rint=0.02461,
        rext=0.03015,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        Nw=1,
        Tstart1=540,
        TstartN=540)                                          annotation (
          Placement(transformation(
            origin={-144,-67},
            extent={{-15,-16},{15,16}},
            rotation=90)));
      Thermal.MetalTubeFV
                        RisersWalls(
        L=14.16,
        rint=0.01048,
        rext=0.01335,
        lambda=19,
        rhomcm=4.08e6,
        WallRes=true,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        Nw=6,
        Nt=6,
        Tstart1=548,
        TstartN=548)                                          annotation (
          Placement(transformation(
            origin={5,-125},
            extent={{-15,-15},{15,15}},
            rotation=90)));
      Thermal.MetalTubeFV
                        Pipe2DrumWall(
        L=2.779,
        rint=0.0133,
        rext=0.0167,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        Nw=1,
        Tstart1=548,
        TstartN=548)                                          annotation (
          Placement(transformation(
            origin={3,-17},
            extent={{-15,-15},{15,15}},
            rotation=90)));
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
            origin={-39,115},
            extent={{-15,-15},{15,15}},
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
            origin={9,115},
            extent={{-15,-15},{15,15}},
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
            origin={59,115},
            extent={{-15,-15},{15,15}},
            rotation=180)));
      Water.PressDrop PressDrop(
        redeclare package Medium = Medium,
        wnom=0.23,
        wnf=0.1,
        K=3,
        A=5.62e-5,
        Kfc=2,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        dpnom=1) annotation (Placement(transformation(extent={{-76,-180},{-46,-150}},
              rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput DrumPressure annotation (Placement(
            transformation(extent={{200,20},{220,40}}, rotation=0),
            iconTransformation(extent={{90,20},{110,40}})));
      Modelica.Blocks.Interfaces.RealOutput DrumLevel annotation (Placement(
            transformation(extent={{200,-40},{220,-20}}, rotation=0),
            iconTransformation(extent={{90,-50},{110,-30}})));
      Modelica.Blocks.Interfaces.RealInput FeedWaterFlow annotation (Placement(
            transformation(extent={{-210,90},{-190,110}}, rotation=0),
            iconTransformation(extent={{-120,72},{-102,89}})));
      Modelica.Blocks.Interfaces.RealInput RiserPower annotation (Placement(
            transformation(extent={{210,-130},{190,-110}}, rotation=0),
            iconTransformation(extent={{-120,-48},{-102,-30}})));
      Modelica.Blocks.Interfaces.RealInput ValveOpening annotation (Placement(
            transformation(extent={{210,90},{190,110}}, rotation=0),
            iconTransformation(extent={{-120,-9},{-102,9}})));
      Modelica.Blocks.Interfaces.RealInput SHPower annotation (Placement(
            transformation(extent={{210,150},{190,170}}, rotation=0),
            iconTransformation(extent={{-120,-88},{-103,-71}})));
      Modelica.Blocks.Interfaces.RealInput FeedWaterEnthalpy annotation (
          Placement(transformation(extent={{-210,150},{-190,170}}, rotation=0),
            iconTransformation(extent={{-120,31},{-102,49}})));
      inner System system(allowFlowReversal=false)
        annotation (Placement(transformation(extent={{-120,160},{-100,180}})));
    equation
      connect(Pipe2Drum.infl, HeaderUpper.outlet) annotation (Line(
          points={{-19,-32},{-19,-56}},
          color={0,0,255},
          thickness=0.5));
      connect(HeaderUpper.inlet, Risers.outfl) annotation (Line(
          points={{-19,-86.15},{-19,-110}},
          color={0,0,255},
          thickness=0.5));
      connect(SH.outfl, Pipe2Valve.infl) annotation (Line(
          points={{24,95},{44,95}},
          color={0,0,255},
          thickness=0.5));
      connect(Valve.outlet, Sink.flange) annotation (Line(
          points={{122,95},{138,95}},
          color={0,0,255},
          thickness=0.5));
      connect(Pipe2Valve.outfl, Valve.inlet) annotation (Line(
          points={{74,95},{92,95}},
          color={0,0,255},
          thickness=0.5));
      connect(HeaderLower.outlet, PressDrop.inlet) annotation (Line(
          points={{-110,-165},{-76,-165}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDrop.outlet, Risers.infl) annotation (Line(
          points={{-46,-165},{-19,-165},{-19,-140}},
          color={0,0,255},
          thickness=0.5));
      connect(RisersWalls.ext, HeatSourceRisers.wall) annotation (Line(points={{9.65,
              -125},{34.5,-125}},        color={255,127,0}));
      DrumPressure = Drum.p;
      DrumLevel = Drum.y;
      connect(Blowdown.flange, Drum.blowdown) annotation (Line(
          points={{-80,-5},{-90,-5},{-90,24.6}},
          thickness=0.5,
          color={0,0,255}));
      connect(SH.infl, Pipe2SH.outfl) annotation (Line(
          points={{-6,95},{-24,95}},
          thickness=0.5,
          color={0,0,255}));
      connect(HeaderLower.inlet, Downcomer.outfl) annotation (Line(
          points={{-140.15,-165},{-167,-165},{-167,-82}},
          thickness=0.5,
          color={0,0,255}));
      connect(Downcomer.infl, Drum.downcomer) annotation (Line(
          points={{-167,-52},{-111,33}},
          thickness=0.5,
          color={0,0,255}));
      connect(Pipe2Drum.outfl, Drum.riser) annotation (Line(
          points={{-19,-2},{-66.6,36.9}},
          thickness=0.5,
          color={0,0,255}));
      connect(Pipe2SH.infl, Drum.steam) annotation (Line(
          points={{-54,95},{-72.6,75}},
          thickness=0.5,
          color={0,0,255}));
      connect(FeedWater.flange, Drum.feedwater) annotation (Line(
          points={{-146,49},{-119.1,49.5}},
          thickness=0.5,
          color={0,0,255}));
      connect(FeedWaterEnthalpy, FeedWater.in_h) annotation (Line(points={{-200,
              160},{-155,160},{-155,58}}, color={0,0,127}));
      connect(FeedWaterFlow, FeedWater.in_w0) annotation (Line(points={{-200,
              100},{-167,100},{-167,58}}, color={0,0,127}));
      connect(RiserPower, HeatSourceRisers.power) annotation (Line(points={{200,
              -120},{120,-120},{120,-125},{45,-125}}, color={0,0,127}));
      connect(ValveOpening, Valve.theta) annotation (Line(points={{200,100},{
              174,100},{174,130},{107,130},{107,107}}, color={0,0,127}));
      connect(SHPower, HeatSourceSH.power) annotation (Line(points={{200,160},{
              106,160},{9,160},{9,147}},           color={0,0,127}));
      connect(SHWall.ext, HeatSourceSH.wall)
        annotation (Line(points={{9,119.65},{9,136.5}}, color={255,127,0}));
      connect(Downcomer.wall, DowncomerWall.int) annotation (Line(
          points={{-159.5,-67},{-148.8,-67}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(Risers.wall, RisersWalls.int) annotation (Line(
          points={{-11.5,-125},{0.5,-125}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(Pipe2Drum.wall, Pipe2DrumWall.int) annotation (Line(
          points={{-11.5,-17},{-1.5,-17}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(SHWall.int, SH.wall) annotation (Line(
          points={{9,110.5},{9,102.5}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(Pipe2SHWall.int, Pipe2SH.wall) annotation (Line(
          points={{-39,110.5},{-39,102.5}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(Pipe2ValveWall.int, Pipe2Valve.wall) annotation (Line(
          points={{59,110.5},{59,102.5}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-200,-200},{200,200}},
            initialScale=0.1), graphics),
        Documentation(info="<HTML>
<p>This is the model of the CISE steam generation plant described in the paper: F. Casella, A. Leva, \"Modelica open library for power plant simulation: design and experimental validation\", <i>Proceedings of the 2003 Modelica Conference</i>, Link&ouml eping, Sweden, 2003.
<p>The geometric parameters are already set. The start values set in the model parameters are guess values around the nominal full load steady state (60 bar drum pressure).
<p><b>This model cannot be simulated alone</b>, as the boundary conditions (feedwater flowrate and enthalpy, steam valve opening, power to the risers and power to the superheater) are not set. See the <tt>CiseSim</tt> model instead.
</HTML>
",     revisions="<html>
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
</html>"),
        Icon(coordinateSystem(
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

    model CISESim
      "CISE Plant model with boundary conditions and initial steady-state computation"
      parameter MassFlowRate wfeed_offset(fixed=false, start = 6.0e-2)
        "Offset of feedwater flow rate";
      parameter Real ValveOpening_offset(fixed=false, start = 0.4)
        "Offset of valve opening";
      parameter Pressure InitialDrumPressure=5.9359e+006;
      parameter Length InitialDrumLevel=-0.091;

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
      CISEPlant Plant
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
",     revisions=
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
</html>"),
        experiment(StopTime=1200, Tolerance=1e-006),
        experimentSetupOutput,
        Icon(coordinateSystem(extent={{-160,-160},{200,160}})));
    end CISESim;

    model CISESim120501
      extends CISESim(
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
</html>", revisions="<html>
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
</html>"), experiment(
          StopTime=1200,
          NumberOfIntervals=1000,
          Tolerance=1e-007));
    end CISESim120501;

    model CISESim180503
      extends CISESim(
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
</html>", revisions="<html>
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
</html>"), experiment(
          StopTime=1200,
          NumberOfIntervals=1000,
          Tolerance=1e-007));
    end CISESim180503;

    model CISESim180504
      extends CISESim(
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

</html>", revisions="<html>
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
</html>"), experiment(
          StopTime=1200,
          NumberOfIntervals=1000,
          Tolerance=1e-007));
    end CISESim180504;

    model CISEPlant2States "Simplified model of the CISE lab steam generator"
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      constant Real pi=Modelica.Constants.pi;
      parameter Length r=0.115 "Drum diameter";
      parameter Length H=1.455 "Drum height";
      Pressure DrumPressure;
      Length DrumLevel;
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
        redeclare
          ThermoPower.Water.HeatTransfer.ConstantHeatTransferCoefficient
          heatTransfer(gamma=3000))
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
        redeclare ThermoPower.Thermal.HeatTransfer.HeatTransfer2phDB
                                                                   heatTransfer,
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
        redeclare
          ThermoPower.Water.HeatTransfer.ConstantHeatTransferCoefficient
          heatTransfer(gamma=3000))
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
      connect(FeedWaterEnthalpy, FeedWater.in_h) annotation (Line(points={{-100,
              57},{-78,57},{-78,16}}, color={0,0,127}));
      connect(FeedWaterFlow, FeedWater.in_w0) annotation (Line(points={{-100,30},
              {-86,30},{-86,16}}, color={0,0,127}));
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
", revisions="<html>
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
</html>"),
        Icon(graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-56,76},{64,-60}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="P")}));
    end CISEPlant2States;

    model CISESim2States
      "CISE plant reduced model with boundary conditions and initial steady-state computation"
      parameter MassFlowRate wfeed_offset(fixed=false, start = 6.0e-2)
        "Offset of feedwater flow rate";
      parameter Real ValveOpening_offset(fixed=false, start = 0.4)
        "Offset of valve opening";
      parameter Pressure InitialDrumPressure=5.9359e+006;
      parameter Length InitialDrumLevel=-0.091;
      CISEPlant2States Plant annotation (Placement(transformation(extent={{100,
                -20},{160,40}}, rotation=0)));
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
",     revisions=
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

    model CISESim2States120501
      extends CISESim2States(
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
</html>", revisions="<html>
<ul>
<li><i>25 Nov 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release as extension of <tt>CISESim2States</tt>.</li>
</ul>
</html>"), experiment(
          StopTime=1200,
          NumberOfIntervals=1000,
          Tolerance=1e-007));
    end CISESim2States120501;
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
    extends Modelica.Icons.Library;

    package Models
      extends Modelica.Icons.Library;
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
        parameter Length Lt "Length of a tube in a row";
        parameter Length Dint "Internal diameter of each tube";
        parameter Length Dext "External diameter of each tube";
        parameter Density rhom "Density of the tube metal walls";
        parameter SpecificHeatCapacity cm
          "Specific heat capacity of the tube metal walls";
        parameter Area Sb "Cross-section of the boiler (including tubes)";
        final parameter Area Sb_net = Sb - Nr*Nt*Dext*pi*Lt
          "Net cross-section of the boiler";
        parameter Length Lb "Length of the boiler";
        parameter Area St=Dext*pi*Lt*Nt*Nr
          "Total area of the heat exchange surface";
        parameter CoefficientOfHeatTransfer gamma_nom=150
          "Nominal heat transfer coefficient";

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
          redeclare ThermoPower.Thermal.HeatTransfer.DittusBoelter heatTransfer,
          initOpt=ThermoPower.Choices.Init.Options.noInit,
          dpnom=1000) annotation (Placement(
              transformation(extent={{-20,-70},{20,-30}}, rotation=0)));
        Thermal.MetalTubeFV
                          TubeWalls(
          rint=Dint/2,
          rext=Dext/2,
          rhomcm=rhom*cm,
          lambda=20,
          L=Lt*Nr,
          Nw=Nr,
          Tstart1=300,
          TstartN=340,
          initOpt=ThermoPower.Choices.Init.Options.noInit) "Tube"
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
          redeclare
            ThermoPower.Thermal.HeatTransfer.FlowDependentHeatTransferCoefficient
            heatTransfer(gamma_nom=gamma_nom, alpha=0.6),
          initOpt=ThermoPower.Choices.Init.Options.noInit,
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
<li>The gas flows through a volume having a (net) cross-section <tt>Sb</tt> and a (net) lenght <tt>Lb</tt>. 
<li>Mass and energy dynamic balances are assumed for the water side.
<li>The mass and energy balances for the gas side are either static or dynamic, depending on the value of the <tt>StaticGasBalances</tt> parameter.
<li>The fluid in the water side remains liquid throughout the boiler.
<li>The heat transfer coefficient on the water side is computed by Dittus-Boelter's correlation.
<li>The external heat transfer coefficient is computed according to the simple law declared <tt>Flow1DGasHT</tt>. To change that correlation, it is only necessary to change equations in that model.
</ul>
</html>"));
      end HeatExchanger;

      model HRBPlant "Simple plant model with HRB"
        replaceable package GasMedium =
            Modelica.Media.IdealGases.MixtureGases.CombustionAir constrainedby
          Modelica.Media.Interfaces.PartialMedium;
        replaceable package WaterMedium = Modelica.Media.Water.WaterIF97_ph
          constrainedby Modelica.Media.Interfaces.PartialMedium;
        parameter Time Ts=4 "Temperature sensor time constant";
        Models.HeatExchanger
                      Boiler(
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
        Water.SinkPressure
                    SinkP1(redeclare package Medium = WaterMedium, p0=100000)
          annotation (Placement(transformation(extent={{70,-70},{90,-50}},
                rotation=0)));
        Gas.SourceMassFlow
                    SourceW2(
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
        Water.SourcePressure
                      SourceP1(redeclare package Medium = WaterMedium, p0=500000)
          annotation (Placement(transformation(extent={{-80,40},{-60,60}},
                rotation=0)));
        Modelica.Blocks.Interfaces.RealInput ValveOpening annotation (Placement(
              transformation(extent={{-170,-90},{-150,-70}}, rotation=0),
              iconTransformation(extent={{-110,-68},{-90,-48}})));
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
              iconTransformation(extent={{92,10},{112,30}})));
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
        inner System system(allowFlowReversal=false)
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
</html>"),experiment(
            StopTime=1200,
            NumberOfIntervals=1000,
            Tolerance=1e-007),
          Icon(coordinateSystem(
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
        parameter Modelica.SIunits.Time Ti(min=0) "Integral time";
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
        final parameter Modelica.SIunits.Time Ts=samplePeriod "Sampling Time";
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

        Models.HRBPlant
                 Plant annotation (Placement(transformation(extent={{-10,-26},{
                  70,54}}, rotation=0)));
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
            Placement(transformation(extent={{-110,70},{-90,90}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput ValveOpeningInput annotation (
            Placement(transformation(extent={{-110,-10},{-90,10}}, rotation=0)));
        Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(
                extent={{-46,-16},{-26,4}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput TGoutOutput annotation (Placement(
              transformation(extent={{90,70},{110,90}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput TWoutOutput annotation (Placement(
              transformation(extent={{90,-70},{110,-50}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{40,80},{60,100}})));
      equation
        connect(Plant.GasOut_T, TGoutOutput) annotation (Line(points={{70.8,38},{80,38},
                {80,80},{100,80}},         color={0,0,127}));
        connect(Plant.WaterOut_T, TWoutOutput) annotation (Line(points={{71.6,6},{80,6},
                {80,-60},{100,-60}},        color={0,0,127}));
        connect(Add1.u2, GasFlowRate.y)
          annotation (Line(points={{-48,28},{-67,28}}, color={0,0,127}));
        connect(Add1.u1, GasFlowRateInput) annotation (Line(points={{-48,40},{-60,
                40},{-60,80},{-100,80}}, color={0,0,127}));
        connect(Plant.GasFlowRate, Add1.y)
          annotation (Line(points={{-10,38},{-18,38},{-18,34},{-25,34}},
                                                       color={0,0,127}));
        connect(Plant.ValveOpening, Add2.y)
          annotation (Line(points={{-10,-9.2},{-18,-9.2},{-18,-6},{-25,-6}},
                                                       color={0,0,127}));
        connect(Add2.u2, ValveOpening.y) annotation (Line(points={{-48,-12},{-60,
                -12},{-60,-30},{-67,-30}}, color={0,0,127}));
        connect(Add2.u1, ValveOpeningInput)
          annotation (Line(points={{-48,0},{-100,0}}, color={0,0,127}));
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
<p>This model allows to simulate an open loop transient, using start attributes to select the initial values of the state variables. After about 50s, the plant reaches a steady state. </p>
<p>At time t =100 s, the water valve is closed by 10&percnt;. At time t = 200 s, the gas flow rate is increased by 10&percnt;.</p>
<p>The simulator is provided with external inputs to apply changes to the system input. If the system is simulated alone, these are taken to be zero by default, so the step responses can be computed. If the system is linearized at time t = 99, the A,B,C,D matrices of the linearized model around the initial steady state can be obtained.</p>
</html>"),__Dymola_experimentSetupOutput);
      end OpenLoopSimulator;

      model OpenLoopSimulatorSS
        "Open loop plant simulator, steady-state initialization"
        extends OpenLoopSimulator(Plant(Boiler(
              GasSide(initOpt=ThermoPower.Choices.Init.Options.steadyState),
              TubeWalls(initOpt=ThermoPower.Choices.Init.Options.steadyState),
              WaterSide(initOpt=ThermoPower.Choices.Init.Options.steadyState))));
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
        extends OpenLoopSimulatorSS(Plant(Boiler(gamma_nom = gamma_nom)));
        parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_nom(fixed = false, start = 150);
      initial equation
        Plant.GasOut.T = Modelica.SIunits.Conversions.from_degC(130);
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
<p>This is performed by defining a <code>gamma_nom</code> parameter at the top level, with a<code>fixed = false</code> attribute (meaning that its value is a unknown) and with a <code>start = 150</code> attribute to provide a reasonable initial guess for the solver. This parameter is then used to override the value of <code>Plant.Boiler.gamma_nom</code>. In order to obtain a closed initialization problem, a corresponding initial equation to set the desired value of <code>Plant.GasOut.T is added.</code> </p>
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
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(ValveOpening.y, Plant.ValveOpening) annotation (Line(points={{1,-22},{
                26,-22},{26,-21.08}},           color={0,0,127}));
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
                {-2,-36},{-2,-19.5},{10,-19.5}},color={0,0,127}));
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

  package RankineCycle "Steam power plant"
    extends Modelica.Icons.Library;

    model HE "Heat Exchanger fluid - gas"

      replaceable package FlueGasMedium = ThermoPower.Media.FlueGas
        constrainedby Modelica.Media.Interfaces.PartialMedium "Flue gas model";
      replaceable package FluidMedium = ThermoPower.Water.StandardWater
        constrainedby Modelica.Media.Interfaces.PartialPureSubstance
        "Fluid model";

      parameter Integer N_G=2 "Number of node of the gas side";
      parameter Integer N_F=2 "Number of node of the fluid side";

      //Nominal parameter
      parameter Modelica.SIunits.MassFlowRate gasNomFlowRate
        "Nominal flow rate through the gas side";
      parameter Modelica.SIunits.MassFlowRate fluidNomFlowRate
        "Nominal flow rate through the fluid side";
      parameter Modelica.SIunits.Pressure gasNomPressure
        "Nominal pressure in the gas side inlet";
      parameter Modelica.SIunits.Pressure fluidNomPressure
        "Nominal pressure in the fluid side inlet";

      //Physical Parameter
      parameter Modelica.SIunits.Area exchSurface_G
        "Exchange surface between gas - metal tube";
      parameter Modelica.SIunits.Area exchSurface_F
        "Exchange surface between metal tube - fluid";
      parameter Modelica.SIunits.Area extSurfaceTub
        "Total external surface of the tubes";
      parameter Modelica.SIunits.Volume gasVol "Gas volume";
      parameter Modelica.SIunits.Volume fluidVol "Fluid volume";
      parameter Modelica.SIunits.Volume metalVol
        "Volume of the metal part in the tubes";
      parameter Real rhomcm "Metal heat capacity per unit volume [J/m^3.K]";
      parameter Modelica.SIunits.ThermalConductivity lambda
        "Thermal conductivity of the metal (density by specific heat capacity)";

      //Start values

      parameter Modelica.SIunits.Temperature Tstart_G
        "Average gas temperature start value"
        annotation (Dialog(tab="Initialization"));
      parameter Modelica.SIunits.Temperature Tstart_M
        "Average metal wall temperature start value"
        annotation (Dialog(tab="Initialization"));
      parameter Choices.FluidPhase.FluidPhases FluidPhaseStart=Choices.FluidPhase.FluidPhases.Liquid
        "Initialization fluid phase" annotation (Dialog(tab="Initialization"));
      parameter Boolean SSInit=false "Steady-state initialization"
        annotation (Dialog(tab="Initialization"));
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_G
        "Constant heat transfer coefficient in the gas side";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_F
        "Constant heat transfer coefficient in the fluid side";
      parameter Choices.Flow1D.FFtypes FFtype_G=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
        "Friction Factor Type, gas side";
      parameter Real Kfnom_G=0
        "Nominal hydraulic resistance coefficient, gas side";
      parameter Modelica.SIunits.Pressure dpnom_G=0
        "Nominal pressure drop, gas side (friction term only!)";
      parameter Modelica.SIunits.Density rhonom_G=0
        "Nominal inlet density, gas side";
      parameter Real Cfnom_G=0 "Nominal Fanning friction factor, gsa side";
      parameter Choices.Flow1D.FFtypes FFtype_F=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
        "Friction Factor Type, fluid side";
      parameter Real Kfnom_F=0
        "Nominal hydraulic resistance coefficient, fluid side";
      parameter Modelica.SIunits.Pressure dpnom_F=0
        "Nominal pressure drop, fluid side (friction term only!)";
      parameter Modelica.SIunits.Density rhonom_F=0
        "Nominal inlet density, fluid side";
      parameter Real Cfnom_F=0 "Nominal Fanning friction factor, fluid side";
      parameter Choices.Flow1D.HCtypes HCtype_F=ThermoPower.Choices.Flow1D.HCtypes.Downstream
        "Location of the hydraulic capacitance, fluid side";
      parameter Boolean counterCurrent=true "Counter-current flow";
      parameter Boolean gasQuasiStatic=false
        "Quasi-static model of the flue gas (mass, energy and momentum static balances";
      constant Real pi=Modelica.Constants.pi;
      Gas.FlangeA gasIn(redeclare package Medium = FlueGasMedium) annotation (
          Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
      Gas.FlangeB gasOut(redeclare package Medium = FlueGasMedium) annotation (
          Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
      Water.FlangeA waterIn(redeclare package Medium = FluidMedium) annotation (
         Placement(transformation(extent={{-20,80},{20,120}}, rotation=0)));
      Water.FlangeB waterOut(redeclare package Medium = FluidMedium)
        annotation (Placement(transformation(extent={{-20,-120},{20,-80}},
              rotation=0)));
      Water.Flow1D fluidFlow(
        Nt=1,
        N=N_F,
        wnom=fluidNomFlowRate,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        redeclare package Medium = FluidMedium,
        L=exchSurface_F^2/(fluidVol*pi*4),
        A=(fluidVol*4/exchSurface_F)^2/4*pi,
        omega=fluidVol*4/exchSurface_F*pi,
        Dhyd=fluidVol*4/exchSurface_F,
        FFtype=FFtype_F,
        dpnom=dpnom_F,
        rhonom=rhonom_F,
        HydraulicCapacitance=HCtype_F,
        Kfnom=Kfnom_F,
        Cfnom=Cfnom_F,
        FluidPhaseStart=FluidPhaseStart) annotation (Placement(transformation(
              extent={{-10,-60},{10,-40}}, rotation=0)));

      Thermal.ConvHT convHT(N=N_F, gamma=gamma_F) annotation (Placement(
            transformation(extent={{-10,-40},{10,-20}}, rotation=0)));
      Thermal.MetalTube metalTube(
        rhomcm=rhomcm,
        lambda=lambda,
        N=N_F,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        L=exchSurface_F^2/(fluidVol*pi*4),
        rint=fluidVol*4/exchSurface_F/2,
        WallRes=false,
        rext=(metalVol + fluidVol)*4/extSurfaceTub/2,
        Tstartbar=Tstart_M) annotation (Placement(transformation(extent={{-10,-6},
                {10,-26}}, rotation=0)));

      Gas.Flow1D gasFlow(
        Dhyd=1,
        wnom=gasNomFlowRate,
        N=N_G,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        redeclare package Medium = FlueGasMedium,
        QuasiStatic=gasQuasiStatic,
        L=L,
        A=gasVol/L,
        omega=exchSurface_G/L,
        Tstartbar=Tstart_G,
        dpnom=dpnom_G,
        rhonom=rhonom_G,
        Kfnom=Kfnom_G,
        Cfnom=Cfnom_G,
        FFtype=FFtype_G) annotation (Placement(transformation(extent={{-10,60},
                {10,40}}, rotation=0)));

      Thermal.CounterCurrent cC(N=N_F, counterCurrent=counterCurrent)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=0)));
      Thermal.HeatFlowDistribution heatFlowDistribution(
        N=N_F,
        A1=exchSurface_G,
        A2=extSurfaceTub) annotation (Placement(transformation(extent={{-10,4},
                {10,24}}, rotation=0)));
      Thermal.ConvHT2N convHT2N(
        N1=N_G,
        N2=N_F,
        gamma=gamma_G) annotation (Placement(transformation(extent={{-10,20},{
                10,40}}, rotation=0)));

      final parameter Modelica.SIunits.Distance L=1 "Tube length";
    equation
      connect(fluidFlow.wall, convHT.side2)
        annotation (Line(points={{0,-45},{0,-33.1}}, color={255,127,0}));
      connect(gasFlow.infl, gasIn) annotation (Line(
          points={{-10,50},{-100,50},{-100,0}},
          color={159,159,223},
          thickness=0.5));
      connect(gasFlow.outfl, gasOut) annotation (Line(
          points={{10,50},{100,50},{100,0}},
          color={159,159,223},
          thickness=0.5));
      connect(fluidFlow.outfl, waterOut) annotation (Line(
          points={{10,-50},{40,-50},{40,-100},{0,-100}},
          thickness=0.5,
          color={0,0,255}));
      connect(fluidFlow.infl, waterIn) annotation (Line(
          points={{-10,-50},{-40,-50},{-40,100},{0,100}},
          thickness=0.5,
          color={0,0,255}));
      connect(heatFlowDistribution.side2, cC.side1)
        annotation (Line(points={{0,10.9},{0,3}}, color={255,127,0}));
      connect(convHT2N.side1, gasFlow.wall)
        annotation (Line(points={{0,33},{0,40},{0,45}}, color={255,127,0}));
      connect(heatFlowDistribution.side1, convHT2N.side2)
        annotation (Line(points={{0,17},{0,26.9}}, color={255,127,0}));
      connect(metalTube.int, convHT.side1)
        annotation (Line(points={{0,-19},{0,-27}}, color={255,127,0}));
      connect(metalTube.ext, cC.side2)
        annotation (Line(points={{0,-12.9},{0,-3.1}}, color={255,127,0}));
      annotation (
        Diagram(graphics),
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
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
</html>"));
    end HE;

    model Evaporator
      "Fire tube boiler, fixed heat transfer coefficient, no radiative heat transfer"

      replaceable package FlueGasMedium = ThermoPower.Media.FlueGas
        constrainedby Modelica.Media.Interfaces.PartialMedium "Flue gas model";
      replaceable package FluidMedium = ThermoPower.Water.StandardWater
        constrainedby Modelica.Media.Interfaces.PartialPureSubstance
        "Fluid model";

      parameter Integer N=2 "Number of node of the gas side";

      //Nominal parameter
      parameter Modelica.SIunits.MassFlowRate gasNomFlowRate
        "Nominal flow rate through the gas side";
      parameter Modelica.SIunits.MassFlowRate fluidNomFlowRate
        "Nominal flow rate through the fluid side";
      parameter Modelica.SIunits.Pressure gasNomPressure
        "Nominal pressure in the gas side inlet";
      parameter Modelica.SIunits.Pressure fluidNomPressure
        "Nominal pressure in the fluid side inlet";

      //Physical Parameter
      parameter Modelica.SIunits.Area exchSurface
        "Exchange surface between gas - metal tube";
      parameter Modelica.SIunits.Volume gasVol "Gas volume";
      parameter Modelica.SIunits.Volume fluidVol "Fluid volume";
      parameter Modelica.SIunits.Volume metalVol
        "Volume of the metal part in the tubes";
      parameter Modelica.SIunits.Density rhom "Metal density";
      parameter Modelica.SIunits.SpecificHeatCapacity cm
        "Specific heat capacity of the metal";

      //Start value
      parameter Modelica.SIunits.Temperature Tstart
        "Average gas temperature start value"
        annotation (Dialog(tab="Initialization"));
      parameter Boolean SSInit=false "Steady-state initialization"
        annotation (Dialog(tab="Initialization"));
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma
        "Constant heat transfer coefficient in the gas side";
      parameter Choices.Flow1D.FFtypes FFtype_G=ThermoPower.Choices.Flow1D.FFtypes.NoFriction
        "Friction Factor Type, gas side";
      parameter Real Kfnom_G=0
        "Nominal hydraulic resistance coefficient, gas side";
      parameter Modelica.SIunits.Pressure dpnom_G=0
        "Nominal pressure drop, gas side (friction term only!)";
      parameter Modelica.SIunits.Density rhonom_G=0
        "Nominal inlet density, gas side";
      parameter Real Cfnom_G=0 "Nominal Fanning friction factor, gsa side";
      parameter Boolean gasQuasiStatic=false
        "Quasi-static model of the flue gas (mass, energy and momentum static balances";
      constant Real pi=Modelica.Constants.pi;
      Water.Drum2States water(
        Vdcr=0,
        cm=cm,
        Mmdcr=0,
        redeclare package Medium = FluidMedium,
        Vd=fluidVol,
        Mmd=metalVol*rhom,
        pstart=fluidNomPressure,
        Vldstart=fluidVol*0.8,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit)
        annotation (Placement(transformation(extent={{-20,26},{20,66}},
              rotation=0)));
      ThermoPower.Thermal.HT_DHT adapter(N=N, exchangeSurface=exchSurface)
        annotation (Placement(transformation(
            origin={0,0},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Thermal.ConvHT heatTransfer_ext(N=N, gamma=gamma) annotation (Placement(
            transformation(
            origin={0,-28},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Water.FlangeA waterIn(redeclare package Medium = FluidMedium) annotation (
         Placement(transformation(extent={{-20,80},{20,120}}, rotation=0)));
      Water.FlangeB waterOut(redeclare package Medium = FluidMedium)
        annotation (Placement(transformation(extent={{-20,-120},{20,-80}},
              rotation=0)));
      Gas.FlangeA gasIn(redeclare package Medium = FlueGasMedium) annotation (
          Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
      Gas.FlangeB gasOut(redeclare package Medium = FlueGasMedium) annotation (
          Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
      Gas.Flow1D gasFlow(
        Dhyd=1,
        wnom=gasNomFlowRate,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
        redeclare package Medium = FlueGasMedium,
        QuasiStatic=gasQuasiStatic,
        N=N,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        L=L,
        A=gasVol/L,
        omega=exchSurface/L,
        Tstartbar=Tstart) annotation (Placement(transformation(
            origin={0,-50},
            extent={{10,10},{-10,-10}},
            rotation=180)));

      Modelica.Blocks.Interfaces.RealOutput voidFraction annotation (Placement(
            transformation(extent={{96,50},{116,70}}, rotation=0)));
      final parameter Modelica.SIunits.Distance L=1 "Tube length";
    equation
      voidFraction = 1 - water.Vld/water.Vd;
      connect(heatTransfer_ext.side2, adapter.DHT_port) annotation (Line(points=
             {{3.79641e-016,-24.9},{3.79641e-016,-12},{0,-12},{0,-11},{-2.02067e-015,
              -11}}, color={255,127,0}));
      connect(water.feed, waterIn) annotation (Line(
          points={{-18,37.2},{-52,37.2},{-52,100},{0,100}},
          thickness=0.5,
          color={0,0,255}));
      connect(water.steam, waterOut) annotation (Line(
          points={{13.6,60.4},{48,60.4},{48,-68},{0,-68},{0,-100}},
          thickness=0.5,
          color={0,0,255}));
      connect(adapter.HT_port, water.heat) annotation (Line(points={{0.4,12},{
              7.10543e-016,12},{7.10543e-016,28}}, color={0,0,255}));
      connect(gasFlow.wall, heatTransfer_ext.side1) annotation (Line(points={{
              6.12323e-016,-45},{6.12323e-016,-38.5},{-3.67394e-016,-38.5},{-3.67394e-016,
              -31}}, color={255,127,0}));
      connect(gasFlow.infl, gasIn) annotation (Line(
          points={{-10,-50},{-60,-50},{-60,0},{-100,0}},
          color={159,159,223},
          thickness=0.5));
      connect(gasFlow.outfl, gasOut) annotation (Line(
          points={{10,-50},{60,-50},{60,0},{100,0}},
          color={159,159,223},
          thickness=0.5));
      annotation (Diagram(graphics), Icon(graphics={
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

    model PrescribedSpeedPump "Prescribed speed pump"
      replaceable package FluidMedium =
          Modelica.Media.Interfaces.PartialTwoPhaseMedium;
      parameter Modelica.SIunits.VolumeFlowRate q_nom[3]
        "Nominal volume flow rates";
      parameter Modelica.SIunits.Height head_nom[3] "Nominal heads";
      parameter Modelica.SIunits.Density rho0 "Nominal density";
      parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm n0
        "Nominal rpm";
      parameter Modelica.SIunits.Pressure nominalOutletPressure
        "Nominal live steam pressure";
      parameter Modelica.SIunits.Pressure nominalInletPressure
        "Nominal condensation pressure";
      parameter Modelica.SIunits.MassFlowRate nominalMassFlowRate
        "Nominal steam mass flow rate";
      parameter Modelica.SIunits.SpecificEnthalpy hstart=1e5
        "Fluid Specific Enthalpy Start Value";
      parameter Boolean SSInit=false "Steady-state initialization";

      function flowCharacteristic =
          ThermoPower.Functions.PumpCharacteristics.quadraticFlow (q_nom=q_nom,
            head_nom=head_nom);

      Water.FlangeA inlet(redeclare package Medium = FluidMedium) annotation (
          Placement(transformation(extent={{-120,-20},{-80,20}}, rotation=0)));
      Water.FlangeB outlet(redeclare package Medium = FluidMedium) annotation (
          Placement(transformation(extent={{80,-20},{120,20}}, rotation=0)));
      Water.Pump feedWaterPump(
        redeclare function flowCharacteristic = flowCharacteristic,
        n0=n0,
        redeclare package Medium = FluidMedium,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        wstart=nominalMassFlowRate,
        w0=nominalMassFlowRate,
        dp0=nominalOutletPressure - nominalInletPressure,
        rho0=rho0,
        hstart=hstart) annotation (Placement(transformation(extent={{-40,-24},{
                0,16}}, rotation=0)));

      Modelica.Blocks.Interfaces.RealInput nPump annotation (Placement(
            transformation(extent={{-72,60},{-52,80}}, rotation=0),
            iconTransformation(extent={{-92,40},{-52,80}})));
    equation
      connect(nPump, feedWaterPump.in_n) annotation (Line(points={{-62,70},{-25.2,
              70},{-25.2,12}}, color={0,0,127}));
      connect(feedWaterPump.infl, inlet) annotation (Line(
          points={{-36,0},{-100,0}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(feedWaterPump.outfl, outlet) annotation (Line(
          points={{-8,10},{60,10},{60,0},{100,0}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        Icon(graphics={
            Text(
              extent={{-100,-118},{100,-144}},
              lineColor={0,0,255},
              textString="%name"),
            Ellipse(
              extent={{-80,80},{80,-80}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere),
            Polygon(
              points={{-40,40},{-40,-40},{50,0},{-40,40}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,255,255})}),
        Diagram(graphics),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
    end PrescribedSpeedPump;

    model PrescribedPressureCondenser
      "Ideal condenser with prescribed pressure"
      replaceable package Medium = Water.StandardWater constrainedby
        Modelica.Media.Interfaces.PartialMedium "Medium model";
      //Parameters
      parameter Modelica.SIunits.Pressure p "Nominal inlet pressure";
      parameter Modelica.SIunits.Volume Vtot=10
        "Total volume of the fluid side";
      parameter Modelica.SIunits.Volume Vlstart=0.15*Vtot
        "Start value of the liquid water volume";

      //Variables
      Modelica.SIunits.Density rhol "Density of saturated liquid";
      Modelica.SIunits.Density rhov "Density of saturated steam";
      Medium.SaturationProperties sat "Saturation properties";
      Medium.SpecificEnthalpy hl "Specific enthalpy of saturated liquid";
      Medium.SpecificEnthalpy hv "Specific enthalpy of saturated vapour";
      Modelica.SIunits.Mass M "Total mass, steam+liquid";
      Modelica.SIunits.Mass Ml "Liquid mass";
      Modelica.SIunits.Mass Mv "Steam mass";
      Modelica.SIunits.Volume Vl(start=Vlstart) "Liquid volume";
      Modelica.SIunits.Volume Vv "Steam volume";
      Modelica.SIunits.Energy E "Internal energy";
      Modelica.SIunits.Power Q "Thermal power";

      //Connectors
      Water.FlangeA steamIn(redeclare package Medium = Medium) annotation (
          Placement(transformation(extent={{-20,80},{20,120}}, rotation=0)));
      Water.FlangeB waterOut(redeclare package Medium = Medium) annotation (
          Placement(transformation(extent={{-20,-120},{20,-80}}, rotation=0)));

    equation
      steamIn.p = p;
      steamIn.h_outflow = hl;
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
      Vtot = Vv + Vl;
      M = Ml + Mv;
      E = Ml*hl + Mv*inStream(steamIn.h_outflow) - p*Vtot;

      //Energy and Mass Bilances
      der(M) = steamIn.m_flow + waterOut.m_flow;
      der(E) = steamIn.m_flow*hv + waterOut.m_flow*hl - Q;

      annotation (
        Icon(graphics={
            Ellipse(
              extent={{-90,100},{90,-80}},
              lineColor={0,0,255},
              lineThickness=0.5,
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{44,-40},{-50,-40},{8,10},{-50,60},{44,60}},
              color={0,0,255},
              thickness=0.5),
            Rectangle(
              extent={{-48,-66},{48,-100}},
              lineColor={0,0,255},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,-115},{100,-145}},
              lineColor={85,170,255},
              textString="%name")}),
        Diagram(graphics),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
    end PrescribedPressureCondenser;

    model Plant
      import ThermoPower;
      replaceable package FlueGas = ThermoPower.Media.FlueGas constrainedby
        Modelica.Media.Interfaces.PartialMedium "Flue gas model";
      replaceable package Water = ThermoPower.Water.StandardWater
        constrainedby Modelica.Media.Interfaces.PartialPureSubstance
        "Fluid model";
      parameter Boolean SSInit=false "Steady-state initialization";
      ThermoPower.Examples.RankineCycle.PrescribedPressureCondenser condenser(p=
           5390, redeclare package Medium = Water) annotation (Placement(
            transformation(extent={{100,-100},{140,-60}}, rotation=0)));
      ThermoPower.Examples.RankineCycle.PrescribedSpeedPump prescribedSpeedPump(
        n0=1500,
        nominalMassFlowRate=55,
        q_nom={0,0.055,0.1},
        redeclare package FluidMedium = Water,
        SSInit=SSInit,
        head_nom={450,300,0},
        rho0=1000,
        nominalOutletPressure=3000000,
        nominalInletPressure=50000) annotation (Placement(transformation(extent=
               {{40,-180},{0,-140}}, rotation=0)));
      Modelica.Blocks.Continuous.FirstOrder temperatureActuator(
        k=1,
        y_start=750,
        T=4,
        initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else
            Modelica.Blocks.Types.Init.NoInit) annotation (Placement(
            transformation(extent={{-280,90},{-260,110}}, rotation=0)));
      Modelica.Blocks.Continuous.FirstOrder powerSensor(
        k=1,
        T=1,
        y_start=56.8e6,
        initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else
            Modelica.Blocks.Types.Init.NoInit) annotation (Placement(
            transformation(extent={{240,90},{260,110}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput generatedPower annotation (
          Placement(transformation(extent={{290,90},{310,110}}, rotation=0),
            iconTransformation(extent={{92,32},{112,52}})));
      Modelica.Blocks.Interfaces.RealInput gasFlowRate annotation (Placement(
            transformation(extent={{-310,-10},{-290,10}}, rotation=0),
            iconTransformation(extent={{-104,-10},{-84,10}})));
      Modelica.Blocks.Interfaces.RealInput gasTemperature annotation (Placement(
            transformation(extent={{-310,90},{-290,110}}, rotation=0),
            iconTransformation(extent={{-104,48},{-84,68}})));
      Modelica.Blocks.Continuous.FirstOrder gasFlowActuator(
        k=1,
        T=4,
        y_start=500,
        initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else
            Modelica.Blocks.Types.Init.NoInit) annotation (Placement(
            transformation(extent={{-280,-10},{-260,10}}, rotation=0)));
      Modelica.Blocks.Continuous.FirstOrder nPumpActuator(
        k=1,
        initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else
            Modelica.Blocks.Types.Init.NoInit,
        T=2,
        y_start=1500) annotation (Placement(transformation(extent={{-280,-110},
                {-260,-90}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealInput nPump annotation (Placement(
            transformation(extent={{-310,-110},{-290,-90}}, rotation=0),
            iconTransformation(extent={{-106,-72},{-86,-52}})));
      Modelica.Blocks.Interfaces.RealOutput voidFraction annotation (Placement(
            transformation(extent={{290,-110},{310,-90}}, rotation=0),
            iconTransformation(extent={{90,-50},{110,-30}})));
      Modelica.Blocks.Continuous.FirstOrder voidFractionSensor(
        k=1,
        T=1,
        initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else
            Modelica.Blocks.Types.Init.NoInit,
        y_start=0.2) annotation (Placement(transformation(extent={{240,-110},{
                260,-90}}, rotation=0)));
      Electrical.Generator generator(J=10000, initOpt=if SSInit then Choices.Init.Options.steadyState
             else Choices.Init.Options.noInit) annotation (Placement(
            transformation(extent={{180,30},{220,70}}, rotation=0)));
      Electrical.NetworkGrid_Pmax network(
        J=10000,
        Pmax=100e6,
        deltaStart=0.4,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit)
        annotation (Placement(transformation(extent={{240,34},{272,66}},
              rotation=0)));
      ThermoPower.Water.SteamTurbineStodola steamTurbine(
        wstart=55,
        wnom=55,
        Kt=0.0104,
        redeclare package Medium = Water,
        PRstart=30,
        pnom=3000000) annotation (Placement(transformation(extent={{24,10},{104,
                90}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1
        annotation (Placement(transformation(extent={{146,60},{166,40}},
              rotation=0)));
      ThermoPower.Examples.RankineCycle.HE economizer(
        redeclare package FluidMedium = Water,
        redeclare package FlueGasMedium = FlueGas,
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
        gasNomFlowRate=500,
        fluidNomFlowRate=55,
        gamma_G=30,
        gamma_F=3000,
        SSInit=SSInit,
        rhonom_G=1,
        Kfnom_F=150,
        gasNomPressure=101325,
        fluidNomPressure=3000000,
        Tstart_G=473.15,
        Tstart_M=423.15,
        FFtype_G=ThermoPower.Choices.Flow1D.FFtypes.OpPoint,
        dpnom_G=1000,
        FFtype_F=ThermoPower.Choices.Flow1D.FFtypes.Kfnom,
        dpnom_F=20000) annotation (Placement(transformation(extent={{-120,-80},
                {-80,-120}}, rotation=0)));
      ThermoPower.Examples.RankineCycle.Evaporator evaporator(
        redeclare package FluidMedium = Water,
        redeclare package FlueGasMedium = FlueGas,
        gasVol=10,
        fluidVol=12.400,
        metalVol=4.801,
        gasNomFlowRate=500,
        fluidNomFlowRate=55,
        SSInit=SSInit,
        N=4,
        rhom=7900,
        cm=578.05,
        gamma=85,
        exchSurface=24402,
        gasNomPressure=101325,
        fluidNomPressure=3000000,
        Tstart=623.15,
        FFtype_G=ThermoPower.Choices.Flow1D.FFtypes.OpPoint,
        dpnom_G=1000,
        rhonom_G=1) annotation (Placement(transformation(extent={{-120,0},{-80,
                -40}}, rotation=0)));
      ThermoPower.Examples.RankineCycle.HE superheater(
        redeclare package FluidMedium = Water,
        redeclare package FlueGasMedium = FlueGas,
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
        gasNomFlowRate=500,
        gamma_G=90,
        gamma_F=6000,
        fluidNomFlowRate=55,
        SSInit=SSInit,
        rhonom_G=1,
        Kfnom_F=150,
        gasNomPressure=101325,
        fluidNomPressure=3000000,
        Tstart_G=723.15,
        Tstart_M=573.15,
        FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
        FFtype_G=ThermoPower.Choices.Flow1D.FFtypes.OpPoint,
        dpnom_G=1000,
        FFtype_F=ThermoPower.Choices.Flow1D.FFtypes.Kfnom,
        dpnom_F=20000) annotation (Placement(transformation(extent={{-120,80},{
                -80,40}}, rotation=0)));
      ThermoPower.PowerPlants.HRSG.Components.StateReader_gas stateGasInlet(
          redeclare package Medium = FlueGas) annotation (Placement(
            transformation(extent={{-150,50},{-130,70}}, rotation=0)));
      ThermoPower.PowerPlants.HRSG.Components.StateReader_gas
        stateGasInletEvaporator(redeclare package Medium = FlueGas) annotation (
         Placement(transformation(extent={{-150,-30},{-130,-10}}, rotation=0)));
      ThermoPower.PowerPlants.HRSG.Components.StateReader_gas
        stateGasInletEconomizer(redeclare package Medium = FlueGas) annotation (
         Placement(transformation(extent={{-150,-110},{-130,-90}}, rotation=0)));
      ThermoPower.PowerPlants.HRSG.Components.StateReader_gas stateGasOutlet(
          redeclare package Medium = FlueGas) annotation (Placement(
            transformation(extent={{-70,-110},{-50,-90}}, rotation=0)));
      ThermoPower.PowerPlants.HRSG.Components.StateReader_water
        stateWaterSuperheater_in(redeclare package Medium = Water) annotation (
          Placement(transformation(
            origin={-100,20},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      ThermoPower.PowerPlants.HRSG.Components.StateReader_water
        stateWaterSuperheater_out(redeclare package Medium = Water) annotation (
         Placement(transformation(
            origin={-100,102},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      ThermoPower.PowerPlants.HRSG.Components.StateReader_water
        stateWaterEvaporator_in(redeclare package Medium = Water) annotation (
          Placement(transformation(
            origin={-100,-60},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      ThermoPower.PowerPlants.HRSG.Components.StateReader_water
        stateWaterEconomizer_in(redeclare package Medium = Water) annotation (
          Placement(transformation(
            origin={-100,-140},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      ThermoPower.Gas.SourceMassFlow
                              sourceW_gas(
        w0=500,
        redeclare package Medium = FlueGas,
        T=750,
        use_in_w0=true,
        use_in_T=true)                      annotation (Placement(
            transformation(extent={{-200,50},{-180,70}}, rotation=0)));
      ThermoPower.Gas.SinkPressure
                            sinkP_gas(T=400, redeclare package Medium = FlueGas)
        annotation (Placement(transformation(extent={{-40,-110},{-20,-90}},
              rotation=0)));
      inner ThermoPower.System system
        annotation (Placement(transformation(extent={{240,160},{260,180}})));
    equation
      connect(prescribedSpeedPump.inlet, condenser.waterOut) annotation (Line(
          points={{40,-160},{120,-160},{120,-100}},
          thickness=0.5,
          color={0,0,255}));
      connect(generatedPower, powerSensor.y)
        annotation (Line(points={{300,100},{261,100}}, color={0,0,127}));
      connect(gasFlowActuator.u, gasFlowRate)
        annotation (Line(points={{-282,0},{-300,0}}, color={0,0,127}));
      connect(temperatureActuator.u, gasTemperature)
        annotation (Line(points={{-282,100},{-300,100}}, color={0,0,127}));
      connect(nPumpActuator.u, nPump)
        annotation (Line(points={{-282,-100},{-300,-100}}, color={0,0,127}));
      connect(voidFraction, voidFractionSensor.y)
        annotation (Line(points={{300,-100},{261,-100}}, color={0,0,127}));
      connect(powerSensor1.flange_a, steamTurbine.shaft_b) annotation (Line(
          points={{146,50},{89.6,50}},
          color={0,0,0},
          thickness=0.5));
      connect(stateGasInlet.inlet, sourceW_gas.flange) annotation (Line(
          points={{-146,60},{-180,60}},
          color={159,159,223},
          thickness=0.5));
      connect(generator.shaft, powerSensor1.flange_b) annotation (Line(
          points={{182.8,50},{166,50}},
          color={0,0,0},
          thickness=0.5));
      connect(network.powerConnection, generator.powerConnection) annotation (
          Line(
          points={{240,50},{217.2,50}},
          pattern=LinePattern.None,
          thickness=0.5));
      connect(condenser.steamIn, steamTurbine.outlet) annotation (Line(
          points={{120,-60},{120,82},{96,82}},
          thickness=0.5,
          color={0,0,255}));
      connect(prescribedSpeedPump.outlet, stateWaterEconomizer_in.inlet)
        annotation (Line(
          points={{0,-160},{-100,-160},{-100,-146}},
          thickness=0.5,
          color={0,0,255}));
      connect(stateWaterEconomizer_in.outlet, economizer.waterIn)
        annotation (Line(points={{-100,-134},{-100,-120}}, thickness=0.5));
      connect(economizer.waterOut, stateWaterEvaporator_in.inlet) annotation (
          Line(
          points={{-100,-80},{-100,-66}},
          thickness=0.5,
          color={0,0,255}));
      connect(stateWaterEvaporator_in.outlet, evaporator.waterIn) annotation (
          Line(
          points={{-100,-54},{-100,-40}},
          thickness=0.5,
          color={0,0,255}));
      connect(economizer.gasIn, stateGasInletEconomizer.outlet) annotation (
          Line(
          points={{-120,-100},{-128,-100},{-134,-100}},
          color={159,159,223},
          thickness=0.5));
      connect(stateGasInletEconomizer.inlet, evaporator.gasOut) annotation (
          Line(
          points={{-146,-100},{-160,-100},{-160,-50},{-40,-50},{-40,-20},{-80,-20}},
          color={159,159,223},
          thickness=0.5));

      connect(sinkP_gas.flange, stateGasOutlet.outlet) annotation (Line(
          points={{-40,-100},{-54,-100}},
          color={159,159,223},
          thickness=0.5));
      connect(stateGasOutlet.inlet, economizer.gasOut) annotation (Line(
          points={{-66,-100},{-74,-100},{-80,-100}},
          color={159,159,223},
          thickness=0.5));
      connect(evaporator.gasIn, stateGasInletEvaporator.outlet) annotation (
          Line(
          points={{-120,-20},{-134,-20}},
          color={159,159,223},
          thickness=0.5));
      connect(stateGasInletEvaporator.inlet, superheater.gasOut) annotation (
          Line(
          points={{-146,-20},{-160,-20},{-160,30},{-40,30},{-40,60},{-80,60}},
          color={159,159,223},
          thickness=0.5));
      connect(evaporator.waterOut, stateWaterSuperheater_in.inlet) annotation (
          Line(
          points={{-100,0},{-100,14}},
          thickness=0.5,
          color={0,0,255}));
      connect(stateWaterSuperheater_in.outlet, superheater.waterIn) annotation (
         Line(
          points={{-100,26},{-100,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(superheater.waterOut, stateWaterSuperheater_out.inlet)
        annotation (Line(
          points={{-100,80},{-100,96}},
          thickness=0.5,
          color={0,0,255}));
      connect(stateWaterSuperheater_out.outlet, steamTurbine.inlet) annotation (
         Line(
          points={{-100,108},{-100,120},{32,120},{32,82}},
          thickness=0.5,
          color={0,0,255}));
      connect(superheater.gasIn, stateGasInlet.outlet) annotation (Line(
          points={{-120,60},{-128,60},{-134,60}},
          color={159,159,223},
          thickness=0.5));
      connect(powerSensor.u, powerSensor1.power) annotation (Line(points={{238,
              100},{148,100},{148,61}}, color={0,0,127}));
      connect(voidFractionSensor.u, evaporator.voidFraction) annotation (Line(
            points={{238,-100},{200,-100},{200,-32},{-78.8,-32}}, color={0,0,
              127}));
      connect(gasFlowActuator.y, sourceW_gas.in_w0) annotation (Line(points={{-259,
              0},{-220,0},{-220,80},{-196,80},{-196,65}}, color={0,0,127}));
      connect(temperatureActuator.y, sourceW_gas.in_T) annotation (Line(points=
              {{-259,100},{-190,100},{-190,65}}, color={0,0,127}));
      connect(nPumpActuator.y, prescribedSpeedPump.nPump) annotation (Line(
            points={{-259,-100},{-220,-100},{-220,-190},{80,-190},{80,-148},{
              34.4,-148}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-300,-200},{300,200}},
            initialScale=0.1), graphics),
        experiment(StopTime=5000, Tolerance=1e-006),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            initialScale=0.1), graphics={Rectangle(
              extent={{-98,100},{98,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,100},{100,-96}},
              lineColor={0,0,255},
              textString="P")}),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
This is a simple model of a steam plant.
</html>"));
    end Plant;

    model PID "PID controller with anti-windup"
      parameter Real Kp "Proportional gain (normalised units)";
      parameter Modelica.SIunits.Time Ti "Integral time";
      parameter Boolean integralAction = true "Use integral action";
      parameter Modelica.SIunits.Time Td=0 "Derivative time";
      parameter Real Nd=1 "Derivative action up to Nd / Td rad/s";
      parameter Real Ni=1
        "Ni*Ti is the time constant of anti-windup compensation";
      parameter Real b=1 "Setpoint weight on proportional action";
      parameter Real c=0 "Setpoint weight on derivative action";
      parameter Real PVmin "Minimum value of process variable for scaling";
      parameter Real PVmax "Maximum value of process variable for scaling";
      parameter Real CSmin "Minimum value of control signal for scaling";
      parameter Real CSmax "Maximum value of control signal for scaling";
      parameter Real PVstart=0.5 "Start value of PV (scaled)";
      parameter Real CSstart=0.5 "Start value of CS (scaled)";
      parameter Boolean holdWhenSimplified=false
        "Hold CSs at start value when homotopy=simplified";
      parameter Boolean steadyStateInit=false "Initialize in steady state";
      Real CSs_hom
        "Control signal scaled in per units, used when homotopy=simplified";

      Real P "Proportional action / Kp";
      Real I(start=CSstart/Kp) "Integral action / Kp";
      Real D "Derivative action / Kp";
      Real Dx(start=c*PVstart - PVstart) "State of approximated derivator";
      Real PVs "Process variable scaled in per unit";
      Real SPs "Setpoint variable scaled in per unit";
      Real CSs(start=CSstart) "Control signal scaled in per unit";
      Real CSbs(start=CSstart)
        "Control signal scaled in per unit before saturation";
      Real track "Tracking signal for anti-windup integral action";

      Modelica.Blocks.Interfaces.RealInput PV "Process variable signal"
        annotation (Placement(transformation(extent={{-112,-52},{-88,-28}},
              rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput CS "Control signal" annotation (
          Placement(transformation(extent={{88,-12},{112,12}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealInput SP "Set point signal" annotation (
          Placement(transformation(extent={{-112,28},{-88,52}}, rotation=0)));
    equation
      // Scaling
      SPs = (SP - PVmin)/(PVmax - PVmin);
      PVs = (PV - PVmin)/(PVmax - PVmin);
      CS = CSmin + CSs*(CSmax - CSmin);
      // Controller actions
      P = b*SPs - PVs;
      if integralAction then
        assert(Ti>0, "Integral time must be positive");
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
      CSbs = Kp*(P + I + D) "Control signal before saturation";
      CSs = homotopy(smooth(0, if CSbs > 1 then 1 else if CSbs < 0 then 0 else
        CSbs), CSs_hom) "Saturated control signal";
      track = (CSs - CSbs)/(Kp*Ni);
    initial equation
      if steadyStateInit then
        if Ti > 0 then
          der(I) = 0;
        end if;
        if Td > 0 then
          D = 0;
        end if;
      end if;
      annotation (Diagram(graphics), Icon(graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-54,40},{52,-34}},
              lineColor={0,0,255},
              textString="PID"),
            Text(
              extent={{-110,-108},{110,-142}},
              lineColor={0,0,255},
              lineThickness=0.5,
              textString="%name")}));
    end PID;

    package Simulators "Simulation models for the Rankine cycle example"

      model ClosedLoop
        package FlueGas = ThermoPower.Media.FlueGas "Flue gas model";
        package Water = ThermoPower.Water.StandardWater "Fluid model";
        Modelica.Blocks.Sources.Ramp gasFlowRate(
          height=0,
          duration=0,
          offset=750) annotation (Placement(transformation(extent={{-80,10},{-60,
                  30}}, rotation=0)));
        ThermoPower.Examples.RankineCycle.Plant plant(
          redeclare package FlueGas = FlueGas,
          redeclare package Water = Water,
          SSInit=true) annotation (Placement(transformation(extent={{20,-10},{
                  80,30}}, rotation=0)));
        Modelica.Blocks.Sources.Step voidFractionSetPoint(
          offset=0.2,
          height=0,
          startTime=0) annotation (Placement(transformation(extent={{-80,-40},{
                  -60,-20}}, rotation=0)));
        PID voidFractionController(
          PVmin=0.1,
          PVmax=0.9,
          CSmax=2500,
          Ti=1000,
          Kp=-0.7,
          PVstart=0.1,
          CSstart=0.5,
          steadyStateInit=true,
          CSmin=500) annotation (Placement(transformation(extent={{-40,-44},{-20,
                  -24}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp powerSetPoint(
          duration=450,
          startTime=500,
          height=-56.8e6*0.35,
          offset=56.8e6) annotation (Placement(transformation(extent={{-80,50},
                  {-60,70}},rotation=0)));
        PID powerController(
          steadyStateInit=true,
          PVmin=20e6,
          PVmax=100e6,
          Ti=240,
          CSmin=100,
          CSmax=1000,
          Kp=2,
          CSstart=0.7,
          holdWhenSimplified=true) annotation (Placement(transformation(extent=
                  {{-40,74},{-20,54}}, rotation=0)));
        inner System system(allowFlowReversal=false)
          annotation (Placement(transformation(extent={{60,-100},{80,-80}})));
      equation
        connect(voidFractionController.SP, voidFractionSetPoint.y)
          annotation (Line(points={{-40,-30},{-59,-30}}, color={0,0,127}));
        connect(voidFractionController.CS, plant.nPump) annotation (Line(points={{-20,-34},
                {0,-34},{0,-2.4},{21.2,-2.4}},   color={0,0,127}));
        connect(voidFractionController.PV, plant.voidFraction) annotation (Line(
              points={{-40,-38},{-50,-38},{-50,-60},{90,-60},{90,2},{80,2}},
              color={0,0,127}));
        connect(powerSetPoint.y, powerController.SP) annotation (Line(points={{
                -59,60},{-50,60},{-40,60}}, color={0,0,127}));
        connect(powerController.PV, plant.generatedPower) annotation (Line(
              points={{-40,68},{-50,68},{-50,90},{90,90},{90,18.4},{80.6,18.4}},
              color={0,0,127}));
        connect(gasFlowRate.y, plant.gasTemperature) annotation (Line(
            points={{-59,20},{-18.6,20},{-18.6,21.6},{21.8,21.6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(powerController.CS, plant.gasFlowRate) annotation (Line(
            points={{-20,64},{0,64},{0,10},{21.8,10}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              initialScale=0.1), graphics),
          experiment(
            StopTime=10000,
            NumberOfIntervals=5000,
            Tolerance=1e-006),
          Icon(coordinateSystem(
              preserveAspectRatio=false,
              extent={{-100,-100},{100,100}},
              initialScale=0.1), graphics),
          Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This model simulates a simple continuous-time control system for the steam power plant.
<p>The generated power and the evaporator void fraction are controlled to the set point by PI controllers with anti-windup.</p>
</html>"),experimentSetupOutput(equdistant=false));
      end ClosedLoop;
    end Simulators;
    annotation (Documentation(info="<html>
<p>This package contains models of a simple Rankine cycle and its main components.
</html>", revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       Package created.</li>
</ul>
</html>"));

  end RankineCycle;

  package BraytonCycle "Gas power plant"
    extends Modelica.Icons.Library;

    model Plant
    protected
      parameter Real tableEtaC[6, 4]=[0, 95, 100, 105; 1, 82.5e-2, 81e-2,
          80.5e-2; 2, 84e-2, 82.9e-2, 82e-2; 3, 83.2e-2, 82.2e-2, 81.5e-2; 4,
          82.5e-2, 81.2e-2, 79e-2; 5, 79.5e-2, 78e-2, 76.5e-2];
      parameter Real tablePhicC[6, 4]=[0, 95, 100, 105; 1, 38.3e-3, 43e-3,
          46.8e-3; 2, 39.3e-3, 43.8e-3, 47.9e-3; 3, 40.6e-3, 45.2e-3, 48.4e-3;
          4, 41.6e-3, 46.1e-3, 48.9e-3; 5, 42.3e-3, 46.6e-3, 49.3e-3];
      parameter Real tablePR[6, 4]=[0, 95, 100, 105; 1, 22.6, 27, 32; 2, 22,
          26.6, 30.8; 3, 20.8, 25.5, 29; 4, 19, 24.3, 27.1; 5, 17, 21.5, 24.2];
      parameter Real tablePhicT[5, 4]=[1, 90, 100, 110; 2.36, 4.68e-3, 4.68e-3,
          4.68e-3; 2.88, 4.68e-3, 4.68e-3, 4.68e-3; 3.56, 4.68e-3, 4.68e-3,
          4.68e-3; 4.46, 4.68e-3, 4.68e-3, 4.68e-3];
      parameter Real tableEtaT[5, 4]=[1, 90, 100, 110; 2.36, 89e-2, 89.5e-2,
          89.3e-2; 2.88, 90e-2, 90.6e-2, 90.5e-2; 3.56, 90.5e-2, 90.6e-2,
          90.5e-2; 4.46, 90.2e-2, 90.3e-2, 90e-2];
    public
      Electrical.Generator generator(J=30000, initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{94,-80},{134,-40}},
              rotation=0)));
      Electrical.NetworkGrid_Pmax network(
        deltaStart=0.4,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        Pmax=10e6,
        J=30000) annotation (Placement(transformation(extent={{148,-72},{172,-48}},
              rotation=0)));
      Modelica.Blocks.Interfaces.RealInput combustibleFlowRate annotation (
          Placement(transformation(extent={{-210,-10},{-190,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput generatedPower annotation (
          Placement(transformation(extent={{196,-10},{216,10}}, rotation=0)));
    public
      Gas.Compressor compressor(
        redeclare package Medium = Media.Air,
        tablePhic=tablePhicC,
        tableEta=tableEtaC,
        pstart_in=0.343e5,
        pstart_out=8.3e5,
        Tstart_in=244.4,
        tablePR=tablePR,
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
        Tstart_out=600.4,
        explicitIsentropicEnthalpy=true,
        Tdes_in=244.4,
        Ndesign=157.08) annotation (Placement(transformation(extent={{-158,-90},
                {-98,-30}}, rotation=0)));
      Gas.Turbine turbine(
        redeclare package Medium = Media.FlueGas,
        pstart_in=7.85e5,
        pstart_out=1.52e5,
        tablePhic=tablePhicT,
        tableEta=tableEtaT,
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
        Tstart_out=800,
        Tdes_in=1400,
        Tstart_in=1370,
        Ndesign=157.08) annotation (Placement(transformation(extent={{-6,-90},{
                54,-30}}, rotation=0)));
      Gas.CombustionChamber CombustionChamber1(
        gamma=1,
        Cm=1,
        pstart=8.11e5,
        Tstart=1370,
        V=0.05,
        S=0.05,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HH=41.6e6) annotation (Placement(transformation(extent={{-72,20},{-32,
                60}}, rotation=0)));
      Gas.SourcePressure
                  SourceP1(
        redeclare package Medium = Media.Air,
        p0=0.343e5,
        T=244.4) annotation (Placement(transformation(extent={{-188,-30},{-168,
                -10}}, rotation=0)));
      Gas.SinkPressure
                SinkP1(
        redeclare package Medium = Media.FlueGas,
        p0=1.52e5,
        T=800) annotation (Placement(transformation(extent={{94,-10},{114,10}},
              rotation=0)));
      Gas.SourceMassFlow
                  SourceW1(
        redeclare package Medium = Media.NaturalGas,
        w0=2.02,
        p0=811000,
        T=300,
        use_in_w0=true)
               annotation (Placement(transformation(extent={{-100,70},{-80,90}},
              rotation=0)));
      Gas.PressDrop PressDrop1(
        redeclare package Medium = Media.FlueGas,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        A=1,
        pstart=8.11e5,
        dpnom=0.26e5,
        wnom=102,
        Tstart=1370,
        rhonom=2) annotation (Placement(transformation(
            origin={0,8},
            extent={{-10,-10},{10,10}},
            rotation=270)));
      Gas.PressDrop PressDrop2(
        pstart=8.3e5,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        A=1,
        redeclare package Medium = Media.Air,
        dpnom=0.19e5,
        wnom=100,
        rhonom=4.7,
        Tstart=600) annotation (Placement(transformation(
            origin={-104,10},
            extent={{-10,-10},{10,10}},
            rotation=90)));
      Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor annotation (
         Placement(transformation(extent={{60,-70},{80,-50}}, rotation=0)));
      Modelica.Blocks.Continuous.FirstOrder gasFlowActuator(
        k=1,
        T=4,
        y_start=500,
        initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(
            transformation(extent={{-138,92},{-122,108}}, rotation=0)));
      Modelica.Blocks.Continuous.FirstOrder powerSensor1(
        k=1,
        T=1,
        y_start=56.8e6,
        initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(
            transformation(extent={{146,-118},{162,-102}}, rotation=0)));
      PowerPlants.HRSG.Components.StateReader_gas stateInletCC(redeclare
          package Medium = Media.Air) annotation (Placement(transformation(
              extent={{-100,30},{-80,50}}, rotation=0)));
      PowerPlants.HRSG.Components.StateReader_gas stateOutletCC(redeclare
          package Medium = Media.FlueGas) annotation (Placement(transformation(
              extent={{-24,30},{-4,50}}, rotation=0)));
      inner System system(allowFlowReversal=false)
        annotation (Placement(transformation(extent={{158,160},{178,180}})));
    equation
      connect(network.powerConnection, generator.powerConnection) annotation (
          Line(
          points={{148,-60},{131.2,-60}},
          pattern=LinePattern.None,
          thickness=0.5));
      connect(SourceW1.flange, CombustionChamber1.inf) annotation (Line(
          points={{-80,80},{-52,80},{-52,60}},
          color={159,159,223},
          thickness=0.5));
      connect(turbine.outlet, SinkP1.flange) annotation (Line(
          points={{48,-36},{48,0},{94,0}},
          color={159,159,223},
          thickness=0.5));
      connect(SourceP1.flange, compressor.inlet) annotation (Line(
          points={{-168,-20},{-152,-20},{-152,-36}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop1.outlet, turbine.inlet) annotation (Line(
          points={{-1.83697e-015,-2},{-1.83697e-015,-36},{0,-36}},
          color={159,159,223},
          thickness=0.5));
      connect(compressor.outlet, PressDrop2.inlet) annotation (Line(
          points={{-104,-36},{-104,0}},
          color={159,159,223},
          thickness=0.5));
      connect(compressor.shaft_b, turbine.shaft_a) annotation (Line(
          points={{-110,-60},{6,-60}},
          color={0,0,0},
          thickness=0.5));
      connect(powerSensor.flange_a, turbine.shaft_b) annotation (Line(
          points={{60,-60},{42,-60}},
          color={0,0,0},
          thickness=0.5));
      connect(gasFlowActuator.u, combustibleFlowRate) annotation (Line(points={
              {-139.6,100},{-166,100},{-166,0},{-200,0}}, color={0,0,127}));
      connect(gasFlowActuator.y, SourceW1.in_w0) annotation (Line(points={{-121.2,
              100},{-96,100},{-96,85}}, color={0,0,127}));
      connect(powerSensor.power, powerSensor1.u) annotation (Line(points={{62,-71},
              {62,-110},{144.4,-110}}, color={0,0,127}));
      connect(powerSensor1.y, generatedPower) annotation (Line(points={{162.8,-110},
              {184.4,-110},{184.4,0},{206,0}}, color={0,0,127}));
      connect(CombustionChamber1.ina, stateInletCC.outlet) annotation (Line(
          points={{-72,40},{-84,40}},
          color={159,159,223},
          thickness=0.5));
      connect(stateInletCC.inlet, PressDrop2.outlet) annotation (Line(
          points={{-96,40},{-104,40},{-104,20}},
          color={159,159,223},
          thickness=0.5));
      connect(stateOutletCC.inlet, CombustionChamber1.out) annotation (Line(
          points={{-20,40},{-32,40}},
          color={159,159,223},
          thickness=0.5));
      connect(stateOutletCC.outlet, PressDrop1.inlet) annotation (Line(
          points={{-8,40},{1.83697e-015,40},{1.83697e-015,18}},
          color={159,159,223},
          thickness=0.5));
      connect(generator.shaft, powerSensor.flange_b) annotation (Line(
          points={{96.8,-60},{80,-60}},
          color={0,0,0},
          thickness=0.5));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-200,-200},{200,200}},
            initialScale=0.1), graphics),
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-200,-200},{200,200}},
            initialScale=0.1), graphics={Rectangle(
              extent={{-200,200},{200,-200}},
              lineColor={170,170,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-140,140},{140,-140}},
              lineColor={170,170,255},
              textString="P")}),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This model contains the  gas turbine, generator and network models. The network model is based on swing equation.
</html>"));
    end Plant;

    model OpenLoopSimulator

      Plant plant annotation (Placement(transformation(extent={{20,-20},{60,20}},
              rotation=0)));
      Modelica.Blocks.Sources.Step combustibleFlowRate(
        offset=2.02,
        height=0.3,
        startTime=500) annotation (Placement(transformation(extent={{-40,-10},{
                -20,10}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(plant.combustibleFlowRate, combustibleFlowRate.y)
        annotation (Line(points={{20,0},{-19,0}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=1000, Tolerance=1e-006),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This model allows to simulate an open loop transients.
</html>"));
    end OpenLoopSimulator;

    model ClosedLoopSimulator

      Plant plant annotation (Placement(transformation(extent={{20,-20},{60,20}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp powerSetPoint(
        offset=4e6,
        height=2e6,
        duration=10,
        startTime=500) annotation (Placement(transformation(extent={{-80,-6},{-60,
                14}}, rotation=0)));
      RankineCycle.PID pID(
        Ti=5,
        PVmin=2e6,
        PVmax=12e6,
        CSmin=0,
        CSmax=4,
        steadyStateInit=true,
        Kp=0.25,
        holdWhenSimplified=true) annotation (Placement(transformation(extent={{
                -32,-10},{-12,10}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(plant.combustibleFlowRate, pID.CS)
        annotation (Line(points={{20,0},{-12,0}}, color={0,0,127}));
      connect(pID.SP, powerSetPoint.y)
        annotation (Line(points={{-32,4},{-59,4}}, color={0,0,127}));
      connect(pID.PV, plant.generatedPower) annotation (Line(points={{-32,-4},{
              -50,-4},{-50,-40},{80,-40},{80,0},{60.6,0}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=1000, Tolerance=1e-006),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This model simulates a simple continuous-time control system for the steam power plant. The generated power is controlled to the set point by a PI controller with anti-windup.</p>
<p>The model starts at steady state.
</html>"));
    end ClosedLoopSimulator;
    annotation (Documentation(revisions="<html>
<ul>
<li><i>12 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       Package created.</li>
</ul>
</html>", info="<html>
<p>This package contains models of a open Brayton cycle and its main components.
</html>"));
  end BraytonCycle;
end Examples;
