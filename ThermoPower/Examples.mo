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
                annotation (extent=[-70,14; -30,54]);
      Water.SourceW FeedWater(h=1.1059e6) 
                    annotation (extent=[-98,20; -78,40]);
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
        Icon(Rectangle(extent=[-100,100; 100,-100], style(color=3, rgbcolor={0,
                  0,255}))));
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
                          annotation (extent=[-96, -50; -60, -14], rotation=-90);
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
                  annotation (extent=[-8, -66; -32, -42], rotation=90);
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
                         annotation (extent=[-8,-8; -32,18],   rotation=90);
      Water.SinkW Blowdown(w0=0) annotation (extent=[-50, -14; -36, 4]);
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
                     annotation (extent=[-26, 38; -6, 58]);
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
                  annotation (extent=[0,38; 20,58]);
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
                     annotation (extent=[30,38; 50,58]);
      Water.ValveVap Valve(
        redeclare package Medium=Medium,
        pnom=54.497e5,
        dpnom=48.997e5,
        wnom=2*.06,
        CvData=0,
        Av=2.7e-5) annotation (extent=[58, 38; 74, 58]);
      Water.SinkP Sink(p0=5.5e5) annotation (extent=[80, 38; 100, 58]);
      Thermal.HeatSource1D HeatSourceSH(
        Nt=1,
        L=30,
        omega=0.0628,
        N=5) annotation (extent=[0, 86; 20, 106]);
      Thermal.HeatSource1D HeatSourceRisers(
        L=14.16,
        omega=0.08388,
        Nt=6,
        N=7) annotation (extent=[22, -66; 44, -42], rotation=-90);
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
                        annotation (extent=[-78, -84; -58, -64]);
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
                      annotation (extent=[-30, -36; -10, -16], rotation=90);
      Thermal.ConvHT DowncomerExchange(N=2, gamma=1800) 
        annotation (extent=[-68, -46; -48, -20], rotation=-90);
      Thermal.ConvHT RisersExchange(gamma=10000, N=7) 
        annotation (extent=[-12, -66; 8, -40], rotation=90);
      Thermal.ConvHT Pipe2DrumExchange(N=2, gamma=10000) 
        annotation (extent=[-8, -8; 12, 18], rotation=90);
      Thermal.ConvHT Pipe2SHExchange(N=2, gamma=3000) 
        annotation (extent=[-26,52; -6,78],   rotation=0);
      Thermal.ConvHT_htc SHExchange(N=5) 
        annotation (extent=[0,76; 20,50],   rotation=0);
      Thermal.ConvHT Pipe2ValveExchange(N=2, gamma=3000) 
        annotation (extent=[30,52; 50,78],   rotation=0);
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
                     annotation (extent=[-54, -44; -34, -20], rotation=90);
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
             annotation (extent=[4, -66; 24, -42], rotation=90);
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
                     annotation (extent=[12, -8; 32, 18], rotation=90);
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
                     annotation (extent=[-26, 66; -6, 92], rotation=180);
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
             annotation (extent=[0, 66; 20, 92], rotation=180);
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
                     annotation (extent=[30,66; 50,92],   rotation=180);
      Water.PressDrop PressDrop(
        redeclare package Medium=Medium,
        wnom=0.23,
        wnf=0.1,
        K=3,
        Kf=1e8,
        FFtype=2,
        A=5.62e-5,
        Kfc=2) annotation (extent=[-50, -84; -30, -64]);
      Modelica.Blocks.Interfaces.RealOutput DrumPressure 
        annotation (extent=[98,-6; 110,8]);
      Modelica.Blocks.Interfaces.RealOutput DrumLevel 
        annotation (extent=[98,-34; 110,-20]);
      Modelica.Blocks.Interfaces.RealInput FeedWaterFlow 
        annotation (extent=[-108,48; -96,60]);
      Modelica.Blocks.Interfaces.RealInput RiserPower 
        annotation (extent=[110,-78; 96,-62]);
      Modelica.Blocks.Interfaces.RealInput ValveOpening 
        annotation (extent=[108,70; 96,82]);
      Modelica.Blocks.Interfaces.RealInput SHPower 
        annotation (extent=[108,88; 96,100]);
      Modelica.Blocks.Interfaces.RealInput FeedWaterEnthalpy 
        annotation (extent=[-108,70; -96,82]);
    equation 
      connect(FeedWater.flange, Drum.feedwater) 
        annotation (points=[-78,30; -84.195,30; -84.195,31; -69.4,31]);
      connect(Drum.downcomer, Downcomer.infl) 
        annotation (points=[-64,20; -78,-14]);
      connect(Drum.blowdown, Blowdown.flange) 
        annotation (points=[-50,14.4; -50,-5]);
      connect(Drum.riser, Pipe2Drum.outfl) 
        annotation (points=[-34.4,22.6; -20,18]);
      connect(Pipe2Drum.infl, HeaderUpper.outlet) 
        annotation (points=[-20,-8; -20,-16]);
      connect(HeaderUpper.inlet, Risers.outfl) 
        annotation (points=[-20, -36.1; -20, -42]);
      connect(Downcomer.outfl, HeaderLower.inlet) 
        annotation (points=[-78, -50; -78.1, -74]);
      connect(Downcomer.wall, DowncomerExchange.side2) annotation (points=[-69,
             -32; -66.8, -32; -66.8, -33; -61.1, -33], style(color=45));
      connect(DowncomerExchange.side1, DowncomerWall.int) annotation (points=[-55,
             -33; -52, -33; -52, -32; -47, -32], style(color=45));
      connect(RisersExchange.side2, RisersWalls.int) annotation (points=[1.1, -53;
             8.55, -53; 8.55, -54; 11, -54], style(color=45));
      connect(Risers.wall, RisersExchange.side1) annotation (points=[-14, -54;
            -9.25, -54; -9.25, -53; -5, -53], style(color=45));
      connect(Drum.steam, Pipe2SH.infl) 
        annotation (points=[-38.4,48; -26,48]);
      connect(Pipe2SH.wall, Pipe2SHExchange.side2) annotation (points=[-16,53;
            -16,54.235; -14,54.235; -14,55.47; -16,55.47; -16,60.97],
          style(color=45));
      connect(Pipe2SHExchange.side1, Pipe2SHWall.int) 
        annotation (points=[-16,68.9; -16,75.1],   style(color=45));
      connect(Pipe2Valve.wall, Pipe2ValveExchange.side2) 
        annotation (points=[40,53; 40,60.97],              style(color=45));
      connect(Pipe2ValveExchange.side1, Pipe2ValveWall.int) 
        annotation (points=[40,68.9; 40,75.1],   style(color=45));
      connect(Pipe2SH.outfl, SH.infl) annotation (points=[-6,48; 0,48]);
      connect(SH.outfl, Pipe2Valve.infl) annotation (points=[20,48; 30,48]);
      connect(Valve.outlet, Sink.flange) annotation (points=[74, 48; 80, 48]);
      connect(Pipe2Valve.outfl, Valve.inlet) 
        annotation (points=[50,48; 58,48]);
      connect(SHWall.int, SHExchange.otherside) 
        annotation (points=[10,75.1; 10,66.9],    style(color=45));
      connect(SHExchange.fluidside, SH.wall) annotation (points=[10,59.1; 10,53]);
      connect(HeaderLower.outlet, PressDrop.inlet) 
        annotation (points=[-58, -74; -50, -74]);
      connect(PressDrop.outlet, Risers.infl) 
        annotation (points=[-30, -74; -24, -74; -24, -66; -20, -66]);
      connect(Pipe2Drum.wall, Pipe2DrumExchange.side1) 
        annotation (points=[-14,5; -1,5],   style(color=45));
      connect(Pipe2DrumExchange.side2, Pipe2DrumWall.int) 
        annotation (points=[5.1, 5; 19, 5], style(color=45));
      connect(RisersWalls.ext, HeatSourceRisers.wall) 
        annotation (points=[17.1, -54; 29.7, -54], style(color=45));
      connect(HeatSourceSH.wall, SHWall.ext) 
        annotation (points=[10, 93; 10, 83.03], style(color=45));
      connect(HeatSourceRisers.power, RiserPower) annotation (points=[37.4,-54;
            60,-54; 60,-70; 103,-70],style(color=3, rgbcolor={0,0,255}));
      connect(ValveOpening, Valve.theta) annotation (points=[102,76; 66,76; 66,
            56], style(color=3, rgbcolor={0,0,255}));
      connect(SHPower, HeatSourceSH.power) annotation (points=[102,94; 56,94;
            56,106; 10,106; 10,100],
                                  style(color=3, rgbcolor={0,0,255}));
      connect(FeedWaterFlow, FeedWater.in_w0) annotation (points=[-102,54; -92,
            54; -92,36], style(color=3, rgbcolor={0,0,255}));
      connect(FeedWaterEnthalpy, FeedWater.in_h) annotation (points=[-102,76;
            -84,76; -84,36], style(color=3, rgbcolor={0,0,255}));
      DrumPressure = Drum.p;
      DrumLevel = Drum.y;
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
        annotation (extent=[60, -92; 80, -72]);
      Modelica.Blocks.Sources.Ramp Qev(
        duration=1,
        height=0,
        offset=1.0141e5) 
                      annotation (extent=[60, -58; 80, -38]);
      Modelica.Blocks.Sources.Ramp wfeed1(
        duration=1,
        height=0,
        startTime=50,
        offset=wfeed_offset) 
                    annotation (extent=[-96, 66; -76, 86]);
      Modelica.Blocks.Math.Add3 wfeed annotation (extent=[-8, 62; 12, 82]);
      Modelica.Blocks.Sources.Ramp wfeed2(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-96, 32; -76, 52]);
      Modelica.Blocks.Sources.Ramp ValveOpening1(
        duration=1,
        height=0,
        offset=ValveOpening_offset) 
                      annotation (extent=[-96, -44; -76, -24]);
      Modelica.Blocks.Sources.Ramp ValveOpening2(
        duration=1,
        height=0,
        offset=0)     annotation (extent=[-96,-76; -76,-56]);
      Modelica.Blocks.Math.Add3 sum_1 annotation (extent=[-56, 6; -36, 26]);
      Modelica.Blocks.Sources.Ramp wfeed3(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-96, 0; -76, 20]);
      Modelica.Blocks.Sources.Ramp wfeed5(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-56, 70; -36, 90]);
      Modelica.Blocks.Sources.Ramp wfeed4(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-56, 38; -36, 58]);
      Modelica.Blocks.Sources.Ramp hfeed1(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[22, 22; 42, 42]);
      Modelica.Blocks.Sources.Ramp hfeed2(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[22, -8; 42, 12]);
      Modelica.Blocks.Math.Add3 hfeed annotation (extent=[60, -14; 80, 6]);
      Modelica.Blocks.Sources.Ramp hfeed3(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[22, -38; 42, -18]);
      Modelica.Blocks.Math.Add sum_3 annotation (extent=[-58,-50; -38,-30]);
      Modelica.Blocks.Sources.Ramp ValveOpening3(
        duration=1,
        height=0,
        offset=0)     annotation (extent=[-64,-92; -44,-72]);
      Modelica.Blocks.Math.Add ValveOpening 
                                     annotation (extent=[-28,-76; -8,-56]);
    equation 
      // Connection of the control signals to the process variables
      connect(Plant.FeedWaterEnthalpy,hfeed.y);
      connect(Plant.SHPower,Qsh.y);
      connect(Plant.RiserPower,Qev.y);
      connect(Plant.FeedWaterFlow,wfeed.y);
      connect(Plant.ValveOpening,ValveOpening.y);
      
      // Block diagram connections  
      connect(wfeed1.y,sum_1.u1)             annotation (points=[-75, 76; -64,
            76; -64, 24; -58, 24], style(color=3));
      connect(wfeed2.y,sum_1.u2)             annotation (points=[-75, 42; -70,
            42; -70, 16; -58, 16], style(color=3));
      connect(wfeed3.y,sum_1.u3) 
        annotation (points=[-75, 10; -60, 10; -60, 8; -58, 8], style(color=3));
      connect(hfeed1.y,hfeed.u1) 
        annotation (points=[43, 32; 50, 32; 50, 4; 58, 4], style(color=3));
      connect(hfeed2.y,hfeed.u2) 
        annotation (points=[43, 2; 48, 2; 48, -4; 58, -4], style(color=3));
      connect(hfeed3.y,hfeed.u3)             annotation (points=[43, -28; 50, -28;
             50, -12; 58, -12], style(color=3));
      connect(ValveOpening1.y,sum_3.u1)             annotation (points=[-75,
            -34; -60,-34],                  style(color=3));
      connect(ValveOpening2.y,sum_3.u2) 
        annotation (points=[-75,-66; -68,-66; -68,-46; -60,-46],
                                                 style(color=3));
      connect(sum_1.y,wfeed.u3)             annotation (points=[-35, 16; -26,
            16; -26, 64; -10, 64], style(color=3));
      connect(wfeed4.y,wfeed.u2)             annotation (points=[-35, 48; -30,
            48; -30, 72; -10, 72], style(color=3));
      connect(wfeed5.y,wfeed.u1) 
        annotation (points=[-35, 80; -10, 80], style(color=3));
      connect(ValveOpening3.y, ValveOpening.u2)     annotation (points=[-43,
            -82; -36,-82; -36,-72; -30,-72], style(color=3, rgbcolor={0,0,255}));
      connect(sum_3.y, ValveOpening.u1)     annotation (points=[-37,-40; -34,
            -40; -34,-60; -30,-60], style(color=3, rgbcolor={0,0,255}));
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
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
    First release.</li>
</ul>
</html>"),
        experiment(StopTime=1200, Tolerance=1e-006),
        experimentSetupOutput);
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
                    annotation (extent=[-98,4; -78,24]);
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
              thickness=2)), Text(
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
                     annotation (extent=[-26,26; -6,46]);
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
                  annotation (extent=[0,24; 20,44]);
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
                     annotation (extent=[30,24; 50,44]);
      Water.ValveVap Valve(
        redeclare package Medium=Medium,
        pnom=54.497e5,
        dpnom=48.997e5,
        wnom=2*.06,
        CvData=0,
        Av=2.7e-5,
        b=0.1)     annotation (extent=[58,44; 74,24]);
      Water.SinkP Sink(p0=5.5e5) annotation (extent=[80,24; 100,44]);
      Thermal.HeatSource1D HeatSourceSH(
        Nt=1,
        L=30,
        omega=0.0628,
        N=5) annotation (extent=[0,72; 20,92]);
      Thermal.ConvHT Pipe2SHExchange(gamma=3000, N=2) 
        annotation (extent=[-26,38; -6,64],   rotation=0);
      Thermal.ConvHT_htc SHExchange(N=5) 
        annotation (extent=[0,62; 20,36],   rotation=0);
      Thermal.ConvHT Pipe2ValveExchange(N=2, gamma=3000) 
        annotation (extent=[28,36; 48,62],   rotation=0);
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
                     annotation (extent=[-26,54; -6,80],   rotation=180);
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
             annotation (extent=[0,52; 20,78],   rotation=180);
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
                     annotation (extent=[28,52; 48,78],   rotation=180);
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
                        annotation (extent=[-62,8; -42,28]);
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow RisersHeat 
        annotation (extent=[-62,-18; -42,2], rotation=90);
      Modelica.Blocks.Interfaces.RealInput SHPower 
        annotation (extent=[-108,74; -90,94]);
      Modelica.Blocks.Interfaces.RealInput ValveOpening 
        annotation (extent=[-108,-84; -90,-64]);
      Modelica.Blocks.Interfaces.RealInput RiserPower 
        annotation (extent=[-108,-54; -90,-34]);
      Modelica.Blocks.Interfaces.RealInput FeedWaterEnthalpy 
        annotation (extent=[-108,48; -90,66]);
      Modelica.Blocks.Interfaces.RealInput FeedWaterFlow 
        annotation (extent=[-108,20; -90,40]);
    equation 
      DrumLevel = DrumBoiler.Vld/(pi*r^2)-H/2;
      DrumPressure = DrumBoiler.p;
      connect(Pipe2SH.wall, Pipe2SHExchange.side2) annotation (points=[-16,41;
            -16,42.235; -14,42.235; -14,43.47; -16,43.47; -16,46.97],
          style(color=45));
      connect(Pipe2SHExchange.side1, Pipe2SHWall.int) 
        annotation (points=[-16,54.9; -16,63.1],   style(color=45));
      connect(Pipe2Valve.wall, Pipe2ValveExchange.side2) 
        annotation (points=[40,39; 40,44.97; 38,44.97],    style(color=45));
      connect(Pipe2ValveExchange.side1, Pipe2ValveWall.int) 
        annotation (points=[38,52.9; 38,61.1],   style(color=45));
      connect(Pipe2SH.outfl, SH.infl) annotation (points=[-6,36; -4,36; -4,34;
            0,34]);
      connect(SH.outfl, Pipe2Valve.infl) annotation (points=[20,34; 30,34]);
      connect(Valve.outlet, Sink.flange) annotation (points=[74,34; 80,34]);
      connect(Pipe2Valve.outfl, Valve.inlet) 
        annotation (points=[50,34; 58,34]);
      connect(SHWall.int, SHExchange.otherside) 
        annotation (points=[10,61.1; 10,52.9],    style(color=45));
      connect(SHExchange.fluidside, SH.wall) annotation (points=[10,45.1; 10,39]);
      connect(HeatSourceSH.wall, SHWall.ext) 
        annotation (points=[10,79; 10,69.03],   style(color=45));
      connect(FeedWater.flange, DrumBoiler.feed) 
        annotation (points=[-78,14; -68,14; -68,13.6; -61,13.6]);
      connect(DrumBoiler.steam, Pipe2SH.infl) 
        annotation (points=[-45.2,25.2; -38,25.2; -38,36; -26,36]);
      connect(DrumBoiler.heat, RisersHeat.port) annotation (points=[-52,9; -52,2],
                                        style(color=42));
      connect(SHPower, HeatSourceSH.power) annotation (points=[-99,84; -46,84; -46,
            90; 10,90; 10,86],       style(color=3, rgbcolor={0,0,255}));
      connect(ValveOpening, Valve.theta) annotation (points=[-99,-74; 66,-74; 66,26],
                 style(color=3, rgbcolor={0,0,255}));
      connect(RiserPower,RisersHeat.Q_flow) annotation (points=[-99,-44; -52,-44;
            -52,-18],             style(color=3, rgbcolor={0,0,255}));
      connect(FeedWaterEnthalpy, FeedWater.in_h) annotation (points=[-99,57; -84,57;
            -84,20],         style(color=3, rgbcolor={0,0,255}));
      connect(FeedWater.in_w0, FeedWaterFlow) annotation (points=[-92,20; -92,30;
            -99,30],             style(color=3, rgbcolor={0,0,255}));
    end CISEPlant2States;
    
    model CISESim2States 
      "CISE plant reduced model with boundary conditions and initial steady-state computation" 
      parameter MassFlowRate wfeed_offset(fixed=false) = 6.0e-2 
        "Offset of feedwater flow rate";
      parameter Real ValveOpening_offset(fixed=false) = 0.4 
        "Offset of valve opening";
      parameter Pressure InitialDrumPressure = 5.9359e+006;
      parameter Length InitialDrumLevel = -0.091;
      CISEPlant2States Plant  annotation (extent=[42,4; 96,58]);
      Modelica.Blocks.Sources.Constant Qsh(k=4928) 
        annotation (extent=[-20,80; 0,100]);
      Modelica.Blocks.Sources.Ramp Qev(
        duration=1,
        height=0,
        offset=1.0141e5) 
                      annotation (extent=[0,10; 20,30]);
      Modelica.Blocks.Sources.Ramp wfeed1(
        duration=1,
        height=0,
        startTime=50,
        offset=wfeed_offset) 
                    annotation (extent=[-102,-16; -82,4]);
      Modelica.Blocks.Math.Add3 wfeed annotation (extent=[-32,-20; -12,0]);
      Modelica.Blocks.Sources.Ramp wfeed2(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-102,-50; -82,-30]);
      Modelica.Blocks.Sources.Ramp ValveOpening1(
        duration=1,
        height=0,
        offset=ValveOpening_offset) 
                      annotation (extent=[-20,-60; 0,-40]);
      Modelica.Blocks.Sources.Ramp ValveOpening2(
        duration=1,
        height=0,
        offset=0)     annotation (extent=[-20,-96; 0,-76]);
      Modelica.Blocks.Math.Add3 sum_1 annotation (extent=[-68,-76; -48,-56]);
      Modelica.Blocks.Sources.Ramp wfeed3(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-102,-82; -82,-62]);
      Modelica.Blocks.Sources.Ramp wfeed5(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-66,-12; -46,8]);
      Modelica.Blocks.Sources.Ramp wfeed4(
        duration=1,
        height=0,
        offset=0,
        startTime=0)   annotation (extent=[-68,-42; -48,-22]);
      Modelica.Blocks.Sources.Ramp hfeed1(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[-100,80; -80,100]);
      Modelica.Blocks.Sources.Ramp hfeed2(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[-100,50; -80,70]);
      Modelica.Blocks.Math.Add3 hfeed annotation (extent=[-62,44; -42,64]);
      Modelica.Blocks.Sources.Ramp hfeed3(
        duration=1,
        height=0,
        offset=0)   annotation (extent=[-100,20; -80,40]);
      Modelica.Blocks.Math.Add ValveOpening annotation (extent=[20,-80; 40,-60]);
    equation 
      connect(hfeed1.y,hfeed.u1) 
        annotation (points=[-79,90; -72,90; -72,62; -64,62],
                                                           style(color=3));
      connect(hfeed2.y,hfeed.u2) 
        annotation (points=[-79,60; -74,60; -74,54; -64,54],
                                                           style(color=3));
      connect(hfeed3.y,hfeed.u3)             annotation (points=[-79,30; -72,30;
            -72,46; -64,46],    style(color=3));
      connect(ValveOpening1.y,ValveOpening.u1)      annotation (points=[1,-50;
            6,-50; 6,-64; 18,-64],          style(color=3));
      connect(ValveOpening2.y,ValveOpening.u2) 
        annotation (points=[1,-86; 8,-86; 8,-76; 18,-76],
                                                 style(color=3));
      connect(wfeed4.y,wfeed.u2)             annotation (points=[-47,-32; -42,
            -32; -42,-10; -34,-10],style(color=3));
      connect(wfeed5.y,wfeed.u1) 
        annotation (points=[-45,-2; -34,-2],   style(color=3));
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
</html>"));
      connect(wfeed3.y, sum_1.u3) annotation (points=[-81,-72; -74,-72; -74,-74;
            -70,-74],
          style(color=74, rgbcolor={0,0,127}));
      connect(wfeed2.y, sum_1.u2) annotation (points=[-81,-40; -78,-40; -78,-66;
            -70,-66],
                 style(color=74, rgbcolor={0,0,127}));
      connect(wfeed1.y, sum_1.u1) annotation (points=[-81,-6; -74,-6; -74,-58;
            -70,-58],
                 style(color=74, rgbcolor={0,0,127}));
      connect(sum_1.y, wfeed.u3) annotation (points=[-47,-66; -38,-66; -38,-18;
            -34,-18],
          style(color=74, rgbcolor={0,0,127}));
    initial equation 
      // Additional equations to determine the non-fixed parameters
      Plant.DrumLevel = InitialDrumLevel;
      Plant.DrumPressure = InitialDrumPressure;
    equation 
      connect(hfeed.y, Plant.FeedWaterEnthalpy) annotation (points=[-41,54; 0,
            54; 0,46.39; 42.27,46.39], style(color=74, rgbcolor={0,0,127}));
      connect(Qsh.y, Plant.SHPower) annotation (points=[1,90; 20,90; 20,53.68; 
            42.27,53.68], style(color=74, rgbcolor={0,0,127}));
      connect(wfeed.y, Plant.FeedWaterFlow) annotation (points=[-11,-10; -8,-10; 
            -8,39.1; 42.27,39.1], style(color=74, rgbcolor={0,0,127}));
      connect(Qev.y, Plant.RiserPower) annotation (points=[21,20; 29.635,20; 
            29.635,19.12; 42.27,19.12], style(color=74, rgbcolor={0,0,127}));
      connect(ValveOpening.y, Plant.ValveOpening) annotation (points=[41,-70; 
            54,-70; 54,-38; 28,-38; 28,11.02; 42.27,11.02], style(color=74,
            rgbcolor={0,0,127}));
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
    model HRB "Heat recovery boiler model" 
      constant Real pi=Modelica.Constants.pi;
      replaceable package WaterMedium=Water.StandardWater extends 
        Modelica.Media.Interfaces.PartialMedium;
      replaceable package GasMedium = 
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
                               annotation (extent=[-12,-52; 8,-32]);
      Thermal.ConvHT_htc WaterMetalHT(N=Nr + 1) 
                                       annotation (extent=[-12,-12; 8,-32]);
      annotation (Diagram, Icon(
          Rectangle(extent=[-80,80; 80,-80], style(
              color=1,
              rgbcolor={255,0,0},
              thickness=2,
              fillColor=45,
              rgbfillColor={255,128,0})),
          Line(points=[-60,62; 62,-60; 62,-60], style(
              color=1,
              rgbcolor={255,0,0},
              thickness=4,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1)),
          Line(points=[62,60; -60,-60], style(
              color=1,
              rgbcolor={255,0,0},
              thickness=4,
              fillColor=45,
              rgbfillColor={255,128,0},
              fillPattern=1))),
        Documentation(revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
", info="<html>
This is the model of a very simple heat recovery boiler. The modelling assumptions are as follows:
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
                                          annotation (extent=[-12,6; 8,-14]);
      Flow1DGasHT GasSide(redeclare package Medium = GasMedium,
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
        initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                               annotation (extent=[8,56; -14,36]);
      Gas.FlangeA gasInlet(redeclare package Medium=GasMedium) 
        annotation (extent=[80,40; 100,60]);
      Gas.FlangeB gasOutlet(redeclare package Medium=GasMedium) 
        annotation (extent=[-100,40; -80,60]);
      Water.FlangeA waterInlet(redeclare package Medium=WaterMedium) 
        annotation (extent=[-100,-60; -80,-40]);
      Water.FlangeB waterOutlet(redeclare package Medium=WaterMedium) 
        annotation (extent=[80,-60; 100,-40]);
      Thermal.CounterCurrent CounterCurrent1(N=Nr + 1) 
        annotation (extent=[-12,6; 8,26]);
      Thermal.ConvHT_htc ConvHT_htc1(N=Nr + 1) 
        annotation (extent=[-12,20; 8,40]);
    equation 
      connect(WaterMetalHT.fluidside, WaterSide.wall) annotation (points=[-2,
            -25; -2,-37], style(color=3, rgbcolor={0,0,255}));
      connect(TubeWalls.int, WaterMetalHT.otherside)  annotation (points=[-2,-7; 
            -2,-19],  style(color=45, rgbcolor={255,127,0}));
      connect(TubeWalls.ext, TubeWalls.int)   annotation (points=[-2,-0.9; -2,
            -2; 0,-2; 2,-4; -2,-4; -2,-7],
                                   style(color=45, rgbcolor={255,127,0}));
      connect(waterInlet, WaterSide.infl) 
        annotation (points=[-90,-50; -56,-50; -56,-42; -12,-42]);
      connect(WaterSide.outfl, waterOutlet) 
        annotation (points=[8,-42; 52,-42; 52,-50; 90,-50]);
      connect(gasOutlet, GasSide.outfl) annotation (points=[-90,50; -52,50; -52,
            46; -14,46],     style(color=76, rgbcolor={159,159,223}));
      connect(GasSide.infl, gasInlet) annotation (points=[8,46; 50,46; 50,50;
            90,50], style(color=76, rgbcolor={159,159,223}));
      connect(CounterCurrent1.side2, TubeWalls.ext) annotation (points=[-2,12.9; 
            -2,-0.9],style(color=45, rgbcolor={255,127,0}));
      connect(CounterCurrent1.side1, ConvHT_htc1.otherside) annotation (points=[-2,
            19; -2,27],       style(color=45, rgbcolor={255,127,0}));
      connect(ConvHT_htc1.fluidside, GasSide.wall) annotation (points=[-2,33;
            -2,36.5; -3,36.5; -3,41], style(color=3, rgbcolor={0,0,255}));
    end HRB;
    
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
    
    model HRBPlant "Simple plant model with HRB" 
      replaceable package GasMedium = 
          Modelica.Media.IdealGases.MixtureGases.CombustionAir extends 
        Modelica.Media.Interfaces.PartialMedium;
      replaceable package WaterMedium=Modelica.Media.Water.WaterIF97_ph extends 
        Modelica.Media.Interfaces.PartialMedium;
      parameter Time Ts = 4 "Temperature sensor time constant";
      HRB Boiler(
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
               annotation (extent=[-28,14; 2,44]);
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
          Rectangle(extent=[-100,100; 100,-100], style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2)),
          Text(
            extent=[-58,54; 60,-72],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="P"),
          Text(
            extent=[54,48; 84,28],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="TGin"),
          Text(
            extent=[48,82; 86,60],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="TGout"),
          Text(
            extent=[54,-42; 84,-62],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="TWin"),
          Text(
            extent=[48,-10; 86,-32],
            style(
              color=3,
              rgbcolor={0,0,255},
              thickness=2),
            string="TWout")));
      Water.ValveLin Valve(Kv=20/4e5, redeclare package Medium = WaterMedium) 
                                          annotation (extent=[32,14; 50,-2]);
      Water.SinkP SinkP1(p0=1e5, redeclare package Medium = WaterMedium) 
                         annotation (extent=[56,-2; 72,14]);
      Gas.SourceW SourceW2(       redeclare package Medium = GasMedium,
        p0=1e5,
        T=670,
        w0=10)                    annotation (extent=[62,30; 44,48]);
      Gas.SinkP SinkP2(redeclare package Medium = GasMedium,
        T=300)         annotation (extent=[-78,24; -96,42]);
      Gas.PressDropLin PressDropLin1(redeclare package Medium = GasMedium, R=
            1000/10) annotation (extent=[-54,24; -70,40]);
      Water.SensT WaterIn(redeclare package Medium = WaterMedium) 
                           annotation (extent=[-62,20; -42,0]);
      Water.SensT WaterOut(redeclare package Medium = WaterMedium) 
                            annotation (extent=[8,12; 28,-8]);
      Gas.SensT GasOut(redeclare package Medium = GasMedium) 
        annotation (extent=[-30,32; -50,52]);
      Gas.SensT GasIn(redeclare package Medium = GasMedium) 
        annotation (extent=[38,32; 18,52]);
      Water.SourceP SourceP1(p0=5e5, redeclare package Medium = WaterMedium) 
                                     annotation (extent=[-84,-4; -68,12]);
      Modelica.Blocks.Interfaces.RealInput ValveOpening 
        annotation (extent=[-118,-14; -92,14]);
      Modelica.Blocks.Interfaces.RealOutput WaterOut_T 
        annotation (extent=[92,-32; 114,-10]);
      Modelica.Blocks.Interfaces.RealOutput WaterIn_T 
        annotation (extent=[92,-58; 116,-36]);
      Modelica.Blocks.Interfaces.RealOutput GasOut_T 
        annotation (extent=[94,58; 118,82]);
      Modelica.Blocks.Interfaces.RealOutput GasIn_T 
        annotation (extent=[94,26; 120,50]);
      Modelica.Blocks.Interfaces.RealInput GasFlowRate 
        annotation (extent=[-116,56; -90,84]);
      Modelica.Blocks.Continuous.FirstOrder GasFlowActuator(k=1, T=1) 
        annotation (extent=[-82,74; -70,86]);
      Modelica.Blocks.Continuous.FirstOrder WaterInTSensor(k=1, T=Ts) 
        annotation (extent=[12,-54; 24,-40]);
      Modelica.Blocks.Continuous.FirstOrder WaterOutTSensor(k=1, T=Ts) 
        annotation (extent=[56,-26; 68,-14]);
      Modelica.Blocks.Continuous.FirstOrder GasInTSensor(k=1, T=Ts) 
        annotation (extent=[14,44; 2,56]);
      Modelica.Blocks.Continuous.FirstOrder GasOutTSensor(k=1, T=Ts) 
        annotation (extent=[-56,44; -68,56]);
      Modelica.Blocks.Continuous.FirstOrder ValveOpeningActuator(k=1, T=1) 
        annotation (extent=[-68,-38; -56,-24]);
    equation 
      connect(Valve.outlet, SinkP1.flange)     annotation (points=[50,6; 56,6],
          style(
          fillColor=45,
          rgbfillColor={255,128,0},
          fillPattern=1));
      connect(SinkP2.flange, PressDropLin1.outlet) annotation (points=[-78,33;
            -74,33; -74,32; -70,32],
                     style(color=76, rgbcolor={159,159,223}));
      connect(PressDropLin1.inlet, GasOut.outlet)  annotation (points=[-54,32;
            -50,32; -50,38; -46,38],
                     style(color=76, rgbcolor={159,159,223}));
      connect(GasOut.inlet, Boiler.gasOutlet)  annotation (points=[-34,38; -30,
            38; -30,36.5; -26.5,36.5],
                                   style(color=76, rgbcolor={159,159,223}));
      connect(WaterIn.outlet, Boiler.waterInlet) 
        annotation (points=[-46,14; -34,14; -34,21.5; -26.5,21.5]);
      connect(WaterOut.outlet, Valve.inlet) 
        annotation (points=[24,6; 32,6]);
      connect(Boiler.waterOutlet, WaterOut.inlet) 
        annotation (points=[0.5,21.5; 5.1,21.5; 5.1,6; 12,6]);
      connect(SourceP1.flange, WaterIn.inlet) 
        annotation (points=[-68,4; -64,4; -64,14; -58,14]);
      connect(Boiler.gasInlet, GasIn.outlet) annotation (points=[0.5,36.5; 8.25,
            36.5; 8.25,38; 22,38],  style(color=76, rgbcolor={159,159,223}));
      connect(GasIn.inlet, SourceW2.flange) annotation (points=[34,38; 47,38; 47,39;
            44,39], style(color=76, rgbcolor={159,159,223}));
      connect(GasFlowRate, GasFlowActuator.u) annotation (points=[-103,70; -86,
            70; -86,80; -83.2,80], style(color=74, rgbcolor={0,0,127}));
      connect(GasFlowActuator.y, SourceW2.in_w0) annotation (points=[-69.4,80;
            58.4,80; 58.4,43.5], style(color=74, rgbcolor={0,0,127}));
      connect(GasInTSensor.u, GasIn.T) annotation (points=[15.2,50; 18,50; 18,
            48; 21,48], style(color=74, rgbcolor={0,0,127}));
      connect(GasOut.T, GasOutTSensor.u) annotation (points=[-47,48; -52,48;
            -52,50; -54.8,50], style(color=74, rgbcolor={0,0,127}));
      connect(GasOutTSensor.y, GasOut_T) annotation (points=[-68.6,50; -74,50;
            -74,70; 106,70], style(color=74, rgbcolor={0,0,127}));
      connect(WaterIn.T, WaterInTSensor.u) annotation (points=[-44,4; -36,4;
            -36,-47; 10.8,-47], style(color=74, rgbcolor={0,0,127}));
      connect(WaterOut.T, WaterOutTSensor.u) annotation (points=[26,-4; 34,-4;
            34,-20; 54.8,-20], style(color=74, rgbcolor={0,0,127}));
      connect(WaterOutTSensor.y, WaterOut_T) annotation (points=[68.6,-20; 84,
            -20; 84,-21; 103,-21], style(color=74, rgbcolor={0,0,127}));
      connect(ValveOpening, ValveOpeningActuator.u) annotation (points=[-105,
            1.77636e-015; -88,1.77636e-015; -88,-31; -69.2,-31], style(color=74,
            rgbcolor={0,0,127}));
      connect(GasInTSensor.y, GasIn_T) annotation (points=[1.4,50; -8,50; -8,64; 
            78,64; 78,38; 107,38], style(color=74, rgbcolor={0,0,127}));
      connect(Valve.cmd, ValveOpeningActuator.y) annotation (points=[41,-0.4; 
            41,-31; -55.4,-31], style(color=74, rgbcolor={0,0,127}));
      connect(WaterInTSensor.y, WaterIn_T) annotation (points=[24.6,-47; 104,
            -47],                    style(color=74, rgbcolor={0,0,127}));
    initial equation 
      der(GasFlowActuator.y)=0;
      der(GasInTSensor.y)=0;
      der(GasOutTSensor.y)=0;
      der(ValveOpeningActuator.y)=0;
      der(WaterInTSensor.y)=0;
      der(WaterOutTSensor.y)=0;
      
    end HRBPlant;
    
    model Flow1DGasHT "Gas flow model with h.t.c. computation" 
      extends Gas.Flow1D(redeclare Thermal.DHThtc wall);
      parameter CoefficientOfHeatTransfer gamma_nom 
        "Nominal heat transfer coefficient";
    equation 
      for i in 1:N loop
        wall.gamma[i]= gamma_nom*(w/wnom)^0.6;
      end for;
      annotation (Documentation(revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
    First release.</li>
</ul>
</html>
",   info="<html>
This model extends <tt>Gas.Flow1D</tt> by adding the computation of the heat transfer coefficient, which is proportional to the mass flow rate, raised to the power of 0.6.
</html>"));
    end Flow1DGasHT;
    
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
        annotation (extent=[-108, 40; -88, 60], rotation=0);
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
        annotation (extent=[-120, -28; -60, 20]);
      Modelica.Blocks.Interfaces.RealOutput CSport 
        annotation (extent=[70, -28; 130, 20]);
      Modelica.Blocks.Interfaces.RealInput MANport 
        annotation (extent=[30, 70; 88, 114], rotation=270);
      Modelica.Blocks.Interfaces.RealInput PVport 
        annotation (extent=[-120, -104; -60, -56]);
      Modelica.Blocks.Interfaces.BooleanInput TRKswitch 
        annotation (extent=[-108, 78; -88, 98], rotation=0);
      Modelica.Blocks.Interfaces.RealInput TRKport 
        annotation (extent=[-56, 70; 2, 114], rotation=270);
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
        HRBPlant Plant annotation (extent=[-12,-40; 68,40]);
        Modelica.Blocks.Sources.Step ValveOpening(
          height=-.1,
          offset=1,
          startTime=50) 
                       annotation (extent=[-80,-42; -60,-22]);
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
          annotation (extent=[-80,28; -60,48]);
        Modelica.Blocks.Math.Add Add1 annotation (extent=[-46,42; -32,56]);
        Modelica.Blocks.Interfaces.RealInput GasFlowRateInput 
          annotation (extent=[-104,70; -84,90]);
        Modelica.Blocks.Interfaces.RealInput ValveOpeningInput 
          annotation (extent=[-104,-10; -84,10]);
        Modelica.Blocks.Math.Add Add2 annotation (extent=[-46,-26; -32,-12]);
        Modelica.Blocks.Interfaces.RealOutput TGoutOutput 
          annotation (extent=[90,70; 110,90]);
        Modelica.Blocks.Interfaces.RealOutput TWoutOutput 
          annotation (extent=[90,-70; 110,-50]);
      equation 
        connect(GasFlowRate.y, Add1.u2) annotation (points=[-59,38; -56,38; -56,
              44.8; -47.4,44.8], style(color=74, rgbcolor={0,0,127}));
        connect(Add1.y, Plant.GasFlowRate) annotation (points=[-31.3,49; -28.65,
              49; -28.65,28; -13.2,28], style(color=74, rgbcolor={0,0,127}));
        connect(GasFlowRateInput, Add1.u1) annotation (points=[-94,80; -52,80;
              -52,53.2; -47.4,53.2], style(color=74, rgbcolor={0,0,127}));
        connect(ValveOpening.y, Add2.u2) annotation (points=[-59,-32; -54,-32;
              -54,-23.2; -47.4,-23.2], style(color=74, rgbcolor={0,0,127}));
        connect(ValveOpeningInput, Add2.u1) annotation (points=[-94,0; -72,0;
              -72,-14.8; -47.4,-14.8], style(color=74, rgbcolor={0,0,127}));
        connect(Add2.y, Plant.ValveOpening) annotation (points=[-31.3,-19; -24,
              -19; -24,7.10543e-016; -14,7.10543e-016], style(color=74,
              rgbcolor={0,0,127}));
        connect(Plant.GasOut_T, TGoutOutput) annotation (points=[70.4,28; 78,28;
              78,80; 100,80], style(color=74, rgbcolor={0,0,127}));
        connect(Plant.WaterOut_T, TWoutOutput) annotation (points=[69.2,-8.4;
              82,-8.4; 82,-60; 100,-60], style(color=74, rgbcolor={0,0,127}));
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
        HRBPlant Plant annotation (extent=[20,-40; 80,20]);
        Modelica.Blocks.Sources.Step ValveOpening(
          height=-.1,
          offset=1,
          startTime=50) 
                       annotation (extent=[-80,-40; -60,-20]);
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
              6,-30; 6,-10; 18.5,-10], style(color=74, rgbcolor={0,0,127}));
        connect(TempController.y, Plant.GasFlowRate) annotation (points=[1,10;
              10,10; 10,11; 19.1,11], style(color=74, rgbcolor={0,0,127}));
        connect(Feedback1.y, TempController.u) annotation (points=[-31,10; -22,
              10], style(color=74, rgbcolor={0,0,127}));
        connect(Plant.WaterOut_T, Feedback1.u2) annotation (points=[80.9,-16.3;
              92,-16.3; 92,46; -40,46; -40,18], style(color=74, rgbcolor={0,0,
                127}));
        connect(TWOutSetPoint.y, Feedback1.u1) annotation (points=[-59,10; -48,
              10], style(color=74, rgbcolor={0,0,127}));
      initial equation 
        // Control system
        der(TempController.x)=0;
      end ClosedLoopSimulator;
      
      model ClosedLoopDigitalSimulator 
        HRBPlant Plant annotation (extent=[20,-40; 80,20]);
        Modelica.Blocks.Sources.Step ValveOpening(
          height=-.1,
          offset=1,
          startTime=50) 
                       annotation (extent=[-80,-40; -60,-20]);
        annotation (Diagram, experiment(
            StopTime=300,
            Interval=0.1,
            Algorithm="Euler"),
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
          CSstart=7,
          StartSteadyState=true,
          samplePeriod=0.4) annotation (extent=[-26,26; 0,0]);
      equation 
        connect(ValveOpening.y, Plant.ValveOpening) annotation (points=[-59,-30;
              6,-30; 6,-10; 18.5,-10], style(color=74, rgbcolor={0,0,127}));
        connect(DigitalPI1.CSport, Plant.GasFlowRate) annotation (points=[0,
              13.52; 8,13.52; 8,11; 19.1,11], style(color=74, rgbcolor={0,0,127}));
        connect(TWOutSetPoint.y, DigitalPI1.SPport) annotation (points=[-59,10; 
              -46,10; -46,13.52; -24.7,13.52], style(color=74, rgbcolor={0,0,
                127}));
        connect(Plant.WaterOut_T, DigitalPI1.PVport) annotation (points=[80.9,
              -16.3; 94,-16.3; 94,40; -42,40; -42,23.4; -24.7,23.4], style(
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
end Examples;
