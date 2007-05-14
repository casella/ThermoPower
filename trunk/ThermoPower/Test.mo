package Test "Test cases for the ThermoPower models" 
  extends Modelica.Icons.Library;
  model TestMixer 
    package Medium=Modelica.Media.Water.StandardWater;
    Water.SourceW SourceW1(w0=0.5, h=2.8e6) 
      annotation(extent=[-88,36; -68,56]);
    Water.SourceW SourceW2(w0=0.5, h=3.0e6) 
      annotation(extent=[-88,-2; -68,18]);
    Water.SinkP SinkP1(p0=0) 
                       annotation(extent=[54,18; 74,38]);
    Water.Mixer Mixer1(
      V=1,
      Cm=0,
      hstart=2.9e6,
      redeclare package Medium = Medium,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                    annotation(extent=[-52,18; -32,38]);
    annotation(Diagram, experiment(StopTime=8),
      Documentation(info="<HTML>
<p>This model tests the <tt>Mixer</tt> and <tt>Header</tt> models.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
    Water.ValveLin ValveLin1(Kv=1/1e5) 
                             annotation(extent=[14,18; 34,38]);
    Modelica.Blocks.Sources.Step Step1(
      height=-.2,
      offset=1,
      startTime=2)    annotation(extent=[-44,60; -24,80]);
    Water.PressDrop PressDrop1(
      wnom=1,
      dpnom=100,
      rhonom=1000,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) 
                   annotation(extent=[-18,18; 2,38]);
    Water.SourceW SourceW3(w0=0.5, h=2.8e6) 
      annotation(extent=[-84,-42; -64,-22]);
    Water.Header Header1(V=1, redeclare package Medium = Medium,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
      annotation(extent=[-54,-42; -34,-22]);
    Water.ValveLin ValveLin2(Kv=1/1e5) 
                             annotation(extent=[-12,-42; 8,-22]);
    Water.SinkP SinkP2(p0=0) 
                       annotation(extent=[22,-40; 42,-20]);
  equation 
    connect(Step1.y,       ValveLin1.cmd) annotation(points=[-23,70; 24,70;
          24,36],
               style(color=3, rgbcolor={0,0,255}));
    connect(SourceW1.flange, Mixer1.in1) 
      annotation(points=[-68,46; -58,46; -58,34; -50,34]);
    connect(SourceW2.flange, Mixer1.in2) 
      annotation(points=[-68,8; -60,8; -60,22; -49.9,22]);
    connect(ValveLin1.outlet, SinkP1.flange) 
      annotation(points=[34,28; 54,28]);
    connect(PressDrop1.outlet, ValveLin1.inlet) 
      annotation(points=[2,28; 14,28]);
    connect(Mixer1.out, PressDrop1.inlet) annotation(points=[-32,28; -18,28]);
    connect(SourceW3.flange, Header1.inlet) 
      annotation(points=[-64,-32; -54.1,-32]);
    connect(Header1.outlet, ValveLin2.inlet) 
      annotation(points=[-34,-32; -12,-32]);
    connect(ValveLin2.outlet, SinkP2.flange) 
      annotation(points=[8,-32; 14,-32; 14,-30; 22,-30]);
    connect(Step1.y,       ValveLin2.cmd) annotation(points=[-23,70; -2,70;
          -2,-24], style(color=3, rgbcolor={0,0,255}));
  end TestMixer;
  
  model TestMixerSlowFast 
    
   // package Medium=Modelica.Media.Water.StandardWater;
   package Medium=Media.LiquidWaterConstant;
    Water.SourceW SourceW1(w0=0.5, h=1e5,
      redeclare package Medium = Medium) 
      annotation(extent=[-102,36; -82,56]);
    Water.SourceW SourceW2(w0=0.5, h=2e5,
      redeclare package Medium = Medium) 
      annotation(extent=[-102,6; -82,26]);
    Water.SinkP SinkP1(p0=1e5, redeclare package Medium = Medium) 
                       annotation(extent=[72,20; 92,40]);
    Water.Mixer Mixer1(
      hstart=1e5,
      V=0.01,
      redeclare package Medium = Medium,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                    annotation(extent=[-68,20; -48,40]);
    annotation(Diagram, experiment(StopTime=50, NumberOfIntervals=5000),
      Documentation(info="<HTML>
<p>This model tests the <tt>Mixer</tt> and <tt>Header</tt> models with different medium models. If an incompressible medium model is used, the fast pressure dynamics is neglected, thus allowing simulation with explicit algorithms and large time steps.
</HTML>",
        revisions="<html>
<ul>
<li><i>24 Sep 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    Water.ValveLin ValveLin1(Kv=1/1e5, redeclare package Medium = Medium) 
                             annotation(extent=[30,20; 50,40]);
    Modelica.Blocks.Sources.Step StepValv(
      height=-.2,
      offset=1,
      startTime=2)    annotation(extent=[6,60; 26,80]);
    Water.PressDrop PressDrop1(
      wnom=1,
      dpnom=100,
      rhonom=1000,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) 
                   annotation(extent=[-38,20; -18,40]);
    Water.Header Header1(
      hstart=1e5,
      V=0.01,
      redeclare package Medium = Medium,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
      annotation(extent=[-8,20; 12,40]);
    Modelica.Blocks.Sources.Step StepEnthalpy(
      height=1e5,
      offset=1e5,
      startTime=4)    annotation(extent=[-100,80; -80,100]);
  equation 
    connect(StepValv.y,       ValveLin1.cmd) 
                                          annotation(points=[27,70; 40,70; 40,
          38], style(color=3, rgbcolor={0,0,255}));
    connect(SourceW1.flange, Mixer1.in1) 
      annotation(points=[-82,46; -74,46; -74,36; -66,36]);
    connect(SourceW2.flange, Mixer1.in2) 
      annotation(points=[-82,16; -72,16; -72,24; -65.9,24]);
    connect(ValveLin1.outlet, SinkP1.flange) 
      annotation(points=[50,30; 72,30]);
    connect(Mixer1.out, PressDrop1.inlet) annotation(points=[-48,30; -38,30]);
    connect(PressDrop1.outlet, Header1.inlet) 
      annotation (points=[-18,30; -8.1,30]);
    connect(Header1.outlet, ValveLin1.inlet) 
      annotation (points=[12,30; 30,30]);
    connect(StepEnthalpy.y,       SourceW1.in_h) annotation (points=[-79,90;
          -68,90; -68,64; -88,64; -88,52], style(color=3, rgbcolor={0,0,255}));
  end TestMixerSlowFast;
  
  model TestPressDrop 
    package Medium=Modelica.Media.Water.StandardWater;
    Water.SourceP SourceP1(p0=3e5) annotation (extent=[-78,60; -58,80]);
    Water.SinkP SinkP1(p0=1e5) annotation (extent=[40,60; 60,80]);
    annotation (Diagram, Documentation(info="<html>
This test model demonstrate four possible ways of setting the friction coefficient for the <tt>PressDrop</tt> model.
<ol>
<li>The friction factor coefficient can be specified directly, by setting <tt>FFtype=0</tt> and the appropriate value to <tt>Kf</tt>.
<li>The friction factor needed to obtain certain conditions can be set by initial equations. In this case, <tt>FFtype=0</tt>, and <tt>Kf=Kf_unknown</tt>, with <tt>Kf_unknown</tt> having a fixed=false attribute. The latter parameter is then determined by an initial equation (e.g. by assigning the initial mass flow rate).
<li>The friction factor can be specified by setting <tt>FFtype=1</tt>, and then by assigning the nominal pressure drop <tt>dpnom</tt> corresponding to the nominal flow rate <tt>wnom</tt> and to the nominal density <tt>rhonom</tt>.
<li>The pressure drop can be specified as a given multiple of the kinetic pressure, by setting <tt>FFtype=2</tt> and assigning the multiplicative coefficient <tt>K</tt>.
</ol>
</html>",
        revisions="<html>
<ul>
    <li><i>18 Nov 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
    First release.
</ul>
</html>"));
    parameter Real Kf_unknown(fixed=false);
    Water.SourceP SourceP3(p0=3e5) annotation (extent=[-78,-14; -58,6]);
    Water.SinkP SinkP3(p0=1e5) annotation (extent=[40,-14; 60,6]);
    Water.PressDrop PressDrop3a(
      redeclare package Medium = Medium,
      wnom=1,
      dpnom=1e5,
      rhonom=1000,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) 
                                         annotation (extent=[-40,-14; -20,6]);
    Water.PressDrop PressDrop3b(
      redeclare package Medium = Medium,
      wnom=1,
      dpnom=1e5,
      rhonom=1000,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) 
                                         annotation (extent=[-2,-14; 18,6]);
    Water.SourceP SourceP4(p0=3e5) annotation (extent=[-78,-54; -58,-34]);
    Water.SinkP SinkP4(p0=1e5) annotation (extent=[40,-54; 60,-34]);
    Water.PressDrop PressDrop4a(
      redeclare package Medium = Medium,
      K=1,
      A=1e-4,
      wnom=1,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kinetic) 
                                         annotation (extent=[-40,-54; -20,-34]);
    Water.PressDrop PressDrop4b(
      redeclare package Medium = Medium,
      wnom=1,
      K=1,
      A=1e-4,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kinetic) 
                                         annotation (extent=[0,-54; 20,-34]);
    Water.SourceP SourceP2(p0=3e5) annotation (extent=[-78,26; -58,46]);
    Water.SinkP SinkP2(p0=1e5) annotation (extent=[40,26; 60,46]);
    Water.PressDrop PressDrop2a(
      redeclare package Medium = Medium,
      wnom=1,
      Kf=Kf_unknown,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf) 
                 annotation (extent=[-40,26; -20,46]);
    Water.PressDrop PressDrop2b(
      redeclare package Medium = Medium,
      wnom=1,
      Kf=Kf_unknown,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf) 
                 annotation (extent=[0,26; 20,46]);
    Water.PressDrop PressDrop1a(
      wnom=1,
      Kf=1e8,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf) 
                                         annotation (extent=[-40,60; -20,80]);
    Water.PressDrop PressDrop1b(redeclare package Medium = Medium,
      wnom=1,
      Kf=1e8,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf) 
      annotation (extent=[0,60; 20,80]);
  initial equation 
    PressDrop2a.inlet.w=1;
  equation 
    connect(SourceP3.flange, PressDrop3a.inlet) 
      annotation (points=[-58,-4; -40,-4]);
    connect(PressDrop3a.outlet, PressDrop3b.inlet) 
      annotation (points=[-20,-4; -2,-4]);
    connect(PressDrop3b.outlet, SinkP3.flange) 
                                              annotation (points=[18,-4; 40,
          -4]);
    connect(SourceP4.flange, PressDrop4a.inlet) 
      annotation (points=[-58,-44; -40,-44]);
    connect(PressDrop4a.outlet, PressDrop4b.inlet) 
      annotation (points=[-20,-44; 0,-44]);
    connect(PressDrop4b.outlet, SinkP4.flange) 
                                              annotation (points=[20,-44; 40,
          -44]);
    connect(SourceP2.flange,PressDrop2a. inlet) 
      annotation (points=[-58,36; -40,36]);
    connect(PressDrop2a.outlet,PressDrop2b. inlet) 
      annotation (points=[-20,36; 0,36]);
    connect(PressDrop2b.outlet,SinkP2. flange) 
                                              annotation (points=[20,36; 40,36]);
    connect(SourceP1.flange, PressDrop1a.inlet) 
      annotation (points=[-58,70; -40,70]);
    connect(PressDrop1a.outlet, PressDrop1b.inlet) 
      annotation (points=[-20,70; 0,70]);
    connect(PressDrop1b.outlet, SinkP1.flange) 
      annotation (points=[20,70; 40,70]);
  end TestPressDrop;
  
  model TestThroughW "Test of the TrhoughW component" 
    Water.SourceP SourceP1 annotation (extent=[-82,10; -62,30]);
    Water.PressDropLin PressDropLin1(R=1e5/1) annotation (extent=[-2,10; 18,30]);
    Water.ThroughW ThroughW1(w0=2) annotation (extent=[-40,10; -20,30]);
    Water.SinkP SinkP1 annotation (extent=[46,10; 66,30]);
    annotation (Diagram);
    Water.SourceP SourceP2 annotation (extent=[-82,-50; -62,-30]);
    Water.PressDropLin PressDropLin2(R=1e5/1) 
      annotation (extent=[-2,-50; 18,-30]);
    Water.ThroughW ThroughW2(w0=2) annotation (extent=[-40,-50; -20,-30]);
    Water.SinkP SinkP2 annotation (extent=[46,-50; 66,-30]);
    Modelica.Blocks.Sources.Step Step1(
      height=1,
      offset=2,
      startTime=0.5) annotation (extent=[-64,-24; -44,-4]);
  equation 
    connect(ThroughW1.outlet, PressDropLin1.inlet) 
      annotation (points=[-20,20; -2,20]);
    connect(SourceP1.flange, ThroughW1.inlet) 
      annotation (points=[-62,20; -40,20]);
    connect(PressDropLin1.outlet, SinkP1.flange) 
      annotation (points=[18,20; 46,20]);
    connect(ThroughW2.outlet, PressDropLin2.inlet) 
      annotation (points=[-20,-40; -2,-40]);
    connect(SourceP2.flange, ThroughW2.inlet) 
      annotation (points=[-62,-40; -40,-40]);
    connect(PressDropLin2.outlet, SinkP2.flange) 
      annotation (points=[18,-40; 46,-40]);
    connect(Step1.y, ThroughW2.in_w0) annotation (points=[-43,-14; -34,-14; -34,
          -34], style(color=74, rgbcolor={0,0,127}));
  end TestThroughW;
  
  model TwoTanks "Test case for Tank and Flow1D" 
    annotation (
      Diagram,
      experiment(StopTime=20, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>This model tests the <tt>Tank</tt> model and the <tt>Flow1D</tt> model in reversing flow conditions.</p>
<p>Simulate the model for 20 s: flow oscillations arise from the combination of inertial effects in the pipe and from the hydraulic capacitance of the tanks. The temperature within the pipe evolves accordingly. </p>
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"),
      experimentSetupOutput);
    ThermoPower.Water.Tank Tank2(
      A=0.1,
      pext=1e5,
      redeclare package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph) 
      annotation (extent=[20, -4; 40, 16]);
    ThermoPower.Water.Flow1D Pipe(
      N=5,
      L=1,
      omega=0.314,
      Dhyd=0.1,
      A=0.01,
      rhonom=1000,
      wnom=40,
      dpnom=20,
      wnf=0.01,
      Cfnom=0.005,
      DynamicMomentum=true,
      redeclare package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom) 
                            annotation (extent=[-20, -10; 0, 10]);
    ThermoPower.Water.Tank Tank1(
      A=0.1,
      pext=1e5,
      redeclare package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph) 
      annotation (extent=[-60, -4; -40, 16]);
    ThermoPower.Water.SourceW Plug1(w0=0) 
      annotation (extent=[-96, -10; -76, 10]);
    ThermoPower.Water.SinkW Plug2(w0=0) annotation (extent=[60, -10; 80, 10]);
  equation 
    connect(Pipe.outfl, Tank2.inlet) annotation (points=[0, 0; 22, 0]);
    connect(Tank1.outlet, Pipe.infl) annotation (points=[-42, 0; -20, 0]);
    connect(Plug1.flange, Tank1.inlet) annotation (points=[-76, 0; -58, 0]);
    connect(Tank2.outlet, Plug2.flange) annotation (points=[38, 0; 60, 0]);
  initial equation 
    Tank1.h = 2e5;
    Tank1.y = 2;
    Tank2.h = 1e5;
    Tank2.y = 1;
  end TwoTanks;
  
  model TestJoin "Test case FlowJoin and FlowSplit" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    constant Real pi=Modelica.Constants.pi;
    ThermoPower.Water.SourceW S1(h=1e5) 
      annotation (extent=[-54, 34; -34, 54]);
    ThermoPower.Water.SourceW S2(h=2e5) 
      annotation (extent=[-54, 8; -34, 28]);
    ThermoPower.Water.SinkW S5(h=2e5) 
      annotation (extent=[40, -58; 60, -38]);
    ThermoPower.Water.SinkW S6(h=3e5) 
      annotation (extent=[40, -90; 60, -70]);
    ThermoPower.Water.FlowJoin FlowJoin1 annotation (extent=[-12, 22; 8, 42]);
    ThermoPower.Water.FlowSplit FlowSplit1 
      annotation (extent=[-4, -70; 16, -50]);
    annotation (
      Diagram,
      experiment(StopTime=4, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>This model tests the <tt>FlowJoin</tt> and the <tt>FlowSplit</tt> models in all the possible flow configurations.
<p>Simulate the model for 4 s and observe the temperatures measured by the different sensors as the flows change.
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.SinkP S3(h=3e5) annotation (extent=[74, 22; 94, 42]);
    ThermoPower.Water.PressDropLin LossP1(R=1e-5) 
      annotation (extent=[40, 22; 60, 42]);
    ThermoPower.Water.PressDropLin LossP2(R=1e-5) 
      annotation (extent=[-54, -70; -34, -50]);
    ThermoPower.Water.SourceP S4(h=1e5) 
      annotation (extent=[-82, -70; -62, -50]);
    Modelica.Blocks.Sources.Sine Sine1(
      amplitude=1,
      freqHz=1,
      phase=pi/2,
      offset=0,
      startTime=0)                     annotation (extent=[-92, 60; -72, 80]);
    Modelica.Blocks.Sources.Sine Sine2(freqHz=0.5,
      amplitude=1,
      phase=pi/2,
      offset=0,
      startTime=0) 
      annotation (extent=[-92, 20; -72, 40]);
    ThermoPower.Water.SensT T1(redeclare package Medium = 
          Medium)              annotation (extent=[-32,36; -12,56]);
    ThermoPower.Water.SensT T2(redeclare package Medium = 
          Medium)              annotation (extent=[-32,14; -12,34]);
    ThermoPower.Water.SensT T3(redeclare package Medium = 
          Medium)              annotation (extent=[12,26; 32,46]);
    ThermoPower.Water.SensT T4(redeclare package Medium = 
          Medium)              annotation (extent=[-30,-66; -10,-46]);
    ThermoPower.Water.SensT T5(redeclare package Medium = 
          Medium)              annotation (extent=[18, -54; 38, -34]);
    ThermoPower.Water.SensT T6(redeclare package Medium = 
          Medium)              annotation (extent=[18, -80; 38, -60]);
    Modelica.Blocks.Sources.Sine Sine3(freqHz=1,
      amplitude=1,
      phase=pi/2,
      offset=0,
      startTime=0) 
      annotation (extent=[8, -20; 28, 0]);
    Modelica.Blocks.Sources.Sine Sine4(freqHz=0.5,
      amplitude=1,
      phase=pi/2,
      offset=0,
      startTime=0) 
      annotation (extent=[-26, -36; -6, -16]);
    ThermoPower.Water.SensP P1 annotation (extent=[-48, -48; -28, -28]);
  equation 
    connect(LossP1.outlet, S3.flange) 
      annotation (points=[60, 32; 74, 32], style(fillPattern=1));
    connect(S4.flange, LossP2.inlet) 
      annotation (points=[-62, -60; -54, -60], style(fillPattern=1));
    connect(Sine1.y,       S1.in_w0) 
      annotation (points=[-71, 70; -48, 50], style(color=3, fillPattern=1));
    connect(Sine2.y,       S2.in_w0) 
      annotation (points=[-71, 30; -48, 24], style(color=3, fillPattern=1));
    connect(S1.flange, T1.inlet) annotation (points=[-34,44; -28,42]);
    connect(T1.outlet, FlowJoin1.in1) annotation (points=[-16,42; -12,42; -12,
          36; -8,36]);
    connect(S2.flange, T2.inlet) annotation (points=[-34,18; -30,18; -30,20;
          -28,20]);
    connect(T2.outlet, FlowJoin1.in2) annotation (points=[-16,20; -8,28]);
    connect(FlowJoin1.out, T3.inlet) annotation (points=[4,32; 16,32]);
    connect(T3.outlet, LossP1.inlet) annotation (points=[28,32; 40,32]);
    connect(LossP2.outlet, T4.inlet) annotation (points=[-34,-60; -26,-60]);
    connect(T4.outlet, FlowSplit1.in1) annotation (points=[-14,-60; 0,-60]);
    connect(T5.outlet, S5.flange) annotation (points=[34, -48; 40, -48]);
    connect(FlowSplit1.out1, T5.inlet) 
      annotation (points=[12, -55.8; 22, -48]);
    connect(FlowSplit1.out2, T6.inlet) annotation (points=[12, -64; 22, -74]);
    connect(T6.outlet, S6.flange) annotation (points=[34, -74; 40, -80]);
    connect(Sine3.y,       S5.in_w0) 
      annotation (points=[29, -10; 46, -10; 46, -42], style(color=3));
    connect(Sine4.y,       S6.in_w0) annotation (points=[-5, -26; 4, -26; 4,
          -56; 36, -56; 46, -66; 46, -74], style(color=3));
    connect(P1.flange, LossP2.outlet) 
      annotation (points=[-38, -42; -36, -42; -36, -60; -34, -60]);
  end TestJoin;
  
  model TestValves "Test cases for valves" 
    ThermoPower.Water.SourceP SourceP1(p0=10e5) 
      annotation (extent=[-102, 30; -82, 50]);
    ThermoPower.Water.SourceP SourceP2(p0=8e5) 
      annotation (extent=[-100, -50; -80, -30]);
    ThermoPower.Water.SinkP SinkP1(p0=1e5) 
      annotation (extent=[64, -4; 84, 16]);
    ThermoPower.Water.ValveLiq V1(
      dpnom=9e5,
      wnom=1.5,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      pnom=10e5,
      Kv=2,
      CvData=ThermoPower.Choices.Valve.CvTypes.Kv) 
                annotation (extent=[-50, 58; -30, 78]);
    ThermoPower.Water.ValveLiq V2(
      dpnom=5e5,
      wnom=1.2,
      pnom=10e5,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      Av=5e-5,
      CvData=ThermoPower.Choices.Valve.CvTypes.Av) 
                annotation (extent=[-38, 26; -18, 46]);
    ThermoPower.Water.ValveLiq V3(
      dpnom=3e5,
      wnom=1.1,
      pnom=10e5,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      Av=5e-5,
      CvData=ThermoPower.Choices.Valve.CvTypes.Av) 
                annotation (extent=[-38,-40; -18,-20]);
    ThermoPower.Water.ValveLiq V4(
      dpnom=8e5,
      wnom=1.3,
      pnom=10e5,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      Cv=2,
      CvData=ThermoPower.Choices.Valve.CvTypes.Cv) 
                annotation (extent=[-38, -78; -18, -58]);
    ThermoPower.Water.ValveLiq V5(
      dpnom=4e5,
      wnom=2,
      pnom=5e5,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      Av=1e-4,
      CvData=ThermoPower.Choices.Valve.CvTypes.Av) 
                annotation (extent=[28, -4; 48, 16]);
    ThermoPower.Water.FlowSplit FlowSplit1 
      annotation (extent=[-72, 30; -52, 50]);
    annotation (
      Diagram,
      experiment(StopTime=4, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>This model tests the <tt>ValveLiq</tt> model zero or reverse flow conditions.
<p>Simulate the model for 4 s. At t = 1 s the V5 valve closes in 1 s, the V2 and V3 valves close in 2 s and the V1 and V4 valves open in 2 s. The flow in valve V3 reverses between t = 1.83 and t = 1.93.
</HTML>",
        revisions="<html>
<ul>
<li><i>18 Nov 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Parameters updated.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    ThermoPower.Water.SinkP SinkP2(p0=1e5) 
      annotation (extent=[-16, 58; 4, 78]);
    ThermoPower.Water.FlowJoin FlowJoin1 annotation (extent=[-4, -4; 16, 16]);
    ThermoPower.Water.FlowSplit FlowSplit2 
      annotation (extent=[-72, -50; -52, -30]);
    ThermoPower.Water.SinkP SinkP3(p0=1e5) 
      annotation (extent=[-2, -78; 18, -58]);
    Modelica.Blocks.Sources.Ramp CloseLoad(
      duration=1,
      height=-0.99,
      offset=1,
      startTime=1)    annotation (extent=[8, 28; 28, 48]);
    Modelica.Blocks.Sources.Ramp OpenRelief(
      duration=2,
      height=1,
      offset=0,
      startTime=1) 
                  annotation (extent=[-92, 74; -72, 94]);
    Modelica.Blocks.Sources.Ramp CloseValves(
      duration=2,
      height=-1,
      offset=1,
      startTime=1) 
                  annotation (extent=[-96, -12; -76, 8]);
  equation 
    connect(SourceP1.flange, FlowSplit1.in1) 
      annotation (points=[-82, 40; -68, 40]);
    connect(FlowSplit1.out1, V1.inlet) 
      annotation (points=[-56, 44.2; -50, 68]);
    connect(V1.outlet, SinkP2.flange) annotation (points=[-30, 68; -16, 68]);
    connect(FlowSplit1.out2, V2.inlet) annotation (points=[-56, 36; -38, 36]);
    connect(V2.outlet, FlowJoin1.in1) annotation (points=[-18, 36; 0, 10]);
    connect(V3.outlet, FlowJoin1.in2) annotation (points=[-18,-30; 0,2]);
    connect(FlowJoin1.out, V5.inlet) annotation (points=[12, 6; 28, 6]);
    connect(V5.outlet, SinkP1.flange) annotation (points=[48, 6; 64, 6]);
    connect(SourceP2.flange, FlowSplit2.in1) 
      annotation (points=[-80, -40; -68, -40]);
    connect(FlowSplit2.out2, V4.inlet) 
      annotation (points=[-56, -44; -38, -68]);
    connect(FlowSplit2.out1, V3.inlet) 
      annotation (points=[-56,-35.8; -38,-30]);
    connect(V4.outlet, SinkP3.flange) annotation (points=[-18, -68; -2, -68]);
    connect(CloseLoad.y,       V5.theta) 
      annotation (points=[29, 38; 38, 38; 38, 14], style(color=3));
    connect(OpenRelief.y,       V1.theta) 
      annotation (points=[-71, 84; -40, 84; -40, 76], style(color=3));
    connect(OpenRelief.y,       V4.theta) annotation (points=[-71, 84; -70, -6;
           -42, -6; -42, -50; -28, -50; -28, -60], style(color=3));
    connect(CloseValves.y,       V3.theta) 
      annotation (points=[-75,-2; -28,-2; -28,-22],    style(color=3));
    connect(CloseValves.y,       V2.theta) annotation (points=[-75, -2; -42,
          -2; -42, 54; -28, 54; -28, 44], style(color=3));
  end TestValves;
  
  model TestValvChoked "Test case for valves in choked flow" 
    ThermoPower.Water.SourceP SourceP1(p0=5e5, h=400e3) 
      annotation (extent=[-56, 28; -36, 48]);
    ThermoPower.Water.SinkP SinkP1 
      annotation (extent=[24, 28; 44, 48]);
    annotation (
      Diagram,
      experiment(StopTime=4, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>This model tests the transition from normal to choked flow for the <tt>ValveLiq</tt> and <tt>ValveVap</tt> models.
<p>Simulate the model for 4 s and observe the flowrate through the two valves. 
</HTML>",
        revisions="<html>
<ul>
<li><i>18 Nov 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Parameters updated.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>

</html>"));
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-42, 64; -22, 84]);
    ThermoPower.Water.ValveLiqChoked ValveLiqChocked(
      dpnom=2e5,
      wnom=1,
      redeclare package Medium = Modelica.Media.Water.StandardWater,
      Av=5e-5,
      CheckValve=false,
      pnom=5e5,
      CvData=ThermoPower.Choices.Valve.CvTypes.Av) 
                        annotation (extent=[-20, 28; 0, 48]);
    Modelica.Blocks.Sources.Sine Sine1(
      amplitude=2.5e5,
      freqHz=0.5,
      offset=3e5,
      phase=3.14159,
      startTime=1)  annotation (extent=[2, 64; 22, 84]);
    ThermoPower.Water.SourceP SourceP2(p0=60e5, h=2.9e6) 
      annotation (extent=[-62, -54; -42, -34]);
    ThermoPower.Water.SinkP SinkP2(p0=1e5) 
      annotation (extent=[40, -54; 60, -34]);
    ThermoPower.Water.ValveVap ValveVap(
      dpnom=30e5,
      pnom=60e5,
      wnom=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      Av=1e-4,
      CheckValve=false,
      CvData=ThermoPower.Choices.Valve.CvTypes.Av) 
                annotation (extent=[-20, -54; 0, -34]);
    Modelica.Blocks.Sources.Constant Constant2 
      annotation (extent=[-52, -14; -32, 6]);
    Modelica.Blocks.Sources.Sine Sine2(
      amplitude=49.5e5,
      freqHz=0.5,
      offset=50e5,
      phase=3.14159,
      startTime=1)  annotation (extent=[12, -14; 32, 6]);
  equation 
    connect(ValveLiqChocked.outlet, SinkP1.flange) 
      annotation (points=[0, 38; 24, 38]);
    connect(SourceP1.flange, ValveLiqChocked.inlet) 
      annotation (points=[-36, 38; -20, 38]);
    connect(Constant1.y, ValveLiqChocked.theta) 
      annotation (points=[-21, 74; -10, 74; -10, 46], style(color=3));
    connect(Sine1.y,       SinkP1.in_p0) 
      annotation (points=[23, 74; 30, 74; 30, 46.8], style(color=3));
    connect(SourceP2.flange, ValveVap.inlet) 
      annotation (points=[-42, -44; -20, -44]);
    connect(Constant2.y,       ValveVap.theta) 
      annotation (points=[-31, -4; -10, -4; -10, -36], style(color=3));
    connect(ValveVap.outlet, SinkP2.flange) 
      annotation (points=[0, -44; 40, -44]);
    connect(Sine2.y,       SinkP2.in_p0) 
      annotation (points=[33, -4; 46, -4; 46, -35.2], style(color=3));
  end TestValvChoked;
  
  model ValveZeroFlow "Test case for valves with zero flowrate" 
    ThermoPower.Water.SourceP Source(p0=5e5) 
      annotation (extent=[-62,-10; -42,10]);
    ThermoPower.Water.SinkP Sink(p0=1e5) annotation (extent=[66, -10; 86, 10]);
    ThermoPower.Water.ValveLiq V1(
      dpnom=2e5,
      wnom=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      pnom=5e5,
      Av=1e-4,
      CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) 
                annotation (extent=[-30, -10; -10, 10]);
    ThermoPower.Water.ValveLiq V2(
      dpnom=1e5,
      wnom=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      pnom=3e5,
      Av=1e-4,
      CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) 
                annotation (extent=[4, -10; 24, 10]);
    annotation (
      Diagram,
      experiment(StopTime=1, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>This model tests the <tt>ValveLiq</tt> model in zero flowrate conditions.</p>
<p>The flow coefficients are determined by initial equations, assuming a flow rate of 1 kg/s and equal sizing for the three valves.
<p>Simulate the model for 1 s and observe the flowrates through the valves and the inlet and outlet pressure of V2.
</HTML>",
        revisions="<html>
<ul>
<li><i>18 Nov 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Parameters updated.</li>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    Modelica.Blocks.Sources.Step Cmd1(
      height=0,
      offset=1,
      startTime=0)   annotation (extent=[-48, 28; -28, 48]);
    Modelica.Blocks.Sources.Step Cmd2(
      height=-.5,
      offset=1,
      startTime=0.3)   annotation (extent=[-14,26; 6,46]);
    ThermoPower.Water.ValveLiq V3(
      dpnom=1e5,
      wnom=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      pnom=2e5,
      Av=1e-4,
      CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) 
                annotation (extent=[34, -10; 54, 10]);
    Modelica.Blocks.Sources.Step Cmd3(
      height=-1,
      offset=1,
      startTime=0.6)   annotation (extent=[18, 28; 38, 48]);
  equation 
    connect(Source.flange, V1.inlet) annotation (points=[-42,0; -30,0]);
    connect(V1.outlet, V2.inlet) annotation (points=[-10, 0; 4, 0]);
    connect(Cmd2.y,       V2.theta) 
      annotation (points=[7,36; 7,23; 14,23; 14,8],     style(color=3));
    connect(Cmd1.y,       V1.theta) annotation (points=[-27, 38; -27, 24; -20,
           24; -20, 8], style(color=3));
    connect(V2.outlet, V3.inlet) annotation (points=[24, 0; 34, 0]);
    connect(Sink.flange, V3.outlet) annotation (points=[66, 0; 54, 0]);
    connect(Cmd3.y,       V3.theta) 
      annotation (points=[39, 38; 39, 24; 44, 24; 44, 8], style(color=3));
  end ValveZeroFlow;
  
  model ValveZeroFlow2 "Test case for valves with zero flowrate" 
    Modelica.Blocks.Sources.Step Cmd1(
      height=0,
      offset=1,
      startTime=0)   annotation (extent=[-42,28; -22,48]);
    ThermoPower.Water.Tank Tank1(A=0.1,
    redeclare package Medium = Modelica.Media.Water.StandardWater) 
      annotation (extent=[-48, -10; -28, 10]);
    ThermoPower.Water.Tank Tank2(A=0.1,
    redeclare package Medium = Modelica.Media.Water.StandardWater) 
                                        annotation (extent=[18, -10; 38, 10]);
    ThermoPower.Water.ValveLiq Valve(
      dpnom=1e4,
      wnom=10,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      Av=3.5e-3,
      pnom=1e5,
      CvData=ThermoPower.Choices.Valve.CvTypes.Av) 
                annotation (extent=[-16,-16; 4,4]);
    annotation (
      Diagram,
      experiment(StopTime=20, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>This model tests the <tt>ValveLiq</tt> model with small or zero flow and the <tt>Tank</tt> model.</p>
<p>Simulate for 20 s. After 10 s the flowrate goes to zero, as the two levels become equal. </p>
</HTML>",
        revisions="<html>
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>

</html>"));
    ThermoPower.Water.SourceW SourceW1(w0=0) 
      annotation (extent=[-74, -16; -54, 4]);
    ThermoPower.Water.SinkW SinkW1(w0=0) annotation (extent=[54, -16; 74, 4]);
  equation 
    connect(Tank1.outlet, Valve.inlet) annotation (points=[-30,-6; -16,-6]);
    connect(Valve.outlet, Tank2.inlet) annotation (points=[4,-6; 20,-6]);
    connect(Cmd1.y,       Valve.theta) 
      annotation (points=[-21,38; -6,38; -6,2],             style(color=3));
    connect(Tank2.outlet, SinkW1.flange) annotation (points=[36, -6; 54, -6]);
    connect(SourceW1.flange, Tank1.inlet) 
      annotation (points=[-54, -6; -46, -6]);
  initial equation 
    Tank1.y = 2;
    Tank2.y = 1;
  end ValveZeroFlow2;
  
  model TestFlow1Da "Test case for Flow1D" 
    package Medium=Modelica.Media.Water.WaterIF97_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=10;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=2e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5;
    // initial outlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5;
    
    //height of enthalpy step 
    parameter Modelica.SIunits.SpecificEnthalpy deltah=41800;
    
    //height of power step
    parameter Modelica.SIunits.EnergyFlowRate W=41800*whex;
    
    // transport time delay
    Time tau;
    ThermoPower.Water.SourceW Fluid_Source(
      p0=phex,
      h=hinhex,
      w0=whex) annotation (extent=[-76, -2; -56, 18]);
    ThermoPower.Water.SinkP Fluid_Sink(p0=phex/2) 
      annotation (extent=[64, -2; 84, 18]);
    ThermoPower.Water.ValveLin Valve(Kv=3e-6) 
      annotation (extent=[12, -2; 32, 18]);
    ThermoPower.Water.Flow1D hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      DynamicMomentum=false,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
    redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-20, -2; 0, 18]);
    annotation (
      Diagram,
      experiment(StopTime=80, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D</tt> (fluid side of a heat exchanger, finite volumes).<br>
This model represent the fluid side of a heat exchanger with an applied external heat flow. The operating fluid is liquid water.<br> 
During the simulation, the inlet specific enthalpy, heat flux and mass flow rate are changed:
<ul>
    <li>t=0 s, Step variation of the specific enthalpy of the fluid entering the heat exchanger. The outlet temperature should undergo a step change 10 s later.</li>
    <li>t=30 s, Step variation of the thermal flow entering the heat exchanger lateral surface. The outlet temperature should undergo a ramp change lasting 10 s</li> 
    <li>t=50 s, Step variation of the mass flow rate entering the heat exchanger. Again, the outlet temperature should undergo a ramp change lasting 10s</li> 
</ul>
<p>
Simulation Interval = [0...80] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.SensT T_in(
    redeclare package Medium = Medium) 
                                 annotation (extent=[-48, 2; -28, 22]);
    ThermoPower.Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-20, 22; 0, 42]);
    Modelica.Blocks.Sources.Step MassFlowRate(
      height=-0.02,
      offset=whex,
      startTime=50)   annotation (extent=[-94, 28; -78, 38]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[18, 26; 26, 42], rotation=-90);
    Modelica.Blocks.Sources.Step InSpecEnthalpy(height=deltah, offset=hinhex,
      startTime=1) annotation (extent=[-88, 52; -72, 62]);
    Modelica.Blocks.Sources.Step ExtPower(height=W, startTime=30) 
      annotation (extent=[-36, 50; -20, 60]);
    ThermoPower.Water.SensT T_out(
    redeclare package Medium = Medium) 
                                  annotation (extent=[38, 2; 58, 22]);
  equation 
    tau = sum(hex.rho)/Nnodes*Lhex*Ahex/whex;
    connect(hex.outfl, Valve.inlet) annotation (points=[0, 8; 12, 8]);
    connect(T_in.outlet, hex.infl) annotation (points=[-32, 8; -20, 8]);
    connect(Fluid_Source.flange, T_in.inlet) 
      annotation (points=[-56, 8; -44, 8]);
    connect(HeatSource1D1.wall, hex.wall) 
      annotation (points=[-10, 29; -10, 13], style(color=45));
    connect(Constant1.y,       Valve.cmd) 
      annotation (points=[22, 25.2; 22, 16], style(color=3));
    connect(MassFlowRate.y,       Fluid_Source.in_w0) 
      annotation (points=[-77.2, 33; -70, 33; -70, 14], style(color=3));
    connect(InSpecEnthalpy.y,       Fluid_Source.in_h) 
      annotation (points=[-71.2, 57; -62, 57; -62, 14], style(color=3));
    connect(ExtPower.y,       HeatSource1D1.power) 
      annotation (points=[-19.2, 55; -10, 55; -10, 36], style(color=3));
    connect(T_out.outlet, Fluid_Sink.flange) 
      annotation (points=[54, 8; 64, 8]);
    connect(Valve.outlet, T_out.inlet) annotation (points=[32, 8; 42, 8]);
  end TestFlow1Da;
  
  model TestFlow1Db "Test case for Flow1D" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=200;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=3e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hs=1e5;
    ThermoPower.Water.Flow1D hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hs,
      hstartout=hs,
      pstartin=phex,
      pstartout=phex,
    redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-26, 0; -6, 20]);
    ThermoPower.Thermal.TempSource1D TempSource(N=Nnodes) 
      annotation (extent=[-26, 46; -6, 66]);
    annotation (
      Diagram,
      experiment(StopTime=200, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D</tt> (fluid side of a heat exchanger, finite volumes). <br>
This model represent the fluid side of a heat exchanger with convective exchange with an external source of given temperature. The operating fluid is liquid water.<br> 
During experiment the external (fixed) temperature changes: 
<ul>
    <li>t=20 s, Step variation of the external temperature. Heat exchanger outlet temperature should vary accordingly to the transfer function (K1/(1+s*tau1))*(1-exp(-K2-s*tau2)), where the parameters K1, K2, tau1, tau1 depend on exchanger geometry, the fluid heat transfer coefficient and the operating conditions.</li>
</ul>
</p>
</p>
<p>
Simulation Interval = [0...200] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.ValveLin ValveLin1(Kv=2*whex/phex) 
      annotation (extent=[8, 0; 28, 20]);
    ThermoPower.Water.SourceW FluidSource(
      w0=whex,
      p0=phex,
      h=hs) annotation (extent=[-74, 0; -54, 20]);
    ThermoPower.Water.SinkP FluidSink(p0=phex/2, h=hs) 
      annotation (extent=[56, 0; 76, 20]);
    Modelica.Blocks.Sources.Step Temperature(
      height=10,
      offset=297,
      startTime=20)   annotation (extent=[-66, 58; -46, 78]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-8, 78; 10, 90]);
    ThermoPower.Thermal.ConvHT ConvEx(N=Nnodes, gamma=400) 
      annotation (extent=[-26, 26; -6, 46]);
    ThermoPower.Water.SensT T_in(
    redeclare package Medium = Medium) 
                                 annotation (extent=[-50, 4; -30, 24]);
    ThermoPower.Water.SensT T_out(
    redeclare package Medium = Medium) 
                                  annotation (extent=[32, 4; 52, 24]);
  equation 
    connect(hex.outfl, ValveLin1.inlet) annotation (points=[-6, 10; 8, 10]);
    connect(Temperature.y,       TempSource.temperature) 
      annotation (points=[-45, 68; -16, 68; -16, 60], style(color=3));
    connect(Constant1.y,       ValveLin1.cmd) 
      annotation (points=[10.9, 84; 18, 84; 18, 18], style(color=3));
    connect(ConvEx.side1, TempSource.wall) 
      annotation (points=[-16, 39; -16, 53], style(color=45));
    connect(hex.wall, ConvEx.side2) 
      annotation (points=[-16, 15; -16, 32.9], style(color=45));
    connect(T_in.inlet, FluidSource.flange) 
      annotation (points=[-46, 10; -54, 10]);
    connect(T_in.outlet, hex.infl) annotation (points=[-34, 10; -26, 10]);
    connect(ValveLin1.outlet, T_out.inlet) 
      annotation (points=[28, 10; 36, 10]);
    connect(T_out.outlet, FluidSink.flange) 
      annotation (points=[48, 10; 56, 10]);
  end TestFlow1Db;
  
  model TestFlow1Dc "Test case for Flow1D" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=200;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=1e5;
    // initial specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hs=1e5;
    ThermoPower.Water.Flow1D hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hs,
      hstartout=hs,
      DynamicMomentum=false,
      pstartin=2*phex,
      pstartout=2*phex,
    redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[-24, 2; -4, 22]);
    annotation (
      Diagram,
      experiment(StopTime=1000, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D</tt> (fluid side of a heat exchanger, finite volumes). <br>
This model is designed to simulate the flow reversal througth the heat exchanger. The operating fluid is liquid water; the heat flux entering the heat exchanger is set to zero. <br>
During the simulation, flow reversal is achieved:
<ul>
        <li>t=500 s, Negative ramp variation (duration = 20 s) of the mass flow rate trough the heat exchanger. The final mass flow rate has the same magnitude and opposite direction with respect to the initial one.</li>
</ul>
</p>
<p>
Simulation Interval = [0...1000] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
        <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
        First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.ValveLin ValveLin1(Kv=2*whex/phex) 
      annotation (extent=[34, 2; 54, 22]);
    ThermoPower.Water.SinkP SinkP1(h=hs, p0=4*phex) 
      annotation (extent=[70, 2; 90, 22]);
    ThermoPower.Water.SourceW SourceW1(
      w0=whex,
      G=0,
      p0=2*phex,
      h=2*hs) annotation (extent=[-80, 2; -60, 22]);
    Modelica.Blocks.Sources.Ramp Ramp1(
      duration=20,
      height=-2*whex,
      offset=whex,
      startTime=500)   annotation (extent=[-102, 28; -82, 48]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[18, 52; 38, 72]);
    ThermoPower.Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-24, 20; -4, 40]);
    Modelica.Blocks.Sources.Constant Constant2(k=0) 
      annotation (extent=[-36, 52; -24, 60]);
    ThermoPower.Water.SensT T_in(redeclare package Medium = 
          Medium)                annotation (extent=[-52, 6; -32, 26]);
    ThermoPower.Water.SensT T_out(redeclare package Medium = 
          Medium)                 annotation (extent=[4, 6; 24, 26]);
  equation 
    connect(ValveLin1.outlet, SinkP1.flange) 
      annotation (points=[54, 12; 70, 12]);
    connect(Ramp1.y,       SourceW1.in_w0) 
      annotation (points=[-81, 38; -74, 38; -74, 18], style(color=3));
    connect(Constant1.y,       ValveLin1.cmd) 
      annotation (points=[39, 62; 44, 62; 44, 20], style(color=3));
    connect(HeatSource1D1.wall, hex.wall) 
      annotation (points=[-14, 27; -14, 17], style(color=45));
    connect(Constant2.y,       HeatSource1D1.power) 
      annotation (points=[-23.4, 56; -14, 56; -14, 34], style(color=3));
    connect(SourceW1.flange, T_in.inlet) 
      annotation (points=[-60, 12; -48, 12]);
    connect(T_in.outlet, hex.infl) annotation (points=[-36, 12; -24, 12]);
    connect(T_out.outlet, ValveLin1.inlet) 
      annotation (points=[20, 12; 34, 12]);
    connect(hex.outfl, T_out.inlet) annotation (points=[-4, 12; 8, 12]);
  end TestFlow1Dc;
  
  model TestFlow1Dd "Test case for Flow1D" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=10;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=1e-2;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=0.2e5;
    // initial specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hs=3e6;
    // Time constant
    Time tau;
    
    ThermoPower.Water.Flow1D hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      pstartin=phex,
      pstartout=phex,
      hstartin=hs,
      hstartout=hs,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                    annotation (extent=[-28, -10; -8, 10]);
    ThermoPower.Water.SourceW MassFlowRateSource(
      w0=whex,
      h=hs) annotation (extent=[-60, -10; -40, 10]);
    ThermoPower.Water.SinkP FluidSink(
      p0=0,
      R=100,
      h=3e6) annotation (extent=[78, -10; 98, 10]);
    ThermoPower.Water.ValveLin ValveLin1(Kv=1e-7) 
      annotation (extent=[34,-10; 54,10]);
    annotation (
      Diagram,
      experiment(StopTime=2, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D</tt> (fluid side of a heat exchanger, finite volumes).<br>
This model is designed to the test compressibility effects. The operating fluid is superheated vapour; the heat flow entering the heat exchanger is set to zero. <br>
During simulation mass flow rate changes:
<ul>
        <li>t=2 s, Step variation of the inlet mass flow rate. The pressure increases with a first order dynamics, the tube actually behaving like a pressurized tank.</li>
</ul>
</p>
</p>
<p>
Simulation Interval = [0...2] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</HTML>"));
    Modelica.Blocks.Sources.Step MassFlowRateStep(
      height=whex/10,
      offset=whex,
      startTime=0.5)   annotation (extent=[-86, 22; -66, 42]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[44, 30; 56, 38]);
    ThermoPower.Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-28, 10; -8, 30]);
    Modelica.Blocks.Sources.Constant ExtPower(k=0) 
      annotation (extent=[-40, 36; -28, 44]);
    Water.SensP SensP annotation (extent=[8, 16; 28, 36]);
  equation 
    // RC constant of equivalent circuit
    tau = (1/ValveLin1.Kv)*(Ahex*Lhex/1200^2);
    connect(ValveLin1.inlet, hex.outfl) annotation (points=[34,0; -8,0]);
    connect(ValveLin1.outlet, FluidSink.flange) 
      annotation (points=[54,0; 78,0]);
    connect(MassFlowRateSource.flange, hex.infl) 
      annotation (points=[-40, 0; -28, 0]);
    connect(MassFlowRateStep.y,       MassFlowRateSource.in_w0) 
      annotation (points=[-65, 32; -54, 32; -54, 6], style(color=3));
    connect(HeatSource1D1.wall, hex.wall) 
      annotation (points=[-18, 17; -18, 5], style(color=45));
    connect(ExtPower.y,       HeatSource1D1.power) 
      annotation (points=[-27.4, 40; -18, 40; -18, 24], style(color=3));
  initial equation 
    der(hex.p) = 0;
  equation 
    connect(Constant1.y,       ValveLin1.cmd) annotation (points=[56.6,34; 68,
          34; 68,20; 44,20; 44,8],        style(color=3));
    connect(SensP.flange, ValveLin1.inlet) 
      annotation (points=[18,22; 34,22; 34,0]);
  end TestFlow1Dd;
  
  model TestFlow1De "Test case for Flow1D" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=200;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=3e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5;
    // initial outlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5;
    ThermoPower.Water.Flow1D hexA(
      N=Nnodes,
      Nt=1,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-14,-28; 6,-8]);
    ThermoPower.Water.SinkP SideA_FluidSink 
      annotation (extent=[62, -28; 82, -8]);
    ThermoPower.Water.SinkP SideB_FluidSink 
      annotation (extent=[-74, 42; -94, 62]);
    ThermoPower.Water.SourceW SideA_MassFlowRate(
      w0=whex,
      p0=3e5)     annotation (extent=[-76, -28; -56, -8]);
    ThermoPower.Water.ValveLin ValveLin1(Kv=whex/(2e5)) 
      annotation (extent=[14, -28; 34, -8]);
    ThermoPower.Water.ValveLin ValveLin2(Kv=whex/(2e5)) 
      annotation (extent=[-24, 42; -44, 62]);
    ThermoPower.Water.Flow1D hexB(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[4,62; -16,42]);
    annotation (
      Diagram,
      experiment(StopTime=900, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D</tt> (fluid side of a heat exchanger, model uses finite volumes).<br>
This model represent the two fluid sides of a heat exchanger in counterflow configuration. The operating fluid is liquid water.<br> 
The mass flow rate during the experiment and initial conditions are the same for the two sides. <br>
During the simulation, the inlet specific enthalpy for hexA (\"hot side\") is changed:
<ul>
    <li>t=50 s, Step variation of the specific enthalpy of the fluid entering hexA .</li>
</ul>
The outlet temperature of the hot side starts changing after the fluid transport time delay, while the outlet temperature of the cold side starts changing immediately.
</p>
</p>
<p>
Simulation Interval = [0...900] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.SensT SensT_A_in(redeclare package Medium = 
          Medium)                      annotation (extent=[-46, -24; -26, -4]);
    Modelica.Blocks.Sources.Step SideA_InSpecEnth(
      height=1e5,
      offset=1e5,
      startTime=50)   annotation (extent=[-90, 0; -70, 20]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-56, 72; -40, 80]);
    Modelica.Blocks.Sources.Constant Constant2 
      annotation (extent=[8, -2; 20, 6]);
    ThermoPower.Water.SensT SensT_B_in(redeclare package Medium = 
          Medium)                      annotation (extent=[40, 46; 20, 66]);
    ThermoPower.Water.SourceW SideB_MassFlowRate(w0=whex, p0=3e5) 
      annotation (extent=[72, 42; 52, 62]);
    ThermoPower.Thermal.ConvHT ConvExCF(N=Nnodes, gamma=400) 
      annotation (extent=[-16,2; 4,22]);
    ThermoPower.Water.SensT SensT_A_out(redeclare package Medium = 
          Medium)                       annotation (extent=[38, -24; 58, -4]);
    ThermoPower.Water.SensT SensT_B_out(redeclare package Medium = 
          Medium)                       annotation (extent=[-48, 46; -68, 66]);
    Thermal.CounterCurrent CounterCurrent1(N=Nnodes) 
      annotation (extent=[-16,16; 4,36]);
  equation 
    connect(SideA_MassFlowRate.flange, SensT_A_in.inlet) 
      annotation (points=[-56, -18; -42, -18]);
    connect(SensT_A_in.outlet, hexA.infl) 
      annotation (points=[-30,-18; -14,-18]);
    connect(hexA.outfl, ValveLin1.inlet) 
      annotation (points=[6,-18; 14,-18]);
    connect(ValveLin2.inlet, hexB.outfl) 
      annotation (points=[-24,52; -16,52]);
    connect(SideA_InSpecEnth.y,       SideA_MassFlowRate.in_h) 
      annotation (points=[-69, 10; -62, 10; -62, -12], style(color=3));
    connect(Constant1.y,       ValveLin2.cmd) 
      annotation (points=[-39.2, 76; -34, 76; -34, 60], style(color=3));
    connect(Constant2.y,       ValveLin1.cmd) 
      annotation (points=[20.6, 2; 24, 2; 24, -10], style(color=3));
    connect(SensT_B_in.outlet, hexB.infl) annotation (points=[24,52; 4,52]);
    connect(SideB_MassFlowRate.flange, SensT_B_in.inlet) 
      annotation (points=[52, 52; 36, 52]);
    connect(ConvExCF.side2, hexA.wall) 
      annotation (points=[-6,8.9; -6,-13; -4,-13],
                                              style(color=45));
    connect(ValveLin1.outlet, SensT_A_out.inlet) 
      annotation (points=[34, -18; 42, -18]);
    connect(SensT_A_out.outlet, SideA_FluidSink.flange) 
      annotation (points=[54, -18; 62, -18]);
    connect(SensT_B_out.outlet, SideB_FluidSink.flange) 
      annotation (points=[-64, 52; -74, 52]);
    connect(SensT_B_out.inlet, ValveLin2.outlet) 
      annotation (points=[-52, 52; -44, 52]);
    connect(CounterCurrent1.side1, hexB.wall) annotation (points=[-6,29; -5,29;
          -5,47; -6,47], style(color=45, rgbcolor={255,127,0}));
    connect(ConvExCF.side1, CounterCurrent1.side2) annotation (points=[-6,15;
          -6,22.9], style(color=45, rgbcolor={255,127,0}));
  end TestFlow1De;
  
  model TestFlow1Df "Test case for Flow1D" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=200;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=3e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5;
    // initial outlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5;
    ThermoPower.Water.Flow1D hexA(
      N=Nnodes,
      Nt=1,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-22, -30; -2, -10]);
    ThermoPower.Thermal.ConvHT ConvHTB(N=Nnodes, gamma=400) 
      annotation (extent=[-22,26; -2,46]);
    ThermoPower.Thermal.ConvHT ConvHTA(N=Nnodes, gamma=400) 
      annotation (extent=[-22,-14; -2,6]);
    ThermoPower.Water.SinkP SideA_FluidSink 
      annotation (extent=[56, -30; 76, -10]);
    ThermoPower.Water.SinkP SideB_FluidSink 
      annotation (extent=[-74, 40; -94, 60]);
    ThermoPower.Water.SourceW SideA_MassFlowRate(
      w0=whex,
      p0=3e5)     annotation (extent=[-82, -30; -62, -10]);
    ThermoPower.Water.ValveLin ValveLin1(Kv=whex/(2e5)) 
      annotation (extent=[8, -30; 28, -10]);
    ThermoPower.Water.ValveLin ValveLin2(Kv=whex/(2e5)) 
      annotation (extent=[-30, 40; -50, 60]);
    ThermoPower.Water.Flow1D hexB(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-2, 60; -22, 40]);
    ThermoPower.Thermal.MetalTube MetalWall(
      N=Nnodes,
      L=Lhex,
      lambda=20,
      rint=rhex,
      rext=rhex + 1e-3,
      rhomcm=4.9e6,
      Tstart1=297,
      TstartN=297,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-22,18; -2,-2]);
    annotation (
      Diagram,
      experiment(StopTime=900, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D</tt> (fluid side of a heat exchanger, model uses finite volumes).<br>
This model represent the two fluid sides of a heat exchanger in counterflow configuration. The two sides are divided by a metal wall. The operating fluid is liquid water. The mass flow rate during the experiment and initial conditions are the same for the two sides. <br>
During the simulation, the inlet specific enthalpy for hexA (\"hot side\") is changed:
<ul>
    <li>t=50 s, Step variation of the specific enthalpy of the fluid entering hexA .</li>
</ul>
The outlet temperature of the hot side changes after the fluid transport time delay and the first order delay due to the wall's thermal inertia. The outlet temperature of the cold side starts changing after the thermal inertia delay. </p>
<p>
Simulation Interval = [0...900] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.SensT SensT_A_in(redeclare package Medium = 
          Medium)                      annotation (extent=[-52, -26; -32, -6]);
    Modelica.Blocks.Sources.Step SideA_InSpecEnth(
      height=1e5,
      offset=1e5,
      startTime=50)   annotation (extent=[-96, -2; -76, 18]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-74, 86; -58, 94]);
    Modelica.Blocks.Sources.Constant Constant2 
      annotation (extent=[0, -6; 14, 0]);
    ThermoPower.Water.SensT SensT_B_in(redeclare package Medium = 
          Medium)                      annotation (extent=[24, 44; 4, 64]);
    ThermoPower.Water.SourceW SourceW1(w0=whex, p0=3e5) 
      annotation (extent=[50, 40; 30, 60]);
    ThermoPower.Water.SensT SensT_A_out(redeclare package Medium = 
          Medium)                       annotation (extent=[32, -26; 52, -6]);
    ThermoPower.Water.SensT SensT_B_out(redeclare package Medium = 
          Medium)                       annotation (extent=[-52, 44; -72, 64]);
    Thermal.CounterCurrent CounterCurrent1(N=Nnodes) 
      annotation (extent=[-22,14; -2,34]);
  equation 
    connect(SideA_MassFlowRate.flange, SensT_A_in.inlet) 
      annotation (points=[-62, -20; -48, -20]);
    connect(SensT_A_in.outlet, hexA.infl) 
      annotation (points=[-36, -20; -22, -20]);
    connect(hexA.outfl, ValveLin1.inlet) 
      annotation (points=[-2, -20; 8, -20]);
    connect(ValveLin2.inlet, hexB.outfl) 
      annotation (points=[-30, 50; -22, 50]);
    connect(ConvHTB.side1, hexB.wall) 
      annotation (points=[-12,39; -12,45],   style(color=45));
    connect(hexA.wall, ConvHTA.side2) 
      annotation (points=[-12,-15; -12,-7.1],   style(color=45));
    connect(SideA_InSpecEnth.y,       SideA_MassFlowRate.in_h) 
      annotation (points=[-75, 8; -68, 8; -68, -14], style(color=3));
    connect(Constant1.y,       ValveLin2.cmd) 
      annotation (points=[-57.2, 90; -40, 90; -40, 58], style(color=3));
    connect(Constant2.y,       ValveLin1.cmd) 
      annotation (points=[14.7,-3; 18,-3; 18,-12],    style(color=3));
    connect(SensT_B_in.outlet, hexB.infl) annotation (points=[8, 50; -2, 50]);
    connect(SourceW1.flange, SensT_B_in.inlet) 
      annotation (points=[30, 50; 20, 50]);
    connect(MetalWall.int, ConvHTA.side1) 
      annotation (points=[-12,5; -12,-1],  style(color=45));
    connect(SensT_A_out.inlet, ValveLin1.outlet) 
      annotation (points=[36, -20; 28, -20]);
    connect(SensT_A_out.outlet, SideA_FluidSink.flange) 
      annotation (points=[48, -20; 56, -20]);
    connect(SensT_B_out.outlet, SideB_FluidSink.flange) 
      annotation (points=[-68, 50; -74, 50]);
    connect(SensT_B_out.inlet, ValveLin2.outlet) 
      annotation (points=[-56, 50; -50, 50]);
    connect(ConvHTB.side2, CounterCurrent1.side1) annotation (points=[-12,32.9;
          -12,27], style(color=45, rgbcolor={255,127,0}));
    connect(MetalWall.ext, CounterCurrent1.side2) annotation (points=[-12,11.1;
          -12,20.9], style(color=45, rgbcolor={255,127,0}));
  end TestFlow1Df;
  
  model TestFlow1DSlowFast "Test case for Flow1D" 
    // package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    package Medium=Media.LiquidWaterConstant;
    
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=10;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=2e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5;
    // initial outlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5;
    
    //height of enthalpy step 
    parameter Modelica.SIunits.SpecificEnthalpy deltah=41800;
    
    //height of power step
    parameter Modelica.SIunits.EnergyFlowRate W=41800*whex;
    
    // transport time delay
    Time tau;
    ThermoPower.Water.SourceW Fluid_Source(
      p0=phex,
      h=hinhex,
      w0=whex,
      redeclare package Medium = Medium) 
               annotation (extent=[-76, -2; -56, 18]);
    ThermoPower.Water.SinkP Fluid_Sink(p0=phex/2, redeclare package Medium = 
          Medium) 
      annotation (extent=[64, -2; 84, 18]);
    ThermoPower.Water.ValveLin Valve(Kv=3e-6, redeclare package Medium = Medium) 
      annotation (extent=[12, -2; 32, 18]);
    ThermoPower.Water.Flow1D hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      DynamicMomentum=false,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-20,-2; 0,18]);
    annotation (
      Diagram,
      experiment(StopTime=80, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D</tt> (fluid side of a heat exchanger, finite volumes).<br>
This model represent the fluid side of a heat exchanger with an applied external heat flow. The operating fluid is liquid water.<p> 
Different media models can be employed; incompressible medium models avoid fast pressure states.<p>
During the simulation, the inlet specific enthalpy, heat flux and mass flow rate are changed:
<ul>
    <li>t=0 s, Step variation of the specific enthalpy of the fluid entering the heat exchanger. The outlet temperature should undergo a step change 10 s later.</li>
    <li>t=30 s, Step variation of the thermal flow entering the heat exchanger lateral surface. The outlet temperature should undergo a ramp change lasting 10 s</li> 
    <li>t=50 s, Step variation of the mass flow rate entering the heat exchanger. Again, the outlet temperature should undergo a ramp change lasting 10s</li> 
</ul>
<p>
Simulation Interval = [0...80] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
</HTML>",
        revisions="<html>
<ul>
    <li><i>24 Sep 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
    Adapted to multiple media models.
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</html>"));
    ThermoPower.Water.SensT T_in(redeclare package Medium = Medium) 
                                 annotation (extent=[-48, 2; -28, 22]);
    ThermoPower.Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-20, 22; 0, 42]);
    Modelica.Blocks.Sources.Step MassFlowRate(
      height=-0.02,
      offset=whex,
      startTime=50)   annotation (extent=[-94, 28; -78, 38]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[18, 26; 26, 42], rotation=-90);
    Modelica.Blocks.Sources.Step InSpecEnthalpy(height=deltah, offset=hinhex,
      startTime=1) annotation (extent=[-88, 52; -72, 62]);
    Modelica.Blocks.Sources.Step ExtPower(height=W, startTime=30) 
      annotation (extent=[-36, 50; -20, 60]);
    ThermoPower.Water.SensT T_out(redeclare package Medium = Medium) 
                                  annotation (extent=[38, 2; 58, 22]);
  equation 
    tau = sum(hex.rho)/Nnodes*Lhex*Ahex/whex;
    connect(hex.outfl, Valve.inlet) annotation (points=[0,8; 12,8]);
    connect(T_in.outlet, hex.infl) annotation (points=[-32,8; -20,8]);
    connect(Fluid_Source.flange, T_in.inlet) 
      annotation (points=[-56, 8; -44, 8]);
    connect(HeatSource1D1.wall, hex.wall) 
      annotation (points=[-10,29; -10,13],   style(color=45));
    connect(Constant1.y,       Valve.cmd) 
      annotation (points=[22, 25.2; 22, 16], style(color=3));
    connect(MassFlowRate.y,       Fluid_Source.in_w0) 
      annotation (points=[-77.2, 33; -70, 33; -70, 14], style(color=3));
    connect(InSpecEnthalpy.y,       Fluid_Source.in_h) 
      annotation (points=[-71.2, 57; -62, 57; -62, 14], style(color=3));
    connect(ExtPower.y,       HeatSource1D1.power) 
      annotation (points=[-19.2, 55; -10, 55; -10, 36], style(color=3));
    connect(T_out.outlet, Fluid_Sink.flange) 
      annotation (points=[54, 8; 64, 8]);
    connect(Valve.outlet, T_out.inlet) annotation (points=[32, 8; 42, 8]);
  end TestFlow1DSlowFast;
  
  model TestFlow1DDB "Test case for Flow1D" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=200;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=3e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hs=1e5;
    Water.Flow1DDB hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hs,
      hstartout=hs,
      pstartin=phex,
      pstartout=phex,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState)          annotation (extent=[-26, 0; -6, 20]);
    Thermal.TempSource1D TempSource(N=Nnodes) 
      annotation (extent=[-26, 46; -6, 66]);
    annotation (
      Diagram,
      experiment(StopTime=200, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D</tt> (fluid side of a heat exchanger, finite volumes). <br>
This model represent the fluid side of a heat exchanger with convective exchange with an external source of given temperature. The operating fluid is liquid water.<br> 
During experiment the external (fixed) temperature changes: 
<ul>
    <li>t=20 s, Step variation of the external temperature. Heat exchanger outlet temperature should vary accordingly to the transfer function (K1/(1+s*tau1))*(1-exp(-K2-s*tau2)), where the parameters K1, K2, tau1, tau1 depend on exchanger geometry, the fluid heat transfer coefficient and the operating conditions.</li>
</ul>
</p>
</p>
<p>
Simulation Interval = [0...200] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.ValveLin ValveLin1(Kv=2*whex/phex) 
      annotation (extent=[8, 0; 28, 20]);
    ThermoPower.Water.SourceW FluidSource(
      w0=whex,
      p0=phex,
      h=hs) annotation (extent=[-74, 0; -54, 20]);
    ThermoPower.Water.SinkP FluidSink(p0=phex/2, h=hs) 
      annotation (extent=[56, 0; 76, 20]);
    Modelica.Blocks.Sources.Step Temperature(
      height=10,
      offset=297,
      startTime=20)   annotation (extent=[-66, 58; -46, 78]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-8, 78; 10, 90]);
    ThermoPower.Water.SensT T_in(
    redeclare package Medium = Medium) 
                                 annotation (extent=[-50, 4; -30, 24]);
    ThermoPower.Water.SensT T_out(
    redeclare package Medium = Medium) 
                                  annotation (extent=[32, 4; 52, 24]);
    ThermoPower.Thermal.ConvHT_htc ConvHTe_htc1(N=Nnodes) 
      annotation (extent=[-26,42; -6,22]);
  equation 
    connect(hex.outfl, ValveLin1.inlet) annotation (points=[-6, 10; 8, 10]);
    connect(Temperature.y,       TempSource.temperature) 
      annotation (points=[-45, 68; -16, 68; -16, 60], style(color=3));
    connect(Constant1.y,       ValveLin1.cmd) 
      annotation (points=[10.9, 84; 18, 84; 18, 18], style(color=3));
    connect(T_in.inlet, FluidSource.flange) 
      annotation (points=[-46, 10; -54, 10]);
    connect(T_in.outlet, hex.infl) annotation (points=[-34, 10; -26, 10]);
    connect(ValveLin1.outlet, T_out.inlet) 
      annotation (points=[28, 10; 36, 10]);
    connect(T_out.outlet, FluidSink.flange) 
      annotation (points=[48, 10; 56, 10]);
    connect(ConvHTe_htc1.fluidside, hex.wall) annotation (points=[-16,29; -16,
          15],     style(color=3, rgbcolor={0,0,255}));
    connect(ConvHTe_htc1.otherside, TempSource.wall) annotation (points=[-16,35;
          -16,53],         style(color=45, rgbcolor={255,127,0}));
  end TestFlow1DDB;
  
  model TestFlow1DfemA "Test case for Flow1Dfem" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=10;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.3;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=2e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5;
    // initial outlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5;
    
    //height of enthalpy step 
    parameter Modelica.SIunits.SpecificEnthalpy deltah=41800;
    
    //height of power step
    parameter Modelica.SIunits.EnergyFlowRate W=41800*whex;
    
    ThermoPower.Water.SourceW Fluid_Source(
      p0=phex,
      h=hinhex,
      w0=whex) annotation (extent=[-76, -2; -56, 18]);
    ThermoPower.Water.SinkP Fluid_Sink(p0=phex/2) 
      annotation (extent=[64, -2; 84, 18]);
    ThermoPower.Water.ValveLin Valve(Kv=3e-6) 
      annotation (extent=[12, -2; 32, 18]);
    ThermoPower.Water.Flow1Dfem hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      DynamicMomentum=false,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
    redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-20, -2; 0, 18]);
    annotation (
      Diagram,
      experiment(StopTime=80, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1Dfem</tt> (fluid side of a heat exchanger, finite element method).<br>
This model represent the fluid side of a heat exchanger with an applied external heat flow. The operating fluid is liquid water.<br> 
During the simulation, the inlet specific enthalpy, heat flux and mass flow rate are changed:
<ul>
    <li>t=0 s, Step variation of the specific enthalpy of the fluid entering the heat exchanger. The outlet temperature should undergo a step change 10 s later.</li>
    <li>t=30 s, Step variation of the thermal flow entering the heat exchanger lateral surface. The outlet temperature should undergo a ramp change lasting 10 s</li> 
    <li>t=50 s, Step variation of the mass flow rate entering the heat exchanger. Again, the outlet temperature should undergo a ramp change lasting 10s</li> 
</ul>
<p>
Simulation Interval = [0...80] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.SensT T_in(
    redeclare package Medium = Medium) 
                                 annotation (extent=[-48, 2; -28, 22]);
    ThermoPower.Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-20, 22; 0, 42]);
    Modelica.Blocks.Sources.Step MassFlowRate(
      height=-0.02,
      offset=whex,
      startTime=50)   annotation (extent=[-94, 28; -78, 38]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[18, 26; 26, 42], rotation=-90);
    Modelica.Blocks.Sources.Step InSpecEnthalpy(height=deltah, offset=hinhex,
      startTime=1) annotation (extent=[-88, 52; -72, 62]);
    Modelica.Blocks.Sources.Step ExtPower(height=W, startTime=30) 
      annotation (extent=[-36, 50; -20, 60]);
    ThermoPower.Water.SensT T_out(
    redeclare package Medium = Medium) 
                                  annotation (extent=[38, 2; 58, 22]);
  equation 
    connect(hex.outfl, Valve.inlet) annotation (points=[0, 8; 12, 8]);
    connect(T_in.outlet, hex.infl) annotation (points=[-32, 8; -20, 8]);
    connect(Fluid_Source.flange, T_in.inlet) 
      annotation (points=[-56, 8; -44, 8]);
    connect(HeatSource1D1.wall, hex.wall) 
      annotation (points=[-10, 29; -10, 13], style(color=45));
    connect(Constant1.y,       Valve.cmd) 
      annotation (points=[22, 25.2; 22, 16], style(color=3));
    connect(MassFlowRate.y,       Fluid_Source.in_w0) 
      annotation (points=[-77.2, 33; -70, 33; -70, 14], style(color=3));
    connect(InSpecEnthalpy.y,       Fluid_Source.in_h) 
      annotation (points=[-71.2, 57; -62, 57; -62, 14], style(color=3));
    connect(ExtPower.y,       HeatSource1D1.power) 
      annotation (points=[-19.2, 55; -10, 55; -10, 36], style(color=3));
    connect(T_out.outlet, Fluid_Sink.flange) 
      annotation (points=[54, 8; 64, 8]);
    connect(Valve.outlet, T_out.inlet) annotation (points=[32, 8; 42, 8]);
  end TestFlow1DfemA;
  
  model TestFlow1DfemB "Test case for Flow1Dfem" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=200;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=3e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hs=1e5;
    ThermoPower.Water.Flow1Dfem hex(
      redeclare package Medium=Medium,
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hs,
      hstartout=hs,
      pstartin=phex,
      pstartout=phex,
      alpha=1,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
               annotation (extent=[-26, 0; -6, 20]);
    ThermoPower.Thermal.TempSource1D TempSource(N=Nnodes) 
      annotation (extent=[-26, 46; -6, 66]);
    annotation (
      Diagram,
      experiment(StopTime=200, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1Dfem</tt> (fluid side of a heat exchanger, finite element method). <br>
This model represent the fluid side of a heat exchanger with convective exchange with an external source at a given temperature.<br>
The operating fluid is liquid water.<br> 
During the experiment the external (fixed) temperature changes: 
<ul>
        <li>t=20 s, Step variation of the external temperature. Heat exchanger outlet temperature should vary accordingly to the transfer function (K1/(1+s*tau1))*(1-exp(-K2-s*tau2)), where the parameters K1, K2, tau1, tau1 depend on exchanger geometry, the fluid heat transfer coefficient and operating conditions.</li>
</ul>
</p>
</p>
<p>
Simulation Interval = [0...200] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
        <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
        First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.ValveLin ValveLin1(Kv=2*whex/phex) 
      annotation (extent=[8, 0; 28, 20]);
    ThermoPower.Water.SourceW FluidSource(
      w0=whex,
      p0=phex,
      h=hs) annotation (extent=[-74, 0; -54, 20]);
    ThermoPower.Water.SinkP FluidSink(p0=phex/2, h=hs) 
      annotation (extent=[56, 0; 76, 20]);
    Modelica.Blocks.Sources.Step Temperature(
      height=10,
      offset=297,
      startTime=20)   annotation (extent=[-66, 58; -46, 78]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-8, 78; 10, 90]);
    ThermoPower.Thermal.ConvHT ConvEx(N=Nnodes, gamma=400) 
      annotation (extent=[-26, 26; -6, 46]);
    ThermoPower.Water.SensT T_in(redeclare package Medium=Medium) 
                                 annotation (extent=[-50, 4; -30, 24]);
    ThermoPower.Water.SensT T_out(redeclare package Medium=Medium) 
                                  annotation (extent=[32, 4; 52, 24]);
  equation 
    connect(hex.outfl, ValveLin1.inlet) annotation (points=[-6, 10; 8, 10]);
    connect(Temperature.y,       TempSource.temperature) 
      annotation (points=[-45, 68; -16, 68; -16, 60], style(color=3));
    connect(Constant1.y,       ValveLin1.cmd) 
      annotation (points=[10.9, 84; 18, 84; 18, 18], style(color=3));
    connect(ConvEx.side1, TempSource.wall) 
      annotation (points=[-16, 39; -16, 53], style(color=45));
    connect(hex.wall, ConvEx.side2) 
      annotation (points=[-16, 15; -16, 32.9], style(color=45));
    connect(T_in.inlet, FluidSource.flange) 
      annotation (points=[-46, 10; -54, 10]);
    connect(T_in.outlet, hex.infl) annotation (points=[-34, 10; -26, 10]);
    connect(ValveLin1.outlet, T_out.inlet) 
      annotation (points=[28, 10; 36, 10]);
    connect(T_out.outlet, FluidSink.flange) 
      annotation (points=[48, 10; 56, 10]);
  end TestFlow1DfemB;
  
  model TestFlow1DfemC "Test case for Flow1Dfem" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=200;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.3;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=1e5;
    // initial specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hs=1e5;
    ThermoPower.Water.Flow1Dfem hex(
      redeclare package Medium=Medium,
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hs,
      hstartout=hs,
      DynamicMomentum=false,
      pstartin=2*phex,
      pstartout=2*phex,
      alpha=1,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
               annotation (extent=[-24,2; -4,22]);
    annotation (
      Diagram,
      experiment(StopTime=1000, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1Dfem</tt> (fluid side of a heat exchanger, finite element method). <br>
This model is designed to simulate the flow reversal througth the heat exchanger. The operating fluid is liquid water; the heat flux entering the heat exchanger is set to zero. <br>
During the simulation, flow reversal is achieved:
<ul>
        <li>t=500 s, Negative ramp variation (duration = 20 s) of the mass flow rate trough the heat exchanger. The final mass flow rate has the same magnitude and opposite direction with respect to the initial one.</li>
</ul>
</p>
</p>
<p>
Simulation Interval = [0...1000] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
        <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
        First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.ValveLin ValveLin1(Kv=2*whex/phex) 
      annotation (extent=[36, 2; 56, 22]);
    ThermoPower.Water.SinkP SinkP1(h=hs, p0=4*phex) 
      annotation (extent=[64, 2; 84, 22]);
    ThermoPower.Water.SourceW SourceW1(
      w0=whex,
      G=0,
      p0=2*phex,
      h=2*hs) annotation (extent=[-76, 2; -56, 22]);
    Modelica.Blocks.Sources.Ramp Ramp1(
      duration=20,
      height=-2*whex,
      offset=whex,
      startTime=500)   annotation (extent=[-100,26; -80,46]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-8, 52; 12, 72]);
    ThermoPower.Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-24, 20; -4, 40]);
    Modelica.Blocks.Sources.Constant Constant2(k=0) 
      annotation (extent=[-36, 52; -24, 60]);
    ThermoPower.Water.SensT T_in(redeclare package Medium=Medium) 
                                 annotation (extent=[-52, 6; -32, 26]);
    ThermoPower.Water.SensT T_out(redeclare package Medium=Medium) 
                                  annotation (extent=[6, 6; 26, 26]);
  equation 
    connect(ValveLin1.outlet, SinkP1.flange) 
      annotation (points=[56, 12; 64, 12]);
    connect(Ramp1.y,       SourceW1.in_w0) 
      annotation (points=[-79,36; -70,36; -70,18],    style(color=3));
    connect(Constant1.y,       ValveLin1.cmd) 
      annotation (points=[13, 62; 46, 62; 46, 20], style(color=3));
    connect(HeatSource1D1.wall, hex.wall) 
      annotation (points=[-14,27; -14,17],   style(color=45));
    connect(Constant2.y,       HeatSource1D1.power) 
      annotation (points=[-23.4, 56; -14, 56; -14, 34], style(color=3));
    connect(SourceW1.flange, T_in.inlet) 
      annotation (points=[-56, 12; -48, 12]);
    connect(T_in.outlet, hex.infl) annotation (points=[-36,12; -24,12]);
    connect(hex.outfl, T_out.inlet) annotation (points=[-4,12; 10,12]);
    connect(T_out.outlet, ValveLin1.inlet) 
      annotation (points=[22, 12; 36, 12]);
  end TestFlow1DfemC;
  
  model TestFlow1DfemD "Test case for Flow1Dfem" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=10;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=1e-2;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=0.2e5;
    // initial specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hs=3e6;
    ThermoPower.Water.Flow1Dfem hex(
      redeclare package Medium=Medium,
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      pstartin=phex,
      pstartout=phex,
      alpha=1,
      hstartin=hs,
      hstartout=hs,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                    annotation (extent=[-14,-10; 6,10]);
    ThermoPower.Water.SourceW MassFlowRateSource(
      w0=whex,
      h=hs) annotation (extent=[-60, -10; -40, 10]);
    ThermoPower.Water.SinkP FluidSink(
      p0=0,
      R=100,
      h=3e6) annotation (extent=[76, -10; 96, 10]);
    ThermoPower.Water.ValveLin ValveLin1(Kv=1e-7) 
      annotation (extent=[40, -10; 60, 10]);
    annotation (
      Diagram,
      experiment(StopTime=2, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1Dfem</tt> (fluid side of a heat exchanger, finite element method).<br>
This model is designed to the test compressibility effects. The operating fluid is superheated vapour; the heat flow entering the heat exchanger is set to zero. <br>
During simulation mass flow rate changes:
<ul>
        <li>t=2 s, Step variation of the inlet mass flow rate. The pressure increases with a first order dynamics, the tube actually behaving like a pressurized tank.</li>
</ul>
</p>
</p>
<p>
Simulation Interval = [0...2] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
        <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
        First release.</li>
</ul>
</HTML>"));
    Modelica.Blocks.Sources.Step MassFlowRateStep(
      height=whex/10,
      offset=whex,
      startTime=0.5)   annotation (extent=[-86, 22; -66, 42]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[28, 30; 40, 38]);
    ThermoPower.Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-16, 10; 4, 30]);
    Modelica.Blocks.Sources.Constant ExtPower(k=0) 
      annotation (extent=[-28, 36; -16, 44]);
    Water.SensP SensP annotation (extent=[12, 4; 32, 24]);
  equation 
    connect(ValveLin1.inlet, hex.outfl) annotation (points=[40,0; 6,0]);
    connect(ValveLin1.outlet, FluidSink.flange) 
      annotation (points=[60, 0; 76, 0]);
    connect(MassFlowRateSource.flange, hex.infl) 
      annotation (points=[-40,0; -14,0]);
    connect(MassFlowRateStep.y,       MassFlowRateSource.in_w0) 
      annotation (points=[-65, 32; -54, 32; -54, 6], style(color=3));
    connect(Constant1.y,       ValveLin1.cmd) 
      annotation (points=[40.6, 34; 50, 34; 50, 8], style(color=3));
    connect(HeatSource1D1.wall, hex.wall) 
      annotation (points=[-6,17; -6,5; -4,5],
                                          style(color=45));
    connect(ExtPower.y,       HeatSource1D1.power) 
      annotation (points=[-15.4, 40; -6, 40; -6, 24], style(color=3));
  initial equation 
    der(hex.p) = 0;
    der(hex.h) = zeros(hex.N);
  equation 
    connect(SensP.flange, ValveLin1.inlet) 
      annotation (points=[22, 10; 40, 10; 40, 0]);
  end TestFlow1DfemD;
  
  model TestFlow1DfemE "Test case for Flow1Dfem" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=21;
    // total length
    parameter Modelica.SIunits.Length Lhex=200;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=3e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5;
    // initial outlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5;
    ThermoPower.Water.Flow1Dfem hexA(
      redeclare package Medium=Medium,
      N=Nnodes,
      Nt=1,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-18, -28; 2, -8]);
    ThermoPower.Water.SinkP SideA_FluidSink 
      annotation (extent=[62, -28; 82, -8]);
    ThermoPower.Water.SinkP SideB_FluidSink 
      annotation (extent=[-68, 42; -88, 62]);
    ThermoPower.Water.SourceW SideA_MassFlowRate(
      w0=whex,
      p0=3e5)     annotation (extent=[-76, -28; -56, -8]);
    ThermoPower.Water.ValveLin ValveLin1(Kv=whex/(2e5)) 
      annotation (extent=[14, -28; 34, -8]);
    ThermoPower.Water.ValveLin ValveLin2(Kv=whex/(2e5)) 
      annotation (extent=[-24, 42; -44, 62]);
    ThermoPower.Water.Flow1Dfem hexB(
      redeclare package Medium=Medium,
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[4, 62; -16, 42]);
    annotation (
      Diagram,
      experiment(StopTime=900, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1Dfem</tt> (fluid side of a heat exchanger, finite element method).<br>
This model represent the two fluid sides of a heat exchanger in counterflow configuration. The operating fluid is liquid water.<br> 
The mass flow rate during the experiment and initial conditions are the same for the two sides. <br>
During the simulation, the inlet specific enthalpy for hexA (\"hot side\") is changed:
<ul>
    <li>t=50 s, Step variation of the specific enthalpy of the fluid entering hexA .</li>
</ul>
The outlet temperature of the hot side starts changing after the fluid transport time delay, while the outlet temperature of the cold side starts changing immediately.
</p>
</p>
<p>
Simulation Interval = [0...900] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
</HTML>", revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       New heat transfer components.</li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>

</html>"));
    ThermoPower.Water.SensT SensT_A_in(redeclare package Medium=Medium) 
                                       annotation (extent=[-46, -24; -26, -4]);
    Modelica.Blocks.Sources.Step SideA_InSpecEnth(
      height=1e5,
      offset=1e5,
      startTime=50)   annotation (extent=[-90, 0; -70, 20]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-68, 72; -52, 80]);
    Modelica.Blocks.Sources.Constant Constant2 
      annotation (extent=[8, 0; 20, 8]);
    ThermoPower.Water.SensT SensT_B_in(redeclare package Medium=Medium) 
                                       annotation (extent=[46, 46; 26, 66]);
    ThermoPower.Water.SourceW SideB_MassFlowRate(w0=whex, p0=3e5) 
      annotation (extent=[72, 42; 52, 62]);
    ThermoPower.Thermal.ConvHT ConvExCF(N=Nnodes, gamma=400) 
      annotation (extent=[-18,2; 2,22]);
    ThermoPower.Water.SensT SensT_A_out(redeclare package Medium=Medium) 
                                        annotation (extent=[38, -24; 58, -4]);
    ThermoPower.Water.SensT SensT_B_out(redeclare package Medium=Medium) 
                                        annotation (extent=[-46, 46; -66, 66]);
    Thermal.CounterCurrent CounterCurrent1(N=Nnodes) 
      annotation (extent=[-18,20; 2,40]);
  equation 
    connect(SideA_MassFlowRate.flange, SensT_A_in.inlet) 
      annotation (points=[-56, -18; -42, -18]);
    connect(SensT_A_in.outlet, hexA.infl) 
      annotation (points=[-30, -18; -18, -18]);
    connect(hexA.outfl, ValveLin1.inlet) 
      annotation (points=[2, -18; 14, -18]);
    connect(ValveLin2.inlet, hexB.outfl) 
      annotation (points=[-24, 52; -16, 52]);
    connect(SideA_InSpecEnth.y,       SideA_MassFlowRate.in_h) 
      annotation (points=[-69, 10; -62, 10; -62, -12], style(color=3));
    connect(Constant1.y,       ValveLin2.cmd) 
      annotation (points=[-51.2, 76; -34, 76; -34, 60], style(color=3));
    connect(Constant2.y,       ValveLin1.cmd) 
      annotation (points=[20.6, 4; 24, 4; 24, -10], style(color=3));
    connect(SensT_B_in.outlet, hexB.infl) annotation (points=[30, 52; 4, 52]);
    connect(SideB_MassFlowRate.flange, SensT_B_in.inlet) 
      annotation (points=[52, 52; 42, 52]);
    connect(ValveLin1.outlet, SensT_A_out.inlet) 
      annotation (points=[34, -18; 42, -18]);
    connect(SensT_A_out.outlet, SideA_FluidSink.flange) 
      annotation (points=[54, -18; 62, -18]);
    connect(SideB_FluidSink.flange, SensT_B_out.outlet) 
      annotation (points=[-68, 52; -62, 52]);
    connect(SensT_B_out.inlet, ValveLin2.outlet) 
      annotation (points=[-50, 52; -44, 52]);
    connect(ConvExCF.side2, hexA.wall) annotation (points=[-8,8.9; -8,-13],
        style(color=45, rgbcolor={255,127,0}));
    connect(hexB.wall, CounterCurrent1.side1) annotation (points=[-6,47; -6,33;
          -8,33], style(color=45, rgbcolor={255,127,0}));
    connect(CounterCurrent1.side2, ConvExCF.side1) annotation (points=[-8,26.9;
          -8,26.9; -8,15], style(color=45, rgbcolor={255,127,0}));
  end TestFlow1DfemE;
  
  model TestFlow1DfemF "Test case for Flow1Dfem" 
    package Medium=Modelica.Media.Water.WaterIF97OnePhase_ph;
    // number of Nodes
    parameter Integer Nnodes=20;
    // total length
    parameter Modelica.SIunits.Length Lhex=200;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dihex=0.02;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dihex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction coefficient
    parameter Real Cfhex=0.005;
    // nominal (and initial) mass flow rate
    parameter Modelica.SIunits.MassFlowRate whex=0.31;
    // initial pressure
    parameter Modelica.SIunits.Pressure phex=3e5;
    // initial inlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5;
    // initial outlet specific enthalpy 
    parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5;
    ThermoPower.Water.Flow1Dfem hexA(
      redeclare package Medium=Medium,
      N=Nnodes,
      Nt=1,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-22, -30; -2, -10]);
    ThermoPower.Thermal.ConvHT ConvHTc1(N=Nnodes, gamma=400) 
      annotation (extent=[-22,26; -2,46]);
    ThermoPower.Thermal.ConvHT ConvHTe1(N=Nnodes, gamma=400) 
      annotation (extent=[-22, -12; -2, 8]);
    ThermoPower.Water.SinkP SideA_FluidSink 
      annotation (extent=[56, -30; 76, -10]);
    ThermoPower.Water.SinkP SideB_FluidSink 
      annotation (extent=[-74, 40; -94, 60]);
    ThermoPower.Water.SourceW SideA_MassFlowRate(
      w0=whex,
      p0=3e5)     annotation (extent=[-82, -30; -62, -10]);
    ThermoPower.Water.ValveLin ValveLin1(Kv=whex/(2e5)) 
      annotation (extent=[8, -30; 28, -10]);
    ThermoPower.Water.ValveLin ValveLin2(Kv=whex/(2e5)) 
      annotation (extent=[-30, 40; -50, 60]);
    ThermoPower.Water.Flow1Dfem hexB(
      redeclare package Medium=Medium,
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dihex,
      A=Ahex,
      wnom=whex,
      Cfnom=Cfhex,
      HydraulicCapacitance=2,
      hstartin=hinhex,
      hstartout=houthex,
      pstartin=phex,
      pstartout=phex,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-2, 60; -22, 40]);
    ThermoPower.Thermal.MetalTube MetalWall(
      N=Nnodes,
      L=Lhex,
      lambda=20,
      rint=rhex,
      rext=rhex + 1e-3,
      rhomcm=4.9e6,
      Tstart1=297,
      TstartN=297,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-22,20; -2,0]);
    annotation (
      Diagram,
      experiment(StopTime=900, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1Dfem</tt> (fluid side of a heat exchanger, finite element method).<br>
This model represent the two fluid sides of a heat exchanger in counterflow configuration. The two sides are divided by a metal wall. The operating fluid is liquid water. The mass flow rate during the experiment and initial conditions are the same for the two sides. <br>
During the simulation, the inlet specific enthalpy for hexA (\"hot side\") is changed:
<ul>
    <li>t=50 s, Step variation of the specific enthalpy of the fluid entering hexA .</li>
</ul>
The outlet temperature of the hot side changes after the fluid transport time delay and the first order delay due to the wall's thermal inertia. The outlet temperature of the cold side starts changing after the thermal inertia delay. </p>
<p>
Simulation Interval = [0...900] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</HTML>", revisions="<html>
<ul>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       New heat transfer components.</li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>

</html>"));
    ThermoPower.Water.SensT SensT_A_in(redeclare package Medium=Medium) 
                                       annotation (extent=[-52, -26; -32, -6]);
    Modelica.Blocks.Sources.Step SideA_InSpecEnth(
      height=1e5,
      offset=1e5,
      startTime=50)   annotation (extent=[-96, -2; -76, 18]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[-74, 86; -58, 94]);
    Modelica.Blocks.Sources.Constant Constant2 
      annotation (extent=[0, -6; 14, 0]);
    ThermoPower.Water.SensT SensT_B_in(redeclare package Medium=Medium) 
                                       annotation (extent=[24, 44; 4, 64]);
    ThermoPower.Water.SourceW SourceW1(w0=whex, p0=3e5) 
      annotation (extent=[50, 40; 30, 60]);
    ThermoPower.Water.SensT SensT_A_out(redeclare package Medium=Medium) 
                                        annotation (extent=[32, -26; 52, -6]);
    ThermoPower.Water.SensT SensT_B_out(redeclare package Medium=Medium) 
                                        annotation (extent=[-52, 44; -72, 64]);
    Thermal.CounterCurrent CounterCurrent1(N=Nnodes) 
      annotation (extent=[-22,14; -2,34]);
  equation 
    connect(SideA_MassFlowRate.flange, SensT_A_in.inlet) 
      annotation (points=[-62, -20; -48, -20]);
    connect(SensT_A_in.outlet, hexA.infl) 
      annotation (points=[-36, -20; -22, -20]);
    connect(hexA.outfl, ValveLin1.inlet) 
      annotation (points=[-2, -20; 8, -20]);
    connect(ValveLin2.inlet, hexB.outfl) 
      annotation (points=[-30, 50; -22, 50]);
    connect(ConvHTc1.side1, hexB.wall) 
      annotation (points=[-12,39; -12,45],   style(color=45));
    connect(hexA.wall, ConvHTe1.side2) 
      annotation (points=[-12, -15; -12, -5.1], style(color=45));
    connect(SideA_InSpecEnth.y,       SideA_MassFlowRate.in_h) 
      annotation (points=[-75, 8; -68, 8; -68, -14], style(color=3));
    connect(Constant1.y,       ValveLin2.cmd) 
      annotation (points=[-57.2, 90; -40, 90; -40, 58], style(color=3));
    connect(Constant2.y,       ValveLin1.cmd) 
      annotation (points=[14.7,-3; 18,-3; 18,-12],    style(color=3));
    connect(SensT_B_in.outlet, hexB.infl) annotation (points=[8, 50; -2, 50]);
    connect(SourceW1.flange, SensT_B_in.inlet) 
      annotation (points=[30, 50; 20, 50]);
    connect(MetalWall.int, ConvHTe1.side1) 
      annotation (points=[-12,7; -12,1],   style(color=45));
    connect(SensT_A_out.inlet, ValveLin1.outlet) 
      annotation (points=[36, -20; 28, -20]);
    connect(SensT_A_out.outlet, SideA_FluidSink.flange) 
      annotation (points=[48, -20; 56, -20]);
    connect(SensT_B_out.outlet, SideB_FluidSink.flange) 
      annotation (points=[-68, 50; -74, 50]);
    connect(SensT_B_out.inlet, ValveLin2.outlet) 
      annotation (points=[-56, 50; -50, 50]);
    connect(ConvHTc1.side2, CounterCurrent1.side1) annotation (points=[-12,32.9;
          -12,27], style(color=45, rgbcolor={255,127,0}));
    connect(CounterCurrent1.side2, MetalWall.ext) annotation (points=[-12,20.9;
          -12,13.1], style(color=45, rgbcolor={255,127,0}));
  end TestFlow1DfemF;
  
  model TestFlow1D2ph "Test case for Flow1D2ph" 
    package Medium=Modelica.Media.Water.WaterIF97_ph;
    import Modelica.Constants.*;
    // number of Nodes
    parameter Integer Nnodes=10;
    // total length
    parameter Length Lhex=10;
    // internal diameter
    parameter Diameter Dhex=0.06;
    // wall thickness
    parameter Thickness thhex=0;
    // internal radius
    parameter Radius rhex=Dhex/2;
    // internal perimeter
    parameter Length omegahex=Dhex;
    // internal cross section
    parameter Area Ahex=pi*rhex^2;
    // friction factor
    parameter Real Cfhex=0.005;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.03,
        width=0.59,
        height=0.55),
      Diagram,
      experiment(
        StopTime=100,
        NumberOfIntervals=2000,
        Tolerance=1e-009),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2ph</tt> (fluid side of a heat exchanger, finite volumes, two-phase flow).<br>
This model represent the fluid side of a once-through boiler with an applied external heat flow. The operating fluid is water.<br> 
During the simulation, the inlet specific enthalpy and heat flux are changed, while maintaining the inlet flowrate constant:
<ul>
    <li>t=0 s. The initial state of the water is subcooled liquid.
    <li>t=10 s. Ramp increase of the applied heat flow. The water starts boiling and is blown out of the outlet, whose pressure and flowrate undergo a transient increase. At the end of the transient the outlet fluid is in superheated vapour state.</li>
    <li>t=30 s. Step increase of the inlet enthalpy</li> 
    <li>t=50 s. The heat flow is reduced to zero in 2s. The vapour collapses, causing a suddend decrease in the outlet pressure and flowrate, until the liquid fills again the entire boiler. At that instant, the pressure and flowrate rise again rapidly to the inlet values.</li> 
</ul>
<p>
Simulation Interval = [0...150] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</HTML>"),
      experimentSetupOutput(equdistant=false));
    ThermoPower.Test.Flow1D2ph_check hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dhex,
      A=Ahex,
      Cfnom=0.005,
      DynamicMomentum=false,
      hstartin=6e5,
      hstartout=6e5,
      pstartin=10e5,
      pstartout=10e5,
      wnom=1,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState,
      redeclare package Medium = Medium) 
                   annotation (extent=[-30,-10; -10,10]);
    ThermoPower.Water.ValveLin valve(Kv=1/10e5, redeclare package Medium = 
          Medium) 
      annotation (extent=[18, -10; 38, 10]);
    ThermoPower.Thermal.HeatSource1D heatSource(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-30, 8; -10, 28]);
    ThermoPower.Water.SinkP Sink(p0=1e5, redeclare package Medium = Medium) 
                                         annotation (extent=[52, -10; 72, 10]);
    Modelica.Blocks.Sources.Step hIn(
      height=1e5,
      offset=6e5,
      startTime=50)   annotation (extent=[-100, 10; -80, 30]);
    Modelica.Blocks.Sources.Ramp extPower(
      height=30e5,
      startTime=10,
      duration=30)   annotation (extent=[-80, 40; -60, 60]);
    ThermoPower.Water.SourceW Source(w0=1, redeclare package Medium = Medium) 
      annotation (extent=[-68, -10; -48, 10]);
    Modelica.Blocks.Sources.Ramp extPower2(
      duration=10,
      height=-30e5,
      startTime=70) annotation (extent=[-80, 74; -60, 94]);
    Modelica.Blocks.Math.Add Add1 annotation (extent=[-38, 54; -18, 74]);
    Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1) 
      annotation (extent=[16, 48; 36, 68]);
  equation 
    connect(heatSource.wall, hex.wall) 
      annotation (points=[-20,15; -20,5],   style(color=45));
    connect(hex.outfl, valve.inlet) annotation (points=[-10,0; 18,0]);
    connect(valve.outlet, Sink.flange) annotation (points=[38, 0; 52, 0]);
    connect(Source.flange, hex.infl) annotation (points=[-48,0; -30,0]);
    connect(extPower2.y,Add1.u1) 
      annotation (points=[-59, 84; -40, 70], style(color=3));
    connect(extPower.y,Add1.u2) 
      annotation (points=[-59, 50; -40, 58], style(color=3));
    connect(Add1.y,       heatSource.power) annotation (points=[-17, 64; -4,
          64; -4, 40; -20, 40; -20, 22], style(color=3));
    connect(xValve.y,       valve.cmd) annotation (points=[37, 58; 52, 58; 52,
           28; 28, 28; 28, 8], style(color=3));
    connect(hIn.y,       Source.in_h) 
      annotation (points=[-79, 20; -54, 20; -54, 6], style(color=3));
  end TestFlow1D2ph;
  
  model TestFlow1D2phDB "Test case for Flow1D2phDB" 
    package Medium=Modelica.Media.Water.WaterIF97_ph;
    import Modelica.Constants.*;
    // number of Nodes
    parameter Integer Nnodes=8;
    // total length
    parameter Length Lhex=20;
    // internal diameter
    parameter Diameter Dhex=0.01;
    // wall thickness
    parameter Thickness thhex=0.002;
    // internal radius
    parameter Radius rhex=Dhex/2;
    // internal perimeter
    parameter Length omegahex=pi*Dhex;
    // internal cross section
    parameter Area Ahex=pi*rhex^2;
    // friction factor
    parameter Real Cfhex=0.005;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.03,
        width=0.59,
        height=0.55),
      Diagram,
      experiment(
        StopTime=1000,
        NumberOfIntervals=5000,
        Tolerance=1e-008),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2phDB</tt> (fluid side of a heat exchanger, finite volumes, two-phase flow, computation of the heat transfer coefficient).<br>
This model represent the fluid side of a once-through boiler with an applied external linear temperature profile. The operating fluid is water.<br> 
The simulation proceeds through the following steps:
<ul>
    <li>t=0 s. The initial state of the water is subcooled liquid. After 40 seconds all the thermal transients have settled.
    <li>t=100 s. Ramp increase of the external temperature profile. The water starts boiling at t=118 s. At the end of the transient (t=300) the outlet fluid is superheated vapour.</li>
    <li>t=500 s. Ramp decrease of the external temperature profile. After the transient has settled, the fluid in the boiler is again subcooled water.</li> 
</ul>
<p> During the transient it is possible to observe the change in the heat transfer coefficients when boiling takes place; note that the h.t.c.'s  do not change abruptly due to the smoothing algorithm inside the <tt>Flow1D2phDB</tt> model.
<p>
Simulation Interval = [0...1000] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-8 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>4 Feb 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
    First release.</li>
</ul>
</HTML>"));
    ThermoPower.Water.Flow1D2phDB hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      A=Ahex,
      Cfnom=0.005,
      DynamicMomentum=false,
      hstartin=1e6,
      hstartout=1e6,
      pstartin=60e5,
      pstartout=60e5,
      gamma_b=20000,
      Dhyd=2*rhex,
      wnom=0.05,
      redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                annotation (extent=[-30, -30; -10, -10]);
    ThermoPower.Water.ValveLin valve(Kv=0.05/60e5) 
      annotation (extent=[18, -30; 38, -10]);
    ThermoPower.Water.SinkP Sink(p0=0) annotation (extent=[54, -30; 74, -10]);
    Modelica.Blocks.Sources.Step hIn(
      height=0,
      offset=1e6,
      startTime=30) annotation (extent=[-90, -12; -76, 4]);
    Modelica.Blocks.Sources.Ramp extTemp1(
      duration=100,
      height=50,
      offset=540,
      startTime=100)  annotation (extent=[-100, 38; -86, 52]);
    ThermoPower.Water.SourceW Source(
      w0=0.05,
      p0=60e5,
      G=0.05/600e5) annotation (extent=[-68, -30; -48, -10]);
    Modelica.Blocks.Sources.Ramp extTemp2(
      duration=100,
      height=-50,
      startTime=500)  annotation (extent=[-100, 70; -86, 84]);
    Modelica.Blocks.Math.Add Add1 annotation (extent=[-78, 56; -64, 70]);
    Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1) 
      annotation (extent=[28, 20; 42, 34]);
    Thermal.MetalTube Tube(
      N=Nnodes,
      L=Lhex,
      rint=rhex,
      rhomcm=7000*680,
      lambda=20,
      rext=rhex + 2*thhex,
      Tstart1=510,
      TstartN=510,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-30, 22; -10, 2]);
    Thermal.ConvHT_htc htFluid(N=Nnodes) 
      annotation (extent=[-30, 8; -10, -12]);
    Thermal.ConvHT htExt(N=Nnodes, gamma=10000) 
      annotation (extent=[-30, 18; -10, 38]);
    Thermal.TempSource1Dlin tempSource(N=Nnodes) 
      annotation (extent=[-30, 32; -10, 52]);
    Modelica.Blocks.Math.Add Add2 annotation (extent=[-16, 82; -2, 96]);
    Modelica.Blocks.Sources.Constant DT(k=5) 
      annotation (extent=[-38, 70; -26, 84]);
  equation 
    connect(hex.outfl, valve.inlet) annotation (points=[-10, -20; 18, -20]);
    connect(valve.outlet, Sink.flange) annotation (points=[38, -20; 54, -20]);
    connect(Source.flange, hex.infl) annotation (points=[-48, -20; -30, -20]);
    connect(extTemp2.y,Add1.u1) 
      annotation (points=[-85.3, 77; -79.4, 67.2], style(color=3));
    connect(extTemp1.y,Add1.u2) 
      annotation (points=[-85.3, 45; -79.4, 58.8], style(color=3));
    connect(xValve.y,       valve.cmd) annotation (points=[42.7, 27; 52, 27;
          52, 8; 28, 8; 28, -12], style(color=3));
    connect(hIn.y,       Source.in_h) 
      annotation (points=[-75.3, -4; -54, -4; -54, -14], style(color=3));
    connect(htExt.side2, Tube.ext) 
      annotation (points=[-20, 24.9; -20, 15.1], style(color=45));
    connect(Tube.int, htFluid.otherside) 
      annotation (points=[-20,9; -20,1],     style(color=45));
    connect(htFluid.fluidside, hex.wall) 
      annotation (points=[-20, -5; -20, -15]);
    connect(tempSource.wall, htExt.side1) 
      annotation (points=[-20, 39; -20, 31], style(color=45));
    connect(Add1.y,       tempSource.temperature_node1) 
      annotation (points=[-63.3, 63; -24, 63; -24, 45], style(color=3));
    connect(Add1.y,Add2.u1)             annotation (points=[-63.3, 63; -42.65,
           63; -42.65, 93.2; -17.4, 93.2], style(color=3));
    connect(DT.y,Add2.u2)             annotation (points=[-25.4, 77; -22.7,
          77; -22.7, 84.8; -17.4, 84.8], style(color=3));
    connect(tempSource.temperature_nodeN,Add2.y)        annotation (points=[-16,
          44.8; -16,60; 8,60; 8,89; -1.3,89],    style(color=3));
  end TestFlow1D2phDB;
  
  model TestFlow1D2phDB_hf "Test case for Flow1D2ph" 
    package Medium=Modelica.Media.Water.WaterIF97_ph(smoothModel=true);
    import Modelica.Constants.*;
    // number of Nodes
    parameter Integer Nnodes=10;
    // total length
    parameter Modelica.SIunits.Length Lhex=10;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dhex=0.02;
    // wall thickness
    parameter Modelica.SIunits.Thickness thhex=0;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dhex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Dhex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=pi*rhex^2;
    // friction factor
    parameter Real Cfhex=0.005;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.03,
        width=0.59,
        height=0.55),
      Diagram,
      experiment(
        StopTime=250,
        NumberOfIntervals=2000,
        Tolerance=1e-007),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2phDB</tt> (fluid side of a heat exchanger, finite volumes, two-phase flow, heat transfer computation) with a prescribed external heat flux, for debugging purposes. The heat transfer coefficient on the <tt>wall</tt> connector should be a continuous function.<br>
Simulation Interval = [0...200] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-7 
</p>
</HTML>",
        revisions="<HTML>
<ul>
    <li><i>11 Oct 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
    First release.</li>
</ul>
</HTML>"),
      experimentSetupOutput(equdistant=false),
      uses(Modelica(version="1.6")));
    ThermoPower.Water.Flow1D2phDB hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dhex,
      A=Ahex,
      Cfnom=0.005,
      DynamicMomentum=false,
      hstartin=6e5,
      hstartout=6e5,
      pstartin=10e5,
      pstartout=10e5,
    redeclare package Medium = Medium,
      wnom=0.1,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom) 
                   annotation (extent=[-30,-46; -10,-26]);
    ThermoPower.Water.ValveLin valve(Kv=0.1/15e5) 
      annotation (extent=[18,-46; 38,-26]);
    ThermoPower.Thermal.HeatSource1Dhtc heatSource(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-30,-28; -10,-8]);
    ThermoPower.Water.SinkP Sink(p0=1e5) annotation (extent=[52,-46; 72,-26]);
    Modelica.Blocks.Sources.Ramp extPower(
      duration=30,
      height=3e5,
      startTime=10)  annotation (extent=[-80, 40; -60, 60]);
    ThermoPower.Water.SourceW Source(w0=0.1) 
      annotation (extent=[-68,-46; -48,-26]);
    Modelica.Blocks.Sources.Ramp extPower2(
      duration=10,
      height=-3e5,
      startTime=70) annotation (extent=[-80, 74; -60, 94]);
    Modelica.Blocks.Math.Add Add1 annotation (extent=[-38, 54; -18, 74]);
    Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1) 
      annotation (extent=[-2,-10; 18,10]);
    Modelica.Blocks.Sources.Ramp hIn1(
      duration=30,
      height=2.2e6,
      offset=6e5,
      startTime=100) annotation (extent=[-100,-34; -80,-14]);
    Modelica.Blocks.Math.Add Add2 annotation (extent=[58,68; 78,88]);
    Modelica.Blocks.Sources.Ramp extPower1(
      duration=60,
      height=-2.5e5,
      startTime=150) 
                    annotation (extent=[14,76; 34,96]);
    Modelica.Blocks.Sources.Ramp extPower3(
      duration=30,
      height=0,
      startTime=210) 
                    annotation (extent=[14,42; 34,62]);
    Modelica.Blocks.Math.Add Add3 annotation (extent=[-44,-4; -24,16]);
  equation 
    connect(heatSource.wall, hex.wall) 
      annotation (points=[-20,-21; -20,-31],style(color=45));
    connect(hex.outfl, valve.inlet) annotation (points=[-10,-36; 18,-36]);
    connect(valve.outlet, Sink.flange) annotation (points=[38,-36; 52,-36]);
    connect(Source.flange, hex.infl) annotation (points=[-48,-36; -30,-36]);
    connect(extPower2.y,Add1.u1) 
      annotation (points=[-59, 84; -40, 70], style(color=3));
    connect(extPower.y,Add1.u2) 
      annotation (points=[-59, 50; -40, 58], style(color=3));
    connect(xValve.y,       valve.cmd) annotation (points=[19,0; 28,0; 28,-28],
                               style(color=3));
  initial equation 
    der(hex.p) = 0;
    der(hex.htilde) = zeros(Nnodes - 1);
  equation 
    connect(hIn1.y,       Source.in_h) annotation (points=[-79,-24; -54,-24; -54,
          -30], style(color=3, rgbcolor={0,0,255}));
    connect(extPower1.y,Add2.u1)             annotation (points=[35,86; 46,86; 46,
          84; 56,84], style(color=3, rgbcolor={0,0,255}));
    connect(extPower3.y,Add2.u2)             annotation (points=[35,52; 46,52; 46,
          72; 56,72], style(color=3, rgbcolor={0,0,255}));
    connect(Add1.y,Add3.u2)             annotation (points=[-17,64; -8,64; -8,32;
          -74,32; -74,0; -46,0], style(color=3, rgbcolor={0,0,255}));
    connect(Add2.y,Add3.u1)             annotation (points=[79,78; 88,78; 88,26;
          -54,26; -54,12; -46,12], style(color=3, rgbcolor={0,0,255}));
    connect(Add3.y,       heatSource.power) annotation (points=[-23,6; -20,6; -20,
          -14], style(color=3, rgbcolor={0,0,255}));
  end TestFlow1D2phDB_hf;
  
  model TestFlow1D2phChen "Test case for Flow1D2phChen" 
    package Medium=Modelica.Media.Water.WaterIF97_ph;
    import Modelica.Constants.*;
    // number of Nodes
    parameter Integer Nnodes=8;
    // total length
    parameter Length Lhex=20;
    // internal diameter
    parameter Diameter Dhex=0.01;
    // wall thickness
    parameter Thickness thhex=0.002;
    // internal radius
    parameter Radius rhex=Dhex/2;
    // internal perimeter
    parameter Length omegahex=pi*Dhex;
    // internal cross section
    parameter Area Ahex=pi*rhex^2;
    // friction factor
    parameter Real Cfhex=0.005;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.03,
        width=0.59,
        height=0.55),
      Diagram,
      experiment(StopTime=250, Tolerance=1e-008),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2phDB</tt> (fluid side of a heat exchanger, finite volumes, two-phase flow, computation of the heat transfer coefficient).<br>
This model represent the fluid side of a once-through boiler with an applied external linear temperature profile. The operating fluid is water.<br> 
The simulation proceeds through the following steps:
<ul>
    <li>t=0 s. The initial state of the water is subcooled liquid. After 40 seconds all the thermal transients have settled.
    <li>t=100 s. Ramp increase of the external temperature profile. The water starts boiling at t=118 s. At the end of the transient (t=300) the outlet fluid is superheated vapour.</li>
    <li>t=500 s. Ramp decrease of the external temperature profile. After the transient has settled, the fluid in the boiler is again subcooled water.</li> 
</ul>
<p> During the transient it is possible to observe the change in the heat transfer coefficients when boiling takes place; note that the h.t.c.'s  do not change abruptly due to the smoothing algorithm inside the <tt>Flow1D2phDB</tt> model.
<p>
Simulation Interval = [0...1000] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-8 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>4 Feb 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
    First release.</li>
</ul>
</HTML>"),
      experimentSetupOutput(equdistant=false));
    ThermoPower.Water.Flow1D2phChen hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      A=Ahex,
      Cfnom=0.005,
      DynamicMomentum=false,
      hstartin=1e6,
      hstartout=1e6,
      pstartin=60e5,
      pstartout=60e5,
      Dhyd=2*rhex,
      redeclare package Medium = Medium,
      wnom=0.05,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-30,-30; -10,-10]);
    ThermoPower.Water.ValveLin valve(Kv=0.05/60e5) 
      annotation (extent=[18, -30; 38, -10]);
    ThermoPower.Water.SinkP Sink(p0=0) annotation (extent=[54, -30; 74, -10]);
    Modelica.Blocks.Sources.Step hIn(
      height=0,
      offset=1e6,
      startTime=30) annotation (extent=[-90, -12; -76, 4]);
    Modelica.Blocks.Sources.Ramp extTemp1(
      duration=100,
      height=60,
      offset=540,
      startTime=100) 
                   annotation (extent=[-100, 38; -86, 52]);
    ThermoPower.Water.SourceW Source(
      w0=0.05,
      p0=60e5,
      G=0.05/600e5) annotation (extent=[-68, -30; -48, -10]);
    Modelica.Blocks.Sources.Ramp extTemp2(
      duration=100,
      height=-30,
      startTime=500) 
                    annotation (extent=[-100, 70; -86, 84]);
    Modelica.Blocks.Math.Add Add1 annotation (extent=[-78, 56; -64, 70]);
    Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1) 
      annotation (extent=[28, 20; 42, 34]);
    Thermal.MetalTube Tube(
      N=Nnodes,
      L=Lhex,
      rint=rhex,
      rhomcm=7000*680,
      lambda=20,
      rext=rhex + 2*thhex,
      Tstart1=510,
      TstartN=510,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                   annotation (extent=[-30, 22; -10, 2]);
    Thermal.ConvHT_htc htFluid(N=Nnodes) 
      annotation (extent=[-30, 8; -10, -12]);
    Thermal.ConvHT htExt(N=Nnodes, gamma=10000) 
      annotation (extent=[-30, 18; -10, 38]);
    Thermal.TempSource1Dlin tempSource(N=Nnodes) 
      annotation (extent=[-30, 32; -10, 52]);
    Modelica.Blocks.Math.Add Add2 annotation (extent=[-16, 82; -2, 96]);
    Modelica.Blocks.Sources.Constant DT(k=5) 
      annotation (extent=[-38, 70; -26, 84]);
  equation 
    connect(hex.outfl, valve.inlet) 
      annotation (points=[-10,-20; 18,-20]);
    connect(valve.outlet, Sink.flange) annotation (points=[38, -20; 54, -20]);
    connect(Source.flange, hex.infl) 
      annotation (points=[-48,-20; -30,-20]);
    connect(extTemp2.y,Add1.u1) 
      annotation (points=[-85.3, 77; -79.4, 67.2], style(color=3));
    connect(extTemp1.y,Add1.u2) 
      annotation (points=[-85.3, 45; -79.4, 58.8], style(color=3));
    connect(xValve.y,       valve.cmd) annotation (points=[42.7, 27; 52, 27;
          52, 8; 28, 8; 28, -12], style(color=3));
    connect(hIn.y,       Source.in_h) 
      annotation (points=[-75.3, -4; -54, -4; -54, -14], style(color=3));
    connect(htExt.side2, Tube.ext) 
      annotation (points=[-20, 24.9; -20, 15.1], style(color=45));
    connect(Tube.int, htFluid.otherside) 
      annotation (points=[-20,9; -20,1],     style(color=45));
    connect(htFluid.fluidside, hex.wall) 
      annotation (points=[-20,-5; -20,-15]);
    connect(tempSource.wall, htExt.side1) 
      annotation (points=[-20, 39; -20, 31], style(color=45));
    connect(Add1.y,       tempSource.temperature_node1) 
      annotation (points=[-63.3, 63; -24, 63; -24, 45], style(color=3));
    connect(Add1.y,Add2.u1)             annotation (points=[-63.3, 63; -42.65,
           63; -42.65, 93.2; -17.4, 93.2], style(color=3));
    connect(DT.y,Add2.u2)             annotation (points=[-25.4, 77; -22.7,
          77; -22.7, 84.8; -17.4, 84.8], style(color=3));
    connect(tempSource.temperature_nodeN,Add2.y)        annotation (points=[-16,
          44.8; -16,60; 8,60; 8,89; -1.3,89],    style(color=3));
  end TestFlow1D2phChen;
  
  model TestFlow1D2phChen_hf "Test case for Flow1D2ph" 
    package Medium=Modelica.Media.Water.WaterIF97_ph(smoothModel=true);
    import Modelica.Constants.*;
    // number of Nodes
    parameter Integer Nnodes=10;
    // total length
    parameter Modelica.SIunits.Length Lhex=10;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dhex=0.02;
    // wall thickness
    parameter Modelica.SIunits.Thickness thhex=0;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dhex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Dhex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=pi*rhex^2;
    // friction factor
    parameter Real Cfhex=0.005;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.03,
        width=0.59,
        height=0.55),
      Diagram,
      experiment(
        StopTime=250,
        NumberOfIntervals=2000,
        Tolerance=1e-007),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2phDB</tt> (fluid side of a heat exchanger, finite volumes, two-phase flow, heat transfer computation) with a prescribed external heat flux, for debugging purposes. The heat transfer coefficient on the <tt>wall</tt> connector should be a continuous function.<br>
Simulation Interval = [0...200] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-7 
</p>
</HTML>",   revisions="<HTML>
<ul>
    <li><i>11 Oct 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
    First release.</li>
</ul>
</HTML>"),
      experimentSetupOutput(equdistant=false),
      uses(Modelica(version="1.6")));
    ThermoPower.Water.Flow1D2phChen hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dhex,
      A=Ahex,
      Cfnom=0.005,
      DynamicMomentum=false,
      hstartin=6e5,
      hstartout=6e5,
      pstartin=10e5,
      pstartout=10e5,
    redeclare package Medium = Medium,
      wnom=0.1,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction) 
                   annotation (extent=[-30,-46; -10,-26]);
    ThermoPower.Water.ValveLin valve(Kv=0.1/15e5) 
      annotation (extent=[18,-46; 38,-26]);
    ThermoPower.Thermal.HeatSource1Dhtc heatSource(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-30,-28; -10,-8]);
    ThermoPower.Water.SinkP Sink(p0=1e5) annotation (extent=[52,-46; 72,-26]);
    Modelica.Blocks.Sources.Ramp extPower(
      duration=30,
      height=3e5,
      startTime=10)  annotation (extent=[-80, 40; -60, 60]);
    ThermoPower.Water.SourceW Source(w0=0.1) 
      annotation (extent=[-68,-46; -48,-26]);
    Modelica.Blocks.Sources.Ramp extPower2(
      duration=10,
      height=-3e5,
      startTime=70) annotation (extent=[-80, 74; -60, 94]);
    Modelica.Blocks.Math.Add Add1 annotation (extent=[-38, 54; -18, 74]);
    Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1) 
      annotation (extent=[-2,-10; 18,10]);
    Modelica.Blocks.Sources.Ramp hIn1(
      duration=30,
      height=2.2e6,
      offset=6e5,
      startTime=100) annotation (extent=[-100,-34; -80,-14]);
    Modelica.Blocks.Math.Add Add2 annotation (extent=[58,68; 78,88]);
    Modelica.Blocks.Sources.Ramp extPower1(
      duration=60,
      height=-2.5e5,
      startTime=150) 
                    annotation (extent=[14,76; 34,96]);
    Modelica.Blocks.Sources.Ramp extPower3(
      duration=30,
      height=0,
      startTime=210) 
                    annotation (extent=[14,42; 34,62]);
    Modelica.Blocks.Math.Add Add3 annotation (extent=[-44,-4; -24,16]);
  equation 
    connect(heatSource.wall, hex.wall) 
      annotation (points=[-20,-21; -20,-31],style(color=45));
    connect(hex.outfl, valve.inlet) annotation (points=[-10,-36; 18,-36]);
    connect(valve.outlet, Sink.flange) annotation (points=[38,-36; 52,-36]);
    connect(Source.flange, hex.infl) annotation (points=[-48,-36; -30,-36]);
    connect(extPower2.y,Add1.u1) 
      annotation (points=[-59, 84; -40, 70], style(color=3));
    connect(extPower.y,Add1.u2) 
      annotation (points=[-59, 50; -40, 58], style(color=3));
    connect(xValve.y,       valve.cmd) annotation (points=[19,0; 28,0; 28,-28],
                               style(color=3));
  initial equation 
    der(hex.p) = 0;
    der(hex.htilde) = zeros(Nnodes - 1);
  equation 
    connect(hIn1.y,       Source.in_h) annotation (points=[-79,-24; -54,-24; -54,
          -30], style(color=3, rgbcolor={0,0,255}));
    connect(extPower1.y,Add2.u1)             annotation (points=[35,86; 46,86; 46,
          84; 56,84], style(color=3, rgbcolor={0,0,255}));
    connect(extPower3.y,Add2.u2)             annotation (points=[35,52; 46,52; 46,
          72; 56,72], style(color=3, rgbcolor={0,0,255}));
    connect(Add1.y,Add3.u2)             annotation (points=[-17,64; -8,64; -8,32;
          -74,32; -74,0; -46,0], style(color=3, rgbcolor={0,0,255}));
    connect(Add2.y,Add3.u1)             annotation (points=[79,78; 88,78; 88,26;
          -54,26; -54,12; -46,12], style(color=3, rgbcolor={0,0,255}));
    connect(Add3.y,       heatSource.power) annotation (points=[-23,6; -20,6; -20,
          -14], style(color=3, rgbcolor={0,0,255}));
  end TestFlow1D2phChen_hf;
  
  model TestFlow1Dfem2ph "Test case for Flow1D2ph" 
    package Medium=Modelica.Media.Water.WaterIF97_ph;
    // number of Nodes
    parameter Integer Nnodes=11;
    // total length
    parameter Modelica.SIunits.Length Lhex=10;
    // internal diameter
    parameter Modelica.SIunits.Diameter Dhex=0.02;
    // wall thickness
    parameter Modelica.SIunits.Thickness thhex=1e-3;
    // internal radius
    parameter Modelica.SIunits.Radius rhex=Dhex/2;
    // internal perimeter
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dhex;
    // internal cross section
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2;
    // friction factor
    parameter Real Cfhex=0.005;
    
    parameter Modelica.SIunits.SpecificEnthalpy hin=6e5;
    parameter Modelica.SIunits.Pressure phex=1e6;
    parameter Modelica.SIunits.MassFlowRate whex=1;
    
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.03,
        width=0.59,
        height=0.55),
      Diagram,
      experiment(StopTime=100, Tolerance=1e-008),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2ph</tt> (fluid side of a heat exchanger, finite volumes, two-phase flow).<br>
This model represent the fluid side of a once-through boiler with an applied external heat flow. The operating fluid is water.<br> 
During the simulation, the inlet specific enthalpy and heat flux are changed, while maintaining the inlet flowrate constant:
<ul>
    <li>t=0 s. The initial state of the water is subcooled liquid.
    <li>t=10 s. Ramp increase of the applied heat flow. The water starts boiling and is blown out of the outlet, whose pressure and flowrate undergo a transient increase. At the end of the transient the outlet fluid is in superheated vapour state.</li>
    <li>t=30 s. Step increase of the inlet enthalpy</li> 
    <li>t=50 s. The heat flow is reduced to zero in 2s. The vapour collapses, causing a suddend decrease in the outlet pressure and flowrate, until the liquid fills again the entire boiler. At that instant, the pressure and flowrate rise again rapidly to the inlet values.</li> 
</ul>
<p>
Simulation Interval = [0...80] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
    First release.</li>
</ul>
</HTML>"),
      experimentSetupOutput(equdistant=false));
    Water.Flow1Dfem2ph hex(
      N=Nnodes,
      L=Lhex,
      omega=omegahex,
      Dhyd=Dhex,
      A=Ahex,
      Cfnom=0.005,
      DynamicMomentum=false,
      hstartin=hin,
      hstartout=hin,
      wnom=1,
      pstartin=phex,
      pstartout=phex,
      ML=0,
    redeclare package Medium = Medium,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom) 
            annotation (extent=[-30, -10; -10, 10]);
    Water.ValveLin valve(Kv=whex/(phex)) 
      annotation (extent=[18, -10; 38, 10]);
    Water.SinkP Sink(p0=0)             annotation (extent=[52, -10; 72, 10]);
    Modelica.Blocks.Sources.Step hIn(
      height=1e5,
      offset=hin,
      startTime=50) annotation (extent=[-100, 10; -80, 30]);
    Modelica.Blocks.Sources.Ramp extPower(
      duration=30,
      height=3e6,
      startTime=10)   annotation (extent=[-82, 40; -62, 60]);
    Water.SourceW Source(
      h=hin,
      w0=whex,
      p0=phex,
      G=0) annotation (extent=[-68, -10; -48, 10]);
    Modelica.Blocks.Sources.Ramp extPower2(
      duration=10,
      height=-3e6,
      startTime=70)    annotation (extent=[-80, 74; -60, 94]);
    Modelica.Blocks.Math.Add Add1 annotation (extent=[-38, 54; -18, 74]);
    Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1) 
      annotation (extent=[16, 48; 36, 68]);
    Thermal.MetalTube MetalWall(
      N=Nnodes,
      rint=rhex,
      rhomcm=4.9e6,
      L=Lhex,
      lambda=20,
      WallRes=true,
      rext=rhex + thhex,
      Tstart1=415.592,
      TstartN=415.592,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                     annotation (extent=[-32,10; -12,30],   rotation=180);
    Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      Nt=1,
      L=Lhex,
      omega=(rhex + thhex)*2*Modelica.Constants.pi) 
      annotation (extent=[-32,30; -12,50]);
  equation 
    connect(hex.outfl, valve.inlet) annotation (points=[-10, 0; 18, 0]);
    connect(valve.outlet, Sink.flange) annotation (points=[38, 0; 52, 0]);
    connect(Source.flange, hex.infl) annotation (points=[-48, 0; -30, 0]);
    connect(extPower2.y,Add1.u1) 
      annotation (points=[-59, 84; -40, 70], style(color=3));
    connect(extPower.y,Add1.u2) 
      annotation (points=[-61, 50; -40, 58], style(color=3));
    connect(xValve.y,       valve.cmd) annotation (points=[37, 58; 44, 58; 44,
           28; 28, 28; 28, 8], style(color=3));
    connect(hex.wall, MetalWall.int) 
      annotation (points=[-20,5; -20,17; -22,17],    style(color=45));
    connect(Add1.y,       HeatSource1D1.power) annotation (points=[-17,64; -10,64;
          -10,44; -22,44],               style(color=3));
    connect(HeatSource1D1.wall, MetalWall.ext) annotation (points=[-22,37; -22,
          23.1],                    style(color=45));
    connect(hIn.y,       Source.in_h) annotation (points=[-79,20; -54,20; -54,
          6], style(color=3, rgbcolor={0,0,255}));
  end TestFlow1Dfem2ph;
  
  model Flow1D_check 
    "Extended Flow1D model with mass & energy balance computation" 
    
    extends Water.Flow1D;
    SpecificEnergy Etot;
    SpecificEnergy Evol[N - 1];
    Mass Mtot;
    Mass Mvol[N - 1];
    Real balM;
    Real balE;
  equation 
    for j in 1:N - 1 loop
      Mvol[j] = A*l*rhobar[j];
      Evol[j] = Mvol[j]*((h[j] + h[j + 1])/2 - p/rhobar[j]);
    end for;
    // M is computed in base class
    Mtot = M;
    Etot = sum(Evol);
    balM = infl.w + outfl.w;
    
    balE = infl.w*(if infl.w > 0 then infl.hBA else infl.hAB) + outfl.w*(if 
      outfl.w > 0 then outfl.hAB else outfl.hBA) + sum(wall.phi[1:N - 1] +
      wall.phi[2:N])/2*omega*l;
    annotation (Documentation(info="<HTML>
<p>This model extends <tt>Water.Flow1D</tt> by adding the computation of mass and energy flows and buildups. It can be used to check the correctness of the <tt>Water.Flow1D</tt> model.</p>
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end Flow1D_check;
  
  model Flow1D2ph_check 
    "Extended Flow1D2ph model with mass & energy balance computation" 
    extends Water.Flow1D2ph;
    
    SpecificEnergy Etot;
    SpecificEnergy Evol[N - 1];
    Mass Mtot;
    Mass Mvol[N - 1];
    Real balM;
    Real balE;
  equation 
    for j in 1:N - 1 loop
      Mvol[j] = A*l*rhobar[j];
      Evol[j] = Mvol[j]*((h[j] + h[j + 1])/2 - p/rhobar[j]);
    end for;
    // M is computed in base class
    Mtot = M;
    Etot = sum(Evol);
    balM = infl.w + outfl.w;
    
    balE = infl.w*(if infl.w > 0 then infl.hBA else infl.hAB) + outfl.w*(if 
      outfl.w > 0 then outfl.hAB else outfl.hBA) + sum(wall.phi[1:N - 1] +
      wall.phi[2:N])/2*omega*l;
    annotation (Documentation(info="<HTML>
<p>This model extends <tt>Water.Flow1D2ph</tt> by adding the computation of mass and energy flows and buildups. It can be used to check the correctness of the <tt>Water.Flow1D</tt> model.</p>
<p><b>Revision history:</b></p>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</HTML>"));
  end Flow1D2ph_check;
  
  model WaterPump "Test case for WaterPump" 
    annotation (
      Diagram,
      experiment(StopTime=10, Tolerance=1e-006),
      Documentation(info="<HTML>
<p>This model tests the <tt>Pump</tt> model with the check valve option active.
<p>The valve is opened at time t=1s. The sink pressure is then increased so as to operate the pump in all the possible working conditions, including stopped flow.
<p>
Simulation Interval = [0...10] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</HTML>", revisions="<html>
<ul>
<li><i>5 Nov 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Updated.</li>
<li><i>5 Feb 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco
Schiavo</a>:<br>
       First release.</li>
</ul>

</html>"));
    package Medium=Modelica.Media.Water.WaterIF97_ph;
    ThermoPower.Water.SourceP Source(p0=1e5, h=1.5e5) 
      annotation (extent=[-80,-20; -60,0]);
    ThermoPower.Water.ValveLin ValveLin1(Kv=1e-5) 
      annotation (extent=[14,-22; 34,-2]);
    ThermoPower.Water.SinkP SinkP1(p0=3e5) 
      annotation (extent=[48,-22; 68,-2]);
  /*
  ThermoPower.Water.Pump Pump1(
    rho0=1000,
    pin_start=1e5,
    pout_start=4e5,
    hstart=1e5,
    ThermalCapacity=true,
    V=0.01,
    P_cons={800,1800,2000},
    head_nom={60,30,0},
    q_nom={0,0.001,0.0015},
  redeclare package Medium = Modelica.Media.Water.StandardWater,
  redeclare package SatMedium = Modelica.Media.Water.StandardWater,
    ComputeNPSHa=true,
    CheckValve=true,
    initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                        annotation (extent=[-54,26; -34,46]);
*/
    ThermoPower.Water.Pump Pump1(
      rho0=1000,
      pin_start=1e5,
      pout_start=4e5,
      hstart=1e5,
      V=0.01,
      redeclare package Medium = Modelica.Media.Water.StandardWater,
      redeclare package SatMedium = Modelica.Media.Water.StandardWater,
      ComputeNPSHa=true,
      CheckValve=true,
      redeclare function flowCharacteristic = 
          ThermoPower.Functions.PumpCharacteristics.quadraticFlow (
          q_nom = {0,0.001,0.0015}, head_nom={60,30,0}),
      redeclare function powerCharacteristic = 
          ThermoPower.Functions.PumpCharacteristics.quadraticPower (q_nom={0,
              0.001,0.0015}, W_nom={350,500,600}),
      initOpt=ThermoPower.Choices.Init.Options.noInit,
      Np0=2,
      usePowerCharacteristic=true) 
                          annotation (extent=[-46,-20; -26,0]);
    
    Modelica.Blocks.Sources.Ramp Ramp1(
      height=4e5,
      offset=4e5,
      duration=4,
      startTime=4) annotation (extent=[0,40; 20,60]);
    Modelica.Blocks.Sources.Step Step1(
      height=1,
      startTime=1,
      offset=1e-6) annotation (extent=[-60,22; -40,42]);
  equation 
    connect(ValveLin1.outlet, SinkP1.flange) 
      annotation (points=[34,-12; 48,-12]);
    connect(Source.flange, Pump1.infl) 
      annotation (points=[-60,-10; -52,-10; -52,-7.8; -44,-7.8]);
    connect(Pump1.outfl, ValveLin1.inlet) 
      annotation (points=[-30,-2.8; -8,-2.8; -8,-12; 14,-12]);
    connect(Ramp1.y, SinkP1.in_p0) annotation (points=[21,50; 54,50; 54,-3.2],
        style(color=74, rgbcolor={0,0,127}));
    connect(Step1.y, ValveLin1.cmd) annotation (points=[-39,32; -18,32; -18,12;
          24,12; 24,-4], style(color=74, rgbcolor={0,0,127}));
  end WaterPump;
  
  model WaterPumpMech "Test case for WaterPumpMech" 
    annotation (
      Diagram,
      experiment(StopTime=25, Tolerance=1e-006),
      Documentation(info="<html>
<p>The model is designed to test the component <tt>PumpMech</tt>. The simple model of a DC motor <tt>Test.SimpleMotor</tt> is also used.<br>
The simulation starts with a stopped motor and a closed valve.
<ul>
    <li>t=2 s: The voltage supplied is increased up to 380V in 5 s.
    <li>t=15 s, The valve is opened in 5 s. 
</ul>
<p>
Simulation Interval = [0...25] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
</html>
", revisions="<html>
<ul>
<li><i>5 Nov 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Updated.</li>
        <li><i>5 Feb 2004</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
        First release.</li>
</ul>
</html>"));
    package Medium=Modelica.Media.Water.WaterIF97_ph;
    ThermoPower.Water.PumpMech Pump(
      rho0=1000,
      n0=100,
      pin_start=1e5,
      pout_start=4e5,
      V=0.001,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      initOpt=ThermoPower.Choices.Init.Options.noInit,
      redeclare function flowCharacteristic = 
          ThermoPower.Functions.PumpCharacteristics.quadraticFlow (q_nom={0,0.001,
              0.0015}, head_nom={60,30,0}),
      usePowerCharacteristic=true,
      redeclare function powerCharacteristic = 
          ThermoPower.Functions.PumpCharacteristics.quadraticPower (q_nom={0,
              0.001,0.0015}, W_nom={350,500,600})) 
                            annotation (extent=[-18, 6; 4, 28]);
    ThermoPower.Water.SourceP Source annotation (extent=[-56, 10; -36, 30]);
    ThermoPower.Water.ValveLin Valve(Kv=1e-5) 
      annotation (extent=[14, 14; 34, 34]);
    Modelica.Blocks.Sources.Ramp Ramp1(
      duration=5,
      height=1,
      offset=0,
      startTime=15)   annotation (extent=[-12, 42; 8, 62]);
    ThermoPower.Water.SinkP Sink(p0=0.8e5) 
      annotation (extent=[48, 14; 68, 34]);
    Modelica.Blocks.Sources.Ramp Ramp2(
      duration=5,
      height=380,
      startTime=2,
      offset=0.01)  annotation (extent=[-60, -34; -40, -14]);
    SimpleMotor SimpleMotor1(
      Rm=20,
      Lm=0.1,
      kT=35,
      Jm=10,
      dm=1) annotation (extent=[-30, -34; -10, -14]);
  equation 
    connect(Source.flange, Pump.infl) 
      annotation (points=[-36, 20; -8, 20; -8, 19.42; -15.8, 19.42]);
    connect(Pump.outfl, Valve.inlet) 
      annotation (points=[-0.4,24.92; 5.9,24.92; 5.9,24; 14,24]);
    connect(Ramp1.y,       Valve.cmd) 
      annotation (points=[9, 52; 24, 52; 24, 32], style(color=3));
    connect(Valve.outlet, Sink.flange) annotation (points=[34, 24; 48, 24]);
    connect(Ramp2.y,       SimpleMotor1.inPort) 
      annotation (points=[-39, -24; -29.9, -24], style(color=3));
    connect(SimpleMotor1.flange_b, Pump.MechPort) annotation (points=[-9.2,-24;
          -6,-24; -6,0; 4,0; 4,18.98; 3.45,18.98],     style(color=0));
  end WaterPumpMech;
  
  model SimpleMotor 
    "A simple model of an electrical dc motor (based on DriveLib model)." 
    
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.15,
        y=0.18,
        width=0.45,
        height=0.58),
      Icon(
        Rectangle(extent=[60, 6; 96, -6], style(color=9, fillColor=9)),
        Rectangle(extent=[-60, 40; 60, -40], style(gradient=2, fillColor=74)),
        Rectangle(extent=[-80, -80; 80, -100], style(pattern=0, fillColor=0)),
        Line(points=[-90, 0; -60, 0]),
        Text(extent=[-80, 100; 80, 60], string="%name"),
        Polygon(points=[-60, -80; -40, -20; 40, -20; 60, -80; 60, -80; -60, -80],
             style(
            pattern=0,
            gradient=1,
            fillColor=0))),
      Documentation(info="<HTML>
<p>This is a basic model of an electrical DC motor used to drive a pump in <tt>WaterPumpMech</tt>.
<p><b>Revision history:</b></p>
<ul>
<li><i>5 Feb 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco
Schiavo</a>:<br>
       First release.</li>
</ul>
</HTML>"),
      DymolaStoredErrors,
      Diagram);
    
    parameter Modelica.SIunits.Resistance Rm=10 "Motor Resistance";
    parameter Modelica.SIunits.Inductance Lm=1 "Motor Inductance";
    parameter Real kT=1 "Torque Constant";
    parameter Modelica.SIunits.Inertia Jm=10 "Motor Inertia";
    parameter Real dm(
      final unit="N.m.s/rad",
      final min=0) = 0 "Damping constant";
    Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm n;
    Modelica.Electrical.Analog.Sources.SignalVoltage Vs 
      annotation (extent=[-80, 10; -60, -10], rotation=90);
    Modelica.Electrical.Analog.Basic.Ground G 
      annotation (extent=[-80, -60; -60, -40]);
    Modelica.Electrical.Analog.Basic.Resistor R(R=Rm) 
      annotation (extent=[-60, 30; -40, 50]);
    Modelica.Electrical.Analog.Basic.Inductor L(L=Lm) 
      annotation (extent=[-20, 30; 0, 50]);
    Modelica.Electrical.Analog.Basic.EMF emf(k=kT) 
      annotation (extent=[0, -10; 20, 10]);
    Modelica.Blocks.Interfaces.RealInput inPort 
      annotation (extent=[-108, -10; -90, 10]);
    Modelica.Mechanics.Rotational.Inertia J(J=Jm) 
      annotation (extent=[48, -10; 68, 10]);
    Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b 
      annotation (extent=[96, -12; 120, 12]);
    Modelica.Mechanics.Rotational.Fixed Fixed 
      annotation (extent=[26, -52; 46, -32]);
    Modelica.Mechanics.Rotational.Damper Damper(d=dm) 
      annotation (extent=[26, -32; 46, -12], rotation=90);
  equation 
    connect(R.n, L.p) annotation (points=[-40, 40; -20, 40]);
    connect(L.n, emf.p) annotation (points=[0, 40; 10, 40; 10, 10]);
    connect(emf.flange_b, J.flange_a) annotation (points=[20, 0; 48, 0]);
    connect(R.p, Vs.p) annotation (points=[-60, 40; -70, 40; -70, 10]);
    connect(Vs.n, emf.n) 
      annotation (points=[-70, -10; -70, -20; 10, -20; 10, -10]);
    connect(G.p, Vs.n) annotation (points=[-70, -40; -70, -10]);
    connect(J.flange_b, flange_b) annotation (points=[68, 0; 108, 0]);
    connect(inPort,Vs.v) 
      annotation (points=[-99,0; -77,-4.28612e-016]);
    n = Modelica.SIunits.Conversions.to_rpm(J.w);
    connect(Fixed.flange_b, Damper.flange_a) 
      annotation (points=[36, -42; 36, -32], style(color=0));
    connect(Damper.flange_b, J.flange_a) 
      annotation (points=[36, -12; 36, 0; 48, 0], style(color=0));
  end SimpleMotor;
  
  model TestAccumulator "Simple test for Water-Gas Accumulator component" 
    package Medium=Modelica.Media.Water.WaterIF97_ph;
    ThermoPower.Water.Accumulator Accumulator1(
      hl_start=1e5,
      Tg_start=300,
      Tgin=300,
      Tg0=300,
      pg0=5e5,
      V=5,
      Vl0=3,
      zl0=2,
      zl_start=0,
      pg_start=7e5,
      gamma_ex=100,
      wg_out0=2e-2,
      MM=29e-3,
      A=1,
    redeclare package Medium = Modelica.Media.Water.StandardWater,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
           annotation (extent=[-24, -88; 30, -26]);
    ThermoPower.Water.SourceW SourceW1(w0=0) 
      annotation (extent=[-38, -96; -18, -76]);
    ThermoPower.Water.SinkP SinkP1(p0=1e5) 
      annotation (extent=[64, -96; 84, -76]);
    ThermoPower.Water.PressDropLin PressDropLin1(R=1e5) 
      annotation (extent=[28, -96; 48, -76]);
    annotation (
      Diagram,
      experiment(StopTime=8000, Tolerance=1e-006),
      Documentation(info="<html>
<p>The model is designed to test the component  <tt>Accumulator</tt>.<br>
Simulation sequence:
<ul>
    <li>t=500 s: The accumulator is charged for 20 s.
    <li>t=2500 s, The accumulator is discharged for 20 s. 
    <li>t=8000 s, 10% increase of the inlet flowrate
</ul>
<p>
Simulation Interval = [0...8000] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
<p><b>Revision history:</b></p>
<ul>
        <li><i>5 Feb 2004</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>, 
        First release.</li>
</ul>
</html>"));
    Modelica.Blocks.Sources.Step Step1(height=2e-2, startTime=500) 
      annotation (extent=[-94, -24; -74, -4]);
    Modelica.Blocks.Math.Add Add1 annotation (extent=[-52, -42; -32, -22]);
    Modelica.Blocks.Sources.Step Step2(height=-2e-2, startTime=520) 
      annotation (extent=[-94, -54; -74, -34]);
    Modelica.Blocks.Sources.Step Step3(height=1, startTime=2500) 
      annotation (extent=[-96, 44; -76, 64]);
    Modelica.Blocks.Math.Add Add2 annotation (extent=[-44, 18; -24, 38]);
    Modelica.Blocks.Sources.Step Step5(height=-1, startTime=2520) 
      annotation (extent=[-96, 12; -76, 32]);
    Modelica.Blocks.Sources.Step Step4(
      height=0.5,
      offset=5,
      startTime=5000) 
                    annotation (extent=[-68, -82; -48, -62]);
  equation 
    connect(Accumulator1.WaterOutfl, PressDropLin1.inlet) 
      annotation (points=[12.18, -84.9; 15.09, -84.9; 15.09, -86; 28, -86]);
    connect(PressDropLin1.outlet, SinkP1.flange) 
      annotation (points=[48, -86; 64, -86]);
    connect(SourceW1.flange, Accumulator1.WaterInfl) 
      annotation (points=[-18, -86; -24, -86; -24, -84.9; -6.18, -84.9]);
    connect(Step1.y,Add1.u1)             annotation (points=[-73, -14; -62, -14;
           -62, -26; -54, -26], style(color=3));
    connect(Step2.y,Add1.u2)             annotation (points=[-73, -44; -64, -44;
           -64, -38; -54, -38], style(color=3));
    connect(Step5.y,Add2.u2) 
      annotation (points=[-75, 22; -46, 22], style(color=3));
    connect(Step3.y,Add2.u1)             annotation (points=[-75, 54; -50, 54;
           -50, 34; -46, 34], style(color=3));
    connect(Add1.y,       Accumulator1.GasInfl) annotation (points=[-31, -32;
           -23.99, -32; -23.99, -29.1; -16.98, -29.1], style(color=3));
    connect(Add2.y,       Accumulator1.OutletValveOpening) annotation (points=
         [-23, 28; -6, 28; -6, -6; 14.88, -6; 14.88, -29.1], style(color=3));
  initial equation 
  /*
  der(Accumulator1.rhog) = 0;
  der(Accumulator1.Tg) = 0;
  der(Accumulator1.hl) = 0;
  Accumulator1.zl = 0;
*/
  equation 
    connect(Step4.y,       SourceW1.in_w0) 
      annotation (points=[-47, -72; -32, -72; -32, -80], style(color=3));
  end TestAccumulator;
  
  annotation (Documentation(info="<HTML>
This package contains test cases for the ThermoPower library.
</HTML>"));
  
  model TestElectrical1 
    parameter Power Pn=10e6 "Nominal generator power";
    parameter Time Ta=10 "Turbine acceleration time";
    parameter Integer Np=2 "Number of generator poles";
    parameter Frequency f0=50 "Nominal network frequency";
    parameter AngularVelocity omegan_el=2*pi*f0 
      "Nominal electrical angular velocity";
    parameter AngularVelocity omegan_m=omegan_el/Np 
      "Nominal mechanical angular velocity";
    parameter MomentOfInertia Je=Pn*Ta/omegan_el^2 
      "Moment of inertia referred to electrical angles";
    parameter MomentOfInertia Jm=Np^2*Je "Mechanical moment of inertia";
    parameter Time Topen=10 "Time of breaker opening";
    Electrical.Generator generator annotation (extent=[22,10; 42,30]);
    Electrical.Load load(Wn=Pn) 
                          annotation (extent=[42,0; 62,20], rotation=0);
    annotation (Diagram,
      experiment(StopTime=2),
      Documentation(info="<html>
<p>The model is designed to test the generator and load components of the <tt>Electrical</tt> library.<br>
Simulation sequence:
<ul>
    <li>t=0 s: The system starts at equilibrium
    <li>t=1 s: The torque is brought to zero.
    <li>t=2 s: After 10% of the turbine acceleration time, the frequency has dropped by around 10%. The approximation is due to nonlinear effects.
</ul>
<p>
Simulation Interval = [0...2] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
</html>",
        revisions="<html>
<ul>
        <li><i>21 Jul 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
        First release.</li>
</ul>
</html>
"));
    Modelica.Mechanics.Rotational.Inertia turboGenInertia(J=Jm) 
      annotation (extent=[-6,10; 14,30]);
    Modelica.Mechanics.Rotational.Torque primeMover 
      annotation (extent=[-44,10; -24,30]);
    import Modelica.Constants.*;
    
    Modelica.Blocks.Sources.Step Step1(
      height=-Pn/omegan_m,
      offset=Pn/omegan_m,
      startTime=1)          annotation (extent=[-96,12; -76,32]);
  equation 
    connect(generator.powerConnection, load.connection)  annotation (points=[
          40.6,20; 46.35,20; 46.35,18.7; 51.9,18.7],style(pattern=0,
          thickness=2));
    connect(turboGenInertia.flange_b, generator.shaft) annotation (points=[14,
          20; 23.4,20],     style(color=0, rgbcolor={0,0,0}));
    connect(primeMover.flange_b, turboGenInertia.flange_a) 
      annotation (points=[-24,20; -6,20],  style(color=0, rgbcolor={0,0,0}));
    connect(Step1.y,primeMover.tau)           annotation (points=[-75,22; -62,
          22; -62,20; -46,20], style(color=3, rgbcolor={0,0,255}));
  initial equation 
    load.f=50;
  end TestElectrical1;
  
  model TestElectrical2 
    parameter Power Pn=10e6 "Nominal generator power";
    parameter Time Ta=10 "Turbine acceleration time";
    parameter Integer Np=2 "Number of generator poles";
    parameter Frequency f0=50 "Nominal network frequency";
    parameter AngularVelocity omegan_el=2*pi*f0 
      "Nominal electrical angular velocity";
    parameter AngularVelocity omegan_m=omegan_el/Np 
      "Nominal mechanical angular velocity";
    parameter MomentOfInertia Je=Pn*Ta/omegan_el^2 
      "Moment of inertia referred to electrical angles";
    parameter MomentOfInertia Jm=Np^2*Je "Mechanical moment of inertia";
    parameter Time Topen=10 "Time of breaker opening";
    Electrical.Generator generator annotation (extent=[12,12; 32,32]);
    Electrical.Load load(Wn=Pn) annotation (extent=[32,2; 52,22], rotation=0);
    annotation (Diagram,
      experiment(StopTime=4, Tolerance=1e-009),
      Documentation(info="<html>
<p>The model is designed to test the generator and load components of the <tt>Electrical</tt> library.<br>
Simulation sequence:
<ul>
    <li>t=0 s: The system starts at equilibrium
    <li>t=1 s: The torque is brought to zero.
    <li>t=2 s: After 10% of the turbine acceleration time, the frequency has dropped by around 10%. The approximation is due to nonlinear effects.
</ul>
<p>
Simulation Interval = [0...2] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</p>
</html>",
        revisions="<html>
<ul>
        <li><i>21 Jul 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
        First release.</li>
</ul>
</html>
"));
    Modelica.Mechanics.Rotational.Inertia turboGenInertia(J=Jm) 
      annotation (extent=[-16,12; 4,32]);
    Modelica.Mechanics.Rotational.Torque primeMover 
      annotation (extent=[-54,12; -34,32]);
    import Modelica.Constants.*;
    
    Modelica.Blocks.Sources.Step GenTorque(
      height=-0.1*Pn/omegan_m,
      offset=Pn/omegan_m,
      startTime=1)          annotation (extent=[-96,12; -76,32]);
    Electrical.Grid grid(Pn=1e9) annotation (extent=[76,12; 96,32]);
    Electrical.Breaker Breaker1 annotation (extent=[50,10; 70,30]);
    Modelica.Blocks.Sources.Step LocalLoad(
      height=0.1*Pn,
      offset=Pn,
      startTime=2)          annotation (extent=[-20,-24; 0,-4]);
    Modelica.Blocks.Sources.BooleanStep BreakerCommand(startTime=3,
        startValue=true)   annotation (extent=[10,60; 30,80]);
  equation 
    connect(generator.powerConnection, load.connection)  annotation (points=[
          30.6,22; 36.35,22; 36.35,20.7; 41.9,20.7],style(pattern=0,
          thickness=2));
    connect(turboGenInertia.flange_b, generator.shaft) annotation (points=[4,
          22; 13.4,22],     style(color=0, rgbcolor={0,0,0}));
    connect(primeMover.flange_b, turboGenInertia.flange_a) 
      annotation (points=[-34,22; -16,22], style(color=0, rgbcolor={0,0,0}));
    connect(GenTorque.y,primeMover.tau)       annotation (points=[-75,22; -56,
          22],                 style(color=3, rgbcolor={0,0,255}));
    connect(Breaker1.connection2, grid.connection) annotation (points=[68.6,
          20; 74,20; 74,22; 77.4,22], style(pattern=0, thickness=2));
    connect(load.connection, Breaker1.connection1) annotation (points=[41.9,
          20.7; 45.95,20.7; 45.95,20; 51.4,20], style(pattern=0, thickness=2));
  initial equation 
   load.f=50;
  equation 
    connect(LocalLoad.y,       load.powerConsumption) annotation (points=[1,
          -14; 20,-14; 20,12; 38.7,12], style(color=3, rgbcolor={0,0,255}));
    connect(BreakerCommand.y,       Breaker1.closed) annotation (points=[31,
          70; 60,70; 60,28], style(color=5, rgbcolor={255,0,255}));
  end TestElectrical2;
  
  model TestST1 
    package Medium=Modelica.Media.Water.StandardWater;
    parameter MassFlowRate w=1;
    parameter Pressure pin=60e5;
    parameter Pressure pcond=0.08e5;
    parameter PerUnit eta_iso=0.92;
    parameter PerUnit eta_mech=0.98;
    parameter AngularVelocity omega=314;
    parameter SpecificEnthalpy hin=2.949e6;
    parameter SpecificEnthalpy hout_iso=2.240e6;
    parameter SpecificEnthalpy hout=hin-eta_iso*(hin-hout_iso);
    parameter Power Pnet=eta_iso*eta_mech*w*(hin-hout_iso);
    parameter Torque tau=0.8*Pnet/omega;
    parameter Time Ta=10 "Turbine acceleration time";
    parameter MomentOfInertia J=Pnet*Ta/omega^2;
    parameter HydraulicResistance Kv=1/2e5;
    parameter PerUnit theta0(fixed=false)=1;
    
    Water.SteamTurbineUnit ST(
      hpFraction=0.63,
      T_HP=0.2,
      T_LP=3.4,
      hstartin=2.9e6,
      hstartout=2.24e6,
      pnom=pin,
      wnom=w,
      pstartin=pin,
      eta_iso=eta_iso,
      redeclare package Medium=Medium) 
                       annotation (extent=[-22,-2; 10,30]);
    Water.SourceP SourceP1(p0=pin, h=hin) 
      annotation (extent=[-98,16; -78,36]);
    annotation (Diagram, uses(Modelica(version="1.6")),
      experiment(
        StopTime=5,
        fixedstepsize=1e-005,
        Algorithm=""),
      experimentSetupOutput,
      Documentation(info="<html>
<p>This model is designed to test the <tt>SteamTurbineUnit</tt> component when connected to an inertial load. Simulation sequence:
<ul>
    <li>t=0 s: The system starts at equilibrium
    <li>t=1 s: The throttle valve opening is reduced.
    <li>t=5 s: After 4 s the turbine speed has lost rad/s.
</ul>
<p>
Simulation Interval = [0...5] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-4 
</p>
</html>",
        revisions="<html>
<ul>
        <li><i>21 Jul 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
        First release.</li>
</ul>
</html>
"));
    Modelica.Mechanics.Rotational.Inertia Inertia1(J=J) 
      annotation (extent=[28,4; 48,24]);
    Water.SinkP SinkP1(p0=pcond) 
      annotation (extent=[38,-38; 58,-18]);
    Water.ValveLin ValveLin1(Kv=Kv) 
      annotation (extent=[-70,16; -50,36]);
    Modelica.Blocks.Sources.Step Step1(
      height=-0.01,
      offset=theta0,
      startTime=1)     annotation (extent=[-106,72; -86,92]);
    Modelica.Mechanics.Rotational.Torque Load 
      annotation (extent=[80,4; 60,24]);
    Modelica.Blocks.Sources.Constant TorqueLoad(k=-tau) 
      annotation (extent=[46,46; 66,66]);
    Water.SensT SensT1(redeclare package Medium=Medium) 
                       annotation (extent=[-46,20; -26,40]);
  equation 
    connect(ST.shaft_b, Inertia1.flange_a) 
      annotation (points=[9.84,14; 28,14], style(color=0, rgbcolor={0,0,0}));
    connect(ST.outlet, SinkP1.flange) 
      annotation (points=[10,2.8; 10,-28; 38,-28]);
    connect(SourceP1.flange, ValveLin1.inlet) 
      annotation (points=[-78,26; -70,26]);
    connect(Step1.y,       ValveLin1.cmd) annotation (points=[-85,82; -60,82;
          -60,34], style(color=3, rgbcolor={0,0,255}));
    connect(Inertia1.flange_b, Load.flange_b) 
      annotation (points=[48,14; 60,14], style(color=0, rgbcolor={0,0,0}));
    connect(TorqueLoad.y,Load.tau)           annotation (points=[67,56; 94,56;
          94,14; 82,14], style(color=3, rgbcolor={0,0,255}));
  initial equation 
    ST.phi=0;
    ST.omega=omega;
    der(ST.omega)=0;
    der(ST.P_HP)=0;
    der(ST.P_LP)=0;
  equation 
    connect(ValveLin1.outlet, SensT1.inlet) 
      annotation (points=[-50,26; -42,26]);
    connect(SensT1.outlet, ST.inlet) 
      annotation (points=[-30,26; -26,26; -26,25.2; -22,25.2]);
  end TestST1;
  
  model TestST2 
    package Medium=Modelica.Media.Water.StandardWater;
    parameter MassFlowRate w=1;
    parameter Pressure pin=60e5;
    parameter Pressure pcond=0.08e5;
    parameter PerUnit eta_iso=0.92;
    parameter PerUnit eta_mech=0.98;
    parameter AngularVelocity omega=314;
    parameter SpecificEnthalpy hin=2.949e6;
    parameter SpecificEnthalpy hout_iso=2.240e6;
    parameter SpecificEnthalpy hout=hin-eta_iso*(hin-hout_iso);
    parameter Power Pnet=eta_iso*eta_mech*w*(hin-hout_iso);
    parameter Torque tau=0.8*Pnet/omega;
    parameter Time Ta=10 "Turbine acceleration time";
    parameter MomentOfInertia J=Pnet*Ta/omega^2;
    parameter HydraulicResistance Kv=1/2e5;
    parameter PerUnit theta0=0.3;
    
    Water.SteamTurbineUnit ST(
      hpFraction=0.63,
      T_HP=0.2,
      T_LP=3.4,
      hstartin=2.9e6,
      hstartout=2.8e6,
      pnom=pin,
      wnom=w,
      pstartin=pin,
      eta_iso=eta_iso,
      redeclare package Medium=Medium) 
                       annotation (extent=[-22,-2; 10,30]);
    Water.SourceP SourceP1(         p0=pin, h=hin) 
      annotation (extent=[-98,16; -78,36]);
    annotation (Diagram, uses(Modelica(version="1.6")),
      experiment(
        StopTime=10,
        fixedstepsize=1e-005,
        Algorithm=""),
      experimentSetupOutput,
      Documentation(info="<html>
<p>This model is designed to test the <tt>SteamTurbineUnit</tt> component when connected to a fixed speed load. Simulation sequence:
<ul>
    <li>t=0 s: The system starts at equilibrium
    <li>t=1 s: The throttle valve opening is reduced.
    <li>t=10 s: After 9 s the torque applied to the load has been reduced by 6%.
</ul>
<p>
Simulation Interval = [0...10] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-4 
</p>
</html>",
        revisions="<html>
<ul>
        <li><i>21 Jul 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
        First release.</li>
</ul>
</html>
"));
    Modelica.Mechanics.Rotational.Inertia Inertia1(J=J) 
      annotation (extent=[28,4; 48,24]);
    Water.SinkP SinkP1(p0=pcond) 
      annotation (extent=[38,-38; 58,-18]);
    Water.ValveLin ValveLin1(Kv=Kv) 
      annotation (extent=[-62,16; -42,36]);
    Modelica.Blocks.Sources.Step Step1(
      height=-0.1,
      offset=theta0,
      startTime=1)     annotation (extent=[-92,58; -72,78]);
    Modelica.Mechanics.Rotational.Speed Speed1(exact=true) 
      annotation (extent=[76,4; 56,24]);
    Modelica.Blocks.Sources.Constant Constant1(k=omega) 
      annotation (extent=[46,50; 66,70]);
  equation 
    connect(ST.shaft_b, Inertia1.flange_a) 
      annotation (points=[9.84,14; 28,14], style(color=0, rgbcolor={0,0,0}));
    connect(ST.outlet, SinkP1.flange) 
      annotation (points=[10,2.8; 10,-28; 38,-28]);
    connect(ValveLin1.outlet, ST.inlet) 
      annotation (points=[-42,26; -31.84,26; -31.84,25.2; -22,25.2]);
    connect(SourceP1.flange, ValveLin1.inlet) 
      annotation (points=[-78,26; -62,26]);
    connect(Step1.y,       ValveLin1.cmd) annotation (points=[-71,68; -52,68;
          -52,34], style(color=3, rgbcolor={0,0,255}));
  initial equation 
    ST.phi=0;
    der(ST.P_HP)=0;
    der(ST.P_LP)=0;
  equation 
    connect(Constant1.y,Speed1.w_ref)         annotation (points=[67,60; 96,
          60; 96,14; 78,14], style(color=3, rgbcolor={0,0,255}));
    connect(Speed1.flange_b, Inertia1.flange_b) 
      annotation (points=[56,14; 48,14], style(color=0, rgbcolor={0,0,0}));
  end TestST2;
  
  model TestConvHT2N 
    parameter Integer Nbig = 6;
    parameter Integer Nsmall = 3;
    Thermal.ConvHT2N HTa(
      gamma=100,
      N1=Nbig,
      N2=Nsmall) annotation (extent=[-60,-12; -20,28]);
    Thermal.TempSource1Dlin T1a(N=Nbig) 
                                     annotation (extent=[-60,16; -20,56]);
    annotation (Diagram, Documentation(info="<html>
<p>This model is designed to test the <tt>ConvHT2N</tt> model.
<p> HTa tests the case with a bigger number of nodes on side1, HTb the case with an equal number of nodes on both sides, and HTc the case with a smaller number of nodes on side 1. It is possible to change <tt>Nbig</tt> and <tt>Nsmall</tt> to any value.
</html>", revisions="<html>
<ul>
        <li><i>12 May 2005</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>, 
        First release.</li>
</ul>
</html>

"));
    Thermal.TempSource1Dlin T2a(N=Nsmall) 
                                     annotation (extent=[-60,0; -20,-40]);
    Modelica.Blocks.Sources.Constant Constant1(k=300) 
      annotation (extent=[-80,50; -60,70]);
    Modelica.Blocks.Sources.Constant Constant2(k=400) 
      annotation (extent=[-56,70; -36,90]);
    Modelica.Blocks.Sources.Constant Constant3(k=280) 
      annotation (extent=[-92,-64; -72,-44]);
    Modelica.Blocks.Sources.Constant Constant4(k=350) 
      annotation (extent=[-68,-90; -48,-70]);
    Thermal.ConvHT2N HTb(
      gamma=100,
      N1=Nsmall,
      N2=Nsmall) annotation (extent=[-16,-12; 24,28]);
    Thermal.TempSource1Dlin T1b(N=Nsmall) 
                                     annotation (extent=[-16,16; 24,56]);
    Thermal.TempSource1Dlin T2b(N=Nsmall) 
                                     annotation (extent=[-16,0; 24,-40]);
    Thermal.ConvHT2N HTc(
      gamma=100,
      N1=Nsmall,
      N2=Nbig)   annotation (extent=[30,-12; 70,28]);
    Thermal.TempSource1Dlin T1c(N=Nsmall) 
                                     annotation (extent=[30,16; 70,56]);
    Thermal.TempSource1Dlin T2c(N=Nbig) 
                                     annotation (extent=[30,0; 70,-40]);
  equation 
    connect(T1a.wall, HTa.side1)      annotation (points=[-40,30; -40,14],
        style(color=45, rgbcolor={255,127,0}));
    connect(HTa.side2, T2a.wall)      annotation (points=[-40,1.8; -40,-14],
        style(color=45, rgbcolor={255,127,0}));
    connect(Constant1.y, T1a.temperature_node1) 
                                               annotation (points=[-59,60; -48,
          60; -48,42], style(color=74, rgbcolor={0,0,127}));
    connect(Constant2.y, T1a.temperature_nodeN) 
                                               annotation (points=[-35,80; -32,
          80; -32,41.6], style(color=74, rgbcolor={0,0,127}));
    connect(Constant3.y, T2a.temperature_node1) 
                                               annotation (points=[-71,-54; -48,
          -54; -48,-26], style(color=74, rgbcolor={0,0,127}));
    connect(Constant4.y, T2a.temperature_nodeN) 
                                               annotation (points=[-47,-80; -32,
          -80; -32,-25.6], style(color=74, rgbcolor={0,0,127}));
    connect(T1b.wall, HTb.side1)      annotation (points=[4,30; 4,14],
        style(color=45, rgbcolor={255,127,0}));
    connect(HTb.side2, T2b.wall)      annotation (points=[4,1.8; 4,-14],
        style(color=45, rgbcolor={255,127,0}));
    connect(T1c.wall, HTc.side1)      annotation (points=[50,30; 50,14],
        style(color=45, rgbcolor={255,127,0}));
    connect(HTc.side2, T2c.wall)      annotation (points=[50,1.8; 50,-14],
        style(color=45, rgbcolor={255,127,0}));
    connect(Constant3.y, T2b.temperature_node1) annotation (points=[-71,-54; -4,
          -54; -4,-26], style(color=74, rgbcolor={0,0,127}));
    connect(Constant3.y, T2c.temperature_node1) annotation (points=[-71,-54; 42,
          -54; 42,-26], style(color=74, rgbcolor={0,0,127}));
    connect(Constant4.y, T2b.temperature_nodeN) annotation (points=[-47,-80; 12,
          -80; 12,-25.6], style(color=74, rgbcolor={0,0,127}));
    connect(Constant4.y, T2c.temperature_nodeN) annotation (points=[-47,-80; 58,
          -80; 58,-25.6], style(color=74, rgbcolor={0,0,127}));
    connect(Constant1.y, T1b.temperature_node1) annotation (points=[-59,60; -4,
          60; -4,42], style(color=74, rgbcolor={0,0,127}));
    connect(Constant1.y, T1c.temperature_node1) annotation (points=[-59,60; 42,
          60; 42,42], style(color=74, rgbcolor={0,0,127}));
    connect(Constant2.y, T1b.temperature_nodeN) annotation (points=[-35,80; 12,
          80; 12,41.6], style(color=74, rgbcolor={0,0,127}));
    connect(Constant2.y, T1c.temperature_nodeN) annotation (points=[-35,80; 58,
          80; 58,41.6], style(color=74, rgbcolor={0,0,127}));
  end TestConvHT2N;
  
  model TestGasFlow1D 
    package Medium=Modelica.Media.IdealGases.MixtureGases.AirSteam;
    parameter Integer Nnodes=10 "number of Nodes";
    parameter Modelica.SIunits.Length Lhex=200 "total length";
    parameter Modelica.SIunits.Diameter Dihex=0.02 "internal diameter";
    parameter Modelica.SIunits.Radius rhex=Dihex/2 "internal radius";
    parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex 
      "internal perimeter";
    parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2 
      "internal cross section";
    parameter Real Cfhex=0.005 "friction coefficient";
    parameter Modelica.SIunits.MassFlowRate whex=0.05 
      "nominal (and initial) mass flow rate";
    parameter Modelica.SIunits.Pressure phex=3e5 "initial pressure";
    parameter Temperature Tinhex=300 "initial inlet temperature";
    parameter Temperature Touthex=300 "initial outlet temperature";
   // parameter Temperature deltaT=10 "height of temperature step";
    parameter Modelica.SIunits.EnergyFlowRate W=1e3 "height of power step";
    parameter Real deltaX[2]={.25,-.25} "offset and height of composition step";
    
    Gas.SourceW SourceW1(
      redeclare package Medium = Medium,
      p0=phex,
      T=Tinhex,
      w0=whex) annotation (extent=[-80,-6; -60,14]);
    Gas.SinkP SinkP1(
      redeclare package Medium = Medium,
      p0=0.1e5,
      T=300) annotation (extent=[76,-6; 96,14]);
    Gas.SensT SensT1(redeclare package Medium = Medium) 
      annotation (extent=[-48,-2; -28,18]);
    Gas.SensT SensT2(redeclare package Medium = Medium) 
      annotation (extent=[46,-2; 66,18]);
    Gas.Flow1D Flow1D1(
      redeclare package Medium = Medium,
      N=Nnodes,
      L=Lhex,
      A=Ahex,
      omega=omegahex,
      Dhyd=Dihex,
      wnom=whex,
      Cfnom=Cfhex,
      Tstartin=Tinhex,
      Tstartout=Touthex,
      pstart=phex,
      UniformComposition=true,
      FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
                    annotation (extent=[-14,-6; 6,14]);
    Gas.ValveLin ValveLin1(redeclare package Medium = Medium, Kv=whex/phex) 
      annotation (extent=[20,-6; 40,14]);
    Thermal.HeatSource1D HeatSource1D1(
      N=Nnodes,
      L=Lhex,
      omega=omegahex) annotation (extent=[-16,20; 4,40]);
    Modelica.Blocks.Sources.Step Step1(height=W, startTime=20) 
      annotation (extent=[-30,50; -10,70]);
  /*  Modelica.Blocks.Sources.Step Step3(
    height=deltaT,
    offset=Tinhex,
    startTime=1) annotation 10;*/
    Modelica.Blocks.Sources.Step Step4(
      height=10,
      offset=Tinhex,
      startTime=10) annotation (extent=[-110,14; -90,34]);
    Modelica.Blocks.Sources.Step Step2(
      height=-0.2,
      offset=1,
      startTime=30) 
      annotation (extent=[8,46; 28,66]);
  equation 
    connect(SourceW1.flange, SensT1.inlet) annotation (points=[-60,4; -44,4],
        style(color=76, rgbcolor={159,159,223}));
    connect(SensT1.outlet, Flow1D1.infl)   annotation (points=[-32,4; -14,4],
        style(color=76, rgbcolor={159,159,223}));
    connect(Flow1D1.outfl, ValveLin1.inlet)   annotation (points=[6,4; 20,4],
        style(color=76, rgbcolor={159,159,223}));
    connect(ValveLin1.outlet, SensT2.inlet) annotation (points=[40,4; 50,4],
        style(color=76, rgbcolor={159,159,223}));
    connect(SensT2.outlet, SinkP1.flange) annotation (points=[62,4; 76,4],
        style(color=76, rgbcolor={159,159,223}));
    connect(HeatSource1D1.wall, Flow1D1.wall)   annotation (points=[-6,27; -6,
          9; -4,9],     style(color=45, rgbcolor={255,127,0}));
    connect(Step1.y, HeatSource1D1.power) annotation (points=[-9,60; -6,60;
          -6,34], style(color=74, rgbcolor={0,0,127}));
    connect(Step4.y, SourceW1.in_T) annotation (points=[-89,24; -70,24; -70,9],
        style(color=74, rgbcolor={0,0,127}));
    connect(Step2.y, ValveLin1.cmd) annotation (points=[29,56; 42,56; 42,32;
          30,32; 30,11], style(color=74, rgbcolor={0,0,127}));
    annotation (Diagram, experiment(StopTime=50),
      Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Gas.Flow1D</tt> (fluid side of a heat exchanger, finite volumes).<br>
The model starts at steady state. At t = 10 s, step variation of the temperature of the fluid entering the heat exchanger. At t = 20 s, step variation of the thermal flow entering the heat exchanger lateral surface. At t = 30 s, step reduction of the outlet valve opening.
</ul>
<p>
Simulation Interval = [0...50] sec <br> 
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6 
</HTML>"));
  end TestGasFlow1D;
  
  model TestGasPlenum 
    package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
    annotation (Diagram, Documentation(info="<html>
This model tests the <tt>Plenum</tt> model.
<p>Simulate for 1 s. The model starts at steady state. At t = 0.3 the inlet pressure is increased. At t = 0.6 the valve is partially closed.
</html>"),
      experiment(Tolerance=1e-006));
    Gas.ValveLin ValveLin1(redeclare package Medium = Medium, Kv=2.5e-5) 
      annotation (extent=[-38,24; -18,44]);
    Modelica.Blocks.Sources.Ramp Ramp1(
      offset=1,
      height=-.3,
      duration=0.01,
      startTime=0.6) 
      annotation (extent=[-52,52; -32,72]);
    Gas.SourceP SourceP1(
      redeclare package Medium = Medium,
      p0=5e5,
      T=450)     annotation (extent=[-78,24; -58,44]);
    Gas.Plenum Plenum1(
      redeclare package Medium = Medium,
      Tstart=400,
      initOpt=ThermoPower.Choices.Init.Options.steadyState,
      inlet(w(start=1.5)),
      pstart=4e5,
      V=0.1) 
            annotation (extent=[4,24; 24,44]);
    Modelica.Blocks.Sources.Ramp Ramp2(
      startTime=0.3,
      height=3e5,
      offset=5e5,
      duration=0.01) annotation (extent=[-100,54; -80,74]);
    Gas.SinkP SinkP1(
      redeclare package Medium = Medium,
      p0=2e5,
      T=300) annotation (extent=[82,24; 102,44]);
    Gas.PressDrop PressDrop1(
      redeclare package Medium = Medium,
      pstart=4e5,
      dpnom=2e5,
      Tstart=400,
      rhonom=3,
      A=1,
      wnom=1.5,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) 
                annotation (extent=[44,24; 64,44]);
  equation 
    connect(Ramp1.y, ValveLin1.cmd)   annotation (points=[-31,62; -28,62; -28,
          41],         style(color=74, rgbcolor={0,0,127}));
    connect(ValveLin1.outlet, Plenum1.inlet)     annotation (points=[-18,34;
          4,34],    style(color=76, rgbcolor={159,159,223}));
    connect(Ramp2.y, SourceP1.in_p)   annotation (points=[-79,64; -74,64; -74,
          40.4],               style(color=74, rgbcolor={0,0,127}));
    connect(SourceP1.flange, ValveLin1.inlet) annotation (points=[-58,34; -38,
          34], style(color=76, rgbcolor={159,159,223}));
    connect(Plenum1.outlet, PressDrop1.inlet) annotation (points=[24,34; 44,
          34], style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop1.outlet, SinkP1.flange) annotation (points=[64,34; 82,
          34], style(color=76, rgbcolor={159,159,223}));
  end TestGasPlenum;
  
  model TestGasHeader 
    package Medium=Modelica.Media.IdealGases.MixtureGases.AirSteam;
    parameter Real Xnom[Medium.nX]={0.3,0.7};
    Gas.Header Header1(
      redeclare package Medium = Medium,
      Xstart=Xnom,
      Tmstart=300,
      gamma=0.5,
      Cm=1,
      Tstart=450,
      S=0.1,
      pstart=4e5,
      initOpt=ThermoPower.Choices.Init.Options.steadyState,
      V=1)  annotation (extent=[2,-10; 22,10]);
    Gas.ValveLin ValveLin1(redeclare package Medium = Medium, Kv=0.3e-3) 
      annotation (extent=[32,-10; 52,10]);
    Gas.SinkP SinkP2(
      redeclare package Medium = Medium,
      Xnom=Xnom,
      p0=2e5,
      T=350)    annotation (extent=[68,-10; 88,10]);
    Gas.PressDrop PressDrop1(
      redeclare package Medium = Medium,
      Xstart=Xnom,
      rhonom=5,
      pstart=5e5,
      Tstart=450,
      wnom=1,
      dpnom=1e5,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) 
                annotation (extent=[-34,-10; -14,10]);
    Modelica.Blocks.Sources.Step Step1(
      offset=1,
      height=-.3,
      startTime=0.1) annotation (extent=[6,26; 26,46]);
    Gas.SourceW SourceW1(
      redeclare package Medium = Medium,
      Xnom=Xnom,
      w0=5,
      p0=5e5,
      T=450) annotation (extent=[-76,-10; -56,10]);
  initial equation 
  equation 
    connect(ValveLin1.outlet, SinkP2.flange)     annotation (points=[52,0; 68,
          0],     style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop1.outlet, Header1.inlet) annotation (points=[-14,0; 2,0],
        style(color=76, rgbcolor={159,159,223}));
    connect(Header1.outlet, ValveLin1.inlet) annotation (points=[22,0; 32,0],
                       style(color=76, rgbcolor={159,159,223}));
    connect(Step1.y, ValveLin1.cmd) annotation (points=[27,36; 34,36; 34,7;
          42,7], style(color=74, rgbcolor={0,0,127}));
    connect(SourceW1.flange, PressDrop1.inlet) annotation (points=[-56,0; -34,
          0], style(color=76, rgbcolor={159,159,223}));
    annotation (
      Icon,
      Diagram,
      uses(Modelica(version="2.1")),
      Documentation(info="<html>
This model tests the <tt>Header</tt> model.

<p>Simulate for 1 s. The model starts at steady state. At t=0.1 the valve is partially closed.
</html>"),
      experiment,
      experimentSetupOutput);
  end TestGasHeader;
  
  model TestGasMixer 
    package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
    parameter Real wext=10;
    Gas.Mixer Mixer1(
      redeclare package Medium = Medium,
      Tmstart=300,
      gamma=0.8,
      S=1,
      V=3,
      Tstart=450,
      pstart=4e5,
      initOpt=ThermoPower.Choices.Init.Options.steadyState) 
             annotation (extent=[-46,10; -26,30]);
    Gas.PressDrop PressDrop1(
      redeclare package Medium = Medium,
      A=0.1,
      dpnom=1e5,
      rhonom=3.5,
      wnom=wext,
      pstart=4e5,
      Tstart=400,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) 
             annotation (extent=[-12,10; 10,30]);
    Gas.SinkP SinkP1(
      redeclare package Medium = Medium,
      p0=1e5,
      T=350)  annotation (extent=[66,10; 86,30]);
    Gas.SourceW SourceW2(
      redeclare package Medium = Medium,
      w0=15,
      p0=4e5,
      T=350,
      Xnom={0.5,0.5}) 
             annotation (extent=[-82,-10; -62,10]);
    Modelica.Blocks.Sources.Step Step1(
      height=-.2,
      offset=1.5,
      startTime=15)  annotation (extent=[0,52; 20,72]);
    Gas.Valve Valve1(
      redeclare package Medium = Medium,
      Tstart=400,
      dpnom=2e5,
      pnom=3e5,
      wnom=wext,
      Av=5e-4,
      CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) 
               annotation (extent=[30,10; 50,30]);
    Modelica.Blocks.Sources.Ramp Ramp1(
      offset=wext,
      height=-1,
      duration=0.1,
      startTime=8) 
                 annotation (extent=[-114,14; -94,34]);
    Modelica.Blocks.Sources.Ramp Ramp2(
      height=-1,
      offset=5,
      duration=0.1,
      startTime=1) annotation (extent=[-114,64; -94,84]);
    Gas.SourceW SourceW1(
      redeclare package Medium = Medium,
      p0=4e5,
      T=450)     annotation (extent=[-86,36; -66,56]);
  equation 
    connect(Mixer1.out, PressDrop1.inlet)     annotation (points=[-26,20; -12,
          20],
        style(color=76, rgbcolor={159,159,223}));
    connect(SourceW2.flange, Mixer1.in2)     annotation (points=[-62,0; -44,0;
          -44,14],         style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop1.outlet, Valve1.inlet) annotation (points=[10,20; 30,20],
        style(color=76, rgbcolor={159,159,223}));
    connect(Valve1.outlet, SinkP1.flange) annotation (points=[50,20; 66,20],
        style(color=76, rgbcolor={159,159,223}));
    connect(Step1.y, Valve1.theta) annotation (points=[21,62; 36,62; 36,27.2;
          40,27.2], style(color=74, rgbcolor={0,0,127}));
    connect(Ramp1.y, SourceW2.in_w0) annotation (points=[-93,24; -86,24; -86,
          5; -78,5], style(color=74, rgbcolor={0,0,127}));
    connect(SourceW1.flange, Mixer1.in1) annotation (points=[-66,46; -54,46;
          -54,26; -44,26], style(color=76, rgbcolor={159,159,223}));
    connect(Ramp2.y, SourceW1.in_w0) annotation (points=[-93,74; -88,74; -88,
          51; -82,51], style(color=74, rgbcolor={0,0,127}));
  annotation (Diagram, experiment(StopTime=20),
      Documentation(info="<html>
This model tests the <tt>Mixer</tt> model. 
<p>
Simulate for 20 s. At time t=1 the first inlet flow rate is reduced. At time t=8 the second inlet flow rate is reduced. At time t=15, the outlet valve is partially closed.
</html>"));
  end TestGasMixer;
  
  model TestCC 
    annotation (uses(ThermoPower(version="2"), Modelica(version="2.2")), Diagram,
      Documentation(info="<html>
This model tests the <tt>CombustionChamber</tt> model. The model start at steady state. At time t = 0.5, the fuel flow rate is reduced by 10%.

<p>Simulate for 5s. 
</html>"),
      experiment(StopTime=5));
    ThermoPower.Gas.SourceW Wcompressor(redeclare package Medium = 
          ThermoPower.Media.Air,
      w0=158,
      T=616.95) 
      annotation (extent=[-68,-10; -48,10]);
    ThermoPower.Gas.CombustionChamber CombustionChamber1(
      initOpt=ThermoPower.Choices.Init.Options.steadyState,
      HH=41.6e6,
      pstart=11.2e5,
      V=0.1,
      S=0.1)           annotation (extent=[-38,-10; -18,10]);
    ThermoPower.Gas.SourceW Wfuel(redeclare package Medium = 
          ThermoPower.Media.NaturalGas) 
      annotation (extent=[-50,28; -30,48]);
    ThermoPower.Gas.PressDrop PressDrop1(
      redeclare package Medium = ThermoPower.Media.FlueGas,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
      rhonom=3.3,
      wnom=158.9,
      pstart=11.2e5,
      dpnom=0.426e5)  annotation (extent=[-4,-10; 16,10]);
    ThermoPower.Gas.SensT SensT1(redeclare package Medium = 
          ThermoPower.Media.FlueGas) annotation (extent=[26,-6; 46,14]);
    Modelica.Blocks.Sources.Step Step1(
      startTime=0.5,
      height=-0.3,
      offset=3.1)    annotation (extent=[-78,56; -58,76]);
    ThermoPower.Gas.ValveLin ValveLin1(redeclare package Medium = 
          ThermoPower.Media.FlueGas, Kv=161.1/9.77e5) 
      annotation (extent=[54,-10; 74,10]);
    ThermoPower.Gas.SinkP SinkP1(redeclare package Medium = 
          ThermoPower.Media.FlueGas) annotation (extent=[84,-10; 104,10]);
    Modelica.Blocks.Sources.Constant Constant1 
      annotation (extent=[22,28; 42,48]);
  equation 
    connect(Wfuel.flange, CombustionChamber1.inf) annotation (points=[-30,38;
          -28,38; -28,10],
                      style(color=76, rgbcolor={159,159,223}));
    connect(Wcompressor.flange, CombustionChamber1.ina) annotation (points=[-48,
          0; -38,0],
                  style(color=76, rgbcolor={159,159,223}));
    connect(CombustionChamber1.out, PressDrop1.inlet) 
      annotation (points=[-18,0; -4,0],
                                      style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop1.outlet, SensT1.inlet) 
      annotation (points=[16,0; 30,0], style(color=76, rgbcolor={159,159,223}));
    connect(Step1.y, Wfuel.in_w0) annotation (points=[-57,66; -46,66; -46,43], style(
          color=74, rgbcolor={0,0,127}));
    connect(ValveLin1.outlet, SinkP1.flange) annotation (points=[74,0; 84,0],
        style(color=76, rgbcolor={159,159,223}));
    connect(SensT1.outlet, ValveLin1.inlet) annotation (points=[42,0; 54,0],
        style(color=76, rgbcolor={159,159,223}));
    connect(Constant1.y, ValveLin1.cmd) annotation (points=[43,38; 64,38; 64,7],
        style(color=74, rgbcolor={0,0,127}));
  end TestCC;
  
  model TestGasPressDrop 
    package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
    Gas.SourceP SourceP1(
      redeclare package Medium = Medium,
      T=400,
      p0=5e5)      annotation (extent=[-68,30; -48,50]);
    Modelica.Blocks.Sources.Step Step1(
      startTime=2,
      height=-.3,
      offset=1)      annotation (extent=[26,62; 46,82]);
    Gas.PressDropLin PressDropLin1(redeclare package Medium = Medium, R=5.5e4) 
      annotation (extent=[6,30; 26,50]);
    Gas.SinkP SinkP1(
      redeclare package Medium = Medium,
      T=300,
      p0=3e5)    annotation (extent=[70,30; 90,50]);
    Gas.PressDrop PressDrop1(
      redeclare package Medium = Medium,
      dpnom=2e5,
      pstart=5e5,
      Tstart=400,
      rhonom=3,
      wnom=1,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) 
                 annotation (extent=[-30,30; -10,50]);
    Gas.Valve Valve1(
      redeclare package Medium = Medium,
      dpnom=1.5e5,
      pnom=2.5e5,
      Av=20e-4,
      wnom=1,
      redeclare function FlowChar = Functions.linear,
      redeclare function xtfun = Functions.one,
      CvData=ThermoPower.Choices.Valve.CvTypes.Av) 
               annotation (extent=[42,30; 62,50]);
    Modelica.Blocks.Sources.Sine Sine1(
      phase=0,
      offset=5e5,
      startTime=0.1,
      freqHz=0.2,
      amplitude=3e5) 
                   annotation (extent=[-96,66; -76,86]);
    Gas.SourceP SourceP2(
      redeclare package Medium = Medium,
      T=400,
      p0=5e5)      annotation (extent=[-68,-46; -48,-26]);
    Modelica.Blocks.Sources.Step Step2(
      startTime=2,
      height=-.3,
      offset=1)      annotation (extent=[26,-14; 46,6]);
    Gas.PressDropLin PressDropLin2(redeclare package Medium = Medium, R=0.5e5) 
      annotation (extent=[6,-46; 26,-26]);
    Gas.SinkP SinkP2(
      redeclare package Medium = Medium,
      T=300,
      p0=3e5)    annotation (extent=[70,-46; 90,-26]);
    Gas.PressDrop PressDrop2(
      redeclare package Medium = Medium,
      dpnom=2e5,
      pstart=5e5,
      Tstart=400,
      rhonom=3,
      wnom=1,
      Kf=8e5,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf) 
                 annotation (extent=[-30,-46; -10,-26]);
    Gas.Valve Valve2(
      redeclare package Medium = Medium,
      dpnom=1.5e5,
      pnom=2.5e5,
      Av=20e-4,
      wnom=1,
      CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) 
               annotation (extent=[40,-46; 60,-26]);
    Modelica.Blocks.Sources.Sine Sine2(
      phase=0,
      startTime=0.1,
      freqHz=0.2,
      amplitude=5e5,
      offset=7e5)  annotation (extent=[-96,-10; -76,10]);
  initial equation 
    Valve2.w=1;
  equation 
    connect(PressDrop1.outlet, PressDropLin1.inlet)     annotation (points=[
          -10,40; 6,40], style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop1.inlet, SourceP1.flange)     annotation (points=[-30,40;
          -48,40],style(color=76, rgbcolor={159,159,223}));
    connect(Valve1.outlet, SinkP1.flange) annotation (points=[62,40; 70,40],
        style(color=76, rgbcolor={159,159,223}));
    connect(Step1.y, Valve1.theta) annotation (points=[47,72; 50,72; 50,47.2;
          52,47.2],style(color=74, rgbcolor={0,0,127}));
    connect(PressDropLin1.outlet, Valve1.inlet) annotation (points=[26,40; 42,
          40],style(color=76, rgbcolor={159,159,223}));
    connect(Sine1.y, SourceP1.in_p)    annotation (points=[-75,76; -64,76;
          -64,46.4],style(color=74, rgbcolor={0,0,127}));
    connect(PressDrop2.outlet,PressDropLin2. inlet)     annotation (points=[
          -10,-36; 6,-36],
                         style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop2.inlet,SourceP2. flange)     annotation (points=[-30,
          -36; -48,-36],
                  style(color=76, rgbcolor={159,159,223}));
    connect(Valve2.outlet,SinkP2. flange) annotation (points=[60,-36; 70,-36],
        style(color=76, rgbcolor={159,159,223}));
    connect(Step2.y,Valve2. theta) annotation (points=[47,-4; 50,-4; 50,-28.8],
                   style(color=74, rgbcolor={0,0,127}));
    connect(PressDropLin2.outlet,Valve2. inlet) annotation (points=[26,-36; 40,
          -36],
              style(color=76, rgbcolor={159,159,223}));
    connect(Sine2.y, SourceP2.in_p)    annotation (points=[-75,0; -64,0; -64,
          -29.6],   style(color=74, rgbcolor={0,0,127}));
   annotation (Diagram, uses(Modelica(version="2.1")),
      Documentation(info="<html>
This model tests the <tt>PressDrop</tt>, <tt>PressDropLin</tt> and <tt>Valve</tt> models, testing various conditions, such as different friction coefficients in <tt>PressDrop</tt> and different flow coefficients in <tt>Valve</tt>, by setting the <tt>FFtype</tt> and <tt>CvData</tt> respectively on different value. Reverse flow conditions are also tested.
<p>Simulate for 10 seconds. At time t=2 the valve is partially closed.
</html>"));
  end TestGasPressDrop;
  
  model TestGasValveOpPoint 
    
    package Medium=Media.Air;
    Gas.SourceP SourceP1(redeclare package Medium = Medium, p0=5e5) 
      annotation (extent=[-82,20; -62,40]);
    Gas.SinkP SinkP1(redeclare package Medium = Medium, p0=2.5e5) 
      annotation (extent=[62,20; 82,40]);
    Gas.Valve Valve1(
      redeclare package Medium = Medium,
      pnom=5e5,
      dpnom=1e5,
      wnom=1,
      CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) 
                annotation (extent=[-34,20; -14,40]);
    Gas.Valve Valve2(
      redeclare package Medium = Medium,
      pnom=4e5,
      dpnom=1.5e5,
      wnom=1,
      CheckValve=false,
      CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) 
                annotation (extent=[18,20; 38,40]);
    annotation (Diagram, Documentation(info="<html>
This models tests the Valve model in different operating conditions. The valve flow coefficients are set by the initial operating point; this means that four additional initial equations are needed to fully specify the flow coefficients.
<p>Simulate for 4 s. The valves are partially closed at t = 0.3 and t = 0.7.
</html>"),
      experiment(StopTime=10),
      experimentSetupOutput);
    Modelica.Blocks.Sources.Sine Sine1(
      amplitude=2e5,
      offset=3.5e5,
      freqHz=.4)    annotation (extent=[40,50; 60,70]);
    Modelica.Blocks.Sources.Step Step1(
      offset=1,
      startTime=0.3,
      height=-.5)    annotation (extent=[-52,50; -32,70]);
    Modelica.Blocks.Sources.Step Step2(
      height=-.3,
      offset=1,
      startTime=0.7) annotation (extent=[0,50; 20,70]);
    Gas.SourceP SourceP2(redeclare package Medium = Medium, p0=5e5) 
      annotation (extent=[-80,-70; -60,-50]);
    Gas.SinkP SinkP2(redeclare package Medium = Medium, p0=2.5e5) 
      annotation (extent=[64,-70; 84,-50]);
    Gas.Valve Valve3(
      redeclare package Medium = Medium,
      pnom=5e5,
      dpnom=1e5,
      wnom=1,
      CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) 
                annotation (extent=[-32,-70; -12,-50]);
    Gas.Valve Valve4(
      redeclare package Medium = Medium,
      pnom=4e5,
      dpnom=1.5e5,
      wnom=1,
      CheckValve=true,
      CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) 
                annotation (extent=[20,-70; 40,-50]);
    Modelica.Blocks.Sources.Sine Sine2(
      amplitude=2e5,
      offset=3.5e5,
      freqHz=.4)    annotation (extent=[42,-40; 62,-20]);
    Modelica.Blocks.Sources.Step Step3(
      offset=1,
      startTime=0.3,
      height=-.8)    annotation (extent=[-50,-40; -30,-20]);
    Modelica.Blocks.Sources.Step Step4(
      height=-.3,
      offset=1,
      startTime=0.7) annotation (extent=[2,-40; 22,-20]);
  initial equation 
    Valve1.w=1;
    Valve2.Av=0.25*Valve1.Av;
    Valve3.w=1;
    Valve4.inlet.p=4e5;
    
  equation 
    connect(SourceP1.flange, Valve1.inlet) annotation (points=[-62,30; -34,30],
        style(color=76, rgbcolor={159,159,223}));
    connect(Valve1.outlet, Valve2.inlet) annotation (points=[-14,30; 18,30],
        style(color=76, rgbcolor={159,159,223}));
    connect(Valve2.outlet, SinkP1.flange) annotation (points=[38,30; 62,30],
        style(color=76, rgbcolor={159,159,223}));
    connect(Step1.y, Valve1.theta) annotation (points=[-31,60; -28,60; -28,
          37.2; -24,37.2], style(color=74, rgbcolor={0,0,127}));
    connect(Step2.y, Valve2.theta) annotation (points=[21,60; 24,60; 24,37.2;
          28,37.2], style(color=74, rgbcolor={0,0,127}));
    connect(Sine1.y, SinkP1.in_p) annotation (points=[61,60; 64,60; 64,35.95;
          65.55,35.95], style(color=74, rgbcolor={0,0,127}));
    connect(SourceP2.flange,Valve3. inlet) annotation (points=[-60,-60; -32,
          -60],
        style(color=76, rgbcolor={159,159,223}));
    connect(Valve3.outlet,Valve4. inlet) annotation (points=[-12,-60; 20,-60],
        style(color=76, rgbcolor={159,159,223}));
    connect(Valve4.outlet,SinkP2. flange) annotation (points=[40,-60; 64,-60],
        style(color=76, rgbcolor={159,159,223}));
    connect(Step3.y, Valve3.theta) annotation (points=[-29,-30; -26,-30; -26,
          -52.8; -22,-52.8], style(color=74, rgbcolor={0,0,127}));
    connect(Step4.y, Valve4.theta) annotation (points=[23,-30; 26,-30; 26,
          -52.8; 30,-52.8], style(color=74, rgbcolor={0,0,127}));
    connect(Sine2.y, SinkP2.in_p) annotation (points=[63,-30; 66,-30; 66,
          -54.05; 67.55,-54.05], style(color=74, rgbcolor={0,0,127}));
  end TestGasValveOpPoint;
  
  model TestGasValve 
    package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
    Gas.SourceP SourceP1(
      redeclare package Medium = Medium,
      T=500,
      p0=5e5)    annotation (extent=[-90,10; -70,30]);
    Gas.SinkP SinkP1(
      redeclare package Medium = Medium,
      T=350,
      p0=2.5e5) 
             annotation (extent=[70,10; 90,30]);
    annotation (Diagram,
      experiment(StopTime=10),
      experimentSetupOutput,
      uses(
        ThermoPower(version="2"),
        Modelica(version="2.1",
        Media(         version="0.900"))),
      Documentation(info="<html>
This model tests the <tt>Valve</tt> model, in each possible configuration, i.e. with all the <tt>CvData</tt> options except <tt>OpPoint</tt>, as well as <tt>CheckValve</tt>.

<p>Simulate for 10 s. At time t=1, t=3 and t=6 the valves are partially closed.
</html>"));
    Gas.Valve V1(
      redeclare package Medium = Medium,
      dpnom=1e5,
      wnom=0.5,
      Tstart=500,
      pnom=5e5,
      Cv=165,
      CvData=ThermoPower.Choices.Valve.CvTypes.Cv) 
                 annotation (extent=[-50,10; -30,30]);
    Modelica.Blocks.Sources.Step S2(
      offset=1,
      startTime=6,
      height=-.5)  annotation (extent=[-68,40; -48,60]);
    Gas.Valve V2(
      redeclare package Medium = Medium,
      dpnom=1e5,
      wnom=0.5,
      Tstart=500,
      pnom=4e5,
      Av=30e-4,
      redeclare function FlowChar = Functions.linear,
      redeclare function xtfun = Functions.one,
      CvData=ThermoPower.Choices.Valve.CvTypes.Av) 
                 annotation (extent=[-10,10; 10,30]);
    Gas.Valve V3(
      redeclare package Medium = Medium,
      wnom=0.5,
      Tstart=500,
      dpnom=0.5e5,
      pnom=3e5,
      Kv=132,
      CvData=ThermoPower.Choices.Valve.CvTypes.Kv) 
                 annotation (extent=[30,10; 50,30]);
    Modelica.Blocks.Sources.Step S3(
      offset=1,
      height=-.3,
      startTime=3) annotation (extent=[-24,40; -4,60]);
    Modelica.Blocks.Sources.Step S4(
      offset=1,
      startTime=1,
      height=-.6)  annotation (extent=[14,40; 34,60]);
    Modelica.Blocks.Sources.Sine Sine2(
      freqHz=0.5,
      offset=4e5,
      amplitude=2e5) 
                  annotation (extent=[52,40; 72,60]);
    
    Gas.SourceP SourceP2(
      redeclare package Medium = Medium,
      T=500,
      p0=5e5)    annotation (extent=[-90,-58; -70,-38]);
    Gas.SinkP SinkP2(
      redeclare package Medium = Medium,
      T=350,
      p0=2e5) 
             annotation (extent=[70,-60; 90,-40]);
    Modelica.Blocks.Sources.Step S6(
      offset=1,
      startTime=6,
      height=-.3)  annotation (extent=[-64,-32; -44,-12]);
    Gas.Valve V6(
      redeclare package Medium = Medium,
      CheckValve=false,
      Tstart=500,
      pnom=5e5,
      dpnom=1.5e5,
      Av=12e-4,
      CvData=ThermoPower.Choices.Valve.CvTypes.Av) 
                 annotation (extent=[-50,-60; -30,-40]);
    Modelica.Blocks.Sources.Step S7(
      offset=1,
      startTime=1,
      height=-.5)  annotation (extent=[-26,-32; -6,-12]);
    Modelica.Blocks.Sources.Step S8(
      offset=1,
      startTime=3,
      height=-.5)  annotation (extent=[14,-32; 34,-12]);
    Gas.Valve V7(
      redeclare package Medium = Medium,
      Tstart=500,
      dpnom=0.5e5,
      CheckValve=false,
      pnom=3.5e5,
      Kv=102,
      CvData=ThermoPower.Choices.Valve.CvTypes.Kv) 
                 annotation (extent=[-10,-60; 10,-40]);
    Gas.Valve V8(
      redeclare package Medium = Medium,
      Tstart=500,
      pnom=3e5,
      dpnom=1e5,
      Cv=122,
      CheckValve=true,
      CvData=ThermoPower.Choices.Valve.CvTypes.Cv) 
                 annotation (extent=[30,-60; 50,-40]);
    Modelica.Blocks.Sources.Sine Sine1(
      freqHz=0.5,
      amplitude=2e5,
      offset=4e5) annotation (extent=[46,-34; 66,-14]);
  equation 
    connect(S2.y,V1. theta) annotation (points=[-47,50; -40,50; -40,27.2],
                                                                        style(
          color=74, rgbcolor={0,0,127}));
    connect(V1.outlet,V2. inlet) annotation (points=[-30,20; -10,20],
                                                                    style(
          color=76, rgbcolor={159,159,223}));
    connect(S3.y,V2. theta) annotation (points=[-3,50; 0,50; 0,27.2],   style(
          color=74, rgbcolor={0,0,127}));
    connect(S4.y,V3. theta) annotation (points=[35,50; 40,50; 40,27.2],
                 style(color=74, rgbcolor={0,0,127}));
    connect(V3.outlet, SinkP1.flange) annotation (points=[50,20; 70,20],
        style(color=76, rgbcolor={159,159,223}));
    connect(V2.outlet,V3. inlet) annotation (points=[10,20; 30,20], style(
          color=76, rgbcolor={159,159,223}));
    connect(Sine2.y, SinkP1.in_p) annotation (points=[73,50; 80,50; 80,25.95;
          73.55,25.95], style(color=74, rgbcolor={0,0,127}));
    connect(SourceP1.flange,V1. inlet) annotation (points=[-70,20; -50,20],
        style(color=76, rgbcolor={159,159,223}));
    connect(S6.y,V6. theta) annotation (points=[-43,-22; -40,-22; -40,-42.8],
                  style(color=74, rgbcolor={0,0,127}));
    connect(V6.outlet,V7. inlet) annotation (points=[-30,-50; -10,-50],
                                                                      style(
          color=76, rgbcolor={159,159,223}));
    connect(V7.outlet,V8. inlet) annotation (points=[10,-50; 30,-50], style(
          color=76, rgbcolor={159,159,223}));
    connect(V8.outlet,SinkP2. flange) annotation (points=[50,-50; 70,-50],
        style(color=76, rgbcolor={159,159,223}));
    connect(S8.y,V8. theta) annotation (points=[35,-22; 40,-22; 40,-42.8],
                  style(color=74, rgbcolor={0,0,127}));
    connect(S7.y,V7. theta) annotation (points=[-5,-22; 0,-22; 0,-42.8],
                  style(color=74, rgbcolor={0,0,127}));
    connect(Sine1.y,SinkP2. in_p) annotation (points=[67,-24; 74,-24; 74,-44.05;
          73.55,-44.05],style(color=74, rgbcolor={0,0,127}));
    connect(SourceP2.flange,V6. inlet) annotation (points=[-70,-48; -60,-48;
          -60,-50; -50,-50],
        style(color=76, rgbcolor={159,159,223}));
  end TestGasValve;
  
  model TestCompressorConstSpeed 
  package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
  protected 
     parameter Real tableEta[6,4]=[0,95,100,105;
                                   1,82.5e-2,81e-2,80.5e-2;
                                   2,84e-2,82.9e-2,82e-2;
                                   3,83.2e-2,82.2e-2,81.5e-2;
                                   4,82.5e-2,81.2e-2,79e-2;
                                   5,79.5e-2,78e-2,76.5e-2];
     parameter Real tablePhic[6,4]=[0,95,100,105;
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
    
    annotation (uses(ThermoPower(version="2"), Modelica(version="2.1")), Diagram,
      experiment(StopTime=2),
      experimentSetupOutput,
      Documentation(info="<html>
This model test the <tt>Compressor</tt> model at constant speed.

<p>Simulate for 2s.

</html>"));
  public 
    ThermoPower.Gas.SourceP SourceP1(redeclare package Medium = Medium,
      p0=0.35e5,
      T=244.4) 
      annotation (extent=[-56,20; -36,40]);
    ThermoPower.Gas.SinkP SinkP1(
      redeclare package Medium = Medium,
      p0=8.3e5,
      T=691.4) 
             annotation (extent=[6,20; 26,40]);
    ThermoPower.Gas.Compressor Compressor(
      redeclare package Medium = Medium,
      pstart_in=0.35e5,
      pstart_out=8.3e5,
      Tstart_in=244.4,
      Tstart_out=691.4,
      tablePhic=tablePhic,
      tableEta=tableEta,
      tablePR=tablePR,
      Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
      Ndesign=523.3,
      Tdes_in=244.4)  annotation (extent=[-24,8; -4,28]);
    Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=523.3) 
      annotation (extent=[-54,-18; -34,2]);
  equation 
    connect(SourceP1.flange, Compressor.inlet)     annotation (points=[-36,30;
          -30,30; -30,26; -22,26], style(color=76, rgbcolor={159,159,223}));
    connect(Compressor.outlet, SinkP1.flange)     annotation (points=[-6,26; 0,26;
          0,30; 6,30], style(color=76, rgbcolor={159,159,223}));
    connect(ConstantSpeed1.flange, Compressor.shaft_a)     annotation (points=[
          -34,-8; -26,-8; -26,17.9; -20.5,17.9],
                                               style(color=0, rgbcolor={0,0,0}));
  end TestCompressorConstSpeed;
  
  model TestCompressorInertia 
  package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
    annotation (uses(ThermoPower(version="2"), Modelica(version="2.1")), Diagram,
      experiment(StopTime=2),
      experimentSetupOutput,
      Documentation(info="<html>
This model test the <tt>Compressor</tt> model with an inertial load. Boundary conditions and data refer to an turbojet engine at 11.000 m.

<p>Simulate for 2 seconds. The compressor slows down.
</html>"));
  protected 
     parameter Real tableEta[6,4]=[0,95,100,105;
                                   1,82.5e-2,81e-2,80.5e-2;
                                   2,84e-2,82.9e-2,82e-2;
                                   3,83.2e-2,82.2e-2,81.5e-2;
                                   4,82.5e-2,81.2e-2,79e-2;
                                   5,79.5e-2,78e-2,76.5e-2];
     parameter Real tablePhic[6,4]=[0,95,100,105;
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
    
  public 
    ThermoPower.Gas.SourceP SourceP1(redeclare package Medium = Medium,
      p0=0.35e5,
      T=244.4) 
      annotation (extent=[-60,30; -40,50]);
    ThermoPower.Gas.SinkP SinkP1(
      redeclare package Medium = Medium,
      p0=8.3e5,
      T=691.4) 
             annotation (extent=[20,30; 40,50]);
    Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
      annotation (extent=[12,4; 32,24]);
    ThermoPower.Gas.Compressor Compressor(
      redeclare package Medium = Medium,
      pstart_in=0.35e5,
      pstart_out=8.3e5,
      Tstart_in=244.4,
      Tstart_out=691.4,
      tablePhic=tablePhic,
      tableEta=tableEta,
      tablePR=tablePR,
      Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
      explicitIsentropicEnthalpy=false,
      Ndesign=523.3,
      Tdes_in=244.4)  annotation (extent=[-24,4; -4,24]);
  initial equation 
    Inertia1.w=523.3;
  equation 
    connect(SourceP1.flange, Compressor.inlet)     annotation (points=[-40,40;
          -30,40; -30,22; -22,22], style(color=76, rgbcolor={159,159,223}));
    connect(Compressor.outlet, SinkP1.flange)     annotation (points=[-6,22; 0,
          22; 0,40; 20,40],
                       style(color=76, rgbcolor={159,159,223}));
    connect(Compressor.shaft_b, Inertia1.flange_a)     annotation (points=[-7.6,
          13.9; -7.6,13.95; 12,13.95; 12,14],
                                           style(color=0, rgbcolor={0,0,0}));
  end TestCompressorInertia;
  
  model TestGasTurbine 
  package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
  protected 
    parameter Real tablePhic[5,4]=[1,90,100,110;
                                   2.36,4.68e-3,4.68e-3,4.68e-3;
                                   2.88,4.68e-3,4.68e-3,4.68e-3;
                                   3.56,4.68e-3,4.68e-3,4.68e-3;
                                   4.46,4.68e-3,4.68e-3,4.68e-3];
    parameter Real tableEta[5,4]=[1,90,100,110;
                                  2.36,89e-2,89.5e-2,89.3e-2;
                                  2.88,90e-2,90.6e-2,90.5e-2;
                                  3.56,90.5e-2,90.6e-2,90.5e-2;
                                  4.46,90.2e-2,90.3e-2,90e-2];
    annotation (uses(ThermoPower(version="2"), Modelica(version="2.1")), Diagram,
      experiment(StopTime=10),
      experimentSetupOutput,
      Documentation(info="<html>
This model test the Turbine model with an inertial load. Boundary conditions and data refer to an turbojet engine at 11.000 m. 

<p>Simulate for 5 seconds.  
</html>"));
  public 
    ThermoPower.Gas.SourceP SourceP1(redeclare package Medium = Medium,
      T=1270,
      p0=7.85e5) 
      annotation (extent=[-58,20; -38,40]);
    Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
      annotation (extent=[4,-4; 24,16]);
    Gas.Turbine Turbine1(
      redeclare package Medium = Medium,
      tablePhic=tablePhic,
      tableEta=tableEta,
      pstart_in=7.85e5,
      pstart_out=1.52e5,
      Tstart_in=1270,
      Tstart_out=883,
      Ndesign=523.3,
      Tdes_in=1400,
      Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix) 
                         annotation (extent=[-26,18; -6,38]);
    Gas.SinkP SinkP1(
      redeclare package Medium = Medium,
      p0=1.52e5,
      T=883) annotation (extent=[14,28; 34,48]);
  equation 
    connect(SourceP1.flange, Turbine1.inlet)    annotation (points=[-38,30; -30,
          30; -30,36; -24,36], style(color=76, rgbcolor={159,159,223}));
    connect(Turbine1.outlet, SinkP1.flange)    annotation (points=[-8,36; 2,36;
          2,38; 14,38], style(color=76, rgbcolor={159,159,223}));
  initial equation 
  Inertia1.w=523.3;
  equation 
    connect(Turbine1.shaft_b, Inertia1.flange_a)    annotation (points=[-8.7,28;
          -4,28; -4,6; 4,6], style(color=0, rgbcolor={0,0,0}));
  end TestGasTurbine;
  
  model TestGasTurbineStodola 
  package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
    
  protected 
    parameter Real tableEta[5,4]=[1,90,100,110;
                                  7,89e-2,89.5e-2,89.3e-2;
                                  10,90e-2,90.6e-2,90.5e-2;
                                  12,90.5e-2,90.6e-2,90.5e-2;
                                  15,90.2e-2,90.3e-2,90e-2];
      annotation (extent=[-58,20; -38,40], Diagram,
      Documentation(info="<html>
This model test the Turbine model based on the Stodola's law at constant speed. Boundary conditions and data refer to an turbojet engine at 11.000 m. 
<p>Simulate for 5 seconds. 
</html>"),
      experiment(StopTime=5));
  public 
    ThermoPower.Gas.SourceP SourceP1(redeclare package Medium = Medium,
      T=1270,
      p0=7.85e5) 
      annotation (extent=[-58,20; -38,40]);
    Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
      annotation (extent=[4,-4; 24,16]);
    Gas.TurbineStodola Turbine1(
      redeclare package Medium = Medium,
      pstart_in=7.85e5,
      pstart_out=1.52e5,
      Tstart_in=1270,
      Tstart_out=883,
      K=4.75e-3,
      Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
      tableEta=tableEta,
      fixedEta=true,
      Ndesign=523.3,
      Tdes_in=1400,
      wnom=104)          annotation (extent=[-28,20; -8,40]);
    Gas.SinkP SinkP1(
      redeclare package Medium = Medium,
      p0=1.52e5,
      T=883) annotation (extent=[14,28; 34,48]);
    Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=523.3) 
      annotation (extent=[-48,-8; -28,12]);
  equation 
    connect(SourceP1.flange, Turbine1.inlet)    annotation (points=[-38,30; -30,
          30; -30,38; -26,38], style(color=76, rgbcolor={159,159,223}));
    connect(Turbine1.outlet, SinkP1.flange)    annotation (points=[-10,38; 14,
          38],          style(color=76, rgbcolor={159,159,223}));
    connect(Turbine1.shaft_b, Inertia1.flange_a)    annotation (points=[-10.7,
          30; -4,30; -4,6; 4,6],
                             style(color=0, rgbcolor={0,0,0}));
    connect(ConstantSpeed1.flange, Turbine1.shaft_a)    annotation (points=[-28,
          2; -26,2; -26,30; -25.3,30], style(color=0, rgbcolor={0,0,0}));
    annotation (Diagram);
  end TestGasTurbineStodola;
  
  model TestTurboJetInertia 
    parameter SpecificEnthalpy HH(fixed=false, start=40e6) 
      "Fuel lower heat value";
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
     parameter Real tableEtaT[5,4]=[1,90,100,110;
                                  2.36,89e-2,89.5e-2,89.3e-2;
                                  2.88,90e-2,90.6e-2,90.5e-2;
                                  3.56,90.5e-2,90.6e-2,90.5e-2;
                                  4.46,90.2e-2,90.3e-2,90e-2];
  public 
    ThermoPower.Gas.Compressor Compressor1(
      redeclare package Medium = Media.Air,
      pstart_in=0.343e5,
      Tstart_in=244.4,
      explicitIsentropicEnthalpy=true,
      Tstart_out=600,
      pstart_out=8.29e5,
      Ndesign=523.3,
      Tdes_in=244.4,
      Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
      tablePhic=tablePhicC,
      tableEta=tableEtaC,
      tablePR=tablePR)                  annotation (extent=[-48,-8; -28,12]);
    ThermoPower.Gas.TurbineStodola Turbine1(
      redeclare package Medium = Media.FlueGas,
      pstart_in=7.85e5,
      pstart_out=1.52e5,
      Tstart_out=800,
      Tstart_in=1390,
      Ndesign=523.3,
      Tdes_in=1400,
      fixedEta=false,
      wnom=104,
      Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
      tableEta=tableEtaT)              annotation (extent=[58,-8; 78,12]);
    annotation (uses(ThermoPower(version="2"), Modelica(version="2.1")), Diagram,
      Documentation(info="<html>
This is the full model of a turbojet-type engine at 11.000m [1].

<p>Simulate the model for 20s. At time t = 1 the fuel flow rate is reduced by 10%; the engine slows down accordingly.
<p><b>References:</b></p>
<ol>
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol> 
</html>"),
      experiment(StopTime=5));
    ThermoPower.Gas.CombustionChamber CombustionChamber1(
      gamma=1,
      Cm=1,
      pstart=8.11e5,
      V=0.05,
      S=0.05,
      Tstart=1370,
      initOpt=ThermoPower.Choices.Init.Options.steadyState,
      HH=HH) 
            annotation (extent=[6,0; 26,20]);
    ThermoPower.Gas.SourceP SourceP1(redeclare package Medium = 
          Media.Air,
      T=244.4,
      p0=0.3447e5)                     annotation (extent=[-102,0; -82,20]);
    ThermoPower.Gas.SinkP SinkP1(
      redeclare package Medium = Media.FlueGas,
      p0=1.52e5,
      T=800) annotation (extent=[82,0; 102,20]);
    ThermoPower.Gas.SourceW SourceW1(
      redeclare package Medium = Media.NaturalGas,
      w0=2.02,
      p0=8.11e5,
      T=300)   annotation (extent=[-18,32; 2,52]);
    Modelica.Mechanics.Rotational.Inertia Inertia1(J=50) 
      annotation (extent=[-2,-24; 18,-4]);
    
    Gas.PressDrop PressDrop1(
      redeclare package Medium = Media.FlueGas,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
      A=1,
      pstart=8.11e5,
      dpnom=0.26e5,
      wnom=102,
      Tstart=1370,
      rhonom=2)   annotation (extent=[34,0; 54,20]);
    Gas.PressDrop PressDrop2(
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
      A=1,
      redeclare package Medium = Media.Air,
      wnom=100,
      Tstart=600,
      pstart=8.29e5,
      dpnom=0.18e5,
      rhonom=4.7) annotation (extent=[-20,0; 0,20]);
    
    Gas.PressDrop PressDrop3(
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
      A=1,
      redeclare package Medium = Media.Air,
      wnom=100,
      pstart=0.3447e5,
      Tstart=244.4,
      dpnom=170,
      rhonom=0.48) 
                  annotation (extent=[-74,0; -54,20]);
    
    Modelica.Blocks.Sources.Step Step1(
      height=-0.2,
      offset=2.02,
      startTime=1) annotation (extent=[-78,46; -58,66]);
  equation 
    connect(SourceW1.flange, CombustionChamber1.inf)     annotation (points=[2,
          42; 16,42; 16,20],        style(color=76, rgbcolor={159,159,223}));
    connect(Compressor1.shaft_b, Inertia1.flange_a)    annotation (points=[
          -31.6,1.9; -31.8,1.9; -31.8,-14; -2,-14],
                                               style(color=0, rgbcolor={0,0,0}));
    connect(Inertia1.flange_b, Turbine1.shaft_a)    annotation (points=[18,-14;
          60,-14; 60,2; 60.7,2],
                              style(color=0, rgbcolor={0,0,0}));
    connect(CombustionChamber1.out, PressDrop1.inlet) annotation (points=[26,10;
          34,10],
        style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop1.outlet, Turbine1.inlet) annotation (points=[54,10; 60,10],
        style(color=76, rgbcolor={159,159,223}));
    connect(Compressor1.outlet, PressDrop2.inlet) annotation (points=[-30,10;
          -20,10], style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop2.outlet, CombustionChamber1.ina) annotation (points=[0,10;
          6,10],      style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop3.outlet, Compressor1.inlet) annotation (points=[-54,10;
          -46,10], style(color=76, rgbcolor={159,159,223}));
    connect(SourceP1.flange, PressDrop3.inlet) annotation (points=[-82,10; -74,
          10], style(color=76, rgbcolor={159,159,223}));
    connect(Turbine1.outlet, SinkP1.flange) annotation (points=[76,10; 82,10],
        style(color=76, rgbcolor={159,159,223}));
  initial equation 
    Inertia1.phi = 0;
    Inertia1.w = 523;
    der(Inertia1.w) = 0;
  equation 
    connect(Step1.y, SourceW1.in_w0) annotation (points=[-57,56; -14,56; -14,47],
        style(color=74, rgbcolor={0,0,127}));
  end TestTurboJetInertia;
  
  model TestTurboJetConstSpeed 
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
  public 
    ThermoPower.Gas.Compressor Compressor1(
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
      Ndesign=523.3,
      Tdes_in=244.4)                    annotation (extent=[-60,-8; -40,12]);
    ThermoPower.Gas.Turbine Turbine1(
      redeclare package Medium = Media.FlueGas,
      pstart_in=7.85e5,
      pstart_out=1.52e5,
      tablePhic=tablePhicT,
      tableEta=tableEtaT,
      Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
      Tstart_out=800,
      Ndesign=523.3,
      Tdes_in=1400,
      Tstart_in=1370)                  annotation (extent=[54,-8; 74,12]);
    
    ThermoPower.Gas.CombustionChamber CombustionChamber1(
      gamma=1,
      Cm=1,
      pstart=8.11e5,
      Tstart=1370,
      V=0.05,
      S=0.05,
      initOpt=ThermoPower.Choices.Init.Options.steadyState,
      HH=41.6e6) 
            annotation (extent=[-2,0; 18,20]);
    ThermoPower.Gas.SourceP SourceP1(redeclare package Medium = 
          Media.Air,
      p0=0.343e5,
      T=244.4)                         annotation (extent=[-96,0; -76,20]);
    ThermoPower.Gas.SinkP SinkP1(
      redeclare package Medium = Media.FlueGas,
      p0=1.52e5,
      T=800) annotation (extent=[82,0; 102,20]);
    ThermoPower.Gas.SourceW SourceW1(
      redeclare package Medium = Media.NaturalGas,
      w0=2.02,
      p0=8.11e5,
      T=300)   annotation (extent=[-18,32; 2,52]);
    Modelica.Mechanics.Rotational.Inertia Inertia1(J=50) 
      annotation (extent=[-14,-24; 6,-4]);
    Gas.PressDrop PressDrop1(
      redeclare package Medium = Media.FlueGas,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
      A=1,
      pstart=8.11e5,
      dpnom=0.26e5,
      wnom=102,
      Tstart=1370,
      rhonom=2)   annotation (extent=[28,0; 48,20]);
    Gas.PressDrop PressDrop2(
      pstart=8.3e5,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
      A=1,
      redeclare package Medium = Media.Air,
      dpnom=0.19e5,
      wnom=100,
      rhonom=4.7,
      Tstart=600) annotation (extent=[-34,0; -14,20]);
    Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=523.33) 
      annotation (extent=[-82,-26; -62,-6]);
  equation 
    connect(SourceW1.flange, CombustionChamber1.inf)     annotation (points=[2,
          42; 8,42; 8,20],          style(color=76, rgbcolor={159,159,223}));
    connect(Turbine1.outlet, SinkP1.flange)    annotation (points=[72,10; 82,10],
                         style(color=76, rgbcolor={159,159,223}));
    connect(Compressor1.shaft_b, Inertia1.flange_a)    annotation (points=[
          -43.6,1.9; -41.8,1.9; -41.8,-14; -14,-14],
                                               style(color=0, rgbcolor={0,0,0}));
    connect(Inertia1.flange_b, Turbine1.shaft_a)    annotation (points=[6,-14;
          50,-14; 50,2; 56.7,2],
                              style(color=0, rgbcolor={0,0,0}));
    connect(SourceP1.flange, Compressor1.inlet)    annotation (points=[-76,10;
          -58,10],                 style(color=76, rgbcolor={159,159,223}));
    connect(CombustionChamber1.out, PressDrop1.inlet) annotation (points=[18,10;
          28,10],
        style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop1.outlet, Turbine1.inlet) annotation (points=[48,10; 56,10],
        style(color=76, rgbcolor={159,159,223}));
    connect(Compressor1.outlet, PressDrop2.inlet) annotation (points=[-42,10;
          -34,10], style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop2.outlet, CombustionChamber1.ina) annotation (points=[-14,
          10; -2,10], style(color=76, rgbcolor={159,159,223}));
    connect(ConstantSpeed1.flange, Compressor1.shaft_a) annotation (points=[-62,
          -16; -60,-16; -60,1.9; -56.5,1.9], style(color=0, rgbcolor={0,0,0}));
   annotation (uses(ThermoPower(version="2"), Modelica(version="2.1")), Diagram,
      experiment(StopTime=5),
      Documentation(info="<html>
This is a simplified model of a turbojet-type engine at 11.000m [1], at costant speed. 
<p>Simulate the model for 20s. At time t = 1 the fuel flow rate is reduced by 10%; the engine slows down accordingly.  
<p><b>References:</b></p>
<ol>
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol> 
</html>"));
  end TestTurboJetConstSpeed;
  
  model TestGT_ISO 
    
    parameter Real tableData[8,4]=[  1.3e6,   7e6,    11.6,  18.75;
                                1.85e6,  8.2e6,  12,    18.7;
                                2e6,     8.5e6,  12.1,  18.65;
                                3e6,    10.8e6,  12.7,  18.6;
                                3.5e6,  12.1e6,  13,    18.55;
                                4e6,    13.4e6,  13.2,  18.5;
                                4.5e6,  14.75e6, 13.5,  18.45;
                                4.8e6,  15.5e6,  13.6,  18.43];
   ThermoPower.Gas.GTunit_ISO GT(
      tableData=tableData,
      Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
      pstart=0.9735e5,
      Tstart=285.5,
      constantCompositionExhaust=true,
      HH=47.92e6)    annotation (extent=[-38,-10; 8,30]);
    ThermoPower.Gas.SourceP SourceP1(
      redeclare package Medium = ThermoPower.Media.Air,
      p0=1.011e5,
      T=288.15) 
             annotation (extent=[-100,6; -80,26]);
    ThermoPower.Gas.SinkP SinkP1(
      redeclare package Medium = ThermoPower.Media.FlueGas,
      p0=1e5,
      T=526 + 273) 
             annotation (extent=[34,6; 54,26]);
    Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=1819.6) 
      annotation (extent=[82,-26; 62,-6]);
    ThermoPower.Gas.SourceW SourceW1(
      redeclare package Medium = ThermoPower.Media.NaturalGas,
      T=291.44,
      p0=13.27e5,
      w0=0.317) 
               annotation (extent=[-38,40; -18,60]);
    Gas.PressDrop PressDrop1(
      redeclare package Medium = ThermoPower.Media.Air,
      pstart=1.011e5,
      Tstart=288.15,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
      dpnom=0.0375e5,
      rhonom=1.2,
      wnom=18.6) annotation (extent=[-70,6; -50,26]);
    Modelica.Blocks.Sources.Step Step1(
      height=-0.1,
      offset=0.317,
      startTime=1) annotation (extent=[-94,52; -74,72]);
  equation 
    connect(SourceW1.flange, GT.Fuel_in)      annotation (points=[-18,50; -14,
          50; -14,24.4; -15,24.4],
                                 style(color=76, rgbcolor={159,159,223}));
   annotation (uses(ThermoPower(version="2"), Modelica(version="2.2")), Diagram,
      experiment(StopTime=2),
      Documentation(info="<html>
This model tests <tt>GTunit_ISO</tt>.

<p>Simulate for 2 s. The model start at steady state. At time t = 1, the fuel flow rate is reduced by 30%. The net power output GT.Pout goes from 4.5 MW to 2.7 MW.
</html>"));
    connect(SourceP1.flange, PressDrop1.inlet) annotation (points=[-80,16; -70,
          16], style(color=76, rgbcolor={159,159,223}));
    connect(PressDrop1.outlet, GT.Air_in) annotation (points=[-50,16; -35.7,16],
        style(color=76, rgbcolor={159,159,223}));
    connect(GT.FlueGas_out, SinkP1.flange) annotation (points=[5.7,16; 34,16],
        style(color=76, rgbcolor={159,159,223}));
    connect(GT.shaft_b, ConstantSpeed1.flange) annotation (points=[7.54,10; 36,
          10; 36,-16; 62,-16], style(color=0, rgbcolor={0,0,0}));
    connect(Step1.y, SourceW1.in_w0) annotation (points=[-73,62; -34,62; -34,55],
        style(color=74, rgbcolor={0,0,127}));
  end TestGT_ISO;
  
  model TestGT 
    annotation (uses(ThermoPower(version="2"), Modelica(version="2.2")), Diagram,
      experiment(StopTime=2),
      Documentation(info="<html>
This model tests a simple power plant based on a <tt>GTunit</tt>.

<p>Simulate for 2 s. The plant starts at steady states, and produces approximately 5 MW of power. At time t=1 the breaker opens, and the GT unit starts accelerating, with a time constant of 10 seconds.

</html>"));
    
    parameter Real tabW[11,4]=[0,        233.15,  288.15,   313.15;
                               0.485e6,   20.443,  18.608,   17.498;
                               0.97e6,    20.443,  18.596,   17.483;
                               1.455e6,   20.443,  18.584,   17.467;
                               1.94e6,    20.443,  18.572,   17.452;
                               2.425e6,   20.443,  18.560,   17.437;
                               2.91e6,    20.443,  18.548,   17.421;
                               3.395e6,   20.443,  18.536,   17.406;
                               3.88e6,    20.443,  18.524,   17.391;
                               4.365e6,   20.443,  18.512,   17.375;
                               4.85e6,    20.443,  18.500,   17.360] 
      "table for wia_iso=f(ZLPout_iso,Tsync)";
    parameter Real tabPR[ 11,4]=[ 0,        233.15,   288.15,    313.15;
                                  0.485e6,   11.002,   10.766,    10.144;
                                  0.97e6,    12.084,    11.070,   10.453;
                                  1.455e6,   12.717,    11.374,   10.762;
                                  1.94e6,    13.166,    11.678,   11.070;
                                  2.425e6,   13.515,    11.981,   11.379;
                                  2.91e6,    13.799,    12.258,   11.687;
                                  3.395e6,   14.040,    12.589,   11.996;
                                  3.88e6,    14.248,    12.893,   12.305;
                                  4.365e6,   14.432,    13.196,   12.613;
                                  4.85e6,    14.597,    13.500,   12.922] 
      " table for PR=g(ZLPout_iso,Tsync)";
    parameter Real tabHI[12,4]=[  0,         233.15,     288.15,     313.15;
                                  0.7275e6,   39e6,       39e6,       39e6;
                                  0.97e6,     31.2e6,     27.36e6,    28.08e6;
                                  1.12125e6,  26.52e6,    24.32e6,    24.96e6;
                                  1.455e6,    24.18e6,    22.344e6,   22.932e6;
                                  1.94e6,     21.06e6,    19.456e6,   19.968e6;
                                  2.425e6,    19.188e6,   17.936e6,   18.408e6;
                                  2.91e6,     17.784e6,   17.024e6,   17.472e6;
                                  3.395e6,    17.16e6,    16.416e6,   16.848e6;
                                  3.88e6,     16.38e6,    15.96e6,    16.38e6;
                                  4.365e6,    16.224e6,   15.58e6,    15.99e6;
                                  4.85e6,     16.224e6,   15.2e6,     15.6e6] 
      "table for HI_iso=h(ZLPout_iso,Tsync)";
    ThermoPower.Gas.GTunit GTunit(
      pstart=0.999e5,
      HH=42.53e6,
      Tstart=280.55,
      constantCompositionExhaust=true,
      tableHI=tabHI,
      tablePR=tabPR,
      tableW=tabW,
      Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix) 
                     annotation (extent=[-72,-6; -28,36]);
    ThermoPower.Gas.SourceP SourceP1(
      redeclare package Medium = ThermoPower.Media.Air,
      p0=0.999e5,
      T=280.55) 
             annotation (extent=[-98,12; -78,32]);
    ThermoPower.Gas.SinkP SinkP1(
      redeclare package Medium = ThermoPower.Media.FlueGas,
      p0=1e5,
      T=526 + 273) 
             annotation (extent=[-22,42; -2,62]);
    Modelica.Mechanics.Rotational.Inertia Inertia(J=1) 
      annotation (extent=[-22,0; -2,20]);
    ThermoPower.Gas.SourceW SourceW1(
      redeclare package Medium = ThermoPower.Media.NaturalGas,
      T=291.44,
      p0=12.5e5,
      w0=0.365) 
               annotation (extent=[-76,46; -56,66]);
    Electrical.Generator Generator(Np=2, eta=0.98) 
      annotation (extent=[34,0; 54,20]);
    Electrical.Breaker Breaker  annotation (extent=[58,0; 78,20]);
    Electrical.Grid Grid(Pn=1e9) 
                          annotation (extent=[82,0; 102,20]);
    Modelica.Mechanics.Rotational.IdealGear IdealGear1(ratio=(17372/60)/25) 
      annotation (extent=[6,0; 26,20]);
    Modelica.Blocks.Sources.BooleanStep BooleanStep1(startTime=1, startValue=true) 
      annotation (extent=[38,36; 58,56]);
  equation 
    connect(SourceW1.flange, GTunit.Fuel_in)  annotation (points=[-56,56; -50,
          56; -50,30.12],        style(color=76, rgbcolor={159,159,223}));
    connect(SourceP1.flange, GTunit.Air_in)  annotation (points=[-78,22; -78,21.3;
          -69.8,21.3],         style(color=76, rgbcolor={159,159,223}));
    connect(GTunit.FlueGas_out, SinkP1.flange)  annotation (points=[-30.2,21.3;
          -31.6,21.3; -31.6,52; -22,52],
                                     style(color=76, rgbcolor={159,159,223}));
    connect(Generator.powerConnection, Breaker.connection1) 
      annotation (points=[52.6,10; 59.4,10], style(pattern=0, thickness=2));
    connect(Breaker.connection2, Grid.connection) 
      annotation (points=[76.6,10; 83.4,10], style(pattern=0, thickness=2));
    connect(GTunit.shaft_b, Inertia.flange_a)   annotation (points=[-28.44,15;
          -25.22,15; -25.22,10; -22,10], style(color=0, rgbcolor={0,0,0}));
    connect(Inertia.flange_b, IdealGear1.flange_a) 
      annotation (points=[-2,10; 6,10], style(color=0, rgbcolor={0,0,0}));
    connect(IdealGear1.flange_b, Generator.shaft) 
      annotation (points=[26,10; 35.4,10], style(color=0, rgbcolor={0,0,0}));
    connect(BooleanStep1.y, Breaker.closed)  annotation (points=[59,46; 68,46; 68,
          18], style(color=5, rgbcolor={255,0,255}));
  initial equation 
    Inertia.phi = 0;
    der(Inertia.w) = 0;
    
  end TestGT;
  
  annotation (uses(ThermoPower(version="2"), Modelica(version="2.2"),
      UserInteraction(version="0.52")),                                version=
        "1");
  
  model TestEvaporatorTemp 
    extends Water.EvaporatorBase(
      redeclare package Medium=Modelica.Media.Water.StandardWater,
      L=30,
      A=1e-4,
      omega=1e-2,
      Dhyd=1e-3,
      wnom=0.1,
      FFtype=0,
      pstartin=10e5,
      hstartin=8e5,
      hstartout=2.9e6,
      csilstart=0.2*L,
      csivstart=0.8*L) 
                annotation (extent=[-60,-20; 60,40]);
    annotation (experiment(
        StopTime=600,
        NumberOfIntervals=1000,
        Tolerance=1e-008),
        experimentSetupOutput);
    Temperature Text "External temperature";
    parameter Real K( fixed=false, start=1.2e3);
  equation 
    Text=700 - 2*min(max(time-1,0),70)+ 2*min(max(time-300,0),70);
    Ql=K*(Text-fluid_in.T)*csil/L * (1-min(max(time-100,0),160)/200+min(max(time-400,0),200)/200);
    Qb=K*(Text-sat.Tsat)*(csiv-csil)/L * (1-min(max(time-100,0),160)/200+min(max(time-400,0),200)/200);
    Qv=K*(Text-fluid_out.T)*(L-csiv)/L * (1-min(max(time-100,0),160)/200+min(max(time-400,0),200)/200);
    hin=8e5;
    win=0.1;
    wout=0.1/60e5*p;
  initial equation 
    der(csil)=0;
    der(csiv)=0;
    der(hout)=0;
    hout=2.9e6;
    der(p)=0;
  end TestEvaporatorTemp;
  
  model TestEvaporatorFlux 
    extends Water.EvaporatorBase(
      redeclare package Medium=Modelica.Media.Water.StandardWater,
      L=30,
      A=1e-4,
      omega=1e-2,
      Dhyd=1e-3,
      wnom=0.1,
      FFtype=0,
      pstartin=10e5,
      hstartin=4e5,
      hstartout=4e5,
      csilstart=0,
      csivstart=0) 
                annotation (extent=[-60,-20; 60,40]);
    annotation (experiment(StopTime=30, Tolerance=1e-008),
        experimentSetupOutput);
  equation 
    Ql=2.5e5*csil/L *min(max(time-10,0),100);
    Qb=2.5e5*(csiv-csil)/L * min(max(time-10,0),100);
    Qv=2.5e5*(L-csiv)/L * min(max(time-10,0),100);
    hin=4e5;
    win=0.1;
    wout=0.1/10e5*p;
  initial equation 
    csil=L;
    csiv=L;
    hout=4e5;
    der(p)=0;
  end TestEvaporatorFlux;
  
  model TestFanMech 
    Gas.FanMech FanMech1(redeclare package Medium = 
          Modelica.Media.Air.SimpleAir,
      rho0=1.23,
      n0=590,
      pin_start=1e5,
      redeclare function flowCharacteristic = flowChar,
      bladePos0=0.8,
      pout_start=1e5 + 5000,
      q_single_start=0) annotation (extent=[-68,-28; -34,8]);
    Gas.SinkP SinkP1(redeclare package Medium = Modelica.Media.Air.SimpleAir) 
      annotation (extent=[4,12; 24,32]);
    Gas.SourceP SourceP1(redeclare package Medium = 
          Modelica.Media.Air.SimpleAir) annotation (extent=[-100,-16; -78,6]);
    annotation (
      Diagram,
      experiment(StopTime=50, Algorithm="Dassl"),
      experimentSetupOutput(equdistant=false));
    Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=
          Modelica.SIunits.Conversions.from_rpm(590)) 
      annotation (extent=[90,-16; 70,4]);
    function flowChar = Functions.FanCharacteristics.quadraticFlowBlades (
      bladePos_nom={0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65, 0.70, 0.75, 0.80, 0.85},
      q_nom =      [   0,    0,  100,  300,  470,  620,  760,  900, 1000, 1100, 1300, 1500;
                      70,  125,  310,  470,  640,  820, 1000, 1200, 1400, 1570, 1700, 1900;
                     100,  200,  370,  530,  700,  900, 1100, 1300, 1500, 1750, 2000, 2300],
      H_nom =      [3100, 3800, 3700, 3850, 4200, 4350, 4700, 4900, 5300, 5600, 5850, 6200;
                    2000, 3000, 3000, 3000, 3000, 3200, 3200, 3300, 3600, 4200, 5000, 5500;
                    1000, 2000, 2000, 2000, 2000, 1750, 1750, 2000, 2350, 2500, 2850, 3200]);
    Modelica.Blocks.Sources.Ramp Ramp1(
      startTime=1,
      height=0.55,
      duration=9,
      offset=0.30) annotation (extent=[-100,40; -80,60]);
    Modelica.Blocks.Sources.Step Step1(
      startTime=15,
      height=-1,
      offset=1) annotation (extent=[-30,54; -10,74]);
    Modelica.Mechanics.Rotational.Inertia Inertia1(w(start=Modelica.SIunits.Conversions.from_rpm(590)),
        J=10000) annotation (extent=[-18,-16; 2,4]);
    Gas.PressDrop PressDrop1(
      wnom=2000*1.229,
      FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
      dpnom=6000,
      rhonom=1.229,
      redeclare package Medium = Modelica.Media.Air.SimpleAir) 
      annotation (extent=[-28,14; -8,34]);
    Modelica.Mechanics.Rotational.Clutch Clutch1(fn_max=1e6) 
      annotation (extent=[30,-16; 50,4]);
  equation 
    connect(SourceP1.flange, FanMech1.infl) annotation (points=[-78,-5; -68,-5;
          -68,-6.04; -64.6,-6.04], style(color=76, rgbcolor={159,159,223}));
    connect(Ramp1.y, FanMech1.in_bladePos) annotation (points=[-79,50; -57.8,50; 
          -57.8,3.68], style(color=74, rgbcolor={0,0,127}));
    connect(FanMech1.MechPort, Inertia1.flange_a) annotation (points=[-34.85,
          -6.4; -26.425,-6.4; -26.425,-6; -18,-6], style(color=0, rgbcolor={0,0,
            0}));
    connect(PressDrop1.outlet, SinkP1.flange) annotation (points=[-8,24; 0,24;
          0,22; 4,22], style(color=76, rgbcolor={159,159,223}));
    connect(FanMech1.outfl, PressDrop1.inlet) annotation (points=[-40.8,2.96; 
          -40.4,2.96; -40.4,24; -28,24], style(color=76, rgbcolor={159,159,223}));
    connect(Inertia1.flange_b, Clutch1.flange_a) 
      annotation (points=[2,-6; 30,-6], style(color=0, rgbcolor={0,0,0}));
    connect(Clutch1.flange_b, ConstantSpeed1.flange) 
      annotation (points=[50,-6; 70,-6], style(color=0, rgbcolor={0,0,0}));
    connect(Step1.y, Clutch1.f_normalized) annotation (points=[-9,64; 40,64; 40,
          5], style(color=74, rgbcolor={0,0,127}));
  end TestFanMech;
end Test;
