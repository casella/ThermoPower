package Examples "Application examples" 
  extends Modelica.Icons.Library;
  package CISE "CISE plant models" 
    extends Modelica.Icons.Library;
    model CISEPlant "Model of the CISE lab steam generator" 
      package Medium=Modelica.Media.Water.WaterIF97_ph(smoothModel=true);
      Water.Drum Drum(
        redeclare package Medium=Medium,
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
        Tmstart=545,
        tauc=5,
        gv=150,
        hlstart=1.15e5,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                annotation (extent=[-120,24; -60,84]);
      Water.SourceW FeedWater(h=1.1059e6) 
                    annotation (extent=[-176,34; -146,64]);
      annotation (Diagram, Documentation(info="<HTML>
<p>This is the model of the CISE steam generation plant described in the paper: F. Casella, A. Leva, \"Modelica open library for power plant simulation: design and experimental validation\", <i>Proceedings of the 2003 Modelica Conference</i>, Link&ouml eping, Sweden, 2003.
<p>The geometric parameters are already set. The start values set in the model parameters are guess values around the nominal full load steady state (60 bar drum pressure).
<p><b>This model cannot be simulated alone</b>, as the boundary conditions (feedwater flowrate and enthalpy, steam valve opening, power to the risers and power to the superheater) are not set. See the <tt>CiseSim</tt> model instead.
</HTML>
", revisions="<html>
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
        Icon(Rectangle(extent=[-200,200; 200,-200], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=7,
              rgbfillColor={255,255,255}))),
        Coordsys(extent=[-200,-200; 200,200], scale=0.1));
      Water.Flow1D2ph Downcomer(
        redeclare package Medium=Medium,
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
        FFtype=3,
        e=6.1e-4,
        pstartin=60e5,
        hstartin=1.15e6,
        hstartout=1.15e6,
        pstartout=61.18e5,
        DynamicMomentum=false,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                          annotation (extent=[-182,-82; -152,-52], rotation=-90);
      Water.Flow1D2ph Risers(
        redeclare package Medium=Medium,
        Nt=6,
        L=14.16,
        H=14.16,
        Dhyd=0.02096,
        omega=0.06584,
        wnf=0.3,
        HydraulicCapacitance=2,
        Kfc=1,
        Cfnom=0.013,
        FFtype=3,
        hstartout=1.5e6,
        A=3.45e-4,
        N=7,
        e=1.2e-3,
        pstartin=61.18e5,
        pstartout=60.06e5,
        wnom=0.23,
        hstartin=1.15e6,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                  annotation (extent=[-4,-140; -34,-110], rotation=90);
      Water.Flow1D2ph Pipe2Drum(
        redeclare package Medium=Medium,
        N=2,
        Nt=1,
        L=2.779,
        H=2.779,
        Dhyd=0.0266,
        omega=0.0835,
        A=5.557e-4,
        wnom=0.23,
        wnf=0.1,
        HydraulicCapacitance=1,
        Cfnom=0.01,
        FFtype=2,
        pstartout=60e5,
        e=9.9e-4,
        hstartin=1.6e6,
        hstartout=1.6e6,
        pstartin=60.06e5,
        initOpt=ThermoPower.Choices.Init.Options.steadyStateNoP) 
                         annotation (extent=[-4,-32; -34,-2],  rotation=90);
      Water.SinkW Blowdown(w0=0) annotation (extent=[-80,-20; -50,10]);
      Water.Flow1D Pipe2SH(
        redeclare package Medium=Medium,
        N=2,
        Nt=1,
        L=11.48,
        Dhyd=0.0205,
        omega=0.0644,
        A=3.301e-4,
        wnom=0.06,
        DynamicMomentum=false,
        HydraulicCapacitance=2,
        H=0,
        FFtype=2,
        hstartin=2.777e6,
        hstartout=2.777e6,
        pstartin=60e5,
        pstartout=59e5,
        Cfnom=0.004,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[-54,80; -24,110]);
      Water.Flow1D2phDB SH(
        redeclare package Medium=Medium,
        Nt=1,
        L=30,
        Dhyd=0.011,
        omega=0.0346,
        A=9.503e-5,
        Cfnom=0.0059,
        DynamicMomentum=false,
        HydraulicCapacitance=2,
        wnom=0.06,
        FFtype=3,
        hstartin=2.8e6,
        hstartout=2.8e6,
        pstartin=59e5,
        pstartout=57e5,
        N=5,
        e=1.7e-3,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                  annotation (extent=[-6,80; 24,110]);
      Water.Flow1D2ph Pipe2Valve(
        redeclare package Medium=Medium,
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
        FFtype=2,
        HydraulicCapacitance=1,
        hstartin=2.8e6,
        hstartout=2.8e6,
        pstartin=56e5,
        pstartout=54.5e5,
        Cfnom=0.004,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[44,80; 74,110]);
      Water.ValveVap Valve(
        redeclare package Medium=Medium,
        pnom=54.497e5,
        dpnom=48.997e5,
        wnom=2*.06,
        CvData=0,
        Av=2.7e-5) annotation (extent=[92,80; 122,110]);
      Water.SinkP Sink(p0=5.5e5) annotation (extent=[138,80; 168,110]);
      Thermal.HeatSource1D HeatSourceSH(
        Nt=1,
        L=30,
        omega=0.0628,
        N=5) annotation (extent=[-6,154; 24,184]);
      Thermal.HeatSource1D HeatSourceRisers(
        L=14.16,
        omega=0.08388,
        Nt=6,
        N=7) annotation (extent=[64,-140; 94,-110], rotation=-90);
      Water.Header HeaderLower(
        redeclare package Medium=Medium,
        V=8.372e-4,
        S=7.184e-2,
        gamma=2000,
        Cm=4.08e6*4.51e-4,
        hstart=1.1e6,
        Tmstart=540,
        pstartin=61.18e5,
        pstartout=61.18e5,
        initOpt=ThermoPower.Choices.Init.Options.steadyStateNoP) 
                        annotation (extent=[-140,-180; -110,-150]);
      Water.Header HeaderUpper(
        redeclare package Medium=Medium,
        V=8.372e-4,
        S=7.184e-2,
        gamma=2000,
        Cm=4.08e6*4.51e-4,
        pstartin=60.2e5,
        pstartout=60.2e5,
        Tmstart=540,
        hstart=1.6e6,
        initOpt=ThermoPower.Choices.Init.Options.steadyStateNoP) 
                      annotation (extent=[-34,-86; -4,-56],    rotation=90);
      Thermal.ConvHT DowncomerExchange(N=2, gamma=1800) 
        annotation (extent=[-150,-82; -120,-52], rotation=-90);
      Thermal.ConvHT RisersExchange(gamma=10000, N=7) 
        annotation (extent=[-4,-140; 26,-110], rotation=90);
      Thermal.ConvHT Pipe2DrumExchange(N=2, gamma=10000) 
        annotation (extent=[-2,-32; 28,-2],  rotation=90);
      Thermal.ConvHT Pipe2SHExchange(N=2, gamma=3000) 
        annotation (extent=[-54,108; -24,138],rotation=0);
      Thermal.ConvHT_htc SHExchange(N=5) 
        annotation (extent=[-6,136; 24,106],rotation=0);
      Thermal.ConvHT Pipe2ValveExchange(N=2, gamma=3000) 
        annotation (extent=[44,108; 74,138], rotation=0);
      Thermal.MetalTube DowncomerWall(
        N=2,
        L=15.923,
        rint=0.02461,
        rext=0.03015,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        Tstart1=540,
        TstartN=540,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[-124,-82; -92,-52],  rotation=90);
      Thermal.MetalTube RisersWalls(
        L=14.16,
        rint=0.01048,
        rext=0.01335,
        lambda=19,
        rhomcm=4.08e6,
        WallRes=true,
        N=7,
        Tstart1=548,
        TstartN=548,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
             annotation (extent=[26,-140; 56,-110],rotation=90);
      Thermal.MetalTube Pipe2DrumWall(
        N=2,
        L=2.779,
        rint=0.0133,
        rext=0.0167,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        Tstart1=548,
        TstartN=548,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[26,-32; 56,-2],  rotation=90);
      Thermal.MetalTube Pipe2SHWall(
        N=2,
        L=11.480,
        rint=0.01025,
        rext=0.01305,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        Tstart1=548,
        TstartN=548,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[-54,128; -24,158],rotation=180);
      Thermal.MetalTube SHWall(
        L=30,
        rint=0.0055,
        rext=0.0100,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        Tstart1=551,
        TstartN=551,
        N=5,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
             annotation (extent=[-6,128; 24,158],rotation=180);
      Thermal.MetalTube Pipe2ValveWall(
        L=6.6,
        rint=0.0100,
        rext=0.01275,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        N=2,
        Tstart1=548,
        TstartN=548,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[44,128; 74,158], rotation=180);
      Water.PressDrop PressDrop(
        redeclare package Medium=Medium,
        wnom=0.23,
        wnf=0.1,
        K=3,
        Kf=1e8,
        FFtype=2,
        A=5.62e-5,
        Kfc=2) annotation (extent=[-80,-180; -50,-150]);
      Modelica.Blocks.Interfaces.RealOutput DrumPressure 
        annotation (extent=[200,20; 220,40]);
      Modelica.Blocks.Interfaces.RealOutput DrumLevel 
        annotation (extent=[200,-40; 220,-20]);
      Modelica.Blocks.Interfaces.RealInput FeedWaterFlow 
        annotation (extent=[-210,90; -190,110]);
      Modelica.Blocks.Interfaces.RealInput RiserPower 
        annotation (extent=[210,-130; 190,-110]);
      Modelica.Blocks.Interfaces.RealInput ValveOpening 
        annotation (extent=[210,90; 190,110]);
      Modelica.Blocks.Interfaces.RealInput SHPower 
        annotation (extent=[210,150; 190,170]);
      Modelica.Blocks.Interfaces.RealInput FeedWaterEnthalpy 
        annotation (extent=[-210,150; -190,170]);
    equation 
      connect(Pipe2Drum.infl, HeaderUpper.outlet) 
        annotation (points=[-19,-32; -19,-56], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2));
      connect(HeaderUpper.inlet, Risers.outfl) 
        annotation (points=[-19,-86.15; -19,-110], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2));
      connect(Downcomer.wall, DowncomerExchange.side2) annotation (points=[-159.5,
            -67; -139.65,-67],                         style(color=45));
      connect(RisersExchange.side2, RisersWalls.int) annotation (points=[15.65,
            -125; 36.5,-125],                style(color=45));
      connect(Risers.wall, RisersExchange.side1) annotation (points=[-11.5,-125;
            6.5,-125],                        style(color=45));
      connect(SH.outfl, Pipe2Valve.infl) annotation (points=[24,95; 44,95],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2));
      connect(Valve.outlet, Sink.flange) annotation (points=[122,95; 138,95],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2));
      connect(Pipe2Valve.outfl, Valve.inlet) 
        annotation (points=[74,95; 92,95], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2));
      connect(HeaderLower.outlet, PressDrop.inlet) 
        annotation (points=[-110,-165; -80,-165], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2));
      connect(PressDrop.outlet, Risers.infl) 
        annotation (points=[-50,-165; -19,-165; -19,-140], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2));
      connect(Pipe2Drum.wall, Pipe2DrumExchange.side1) 
        annotation (points=[-11.5,-17; 8.5,-17],
                                            style(color=45));
      connect(Pipe2DrumExchange.side2, Pipe2DrumWall.int) 
        annotation (points=[17.65,-17; 36.5,-17],
                                            style(color=45));
      connect(RisersWalls.ext, HeatSourceRisers.wall) 
        annotation (points=[45.65,-125; 74.5,-125],style(color=45));
      DrumPressure = Drum.p;
      DrumLevel = Drum.y;
      connect(Pipe2Valve.wall, Pipe2ValveExchange.side2) annotation (points=[59,
            102.5; 59,118.35], style(color=45, rgbcolor={255,127,0}));
      connect(Pipe2SH.wall, Pipe2SHExchange.side2) annotation (points=[-39,
            102.5; -39,118.35], style(color=45, rgbcolor={255,127,0}));
      connect(Pipe2SHExchange.side1, Pipe2SHWall.int) annotation (points=[-39,
            127.5; -39,138.5], style(color=45, rgbcolor={255,127,0}));
      connect(Pipe2ValveExchange.side1, Pipe2ValveWall.int) annotation (points=
            [59,127.5; 59,138.5], style(color=45, rgbcolor={255,127,0}));
      connect(DowncomerWall.int, DowncomerExchange.side1) annotation (points=[
            -112.8,-67; -130.5,-67], style(color=45, rgbcolor={255,127,0}));
      connect(Blowdown.flange, Drum.blowdown) 
        annotation (points=[-80,-5; -90,-5; -90,24.6], style(thickness=2));
      connect(SH.infl, Pipe2SH.outfl) 
        annotation (points=[-6,95; -24,95], style(thickness=2));
      connect(HeaderLower.inlet, Downcomer.outfl) annotation (points=[-140.15,
            -165; -167,-165; -167,-82], style(thickness=2));
      connect(Downcomer.infl, Drum.downcomer) 
        annotation (points=[-167,-52; -111,33], style(thickness=2));
      connect(Pipe2Drum.outfl, Drum.riser) 
        annotation (points=[-19,-2; -66.6,36.9], style(thickness=2));
      connect(Pipe2SH.infl, Drum.steam) 
        annotation (points=[-54,95; -72.6,75], style(thickness=2));
      connect(FeedWater.flange, Drum.feedwater) 
        annotation (points=[-146,49; -119.1,49.5], style(thickness=2));
      connect(FeedWaterEnthalpy, FeedWater.in_h) annotation (points=[-200,160;
            -155,160; -155,58], style(color=74, rgbcolor={0,0,127}));
      connect(FeedWaterFlow, FeedWater.in_w0) annotation (points=[-200,100;
            -167,100; -167,58], style(color=74, rgbcolor={0,0,127}));
      connect(RiserPower, HeatSourceRisers.power) annotation (points=[200,-120;
            120,-120; 120,-125; 85,-125], style(color=74, rgbcolor={0,0,127}));
      connect(ValveOpening, Valve.theta) annotation (points=[200,100; 174,100;
            174,130; 107,130; 107,107], style(color=74, rgbcolor={0,0,127}));
      connect(SHPower, HeatSourceSH.power) annotation (points=[200,160; 106,160;
            106,188; 9,188; 9,175], style(color=74, rgbcolor={0,0,127}));
      connect(SHExchange.fluidside, SH.wall) annotation (points=[9,116.5; 9,
            102.5], style(color=3, rgbcolor={0,0,255}));
      connect(SHExchange.otherside, SHWall.int) annotation (points=[9,125.5; 9,
            138.5], style(color=45, rgbcolor={255,127,0}));
      connect(SHWall.ext, HeatSourceSH.wall) annotation (points=[9,147.65; 9,
            164.5], style(color=45, rgbcolor={255,127,0}));
    end CISEPlant;
    
    model CISESim 
      "CISE Plant model with boundary conditions and initial steady-state computation" 
      parameter MassFlowRate wfeed_offset(fixed=false) = 6.0e-2 
        "Offset of feedwater flow rate";
      parameter Real ValveOpening_offset(fixed=false) = 0.4 
        "Offset of valve opening";
      parameter Pressure InitialDrumPressure = 5.9359e+006;
      parameter Length InitialDrumLevel = -0.091;
      CISEPlant Plant;
      Modelica.Blocks.Sources.Constant Qsh(k=4928) 
        annotation (extent=[40,-140; 60,-120]);
      Modelica.Blocks.Sources.Ramp Qev(
        duration=1,
        height=0,
        offset=1.0141e5) 
                      annotation (extent=[40,-100; 60,-80]);
      Modelica.Blocks.Sources.Ramp wfeed1(
        duration=1,
        height=0,
        startTime=50,
        offset=wfeed_offset) 
                    annotation (extent=[-140,100; -120,120]);
      Modelica.Blocks.Math.Add3 wfeed annotation (extent=[40,100; 60,120]);
      Modelica.Blocks.Sources.Ramp wfeed2(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-140,70; -120,90]);
      Modelica.Blocks.Sources.Ramp ValveOpening1(
        duration=1,
        height=0,
        offset=ValveOpening_offset) 
                      annotation (extent=[-80,-20; -60,0]);
      Modelica.Blocks.Sources.Ramp ValveOpening2(
        duration=1,
        height=0,
        offset=0)     annotation (extent=[-80,-60; -60,-40]);
      Modelica.Blocks.Math.Add3 sum_1 annotation (extent=[-80,70; -60,90]);
      Modelica.Blocks.Sources.Ramp wfeed3(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-140,42; -120,62]);
      Modelica.Blocks.Sources.Ramp wfeed5(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-80,130; -60,150]);
      Modelica.Blocks.Sources.Ramp wfeed4(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-80,100; -60,120]);
      Modelica.Blocks.Sources.Ramp hfeed1(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[-20,62; 0,82]);
      Modelica.Blocks.Sources.Ramp hfeed2(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[-20,30; 0,50]);
      Modelica.Blocks.Math.Add3 hfeed annotation (extent=[40,30; 60,50]);
      Modelica.Blocks.Sources.Ramp hfeed3(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[-20,0; 0,20]);
      Modelica.Blocks.Math.Add sum_3 annotation (extent=[-20,-40; 0,-20]);
      Modelica.Blocks.Sources.Ramp ValveOpening3(
        duration=1,
        height=0,
        offset=0)     annotation (extent=[-20,-80; 0,-60]);
      Modelica.Blocks.Math.Add ValveOpening 
                                     annotation (extent=[40,-60; 60,-40]);
    equation 
      // Connection of the control signals to the process variables
      connect(Plant.FeedWaterEnthalpy,hfeed.y);
      connect(Plant.SHPower,Qsh.y);
      connect(Plant.RiserPower,Qev.y);
      connect(Plant.FeedWaterFlow,wfeed.y);
      connect(Plant.ValveOpening,ValveOpening.y);
      
      // Block diagram connections  
    initial equation 
      // Additional equations to determine the non-fixed parameters
      Plant.Drum.y=InitialDrumLevel;
      Plant.Drum.p=InitialDrumPressure;
      annotation (Diagram, Documentation(info="<HTML>
<p>This model provides the boundary condition values to the <tt>CISEPlant</tt>model; it can be used to simulate open-loop transients.
<p>The steady state is obtained by setting the derivatives of all the state variables to zero in the <tt>initial equation</tt> section. The offset values for <tt>ValveOpening1</tt> and <tt>wfeed1</tt>, i.e. the parameters <tt>ValveOpening_offset</tt> and <tt>wfeed_offset</tt> have a <tt>fixed=false</tt> attribute. Their actual values are set by the two additional initial equations specifying the initial drum level and pressure.
<p>The <tt>CISESim120501</tt>, <tt>CISESim180503</tt>, <tt>CISESim180504</tt> models extend <tt>CISESim</tt> by adding suitable numerical values to the boundary condition signal generators.
</HTML>
",     revisions="<html>
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
        Coordsys(extent=[-160,-160; 160,160], scale=0.1));
    equation 
      connect(wfeed5.y, wfeed.u1) annotation (points=[-59,140; -40,140; -40,118;
            38,118], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(wfeed4.y, wfeed.u2) annotation (points=[-59,110; 38,110], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(sum_1.y, wfeed.u3) annotation (points=[-59,80; -40,80; -40,102;
            38,102], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(hfeed.u1, hfeed1.y) annotation (points=[38,48; 20,48; 20,72; 1,72],
          style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(hfeed.u2, hfeed2.y) annotation (points=[38,40; 1,40], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(hfeed.u3, hfeed3.y) annotation (points=[38,32; 20,32; 20,10; 1,10],
          style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(ValveOpening.u1, sum_3.y) annotation (points=[38,-44; 20,-44; 20,
            -30; 1,-30], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(ValveOpening.u2, ValveOpening3.y) annotation (points=[38,-56; 20,
            -56; 20,-70; 1,-70], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(sum_3.u1, ValveOpening1.y) annotation (points=[-22,-24; -40,-24;
            -40,-10; -59,-10], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(ValveOpening2.y, sum_3.u2) annotation (points=[-59,-50; -40,-50;
            -40,-36; -22,-36], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(sum_1.u3, wfeed3.y) annotation (points=[-82,72; -100,72; -100,52;
            -119,52], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(sum_1.u2, wfeed2.y) annotation (points=[-82,80; -119,80], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(sum_1.u1, wfeed1.y) annotation (points=[-82,88; -100,88; -100,110;
            -119,110], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
    end CISESim;
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
</html>",
        revisions="<html>
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
</html>"), Icon);
    model CISESim120501 
      extends CISESim(
        InitialDrumPressure = 59.359e5,
        InitialDrumLevel = -0.091,
        wfeed_offset = 6.0e-2,
        ValveOpening_offset = 0.4,
        hfeed1(offset = 1.10593e6),
        wfeed1(startTime = 63,
               height = 0.0017,
               duration = 16),
        wfeed2(startTime = 80,
               height = 0.0009,
               duration = 540),
        Qev(offset = 1.0141e5,
            startTime = 63,
            height = -11.4e3,
            duration = 7),
        Qsh(k=4928));
      annotation (Documentation(info="<html>
This model extends <tt>CISESim</tt> with the appropriate steady-state values of the boundary conditions for the 120501 transient.
<p>This model starts from the required steady-state, and can be simulated for 1200 s to replicate the experimental data.
</html>",
        revisions="<html>
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
        InitialDrumPressure = 34.070e5,
        InitialDrumLevel = -0.0507,
        wfeed_offset = 2.89e-2,
        ValveOpening_offset = 0.4,
        hfeed1(offset = 9.7371109e5,
               startTime = 0,
               duration = 400,
               height = 5000),
        hfeed2(startTime = 400,
               duration = 300,
               height = -4200),
        hfeed3(startTime = 700,
               duration = 500,
               height = 14000),
        wfeed1(startTime = 80,
               height = 0.0015,
               duration = 60),
        wfeed2(startTime = 160,
               height = -0.0021,
               duration = 15),
        wfeed3(startTime = 200,
               height = 0.002,
               duration = 650),
        wfeed4(startTime = 865,
               height = 0.0016,
               duration = 3),
        wfeed5(startTime = 868,
               height = 0.001,
               duration = 340),
        ValveOpening1(startTime = 72,
                      duration = 12,
                      height = 0.062),
        Qev(offset=5.296179e4,
            startTime = 150,
            height = -200,
            duration = 350),
        Qsh(k=4570.7));
      annotation (Documentation(info="<html>
This model extends <tt>CISESim</tt> with the appropriate steady-state values of the boundary conditions for the 180503 transient.
<p>This model starts from the required steady-state, and can be simulated for 1200 s to replicate the experimental data.
</html>",
        revisions="<html>
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
        InitialDrumPressure = 29.3052e5,
        InitialDrumLevel = -0.0574,
        wfeed_offset = 2.838e-2,
        ValveOpening_offset = 0.4,
        ValveOpening1(startTime = 72,
                      duration = 40,
                      height = -0.0135),
        ValveOpening2(startTime = 112,
                      duration = 60,
                      height = -0.0080),
        ValveOpening3(startTime = 172,
                      duration = 140,
                      height = -0.0040),
        hfeed1(offset = 9.7371109e5,
               startTime = 140,
               duration = 460,
               height = -17000),
        hfeed2(startTime = 600,
               duration = 200,
               height = 11000),
        hfeed3(startTime = 800,
               duration = 400,
               height = 7000),
        wfeed1(startTime = 68,
               height = -0.006,
               duration = 3),
        wfeed2(startTime = 71,
               height = -0.005,
               duration = 75),
        wfeed3(startTime = 400,
               height = -0.001,
               duration = 450),
        Qev(offset = 5.1825e4,
            startTime = 150,
            duration = 0.1,
            height = -200),
        Qsh(k=4661.7));
      
      annotation (Documentation(info="<html>
This model extends <tt>CISESim</tt> with the appropriate steady-state values of the boundary conditions for the 180504 transient.
<p>This model starts from the required steady-state, and can be simulated for 1200 s to replicate the experimental data.

</html>",
        revisions="<html>
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
      package Medium=Modelica.Media.Water.WaterIF97_ph;
      constant Real pi=Modelica.Constants.pi;
      parameter Length r=0.115 "Drum diameter";
      parameter Length H=1.455 "Drum height";
      Pressure DrumPressure;
      Length DrumLevel;
      Water.SourceW FeedWater(h=1.1059e6) 
                    annotation (extent=[-92,0; -72,20]);
      annotation (Diagram, Documentation(info="<HTML>
<p>This is a simplified model of the CISE steam generation plant described in the paper: F. Casella, A. Leva, \"Modelica open library for power plant simulation: design and experimental validation\", <i>Proceedings of the 2003 Modelica Conference</i>, Link&ouml eping, Sweden, 2003. The drum model is based on the assumption of thermodynamic equilibrium between the liquid and vapour phases, thus leading to a drum model with only two states (pressure and liquid volume).
<p>The geometric parameters are already set. The start values set in the model parameters are guess values around the nominal full load steady state (60 bar drum pressure).
<p><b>This model cannot be simulated alone</b>, as the boundary conditions (feedwater flowrate and enthalpy, steam valve opening, power to the risers and power to the superheater) are not set. See the <tt>CiseSim2States</tt> model instead.
</HTML>
",     revisions="<html>
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
        Icon(Rectangle(extent=[-100,100; 100,-100], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=7,
              rgbfillColor={255,255,255})),
                             Text(
            extent=[-56,76; 64,-60],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="P")));
      Water.Flow1D Pipe2SH(
        redeclare package Medium=Medium,
        Nt=1,
        L=11.48,
        Dhyd=0.0205,
        omega=0.0644,
        A=3.301e-4,
        wnom=0.06,
        DynamicMomentum=false,
        HydraulicCapacitance=2,
        H=0,
        hstartin=2.777e6,
        hstartout=2.777e6,
        pstartin=60e5,
        pstartout=59e5,
        Cfnom=0.004,
        wnf=1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        N=2,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[-38,20; -18,40]);
      Water.Flow1D2phDB SH(
        redeclare package Medium=Medium,
        Nt=1,
        L=30,
        Dhyd=0.011,
        omega=0.0346,
        A=9.503e-5,
        Cfnom=0.0059,
        DynamicMomentum=false,
        HydraulicCapacitance=2,
        wnom=0.06,
        hstartin=2.8e6,
        hstartout=2.8e6,
        pstartin=59e5,
        pstartout=57e5,
        N=5,
        e=1.7e-3,
        wnf=0.1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Colebrook,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                  annotation (extent=[-8,20; 12,40]);
      Water.Flow1D2ph Pipe2Valve(
        redeclare package Medium=Medium,
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
        pstartin=56e5,
        pstartout=54.5e5,
        Cfnom=0.004,
        HydraulicCapacitance=1,
        wnf=1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[22,20; 42,40]);
      Water.ValveVap Valve(
        redeclare package Medium=Medium,
        pnom=54.497e5,
        dpnom=48.997e5,
        wnom=2*.06,
        CvData=0,
        Av=2.7e-5,
        b=0.1)     annotation (extent=[50,40; 70,20]);
      Water.SinkP Sink(p0=5.5e5) annotation (extent=[80,20; 100,40]);
      Thermal.HeatSource1D HeatSourceSH(
        Nt=1,
        L=30,
        omega=0.0628,
        N=5) annotation (extent=[-8,70; 12,90]);
      Thermal.ConvHT Pipe2SHExchange(gamma=3000, N=2) 
        annotation (extent=[-38,40; -18,60],  rotation=0);
      Thermal.ConvHT_htc SHExchange(N=5) 
        annotation (extent=[-8,60; 12,40],  rotation=0);
      Thermal.ConvHT Pipe2ValveExchange(N=2, gamma=3000) 
        annotation (extent=[22,40; 42,60],   rotation=0);
      Thermal.MetalTube Pipe2SHWall(
        L=11.480,
        rint=0.01025,
        rext=0.01305,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        Tstart1=548,
        TstartN=548,
        N=2,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[-38,54; -18,74],  rotation=180);
      Thermal.MetalTube SHWall(
        L=30,
        rint=0.0055,
        rext=0.0100,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        Tstart1=551,
        TstartN=551,
        N=5,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
             annotation (extent=[-8,54; 12,74],  rotation=180);
      Thermal.MetalTube Pipe2ValveWall(
        L=6.6,
        rint=0.0100,
        rext=0.01275,
        rhomcm=4.08e6,
        lambda=19,
        WallRes=true,
        N=2,
        Tstart1=548,
        TstartN=548,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[22,54; 42,74],   rotation=180);
      Water.Drum2States DrumBoiler(
        redeclare package Medium=Medium,
        Vd=0.0604,
        cm=523,
        pstart=60e5,
        Vldstart=pi*r^2*H/2,
        Vdcr=0.0628,
        Mmd=93,
        Mmdcr=270,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                        annotation (extent=[-64,4; -44,24]);
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow RisersHeat 
        annotation (extent=[-64,-32; -44,-12],
                                             rotation=90);
      Modelica.Blocks.Interfaces.RealInput SHPower 
        annotation (extent=[-110,74; -90,94]);
      Modelica.Blocks.Interfaces.RealInput ValveOpening 
        annotation (extent=[-110,-84; -90,-64]);
      Modelica.Blocks.Interfaces.RealInput RiserPower 
        annotation (extent=[-110,-54; -90,-34]);
      Modelica.Blocks.Interfaces.RealInput FeedWaterEnthalpy 
        annotation (extent=[-110,48; -90,66]);
      Modelica.Blocks.Interfaces.RealInput FeedWaterFlow 
        annotation (extent=[-110,20; -90,40]);
    equation 
      DrumLevel = DrumBoiler.Vld/(pi*r^2)-H/2;
      DrumPressure = DrumBoiler.p;
      connect(Pipe2SH.wall, Pipe2SHExchange.side2) annotation (points=[-28,35;
            -28,46.9],
          style(color=45));
      connect(Pipe2SHExchange.side1, Pipe2SHWall.int) 
        annotation (points=[-28,53; -28,61],       style(color=45));
      connect(Pipe2Valve.wall, Pipe2ValveExchange.side2) 
        annotation (points=[32,35; 32,46.9],               style(color=45));
      connect(Pipe2ValveExchange.side1, Pipe2ValveWall.int) 
        annotation (points=[32,53; 32,61],       style(color=45));
      connect(SHWall.int, SHExchange.otherside) 
        annotation (points=[2,61; 2,57; 2,57; 2,53],
                                                  style(color=45));
      connect(SHExchange.fluidside, SH.wall) annotation (points=[2,47; 2,35]);
      connect(HeatSourceSH.wall, SHWall.ext) 
        annotation (points=[2,77; 2,72.05; 2,67.1; 2,67.1],
                                                style(color=45));
      connect(DrumBoiler.heat, RisersHeat.port) annotation (points=[-54,5; -54,
            -12],                       style(color=42));
      connect(Pipe2SH.outfl, SH.infl) 
        annotation (points=[-18,30; -8,30], style(thickness=2));
      connect(SH.outfl, Pipe2Valve.infl) 
        annotation (points=[12,30; 22,30], style(thickness=2));
      connect(Pipe2Valve.outfl, Valve.inlet) 
        annotation (points=[42,30; 50,30], style(thickness=2));
      connect(Valve.outlet, Sink.flange) 
        annotation (points=[70,30; 80,30], style(thickness=2));
      connect(Pipe2SH.infl, DrumBoiler.steam) 
        annotation (points=[-38,30; -47.2,21.2], style(thickness=2));
      connect(DrumBoiler.feed, FeedWater.flange) 
        annotation (points=[-63,9.6; -72,10], style(thickness=2));
      connect(RiserPower, RisersHeat.Q_flow) annotation (points=[-100,-44; -54,
            -44; -54,-32], style(color=74, rgbcolor={0,0,127}));
      connect(ValveOpening, Valve.theta) annotation (points=[-100,-74; 60,-74;
            60,22], style(color=74, rgbcolor={0,0,127}));
      connect(SHPower, HeatSourceSH.power) annotation (points=[-100,84; -60,84;
            -60,94; 2,94; 2,84], style(color=74, rgbcolor={0,0,127}));
      connect(FeedWaterEnthalpy, FeedWater.in_h) annotation (points=[-100,57;
            -78,57; -78,16], style(color=74, rgbcolor={0,0,127}));
      connect(FeedWaterFlow, FeedWater.in_w0) annotation (points=[-100,30; -86,
            30; -86,16], style(color=74, rgbcolor={0,0,127}));
    end CISEPlant2States;
    
    model CISESim2States 
      "CISE plant reduced model with boundary conditions and initial steady-state computation" 
      parameter MassFlowRate wfeed_offset(fixed=false) = 6.0e-2 
        "Offset of feedwater flow rate";
      parameter Real ValveOpening_offset(fixed=false) = 0.4 
        "Offset of valve opening";
      parameter Pressure InitialDrumPressure = 5.9359e+006;
      parameter Length InitialDrumLevel = -0.091;
      CISEPlant2States Plant  annotation (extent=[100,-20; 160,40]);
      Modelica.Blocks.Sources.Constant Qsh(k=4928) 
        annotation (extent=[20,120; 40,140]);
      Modelica.Blocks.Sources.Ramp Qev(
        duration=1,
        height=0,
        offset=1.0141e5) 
                      annotation (extent=[0,-60; 20,-40]);
      Modelica.Blocks.Sources.Ramp wfeed1(
        duration=1,
        height=0,
        startTime=50,
        offset=wfeed_offset) 
                    annotation (extent=[-140,0; -120,20]);
      Modelica.Blocks.Math.Add3 wfeed annotation (extent=[-20,0; 0,20]);
      Modelica.Blocks.Sources.Ramp wfeed2(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-140,-30; -120,-10]);
      Modelica.Blocks.Sources.Ramp ValveOpening1(
        duration=1,
        height=0,
        offset=ValveOpening_offset) 
                      annotation (extent=[-80,-100; -60,-80]);
      Modelica.Blocks.Sources.Ramp ValveOpening2(
        duration=1,
        height=0,
        offset=0)     annotation (extent=[-80,-140; -60,-120]);
      Modelica.Blocks.Math.Add3 sum_1 annotation (extent=[-80,-30; -60,-10]);
      Modelica.Blocks.Sources.Ramp wfeed3(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-140,-60; -120,-40]);
      Modelica.Blocks.Sources.Ramp wfeed5(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-80,30; -60,50]);
      Modelica.Blocks.Sources.Ramp wfeed4(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-80,0; -60,20]);
      Modelica.Blocks.Sources.Ramp hfeed1(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[-140,110; -120,130]);
      Modelica.Blocks.Sources.Ramp hfeed2(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[-140,80; -120,100]);
      Modelica.Blocks.Math.Add3 hfeed annotation (extent=[-80,80; -60,100]);
      Modelica.Blocks.Sources.Ramp hfeed3(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[-140,50; -120,70]);
      Modelica.Blocks.Math.Add ValveOpening annotation (extent=[-20,-120; 0,
            -100]);
      annotation (Diagram, Documentation(info="<HTML>
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
</html>"),
        Coordsys(extent=[-160,-160; 160,160], scale=0.1));
    equation 
      connect(wfeed3.y, sum_1.u3) annotation (points=[-119,-50; -100,-50; -100,
            -28; -82,-28],
          style(color=74, rgbcolor={0,0,127}));
      connect(wfeed2.y, sum_1.u2) annotation (points=[-119,-20; -82,-20],
                 style(color=74, rgbcolor={0,0,127}));
      connect(wfeed1.y, sum_1.u1) annotation (points=[-119,10; -100,10; -100,
            -12; -82,-12],
                 style(color=74, rgbcolor={0,0,127}));
      connect(sum_1.y, wfeed.u3) annotation (points=[-59,-20; -46,-20; -46,2;
            -22,2],
          style(color=74, rgbcolor={0,0,127}));
    initial equation 
      // Additional equations to determine the non-fixed parameters
      Plant.DrumLevel = InitialDrumLevel;
      Plant.DrumPressure = InitialDrumPressure;
    equation 
      connect(hfeed.y, Plant.FeedWaterEnthalpy) annotation (points=[-59,90; 60,
            90; 60,27.1; 100,27.1],    style(color=74, rgbcolor={0,0,127}));
      connect(Qsh.y, Plant.SHPower) annotation (points=[41,130; 80,130; 80,35.2;
            100,35.2],    style(color=74, rgbcolor={0,0,127}));
      connect(Qev.y, Plant.RiserPower) annotation (points=[21,-50; 60,-50; 60,
            -3.2; 100,-3.2],            style(color=74, rgbcolor={0,0,127}));
      connect(ValveOpening.y, Plant.ValveOpening) annotation (points=[1,-110; 80,
            -110; 80,-12.2; 100,-12.2], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(wfeed.y, Plant.FeedWaterFlow) annotation (points=[1,10; 40,10; 40,
            19; 100,19], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(hfeed1.y, hfeed.u1) annotation (points=[-119,120; -100,120; -100,
            98; -82,98], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(hfeed2.y, hfeed.u2) annotation (points=[-119,90; -82,90], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(hfeed3.y, hfeed.u3) annotation (points=[-119,60; -100,60; -100,82;
            -82,82], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(wfeed5.y, wfeed.u1) annotation (points=[-59,40; -40,40; -40,18;
            -22,18], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(wfeed4.y, wfeed.u2) annotation (points=[-59,10; -22,10], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(ValveOpening1.y, ValveOpening.u1) annotation (points=[-59,-90;
            -40,-90; -40,-104; -22,-104], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(ValveOpening2.y, ValveOpening.u2) annotation (points=[-59,-130;
            -40,-130; -40,-116; -22,-116], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
    end CISESim2States;
    
    model CISESim2States120501 
      extends CISESim2States(
        InitialDrumPressure = 59.359e5,
        InitialDrumLevel = -0.091,
        wfeed_offset = 6.0e-2,
        ValveOpening_offset = 0.4,
        hfeed1(offset = 1.10593e6),
        wfeed1(startTime = 63,
               height = 0.0017,
               duration = 16),
        wfeed2(startTime = 80,
               height = 0.0009,
               duration = 540),
        Qev(offset = 1.0141e5,
            startTime = 63,
            height = -11.4e3,
            duration = 7),
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
</html>",
        revisions="<html>
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
  end CISE;
  
  package HRB "Heat recovery boiler models" 
    extends Modelica.Icons.Library;
    
    annotation (Documentation(revisions="<html>
<ul>
<li><i>26 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>",                                   info="<html>
This package contains models of a simple Heat Recovery Boiler. Different simulation models are provided, demonstrating how to initialise and run open-loop as well as closed loop simulations.
</html>"));
    
    model HeatExchanger "Base class for heat exchanger fluid - gas" 
      constant Real pi=Modelica.Constants.pi;
      replaceable package GasMedium = 
          Modelica.Media.Interfaces.PartialMedium;
      replaceable package WaterMedium=Water.StandardWater extends 
        Modelica.Media.Interfaces.PartialMedium;
      parameter Boolean StaticGasBalances = true;
      parameter Integer Nr=2 "Number of tube rows";
      parameter Integer Nt=2 "Number of parallel tubes in each row";
      parameter Length Lt "Length of a tube in a row";
      parameter Length Dint "Internal diameter of each tube";
      parameter Length Dext "External diameter of each tube";
      parameter Density rhom "Density of the tube metal walls";
      parameter SpecificHeatCapacity cm 
        "Specific heat capacity of the tube metal walls";
      parameter Area Sb "Cross-section of the boiler";
      parameter Length Lb "Length of the boiler";
      parameter Area St= Dext*pi*Lt*Nt*Nr 
        "Total area of the heat exchange surface";
      parameter CoefficientOfHeatTransfer gamma_nom = 150 
        "Nominal heat transfer coefficient";
      
      annotation (Diagram, Icon(Rectangle(extent=[-100,100; 100,-100],
                                                                    style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=30,
              rgbfillColor={230,230,230})), Line(points=[0,-80; 0,-40; 40,-20; -40,
                20; 0,40; 0,80],           style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2,
              fillPattern=1)),
          Text(
            extent=[-100,-115; 100,-145],
            string="%name",
            style(color=71, rgbcolor={85,170,255}))),
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
</html>", info="<html>
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
      Gas.FlangeA gasIn(redeclare package Medium = GasMedium) 
                          annotation (extent=[-120,-20; -80,20]);
      Gas.FlangeB gasOut(redeclare package Medium = GasMedium) 
                          annotation (extent=[80,-20; 120,20]);
      Water.FlangeA waterIn(redeclare package Medium = WaterMedium) 
        annotation (extent=[-20,80; 20,120]);
      Water.FlangeB waterOut(redeclare package Medium = WaterMedium) 
        annotation (extent=[-20,-120; 20,-80]);
      replaceable Water.Flow1DDB WaterSide(redeclare package Medium=WaterMedium,       Nt=Nt,
        A=pi*Dint^2/4,
        omega=pi*Dint,
        Dhyd=Dint,
        wnom=20,
        FFtype=2,
        Cfnom=0.005,
        L=Lt*Nr,
        N=Nr + 1,
        hstartin=1e5,
        hstartout=2.7e5,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                         extends Water.Flow1D 
                               annotation (extent=[-10,-60; 10,-40]);
      Thermal.ConvHT_htc WaterMetalHT(N=Nr + 1) 
                                       annotation (extent=[-10,-18; 10,-38]);
      Thermal.MetalTube TubeWalls(
        rint=Dint/2,
        rext=Dext/2,
        rhomcm=rhom*cm,
        lambda=20,
        L=Lt*Nr,
        N=Nr + 1,
        Tstart1=300,
        TstartN=340,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) "Tube" 
                                          annotation (extent=[-10,0; 10,-20]);
      ThermoPower.Examples.HRB.Flow1DGashtc GasSide(
                          redeclare package Medium = GasMedium,
        L=Lb,
        omega=St/Lb,
        wnom=10,
        gamma_nom(start=gamma_nom) = gamma_nom,
        A=Sb,
        Dhyd=St/Lb,
        N=Nr + 1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
        Tstartin=670,
        Tstartout=370,
        QuasiStatic=StaticGasBalances,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        kw=0.6)                annotation (extent=[-10,60; 10,40]);
      Thermal.CounterCurrent CounterCurrent1(N=Nr + 1) 
        annotation (extent=[-10,2; 10,22]);
      Thermal.ConvHT_htc ConvHT_htc1(N=Nr + 1) 
        annotation (extent=[-10,20; 10,40]);
    equation 
      connect(WaterMetalHT.fluidside,WaterSide. wall) annotation (points=[0,-31; 0,
            -45],         style(color=3, rgbcolor={0,0,255}));
      connect(TubeWalls.int,WaterMetalHT. otherside)  annotation (points=[0,-13; 0,
            -25],     style(color=45, rgbcolor={255,127,0}));
      connect(CounterCurrent1.side2,TubeWalls. ext) annotation (points=[0,8.9; 0,
            -6.9],   style(color=45, rgbcolor={255,127,0}));
      connect(CounterCurrent1.side1,ConvHT_htc1. otherside) annotation (points=[0,15; 0,
            27],              style(color=45, rgbcolor={255,127,0}));
      connect(ConvHT_htc1.fluidside,GasSide. wall) annotation (points=[0,33; 0,
            45],                      style(color=3, rgbcolor={0,0,255}));
      connect(GasSide.infl, gasIn) annotation (points=[-10,50; -60,50; -60,0;
            -100,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(GasSide.outfl, gasOut) annotation (points=[10,50; 60,50; 60,0;
            100,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(WaterSide.outfl, waterOut) annotation (points=[10,-50; 40,-50; 40,
            -70; 0,-70; 0,-100], style(thickness=2));
      connect(WaterSide.infl, waterIn) annotation (points=[-10,-50; -40,-50;
            -40,70; 0,70; 0,100], style(thickness=2));
    end HeatExchanger;
    
    model HRBPlant "Simple plant model with HRB" 
      replaceable package GasMedium = 
          Modelica.Media.IdealGases.MixtureGases.CombustionAir extends 
        Modelica.Media.Interfaces.PartialMedium;
      replaceable package WaterMedium=Modelica.Media.Water.WaterIF97_ph extends 
        Modelica.Media.Interfaces.PartialMedium;
      parameter Time Ts = 4 "Temperature sensor time constant";
      HeatExchanger Boiler(
        redeclare package GasMedium = GasMedium,
        Nr=10,
        Nt=100,
        Lt=3,
        Dint=0.01,
        Dext=0.012,
        rhom=7800,
        cm=650,
        Sb=8,
        Lb=2,
        redeclare package WaterMedium = WaterMedium) 
               annotation (extent=[-20,-20; 20,20]);
      annotation (Diagram, Documentation(revisions="<html>
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
</html>"),
        experiment(
          StopTime=1200,
          NumberOfIntervals=1000,
          Tolerance=1e-007),
        Icon(
          Rectangle(extent=[-160,160; 160,-160], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Text(
            extent=[-100,100; 100,-100],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="P"),
          Text(
            extent=[112,50; 142,30],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="TGin"),
          Text(
            extent=[112,110; 150,88],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="TGout"),
          Text(
            extent=[110,-90; 140,-110],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="TWin"),
          Text(
            extent=[110,-30; 148,-52],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="TWout")),
        Coordsys(extent=[-160,-160; 160,160], scale=0.1));
      Water.ValveLin Valve(Kv=20/4e5, redeclare package Medium = WaterMedium) 
                                          annotation (extent=[36,-50; 56,-70]);
      Water.SinkP SinkP1(p0=1e5, redeclare package Medium = WaterMedium) 
                         annotation (extent=[70,-70; 90,-50]);
      Gas.SourceW SourceW2(       redeclare package Medium = GasMedium,
        p0=1e5,
        T=670,
        w0=10)                    annotation (extent=[-96,-10; -76,10]);
      Gas.SinkP SinkP2(redeclare package Medium = GasMedium,
        T=300)         annotation (extent=[100,-10; 120,10]);
      Gas.PressDropLin PressDropLin1(redeclare package Medium = GasMedium, R=
            1000/10) annotation (extent=[60,-10; 80,10]);
      Water.SensT WaterIn(redeclare package Medium = WaterMedium) 
                           annotation (extent=[-40,44; -20,64]);
      Water.SensT WaterOut(redeclare package Medium = WaterMedium) 
                            annotation (extent=[6,-66; 26,-46]);
      Gas.SensT GasOut(redeclare package Medium = GasMedium) 
        annotation (extent=[30,-6; 50,14]);
      Gas.SensT GasIn(redeclare package Medium = GasMedium) 
        annotation (extent=[-60,-6; -40,14]);
      Water.SourceP SourceP1(p0=5e5, redeclare package Medium = WaterMedium) 
                                     annotation (extent=[-80,40; -60,60]);
      Modelica.Blocks.Interfaces.RealInput ValveOpening 
        annotation (extent=[-170,-90; -150,-70]);
      Modelica.Blocks.Interfaces.RealOutput WaterOut_T 
        annotation (extent=[160,-50; 180,-30]);
      Modelica.Blocks.Interfaces.RealOutput WaterIn_T 
        annotation (extent=[160,-110; 180,-90]);
      Modelica.Blocks.Interfaces.RealOutput GasOut_T 
        annotation (extent=[160,90; 180,110]);
      Modelica.Blocks.Interfaces.RealOutput GasIn_T 
        annotation (extent=[160,30; 180,50]);
      Modelica.Blocks.Interfaces.RealInput GasFlowRate 
        annotation (extent=[-170,70; -150,90]);
      Modelica.Blocks.Continuous.FirstOrder GasFlowActuator(k=1, T=1) 
        annotation (extent=[-130,70; -110,90]);
      Modelica.Blocks.Continuous.FirstOrder WaterInTSensor(k=1, T=Ts) 
        annotation (extent=[120,-110; 140,-90]);
      Modelica.Blocks.Continuous.FirstOrder WaterOutTSensor(k=1, T=Ts) 
        annotation (extent=[120,-50; 140,-30]);
      Modelica.Blocks.Continuous.FirstOrder GasInTSensor(k=1, T=Ts) 
        annotation (extent=[120,30; 140,50]);
      Modelica.Blocks.Continuous.FirstOrder GasOutTSensor(k=1, T=Ts) 
        annotation (extent=[120,90; 140,110]);
      Modelica.Blocks.Continuous.FirstOrder ValveOpeningActuator(k=1, T=1) 
        annotation (extent=[-130,-90; -110,-70]);
    equation 
      connect(GasFlowActuator.y, SourceW2.in_w0) annotation (points=[-109,80;
            -92,80; -92,5],      style(color=74, rgbcolor={0,0,127}));
      connect(GasInTSensor.u, GasIn.T) annotation (points=[118,40; -32,40; -32,
            10; -43,10],style(color=74, rgbcolor={0,0,127}));
      connect(GasOut.T, GasOutTSensor.u) annotation (points=[47,10; 60,10; 60,
            100; 118,100],     style(color=74, rgbcolor={0,0,127}));
      connect(GasOutTSensor.y, GasOut_T) annotation (points=[141,100; 170,100],
                             style(color=74, rgbcolor={0,0,127}));
      connect(WaterIn.T, WaterInTSensor.u) annotation (points=[-22,60; 94,60;
            94,-100; 118,-100], style(color=74, rgbcolor={0,0,127}));
      connect(WaterOut.T, WaterOutTSensor.u) annotation (points=[24,-50; 24,-40;
            118,-40],          style(color=74, rgbcolor={0,0,127}));
      connect(WaterOutTSensor.y, WaterOut_T) annotation (points=[141,-40; 170,
            -40],                  style(color=74, rgbcolor={0,0,127}));
      connect(GasInTSensor.y, GasIn_T) annotation (points=[141,40; 170,40],
                                   style(color=74, rgbcolor={0,0,127}));
      connect(Valve.cmd, ValveOpeningActuator.y) annotation (points=[46,-68; 46,
            -80; -109,-80],     style(color=74, rgbcolor={0,0,127}));
      connect(WaterInTSensor.y, WaterIn_T) annotation (points=[141,-100; 170,
            -100],                   style(color=74, rgbcolor={0,0,127}));
    initial equation 
      der(GasFlowActuator.y)=0;
      der(GasInTSensor.y)=0;
      der(GasOutTSensor.y)=0;
      der(ValveOpeningActuator.y)=0;
      der(WaterInTSensor.y)=0;
      der(WaterOutTSensor.y)=0;
      
    equation 
      connect(WaterOut.inlet, Boiler.waterOut) 
        annotation (points=[10,-60; 0,-60; 0,-20],   style(thickness=2));
      connect(Boiler.gasIn, GasIn.outlet) annotation (points=[-20,0; -44,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(GasOut.inlet, Boiler.gasOut) annotation (points=[34,0; 20,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(Boiler.waterIn, WaterIn.outlet) 
        annotation (points=[0,20; 0,50; -24,50], style(thickness=2));
      connect(SourceP1.flange, WaterIn.inlet) 
        annotation (points=[-60,50; -36,50], style(thickness=2));
      connect(WaterOut.outlet, Valve.inlet) annotation (points=[22,-60; 36,-60],
                                     style(thickness=2));
      connect(Valve.outlet, SinkP1.flange) 
        annotation (points=[56,-60; 70,-60],   style(thickness=2));
      connect(PressDropLin1.outlet, SinkP2.flange) annotation (points=[80,0;
            100,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(GasOut.outlet, PressDropLin1.inlet) annotation (points=[46,0; 60,
            0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(SourceW2.flange, GasIn.inlet) annotation (points=[-76,0; -56,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(GasFlowActuator.u, GasFlowRate) annotation (points=[-132,80; -160,
            80], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(ValveOpeningActuator.u, ValveOpening) annotation (points=[-132,
            -80; -160,-80], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
    end HRBPlant;
    
    model Flow1DGashtc "Gas flow model with h.t.c. computation" 
      extends Gas.Flow1D( redeclare ThermoPower.Thermal.DHThtc wall);
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_nom 
        "Nominal h.t.c. coefficient";
      parameter Real kw 
        "Exponent of the mass flow rate in the h.t.c. correlation";
    equation 
      for j in 1:N loop
        wall.gamma[j] = gamma_nom*noEvent(abs(infl.w/wnom)^kw);
      end for;
      annotation (Diagram, Documentation(info="<html>
This model extends <tt>Gas.Flow1D</tt> by adding the computation of the heat transfer coefficient, which is proportional to the mass flow rate, raised to the power of <tt>kw</tt>.
</html>", revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>"));
    end Flow1DGashtc;
    
    block DigitalPI 
      extends Modelica.Blocks.Interfaces.DiscreteBlock;
      parameter Real Kp "Gain";
      parameter Modelica.SIunits.Time Ti(min=0) "Integral time";
      parameter Real b(min=0) = 1 "Set-point weight (proportional action)";
      parameter Real CSmax "Control signal saturation upper bound";
      parameter Real CSmin "Control signal saturation lower bound";
      parameter Real CSstart(
        min=CSmin,
        max=CSmax) = 0 "Control signal initial value";
      parameter Boolean StartSteadyState=false 
        "True=steady state initial equations activated";
      
      Modelica.Blocks.Interfaces.BooleanInput MANswitch 
        annotation (extent=[-110,40; -90,60],   rotation=0);
      input Real SP "Set-Point (input)";
      input Real PV "Process Value (input)";
      discrete output Real CS(start=CSstart) "Control Signal (output)";
    protected 
      Boolean Man;
      Boolean Trk;
      discrete Real CSwind "Control Signal auxiliary variable for anti-wind up";
      parameter Modelica.SIunits.Time Ts=samplePeriod "Sampling Time";
      parameter Real alpha=(Kp*b*2*Ti + Kp*Ts)/(2*Ti);
      parameter Real beta=(-Kp*b*2*Ti + Kp*Ts)/(2*Ti);
      parameter Real gamma=(-Kp*2*Ti - Kp*Ts)/(2*Ti);
      parameter Real delta=(Kp*2*Ti - Kp*Ts)/(2*Ti);
    public 
      Modelica.Blocks.Interfaces.RealInput SPport 
        annotation (extent=[-120,-20; -80,20]);
      Modelica.Blocks.Interfaces.RealOutput CSport 
        annotation (extent=[80,-20; 120,20]);
      Modelica.Blocks.Interfaces.RealInput MANport 
        annotation (extent=[40,80; 80,120],   rotation=270);
      Modelica.Blocks.Interfaces.RealInput PVport 
        annotation (extent=[-120,-80; -80,-40]);
      Modelica.Blocks.Interfaces.BooleanInput TRKswitch 
        annotation (extent=[-110,76; -90,96],   rotation=0);
      Modelica.Blocks.Interfaces.RealInput TRKport 
        annotation (extent=[-28,80; 12,120],  rotation=270);
    equation 
      if cardinality(MANswitch) == 0 then
        MANswitch = false;
      end if;
      
      if cardinality(TRKswitch) == 0 then
        TRKswitch = false;
      end if;
      
      if cardinality(MANport) == 0 then
        MANport = 0;
      end if;
      
      if cardinality(TRKport) == 0 then
        TRKport = 0;
      end if;
      
      when {initial(),sampleTrigger} then
        Man =MANswitch;
        Trk =TRKswitch;
        if Man then
          if MANport >= CSmax then
            CS = CSmax;
            CSport = CSmax;
          elseif MANport <= CSmin then
            CS = CSmin;
            CSport = CSmin;
          else
            CS = MANport;
            CSport = MANport;
          end if;
        else
          if (Trk and not Man) then
            if TRKport >= CSmax then
              CS = CSmax;
              CSport = CSmax;
            elseif TRKport <= CSmin then
              CS = CSmin;
              CSport = CSmin;
            else
              CS = TRKport;
              CSport = TRKport;
            end if;
          else
            if CSwind >= CSmax then
              CS = CSmax;
              CSport = CSmax;
            elseif CSwind <= CSmin then
              CS = CSmin;
              CSport = CSmin;
            else
              CS = CSwind;
              CSport = CS;
            end if;
          end if;
        end if;
        CSwind = pre(CS) + alpha*SP + beta*pre(SP) + gamma*PV + delta*pre(PV);
        SP =SPport;
        PV =PVport;
      end when;
    initial equation 
      if StartSteadyState then
        pre(CS) = CS;
        pre(PV) = PV;
        pre(SP) = SP;
      end if;
      annotation (Icon(
          Text(extent=[-56, 36; 16, -34], string="SP"),
          Text(extent=[-58, -38; 14, -108], string="PV"),
          Text(extent=[62, -16; 134, -86], string="CS"),
          Text(extent=[28, 86; 104, 24], string="MANp"),
          Text(extent=[-56, 86; 20, 24], string="TRKp"),
          Text(extent=[-88, 104; -50, 70], string="TRK"),
          Text(extent=[-88, 66; -50, 32], string="MAN")), Diagram,
        Documentation(info="<html>
This is the model of a digital PI controller, complete with auto/man and tracking functionalies.
</html>", revisions="<html>
<ul>
<li><i>15 Sep 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
       First release.</li>
</ul>
</html>"));
    end DigitalPI;
    
    package Simulators "Simulation models for the HRB example" 
      model OpenLoopSimulator 
        HRBPlant Plant annotation (extent=[-10,-26; 70,54]);
        Modelica.Blocks.Sources.Step ValveOpening(
          height=-.1,
          offset=1,
          startTime=50) 
                       annotation (extent=[-88,-40; -68,-20]);
        annotation (Diagram, experiment(StopTime=150, Tolerance=1e-006),
          Documentation(revisions="<html>
<ul>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
", info = "<html>
This model allows to simulate an open loop transient, starting from the guess initial conditions set inside the HRB model.</p>
<p>Simulate for 150 s. After about 50 s, the plant reaches a steady state. At time t = 50 s, the water valve is closed by 10%. At time t = 100 s, the gas flow rate is increased by 100%.
</html>"));
        Modelica.Blocks.Sources.Ramp GasFlowRate(          offset=10,
          height=1,
          startTime=100) 
          annotation (extent=[-88,18; -68,38]);
        Modelica.Blocks.Math.Add Add1 annotation (extent=[-46,24; -26,44]);
        Modelica.Blocks.Interfaces.RealInput GasFlowRateInput 
          annotation (extent=[-110,70; -90,90]);
        Modelica.Blocks.Interfaces.RealInput ValveOpeningInput 
          annotation (extent=[-110,-10; -90,10]);
        Modelica.Blocks.Math.Add Add2 annotation (extent=[-46,-16; -26,4]);
        Modelica.Blocks.Interfaces.RealOutput TGoutOutput 
          annotation (extent=[90,70; 110,90]);
        Modelica.Blocks.Interfaces.RealOutput TWoutOutput 
          annotation (extent=[90,-70; 110,-50]);
      equation 
        connect(Plant.GasOut_T, TGoutOutput) annotation (points=[72.5,39; 80,39;
              80,80; 100,80], style(color=74, rgbcolor={0,0,127}));
        connect(Plant.WaterOut_T, TWoutOutput) annotation (points=[72.5,4; 80,4;
              80,-60; 100,-60],          style(color=74, rgbcolor={0,0,127}));
        connect(Add1.u2, GasFlowRate.y) annotation (points=[-48,28; -67,28], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Add1.u1, GasFlowRateInput) annotation (points=[-48,40; -60,40; -60,
              80; -100,80], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Plant.GasFlowRate, Add1.y) annotation (points=[-10,34; -25,34],
            style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Plant.ValveOpening, Add2.y) annotation (points=[-10,-6; -25,-6],
            style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Add2.u2, ValveOpening.y) annotation (points=[-48,-12; -60,-12;
              -60,-30; -67,-30], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(Add2.u1, ValveOpeningInput) annotation (points=[-48,0; -100,0],
            style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
      end OpenLoopSimulator;
      
      model OpenLoopSimulatorHtc 
        extends OpenLoopSimulator(Plant(Boiler(gamma_nom(fixed=false))));
      initial equation 
        Plant.GasOut.T = Modelica.SIunits.Conversions.from_degC(125);
        annotation (Documentation(revisions="<html>
<ul>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
", info = "<html>
This model extends <tt>OpenLoopSimulatorSS</tt>, by computing the heat transfer coefficient to obtain an initial value of the gas outlet temperature equal to 125 degrees Celsius. This is performed by setting the <tt>fixed</tt> attribute of the <tt>Plant.Boiler.gamma_nom</tt> parameter to <tt>false</tt>, and by adding a corresponding initial equation to set the desired value of <tt>Plant.GasOut.T.</tt></p>
<p>Simulate for 150 s. The transient starts at steady state, with the desired values of the heat transfer coefficient and gas outlet temperature. At time t = 50 s, the water valve is closed by 10%. At time t = 100 s, the gas flow rate is increased by 100%.
</html>"), experiment(StopTime=150));
      end OpenLoopSimulatorHtc;
      
      model OpenLoopSimulatorSimplified 
        extends OpenLoopSimulator(
          Plant(redeclare package WaterMedium = Media.LiquidWaterConstant,
                redeclare package GasMedium = 
                  Modelica.Media.IdealGases.MixtureGases.CombustionAir(fixedX=true),
                Boiler(StaticGasBalances=true)));
        annotation (experiment(StopTime=150), Documentation(info="<html>
This model extends <tt>OpenLoopSimulatorSS</tt>, with some modifiers to obtain a simplified version: the water medium model is replaced by a simpler one, the gas medium is assumed at fixed composition, and static balances are assumed for the gas side.</p>
</html>", revisions="<html>
<ul>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
"));
      end OpenLoopSimulatorSimplified;
      
      model ClosedLoopSimulator 
        
        HRBPlant Plant(ValveOpeningActuator(y_start=1), GasFlowActuator(y_start=
               5))     annotation (extent=[20,-40; 80,20]);
        Modelica.Blocks.Sources.Step ValveOpening(
          offset=1,
          startTime=50,
          height=-.1)  annotation (extent=[-80,-40; -60,-20]);
        annotation (Diagram, experiment(StopTime=300),
          Documentation(revisions="<html>
<ul>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
", info="<html>
This model simulates a simple continuous-time control system for the HRB. The water outlet temperature is controlled to the set point by a PI controller, despite the disturbances on the water flow rate.</p>
<p>Simulate for 300 s. the system starts at steady state; at t = 50 s, the water flow rate is reduced by 10%; at t = 150 s, the water temperature set point is increased by 10 K.
</html>"));
        Modelica.Blocks.Continuous.PI TempController(k=0.3, T=12) 
          annotation (extent=[-20,0; 0,20]);
        Modelica.Blocks.Math.Feedback Feedback1 
          annotation (extent=[-50,20; -30,0]);
        Modelica.Blocks.Sources.Step TWOutSetPoint(
          offset=330,
          height=10,
          startTime=150) 
                       annotation (extent=[-80,0; -60,20]);
      equation 
        connect(ValveOpening.y, Plant.ValveOpening) annotation (points=[-59,-30;
              6,-30; 6,-25; 20,-25],   style(color=74, rgbcolor={0,0,127}));
        connect(TempController.y, Plant.GasFlowRate) annotation (points=[1,10; 10,
              10; 10,5; 20,5],        style(color=74, rgbcolor={0,0,127}));
        connect(Feedback1.y, TempController.u) annotation (points=[-31,10; -22,
              10], style(color=74, rgbcolor={0,0,127}));
        connect(Plant.WaterOut_T, Feedback1.u2) annotation (points=[81.875,
              -17.5; 92,-17.5; 92,46; -40,46; -40,18],
                                                style(color=74, rgbcolor={0,0,
                127}));
        connect(TWOutSetPoint.y, Feedback1.u1) annotation (points=[-59,10; -48,
              10], style(color=74, rgbcolor={0,0,127}));
      initial equation 
        // Control system
        der(TempController.x)=0;
      end ClosedLoopSimulator;
      
      model ClosedLoopDigitalSimulator 
        HRBPlant Plant(GasFlowActuator(y_start=5), ValveOpeningActuator(y_start=
               1))     annotation (extent=[20,-40; 80,20]);
        Modelica.Blocks.Sources.Step ValveOpening(
          height=-.1,
          offset=1,
          startTime=50) 
                       annotation (extent=[-80,-40; -60,-20]);
        annotation (Diagram, experiment(
            StopTime=300,
            Interval=0.1,
            Tolerance=1e-006,
            Algorithm="Dassl"),
          Documentation(revisions="<html>
<ul>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
", info="<html>
This model simulates simple digital control system for the HRB. The water outlet temperature is controlled to the set point by a PI controller, despite the disturbances on the water flow rate.</p>
<p>Simulate for 300 s. the system starts at steady state; at t = 50 s, the water flow rate is reduced by 10%; at t = 150 s, the water temperature set point is increased by 10 K.
</html>"));
        Modelica.Blocks.Sources.Step TWOutSetPoint(
          offset=330,
          height=10,
          startTime=150) 
                       annotation (extent=[-80,0; -60,20]);
        DigitalPI DigitalPI1(
          Kp=0.3,
          Ti=12,
          CSmax=11,
          CSmin=5,
          samplePeriod=0.4,
          CSstart=6.2,
          StartSteadyState=true) 
                            annotation (extent=[-34,20; -14,0]);
      equation 
        connect(ValveOpening.y, Plant.ValveOpening) annotation (points=[-59,-30;
              6,-30; 6,-25; 20,-25],   style(color=74, rgbcolor={0,0,127}));
        connect(DigitalPI1.CSport, Plant.GasFlowRate) annotation (points=[-14,10;
              8,10; 8,5; 20,5],               style(color=74, rgbcolor={0,0,127}));
        connect(TWOutSetPoint.y, DigitalPI1.SPport) annotation (points=[-59,10;
              -34,10],                         style(color=74, rgbcolor={0,0,
                127}));
        connect(Plant.WaterOut_T, DigitalPI1.PVport) annotation (points=[81.875,
              -17.5; 94,-17.5; 94,40; -42,40; -42,16; -34,16],       style(
              color=74, rgbcolor={0,0,127}));
      end ClosedLoopDigitalSimulator;
      
      model ClosedLoopDigitalSimulatorSimplified 
        extends ClosedLoopDigitalSimulator(
          Plant(redeclare package WaterMedium = Media.LiquidWaterConstant,
                redeclare package GasMedium = 
                  Modelica.Media.IdealGases.MixtureGases.CombustionAir(fixedX=true),
                Boiler(StaticGasBalances=true)));
        annotation (experiment(
            StopTime=300,
            Interval=0.1,
            Algorithm="Euler"), Documentation(info="<html>
This model extends <tt>ClosedLoopDigitalSimulatorSS</tt>, with some modifiers to obtain a simplified version: the water medium model is replaced by a simpler one, the gas medium is assumed at fixed composition, and static balances are assumed for the gas side.</p>
<p>These simplifications allow to run the simulation much faster than the original version.
</html>", revisions="<html>
<ul>
<li><i>25 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
"));
      end ClosedLoopDigitalSimulatorSimplified;
    end Simulators;
  end HRB;
  
  package RankineCycle "Steam power plant" 
    partial model HEInterface 
      
      replaceable package FlueGasMedium = ThermoPower.Media.FlueGas extends 
        Modelica.Media.Interfaces.PartialMedium "Flue gas model";
      replaceable package FluidMedium = ThermoPower.Water.StandardWater extends 
        Modelica.Media.Interfaces.PartialPureSubstance "Fluid model";
      
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
      
      //Start value
      parameter Boolean use_T = true 
        "Select: -true- to insert the initial temperature or -false- to insert the initial specifc enthalpy"
         annotation(Dialog(tab = "Initialization Conditions"));
      parameter Boolean SSInit = false "Steady-state initialization" annotation(Dialog(tab = "Initialization Conditions"));
      
      parameter Modelica.SIunits.Temperature Tstart_G_In 
        "Inlet gas temperature start value"            annotation(Dialog(tab = "Initialization"));
      parameter Modelica.SIunits.Temperature Tstart_G_Out 
        "Outlet gas temperature start value"           annotation(Dialog(tab = "Initialization"));
      parameter Modelica.SIunits.Temperature Tstart_G[N_G]=linspace(
              Tstart_G_In,
              Tstart_G_Out,
              N_G) 
        "Start value of gas temperature vector (initialized by default)" annotation(Dialog(tab = "Initialization"));
      parameter Modelica.SIunits.Pressure pstart_G=gasNomPressure 
        "Pressure start value, gas side" 
                                        annotation(Dialog(tab = "Initialization"));
      parameter Modelica.SIunits.Temperature Tstart_M_In 
        "Inlet metal wall temperature start value"       annotation(Dialog(tab = "Initialization"));
      parameter Modelica.SIunits.Temperature Tstart_M_Out 
        "Outlet metal wall temperature start value"      annotation(Dialog(tab = "Initialization"));
      parameter Modelica.SIunits.Temperature Tstart_M[N_F]=linspace(
              Tstart_M_In,
              Tstart_M_Out,
              N_F) 
        "Start value of metal wall temperature vector (initialized by default)"
                                                                                annotation(Dialog(tab = "Initialization"));
      
      parameter Modelica.SIunits.Temperature Tstart_F_In=
          FluidMedium.temperature_ph(fluidNomPressure, hstart_F_In) 
        "Inlet fluid temperature start value"             annotation(Dialog(enable = use_T,
                                                                            tab = "Initialization"));
      parameter Modelica.SIunits.Temperature Tstart_F_Out=
          FluidMedium.temperature_ph(fluidNomPressure, hstart_F_Out) 
        "Outlet fluid temperature start value"            annotation(Dialog(enable = use_T,
                                                                            tab = "Initialization"));
      parameter Modelica.SIunits.Temperature Tstart_F[N_F]=linspace(
              Tstart_F_In,
              Tstart_F_Out,
              N_F) 
        "Start value of fluid temperature vector (initialized by default)" 
                                                                        annotation(Dialog(tab = "Initialization"));
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_In=
          FluidMedium.specificEnthalpy_pT(fluidNomPressure, Tstart_F_In) 
        "Inlet fluid specific enthalpy start value"                   annotation(Dialog(enable = not use_T,
                                                                                        tab = "Initialization"));
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_Out=
          FluidMedium.specificEnthalpy_pT(fluidNomPressure, Tstart_F_Out) 
        "Outlet fluid specific enthalpy start value"                  annotation(Dialog(enable = not use_T,
                                                                                        tab = "Initialization"));
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F[N_F]=linspace(
              hstart_F_In,
              hstart_F_Out,
              N_F) 
        "Start value of fluid enthalpy vector (initialized by default)" annotation(Dialog(tab = "Initialization"));
      parameter Modelica.SIunits.Pressure pstartin_F=fluidNomPressure 
        "Inlet fluid pressure start value"                annotation(Dialog(tab = "Initialization"));
      parameter Modelica.SIunits.Pressure pstartout_F=fluidNomPressure 
        "Outlet fluid pressure start value"                annotation(Dialog(tab = "Initialization"));
      
      annotation (Diagram, Icon(Rectangle(extent=[-100,100; 100,-100],
                                                                    style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=30,
              rgbfillColor={230,230,230})), Line(points=[0,-80; 0,-40; 40,-20; -40,
                20; 0,40; 0,80],           style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2,
              fillPattern=1)),
          Text(
            extent=[-100,-115; 100,-145],
            string="%name",
            style(color=71, rgbcolor={85,170,255}))),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>Base class for heat exchanger fluid - gas, containing the common parameters and connectors.
</html>"));
      Gas.FlangeA gasIn(redeclare package Medium = FlueGasMedium) 
                          annotation (extent=[-120,-20; -80,20]);
      Gas.FlangeB gasOut(redeclare package Medium = FlueGasMedium) 
                          annotation (extent=[80,-20; 120,20]);
      Water.FlangeA waterIn(redeclare package Medium = FluidMedium) 
        annotation (extent=[-20,80; 20,120]);
      Water.FlangeB waterOut(redeclare package Medium = FluidMedium) 
        annotation (extent=[-20,-120; 20,-80]);
      
    end HEInterface;
    
    model HE "Heat Exchanger fluid - gas" 
      extends ThermoPower.Examples.RankineCycle.HEInterface(
                            pstartout_F=
            fluidNomPressure - dpnom);
      
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_G 
        "Constant heat transfer coefficient in the gas side";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_F 
        "Constant heat transfer coefficient in the fluid side";
      parameter Choices.Flow1D.FFtypes.Temp FFtype_F=ThermoPower.Choices.Flow1D.FFtypes.NoFriction 
        "Friction Factor Type, fluid side";
      parameter Real Kfnom=0 "Nominal hydraulic resistance coefficient";
      parameter Real Cfnom=0 "Nominal Fanning friction factor";
      parameter Choices.Flow1D.HCtypes.Temp HCtype_F=ThermoPower.Choices.Flow1D.HCtypes.Downstream 
        "Location of the hydraulic capacitance, fluid side";
      parameter Boolean counterCurrent=true "Counter-current flow";
      parameter Modelica.SIunits.Pressure dpnom=0 
        "Nominal pressure drop fluid side (friction term only!)";
      parameter Modelica.SIunits.Density rhonom=0 
        "Nominal inlet density fluid side";
      parameter Boolean gasQuasiStatic=false 
        "Quasi-static model of the flue gas (mass, energy and momentum static balances";
      constant Real pi=Modelica.Constants.pi;
      
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
        pstartin=pstartin_F,
        pstartout=pstartout_F,
        FFtype=FFtype_F,
        dpnom=dpnom,
        rhonom=rhonom,
        HydraulicCapacitance=HCtype_F,
        hstart=hstart_F,
        hstartin=hstart_F_In,
        hstartout=hstart_F_Out,
        Kfnom=Kfnom,
        Cfnom=Cfnom)           annotation (extent=[-10,-60; 10,-40]);
      Thermal.ConvHT convHT(               N=N_F,
        Tstart11=Tstart_M_In,
        Tstart1N=Tstart_M_Out,
        Tstart21=Tstart_F_In,
        Tstart2N=Tstart_F_Out,
        gamma=gamma_F,
        Tstart1=Tstart_M,
        Tstart2=Tstart_F) 
        annotation (extent=[-10,-40; 10,-20]);
      Thermal.MetalTube metalTube(
        rhomcm=rhomcm,
        lambda=lambda,
        N=N_F,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        L=exchSurface_F^2/(fluidVol*pi*4),
        rint=fluidVol*4/exchSurface_F/2,
        Tstart1=Tstart_M_In,
        TstartN=Tstart_M_Out,
        WallRes=false,
        Tstart=Tstart_M,
        rext=(metalVol + fluidVol)*4/extSurfaceTub/2) 
               annotation (extent=[-10,-6; 10,-26], rotation=0);
      Gas.Flow1D gasFlow(
        L=1,
        Dhyd=1,
        wnom=gasNomFlowRate,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
        N=N_G,
        A=gasVol/1,
        omega=exchSurface_G/1,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        redeclare package Medium = FlueGasMedium,
        QuasiStatic=gasQuasiStatic,
        Tstartin=Tstart_G_In,
        Tstartout=Tstart_G_Out,
        pstart=pstart_G,
        Tstart=Tstart_G)       annotation (extent=[-12,58; 12,38]);
      annotation (Diagram, Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
      Thermal.CounterCurrent cC(                                    N=N_F,
          counterCurrent=counterCurrent) 
        annotation (extent=[-10,-10; 10,10]);
      Thermal.HeatFlowDistribution heatFlowDistribution(
        N=N_F,
        A1=exchSurface_G,
        A2=extSurfaceTub) 
        annotation (extent=[-10,4; 10,24]);
      Thermal.ConvHT2N convHT2N(
        N1=N_G,
        N2=N_F,
        Tstart11=Tstart_G_In,
        Tstart1N=Tstart_G_Out,
        Tstart21=Tstart_M_In,
        Tstart2N=Tstart_M_Out,
        gamma=gamma_G,
        Tstart1=Tstart_G,
        Tstart2=Tstart_M)    annotation (extent=[-10,20; 10,40]);
      
    equation 
      connect(fluidFlow.wall, convHT.side2) 
                                         annotation (points=[0,-45; 0,-33.1],
          style(color=45, rgbcolor={255,127,0}));
      connect(gasFlow.infl, gasIn) annotation (points=[-12,48; -100,48; -100,
            0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(gasFlow.outfl, gasOut) annotation (points=[12,48; 100,48; 100,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(fluidFlow.outfl, waterOut) 
                                      annotation (points=[10,-50; 40,-50; 40,
            -100; 0,-100],
                         style(thickness=2));
      connect(fluidFlow.infl, waterIn) 
                                    annotation (points=[-10,-50; -40,-50; -40,
            100; 0,100],
                       style(thickness=2));
      connect(heatFlowDistribution.side2, cC.side1) annotation (points=[0,10.9;
            0,3],           style(
          color=45,
          rgbcolor={255,127,0},
          fillPattern=1));
      connect(convHT2N.side1, gasFlow.wall) annotation (points=[0,33; 0,43],
          style(color=45, rgbcolor={255,127,0}));
      connect(heatFlowDistribution.side1, convHT2N.side2) annotation (points=[0,17; 0,
            26.9],          style(color=45, rgbcolor={255,127,0}));
      connect(metalTube.int, convHT.side1) annotation (points=[0,-19; 0,-27],
          style(color=45, rgbcolor={255,127,0}));
      connect(metalTube.ext, cC.side2) annotation (points=[0,-12.9; 0,-3.1],
          style(color=45, rgbcolor={255,127,0}));
    end HE;
    
    model HE2ph "Heat Exchanger fluid - gas (fluid 2-phase)" 
      extends ThermoPower.Examples.RankineCycle.HEInterface(
                            pstartout_F=
            fluidNomPressure - dpnom);
      
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_G 
        "Constant heat transfer coefficient in the gas side";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_F 
        "Constant heat transfer coefficient in the fluid side";
      parameter Choices.Flow1D.FFtypes.Temp FFtype_F=ThermoPower.Choices.Flow1D.FFtypes.NoFriction 
        "Friction Factor Type, fluid side";
      parameter Real Kfnom=0 "Nominal hydraulic resistance coefficient";
      parameter Real Cfnom=0 "Nominal Fanning friction factor";
      parameter Choices.Flow1D.HCtypes.Temp HCtype_F=ThermoPower.Choices.Flow1D.HCtypes.Downstream 
        "Location of the hydraulic capacitance, fluid side";
      parameter Boolean counterCurrent=true "Counter-current flow";
      parameter Modelica.SIunits.Pressure dpnom=0 
        "Nominal pressure drop fluid side (friction term only!)";
      parameter Modelica.SIunits.Density rhonom=0 
        "Nominal inlet density fluid side";
      parameter Boolean gasQuasiStatic=false 
        "Quasi-static model of the flue gas (mass, energy and momentum static balances";
      constant Real pi=Modelica.Constants.pi;
      
    Water.Flow1D2ph fluidFlow(
        Nt=1,
        N=N_F,
        wnom=fluidNomFlowRate,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        redeclare package Medium = FluidMedium,
        L=exchSurface_F^2/(fluidVol*pi*4),
        A=(1/exchSurface_F*fluidVol*4)^2/4*pi,
        omega=1/exchSurface_F*fluidVol*4*pi,
        Dhyd=1/exchSurface_F*fluidVol*4,
        pstartin=pstartin_F,
        pstartout=pstartout_F,
        FFtype=FFtype_F,
        dpnom=dpnom,
        rhonom=rhonom,
        HydraulicCapacitance=HCtype_F,
        hstart=hstart_F,
        hstartin=hstart_F_In,
        hstartout=hstart_F_Out,
        Kfnom=Kfnom,
        Cfnom=Cfnom)           annotation (extent=[-10,-58; 10,-38]);
      Thermal.ConvHT convHT(gamma=gamma_F, N=N_F,
        Tstart11=Tstart_M_In,
        Tstart1N=Tstart_M_Out,
        Tstart21=Tstart_F_In,
        Tstart2N=Tstart_F_Out,
        Tstart1=Tstart_M,
        Tstart2=Tstart_F) 
        annotation (extent=[-10,-40; 10,-20]);
      Thermal.MetalTube metalTube(
        rhomcm=rhomcm,
        lambda=lambda,
        N=N_F,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        L=exchSurface_F^2/(fluidVol*pi*4),
        rint=1/exchSurface_F*fluidVol*4/2,
        Tstart1=Tstart_M_In,
        TstartN=Tstart_M_Out,
        WallRes=false,
        Tstart=Tstart_M,
        rext=1/extSurfaceTub*(metalVol + fluidVol)*4/2) 
               annotation (extent=[-10,-8; 10,-28]);
      Gas.Flow1D gasFlow(
        L=1,
        Dhyd=1,
        wnom=gasNomFlowRate,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
        N=N_G,
        A=gasVol/1,
        omega=exchSurface_G/1,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit,
        redeclare package Medium = FlueGasMedium,
        pstart=pstart_G,
        Tstartin=Tstart_G_In,
        Tstartout=Tstart_G_Out,
        Tstart=Tstart_G,
        QuasiStatic=gasQuasiStatic) 
                               annotation (extent=[-12,58; 12,38]);
      annotation (Diagram, Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
      Thermal.CounterCurrent cC(     counterCurrent=counterCurrent, N=N_F) 
        annotation (extent=[-10,-10; 10,10]);
      Thermal.HeatFlowDistribution heatFlowDistribution(
        N=N_F,
        A1=exchSurface_G,
        A2=extSurfaceTub) 
        annotation (extent=[-10,6; 10,26]);
      Thermal.ConvHT2N convHT2N(
        N1=N_G,
        N2=N_F,
        Tstart11=Tstart_G_In,
        Tstart1N=Tstart_G_Out,
        Tstart21=Tstart_M_In,
        Tstart2N=Tstart_M_Out,
        gamma=gamma_G,
        Tstart1=Tstart_G,
        Tstart2=Tstart_M)    annotation (extent=[-10,22; 10,42]);
    equation 
      connect(fluidFlow.wall, convHT.side2) 
                                         annotation (points=[0,-43; 0,-33.1],
          style(color=45, rgbcolor={255,127,0}));
      connect(gasFlow.infl, gasIn) annotation (points=[-12,48; -100,48; -100,
            0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(gasFlow.outfl, gasOut) annotation (points=[12,48; 100,48; 100,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(fluidFlow.outfl, waterOut) 
                                      annotation (points=[10,-48; 40,-48; 40,
            -100; 0,-100],
                         style(thickness=2));
      connect(fluidFlow.infl, waterIn) 
                                    annotation (points=[-10,-48; -40,-48; -40,
            100; 0,100],
                       style(thickness=2));
      connect(heatFlowDistribution.side2,cC. side1) annotation (points=[0,12.9;
            0,3],           style(
          color=45,
          rgbcolor={255,127,0},
          fillPattern=1));
      connect(convHT2N.side1,gasFlow. wall) annotation (points=[0,35; 0,43],
          style(color=45, rgbcolor={255,127,0}));
      connect(convHT2N.side2, heatFlowDistribution.side1) annotation (points=[0,28.9;
            0,19],          style(color=45, rgbcolor={255,127,0}));
      connect(metalTube.int, convHT.side1) annotation (points=[0,-21; 0,-27],
          style(color=45, rgbcolor={255,127,0}));
      connect(metalTube.ext, cC.side2) annotation (points=[0,-14.9; 0,-3.1],
          style(color=45, rgbcolor={255,127,0}));
    end HE2ph;
    
    model Boiler 
      replaceable package FlueGasMedium = ThermoPower.Media.FlueGas extends 
        Modelica.Media.Interfaces.PartialMedium "Flue gas model";
      replaceable package FluidMedium = ThermoPower.Water.StandardWater extends 
        Modelica.Media.Interfaces.PartialPureSubstance "Fluid model";
      parameter Boolean SSInit = false "Steady-state initialization";
      annotation (
        Diagram,
        Coordsys(extent=[-200,-100; 200,100], scale=0.1),
        Icon(
          Rectangle(extent=[-200,100; 200,-100], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=30,
              rgbfillColor={230,230,230})),
          Line(points=[160,40; 158,46; 154,54; 148,58; 140,60; 132,58; 126,54;
                122,48; 120,40],       style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[120,40; 120,-40], style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[40,-40; 38,-48; 34,-54; 28,-58; 20,-60; 12,-58; 6,-54; 2,
                -48; 0,-40],          style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[0,-40; 0,40],   style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[0,40; -2,46; -6,54; -12,58; -20,60; -28,58; -34,54; -38,
                48; -40,40],
                        style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[-40,40; -40,-40],
                                       style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[-40,-40; -42,-48; -46,-54; -52,-58; -60,-60; -68,-58;
                -74,-54; -78,-48; -80,-40],
                             style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[-80,-40; -80,40],
                                     style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[160,40; 160,-100],   style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[-80,40; -82,46; -86,54; -92,58; -100,60; -108,58; -114,
                54; -118,48; -120,40],
                             style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[-120,40; -120,-40],
                                         style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[-120,-40; -122,-48; -126,-54; -132,-58; -140,-60; -148,
                -58; -154,-54; -158,-48; -160,-40],
                                            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[-160,-40; -160,100],
                                          style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[80,-40; 80,40], style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[80,40; 78,46; 74,54; 68,58; 60,60; 52,58; 46,54; 42,48;
                40,40], style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[40,40; 40,-40], style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Line(points=[120,-40; 118,-48; 114,-54; 108,-58; 100,-60; 92,-58; 86,
                -54; 82,-48; 80,-40], style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2))),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This is a simple model of the boiler containting superheater, evaporator and economizer.
</html>"));
      Water.FlangeA waterIn(redeclare package Medium = FluidMedium) 
        annotation (extent=[140,-120; 180,-80]);
      Water.FlangeB waterOut(redeclare package Medium = FluidMedium) 
        annotation (extent=[-180,80; -140,120]);
      PowerPlants.HRSG.Components.HE economizer(
        redeclare package FluidMedium = FluidMedium,
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
        fluidFlow(FFtype=ThermoPower.Choices.Flow1D.FFtypes.Kfnom, Kfnom=150),
        gasNomFlowRate=500,
        gasNomPressure=101325,
        fluidNomFlowRate=55,
        fluidNomPressure=30e5,
        gamma_G=30,
        gamma_F=3000,
        Tstart_G_In=500,
        Tstart_G_Out=417,
        Tstart_M_In=307,
        Tstart_M_Out=488,
        Tstart_F_In=307,
        Tstart_F_Out=488,
        SSInit=SSInit) 
        annotation (extent=[100,20; 140,-20]);
      PowerPlants.HRSG.Components.HE2ph evaporator(
        redeclare package FluidMedium = FluidMedium,
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
        fluidFlow(FFtype=ThermoPower.Choices.Flow1D.FFtypes.Kfnom, Kfnom=150),
        gasNomFlowRate=500,
        fluidNomFlowRate=55,
        gasNomPressure=101325,
        fluidNomPressure=30e5,
        gamma_G=85,
        gamma_F=20000,
        Tstart_G_In=700,
        Tstart_G_Out=500,
        Tstart_M_In=488,
        Tstart_M_Out=513,
        Tstart_F_In=488,
        Tstart_F_Out=513,
        SSInit=SSInit) 
        annotation (extent=[-20,20; 20,-20]);
      PowerPlants.HRSG.Components.HE superheater(
        redeclare package FluidMedium = FluidMedium,
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
        gasNomPressure=101325,
        fluidFlow(FFtype=ThermoPower.Choices.Flow1D.FFtypes.Kfnom, Kfnom=150),
        gasNomFlowRate=500,
        gamma_G=90,
        gamma_F=6000,
        fluidNomFlowRate=55,
        fluidNomPressure=30e5,
        Tstart_G_In=750,
        Tstart_G_Out=700,
        Tstart_M_In=513,
        Tstart_M_Out=690,
        Tstart_F_In=513,
        Tstart_F_Out=690,
        SSInit=SSInit) 
        annotation (extent=[-140,20; -100,-20]);
      PowerPlants.HRSG.Components.StateReader_gas stateGasInlet(redeclare 
          package Medium = FlueGasMedium) 
        annotation (extent=[-170,-10; -150,10]);
      PowerPlants.HRSG.Components.StateReader_gas stateGasInletEvaporator(
          redeclare package Medium = FlueGasMedium) 
        annotation (extent=[-70,-10; -50,10]);
      PowerPlants.HRSG.Components.StateReader_gas stateGasInletEconomizer(
          redeclare package Medium = FlueGasMedium) 
        annotation (extent=[50,-10; 70,10]);
      PowerPlants.HRSG.Components.StateReader_gas stateGasOutlet(redeclare 
          package Medium = FlueGasMedium) 
        annotation (extent=[150,-10; 170,10]);
      PowerPlants.HRSG.Components.StateReader_water stateWaterSuperheater_in(
          redeclare package Medium = FluidMedium) 
        annotation (extent=[-130,-50; -110,-30],
                                           rotation=90);
      PowerPlants.HRSG.Components.StateReader_water stateWaterSuperheater_out(
          redeclare package Medium = FluidMedium) 
        annotation (extent=[-130,40; -110,60],
                                           rotation=90);
      PowerPlants.HRSG.Components.StateReader_water stateWaterEvaporator_in(
          redeclare package Medium = FluidMedium) 
        annotation (extent=[-10,-50; 10,-30],
                                           rotation=90);
      PowerPlants.HRSG.Components.StateReader_water stateWaterEconomizer_in(
          redeclare package Medium = FluidMedium) 
        annotation (extent=[110,-50; 130,-30],
                                           rotation=90);
      Gas.SourceW sourceW_gas(
        redeclare package Medium = FlueGasMedium,
        T=750,
        w0=500)            annotation (extent=[-198,-10; -178,10]);
      Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=400) 
                       annotation (extent=[178,-10; 198,10]);
      Modelica.Blocks.Interfaces.RealInput gasTemperature 
        annotation (extent=[-210,-70; -190,-50]);
      Modelica.Blocks.Interfaces.RealInput gasFlowRate 
        annotation (extent=[-210,50; -190,70]);
    equation 
      connect(economizer.waterIn, stateWaterEconomizer_in.outlet) annotation (
          points=[120,-20; 120,-34],
                                   style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(evaporator.waterIn, stateWaterEvaporator_in.outlet) annotation (
          points=[0,-20; 0,-34; 3.67382e-016,-34],
                                                 style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(superheater.waterIn, stateWaterSuperheater_in.outlet) annotation (
         points=[-120,-20; -120,-34],
                                    style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(stateWaterSuperheater_out.inlet, superheater.waterOut) 
        annotation (points=[-120,44; -120,20],   style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(stateGasInlet.outlet, superheater.gasIn) annotation (points=[-154,
            0; -140,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(superheater.gasOut, stateGasInletEvaporator.inlet) annotation (
          points=[-100,0; -66,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(stateGasInletEvaporator.outlet, evaporator.gasIn) annotation (
          points=[-54,0; -20,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(evaporator.gasOut, stateGasInletEconomizer.inlet) annotation (
          points=[20,0; 54,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(stateGasInletEconomizer.outlet, economizer.gasIn) annotation (
          points=[66,0; 100,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(economizer.gasOut, stateGasOutlet.inlet) annotation (points=[140,
            0; 154,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(stateGasInlet.inlet, sourceW_gas.flange) annotation (points=[-166,
            0; -178,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(sinkP_gas.flange, stateGasOutlet.outlet) annotation (points=[178,
            0; 166,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(waterIn, stateWaterEconomizer_in.inlet) 
        annotation (points=[160,-100; 160,-70; 120,-70; 120,-46],
                                               style(thickness=2));
      connect(stateWaterSuperheater_out.outlet, waterOut) 
        annotation (points=[-120,56; -120,70; -160,70; -160,100],
                                                style(thickness=2));
      connect(evaporator.waterOut, stateWaterSuperheater_in.inlet) annotation (
          points=[0,20; 0,40; -40,40; -40,-70; -120,-70; -120,-46], style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(economizer.waterOut, stateWaterEvaporator_in.inlet) annotation (
          points=[120,20; 120,40; 80,40; 80,-70; 0,-70; 0,-46; -3.67382e-016,
            -46],               style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(sourceW_gas.in_T, gasTemperature) annotation (points=[-188,5;
            -188,16; -174,16; -174,-60; -200,-60], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(sourceW_gas.in_w0, gasFlowRate) annotation (points=[-194,5; -194,
            20; -180,20; -180,60; -200,60], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
    end Boiler;
    
    model Turbine 
      replaceable package FluidMedium = ThermoPower.Water.StandardWater extends 
        Modelica.Media.Interfaces.PartialPureSubstance "Fluid model";
      parameter Boolean SSInit = false "Steady-state initialization";
      annotation (Diagram,
        experiment(StopTime=50),
        Coordsys(extent=[-160,-160; 160,160], scale=0.1),
        Icon(
          Rectangle(extent=[-160,160; 160,-160], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=30,
              rgbfillColor={230,230,230})),
          Rectangle(extent=[-76,10; 104,-10], style(
              color=0,
              rgbcolor={0,0,0},
              gradient=2,
              fillColor=10,
              rgbfillColor={95,95,95})),
          Ellipse(extent=[60,40; 140,-40], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})),
          Line(points=[80,0; 84,6; 88,8; 92,8; 96,6; 100,0; 104,-4; 108,-6; 112,
                -6; 116,-4; 120,0], style(
              color=0,
              rgbcolor={0,0,0},
              fillPattern=1)),
          Polygon(points=[-102,160; -98,160; -98,14; -102,14; -102,160], style(
              color=0,
              rgbcolor={0,0,0},
              gradient=2,
              fillColor=3,
              rgbfillColor={0,0,255})),
          Polygon(points=[-2,-56; 2,-56; 2,-156; -2,-156; -2,-56], style(
              color=0,
              rgbcolor={0,0,0},
              gradient=2,
              fillColor=3,
              rgbfillColor={0,0,255})),
          Polygon(points=[-102,30; -102,-30; 2,-100; 2,100; -102,30], style(
              color=0,
              rgbcolor={0,0,0},
              fillPattern=1))),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This model contains the turbine, generator and network models. The network model is based on swing equation.
</html>"));
      PowerPlants.HRSG.Components.StateReader_water stateInletTurbine(
          redeclare package Medium = FluidMedium) 
        annotation (extent=[-110,90; -90,110],
                                           rotation=270);
      PowerPlants.HRSG.Components.StateReader_water stateOutletTurbine(
          redeclare package Medium = FluidMedium) 
        annotation (extent=[-10,-90; 10,-70],rotation=270);
      Electrical.Generator generator(J=10000, initOpt=if SSInit then Choices.Init.Options.steadyState else 
                  Choices.Init.Options.noInit) 
                                     annotation (extent=[38,-20; 78,20]);
      Electrical.NetworkGrid_Pmax network(
        J=10000,
        Pmax=100e6,
        deltaStart=0.4,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit) 
        annotation (extent=[100,-14; 128,14]);
      Water.SteamTurbineStodola steamTurbine(
        pstart_in=30e5,
        pstart_out=0.5e5,
        wstart=55,
        wnom=55,
        hstartin=3.33e6,
        hstartout=2.67e6,
        Kt=0.0104) 
        annotation (extent=[-80,-30; -20,30], style(thickness=2));
      Water.FlangeB waterOut(redeclare package Medium = FluidMedium) 
        annotation (extent=[-20,-180; 20,-140]);
      Water.FlangeA waterIn(redeclare package Medium = FluidMedium) 
        annotation (extent=[-120,140; -80,180]);
      Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor 
        annotation (extent=[8,-10; 28,10]);
      Modelica.Blocks.Interfaces.RealOutput generatedPower 
        annotation (extent=[150,60; 190,100]);
    equation 
      connect(stateInletTurbine.inlet, waterIn) 
                                        annotation (points=[-100,106; -100,160],
          style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(waterOut, stateOutletTurbine.outlet) 
                                           annotation (points=[0,-160; 0,-86; 
            -1.10215e-015,-86],        style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(steamTurbine.outlet, stateOutletTurbine.inlet) 
                                                            annotation (points=[-26,24; 
            1.10215e-015,24; 1.10215e-015,-74],          style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(network.powerConnection, generator.powerConnection) 
        annotation (points=[100,2.02505e-015; 80,2.02505e-015; 80,3.55271e-016; 
            75.2,3.55271e-016], style(pattern=0, thickness=2));
      connect(stateInletTurbine.outlet, steamTurbine.inlet) 
        annotation (points=[-100,94; -100,24; -74,24],  style(thickness=2));
      connect(generator.shaft, powerSensor.flange_b) annotation (points=[40.8,
            3.55271e-016; 30,3.55271e-016; 30,0; 28,0], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(powerSensor.flange_a, steamTurbine.shaft_b) annotation (points=[8,
            0; -30.8,0], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(powerSensor.power, generatedPower) annotation (points=[10,-11; 10,
            -60; 140,-60; 140,80; 170,80], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
    end Turbine;
    
    model PrescribedSpeedPump "Prescribed speed pump" 
      replaceable package FluidMedium = 
          Modelica.Media.Interfaces.PartialTwoPhaseMedium;
      parameter Modelica.SIunits.VolumeFlowRate q_nom[3] 
        "Nominal volume flow rates";
      parameter Modelica.SIunits.Height head_nom[3] "Nominal heads";
      parameter Modelica.SIunits.Density rho_nom "Nominal density";
      parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm n0 
        "Nominal rpm";
      parameter Modelica.SIunits.Pressure nominalSteamPressure 
        "Nominal live steam pressure";
      parameter Modelica.SIunits.Pressure nominalCondensationPressure 
        "Nominal condensation pressure";
      parameter Modelica.SIunits.MassFlowRate nominalSteamFlow 
        "Nominal steam mass flow rate";
      parameter Modelica.SIunits.SpecificEnthalpy hstart 
        "Fluid Specific Enthalpy Start Value";
      parameter Boolean SSInit = false "Steady-state initialization";
      
      function flowCharacteristic = 
          ThermoPower.Functions.PumpCharacteristics.quadraticFlow (
            q_nom = q_nom, head_nom = head_nom);
      
      annotation (Icon(
          Rectangle(extent=[-100,100; 100,-100], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=30,
              rgbfillColor={230,230,230})),
          Text(
            extent=[-100,-118; 100,-144],
            style(color=3, rgbcolor={0,0,255}),
            string="%name"),
          Ellipse(extent=[-62,62; 58,-58],   style(gradient=3)),
          Polygon(points=[-32,34; -32,-26; 46,2; -32,34],     style(
              pattern=0,
              gradient=2,
              fillColor=7))), Diagram,
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
      ThermoPower.Water.FlangeA inlet(redeclare package Medium = FluidMedium) 
        annotation (extent=[-120,-20; -80,20]);
      ThermoPower.Water.FlangeB outlet(redeclare package Medium = FluidMedium) 
        annotation (extent=[80,-20; 120,20]);
      Water.Pump feedWaterPump(
        redeclare function flowCharacteristic = flowCharacteristic,
        pin_start=nominalCondensationPressure,
        pout_start=nominalSteamPressure,
        wstart=nominalSteamFlow,
        n0=n0,
        hstart=hstart,
        redeclare package Medium = FluidMedium,
        initOpt=if SSInit then Choices.Init.Options.steadyState else Choices.Init.Options.noInit) 
        annotation (extent=[-40,-24; 0,16]);
      Modelica.Blocks.Sources.Constant nPump(k=n0) 
        annotation (extent=[-60,60; -80,40], rotation=180);
      PowerPlants.HRSG.Components.StateReader_water stateInlet(redeclare 
          package Medium = FluidMedium) 
        annotation (extent=[-70,-10; -50,10],
                                           rotation=0);
      PowerPlants.HRSG.Components.StateReader_water stateOutlet(redeclare 
          package Medium = FluidMedium) 
        annotation (extent=[20,0; 40,20],  rotation=0);
    equation 
      connect(nPump.y, feedWaterPump.in_n) annotation (points=[-59,50; -25.2,50;
            -25.2,12], style(
          color=74,
          rgbcolor={0,0,127},
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(feedWaterPump.infl, stateInlet.outlet) annotation (points=[-36,0;
            -54,0], style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(stateInlet.inlet, inlet) annotation (points=[-66,0; -100,0],
          style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(stateOutlet.inlet, feedWaterPump.outfl) annotation (points=[24,10;
            -8,10], style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(stateOutlet.outlet, outlet) annotation (points=[36,10; 60,10; 60,
            0; 100,0], style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
    end PrescribedSpeedPump;
    
    model PrescribedPressureCondenser 
      "Ideal condenser with prescribed pressure" 
      replaceable package Medium = Water.StandardWater extends 
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
      Modelica.SIunits.Mass M "Total mass, steam+liquid";
      Modelica.SIunits.Mass Ml "Liquid mass";
      Modelica.SIunits.Mass Mv "Steam mass";
      Modelica.SIunits.Volume Vl(start=Vlstart) "Liquid volume";
      Modelica.SIunits.Volume Vv "Steam volume";
      Modelica.SIunits.Energy E "Internal energy";
      Modelica.SIunits.Power Q "Thermal power";
      
      //Connectors
      Water.FlangeA steamIn( redeclare package Medium = Medium) 
                     annotation (extent=[-20,80; 20,120]);
      Water.FlangeB waterOut( redeclare package Medium = Medium) annotation (extent=[-20,-120;
            20,-80]);
      annotation (
        Icon(
          Ellipse(extent=[-90,100; 90,-80], style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2,
              fillColor=7,
              rgbfillColor={255,255,255})),
          Line(points=[44,-40; -50,-40; 8,10; -50,60; 44,60],    style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Rectangle(extent=[-48,-66; 48,-100], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=3,
              rgbfillColor={0,0,255}))),
        Diagram,
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
      
    equation 
      steamIn.p = p;
      steamIn.hAB = hl;
      sat.psat = p;
      sat.Tsat = Medium.saturationTemperature(p);
      hl = Medium.bubbleEnthalpy(sat);
      waterOut.p = p;
      waterOut.hBA = hl;
      rhol = Medium.bubbleDensity(sat);
      rhov = Medium.density_ph(steamIn.p,steamIn.hBA);
      
      Ml = Vl*rhol;
      Mv = Vv*rhov;
      Vtot= Vv+Vl;
      M = Ml + Mv;
      E = Ml*hl + Mv*steamIn.hBA - p*Vtot;
      
      //Energy and Mass Bilances 
      der(M) = steamIn.w + waterOut.w;
      der(E) = steamIn.w*steamIn.hBA + waterOut.w*hl - Q;
      
    end PrescribedPressureCondenser;
    
    model SettingStodolaTurbine 
      
      package FluidMedium = ThermoPower.Water.StandardWater;
      //fluid
      parameter Modelica.SIunits.MassFlowRate fluidNomFlowRate=55 
        "Nominal flow rate through the fluid side";
      parameter Modelica.SIunits.Pressure fluidNomPressure=30e5 
        "Nominal pressure in the fluid side inlet";
      parameter Modelica.SIunits.Temperature Tstart_M_In=Tstart_F_In 
        "Inlet metal wall temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_M_Out=Tstart_F_Out 
        "Outlet metal wall temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_F_In=719 
        "Inlet fluid temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_F_Out=
          FluidMedium.temperature_ph(fluidNomPressure, hstart_F_Out) 
        "Outlet fluid temperature start value";
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_In=
          FluidMedium.specificEnthalpy_pT(fluidNomPressure, Tstart_F_In) 
        "Nominal specific enthalpy";
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_Out=2.67e6 
        "Nominal specific enthalpy";
      Modelica.Mechanics.Rotational.ConstantSpeed constantSpeed(w_fixed=
            314.16/2) 
                    annotation (extent=[70,-20; 50,0]);
      annotation (Diagram, Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
      Water.SteamTurbineStodola steamTurbineStodola(
        pstart_in=30e5,
        pstart_out=0.5e5,
        wstart=55,
        wnom=55,
        hstartin=3.33e6,
        hstartout=2.67e6,
        Kt=0.0104) 
        annotation (extent=[-40,-40; 20,20], style(thickness=2));
      Water.SourceP sourseW_water(redeclare package Medium = FluidMedium,
        h=hstart_F_In,
        p0=30e5)            annotation (extent=[-80,60; -60,80],rotation=0);
      Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
        h=hstart_F_Out,
        p0=5390)        annotation (extent=[40,60; 60,80],    rotation=0);
    equation 
      connect(constantSpeed.flange, steamTurbineStodola.shaft_b) annotation (
          points=[50,-10; 9.2,-10], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(sinkP_water.flange, steamTurbineStodola.outlet) annotation (
          points=[40,70; 14,70; 14,14], style(
          thickness=2,
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(steamTurbineStodola.inlet, sourseW_water.flange) annotation (
          points=[-34,14; -34,70; -60,70], style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
    end SettingStodolaTurbine;
    
    model SettingEc 
      package FlueGasMedium = ThermoPower.Media.FlueGas;
      package FluidMedium = ThermoPower.Water.StandardWater;
      
      //gas
      parameter Modelica.SIunits.MassFlowRate gasNomFlowRate=500 
        "Nominal mass flowrate";
      parameter Modelica.SIunits.Temperature Tstart_G_In=500 
        "Inlet gas temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_G_Out=372.35 
        "Outlet gas temperature start value";
      
      //fluid
      parameter Modelica.SIunits.MassFlowRate fluidNomFlowRate=55 
        "Nominal flow rate through the fluid side";
      parameter Modelica.SIunits.Pressure fluidNomPressure=30e5 
        "Nominal pressure in the fluid side inlet";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_G=30 
        "Constant heat transfer coefficient in the gas side";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_F=3000 
        "Constant heat transfer coefficient in the fluid side";
      parameter Modelica.SIunits.Temperature Tstart_M_In=Tstart_F_In 
        "Inlet metal wall temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_M_Out=428.09 
        "Outlet metal wall temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_F_In=FluidMedium.temperature_ph(fluidNomPressure, hstart_F_In) 
        "Inlet fluid temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_F_Out=428.09 
        "Outlet fluid temperature start value";
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_In=1.48e5 
        "Nominal specific enthalpy";
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_Out=
          FluidMedium.specificEnthalpy_pT(fluidNomPressure, Tstart_F_Out) 
        "Nominal specific enthalpy";
      parameter Boolean SSInit = true "Steady-state initialization";
      
      Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
        w0=fluidNomFlowRate,
        p0=fluidNomPressure,
        h=hstart_F_In)      annotation (extent=[-10,60; 10,80], rotation=270);
      Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
        p0=fluidNomPressure,
        h=hstart_F_Out) annotation (extent=[-10,-80; 10,-60], rotation=270);
      Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out) 
                       annotation (extent=[60,-10; 80,10]);
      Gas.SourceW sourceW_gas(
        redeclare package Medium = FlueGasMedium,
        w0=gasNomFlowRate,
        T=Tstart_G_In)     annotation (extent=[-80,-10; -60,10]);
      annotation (Diagram, experiment(StopTime=1000),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
      PowerPlants.HRSG.Components.HE economizer(
        redeclare package FluidMedium = FluidMedium,
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
        fluidNomFlowRate=fluidNomFlowRate,
        fluidNomPressure=fluidNomPressure,
        Tstart_G_In=Tstart_G_In,
        Tstart_G_Out=Tstart_G_Out,
        Tstart_M_In=Tstart_M_In,
        Tstart_M_Out=Tstart_M_Out,
        Tstart_F_In=Tstart_F_In,
        Tstart_F_Out=Tstart_F_Out,
        gamma_G=gamma_G,
        gamma_F=gamma_F,
        SSInit=SSInit,
        fluidFlow(FFtype=ThermoPower.Choices.Flow1D.FFtypes.Kfnom, Kfnom=150),
        gasNomFlowRate=500,
        gasNomPressure=101325) 
        annotation (extent=[-20,-20; 20,20]);
      PowerPlants.HRSG.Components.StateReader_water T_waterIn(
                            redeclare package Medium = FluidMedium) 
        annotation (extent=[-10,30; 10,50],rotation=270);
      PowerPlants.HRSG.Components.StateReader_water T_waterOut(
                             redeclare package Medium = FluidMedium) 
        annotation (extent=[-10,-50; 10,-30],rotation=270);
      PowerPlants.HRSG.Components.StateReader_gas T_gasIn(
                        redeclare package Medium = FlueGasMedium) 
        annotation (extent=[-50,-10; -30,10]);
      PowerPlants.HRSG.Components.StateReader_gas T_gasOut(
                         redeclare package Medium = FlueGasMedium) 
        annotation (extent=[30,-10; 50,10]);
    equation 
      connect(T_waterOut.inlet, economizer.waterOut) 
                                             annotation (points=[1.10215e-015,
            -34; 0,-34; 0,-20], style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(economizer.waterIn, T_waterIn.outlet) 
                                            annotation (points=[0,20; 0,34; 
            -1.10215e-015,34], style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(T_waterIn.inlet, sourseW_water.flange) annotation (points=[
            1.10215e-015,46; -1.83691e-015,46; -1.83691e-015,60], style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(sinkP_water.flange, T_waterOut.outlet) annotation (points=[
            1.83691e-015,-60; -1.10215e-015,-60; -1.10215e-015,-46], style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(T_gasOut.inlet, economizer.gasOut) 
                                         annotation (points=[34,0; 20,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(sinkP_gas.flange, T_gasOut.outlet) annotation (points=[60,0; 46,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(economizer.gasIn, T_gasIn.outlet) 
                                        annotation (points=[-20,0; -34,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(T_gasIn.inlet, sourceW_gas.flange) annotation (points=[-46,0; -60,
            0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
    end SettingEc;
    
    model SettingSh 
      package FlueGasMedium = ThermoPower.Media.FlueGas;
      package FluidMedium = ThermoPower.Water.StandardWater;
      
      //gas
      parameter Modelica.SIunits.MassFlowRate gasNomFlowRate=500 
        "Nominal mass flowrate";
      parameter Modelica.SIunits.Temperature Tstart_G_In=785 
        "Inlet gas temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_G_Out=700 
        "Outlet gas temperature start value";
      
      //fluid
      parameter Modelica.SIunits.MassFlowRate fluidNomFlowRate=55 
        "Nominal flow rate through the fluid side";
      parameter Modelica.SIunits.Pressure fluidNomPressure=30e5 
        "Nominal pressure in the fluid side inlet";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_G=80 
        "Constant heat transfer coefficient in the gas side";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_F=5000 
        "Constant heat transfer coefficient in the fluid side";
      parameter Modelica.SIunits.Temperature Tstart_M_In=Tstart_F_In 
        "Inlet metal wall temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_M_Out=Tstart_F_Out 
        "Outlet metal wall temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_F_In=513 
        "Inlet fluid temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_F_Out=700 
        "Outlet fluid temperature start value";
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_In=
          FluidMedium.specificEnthalpy_pT(fluidNomPressure, Tstart_F_In) 
        "Nominal specific enthalpy";
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_Out=
          FluidMedium.specificEnthalpy_pT(fluidNomPressure, Tstart_F_Out) 
        "Nominal specific enthalpy";
      
      Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
        w0=fluidNomFlowRate,
        p0=fluidNomPressure,
        h=hstart_F_In)      annotation (extent=[-10,60; 10,80], rotation=270);
      Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
        h=hstart_F_Out,
        p0=fluidNomPressure - 0.4e5) 
                        annotation (extent=[-10,-80; 10,-60], rotation=270);
      Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out) 
                       annotation (extent=[60,-10; 80,10]);
      Gas.SourceW sourceW_gas(
        redeclare package Medium = FlueGasMedium,
        w0=gasNomFlowRate,
        T=Tstart_G_In)     annotation (extent=[-80,-10; -60,10]);
      annotation (Diagram, Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
      PowerPlants.HRSG.Components.StateReader_water T_waterOut(
                             redeclare package Medium = FluidMedium) 
        annotation (extent=[-10,-50; 10,-30],rotation=270);
      PowerPlants.HRSG.Components.StateReader_gas T_gasIn(
                        redeclare package Medium = FlueGasMedium) 
        annotation (extent=[-50,-10; -30,10]);
      PowerPlants.HRSG.Components.StateReader_gas T_gasOut(
                         redeclare package Medium = FlueGasMedium) 
        annotation (extent=[30,-10; 50,10]);
      PowerPlants.HRSG.Components.HE superheater(
        redeclare package FluidMedium = FluidMedium,
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
        fluidNomFlowRate=fluidNomFlowRate,
        fluidNomPressure=fluidNomPressure,
        Tstart_G_In=Tstart_G_In,
        Tstart_G_Out=Tstart_G_Out,
        Tstart_M_In=Tstart_M_In,
        Tstart_M_Out=Tstart_M_Out,
        Tstart_F_In=Tstart_F_In,
        Tstart_F_Out=Tstart_F_Out,
        gamma_G=gamma_G,
        gamma_F=gamma_F,
        SSInit=true,
        dpnom=1e5,
        gasNomPressure=101325,
        fluidFlow(FFtype=ThermoPower.Choices.Flow1D.FFtypes.Kfnom, Kfnom=150)) 
        annotation (extent=[-20,-20; 20,20]);
      PowerPlants.HRSG.Components.StateReader_water T_waterIn(
                            redeclare package Medium = FluidMedium) 
        annotation (extent=[-10,30; 10,50],rotation=270);
    equation 
      connect(sinkP_gas.flange, T_gasOut.outlet) annotation (points=[60,0; 46,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(T_gasIn.inlet, sourceW_gas.flange) annotation (points=[-46,0; -60,
            0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(sinkP_water.flange, T_waterOut.outlet) annotation (points=[
            1.83691e-015,-60; -1.10215e-015,-60; -1.10215e-015,-46],
                                                               style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(superheater.gasIn, T_gasIn.outlet) 
                                        annotation (points=[-20,0; -34,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(superheater.gasOut, T_gasOut.inlet) 
                                         annotation (points=[20,0; 34,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(superheater.waterOut, T_waterOut.inlet) 
                                             annotation (points=[0,-20; 0,-34; 
            1.10215e-015,-34],      style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(T_waterIn.inlet, sourseW_water.flange) annotation (points=[
            1.10215e-015,46; 0,54; -7.3476e-016,56; -1.83691e-015,56; 
            -1.83691e-015,60],           style(thickness=2));
      connect(superheater.waterIn, T_waterIn.outlet) 
                                            annotation (points=[0,20; 0,34; 
            -1.10215e-015,34],
                             style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
    end SettingSh;
    
    model SettingEv 
      package FlueGasMedium = ThermoPower.Media.FlueGas;
      package FluidMedium = ThermoPower.Water.StandardWater;
      
      //gas
      parameter Modelica.SIunits.MassFlowRate gasNomFlowRate=500 
        "Nominal mass flowrate";
      parameter Modelica.SIunits.Temperature Tstart_G_In=700 
        "Inlet gas temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_G_Out=500 
        "Outlet gas temperature start value";
      
      //fluid
      parameter Modelica.SIunits.MassFlowRate fluidNomFlowRate=55 
        "Nominal flow rate through the fluid side";
      parameter Modelica.SIunits.Pressure fluidNomPressure=30e5 
        "Nominal pressure in the fluid side inlet";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_G=85 
        "Constant heat transfer coefficient in the gas side";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma_F=20000 
        "Constant heat transfer coefficient in the fluid side";
      parameter Modelica.SIunits.Temperature Tstart_M_In=Tstart_F_In 
        "Inlet metal wall temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_M_Out=Tstart_F_Out 
        "Outlet metal wall temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_F_In=FluidMedium.temperature_ph(
           fluidNomPressure, hstart_F_In) "Inlet fluid temperature start value";
      parameter Modelica.SIunits.Temperature Tstart_F_Out=
          FluidMedium.temperature_ph(fluidNomPressure, hstart_F_Out) 
        "Outlet fluid temperature start value";
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_In=9.2e5 
        "Nominal specific enthalpy";
      parameter Modelica.SIunits.SpecificEnthalpy hstart_F_Out=2.8e6 
        "Nominal specific enthalpy";
      
      Water.SourceW sourseW_water(redeclare package Medium = FluidMedium,
        w0=fluidNomFlowRate,
        p0=fluidNomPressure,
        h=hstart_F_In)      annotation (extent=[-10,60; 10,80], rotation=270);
      Water.SinkP sinkP_water(redeclare package Medium = FluidMedium,
        h=hstart_F_Out,
        p0=fluidNomPressure - 0.5e5) 
                        annotation (extent=[-10,-80; 10,-60], rotation=270);
      Gas.SinkP sinkP_gas(redeclare package Medium = FlueGasMedium, T=Tstart_G_Out) 
                       annotation (extent=[60,-10; 80,10]);
      Gas.SourceW sourceW_gas(
        redeclare package Medium = FlueGasMedium,
        w0=gasNomFlowRate,
        T=Tstart_G_In)     annotation (extent=[-80,-10; -60,10]);
      annotation (Diagram, Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
      PowerPlants.HRSG.Components.StateReader_water T_waterIn(
                            redeclare package Medium = FluidMedium) 
        annotation (extent=[-10,30; 10,50],rotation=270);
      PowerPlants.HRSG.Components.StateReader_water T_waterOut(
                             redeclare package Medium = FluidMedium) 
        annotation (extent=[-10,-50; 10,-30],rotation=270);
      PowerPlants.HRSG.Components.StateReader_gas T_gasIn(
                        redeclare package Medium = FlueGasMedium) 
        annotation (extent=[-50,-10; -30,10]);
      PowerPlants.HRSG.Components.StateReader_gas T_gasOut(
                         redeclare package Medium = FlueGasMedium) 
        annotation (extent=[30,-10; 50,10]);
      PowerPlants.HRSG.Components.HE2ph evaporator(
        redeclare package FluidMedium = FluidMedium,
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
        Tstart_G_In=Tstart_G_In,
        Tstart_G_Out=Tstart_G_Out,
        Tstart_M_In=Tstart_M_In,
        Tstart_M_Out=Tstart_M_Out,
        Tstart_F_In=Tstart_F_In,
        Tstart_F_Out=Tstart_F_Out,
        gamma_G=gamma_G,
        gamma_F=gamma_F,
        SSInit=true,
        fluidFlow(FFtype=ThermoPower.Choices.Flow1D.FFtypes.Kfnom, Kfnom=150)) 
        annotation (extent=[-20,-20; 20,20]);
    equation 
      connect(T_gasOut.outlet, sinkP_gas.flange) annotation (points=[46,0; 60,0],
                style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(T_gasIn.inlet, sourceW_gas.flange) annotation (points=[-46,0; -60,
            0],                                         style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(sinkP_water.flange, T_waterOut.outlet) annotation (points=[
            1.83691e-015,-60; -1.10215e-015,-60; -1.10215e-015,-46],
                                             style(thickness=2));
      connect(T_waterIn.inlet, sourseW_water.flange) annotation (points=[
            1.10215e-015,46; 1.10215e-015,54; -1.83691e-015,54; -1.83691e-015,
            60],                         style(thickness=2));
      connect(T_gasOut.inlet, evaporator.gasOut) 
                                         annotation (points=[34,0; 20,0], style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(evaporator.waterIn, T_waterIn.outlet) 
                                            annotation (points=[0,20; 0,28; 
            -1.10215e-015,28; -1.10215e-015,34],
                             style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(evaporator.gasIn, T_gasIn.outlet) 
                                        annotation (points=[-20,0; -34,0],
          style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(evaporator.waterOut, T_waterOut.inlet) 
                                             annotation (points=[0,-20; 0,-34; 
            1.10215e-015,-34],      style(
          thickness=2,
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
    end SettingEv;
    
    model Plant 
      replaceable package FlueGas = ThermoPower.Media.FlueGas extends 
        Modelica.Media.Interfaces.PartialMedium "Flue gas model";
      replaceable package Water = ThermoPower.Water.StandardWater extends 
        Modelica.Media.Interfaces.PartialPureSubstance "Fluid model";
      parameter Boolean SSInit = false "Steady-state initialization";
      annotation (Coordsys(extent=[-160,-160; 160,160], scale=0.1), Diagram,
        experiment(StopTime=5000, Tolerance=1e-006),
        Icon(Rectangle(extent=[-160,160; 160,-160], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=7,
              rgbfillColor={255,255,255})), Text(
            extent=[-100,100; 100,-100],
            style(
              color=3,
              rgbcolor={0,0,255},
              fillPattern=1),
            string="P")),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
This is a simple model of vapour plant based on Rankine cylce.
</html>"));
      ThermoPower.Examples.RankineCycle.PrescribedPressureCondenser 
        condenserPreP(            p=5390, redeclare package Medium = Water) 
                                  annotation (extent=[46,-64; 74,-36]);
      ThermoPower.Examples.RankineCycle.Boiler boiler(
        redeclare package FlueGasMedium = FlueGas,
        redeclare package FluidMedium = Water,
        SSInit=SSInit) 
                    annotation (extent=[-80,0; 0,40],     rotation=0);
      PrescribedSpeedPump prescribedSpeedPump(
        rho_nom=1000,
        n0=1500,
        nominalSteamPressure=30e5,
        nominalCondensationPressure=0.5e5,
        nominalSteamFlow=55,
        q_nom={0,0.055,0.1},
        head_nom={600,300,0},
        hstart=1.48e5,
        redeclare package FluidMedium = Water,
        SSInit=SSInit) annotation (extent=[34,-110; 14,-90]);
      Turbine turbine(redeclare package FluidMedium = Water, SSInit=SSInit) 
        annotation (extent=[40,0; 80,40]);
      Modelica.Blocks.Continuous.FirstOrder temperatureActuator(
        k=1,
        y_start=750,
        T=4,
        initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else 
            Modelica.Blocks.Types.Init.NoInit) 
        annotation (extent=[-138,-88; -122,-72]);
      Modelica.Blocks.Continuous.FirstOrder powerSensor(
        k=1,
        T=1,
        y_start=56.8e6,
        initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else 
            Modelica.Blocks.Types.Init.NoInit) 
        annotation (extent=[122,-8; 138,8], rotation=0);
      Modelica.Blocks.Interfaces.RealOutput generatedPower 
        annotation (extent=[150,-10; 170,10]);
      Modelica.Blocks.Interfaces.RealInput gasFlowRate 
        annotation (extent=[-170,70; -150,90]);
      Modelica.Blocks.Interfaces.RealInput gasTemperature 
        annotation (extent=[-170,-90; -150,-70]);
      Modelica.Blocks.Continuous.FirstOrder gasFlowActuator(
        k=1,
        T=4,
        y_start=500,
        initType=if SSInit then Modelica.Blocks.Types.Init.SteadyState else 
            Modelica.Blocks.Types.Init.NoInit) 
        annotation (extent=[-138,72; -122,88]);
    equation 
      connect(prescribedSpeedPump.outlet, boiler.waterIn) 
        annotation (points=[14,-100; -8,-100; -8,0],   style(thickness=2));
      connect(condenserPreP.steamIn, turbine.waterOut) annotation (points=[60,-36;
            60,0],      style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(turbine.waterIn, boiler.waterOut) annotation (points=[47.5,40;
            47.5,80; -72,80; -72,40],   style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(prescribedSpeedPump.inlet, condenserPreP.waterOut) annotation (
          points=[34,-100; 60,-100; 60,-64],
                                           style(
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(generatedPower, powerSensor.y) annotation (points=[160,0; 138.8,0],
          style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(powerSensor.u, turbine.generatedPower) annotation (points=[120.4,0;
            100,0; 100,30; 81.25,30],
                                    style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(gasFlowActuator.u, gasFlowRate) annotation (points=[-139.6,80;
            -160,80], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(temperatureActuator.u, gasTemperature) annotation (points=[-139.6,
            -80; -160,-80], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(temperatureActuator.y, boiler.gasTemperature) annotation (points=[-121.2,
            -80; -100,-80; -100,8; -80,8],       style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
      connect(gasFlowActuator.y, boiler.gasFlowRate) annotation (points=[-121.2,
            80; -100,80; -100,32; -80,32],
                                         style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=30,
          rgbfillColor={230,230,230},
          fillPattern=1));
    end Plant;
    
    model PID "ISA PID controller with anti-windup" 
      parameter Real Kp "Proportional gain (normalised units)";
      parameter Time Ti "Integral time";
      parameter Time Td = 0 "Derivative time";
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
      parameter Boolean steadyStateInit = false;
      
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
                    annotation (extent=[-112,-52; -88,-28]);
      annotation (Diagram, Icon(
          Rectangle(extent=[-100,100; 100,-100], style(
              color=0,
              rgbcolor={0,0,0},
              fillColor=30,
              rgbfillColor={240,240,240})),
          Text(
            extent=[-54,40; 52,-34],
            string="PID",
            style(color=0, rgbcolor={0,0,0})),
          Text(
            extent=[-110,-108; 110,-142],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="%name")),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
      Modelica.Blocks.Interfaces.RealOutput CS "Control signal" 
        annotation (extent=[94,-12; 118,12]);
      Modelica.Blocks.Interfaces.RealInput SP "Set point signal" 
                    annotation (extent=[-112,28; -88,52]);
      
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
      CSbs = Kp*(P+I+D) "Control signal before saturation";
      CSs = smooth(0, if CSbs > 1 then 1 else if CSbs < 0 then 0 else CSbs) 
        "Saturated control signal";
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
    end PID;
    
    package Simulators "Simulation models for the Rankine cycle example" 
      model OpenLoop 
        package FlueGas = ThermoPower.Media.FlueGas "Flue gas model";
        package Water = ThermoPower.Water.StandardWater "Fluid model";
        annotation (Coordsys(extent=[-100,-100; 100,100], scale=0.1), Diagram,
          experiment(StopTime=5000, Tolerance=1e-006),
          Icon,
          Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
This model allows to simulate an open loop transients.
</html>"));
        Modelica.Blocks.Sources.Ramp gasFlowRate(offset=500, height=0) 
          annotation (extent=[-80,20; -60,40]);
        Modelica.Blocks.Sources.Ramp gasTemperature(offset=750, height=0) 
                       annotation (extent=[-80,-20; -60,0]);
        Plant plant(SSInit=true) annotation (extent=[20,-20; 80,40]);
      equation 
        connect(gasTemperature.y, plant.gasTemperature) annotation (points=[-59,
              -10; -20,-10; -20,-5; 20,-5], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(plant.gasFlowRate, gasFlowRate.y) annotation (points=[20,25;
              -20,25; -20,30; -59,30], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
      end OpenLoop;
      
      model ClosedLoop 
        package FlueGas = ThermoPower.Media.FlueGas "Flue gas model";
        package Water = ThermoPower.Water.StandardWater "Fluid model";
        annotation (Coordsys(extent=[-100,-100; 100,100], scale=0.1), Diagram,
          experiment(StopTime=5000, Tolerance=1e-006),
          Icon,
          Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
This model simulates a simple continuous-time control system for the steam power plant. The generated power is controlled to the set point by a PI controller with anti-windup.</p>
</html>"));
        Modelica.Blocks.Sources.Ramp gasFlowRate(
          offset=500,
          height=0,
          duration=10,
          startTime=0) 
          annotation (extent=[-80,20; -60,40]);
        Modelica.Blocks.Sources.Ramp powerSetPoint(
          offset=56.8e6,
          startTime=3000,
          duration=100,
          height=-56.8e6*0.1) 
                       annotation (extent=[-80,-20; -60,0]);
        PID pID(
          PVmin=40e6,
          PVmax=65e6,
          CSmin=500,
          CSmax=800,
          Ti=15,
          Kp=2,
          steadyStateInit=false) annotation (extent=[-40,-24; -20,-4]);
        Plant plant annotation (extent=[20,-20; 80,40]);
      equation 
        connect(powerSetPoint.y, pID.SP)  annotation (points=[-59,-10; -40,-10],
            style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=30,
            rgbfillColor={230,230,230},
            fillPattern=1));
        connect(pID.PV, plant.generatedPower) annotation (points=[-40,-18; -48,
              -18; -48,-40; 90,-40; 90,10; 80,10], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(pID.CS, plant.gasTemperature) annotation (points=[-19.4,-14; 0,
              -14; 0,-5; 20,-5], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(gasFlowRate.y, plant.gasFlowRate) annotation (points=[-59,30;
              -20,30; -20,25; 20,25], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
      end ClosedLoop;
      
      model ClosedLoopSteadyState 
        package FlueGas = ThermoPower.Media.FlueGas "Flue gas model";
        package Water = ThermoPower.Water.StandardWater "Fluid model";
        annotation (Coordsys(extent=[-100,-100; 100,100], scale=0.1), Diagram,
          experiment(
            StopTime=5000,
            NumberOfIntervals=5000,
            Tolerance=1e-006),
          Icon,
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
        Modelica.Blocks.Sources.Ramp gasFlowRate(
          offset=500,
          height=0,
          duration=10,
          startTime=0) 
          annotation (extent=[-80,20; -60,40]);
        Modelica.Blocks.Sources.Ramp powerSetPoint(
          offset=56.8e6,
          startTime=3000,
          duration=100,
          height=-56.8e6*0.1) 
                       annotation (extent=[-80,-20; -60,0]);
        PID pID(
          PVmin=40e6,
          PVmax=65e6,
          CSmin=500,
          CSmax=800,
          steadyStateInit=true,
          Kp=2,
          Ti=15)                annotation (extent=[-40,-24; -20,-4]);
        Plant plant(SSInit=true) annotation (extent=[20,-20; 80,40]);
      equation 
        connect(powerSetPoint.y, pID.SP)  annotation (points=[-59,-10; -40,-10],
            style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=30,
            rgbfillColor={230,230,230},
            fillPattern=1));
        connect(pID.PV, plant.generatedPower) annotation (points=[-40,-18; -48,
              -18; -48,-40; 90,-40; 90,10; 80,10], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(pID.CS, plant.gasTemperature) annotation (points=[-19.4,-14; 0,
              -14; 0,-5; 20,-5], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
        connect(gasFlowRate.y, plant.gasFlowRate) annotation (points=[-59,30;
              -20,30; -20,25; 20,25], style(
            color=74,
            rgbcolor={0,0,127},
            fillColor=7,
            rgbfillColor={255,255,255},
            fillPattern=1));
      end ClosedLoopSteadyState;
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
    model GasTurbine 
    protected 
      parameter Real tableEtaC[6,4]=[0,95,100,105;
                                     1,82.5e-2,81e-2,80.5e-2;
                                     2,84e-2,82.9e-2,82e-2;
                                     3,83.2e-2,82.2e-2,81.5e-2;
                                     4,82.5e-2,81.2e-2,79e-2;
                                     5,79.5e-2,78e-2,76.5e-2];
      parameter Real tablePhicC[6,4]=[0,95,100,105;
                                     1,38.3e-3,43e-3,46.8e-3;
                                     2,39.3e-3,43.8e-3,47.9e-3;
                                     3,40.6e-3,45.2e-3,48.4e-3;
                                     4,41.6e-3,46.1e-3,48.9e-3;
                                     5,42.3e-3,46.6e-3,49.3e-3];
      parameter Real tablePR[6,4]=[0,95,100,105;
                                    1,22.6,27,32;
                                    2,22,26.6,30.8;
                                    3,20.8,25.5,29;
                                    4,19,24.3,27.1;
                                    5,17,21.5,24.2];
      parameter Real tablePhicT[5,4]=[1,90,100,110;
                                     2.36,4.68e-3,4.68e-3,4.68e-3;
                                     2.88,4.68e-3,4.68e-3,4.68e-3;
                                     3.56,4.68e-3,4.68e-3,4.68e-3;
                                     4.46,4.68e-3,4.68e-3,4.68e-3];
      parameter Real tableEtaT[5,4]=[1,90,100,110;
                                    2.36,89e-2,89.5e-2,89.3e-2;
                                    2.88,90e-2,90.6e-2,90.5e-2;
                                    3.56,90.5e-2,90.6e-2,90.5e-2;
                                    4.46,90.2e-2,90.3e-2,90e-2];
      annotation (
        Icon(
          Rectangle(extent=[-160,160; 160,-160], style(
              color=76,
              rgbcolor={170,170,255},
              fillColor=30,
              rgbfillColor={230,230,230})),
          Rectangle(extent=[-100,12; 160,-12], style(
              color=0,
              rgbcolor={0,0,0},
              gradient=2,
              fillColor=10,
              rgbfillColor={135,135,135})),
          Polygon(points=[-20,36; -26,36; -26,84; 4,84; 4,76; -20,76; -20,36],
              style(
              color=0,
              rgbcolor={0,0,0},
              gradient=2,
              fillColor=76,
              rgbfillColor={170,170,255})),
          Polygon(points=[20,38; 26,38; 26,84; -2,84; -2,76; 20,76; 20,38],
              style(
              color=0,
              rgbcolor={0,0,0},
              gradient=2,
              fillColor=76,
              rgbfillColor={170,170,255})),
          Ellipse(extent=[-20,100; 20,60], style(
              color=0,
              rgbcolor={0,0,0},
              gradient=2,
              fillColor=1,
              rgbfillColor={255,0,0})),
          Polygon(points=[-100,100; -100,-100; -20,-40; -20,40; -100,100],
              style(
              color=0,
              rgbcolor={0,0,0},
              gradient=2,
              fillColor=76,
              rgbfillColor={170,170,255})),
          Polygon(points=[20,40; 20,-40; 100,-100; 100,100; 20,40], style(
              color=0,
              rgbcolor={0,0,0},
              gradient=2,
              fillColor=76,
              rgbfillColor={170,170,255}))),
        Coordsys(extent=[-160,-160; 160,160], scale=0.1),
        Diagram,
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
This is a simplified model of a turbojet-type engine at 11.000m [1], at costant speed.  
<p><b>References:</b></p>
<ol>
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol> 
</html>"));
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
        Ndesign=157.08)                   annotation (extent=[-120,-110; -60,
            -50]);
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
        Ndesign=157.08)                  annotation (extent=[40,-110; 100,-50]);
      Gas.CombustionChamber CombustionChamber1(
        gamma=1,
        Cm=1,
        pstart=8.11e5,
        Tstart=1370,
        V=0.05,
        S=0.05,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HH=41.6e6) 
              annotation (extent=[-30,30; 10,70]);
      Gas.SourceP SourceP1(            redeclare package Medium = 
            Media.Air,
        p0=0.343e5,
        T=244.4)                         annotation (extent=[-156,-20; -136,0]);
      Gas.SinkP SinkP1(
        redeclare package Medium = Media.FlueGas,
        p0=1.52e5,
        T=800) annotation (extent=[110,-20; 130,0]);
      Gas.SourceW SourceW1(
        redeclare package Medium = Media.NaturalGas,
        w0=2.02,
        p0=8.11e5,
        T=300)   annotation (extent=[-82,80; -62,100]);
      Gas.PressDrop PressDrop1(
        redeclare package Medium = Media.FlueGas,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        A=1,
        pstart=8.11e5,
        dpnom=0.26e5,
        wnom=102,
        Tstart=1370,
        rhonom=2)   annotation (extent=[36,-20; 56,0], rotation=270);
      Gas.PressDrop PressDrop2(
        pstart=8.3e5,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        A=1,
        redeclare package Medium = Media.Air,
        dpnom=0.19e5,
        wnom=100,
        rhonom=4.7,
        Tstart=600) annotation (extent=[-76,-20; -56,0], rotation=90);
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b 
        annotation (extent=[140,-20; 180,20]);
      Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor 
        annotation (extent=[110,-90; 130,-70]);
      Modelica.Blocks.Interfaces.RealInput combustibleFlowRate 
        annotation (extent=[-20,140; 20,180], rotation=270);
      Modelica.Blocks.Interfaces.RealOutput generatedPower 
        annotation (extent=[150,100; 190,140]);
      Modelica.Blocks.Continuous.FirstOrder gasFlowActuator(
        k=1,
        T=4,
        y_start=500,
        initType=Modelica.Blocks.Types.Init.SteadyState) 
        annotation (extent=[-32,112; -48,128]);
      Modelica.Blocks.Continuous.FirstOrder powerSensor1(
        k=1,
        T=1,
        y_start=56.8e6,
        initType=Modelica.Blocks.Types.Init.SteadyState) 
        annotation (extent=[82,112; 98,128],   rotation=0);
      PowerPlants.HRSG.Components.StateReader_gas stateInletCC(redeclare 
          package Medium = Media.Air) annotation (extent=[-60,40; -40,60]);
      PowerPlants.HRSG.Components.StateReader_gas stateOutletCC(redeclare 
          package Medium = Media.FlueGas) annotation (extent=[20,40; 40,60]);
    equation 
      connect(SourceW1.flange,CombustionChamber1. inf)     annotation (points=[-62,90;
            -10,90; -10,70],
                         style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(turbine.outlet, SinkP1.flange)     annotation (points=[94,-56; 94,
            -10; 110,-10],
                        style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(SourceP1.flange, compressor.inlet)     annotation (points=[-136,-10;
            -114,-10; -114,-56],
                              style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(PressDrop1.outlet, turbine.inlet)  annotation (points=[46,-20; 46,
            -56],    style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(compressor.outlet, PressDrop2.inlet)  annotation (points=[-66,-56;
            -66,-20],        style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(compressor.shaft_b, turbine.shaft_a) annotation (points=[-72,-80;
            52,-80], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1));
      connect(powerSensor.flange_a, turbine.shaft_b) annotation (points=[110,-80;
            88,-80],      style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          fillPattern=1));
      connect(powerSensor.flange_b, flange_b) annotation (points=[130,-80; 140,
            -80; 140,0; 160,0], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          fillPattern=1));
      connect(gasFlowActuator.u, combustibleFlowRate) annotation (points=[-30.4,
            120; 0,120; 0,160], style(
          color=74,
          rgbcolor={0,0,127},
          fillPattern=1));
      connect(gasFlowActuator.y, SourceW1.in_w0) annotation (points=[-48.8,120;
            -78,120; -78,95],  style(
          color=74,
          rgbcolor={0,0,127},
          fillPattern=1));
      connect(powerSensor.power, powerSensor1.u) annotation (points=[112,-91;
            112,-130; 30,-130; 30,120; 80.4,120],  style(
          color=74,
          rgbcolor={0,0,127},
          fillPattern=1));
      connect(powerSensor1.y, generatedPower) annotation (points=[98.8,120; 170,
            120],     style(
          color=74,
          rgbcolor={0,0,127},
          fillPattern=1));
      connect(CombustionChamber1.ina, stateInletCC.outlet) annotation (points=[-30,50;
            -44,50],         style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(stateInletCC.inlet, PressDrop2.outlet) annotation (points=[-56,50;
            -66,50; -66,0],  style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(stateOutletCC.inlet, CombustionChamber1.out) annotation (points=[24,50;
            10,50],        style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
      connect(stateOutletCC.outlet, PressDrop1.inlet) annotation (points=[36,50;
            46,50; 46,0],  style(
          color=76,
          rgbcolor={159,159,223},
          thickness=2));
    end GasTurbine;
    
    model Plant 
      
      GasTurbine gasTurbine annotation (extent=[-60,-20; -20,20]);
      Electrical.Generator generator(J=30000, initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                                     annotation (extent=[-6,-16; 26,16]);
      Electrical.NetworkGrid_Pmax network(
        deltaStart=0.4,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        Pmax=10e6,
        J=30000) 
        annotation (extent=[40,-10; 60,10]);
      Modelica.Blocks.Interfaces.RealInput combustibleFlowRate 
        annotation (extent=[-110,-10; -90,10], rotation=0);
      Modelica.Blocks.Interfaces.RealOutput generatedPower 
        annotation (extent=[96,-10; 116,10]);
      annotation (
        Diagram,
        Coordsys(extent=[-100,-100; 100,100], scale=0.1),
        Icon(Rectangle(extent=[-100,100; 100,-100], style(
              color=76,
              rgbcolor={170,170,255},
              fillColor=7,
              rgbfillColor={255,255,255})), Text(
            extent=[-80,80; 80,-80],
            style(
              color=76,
              rgbcolor={170,170,255},
              fillPattern=1),
            string="P")),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This model contains the  gas turbine, generator and network models. The network model is based on swing equation.
</html>"));
    equation 
      connect(network.powerConnection, generator.powerConnection) 
        annotation (points=[40,1.77636e-016; 36,1.77636e-016; 36,2.84217e-016; 
            23.76,2.84217e-016],style(pattern=0, thickness=2));
      connect(generator.shaft, gasTurbine.flange_b) annotation (points=[-3.76,
            2.84217e-016; -20,2.84217e-016; -20,0],        style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(gasTurbine.combustibleFlowRate, combustibleFlowRate) annotation (
          points=[-40,20; -40,40; -80,40; -80,0; -100,0], style(
          color=74,
          rgbcolor={0,0,127},
          gradient=2,
          fillColor=30,
          rgbfillColor={230,230,230}));
      connect(gasTurbine.generatedPower, generatedPower) annotation (points=[
            -18.75,15; 80,15; 80,0; 106,0], style(color=74, rgbcolor={0,0,127}));
    end Plant;
    
    model OpenLoopSimulator 
      
      Plant plant annotation (extent=[20,-20; 60,20]);
      Modelica.Blocks.Sources.Ramp combustibleFlowRate(
        offset=2.02,
        height=0.3,
        duration=0,
        startTime=500) 
        annotation (extent=[-40,-10; -20,10]);
      annotation (Diagram, experiment(StopTime=1000, Tolerance=1e-006),
        Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This model allows to simulate an open loop transients.
</html>"));
    equation 
      connect(plant.combustibleFlowRate, combustibleFlowRate.y) 
        annotation (points=[20,0; -19,0], style(color=74, rgbcolor={0,0,127}));
    end OpenLoopSimulator;
    
    model ClosedLoopSimulator 
      
      Plant plant annotation (extent=[20,-20; 60,20]);
      Modelica.Blocks.Sources.Ramp powerSetPoint(
        offset=4e6,
        height=2e6,
        duration=10,
        startTime=500) 
        annotation (extent=[-80,-6; -60,14]);
      annotation (Diagram, experiment(StopTime=1000, Tolerance=1e-006),
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
      RankineCycle.PID pID(
        Ti=5,
        PVmin=2e6,
        PVmax=12e6,
        CSmin=0,
        CSmax=4,
        steadyStateInit=true,
        Kp=0.25) annotation (extent=[-32,-10; -12,10]);
    equation 
      connect(plant.combustibleFlowRate, pID.CS) annotation (points=[20,0; 
            -11.4,0], style(color=74, rgbcolor={0,0,127}));
      connect(pID.SP, powerSetPoint.y) annotation (points=[-32,4; -59,4], style(
            color=74, rgbcolor={0,0,127}));
      connect(pID.PV, plant.generatedPower) annotation (points=[-32,-4; -50,-4;
            -50,-40; 80,-40; 80,0; 61.2,0], style(color=74, rgbcolor={0,0,127}));
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
