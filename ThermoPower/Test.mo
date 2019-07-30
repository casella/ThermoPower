within ThermoPower;
package Test "Test cases for the ThermoPower models"
  extends Modelica.Icons.ExamplesPackage;

  package WaterComponents
    "Tests for lumped-parameters Water package components"
    extends Modelica.Icons.ExamplesPackage;
    model TestSources "Test source and sink components"
        extends Modelica.Icons.Example;
      Water.SourceMassFlow source_w_h(use_in_T=false)
        annotation (Placement(transformation(extent={{-50,130},{-30,150}})));
      Water.SinkMassFlow sink_w_h
        annotation (Placement(transformation(extent={{30,-20},{50,0}})));
      Water.SourceMassFlow source_w_T(
        use_T=true,
        use_in_T=false,
        T=323.15)
        annotation (Placement(transformation(extent={{-50,100},{-30,120}})));
      Water.SourceMassFlow source_w_h_in(use_in_T=false, use_in_h=true)
        annotation (Placement(transformation(extent={{-50,56},{-30,76}})));
      Water.SourceMassFlow source_w_T_in(use_T=true, use_in_T=true)
        annotation (Placement(transformation(extent={{-50,10},{-30,30}})));
      Water.SinkMassFlow sink_w_T(use_T=true, T=323.15)
        annotation (Placement(transformation(extent={{30,-50},{50,-30}})));
      Water.SinkMassFlow sink_w_h_in(use_in_h=true)
        annotation (Placement(transformation(extent={{30,-90},{50,-70}})));
      Water.SinkMassFlow sink_w_T_in(use_T=true, use_in_T=true)
        annotation (Placement(transformation(extent={{30,-130},{50,-110}})));
      Water.SinkPressure sink_P_h
        annotation (Placement(transformation(extent={{30,130},{50,150}})));
      Water.SourcePressure source_P_h
        annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
      Water.SinkPressure sink_P_T(use_T=true, T=323.15)
        annotation (Placement(transformation(extent={{30,100},{50,120}})));
      Water.SourcePressure source_P_T(use_T=true, T=323.15)
        annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
      Water.SourcePressure source_P_h_in(use_in_h=true)
        annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
      Water.SourcePressure source_P_T_in(use_T=true, use_in_T=true)
        annotation (Placement(transformation(extent={{-50,-130},{-30,-110}})));
      Water.SinkPressure sink_P_h_in(use_in_h=true)
        annotation (Placement(transformation(extent={{30,56},{50,76}})));
      Water.SinkPressure sink_P_T_in(use_in_T=true, use_T=true)
        annotation (Placement(transformation(extent={{30,10},{50,30}})));
      Modelica.Blocks.Sources.RealExpression h_w(y=3e5)
        annotation (Placement(transformation(extent={{-76,68},{-56,88}})));
      Modelica.Blocks.Sources.RealExpression T_P(y=80 + 273.15)
        annotation (Placement(transformation(extent={{-78,-114},{-58,-94}})));
      Modelica.Blocks.Sources.RealExpression T_w(y=80 + 273.15)
        annotation (Placement(transformation(extent={{-74,22},{-54,42}})));
      Modelica.Blocks.Sources.RealExpression h_P(y=3e5)
        annotation (Placement(transformation(extent={{-76,-74},{-56,-54}})));
    equation
      connect(source_w_h.flange, sink_P_h.flange) annotation (Line(points={{-30,
              140},{0,140},{30,140}}, color={0,0,255}));
      connect(source_w_T.flange, sink_P_T.flange) annotation (Line(points={{-30,
              110},{-30,110},{30,110}}, color={0,0,255}));
      connect(source_w_h_in.flange, sink_P_h_in.flange)
        annotation (Line(points={{-30,66},{30,66}}, color={0,0,255}));
      connect(source_w_T_in.flange, sink_P_T_in.flange)
        annotation (Line(points={{-30,20},{30,20}}, color={0,0,255}));
      connect(source_P_h.flange, sink_w_h.flange) annotation (Line(points={{-30,
              -10},{0,-10},{30,-10}}, color={0,0,255}));
      connect(source_P_T.flange, sink_w_T.flange)
        annotation (Line(points={{-30,-40},{30,-40}}, color={0,0,255}));
      connect(source_P_h_in.flange, sink_w_h_in.flange) annotation (Line(points=
             {{-30,-80},{0,-80},{30,-80}}, color={0,0,255}));
      connect(source_P_T_in.flange, sink_w_T_in.flange) annotation (Line(points=
             {{-30,-120},{-2,-120},{30,-120}}, color={0,0,255}));
      connect(h_w.y, source_w_h_in.in_h) annotation (Line(points={{-55,78},{-55,
              78},{-34.8,78},{-34.8,71.6}}, color={0,0,127}));
      connect(T_P.y, source_P_T_in.in_T) annotation (Line(points={{-57,-104},{
              -40,-104},{-40,-110.4}}, color={0,0,127}));
      connect(T_w.y, source_w_T_in.in_T) annotation (Line(points={{-53,32},{
              -39.4,32},{-39.4,25.6}}, color={0,0,127}));
      connect(h_P.y, source_P_h_in.in_h) annotation (Line(points={{-55,-64},{
              -35.8,-64},{-35.8,-71.6}}, color={0,0,127}));
      connect(h_w.y, sink_P_h_in.in_h) annotation (Line(points={{-55,78},{44.2,
              78},{44.2,74.4}}, color={0,0,127}));
      connect(T_w.y, sink_P_T_in.in_T) annotation (Line(points={{-53,32},{40,32},
              {40,29.6}}, color={0,0,127}));
      connect(h_P.y, sink_w_h_in.in_h) annotation (Line(points={{-55,-64},{-12,
              -64},{45.2,-64},{45.2,-74.4}}, color={0,0,127}));
      connect(T_P.y, sink_w_T_in.in_T) annotation (Line(points={{-57,-104},{-10,
              -104},{40.6,-104},{40.6,-114.4}}, color={0,0,127}));
      annotation (experiment(StopTime = 1),
        Diagram(coordinateSystem(extent={{-100,-140},{100,160}})),
        Icon(coordinateSystem(extent={{-100,-100},{120,100}})));
    end TestSources;

    model TestMixer
        extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.StandardWater;
      Water.SourceMassFlow
                    SourceW1(w0=0.5, h=2.8e6) annotation (Placement(
            transformation(extent={{-90,40},{-70,60}}, rotation=0)));
      Water.SourceMassFlow
                    SourceW2(w0=0.5, h=3.0e6) annotation (Placement(
            transformation(extent={{-90,0},{-70,20}}, rotation=0)));
      Water.SinkPressure
                  SinkP1(p0=100000)
                               annotation (Placement(transformation(extent={{50,
                20},{70,40}}, rotation=0)));
      Water.Mixer mixer(
        V=1,
        Cm=0,
        redeclare package Medium = Medium,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
        pstart=100000)
        annotation (Placement(transformation(extent={{-52,20},{-32,40}},
              rotation=0)));
      Water.ValveLin ValveLin1(Kv=1/1e5) annotation (Placement(transformation(
              extent={{14,20},{34,40}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        height=-0.2,
        offset=1,
        startTime=2) annotation (Placement(transformation(extent={{-44,60},{-24,
                80}}, rotation=0)));
      Water.PressDrop pressDrop(
        wnom=1,
        dpnom=100,
        rhonom=1000,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) annotation (
          Placement(transformation(extent={{-20,20},{0,40}}, rotation=0)));
      Water.SourceMassFlow
                    SourceW3(w0=0.5, h=2.8e6) annotation (Placement(
            transformation(extent={{-90,-40},{-70,-20}}, rotation=0)));
      Water.Header header(
        V=1,
        redeclare package Medium = Medium,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
        pstart=100000)
        annotation (Placement(transformation(extent={{-40,-40},{-20,-20}},
              rotation=0)));
      Water.ValveLin ValveLin2(Kv=1/1e5) annotation (Placement(transformation(
              extent={{-2,-40},{18,-20}}, rotation=0)));
      Water.SinkPressure
                  SinkP2(p0=100000)
                               annotation (Placement(transformation(extent={{40,
                -40},{60,-20}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceW1.flange, mixer.in1) annotation (Line(
          points={{-70,50},{-60,50},{-60,36},{-50,36}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceW2.flange, mixer.in2) annotation (Line(
          points={{-70,10},{-60,10},{-60,24},{-50,24}},
          color={0,0,255},
          thickness=0.5));
      connect(ValveLin1.outlet, SinkP1.flange) annotation (Line(
          points={{34,30},{50,30}},
          color={0,0,255},
          thickness=0.5));
      connect(pressDrop.outlet, ValveLin1.inlet) annotation (Line(
          points={{0,30},{14,30}},
          color={0,0,255},
          thickness=0.5));
      connect(mixer.out, pressDrop.inlet) annotation (Line(
          points={{-32,30},{-30,30},{-28,30},{-20,30}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceW3.flange, header.inlet) annotation (Line(
          points={{-70,-30},{-56,-30},{-40.1,-30}},
          color={0,0,255},
          thickness=0.5));
      connect(header.outlet, ValveLin2.inlet) annotation (Line(
          points={{-20,-30},{-12,-30},{-2,-30}},
          color={0,0,255},
          thickness=0.5));
      connect(ValveLin2.outlet, SinkP2.flange) annotation (Line(
          points={{18,-30},{40,-30}},
          color={0,0,255},
          thickness=0.5));
      connect(Step1.y, ValveLin1.cmd)
        annotation (Line(points={{-23,70},{24,70},{24,38}}, color={0,0,127}));
      connect(Step1.y, ValveLin2.cmd)
        annotation (Line(points={{-23,70},{8,70},{8,-22}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=8),
        Documentation(info="<HTML>
<p>This model tests the <tt>Mixer</tt> and <tt>Header</tt> models.
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    end TestMixer;

    model TestMixerSlowFast
      extends Modelica.Icons.Example;
      package Medium=Modelica.Media.Water.StandardWater;
      // package Medium = Modelica.Media.Incompressible.Examples.Glycol47;
      Water.SourceMassFlow
                    SourceW1(
        w0=0.5,
        h=1e5,
        redeclare package Medium = Medium,
        use_in_h=true)                     annotation (Placement(transformation(
              extent={{-98,10},{-78,30}}, rotation=0)));
      Water.SourceMassFlow
                    SourceW2(
        w0=0.5,
        h=2e5,
        redeclare package Medium = Medium) annotation (Placement(transformation(
              extent={{-98,-30},{-78,-10}}, rotation=0)));
      Water.SinkPressure
                  SinkP1(        redeclare package Medium = Medium, p0=100000)
                                                                    annotation (
         Placement(transformation(extent={{80,-10},{100,10}}, rotation=0)));
      Water.Mixer Mixer1(
        hstart=1e5,
        V=0.01,
        redeclare package Medium = Medium,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        pstart=100000)                                        annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
      Water.ValveLin ValveLin1(Kv=1/1e5, redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{38,-10},{58,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Step StepValv(
        height=-0.2,
        offset=1,
        startTime=2) annotation (Placement(transformation(extent={{14,30},{34,
                50}}, rotation=0)));
      Water.PressDrop PressDrop1(
        wnom=1,
        dpnom=100,
        rhonom=1000,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) annotation (
          Placement(transformation(extent={{-30,-10},{-10,10}}, rotation=0)));
      Water.Header Header1(
        hstart=1e5,
        V=0.01,
        redeclare package Medium = Medium,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        pstart=100000)                                        annotation (
          Placement(transformation(extent={{0,-10},{20,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step StepEnthalpy(
        height=1e5,
        offset=1e5,
        startTime=4) annotation (Placement(transformation(extent={{-92,50},{-72,
                70}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceW1.flange, Mixer1.in1) annotation (Line(
          points={{-78,20},{-66,20},{-66,6},{-58,6}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceW2.flange, Mixer1.in2) annotation (Line(
          points={{-78,-20},{-66,-20},{-66,-6},{-58,-6}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveLin1.outlet, SinkP1.flange) annotation (Line(
          points={{58,0},{80,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(Mixer1.out, PressDrop1.inlet) annotation (Line(
          points={{-40,0},{-30,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(PressDrop1.outlet, Header1.inlet) annotation (Line(
          points={{-10,0},{-0.1,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(Header1.outlet, ValveLin1.inlet) annotation (Line(
          points={{20,0},{38,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(StepEnthalpy.y, SourceW1.in_h) annotation (Line(points={{-71,60},
              {-60,60},{-60,40},{-84,40},{-84,26}}, color={0,0,127}));
      connect(StepValv.y, ValveLin1.cmd)
        annotation (Line(points={{35,40},{48,40},{48,8}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=50, __Dymola_NumberOfIntervals=4000),
        Documentation(info="<HTML>
<p>This model tests the <tt>Mixer</tt> and <tt>Header</tt> models with different medium models. If an incompressible medium model is used, the fast pressure dynamics is neglected, thus allowing simulation with explicit algorithms and large time steps.
</HTML>", revisions="<html>
<ul>
<li><i>24 Sep 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput);
    end TestMixerSlowFast;

    model TestMixerSlowFastSteam
      extends Modelica.Icons.Example;
      package Medium=Modelica.Media.Water.StandardWater;
      // package Medium = Modelica.Media.Incompressible.Examples.Glycol47;
      Water.SourceMassFlow
                    SourceW1(
        w0=0.5,
        redeclare package Medium = Medium,
        use_in_h=true,
        h=3.2e6)
          annotation (Placement(transformation(
              extent={{-98,10},{-78,30}}, rotation=0)));
      Water.SourceMassFlow
                    SourceW2(
        w0=0.5,
        redeclare package Medium = Medium,
        h=3.2e6)                           annotation (Placement(transformation(
              extent={{-98,-30},{-78,-10}}, rotation=0)));
      Water.SinkPressure
                  SinkP1(        redeclare package Medium = Medium, p0=100000)
                                                                    annotation (
         Placement(transformation(extent={{80,-10},{100,10}}, rotation=0)));
      Water.Mixer Mixer1(
        redeclare package Medium = Medium,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
        V=0.1,
        pstart=100000,
        hstart=3.2e6,
        Tmstart=573.15)                                       annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
      Water.ValveLin ValveLin1(Kv=1/1e5, redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{38,-10},{58,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Step StepValv(
        height=-0.2,
        offset=1,
        startTime=2) annotation (Placement(transformation(extent={{14,30},{34,
                50}}, rotation=0)));
      Water.PressDrop PressDrop1(
        wnom=1,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        dpnom=100,
        rhonom=1)                                             annotation (
          Placement(transformation(extent={{-30,-10},{-10,10}}, rotation=0)));
      Water.Header Header1(
        redeclare package Medium = Medium,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Steam,
        V=0.1,
        pstart=100000,
        hstart=3.2e6,
        Tmstart=573.15)                                       annotation (
          Placement(transformation(extent={{0,-10},{20,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step StepEnthalpy(
        startTime=4,
        height=1e5,
        offset=3.2e6)
                     annotation (Placement(transformation(extent={{-92,50},{-72,
                70}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceW1.flange, Mixer1.in1) annotation (Line(
          points={{-78,20},{-66,20},{-66,6},{-58,6}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceW2.flange, Mixer1.in2) annotation (Line(
          points={{-78,-20},{-66,-20},{-66,-6},{-58,-6}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveLin1.outlet, SinkP1.flange) annotation (Line(
          points={{58,0},{80,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(Mixer1.out, PressDrop1.inlet) annotation (Line(
          points={{-40,0},{-30,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(PressDrop1.outlet, Header1.inlet) annotation (Line(
          points={{-10,0},{-0.1,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(Header1.outlet, ValveLin1.inlet) annotation (Line(
          points={{20,0},{38,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(StepEnthalpy.y, SourceW1.in_h) annotation (Line(points={{-71,60},
              {-60,60},{-60,40},{-84,40},{-84,26}}, color={0,0,127}));
      connect(StepValv.y, ValveLin1.cmd)
        annotation (Line(points={{35,40},{48,40},{48,8}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=6, __Dymola_NumberOfIntervals=4000),
        Documentation(info="<HTML>
<p>This model tests the <tt>Mixer</tt> and <tt>Header</tt> models with different medium models. If an incompressible medium model is used, the fast pressure dynamics is neglected, thus allowing simulation with explicit algorithms and large time steps.
</HTML>", revisions="<html>
<ul>
<li><i>24 Sep 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput);
    end TestMixerSlowFastSteam;

    model TestPressDrop
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.StandardWater;
      Water.SourcePressure
                    SourceP1(p0=300000) annotation (Placement(transformation(
              extent={{-78,60},{-58,80}}, rotation=0)));
      Water.SinkPressure
                  SinkP1(p0=100000) annotation (Placement(transformation(extent=
               {{40,60},{60,80}},rotation=0)));
      parameter Real Kf_unknown(fixed=false);
      Water.SourcePressure
                    SourceP3(p0=3e5) annotation (Placement(transformation(
              extent={{-80,-20},{-60,0}}, rotation=0)));
      Water.SinkPressure
                  SinkP3(p0=1e5) annotation (Placement(transformation(extent={{
                40,-20},{60,0}}, rotation=0)));
      Water.PressDrop PressDrop3a(
        redeclare package Medium = Medium,
        wnom=1,
        dpnom=1e5,
        rhonom=1000,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) annotation (
          Placement(transformation(extent={{-40,-20},{-20,0}}, rotation=0)));
      Water.PressDrop PressDrop3b(
        redeclare package Medium = Medium,
        wnom=1,
        dpnom=1e5,
        rhonom=1000,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) annotation (
          Placement(transformation(extent={{0,-20},{20,0}}, rotation=0)));
      Water.SourcePressure
                    SourceP4(p0=3e5) annotation (Placement(transformation(
              extent={{-80,-60},{-60,-40}}, rotation=0)));
      Water.SinkPressure
                  SinkP4(p0=1e5) annotation (Placement(transformation(extent={{
                40,-60},{60,-40}}, rotation=0)));
      Water.PressDrop PressDrop4a(
        redeclare package Medium = Medium,
        K=1,
        A=1e-4,
        wnom=1,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kinetic,
        dpnom=100000) annotation (Placement(transformation(extent={{-40,-60},{-20,
                -40}}, rotation=0)));
      Water.PressDrop PressDrop4b(
        redeclare package Medium = Medium,
        wnom=1,
        K=1,
        A=1e-4,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kinetic,
        dpnom=100000) annotation (Placement(transformation(extent={{0,-60},{20,
                -40}}, rotation=0)));
      Water.SourcePressure
                    SourceP2(p0=3e5) annotation (Placement(transformation(
              extent={{-80,20},{-60,40}}, rotation=0)));
      Water.SinkPressure
                  SinkP2(p0=1e5) annotation (Placement(transformation(extent={{
                40,20},{60,40}}, rotation=0)));
      Water.PressDrop PressDrop2a(
        redeclare package Medium = Medium,
        wnom=1,
        Kf=Kf_unknown,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf,
        dpnom=100000) annotation (Placement(transformation(extent={{-40,20},{-20,
                40}}, rotation=0)));
      Water.PressDrop PressDrop2b(
        redeclare package Medium = Medium,
        wnom=1,
        Kf=Kf_unknown,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf,
        dpnom=100000) annotation (Placement(transformation(extent={{0,20},{20,
                40}}, rotation=0)));
      Water.PressDrop PressDrop1a(
        wnom=1,
        Kf=1e8,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf,
        dpnom=100000) annotation (Placement(transformation(extent={{-40,60},{-20,
                80}}, rotation=0)));
      Water.PressDrop PressDrop1b(
        redeclare package Medium = Medium,
        wnom=1,
        Kf=1e8,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf,
        dpnom=100000) annotation (Placement(transformation(extent={{0,60},{20,
                80}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    initial equation
      PressDrop2a.inlet.m_flow = 1;

    equation
      connect(SourceP3.flange, PressDrop3a.inlet) annotation (Line(
          points={{-60,-10},{-40,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDrop3a.outlet, PressDrop3b.inlet) annotation (Line(
          points={{-20,-10},{0,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDrop3b.outlet, SinkP3.flange) annotation (Line(
          points={{20,-10},{40,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceP4.flange, PressDrop4a.inlet) annotation (Line(
          points={{-60,-50},{-40,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDrop4a.outlet, PressDrop4b.inlet) annotation (Line(
          points={{-20,-50},{0,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDrop4b.outlet, SinkP4.flange) annotation (Line(
          points={{20,-50},{40,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceP2.flange, PressDrop2a.inlet) annotation (Line(
          points={{-60,30},{-40,30}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDrop2a.outlet, PressDrop2b.inlet) annotation (Line(
          points={{-20,30},{0,30}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDrop2b.outlet, SinkP2.flange) annotation (Line(
          points={{20,30},{40,30}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceP1.flange, PressDrop1a.inlet) annotation (Line(
          points={{-58,70},{-40,70}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDrop1a.outlet, PressDrop1b.inlet) annotation (Line(
          points={{-20,70},{0,70}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDrop1b.outlet, SinkP1.flange) annotation (Line(
          points={{20,70},{40,70}},
          color={0,0,255},
          thickness=0.5));
      annotation (Diagram(graphics), Documentation(info="<html>
This test model demonstrate four possible ways of setting the friction coefficient for the <tt>PressDrop</tt> model.
<ol>
<li>The friction factor coefficient can be specified directly, by setting <tt>FFtype=0</tt> and the appropriate value to <tt>Kf</tt>.
<li>The friction factor needed to obtain certain conditions can be set by initial equations. In this case, <tt>FFtype=0</tt>, and <tt>Kf=Kf_unknown</tt>, with <tt>Kf_unknown</tt> having a fixed=false attribute. The latter parameter is then determined by an initial equation (e.g. by assigning the initial mass flow rate).
<li>The friction factor can be specified by setting <tt>FFtype=1</tt>, and then by assigning the nominal pressure drop <tt>dpnom</tt> corresponding to the nominal flow rate <tt>wnom</tt> and to the nominal density <tt>rhonom</tt>.
<li>The pressure drop can be specified as a given multiple of the kinetic pressure, by setting <tt>FFtype=2</tt> and assigning the multiplicative coefficient <tt>K</tt>.
</ol>
</html>", revisions="<html>
<ul>
    <li><i>18 Nov 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:
    <br>First release.</li>
</ul>
</html>"));
    end TestPressDrop;

    model TestPressDropRev
      extends Modelica.Icons.Example;

      Water.PressDrop pressDrop(
        wnom=1,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        wnf=0.02,
        rhonom=1000,
        dpnom=1000)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      ThermoPower.Water.SinkPressure
                              sinkP(p0=300000)
        annotation (Placement(transformation(extent={{30,-10},{50,10}})));
      ThermoPower.Water.SourceMassFlow
                                sourceW(use_in_w0=true)
        annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
      Modelica.Blocks.Sources.Sine Cmd1(
        startTime=0,
        amplitude=5,
        freqHz=1,
        offset=0) annotation (Placement(transformation(extent={{-82,10},{-62,30}},
              rotation=0)));
      inner ThermoPower.System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Real y "Derivative of dp";
    equation
      y = der(pressDrop.dp);
      connect(Cmd1.y, sourceW.in_w0) annotation (Line(
          points={{-61,20},{-44,20},{-44,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sourceW.flange, pressDrop.inlet) annotation (Line(
          points={{-30,0},{-10,0}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5));
      connect(sinkP.flange, pressDrop.outlet) annotation (Line(
          points={{30,0},{10,0}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        Diagram(graphics),
        experiment(__Dymola_NumberOfIntervals=5000, Tolerance=1e-005),
        Documentation(info="<html>
<p>This model tests the <code>PressDrop</code> model in condition of flow reversal.</p>
</html>"));
    end TestPressDropRev;

    model TestThroughMassFlow "Test of the ThroughMassFlow component"
      extends Modelica.Icons.Example;

      Water.SourcePressure
                    SourceP1 annotation (Placement(transformation(extent={{-80,
                10},{-60,30}}, rotation=0)));
      Water.PressDropLin PressDropLin1(R=1e5/1) annotation (Placement(
            transformation(extent={{0,10},{20,30}}, rotation=0)));
      Water.ThroughMassFlow
                     ThroughW1(w0=2) annotation (Placement(transformation(
              extent={{-40,10},{-20,30}}, rotation=0)));
      Water.SinkPressure
                  SinkP1 annotation (Placement(transformation(extent={{40,10},{
                60,30}}, rotation=0)));
      Water.SourcePressure
                    SourceP2 annotation (Placement(transformation(extent={{-80,
                -50},{-60,-30}}, rotation=0)));
      Water.PressDropLin PressDropLin2(R=1e5/1) annotation (Placement(
            transformation(extent={{0,-50},{20,-30}}, rotation=0)));
      Water.ThroughMassFlow
                     ThroughW2(w0=2, use_in_w0=true)
                                     annotation (Placement(transformation(
              extent={{-40,-50},{-20,-30}}, rotation=0)));
      Water.SinkPressure
                  SinkP2 annotation (Placement(transformation(extent={{40,-50},
                {60,-30}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        height=1,
        offset=2,
        startTime=0.5) annotation (Placement(transformation(extent={{-60,-20},{
                -40,0}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(ThroughW1.outlet, PressDropLin1.inlet) annotation (Line(
          points={{-20,20},{0,20}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceP1.flange, ThroughW1.inlet) annotation (Line(
          points={{-60,20},{-40,20}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDropLin1.outlet, SinkP1.flange) annotation (Line(
          points={{20,20},{40,20}},
          color={0,0,255},
          thickness=0.5));
      connect(ThroughW2.outlet, PressDropLin2.inlet) annotation (Line(
          points={{-20,-40},{0,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceP2.flange, ThroughW2.inlet) annotation (Line(
          points={{-60,-40},{-40,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(PressDropLin2.outlet, SinkP2.flange) annotation (Line(
          points={{20,-40},{40,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(Step1.y, ThroughW2.in_w0) annotation (Line(points={{-39,-10},{-34,
              -10},{-34,-34}}, color={0,0,127}));
      annotation (Diagram(graphics), Documentation(revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    end TestThroughMassFlow;

    model TestValves "Test cases for valves"
      extends Modelica.Icons.Example;

      ThermoPower.Water.SourcePressure
                                SourceP1(p0=10e5) annotation (Placement(
            transformation(extent={{-100,40},{-80,60}}, rotation=0)));
      ThermoPower.Water.SourcePressure
                                SourceP2(p0=8e5) annotation (Placement(
            transformation(extent={{-100,-60},{-80,-40}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP1(p0=1e5) annotation (Placement(
            transformation(extent={{70,-10},{90,10}}, rotation=0)));
      ThermoPower.Water.ValveLiq V1(
        dpnom=9e5,
        wnom=1.5,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        pnom=10e5,
        Kv=2,
        CvData=ThermoPower.Choices.Valve.CvTypes.Kv) annotation (Placement(
            transformation(extent={{-30,60},{-10,80}}, rotation=0)));
      Water.ValveLiq V2(
        dpnom=5e5,
        wnom=1.2,
        pnom=10e5,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        Av=5e-5,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av) annotation (Placement(
            transformation(extent={{-30,20},{-10,40}}, rotation=0)));
      ThermoPower.Water.ValveLiq V3(
        dpnom=3e5,
        wnom=1.1,
        pnom=10e5,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        Av=5e-5,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av) annotation (Placement(
            transformation(extent={{-30,-40},{-10,-20}}, rotation=0)));
      ThermoPower.Water.ValveLiq V4(
        dpnom=8e5,
        wnom=1.3,
        pnom=10e5,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        Cv=2,
        CvData=ThermoPower.Choices.Valve.CvTypes.Cv) annotation (Placement(
            transformation(extent={{-30,-80},{-10,-60}}, rotation=0)));
      ThermoPower.Water.ValveLiq V5(
        dpnom=4e5,
        wnom=2,
        pnom=5e5,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        Av=1e-4,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av) annotation (Placement(
            transformation(extent={{40,-10},{60,10}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP2(p0=1e5) annotation (Placement(
            transformation(extent={{10,60},{30,80}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP3(p0=1e5) annotation (Placement(
            transformation(extent={{10,-80},{30,-60}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp CloseLoad(
        duration=1,
        height=-0.99,
        offset=1,
        startTime=1) annotation (Placement(transformation(extent={{20,20},{40,
                40}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp OpenRelief(
        duration=2,
        height=1,
        offset=0,
        startTime=1) annotation (Placement(transformation(extent={{-92,74},{-72,
                94}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp CloseValves(
        duration=2,
        height=-1,
        offset=1,
        startTime=1) annotation (Placement(transformation(extent={{-90,-10},{-70,
                10}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(CloseValves.y, V3.theta)
        annotation (Line(points={{-69,0},{-20,0},{-20,-22}}, color={0,0,127}));
      connect(CloseValves.y, V2.theta) annotation (Line(points={{-69,0},{-40,0},
              {-40,50},{-20,50},{-20,38}}, color={0,0,127}));
      connect(OpenRelief.y, V1.theta) annotation (Line(points={{-71,84},{-20,84},
              {-20,78}}, color={0,0,127}));
      connect(V4.theta, OpenRelief.y) annotation (Line(points={{-20,-62},{-20,-50},
              {-44,-50},{-44,84},{-71,84}}, color={0,0,127}));
      connect(CloseLoad.y, V5.theta)
        annotation (Line(points={{41,30},{50,30},{50,8}}, color={0,0,127}));
      connect(SinkP2.flange, V1.outlet) annotation (Line(
          points={{10,70},{-10,70}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(SinkP1.flange, V5.outlet) annotation (Line(
          points={{70,0},{60,0}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(SinkP3.flange, V4.outlet) annotation (Line(
          points={{10,-70},{-10,-70}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(V5.inlet, V3.outlet) annotation (Line(
          points={{40,0},{10,0},{10,-30},{-10,-30}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(V5.inlet, V2.outlet) annotation (Line(
          points={{40,0},{10,0},{10,30},{-10,30}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(V2.inlet, SourceP1.flange) annotation (Line(
          points={{-30,30},{-60,30},{-60,50},{-80,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(V1.inlet, SourceP1.flange) annotation (Line(
          points={{-30,70},{-60,70},{-60,50},{-80,50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(V4.inlet, SourceP2.flange) annotation (Line(
          points={{-30,-70},{-60,-70},{-60,-50},{-80,-50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(V3.inlet, SourceP2.flange) annotation (Line(
          points={{-30,-30},{-60,-30},{-60,-50},{-80,-50}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        Diagram(graphics),
        experiment(StopTime=4, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>ValveLiq</tt> model zero or reverse flow conditions.
<p>Simulate the model for 4 s. At t = 1 s the V5 valve closes in 1 s, the V2 and V3 valves close in 2 s and the V1 and V4 valves open in 2 s. The flow in valve V3 reverses between t = 1.83 and t = 1.93.
</HTML>", revisions="<html>
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
    end TestValves;

    model TestValveChoked "Test case for valves in choked flow"
      extends Modelica.Icons.Example;

      ThermoPower.Water.SourcePressure
                                SourceP1(p0=5e5, h=400e3) annotation (Placement(
            transformation(extent={{-50,30},{-30,50}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP1(use_in_p0=true)
                                     annotation (Placement(transformation(
              extent={{40,30},{60,50}}, rotation=0)));
      ThermoPower.Water.ValveLiqChoked ValveLiqChocked(
        wnom=1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        Av=5e-5,
        CheckValve=false,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av,
        useThetaInput=false,
        pnom=500000,
        dpnom=200000)                                annotation (Placement(
            transformation(extent={{-10,30},{10,50}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine1(
        amplitude=2.5e5,
        freqHz=0.5,
        offset=3e5,
        phase=3.14159,
        startTime=1) annotation (Placement(transformation(extent={{10,60},{30,
                80}}, rotation=0)));
      ThermoPower.Water.SourcePressure
                                SourceP2(p0=60e5, h=2.9e6) annotation (
          Placement(transformation(extent={{-50,-50},{-30,-30}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP2(p0=100000, use_in_p0=true)
                                             annotation (Placement(
            transformation(extent={{40,-50},{60,-30}}, rotation=0)));
      ThermoPower.Water.ValveVap ValveVap(
        wnom=1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        Av=1e-4,
        CheckValve=false,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av,
        useThetaInput=false,
        pnom=6000000,
        dpnom=3000000)                               annotation (Placement(
            transformation(extent={{-10,-50},{10,-30}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine2(
        amplitude=49.5e5,
        freqHz=0.5,
        offset=50e5,
        phase=3.14159,
        startTime=1) annotation (Placement(transformation(extent={{10,-20},{30,
                0}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(ValveLiqChocked.outlet, SinkP1.flange) annotation (Line(
          points={{10,40},{40,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceP1.flange, ValveLiqChocked.inlet) annotation (Line(
          points={{-30,40},{-10,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceP2.flange, ValveVap.inlet) annotation (Line(
          points={{-30,-40},{-10,-40}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveVap.outlet, SinkP2.flange) annotation (Line(
          points={{10,-40},{40,-40}},
          thickness=0.5,
          color={0,0,255}));
      connect(Sine1.y, SinkP1.in_p0)
        annotation (Line(points={{31,70},{46,70},{46,48.8}}, color={0,0,127}));
      connect(Sine2.y, SinkP2.in_p0) annotation (Line(points={{31,-10},{46,-10},
              {46,-31.2}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=4, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the transition from normal to choked flow for the <tt>ValveLiq</tt> and <tt>ValveVap</tt> models.
<p>Simulate the model for 4 s and observe the flowrate through the two valves.
</HTML>", revisions="<html>
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
    end TestValveChoked;

    model TestCoeffValve "Test case for valve with different CvData settings"
      extends Modelica.Icons.Example;

      ThermoPower.Water.SourcePressure
                                SourceP1(p0=5e5, h=2e5) annotation (Placement(
            transformation(extent={{-50,50},{-30,70}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP1(p0=3e5) annotation (Placement(
            transformation(extent={{40,50},{60,70}}, rotation=0)));
      Water.ValveLiq ValveLiq1(
        wnom=1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av,
        Av=7.2e-5,
        useThetaInput=false,
        pnom=500000,
        dpnom=200000)
                   annotation (Placement(transformation(extent={{-10,50},{10,70}},
              rotation=0)));
      ThermoPower.Water.SourcePressure
                                SourceP2(p0=5e5, h=2e5) annotation (Placement(
            transformation(extent={{-50,10},{-30,30}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP2(p0=3e5) annotation (Placement(
            transformation(extent={{40,10},{60,30}}, rotation=0)));
      Water.ValveLiq ValveLiq2(
        wnom=1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CvData=ThermoPower.Choices.Valve.CvTypes.Kv,
        Kv=2.592,
        useThetaInput=false,
        pnom=500000,
        dpnom=200000)
                  annotation (Placement(transformation(extent={{-10,10},{10,30}},
              rotation=0)));
      ThermoPower.Water.SourcePressure
                                SourceP3(p0=5e5, h=2e5) annotation (Placement(
            transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP3(p0=3e5) annotation (Placement(
            transformation(extent={{40,-30},{60,-10}}, rotation=0)));
      Water.ValveLiq ValveLiq3(
        wnom=1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
        Cv=2.997,
        useThetaInput=false,
        pnom=500000,
        dpnom=200000)
                  annotation (Placement(transformation(extent={{-10,-30},{10,-10}},
              rotation=0)));
      ThermoPower.Water.SourcePressure
                                SourceP4(p0=5e5, h=2e5) annotation (Placement(
            transformation(extent={{-50,-70},{-30,-50}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP4(p0=3e5) annotation (Placement(
            transformation(extent={{40,-70},{60,-50}}, rotation=0)));
      Water.ValveLiq ValveLiq4(
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint,
        wnom=1.012,
        rhonom=989,
        useThetaInput=false,
        pnom=500000,
        dpnom=200000)
                    annotation (Placement(transformation(extent={{-10,-70},{10,
                -50}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(ValveLiq1.outlet, SinkP1.flange) annotation (Line(
          points={{10,60},{40,60}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceP1.flange, ValveLiq1.inlet) annotation (Line(
          points={{-30,60},{-10,60}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveLiq2.outlet, SinkP2.flange) annotation (Line(
          points={{10,20},{40,20}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceP2.flange, ValveLiq2.inlet) annotation (Line(
          points={{-30,20},{-10,20}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveLiq3.outlet, SinkP3.flange) annotation (Line(
          points={{10,-20},{40,-20}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceP3.flange, ValveLiq3.inlet) annotation (Line(
          points={{-30,-20},{-10,-20}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveLiq4.outlet, SinkP4.flange) annotation (Line(
          points={{10,-60},{40,-60}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceP4.flange, ValveLiq4.inlet) annotation (Line(
          points={{-30,-60},{-10,-60}},
          thickness=0.5,
          color={0,0,255}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=4, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>ValveLiq</tt> models with four possible flow coefficients (also applies to other valves).
<ol>
<li>Av (metric) flow coefficient [m2];
<li>Kv (metric) flow coefficient [m3/h];
<li>Cv (US) flow coefficient [USG/min];
<li>Av defined by nominal operating point [m2].
</ol>
<p>Simulate the model for 4 s and observe the flowrate through the valves.
</HTML>", revisions="<html>
<ul>
<li><i>3 Dec 2008</i>
     by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
    end TestCoeffValve;

    model ValveZeroFlow "Test case for valves with zero flowrate"
      extends Modelica.Icons.Example;

      ThermoPower.Water.SourcePressure
                                Source(p0=5e5) annotation (Placement(
            transformation(extent={{-90,-10},{-70,10}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(p0=1e5) annotation (Placement(transformation(
              extent={{70,-10},{90,10}}, rotation=0)));
      ThermoPower.Water.ValveLiq V1(
        wnom=1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint,
        pnom=500000,
        dpnom=200000)                                     annotation (Placement(
            transformation(extent={{-50,-10},{-30,10}}, rotation=0)));
      ThermoPower.Water.ValveLiq V2(
        wnom=1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint,
        pnom=300000,
        dpnom=100000)                                     annotation (Placement(
            transformation(extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step Cmd1(
        height=0,
        offset=1,
        startTime=0) annotation (Placement(transformation(extent={{-70,20},{-50,
                40}}, rotation=0)));
      Modelica.Blocks.Sources.Step Cmd2(
        height=-0.5,
        offset=1,
        startTime=0.3) annotation (Placement(transformation(extent={{-30,20},{-10,
                40}}, rotation=0)));
      ThermoPower.Water.ValveLiq V3(
        wnom=1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint,
        pnom=200000,
        dpnom=100000)                                     annotation (Placement(
            transformation(extent={{30,-10},{50,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step Cmd3(
        height=-1,
        offset=1,
        startTime=0.6) annotation (Placement(transformation(extent={{10,20},{30,
                40}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(Source.flange, V1.inlet) annotation (Line(
          points={{-70,0},{-50,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(V1.outlet, V2.inlet) annotation (Line(
          points={{-30,0},{-10,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(V2.outlet, V3.inlet) annotation (Line(
          points={{10,0},{30,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(Sink.flange, V3.outlet) annotation (Line(
          points={{70,0},{50,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(Cmd1.y, V1.theta)
        annotation (Line(points={{-49,30},{-40,30},{-40,8}}, color={0,0,127}));
      connect(Cmd2.y, V2.theta)
        annotation (Line(points={{-9,30},{0,30},{0,8}}, color={0,0,127}));
      connect(Cmd3.y, V3.theta)
        annotation (Line(points={{31,30},{40,30},{40,8}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),
                graphics),
        experiment(StopTime=1, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>ValveLiq</tt> model in zero flowrate conditions.</p>
<p>The flow coefficients are determined by initial equations, assuming a flow rate of 1 kg/s and equal sizing for the three valves.
<p>Simulate the model for 1 s and observe the flowrates through the valves and the inlet and outlet pressure of V2.
</HTML>", revisions="<html>
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
    end ValveZeroFlow;

    model ValveZeroFlow2 "Test case for valves with zero flowrate"
      extends Modelica.Icons.Example;

      Modelica.Blocks.Sources.Step Cmd1(
        height=0,
        offset=1,
        startTime=0) annotation (Placement(transformation(extent={{-40,20},{-20,
                40}}, rotation=0)));
      ThermoPower.Water.Tank Tank1(
        A=0.1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        ystart=2) annotation (Placement(transformation(extent={{-50,-14},{-30,6}},
              rotation=0)));
      ThermoPower.Water.Tank Tank2(
        A=0.1,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        ystart=1) annotation (Placement(transformation(extent={{30,-14},{50,6}},
              rotation=0)));
      ThermoPower.Water.ValveLiq Valve(
        dpnom=1e4,
        wnom=10,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        Av=3.5e-3,
        pnom=1e5,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av) annotation (Placement(
            transformation(extent={{-10,-20},{10,0}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                SourceW1(w0=0) annotation (Placement(
            transformation(extent={{-90,-20},{-70,0}}, rotation=0)));
      ThermoPower.Water.SinkMassFlow
                              SinkW1(w0=0) annotation (Placement(transformation(
              extent={{70,-20},{90,0}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(Tank1.outlet, Valve.inlet) annotation (Line(
          points={{-32,-10},{-10,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(Valve.outlet, Tank2.inlet) annotation (Line(
          points={{10,-10},{32,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(Tank2.outlet, SinkW1.flange) annotation (Line(
          points={{48,-10},{70,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceW1.flange, Tank1.inlet) annotation (Line(
          points={{-70,-10},{-48,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(Cmd1.y, Valve.theta)
        annotation (Line(points={{-19,30},{0,30},{0,-2}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=20, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>ValveLiq</tt> model with small or zero flow and the <tt>Tank</tt> model.</p>
<p>Simulate for 20 s. After 10 s the flowrate goes to zero, as the two levels become equal. </p>
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>

</html>"));
    end ValveZeroFlow2;

    model TestJoin "Test case FlowJoin and FlowSplit"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph;
      constant Real pi=Modelica.Constants.pi;
      ThermoPower.Water.SourceMassFlow
                                S1(h=1e5, use_in_w0=true)
                                          annotation (Placement(transformation(
              extent={{-58,50},{-38,70}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                S2(h=2e5, use_in_w0=true)
                                          annotation (Placement(transformation(
              extent={{-58,10},{-38,30}}, rotation=0)));
      ThermoPower.Water.SinkMassFlow
                              S5(h=2e5, use_in_w0=true)
                                        annotation (Placement(transformation(
              extent={{60,-44},{80,-24}}, rotation=0)));
      ThermoPower.Water.SinkMassFlow
                              S6(h=3e5, use_in_w0=true)
                                        annotation (Placement(transformation(
              extent={{60,-96},{80,-76}}, rotation=0)));
      ThermoPower.Water.FlowJoin FlowJoin1 annotation (Placement(transformation(
              extent={{-10,30},{10,50}}, rotation=0)));
      ThermoPower.Water.FlowSplit FlowSplit1 annotation (Placement(
            transformation(extent={{-4,-70},{16,-50}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              S3(h=3e5) annotation (Placement(transformation(
              extent={{70,30},{90,50}}, rotation=0)));
      ThermoPower.Water.PressDropLin LossP1(R=1e-5) annotation (Placement(
            transformation(extent={{40,30},{60,50}}, rotation=0)));
      ThermoPower.Water.PressDropLin LossP2(R=1e-5) annotation (Placement(
            transformation(extent={{-60,-70},{-40,-50}}, rotation=0)));
      ThermoPower.Water.SourcePressure
                                S4(h=1e5) annotation (Placement(transformation(
              extent={{-90,-70},{-70,-50}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine1(
        amplitude=1,
        freqHz=1,
        phase=pi/2,
        offset=0,
        startTime=0) annotation (Placement(transformation(extent={{-90,70},{-70,
                90}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine2(
        freqHz=0.5,
        amplitude=1,
        phase=pi/2,
        offset=0,
        startTime=0) annotation (Placement(transformation(extent={{-90,30},{-70,
                50}}, rotation=0)));
      ThermoPower.Water.SensT T1(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{-32,54},{-12,74}}, rotation=0)));
      ThermoPower.Water.SensT T2(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{-32,14},{-12,34}}, rotation=0)));
      ThermoPower.Water.SensT T3(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{14,34},{34,54}}, rotation=0)));
      ThermoPower.Water.SensT T4(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{-30,-66},{-10,-46}}, rotation=0)));
      ThermoPower.Water.SensT T5(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{20,-40},{40,-20}}, rotation=0)));
      ThermoPower.Water.SensT T6(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{20,-92},{40,-72}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine3(
        freqHz=1,
        amplitude=1,
        phase=pi/2,
        offset=0,
        startTime=0) annotation (Placement(transformation(extent={{34,-16},{54,
                4}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine4(
        freqHz=0.5,
        amplitude=1,
        phase=pi/2,
        offset=0,
        startTime=0) annotation (Placement(transformation(extent={{34,-66},{54,
                -46}}, rotation=0)));
      ThermoPower.Water.SensP P1 annotation (Placement(transformation(extent={{
                -42,-48},{-22,-28}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(LossP1.outlet, S3.flange) annotation (Line(
          points={{60,40},{70,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(S4.flange, LossP2.inlet) annotation (Line(
          points={{-70,-60},{-60,-60}},
          thickness=0.5,
          color={0,0,255}));
      connect(S1.flange, T1.inlet) annotation (Line(
          points={{-38,60},{-28,60}},
          thickness=0.5,
          color={0,0,255}));
      connect(S2.flange, T2.inlet) annotation (Line(
          points={{-38,20},{-28,20}},
          thickness=0.5,
          color={0,0,255}));
      connect(FlowJoin1.out, T3.inlet) annotation (Line(
          points={{6,40},{18,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(T3.outlet, LossP1.inlet) annotation (Line(
          points={{30,40},{40,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(LossP2.outlet, T4.inlet) annotation (Line(
          points={{-40,-60},{-26,-60}},
          thickness=0.5,
          color={0,0,255}));
      connect(T4.outlet, FlowSplit1.in1) annotation (Line(
          points={{-14,-60},{0,-60}},
          thickness=0.5,
          color={0,0,255}));
      connect(T5.outlet, S5.flange) annotation (Line(
          points={{36,-34},{60,-34}},
          thickness=0.5,
          color={0,0,255}));
      connect(T6.outlet, S6.flange) annotation (Line(
          points={{36,-86},{60,-86}},
          thickness=0.5,
          color={0,0,255}));
      connect(Sine1.y, S1.in_w0) annotation (Line(points={{-69,80},{-52,80},{-52,
              66}}, color={0,0,127}));
      connect(Sine2.y, S2.in_w0) annotation (Line(points={{-69,40},{-52,40},{-52,
              26}}, color={0,0,127}));
      connect(Sine4.y, S6.in_w0) annotation (Line(points={{55,-56},{66,-56},{66,
              -80}}, color={0,0,127}));
      connect(Sine3.y, S5.in_w0)
        annotation (Line(points={{55,-6},{66,-6},{66,-28}}, color={0,0,127}));
      connect(T2.outlet, FlowJoin1.in2) annotation (Line(
          points={{-16,20},{-16,20},{-6,36}},
          thickness=0.5,
          color={0,0,255}));
      connect(FlowJoin1.in1, T1.outlet) annotation (Line(
          points={{-6,44},{-16,60}},
          thickness=0.5,
          color={0,0,255}));
      connect(T6.inlet, FlowSplit1.out2) annotation (Line(
          points={{24,-86},{24,-86},{12,-64}},
          thickness=0.5,
          color={0,0,255}));
      connect(LossP2.outlet, P1.flange) annotation (Line(
          points={{-40,-60},{-40,-42},{-32,-42}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      connect(T5.inlet, FlowSplit1.out1) annotation (Line(
          points={{24,-34},{18,-34},{18,-56},{12,-56}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None));
      annotation (
        Diagram(graphics),
        experiment(StopTime=4, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>FlowJoin</tt> and the <tt>FlowSplit</tt> models in all the possible flow configurations.
<p>Simulate the model for 4 s and observe the temperatures measured by the different sensors as the flows change.
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    end TestJoin;

    model TestJoinRev "Test case FlowJoin"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph;
      constant Real pi=Modelica.Constants.pi;
      ThermoPower.Water.SourceMassFlow
                                S1(h=1e5, w0=2,
        use_in_w0=true)                         annotation (Placement(
            transformation(extent={{-58,50},{-38,70}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                S2(h=2e5, use_in_w0=true)
                                          annotation (Placement(transformation(
              extent={{-58,10},{-38,30}}, rotation=0)));
      ThermoPower.Water.FlowJoin FlowJoin1 annotation (Placement(transformation(
              extent={{-10,30},{10,50}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              S3(h=3e5) annotation (Placement(transformation(
              extent={{70,30},{90,50}}, rotation=0)));
      ThermoPower.Water.PressDropLin LossP1(R=1e-5) annotation (Placement(
            transformation(extent={{40,30},{60,50}}, rotation=0)));
      ThermoPower.Water.SensT T1(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{-32,54},{-12,74}}, rotation=0)));
      ThermoPower.Water.SensT T2(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{-32,14},{-12,34}}, rotation=0)));
      ThermoPower.Water.SensT T3(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{14,34},{34,54}}, rotation=0)));
      Modelica.Blocks.Sources.Trapezoid Sine1(
        nperiod=2,
        rising=0.5,
        width=0.5,
        falling=0.5,
        period=4,
        offset=1,
        startTime=0.5,
        amplitude=-1.2) annotation (Placement(transformation(extent={{-90,70},{
                -70,90}}, rotation=0)));
      Modelica.Blocks.Sources.Trapezoid Sine2(
        nperiod=2,
        rising=0.5,
        width=0.5,
        falling=0.5,
        offset=1,
        startTime=2.5,
        period=2,
        amplitude=-1.2) annotation (Placement(transformation(extent={{-90,30},{
                -70,50}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                S4(h=1e5, w0=2,
        use_in_w0=true)                         annotation (Placement(
            transformation(extent={{-58,-30},{-38,-10}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                S5(h=2e5, use_in_w0=true)
                                          annotation (Placement(transformation(
              extent={{-58,-70},{-38,-50}}, rotation=0)));
      ThermoPower.Water.FlowJoin FlowJoin2(
        rev_in1=false,
        rev_in2=false,
        rev_out=false) annotation (Placement(transformation(extent={{-10,-50},{
                10,-30}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              S6(h=3e5) annotation (Placement(transformation(
              extent={{70,-50},{90,-30}}, rotation=0)));
      ThermoPower.Water.PressDropLin LossP2(R=1e-5) annotation (Placement(
            transformation(extent={{40,-50},{60,-30}}, rotation=0)));
      ThermoPower.Water.SensT T4(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{-32,-26},{-12,-6}}, rotation=0)));
      ThermoPower.Water.SensT T5(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{-32,-66},{-12,-46}}, rotation=0)));
      ThermoPower.Water.SensT T6(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{14,-46},{34,-26}}, rotation=0)));
      Modelica.Blocks.Sources.Trapezoid Sine3(
        nperiod=2,
        rising=0.5,
        width=0.5,
        falling=0.5,
        period=4,
        offset=1,
        startTime=0.5,
        amplitude=-1.2) annotation (Placement(transformation(extent={{-90,-10},
                {-70,10}}, rotation=0)));
      Modelica.Blocks.Sources.Trapezoid Sine4(
        nperiod=2,
        rising=0.5,
        width=0.5,
        falling=0.5,
        offset=1,
        startTime=2.5,
        period=2,
        amplitude=-1.2) annotation (Placement(transformation(extent={{-90,-50},
                {-70,-30}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(LossP1.outlet, S3.flange) annotation (Line(
          points={{60,40},{70,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(S1.flange, T1.inlet) annotation (Line(
          points={{-38,60},{-28,60}},
          thickness=0.5,
          color={0,0,255}));
      connect(S2.flange, T2.inlet) annotation (Line(
          points={{-38,20},{-28,20}},
          thickness=0.5,
          color={0,0,255}));
      connect(FlowJoin1.out, T3.inlet) annotation (Line(
          points={{6,40},{18,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(T3.outlet, LossP1.inlet) annotation (Line(
          points={{30,40},{40,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(T2.outlet, FlowJoin1.in2) annotation (Line(
          points={{-16,20},{-16,20},{-6,36}},
          thickness=0.5,
          color={0,0,255}));
      connect(FlowJoin1.in1, T1.outlet) annotation (Line(
          points={{-6,44},{-16,60}},
          thickness=0.5,
          color={0,0,255}));
      connect(Sine2.y, S2.in_w0) annotation (Line(points={{-69,40},{-52,40},{-52,
              26}}, color={0,0,127}));
      connect(Sine1.y, S1.in_w0) annotation (Line(points={{-69,80},{-52,80},{-52,
              66}}, color={0,0,127}));
      connect(LossP2.outlet, S6.flange) annotation (Line(
          points={{60,-40},{70,-40}},
          thickness=0.5,
          color={0,0,255}));
      connect(S4.flange, T4.inlet) annotation (Line(
          points={{-38,-20},{-28,-20}},
          thickness=0.5,
          color={0,0,255}));
      connect(S5.flange, T5.inlet) annotation (Line(
          points={{-38,-60},{-28,-60}},
          thickness=0.5,
          color={0,0,255}));
      connect(FlowJoin2.out, T6.inlet) annotation (Line(
          points={{6,-40},{18,-40}},
          thickness=0.5,
          color={0,0,255}));
      connect(T6.outlet, LossP2.inlet) annotation (Line(
          points={{30,-40},{40,-40}},
          thickness=0.5,
          color={0,0,255}));
      connect(T5.outlet, FlowJoin2.in2) annotation (Line(
          points={{-16,-60},{-14,-60},{-6,-44}},
          thickness=0.5,
          color={0,0,255}));
      connect(FlowJoin2.in1, T4.outlet) annotation (Line(
          points={{-6,-36},{-16,-20}},
          thickness=0.5,
          color={0,0,255}));
      connect(Sine4.y, S5.in_w0) annotation (Line(points={{-69,-40},{-52,-40},{
              -52,-54}}, color={0,0,127}));
      connect(Sine3.y, S4.in_w0)
        annotation (Line(points={{-69,0},{-52,0},{-52,-14}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=4, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>FlowJoin</tt> models in all the possible flow configurations, both allowed and not allowed flow reversal.
<p>Simulate the model for 7 s and observe the temperatures measured by the different sensors as the flows change.
</HTML>", revisions="<html>
<ul>
<li><i>3 Dec 2008</i>
     by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
    end TestJoinRev;

    model TestSplitRev "Test case FlowSplit"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph;
      constant Real pi=Modelica.Constants.pi;
      ThermoPower.Water.SinkMassFlow
                              S5(h=2e5, use_in_w0=true)
                                        annotation (Placement(transformation(
              extent={{60,-44},{80,-24}}, rotation=0)));
      ThermoPower.Water.SinkMassFlow
                              S6(h=3e5, use_in_w0=true)
                                        annotation (Placement(transformation(
              extent={{60,-96},{80,-76}}, rotation=0)));
      ThermoPower.Water.FlowSplit FlowSplit2(
        rev_in1=false,
        rev_out1=false,
        rev_out2=false) annotation (Placement(transformation(extent={{-4,-70},{
                16,-50}}, rotation=0)));
      ThermoPower.Water.PressDropLin LossP2(R=1e-5) annotation (Placement(
            transformation(extent={{-60,-70},{-40,-50}}, rotation=0)));
      ThermoPower.Water.SourcePressure
                                S4(h=1e5) annotation (Placement(transformation(
              extent={{-90,-70},{-70,-50}}, rotation=0)));
      ThermoPower.Water.SensT T4(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{-30,-66},{-10,-46}}, rotation=0)));
      ThermoPower.Water.SensT T5(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{20,-40},{40,-20}}, rotation=0)));
      ThermoPower.Water.SensT T6(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{20,-92},{40,-72}}, rotation=0)));
      ThermoPower.Water.SensP P1 annotation (Placement(transformation(extent={{
                -50,-48},{-30,-28}}, rotation=0)));
      Modelica.Blocks.Sources.Trapezoid Sine3(
        nperiod=2,
        rising=0.5,
        width=0.5,
        falling=0.5,
        period=4,
        offset=1,
        startTime=0.5,
        amplitude=-1.2) annotation (Placement(transformation(extent={{0,-20},{
                20,0}}, rotation=0)));
      Modelica.Blocks.Sources.Trapezoid Sine4(
        nperiod=2,
        rising=0.5,
        width=0.5,
        falling=0.5,
        offset=1,
        startTime=2.5,
        period=2,
        amplitude=-1.2) annotation (Placement(transformation(extent={{40,-70},{
                60,-50}}, rotation=0)));
      ThermoPower.Water.SinkMassFlow
                              S1(h=2e5, use_in_w0=true)
                                        annotation (Placement(transformation(
              extent={{60,52},{80,72}}, rotation=0)));
      ThermoPower.Water.SinkMassFlow
                              S2(h=3e5, use_in_w0=true)
                                        annotation (Placement(transformation(
              extent={{60,0},{80,20}}, rotation=0)));
      ThermoPower.Water.FlowSplit FlowSplit1 annotation (Placement(
            transformation(extent={{-4,26},{16,46}}, rotation=0)));
      ThermoPower.Water.PressDropLin LossP1(R=1e-5) annotation (Placement(
            transformation(extent={{-60,26},{-40,46}}, rotation=0)));
      ThermoPower.Water.SourcePressure
                                S3(h=1e5) annotation (Placement(transformation(
              extent={{-90,26},{-70,46}}, rotation=0)));
      ThermoPower.Water.SensT T1(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{-30,30},{-10,50}}, rotation=0)));
      ThermoPower.Water.SensT T2(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{20,56},{40,76}}, rotation=0)));
      ThermoPower.Water.SensT T3(redeclare package Medium = Medium) annotation (
         Placement(transformation(extent={{20,4},{40,24}}, rotation=0)));
      ThermoPower.Water.SensP P2 annotation (Placement(transformation(extent={{
                -50,48},{-30,68}}, rotation=0)));
      Modelica.Blocks.Sources.Trapezoid Sine1(
        nperiod=2,
        rising=0.5,
        width=0.5,
        falling=0.5,
        period=4,
        offset=1,
        startTime=0.5,
        amplitude=-1.2) annotation (Placement(transformation(extent={{0,76},{20,
                96}}, rotation=0)));
      Modelica.Blocks.Sources.Trapezoid Sine2(
        nperiod=2,
        rising=0.5,
        width=0.5,
        falling=0.5,
        offset=1,
        startTime=2.5,
        period=2,
        amplitude=-1.2) annotation (Placement(transformation(extent={{40,26},{
                60,46}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(S4.flange, LossP2.inlet) annotation (Line(
          points={{-70,-60},{-60,-60}},
          thickness=0.5,
          color={0,0,255}));
      connect(LossP2.outlet, T4.inlet) annotation (Line(
          points={{-40,-60},{-26,-60}},
          thickness=0.5,
          color={0,0,255}));
      connect(T4.outlet, FlowSplit2.in1) annotation (Line(
          points={{-14,-60},{0,-60}},
          thickness=0.5,
          color={0,0,255}));
      connect(T5.outlet, S5.flange) annotation (Line(
          points={{36,-34},{60,-34}},
          thickness=0.5,
          color={0,0,255}));
      connect(T6.outlet, S6.flange) annotation (Line(
          points={{36,-86},{60,-86}},
          thickness=0.5,
          color={0,0,255}));
      connect(P1.flange, LossP2.outlet)
        annotation (Line(points={{-40,-42},{-40,-60}}));
      connect(T5.inlet, FlowSplit2.out1) annotation (Line(
          points={{24,-34},{24,-56},{12,-56}},
          thickness=0.5,
          color={0,0,255}));
      connect(T6.inlet, FlowSplit2.out2) annotation (Line(
          points={{24,-86},{24,-86},{12,-64}},
          thickness=0.5,
          color={0,0,255}));
      connect(Sine4.y, S6.in_w0) annotation (Line(points={{61,-60},{66,-60},{66,
              -80}}, color={0,0,127}));
      connect(Sine3.y, S5.in_w0) annotation (Line(points={{21,-10},{66,-10},{66,
              -28}}, color={0,0,127}));
      connect(S3.flange, LossP1.inlet) annotation (Line(
          points={{-70,36},{-60,36}},
          thickness=0.5,
          color={0,0,255}));
      connect(LossP1.outlet, T1.inlet) annotation (Line(
          points={{-40,36},{-26,36}},
          thickness=0.5,
          color={0,0,255}));
      connect(T1.outlet, FlowSplit1.in1) annotation (Line(
          points={{-14,36},{0,36}},
          thickness=0.5,
          color={0,0,255}));
      connect(T2.outlet, S1.flange) annotation (Line(
          points={{36,62},{60,62}},
          thickness=0.5,
          color={0,0,255}));
      connect(T3.outlet, S2.flange) annotation (Line(
          points={{36,10},{60,10}},
          thickness=0.5,
          color={0,0,255}));
      connect(P2.flange, LossP1.outlet)
        annotation (Line(points={{-40,54},{-40,36}}));
      connect(T2.inlet, FlowSplit1.out1) annotation (Line(
          points={{24,62},{24,40},{12,40}},
          thickness=0.5,
          color={0,0,255}));
      connect(T3.inlet, FlowSplit1.out2) annotation (Line(
          points={{24,10},{24,10},{12,32}},
          thickness=0.5,
          color={0,0,255}));
      connect(Sine2.y, S2.in_w0)
        annotation (Line(points={{61,36},{66,36},{66,16}}, color={0,0,127}));
      connect(Sine1.y, S1.in_w0)
        annotation (Line(points={{21,86},{66,86},{66,68}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=4, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>FlowSplit</tt> models in all the possible flow configurations, both allowed and not allowed flow reversal.
<p>Simulate the model for 7 s and observe the temperatures measured by the different sensors as the flows change.
</HTML>", revisions="<html>
<ul>
<li><i>3 Dec 2008</i>
     by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
    end TestSplitRev;

    model WaterPump "Test case for WaterPump"
      extends Modelica.Icons.Example;

      ThermoPower.Water.SourcePressure
                                Source(p0=1e5, h=1.5e5) annotation (Placement(
            transformation(extent={{-80,-20},{-60,0}}, rotation=0)));
      ThermoPower.Water.ValveLin Valve(Kv=1e-5) annotation (Placement(
            transformation(extent={{10,-20},{30,0}}, rotation=0)));
      ThermoPower.Water.SinkPressure Sink(use_in_p0=true, p0=300000) annotation (
          Placement(transformation(extent={{50,-20},{70,0}}, rotation=0)));
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
      Water.PumpNPSH Pump(
        rho0=1000,
        hstart=1e5,
        V=0.01,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CheckValve=true,
        Np0=2,
        usePowerCharacteristic=true,
        n0=1500,
        redeclare function flowCharacteristic =
            ThermoPower.Functions.PumpCharacteristics.quadraticFlow (q_nom={0,0.001,
                0.0015}, head_nom={60,30,0}),
        redeclare function powerCharacteristic =
            ThermoPower.Functions.PumpCharacteristics.quadraticPower (q_nom={0,0.001,
                0.0015}, W_nom={350,500,600}),
        wstart=0,
        w0=1,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        dp0=300000,
        use_in_n=true)
                    annotation (Placement(transformation(extent={{-40,-22},{-20,-2}},
              rotation=0)));

      Modelica.Blocks.Sources.Ramp Ramp(
        duration=4,
        startTime=4,
        height=6e5,
        offset=1e5) annotation (Placement(transformation(extent={{20,40},{40,60}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp Step(
        height=1,
        startTime=1,
        offset=1e-6,
        duration=1) annotation (Placement(transformation(extent={{-20,10},{0,30}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Modelica.Blocks.Sources.Ramp Ramp1(
        duration=4,
        height=1000,
        offset=1500,
        startTime=10)
                    annotation (Placement(transformation(extent={{-82,30},{-62,
                50}},
              rotation=0)));
    equation
      connect(Valve.outlet, Sink.flange) annotation (Line(
          points={{30,-10},{50,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(Source.flange, Pump.infl) annotation (Line(
          points={{-60,-10},{-38,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(Pump.outfl, Valve.inlet) annotation (Line(
          points={{-24,-5},{-8,-5},{-8,-10},{10,-10}},
          color={0,0,255},
          thickness=0.5));
      connect(Ramp.y, Sink.in_p0)
        annotation (Line(points={{41,50},{56,50},{56,-1.2}}, color={0,0,127}));
      connect(Step.y, Valve.cmd)
        annotation (Line(points={{1,20},{20,20},{20,-2}}, color={0,0,127}));
      connect(Ramp1.y, Pump.in_n) annotation (Line(
          points={{-61,40},{-32.6,40},{-32.6,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),
                graphics),
        experiment(StopTime=10, Tolerance=1e-006),
        Documentation(info="<HTML>
<p>This model tests the <tt>Pump</tt> model with the check valve option active. Two pumps in parallel are simulated.
<p>The valve is opened at time t=1s. The sink pressure is then increased so as to operate the pump in all the possible working conditions, including stopped flow.
<p>
Simulation Interval = [0...10] sec <br>
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-6
</HTML>", revisions="<html>
<ul>
<li><i>30 Jul 2007</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Updated.</li>
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
    end WaterPump;

    model WaterPumps "Test case for WaterPump"
      extends Modelica.Icons.Example;

      ThermoPower.Water.SourcePressure
                                Source1(p0=1e5, h=1.5e5) annotation (Placement(
            transformation(extent={{-80,40},{-60,60}}, rotation=0)));
      ThermoPower.Water.ValveLin ValveLin1(Kv=1e-5) annotation (Placement(
            transformation(extent={{10,40},{30,60}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP1(p0=300000, use_in_p0=true)
                                             annotation (Placement(
            transformation(extent={{50,40},{70,60}}, rotation=0)));
      Water.PumpNPSH Pump1(
        rho0=1000,
        V=0.01,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CheckValve=true,
        Np0=2,
        usePowerCharacteristic=true,
        n0=1500,
        redeclare function flowCharacteristic =
            ThermoPower.Functions.PumpCharacteristics.linearFlow (q_nom={0.001,
                0.0015}, head_nom={30,0}),
        wstart=0,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        w0=1,
        dp0=200000) annotation (Placement(transformation(extent={{-40,38},{-20,
                58}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp1(
        duration=4,
        startTime=4,
        height=6e5,
        offset=1e5) annotation (Placement(transformation(extent={{20,74},{40,94}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp Step1(
        height=1,
        startTime=1,
        offset=1e-6,
        duration=1) annotation (Placement(transformation(extent={{-20,60},{0,80}},
              rotation=0)));
      ThermoPower.Water.SourcePressure
                                Source2(p0=1e5,h=1.5e5) annotation (Placement(
            transformation(extent={{-80,-10},{-60,10}}, rotation=0)));
      ThermoPower.Water.ValveLin ValveLin2(Kv=1e-5) annotation (Placement(
            transformation(extent={{10,-10},{30,10}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP2(p0=300000, use_in_p0=true)
                                             annotation (Placement(
            transformation(extent={{50,-10},{70,10}}, rotation=0)));
      Water.PumpNPSH Pump2(
        rho0=1000,
        V=0.01,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CheckValve=true,
        Np0=2,
        usePowerCharacteristic=true,
        n0=1500,
        redeclare function flowCharacteristic =
            ThermoPower.Functions.PumpCharacteristics.quadraticFlow (q_nom={
                0.0005,0.001,0.0015}, head_nom={50,30,0}),
        wstart=0,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        w0=1,
        dp0=200000) annotation (Placement(transformation(extent={{-40,-12},{-20,
                8}}, rotation=0)));
      ThermoPower.Water.SourcePressure
                                Source3(p0=1e5,h=1.5e5) annotation (Placement(
            transformation(extent={{-80,-60},{-60,-40}}, rotation=0)));
      ThermoPower.Water.ValveLin ValveLin3(Kv=1e-5) annotation (Placement(
            transformation(extent={{10,-60},{30,-40}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP3(p0=300000, use_in_p0=true)
                                             annotation (Placement(
            transformation(extent={{50,-60},{70,-40}}, rotation=0)));
      Water.PumpNPSH Pump3(
        rho0=1000,
        V=0.01,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        CheckValve=true,
        Np0=2,
        usePowerCharacteristic=true,
        n0=1500,
        redeclare function flowCharacteristic =
            ThermoPower.Functions.PumpCharacteristics.polynomialFlow (q_nom={
                0.0005,0.001,0.0015}, head_nom={50,30,0}),
        wstart=0,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        w0=1,
        dp0=200000) annotation (Placement(transformation(extent={{-40,-62},{-20,
                -42}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(ValveLin1.outlet, SinkP1.flange) annotation (Line(
          points={{30,50},{50,50}},
          color={0,0,255},
          thickness=0.5));
      connect(Source1.flange, Pump1.infl) annotation (Line(
          points={{-60,50},{-38,50}},
          color={0,0,255},
          thickness=0.5));
      connect(Pump1.outfl, ValveLin1.inlet) annotation (Line(
          points={{-24,55},{-8,55},{-8,50},{10,50}},
          color={0,0,255},
          thickness=0.5));
      connect(Ramp1.y, SinkP1.in_p0)
        annotation (Line(points={{41,84},{56,84},{56,58.8}}, color={0,0,127}));
      connect(Step1.y, ValveLin1.cmd)
        annotation (Line(points={{1,70},{20,70},{20,58}}, color={0,0,127}));
      connect(ValveLin2.outlet, SinkP2.flange) annotation (Line(
          points={{30,0},{50,0}},
          color={0,0,255},
          thickness=0.5));
      connect(Source2.flange, Pump2.infl) annotation (Line(
          points={{-60,0},{-38,0}},
          color={0,0,255},
          thickness=0.5));
      connect(Pump2.outfl, ValveLin2.inlet) annotation (Line(
          points={{-24,5},{-8,5},{-8,0},{10,0}},
          color={0,0,255},
          thickness=0.5));
      connect(ValveLin3.outlet, SinkP3.flange) annotation (Line(
          points={{30,-50},{50,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(Source3.flange, Pump3.infl) annotation (Line(
          points={{-60,-50},{-38,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(Pump3.outfl, ValveLin3.inlet) annotation (Line(
          points={{-24,-45},{-8,-45},{-8,-50},{10,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(ValveLin2.cmd, Step1.y) annotation (Line(points={{20,8},{20,20},{
              6,20},{6,70},{1,70}}, color={0,0,127}));
      connect(SinkP2.in_p0, Ramp1.y) annotation (Line(points={{56,8.8},{56,20},
              {46,20},{46,84},{41,84}}, color={0,0,127}));
      connect(SinkP3.in_p0, Ramp1.y) annotation (Line(points={{56,-41.2},{56,-30},
              {46,-30},{46,84},{41,84}}, color={0,0,127}));
      connect(ValveLin3.cmd, Step1.y) annotation (Line(points={{20,-42},{20,-30},
              {6,-30},{6,70},{1,70}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=10, Tolerance=1e-006),
        Documentation(info="<html>
<p>This model tests three <code>Pump</code> models with different flow characteristics and with the check valve option active. Two pumps in parallel are simulated. </p>
<p>The valve is opened at time t=1s. The sink pressure is then increased so as to operate the pump in all the possible working conditions, including stopped flow. </p>
<p>Simulation Interval = [0...10] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<ul>
<li><i>3 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>"));
    end WaterPumps;

    model WaterPumpMech "Test case for WaterPumpMech"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      Water.PumpMech Pump(
        rho0=1000,
        n0=100,
        V=0.001,
        redeclare package Medium = Modelica.Media.Water.StandardWater,
        redeclare function flowCharacteristic =
            ThermoPower.Functions.PumpCharacteristics.quadraticFlow (q_nom={0,
                0.001,0.0015}, head_nom={60,30,0}),
        usePowerCharacteristic=true,
        redeclare function powerCharacteristic =
            ThermoPower.Functions.PumpCharacteristics.quadraticPower (q_nom={0,
                0.001,0.0015}, W_nom={350,500,600}),
        wstart=0,
        w0=1,
        dp0=200000)
                 annotation (Placement(transformation(extent={{-40,-2},
                {-20,18}}, rotation=0)));
      ThermoPower.Water.SourcePressure
                                Source annotation (Placement(transformation(
              extent={{-80,0},{-60,20}}, rotation=0)));
      ThermoPower.Water.ValveLin Valve(Kv=1e-5) annotation (Placement(
            transformation(extent={{20,0},{40,20}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp1(
        duration=5,
        height=1,
        offset=0,
        startTime=15) annotation (Placement(transformation(extent={{-20,40},{0,
                60}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(p0=0.8e5) annotation (Placement(
            transformation(extent={{60,0},{80,20}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp2(
        duration=5,
        height=380,
        startTime=2,
        offset=0.01) annotation (Placement(transformation(extent={{-80,-40},{-60,
                -20}}, rotation=0)));
      SimpleMotor SimpleMotor1(
        Rm=20,
        Lm=0.1,
        kT=35,
        Jm=10,
        dm=1,
        J(phi(fixed=true, start=0), w(fixed=true, start=2e-4)),
        L(i(fixed=true, start=0)))
              annotation (Placement(transformation(extent={{-40,-40},{-20,-20}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(Source.flange, Pump.infl) annotation (Line(
          points={{-60,10},{-38,10}},
          color={0,0,255},
          thickness=0.5));
      connect(Pump.outfl, Valve.inlet) annotation (Line(
          points={{-24,15},{5.9,15},{5.9,10},{20,10}},
          color={0,0,255},
          thickness=0.5));
      connect(Valve.outlet, Sink.flange) annotation (Line(
          points={{40,10},{60,10}},
          color={0,0,255},
          thickness=0.5));
      connect(SimpleMotor1.flange_b, Pump.MechPort) annotation (Line(
          points={{-19.2,-30},{-10,-30},{-10,10.1},{-20.9,10.1}},
          color={0,0,0},
          thickness=0.5));
      connect(Ramp1.y, Valve.cmd)
        annotation (Line(points={{1,50},{30,50},{30,18}}, color={0,0,127}));
      connect(Ramp2.y, SimpleMotor1.inPort)
        annotation (Line(points={{-59,-30},{-39.9,-30}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
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
",   revisions=
             "<html>
<ul>
<li><i>5 Nov 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       Updated.</li>
        <li><i>5 Feb 2004</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
        First release.</li>
</ul>
</html>"));
    end WaterPumpMech;

    model SimpleMotor
      "A simple model of an electrical dc motor (based on DriveLib model)."
      parameter Modelica.SIunits.Resistance Rm=10 "Motor Resistance";
      parameter Modelica.SIunits.Inductance Lm=1 "Motor Inductance";
      parameter Real kT=1 "Torque Constant";
      parameter Modelica.SIunits.Inertia Jm=10 "Motor Inertia";
      parameter Real dm(
        final unit="N.m.s/rad",
        final min=0) = 0 "Damping constant";
      Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm n;
      Modelica.Electrical.Analog.Sources.SignalVoltage Vs annotation (Placement(
            transformation(
            origin={-70,0},
            extent={{10,-10},{-10,10}},
            rotation=90)));
      Modelica.Electrical.Analog.Basic.Ground G annotation (Placement(
            transformation(extent={{-80,-60},{-60,-40}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Resistor R(R=Rm) annotation (Placement(
            transformation(extent={{-60,30},{-40,50}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Inductor L(L=Lm) annotation (Placement(
            transformation(extent={{-20,30},{0,50}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.EMF emf(k=kT) annotation (Placement(
            transformation(extent={{0,-10},{20,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealInput inPort annotation (Placement(
            transformation(extent={{-108,-10},{-90,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Components.Inertia J(J=Jm) annotation (
          Placement(transformation(extent={{48,-10},{68,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation (
          Placement(transformation(extent={{96,-12},{120,12}}, rotation=0)));
      Modelica.Mechanics.Rotational.Components.Fixed Fixed annotation (
          Placement(transformation(extent={{26,-52},{46,-32}}, rotation=0)));
      Modelica.Mechanics.Rotational.Components.Damper Damper(d=dm) annotation (
          Placement(transformation(
            origin={36,-22},
            extent={{-10,-10},{10,10}},
            rotation=90)));
    equation
      n = Modelica.SIunits.Conversions.to_rpm(J.w);
      connect(R.n, L.p) annotation (Line(points={{-40,40},{-20,40}}));
      connect(L.n, emf.p) annotation (Line(points={{0,40},{10,40},{10,10}}));
      connect(emf.flange, J.flange_a) annotation (Line(points={{20,0},{48,0}}));
      connect(R.p, Vs.p) annotation (Line(points={{-60,40},{-70,40},{-70,10}}));
      connect(Vs.n, emf.n)
        annotation (Line(points={{-70,-10},{-70,-20},{10,-20},{10,-10}}));
      connect(G.p, Vs.n) annotation (Line(points={{-70,-40},{-70,-10}}));
      connect(J.flange_b, flange_b) annotation (Line(points={{68,0},{108,0}}));
      connect(inPort, Vs.v)
        annotation (Line(points={{-99,0},{-77,4.28626e-016}}));
      connect(Fixed.flange, Damper.flange_a)
        annotation (Line(points={{36,-42},{36,-32}}, color={0,0,0}));
      connect(Damper.flange_b, J.flange_a)
        annotation (Line(points={{36,-12},{36,0},{48,0}}, color={0,0,0}));
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
                  extent={{60,6},{96,-6}},
                  lineColor={160,160,164},
                  fillColor={160,160,164},
                  fillPattern=FillPattern.Solid),Rectangle(
                  extent={{-60,40},{60,-40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={0,0,191}),Rectangle(
                  extent={{-80,-80},{80,-100}},
                  lineColor={0,0,255},
                  pattern=LinePattern.None,
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),Line(points={{-90,0},{-60,0}}),
              Text(extent={{-80,100},{80,60}}, textString="%name"),Polygon(
                  points={{-60,-80},{-40,-20},{40,-20},{60,-80},{60,-80},{-60,-80}},
                  lineColor={0,0,0},
                  pattern=LinePattern.None,
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={0,0,0})}),
        Documentation(info="<HTML>
<p>This is a basic model of an electrical DC motor used to drive a pump in <tt>WaterPumpMech</tt>.
</HTML>", revisions="<html>
<ul>
<li><i>5 Feb 2004</i>
    by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco
Schiavo</a>:<br>
       First release.</li>
</ul>
</html>"),
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics));
    end SimpleMotor;

    model TestAccumulator "Simple test for Water-Gas Accumulator component"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      Water.Accumulator Accumulator1(
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
        initOpt=ThermoPower.Choices.Init.Options.steadyState) annotation (
          Placement(transformation(extent={{-10,-82},{30,-42}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                SourceW1(w0=0, use_in_w0=true)
                                               annotation (Placement(
            transformation(extent={{-38,-90},{-18,-70}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SinkP1(p0=1e5) annotation (Placement(
            transformation(extent={{70,-90},{90,-70}}, rotation=0)));
      ThermoPower.Water.PressDropLin PressDropLin1(R=1e5) annotation (Placement(
            transformation(extent={{38,-90},{58,-70}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(height=2e-2, startTime=500)
        annotation (Placement(transformation(extent={{-90,0},{-70,20}},
              rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-40,-20},{-20,0}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step2(height=-2e-2, startTime=520)
        annotation (Placement(transformation(extent={{-90,-40},{-70,-20}},
              rotation=0)));
      Modelica.Blocks.Sources.Step Step3(height=1, startTime=2500) annotation (
          Placement(transformation(extent={{-90,70},{-70,90}}, rotation=0)));
      Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(extent=
               {{-40,50},{-20,70}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step5(height=-1, startTime=2520) annotation (
         Placement(transformation(extent={{-90,30},{-70,50}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step4(
        height=0.5,
        offset=5,
        startTime=5000) annotation (Placement(transformation(extent={{-60,-60},
                {-40,-40}},rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(Accumulator1.WaterOutfl, PressDropLin1.inlet) annotation (Line(
          points={{16.8,-80},{38,-80}},
          thickness=0.5,
          color={0,0,255}));
      connect(PressDropLin1.outlet, SinkP1.flange) annotation (Line(
          points={{58,-80},{70,-80}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceW1.flange, Accumulator1.WaterInfl) annotation (Line(
          points={{-18,-80},{3.2,-80}},
          thickness=0.5,
          color={0,0,255}));
    initial equation
      /*
  der(Accumulator1.rhog) = 0;
  der(Accumulator1.Tg) = 0;
  der(Accumulator1.hl) = 0;
  Accumulator1.zl = 0;
*/

    equation
      connect(Add1.y, Accumulator1.GasInfl) annotation (Line(points={{-19,-10},
              {-14,-10},{-14,-44},{-4.8,-44}}, color={0,0,127}));
      connect(Add2.y, Accumulator1.OutletValveOpening) annotation (Line(points=
              {{-19,60},{18.8,60},{18.8,-44}}, color={0,0,127}));
      connect(Step4.y, SourceW1.in_w0) annotation (Line(points={{-39,-50},{-32,
              -50},{-32,-74}}, color={0,0,127}));
      connect(Step5.y, Add2.u2)
        annotation (Line(points={{-69,40},{-42,54}}, color={0,0,127}));
      connect(Step3.y, Add2.u1)
        annotation (Line(points={{-69,80},{-42,66}}, color={0,0,127}));
      connect(Step1.y, Add1.u1)
        annotation (Line(points={{-69,10},{-42,-4}}, color={0,0,127}));
      connect(Step2.y, Add1.u2)
        annotation (Line(points={{-69,-30},{-42,-16}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
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
</html>", revisions="<html>
<ul>
        <li><i>5 Feb 2004</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
        First release.</li>
</ul>
</html>"));
    end TestAccumulator;

    model TestST1
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.StandardWater;
      parameter Medium.MassFlowRate w=1;
      parameter Medium.AbsolutePressure pin=60e5;
      parameter Medium.AbsolutePressure pcond=0.08e5;
      parameter SI.PerUnit eta_iso=0.92;
      parameter SI.PerUnit eta_mech=0.98;
      parameter SI.AngularVelocity omega=314;
      parameter SI.SpecificEnthalpy hin=2.949e6;
      parameter SI.SpecificEnthalpy hout_iso=2.240e6;
      parameter SI.SpecificEnthalpy hout=hin - eta_iso*(hin - hout_iso);
      parameter SI.Power Pnet=eta_iso*eta_mech*w*(hin - hout_iso);
      parameter SI.Torque tau=0.8*Pnet/omega;
      parameter SI.Time Ta=10 "Turbine acceleration time";
      parameter SI.MomentOfInertia J=Pnet*Ta/omega^2;
      parameter Units.HydraulicResistance Kv=1/2e5;
      parameter SI.PerUnit theta0(fixed=false, start = 1);

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
        redeclare package Medium = Medium) annotation (Placement(transformation(
              extent={{-20,-20},{20,20}}, rotation=0)));
      Water.SourcePressure
                    SourceP1(p0=pin, h=hin) annotation (Placement(
            transformation(extent={{-100,4},{-80,24}}, rotation=0)));
      Modelica.Mechanics.Rotational.Components.Inertia Inertia1(J=J,
        phi(start=0, fixed=true),
        w(fixed=true, start=omega),
        a(start=0, fixed=true))
        annotation (Placement(transformation(extent={{30,-10},{50,10}},
              rotation=0)));
      Water.SinkPressure
                  SinkP1(p0=pcond) annotation (Placement(transformation(extent=
                {{60,-40},{80,-20}}, rotation=0)));
      Water.ValveLin ValveLin1(Kv=1/Kv) annotation (Placement(transformation(
              extent={{-70,4},{-50,24}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        height=-0.01,
        offset=theta0,
        startTime=1) annotation (Placement(transformation(extent={{-90,40},{-70,
                60}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sources.Torque Load(useSupport=false)
        annotation (Placement(transformation(extent={{80,-10},{60,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Constant TorqueLoad(k=-tau) annotation (Placement(
            transformation(extent={{60,20},{80,40}}, rotation=0)));
      Water.SensT SensT1(redeclare package Medium = Medium) annotation (
          Placement(transformation(extent={{-46,8},{-26,28}}, rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(ST.shaft_b, Inertia1.flange_a) annotation (Line(
          points={{19.8,3.55271e-016},{18,3.55271e-016},{18,0},{30,0}},
          color={0,0,0},
          thickness=0.5));
      connect(ST.outlet, SinkP1.flange) annotation (Line(
          points={{20,-14},{20,-30},{60,-30}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceP1.flange, ValveLin1.inlet) annotation (Line(
          points={{-80,14},{-70,14}},
          thickness=0.5,
          color={0,0,255}));
      connect(Inertia1.flange_b, Load.flange) annotation (Line(
          points={{50,0},{60,0}},
          color={0,0,0},
          thickness=0.5));
      connect(ValveLin1.outlet, SensT1.inlet) annotation (Line(
          points={{-50,14},{-42,14}},
          thickness=0.5,
          color={0,0,255}));
      connect(SensT1.outlet, ST.inlet) annotation (Line(
          points={{-30,14},{-20,14}},
          thickness=0.5,
          color={0,0,255}));
      connect(Step1.y, ValveLin1.cmd) annotation (Line(points={{-69,50},{-60,50},
              {-60,22}}, color={0,0,127}));
      connect(TorqueLoad.y, Load.tau) annotation (Line(points={{81,30},{94,30},
              {94,0},{82,0}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(
          StopTime=5,
          __Dymola_fixedstepsize=1e-005,
          __Dymola_Algorithm=""),
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
</html>", revisions="<html>
<ul>
        <li><i>21 Jul 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
        First release.</li>
</ul>
</html>
"));
    end TestST1;

    model TestST2
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.StandardWater;
      parameter Medium.MassFlowRate w=1;
      parameter Medium.AbsolutePressure pin=60e5;
      parameter Medium.AbsolutePressure pcond=0.08e5;
      parameter SI.PerUnit eta_iso=0.92;
      parameter SI.PerUnit eta_mech=0.98;
      parameter SI.AngularVelocity omega=314;
      parameter Medium.SpecificEnthalpy hin=2.949e6;
      parameter Medium.SpecificEnthalpy hout_iso=2.240e6;
      parameter Medium.SpecificEnthalpy hout=hin - eta_iso*(hin - hout_iso);
      parameter SI.Power Pnet=eta_iso*eta_mech*w*(hin - hout_iso);
      parameter SI.Torque tau=0.8*Pnet/omega;
      parameter SI.Time Ta=10 "Turbine acceleration time";
      parameter SI.MomentOfInertia J=Pnet*Ta/omega^2;
      parameter Units.HydraulicResistance Kv=1/2e5;
      parameter SI.PerUnit theta0=0.3;

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
        redeclare package Medium = Medium) annotation (Placement(transformation(
              extent={{-20,-20},{20,20}}, rotation=0)));
      Water.SourcePressure
                    SourceP1(p0=pin, h=hin) annotation (Placement(
            transformation(extent={{-96,4},{-76,24}}, rotation=0)));
      Modelica.Mechanics.Rotational.Components.Inertia Inertia1(J=J,
        phi(start=0, fixed=true),
        w(start=omega, fixed=true),
        a(start=0, fixed=true))
        annotation (Placement(transformation(extent={{30,-10},{50,10}},
              rotation=0)));
      Water.SinkPressure
                  SinkP1(p0=pcond) annotation (Placement(transformation(extent=
                {{60,-60},{80,-40}}, rotation=0)));
      Water.ValveLin ValveLin1(Kv=1/Kv) annotation (Placement(transformation(
              extent={{-60,4},{-40,24}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        height=-0.1,
        offset=theta0,
        startTime=1) annotation (Placement(transformation(extent={{-80,40},{-60,
                60}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sources.Speed Speed1(
        exact=true,
        useSupport=false,
        phi(fixed=false)) annotation (Placement(transformation(extent={{80,-10},
                {60,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=omega) annotation (Placement(
            transformation(extent={{60,20},{80,40}}, rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(ST.shaft_b, Inertia1.flange_a) annotation (Line(
          points={{19.8,3.55271e-016},{18,3.55271e-016},{18,0},{30,0}},
          color={0,0,0},
          thickness=0.5));
      connect(ST.outlet, SinkP1.flange) annotation (Line(
          points={{20,-14},{20,-50},{60,-50}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveLin1.outlet, ST.inlet) annotation (Line(
          points={{-40,14},{-20,14}},
          thickness=0.5,
          color={0,0,255}));
      connect(SourceP1.flange, ValveLin1.inlet) annotation (Line(
          points={{-76,14},{-60,14}},
          thickness=0.5,
          color={0,0,255}));
      connect(Speed1.flange, Inertia1.flange_b) annotation (Line(
          points={{60,0},{50,0}},
          color={0,0,0},
          thickness=0.5));
      connect(Step1.y, ValveLin1.cmd) annotation (Line(points={{-59,50},{-50,50},
              {-50,22}}, color={0,0,127}));
      connect(Constant1.y, Speed1.w_ref) annotation (Line(points={{81,30},{90,
              30},{90,0},{82,0}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(
          StopTime=10,
          __Dymola_fixedstepsize=1e-005,
          __Dymola_Algorithm=""),
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
</html>", revisions="<html>
<ul>
        <li><i>21 Jul 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
        First release.</li>
</ul>
</html>
"));
    end TestST2;

    model TestTurbine "Test turbine with prescribed pressure conditions"
      extends Modelica.Icons.Example;

      Water.SourcePressure
                    source(             h=3.3e6,
        p0=15000000,
        use_in_p0=true)
        annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
      Water.SinkPressure
                  sink(         h=2e6,
        p0=8000,
        use_in_p0=true)
        annotation (Placement(transformation(extent={{20,20},{40,40}})));
      Water.SteamTurbineStodola steamTurbineStodola(
        wnom=70,
        PRstart=1500,
        pnom=15000000,
        Kt=0.0025)
        annotation (Placement(transformation(extent={{-22,-2},{-2,18}})));
      Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed=
           3000/60*3.14159)
        annotation (Placement(transformation(extent={{24,-2},{4,18}})));
      inner System system
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=-70e5,
        duration=1,
        offset=150e5,
        startTime=1)
        annotation (Placement(transformation(extent={{-96,58},{-76,78}})));
      Modelica.Blocks.Sources.Ramp ramp1(
        duration=1,
        height=+79e5,
        offset=1e5,
        startTime=3)
        annotation (Placement(transformation(extent={{-6,54},{14,74}})));
    equation
      connect(steamTurbineStodola.shaft_b, constantSpeed.flange) annotation (
          Line(
          points={{-5.6,8},{-5.6,7},{4,7},{4,8}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(source.flange, steamTurbineStodola.inlet) annotation (Line(
          points={{-40,30},{-20,30},{-20,16}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(steamTurbineStodola.outlet, sink.flange) annotation (Line(
          points={{-4,16},{-4,30},{20,30}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ramp.y, source.in_p0) annotation (Line(
          points={{-75,68},{-54,68},{-54,39.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp1.y, sink.in_p0) annotation (Line(
          points={{15,64},{26,64},{26,38.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(graphics));
    end TestTurbine;

    model TestSprayCondenser
      extends Modelica.Icons.Example;
      Water.SprayCondenser condenser(
        y0=2,
        ystart=0,
        Vt=0.1,
        V0=0.05,
        A=0.025,
        pstart=50000)
        annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
      Water.SourceMassFlow steamFlow(h=3000e3, w0=0.1)
        annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
      Water.SourceMassFlow coolingFlow(
        w0=1,
        h=100e3,
        use_in_w0=true)
        annotation (Placement(transformation(extent={{-60,-2},{-40,18}})));
      Water.SinkPressure sinkPressure
        annotation (Placement(transformation(extent={{30,-90},{50,-70}})));
      Water.Flow1DFV pip(
        L=5,
        H=-5,
        A=3e-4,
        omega=0.1,
        wnom=1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        Cfnom=0.005,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        hstartin=300e3,
        hstartout=300e3,
        noInitialPressure=true,
        dpnom=1000,
        pstart=100000) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={0,-46})));
      inner System system(allowFlowReversal=false, initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
      Modelica.Blocks.Sources.Step step(
        height=0.1,
        offset=1,
        startTime=10)
        annotation (Placement(transformation(extent={{-88,14},{-68,34}})));
      Water.SensT1 steamTemperature
        annotation (Placement(transformation(extent={{-10,52},{10,72}})));
      Water.SensT1 coolingWaterTemperature
        annotation (Placement(transformation(extent={{-40,14},{-20,34}})));
      Water.SensT1 condensateTemperature
        annotation (Placement(transformation(extent={{16,-26},{36,-6}})));
    equation
      connect(steamFlow.flange, condenser.condensingSteam) annotation (Line(
            points={{-40,40},{-22,40},{0,40},{0,20}}, color={0,0,255}));
      connect(coolingFlow.flange, condenser.coolingWater)
        annotation (Line(points={{-40,8},{-16,8}}, color={0,0,255}));
      connect(condenser.liquidOutlet, pip.infl) annotation (Line(points={{0,-20},
              {0,-36},{1.77636e-015,-36}}, color={0,0,255}));
      connect(pip.outfl, sinkPressure.flange) annotation (Line(points={{
              -1.77636e-015,-56},{0,-56},{0,-70},{0,-80},{30,-80}}, color={0,0,
              255}));
      connect(step.y, coolingFlow.in_w0) annotation (Line(points={{-67,24},{-54,
              24},{-54,14}}, color={0,0,127}));
      connect(condenser.condensingSteam, steamTemperature.flange)
        annotation (Line(points={{0,20},{0,20},{0,58}}, color={0,0,255}));
      connect(condenser.coolingWater, coolingWaterTemperature.flange)
        annotation (Line(points={{-16,8},{-30,8},{-30,20}}, color={0,0,255}));
      connect(condenser.liquidOutlet, condensateTemperature.flange)
        annotation (Line(points={{0,-20},{14,-20},{26,-20}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<p>This test model represents a barometric condenser, where a spray condenser is kept under sub-atmospheric pressure by a vertical pipe discharging to the atmosphere.</p>
<p>The model is started in steady-state, with 0.1 kg/s of steam at 262 degC is condensed by 1 kg/s of cooling water at 23.8 degC, resulting in a condensate flow at 86.8 degC. The level is -0.57 m below the zero reference.</p>
<p>At time = 10, the cooling flow is increased by 10&percnt;. As a consequence, the condenser transitions to a lower temperature, corresponding to a level of 1.05 m above the reference, due to the lowered condensation pressure.</p>
</html>"));
    end TestSprayCondenser;

    model TestBarometricCondenser
      extends Modelica.Icons.Example;
      Water.SourceMassFlow steamFlow(h=3000e3,
        w0=0.1,
        use_in_w0=true)
        annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
      Water.SourceMassFlow coolingFlow(
        w0=1,
        h=100e3,
        use_in_w0=true,
        use_T=true,
        use_in_T=false,
        T=293.15)
        annotation (Placement(transformation(extent={{-60,-2},{-40,18}})));
      inner System system(allowFlowReversal=false, initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
      Water.SensT1 steamTemperature
        annotation (Placement(transformation(extent={{-10,52},{10,72}})));
      Water.SensT1 coolingWaterTemperature
        annotation (Placement(transformation(extent={{-40,14},{-20,34}})));
      Water.SensT1 condensateTemperature
        annotation (Placement(transformation(extent={{12,-4},{32,16}})));
      Water.BarometricCondenser barometricCondenser(
        wnom=1,
        Tt=5,
        Tlstart=313.15)
        annotation (Placement(transformation(extent={{-12,-18},{12,14}})));
      Water.Tank tank(
        A=0.1,
        ystart=1,
        initOpt=ThermoPower.Choices.Init.Options.fixedState,
        hstart=168861)
        annotation (Placement(transformation(extent={{32,-24},{52,-4}})));
      Water.SinkMassFlow sinkMassFlow(w0=1.03)
        annotation (Placement(transformation(extent={{68,-30},{88,-10}})));
      Modelica.Blocks.Sources.TimeTable steamFlowRate(table=[0,0.07; 10,0.07;
            10,0.035; 40,0.035; 40,0; 100,0])
        annotation (Placement(transformation(extent={{-88,54},{-68,74}})));
      Modelica.Blocks.Sources.TimeTable coolingFlowRate(table=[0,1; 20,1; 20,
            0.5; 40,0.5; 40,0; 100,0])
        annotation (Placement(transformation(extent={{-88,14},{-68,34}})));
    equation
      connect(coolingFlow.flange, barometricCondenser.coolingWater)
        annotation (Line(points={{-40,8},{-26,8},{-12,8}}, color={0,0,255}));
      connect(coolingWaterTemperature.flange, barometricCondenser.coolingWater)
        annotation (Line(points={{-30,20},{-22,20},{-22,8},{-12,8}}, color={0,0,
              255}));
      connect(steamFlow.flange, barometricCondenser.condensingSteam)
        annotation (Line(points={{-40,40},{-20,40},{0,40},{0,13.8}}, color={0,0,
              255}));
      connect(steamTemperature.flange, barometricCondenser.condensingSteam)
        annotation (Line(points={{0,58},{0,13.8}}, color={0,0,255}));
      connect(barometricCondenser.liquidOutlet, tank.inlet) annotation (Line(
            points={{0,-17.2},{0,-20},{34,-20}}, color={0,0,255}));
      connect(tank.outlet, sinkMassFlow.flange) annotation (Line(points={{50,
              -20},{50,-20},{68,-20}}, color={0,0,255}));
      connect(condensateTemperature.flange, tank.inlet)
        annotation (Line(points={{22,2},{22,-20},{34,-20}}, color={0,0,255}));
      connect(coolingFlowRate.y, coolingFlow.in_w0) annotation (Line(points={{
              -67,24},{-54,24},{-54,13.6}}, color={0,0,127}));
      connect(steamFlowRate.y, steamFlow.in_w0) annotation (Line(points={{-67,
              64},{-62,64},{-54,64},{-54,45.6}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        Documentation(info="<html>
<p>This model tests the barometric condenser.</p>
<p>The model is started in steady-state, with 0.07 kg/s of steam at 262 degC is condensed by 1 kg/s of cooling
water at 20 degC, resulting in a condensate flow at 65.6 degC.</p>
<p>At time = 10, the steam flow is cut by 50 percent, so the outlet temperature drops by 22 degC.
At time = 20, the cooling water flow is also cut by 50 percent, so the initial temperature is restored
and the tank level starts dropping significantly. At time = 40, when both flows are cut to zero, the model remains well-posed; this
feature can be useful if one wants to simulate circuits where some condensers may be brough off-duty during the simulation.</p>
</html>"),
        experiment(StopTime=50));
    end TestBarometricCondenser;

    model TestCoolingTowerPacking
      "Test of the dynamic cooling tower model with packing"
      extends Modelica.Icons.Example;
      package Water = Modelica.Media.Water.StandardWater;
      ThermoPower.Water.CoolingTower coolingTower(
        Nt=5,
        M0=0.7*4300,
        Mnom=4300,
        wlnom=504/3600*995,
        qanom=99,
        Mp=2000,
        cp=680,
        rpm_nom=230,
        Wnom(displayUnit="kW") = 42000,
        N=10,
        gamma_wp_nom=10,
        S=8700,
        k_wa_nom=1.08e-2,
        nu_a=1,
        nu_l=0,
        rhoanom=1.2)
        annotation (Placement(transformation(extent={{-20,0},{20,40}})));
      ThermoPower.Water.SourceMassFlow sourceW(
        h = Water.specificEnthalpy_pT(1e5, 32.5 + 273.15),
        w0=2520/3600*995)
        annotation (Placement(transformation(extent={{-52,50},{-32,70}})));
      ThermoPower.Water.SinkPressure
                              sinkP
        annotation (Placement(transformation(extent={{12,-38},{32,-18}})));
      Modelica.Blocks.Sources.Ramp fanRpm(
        duration=1,
        offset=230,
        height=-20)
        annotation (Placement(transformation(extent={{-82,26},{-62,46}})));
      inner ThermoPower.System system(initOpt=ThermoPower.Choices.Init.Options.steadyState,
          T_wb=287.15)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
    equation
      connect(sourceW.flange, coolingTower.waterInlet) annotation (Line(
          points={{-32,60},{0,60},{0,38}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(coolingTower.waterOutlet, sinkP.flange) annotation (Line(
          points={{0,2},{0,-28},{12,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(fanRpm.y, coolingTower.fanRpm) annotation (Line(
          points={{-61,36},{-38,36},{-38,28},{-16,28}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        experiment(
          StartTime=-50,
          StopTime=200,
          Tolerance=1e-006),
        experimentSetupOutput(equdistant=false),
        Documentation(info="<html>
<p>Test of the cooling tower model. Inlet water at 32.5 degC is cooled down to 21.5 degC using air with wet bulb temperature at 14 degC.</p>
<p>At time = 0 the fan speed is reduced from 230 rpm to 210 rpm, causing a slight reduction of the cooling capacity of the tower.</p>
</html>"));
    end TestCoolingTowerPacking;

    model TestCoolingTowerStatic "Test of the static cooling tower model"
      extends Modelica.Icons.Example;
      package Water = Modelica.Media.Water.StandardWater;
      ThermoPower.Water.CoolingTower coolingTower(
        Nt=5,
        wlnom=504/3600*995,
        qanom=99,
        rpm_nom=230,
        Wnom(displayUnit="kW") = 42000,
        N=10,
        S=8700,
        k_wa_nom=1.08e-2,
        nu_a=1,
        nu_l=0,
        staticModel=true,
        rhoanom=1.2)
        annotation (Placement(transformation(extent={{-20,0},{20,40}})));
      ThermoPower.Water.SourceMassFlow sourceW(
        h = Water.specificEnthalpy_pT(1e5, 32.5 + 273.15),
        w0=2520/3600*995)
        annotation (Placement(transformation(extent={{-52,50},{-32,70}})));
      ThermoPower.Water.SinkPressure
                              sinkP
        annotation (Placement(transformation(extent={{12,-38},{32,-18}})));
      Modelica.Blocks.Sources.Ramp fanRpm(
        duration=1,
        offset=230,
        height=-20)
        annotation (Placement(transformation(extent={{-82,26},{-62,46}})));
      inner ThermoPower.System system(initOpt=ThermoPower.Choices.Init.Options.steadyState,
          T_wb=287.15)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
    equation
      connect(sourceW.flange, coolingTower.waterInlet) annotation (Line(
          points={{-32,60},{0,60},{0,38}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(coolingTower.waterOutlet, sinkP.flange) annotation (Line(
          points={{0,2},{0,-28},{12,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(fanRpm.y, coolingTower.fanRpm) annotation (Line(
          points={{-61,36},{-38,36},{-38,28},{-16,28}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(graphics),
        experiment(
          StartTime=-50,
          StopTime=200,
          Tolerance=1e-006),
        experimentSetupOutput(equdistant=false),
        Documentation(info="<html>
<p>Test of the cooling tower model. Inlet water at 32.5 degC is cooled down to 21.5 degC using air with wet bulb temperature at 14 degC.</p>
<p>At time = 0 the fan speed is reduced from 230 rpm to 210 rpm, causing a slight reduction of the cooling capacity of the tower.</p>
</html>"));
    end TestCoolingTowerStatic;

    model TestCoolingTowerClosed
      "Test of the a closed cooling tower model"
      import ThermoPower;
      extends Modelica.Icons.Example;
      package Water = Modelica.Media.Water.StandardWater;
      ThermoPower.Water.CoolingTower coolingTower(
        nu_a=1,
        nu_l=0,
        Nt=1,
        staticModel=true,
        wlnom=30/3600*995,
        Wnom(displayUnit="kW") = 4100,
        rpm_nom=230,
        N=6,
        closedCircuit=true,
        rhoanom(displayUnit="kg/m3") = 1.2,
        gamma_wp_nom=200,
        S=400,
        k_wa_nom=0.024,
        qanom=7.3)
        annotation (Placement(transformation(extent={{-20,-2},{20,38}})));
      ThermoPower.Water.SourceMassFlow sourceClosedCircuit(
        use_T=true,
        w0=30/3600*995,
        p0=400000,
        T=308.15)
        annotation (Placement(transformation(extent={{-86,18},{-66,38}})));
      ThermoPower.Water.SinkPressure towerDischarge
        annotation (Placement(transformation(extent={{12,-38},{32,-18}})));
      Modelica.Blocks.Sources.Ramp fanRpm(
        duration=1,
        offset=230,
        height=-20)
        annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
      inner ThermoPower.System system(initOpt=ThermoPower.Choices.Init.Options.steadyState,
        T_amb=303.15,
        T_wb=298.15)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
      ThermoPower.Water.Flow1DFV cooledFlow(
        L=1,
        omega=100,
        wnom=8.33,
        H=10,
        N=6,
        redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.FlowDependentThermalConductance
            (alpha=1, UAnom=80000),
        A=0.06)                     annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-52,12})));
      ThermoPower.Water.SinkPressure closedCircuitDischarge(p0=300000)
        annotation (Placement(transformation(extent={{-36,-36},{-16,-16}})));
      ThermoPower.Water.SourceMassFlow sourceCoolingWater(
        use_T=true,
        w0=0.4,
        T=301.15)
        annotation (Placement(transformation(extent={{-28,56},{-8,76}})));
      ThermoPower.Thermal.MetalWallFV tubeWalls(
        Nw=5,
        M=20,
        cm=500) annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-32,12})));
    equation
      connect(coolingTower.waterOutlet, towerDischarge.flange) annotation (Line(
          points={{0,0},{0,-28},{12,-28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(fanRpm.y, coolingTower.fanRpm) annotation (Line(
          points={{-39,50},{-24,50},{-24,26},{-16,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(sourceClosedCircuit.flange, cooledFlow.infl) annotation (Line(
            points={{-66,28},{-52,28},{-52,22}}, color={0,0,255}));
      connect(cooledFlow.outfl, closedCircuitDischarge.flange) annotation (Line(
            points={{-52,2},{-52,-26},{-36,-26}}, color={0,0,255}));
      connect(sourceCoolingWater.flange, coolingTower.waterInlet)
        annotation (Line(points={{-8,66},{0,66},{0,36}}, color={0,0,255}));
      connect(cooledFlow.wall, tubeWalls.int)
        annotation (Line(points={{-47,12},{-35,12}}, color={255,127,0}));
      connect(tubeWalls.ext, coolingTower.tubeWalls)
        annotation (Line(points={{-28.9,12},{-16,12}}, color={255,127,0}));
      annotation (
        experiment(
          StartTime=-50,
          StopTime=200,
          Tolerance=1e-006),
        experimentSetupOutput(equdistant=false),
        Documentation(info="<html>
<p>Test of the closed cooling tower model. A flow of 8.3 kg/s of water in the closed circuit
at 35 degC is cooled down to 30 degC using using air with wet bulb temperature at 25 degC.</p>
<p>At time = 0 the fan speed is reduced from 230 rpm to 210 rpm, causing a slight reduction of the cooling capacity of the tower.</p>
</html>"));
    end TestCoolingTowerClosed;

    model TestExpansionTankIdeal "Test case for ExpansionTankIdeal"
      extends Modelica.Icons.Example;

      Water.ExpansionTankIdeal expTankIdeal(pf=700000)
        annotation (Placement(transformation(extent={{-10,-4},{10,16}})));
      Water.ThroughMassFlow idealPump(w0=10)
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      Water.Flow1DFV boiler(
        A=3.1416*0.04^2,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.OpPoint,
        L=10,
        hstartin=134.11e3,
        hstartout=134.11e3,
        omega=3.1416*0.04*2,
        wnom=10,
        N=2,
        dpnom=200000,
        rhonom=999,
        pstart=700000)
        annotation (Placement(transformation(extent={{22,-10},{42,10}})));
      inner System system(
          allowFlowReversal=false, initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
      Thermal.TempSource1DFV temperatureSource
        annotation (Placement(transformation(extent={{-26,-48},{-6,-68}})));
      Modelica.Blocks.Sources.RealExpression externalTemperature(y=system.T_amb)
        annotation (Placement(transformation(extent={{-78,-90},{-46,-70}})));
      Water.Flow1DFV heater(
        A=3.1416*0.04^2,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.OpPoint,
        L=10,
        hstartin=134.11e3,
        hstartout=134.11e3,
        omega=3.1416*0.04*2,
        wnom=10,
        N=2,
        dpnom=200000,
        rhonom=999,
        pstart=700000,
        redeclare model HeatTransfer =
            Thermal.HeatTransferFV.ConstantThermalConductance (UA=50000))
        annotation (Placement(transformation(extent={{-6,-30},{-26,-50}})));
      Thermal.HeatSource1DFV heatFlowSource
        annotation (Placement(transformation(extent={{22,12},{42,32}})));
      Modelica.Blocks.Sources.Step step(height=1e6, startTime=10)
        annotation (Placement(transformation(extent={{-6,30},{14,50}})));
    equation
      connect(expTankIdeal.WaterOutfl, boiler.infl)
        annotation (Line(points={{4,0},{13,0},{22,0}}, color={0,0,255}));
      connect(idealPump.outlet, expTankIdeal.WaterInfl)
        annotation (Line(points={{-20,0},{-12,0},{-4,0}}, color={0,0,255}));
      connect(externalTemperature.y, temperatureSource.temperature) annotation (
         Line(points={{-44.4,-80},{-16,-80},{-16,-62}}, color={0,0,127}));
      connect(heater.wall, temperatureSource.wall)
        annotation (Line(points={{-16,-45},{-16,-55}}, color={255,127,0}));
      connect(heatFlowSource.wall, boiler.wall)
        annotation (Line(points={{32,19},{32,5}}, color={255,127,0}));
      connect(step.y, heatFlowSource.power)
        annotation (Line(points={{15,40},{32,40},{32,26}}, color={0,0,127}));
      connect(boiler.outfl, heater.infl) annotation (Line(points={{42,0},{60,0},
              {60,-40},{-6,-40}}, color={0,0,255}));
      connect(heater.outfl, idealPump.inlet) annotation (Line(points={{-26,-40},
              {-60,-40},{-60,0},{-40,0}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(StopTime=500),
        Documentation(info="<html>
<p>This model demonstrates the use of an ideal expansion tank in a closed circuit. The ideal expansion tank keeps
its flange pressure fixed, allowing some flow rate to enter or leave the circuit to balance the fluid thermal expansion</p>
<p>The model represents an idealized heating system. It starts in steady state at ambient temperature, then at time = 10
the heating power is turned on; as a consequence, the fluid gradually heats up to its final steady state value, and during
this transient there is a net flow rate entering the expansion tank.
</html>"));
    end TestExpansionTankIdeal;
  end WaterComponents;

  package GasComponents "Tests for lumped-parameters Gas package components"
    extends Modelica.Icons.ExamplesPackage;

    model TestGasPlenum
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;
      Gas.ValveLin ValveLin1(redeclare package Medium = Medium, Kv=2.5e-5)
        annotation (Placement(transformation(extent={{-42,-10},{-22,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp1(
        offset=1,
        height=-0.3,
        duration=0.01,
        startTime=0.6) annotation (Placement(transformation(extent={{-60,20},{-40,
                40}}, rotation=0)));
      Gas.SourcePressure
                  SourceP1(
        redeclare package Medium = Medium,
        use_in_p0=true,
        p0=500000,
        T=450) annotation (Placement(transformation(extent={{-78,-10},{-58,10}},
              rotation=0)));
      Gas.Plenum Plenum1(
        redeclare package Medium = Medium,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        V=0.1,
        pstart=400000,
        Tstart=400) annotation (Placement(transformation(extent={{0,-10},{20,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp2(
        startTime=0.3,
        height=3e5,
        offset=5e5,
        duration=0.01) annotation (Placement(transformation(extent={{-100,20},{
                -80,40}}, rotation=0)));
      Gas.SinkPressure
                SinkP1(
        redeclare package Medium = Medium,
        p0=2e5,
        T=300) annotation (Placement(transformation(extent={{80,-10},{100,10}},
              rotation=0)));
      Gas.PressDrop PressDrop1(
        redeclare package Medium = Medium,
        pstart=4e5,
        dpnom=2e5,
        Tstart=400,
        rhonom=3,
        A=1,
        wnom=1.5,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) annotation (
          Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(Ramp1.y, ValveLin1.cmd)
        annotation (Line(points={{-39,30},{-32,30},{-32,7}}, color={0,0,127}));
      connect(ValveLin1.outlet, Plenum1.inlet) annotation (Line(
          points={{-22,0},{0,0}},
          color={159,159,223},
          thickness=0.5));
      connect(Ramp2.y, SourceP1.in_p0) annotation (Line(points={{-79,30},{-74,30},
              {-74,6.4}}, color={0,0,127}));
      connect(SourceP1.flange, ValveLin1.inlet) annotation (Line(
          points={{-58,0},{-42,0}},
          color={159,159,223},
          thickness=0.5));
      connect(Plenum1.outlet, PressDrop1.inlet) annotation (Line(
          points={{20,0},{40,0}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop1.outlet, SinkP1.flange) annotation (Line(
          points={{60,0},{80,0}},
          color={159,159,223},
          thickness=0.5));
      annotation (
        Diagram(graphics),
        Documentation(info="<html>
This model tests the <tt>Plenum</tt> model.
<p>Simulate for 1 s. The model starts at steady state. At t = 0.3 the inlet pressure is increased. At t = 0.6 the valve is partially closed.
</html>"),
        experiment(Tolerance=1e-006));
    end TestGasPlenum;

    model TestGasHeader
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.IdealGases.MixtureGases.AirSteam;
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
        V=1) annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=0)));
      Gas.ValveLin ValveLin1(redeclare package Medium = Medium, Kv=0.3e-3)
        annotation (Placement(transformation(extent={{30,-10},{50,10}},
              rotation=0)));
      Gas.SinkPressure
                SinkP2(
        redeclare package Medium = Medium,
        Xnom=Xnom,
        p0=2e5,
        T=350) annotation (Placement(transformation(extent={{70,-10},{90,10}},
              rotation=0)));
      Gas.PressDrop PressDrop1(
        redeclare package Medium = Medium,
        Xstart=Xnom,
        rhonom=5,
        pstart=5e5,
        Tstart=450,
        wnom=1,
        dpnom=1e5,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) annotation (
          Placement(transformation(extent={{-50,-10},{-30,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        offset=1,
        height=-0.3,
        startTime=0.1) annotation (Placement(transformation(extent={{10,20},{30,
                40}}, rotation=0)));
      Gas.SourceMassFlow
                  SourceW1(
        redeclare package Medium = Medium,
        Xnom=Xnom,
        w0=5,
        p0=5e5,
        T=450) annotation (Placement(transformation(extent={{-90,-10},{-70,10}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    initial equation

    equation
      connect(ValveLin1.outlet, SinkP2.flange) annotation (Line(
          points={{50,0},{70,0}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop1.outlet, Header1.inlet) annotation (Line(
          points={{-30,0},{-10,0}},
          color={159,159,223},
          thickness=0.5));
      connect(Header1.outlet, ValveLin1.inlet) annotation (Line(
          points={{10,0},{30,0}},
          color={159,159,223},
          thickness=0.5));
      connect(Step1.y, ValveLin1.cmd)
        annotation (Line(points={{31,30},{40,30},{40,7}}, color={0,0,127}));
      connect(SourceW1.flange, PressDrop1.inlet) annotation (Line(
          points={{-70,0},{-50,0}},
          color={159,159,223},
          thickness=0.5));
      annotation (
        Icon(graphics),
        Diagram(graphics),
        Documentation(info="<html>
This model tests the <tt>Header</tt> model.

<p>Simulate for 1 s. The model starts at steady state. At t=0.1 the valve is partially closed.
</html>"),
        experiment,
        experimentSetupOutput);
    end TestGasHeader;

    model TestGasMixer
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;
      parameter Real wext=10;
      Gas.Mixer Mixer1(
        redeclare package Medium = Medium,
        gamma=0.8,
        S=1,
        V=3,
        pstart=400000,
        Tstart=450,
        Tmstart=300)                                          annotation (
          Placement(transformation(extent={{-38,-10},{-18,10}}, rotation=0)));
      Gas.PressDrop PressDrop1(
        redeclare package Medium = Medium,
        A=0.1,
        dpnom=1e5,
        rhonom=3.5,
        wnom=wext,
        pstart=4e5,
        Tstart=400,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint) annotation (
          Placement(transformation(extent={{0,-10},{22,10}}, rotation=0)));
      Gas.SinkPressure
                SinkP1(
        redeclare package Medium = Medium,
        p0=1e5,
        T=350) annotation (Placement(transformation(extent={{76,-10},{96,10}},
              rotation=0)));
      Gas.SourceMassFlow
                  SourceW2(
        redeclare package Medium = Medium,
        w0=15,
        Xnom={0.5,0.5},
        p0=400000,
        T=350,
        use_in_w0=true) annotation (Placement(transformation(extent={{-76,-40},
                {-56,-20}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        height=-0.2,
        offset=1.5,
        startTime=15) annotation (Placement(transformation(extent={{20,30},{40,
                50}}, rotation=0)));
      Gas.Valve Valve1(
        redeclare package Medium = Medium,
        wnom=wext,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint,
        pnom=300000,
        dpnom=200000,
        Tstart=400)                                       annotation (Placement(
            transformation(extent={{40,-10},{60,10}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp1(
        offset=wext,
        height=-1,
        duration=0.1,
        startTime=8) annotation (Placement(transformation(extent={{-100,-20},{-80,
                0}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp2(
        height=-1,
        offset=5,
        duration=0.1,
        startTime=1) annotation (Placement(transformation(extent={{-100,40},{-80,
                60}}, rotation=0)));
      Gas.SourceMassFlow
                  SourceW1(
        redeclare package Medium = Medium,
        p0=400000,
        T=450,
        use_in_w0=true)
               annotation (Placement(transformation(extent={{-74,18},{-54,38}},
              rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(Mixer1.out, PressDrop1.inlet) annotation (Line(
          points={{-18,0},{0,0}},
          color={159,159,223},
          thickness=0.5));
      connect(SourceW2.flange, Mixer1.in2) annotation (Line(
          points={{-56,-30},{-44,-30},{-44,-6},{-36,-6}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop1.outlet, Valve1.inlet) annotation (Line(
          points={{22,0},{40,0}},
          color={159,159,223},
          thickness=0.5));
      connect(Valve1.outlet, SinkP1.flange) annotation (Line(
          points={{60,0},{76,0}},
          color={159,159,223},
          thickness=0.5));
      connect(Step1.y, Valve1.theta)
        annotation (Line(points={{41,40},{50,40},{50,7.2}}, color={0,0,127}));
      connect(Ramp1.y, SourceW2.in_w0) annotation (Line(points={{-79,-10},{-72,
              -10},{-72,-25}}, color={0,0,127}));
      connect(SourceW1.flange, Mixer1.in1) annotation (Line(
          points={{-54,28},{-44,28},{-44,6},{-36,6}},
          color={159,159,223},
          thickness=0.5));
      connect(Ramp2.y, SourceW1.in_w0) annotation (Line(points={{-79,50},{-70,
              50},{-70,33}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=20),
        Documentation(info="<html>
This model tests the <tt>Mixer</tt> model.
<p>
Simulate for 20 s. At time t=1 the first inlet flow rate is reduced. At time t=8 the second inlet flow rate is reduced. At time t=15, the outlet valve is partially closed.
</html>"));
    end TestGasMixer;

    model TestCC
      extends Modelica.Icons.Example;

      ThermoPower.Gas.SourceMassFlow
                              Wcompressor(
        redeclare package Medium = ThermoPower.Media.Air,
        w0=158,
        T=616.95) annotation (Placement(transformation(extent={{-80,-10},{-60,
                10}}, rotation=0)));
      ThermoPower.Gas.CombustionChamber CombustionChamber1(
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HH=41.6e6,
        pstart=11.2e5,
        V=0.1,
        S=0.1) annotation (Placement(transformation(extent={{-38,-10},{-18,10}},
              rotation=0)));
      ThermoPower.Gas.SourceMassFlow
                              Wfuel(redeclare package Medium =
            ThermoPower.Media.NaturalGas, use_in_w0=true)
                                          annotation (Placement(transformation(
              extent={{-50,28},{-30,48}}, rotation=0)));
      ThermoPower.Gas.PressDrop PressDrop1(
        redeclare package Medium = ThermoPower.Media.FlueGas,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        rhonom=3.3,
        wnom=158.9,
        pstart=11.2e5,
        dpnom=0.426e5) annotation (Placement(transformation(extent={{-4,-10},{
                16,10}}, rotation=0)));
      ThermoPower.Gas.SensT SensT1(redeclare package Medium =
            ThermoPower.Media.FlueGas) annotation (Placement(transformation(
              extent={{26,-6},{46,14}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        startTime=0.5,
        height=-0.3,
        offset=3.1) annotation (Placement(transformation(extent={{-78,56},{-58,
                76}}, rotation=0)));
      ThermoPower.Gas.ValveLin ValveLin1(redeclare package Medium =
            ThermoPower.Media.FlueGas, Kv=161.1/9.77e5) annotation (Placement(
            transformation(extent={{54,-10},{74,10}}, rotation=0)));
      ThermoPower.Gas.SinkPressure
                            SinkP1(redeclare package Medium =
            ThermoPower.Media.FlueGas) annotation (Placement(transformation(
              extent={{84,-10},{104,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{22,28},{42,48}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(Wfuel.flange, CombustionChamber1.inf) annotation (Line(
          points={{-30,38},{-28,38},{-28,10}},
          color={159,159,223},
          thickness=0.5));
      connect(Wcompressor.flange, CombustionChamber1.ina) annotation (Line(
          points={{-60,0},{-38,0}},
          color={159,159,223},
          thickness=0.5));
      connect(CombustionChamber1.out, PressDrop1.inlet) annotation (Line(
          points={{-18,0},{-4,0}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop1.outlet, SensT1.inlet) annotation (Line(
          points={{16,0},{30,0}},
          color={159,159,223},
          thickness=0.5));
      connect(Step1.y, Wfuel.in_w0) annotation (Line(points={{-57,66},{-46,66},
              {-46,43}}, color={0,0,127}));
      connect(ValveLin1.outlet, SinkP1.flange) annotation (Line(
          points={{74,0},{84,0}},
          color={159,159,223},
          thickness=0.5));
      connect(SensT1.outlet, ValveLin1.inlet) annotation (Line(
          points={{42,0},{54,0}},
          color={159,159,223},
          thickness=0.5));
      connect(Constant1.y, ValveLin1.cmd)
        annotation (Line(points={{43,38},{64,38},{64,7}}, color={0,0,127}));
      annotation (Documentation(info="<html>
This model tests the <tt>CombustionChamber</tt> model. The model start at steady state. At time t = 0.5, the fuel flow rate is reduced by 10%.

<p>Simulate for 5s.
</html>"), experiment(StopTime=5));
    end TestCC;

    model TestGasPressDrop
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;
      Gas.SourcePressure
                  SourceP1(
        redeclare package Medium = Medium,
        p0=500000,
        T=400,
        use_in_p0=true)
                annotation (Placement(transformation(extent={{-70,10},{-50,30}},
              rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        startTime=2,
        height=-0.3,
        offset=1) annotation (Placement(transformation(extent={{20,40},{40,60}},
              rotation=0)));
      Gas.PressDropLin PressDropLin1(redeclare package Medium = Medium, R=5.5e4)
        annotation (Placement(transformation(extent={{6,10},{26,30}}, rotation=
                0)));
      Gas.SinkPressure
                SinkP1(
        redeclare package Medium = Medium,
        T=300,
        p0=3e5) annotation (Placement(transformation(extent={{70,10},{90,30}},
              rotation=0)));
      Gas.PressDrop PressDrop1(
        redeclare package Medium = Medium,
        rhonom=3,
        wnom=1,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        dpnom=200000,
        pstart=500000,
        Tstart=400) annotation (Placement(transformation(extent={{-30,10},{-10,
                30}}, rotation=0)));
      Gas.Valve Valve1(
        redeclare package Medium = Medium,
        dpnom=1.5e5,
        pnom=2.5e5,
        Av=20e-4,
        wnom=1,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av) annotation (Placement(
            transformation(extent={{40,10},{60,30}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine1(
        phase=0,
        offset=5e5,
        startTime=0.1,
        freqHz=0.2,
        amplitude=3e5) annotation (Placement(transformation(extent={{-94,40},{-74,
                60}}, rotation=0)));
      Gas.SourcePressure
                  SourceP2(
        redeclare package Medium = Medium,
        p0=500000,
        T=400,
        use_in_p0=true)
                annotation (Placement(transformation(extent={{-70,-60},{-50,-40}},
              rotation=0)));
      Modelica.Blocks.Sources.Step Step2(
        startTime=2,
        height=-0.3,
        offset=1) annotation (Placement(transformation(extent={{20,-30},{40,-10}},
              rotation=0)));
      Gas.PressDropLin PressDropLin2(redeclare package Medium = Medium, R=0.5e5)
        annotation (Placement(transformation(extent={{6,-60},{26,-40}},
              rotation=0)));
      Gas.SinkPressure
                SinkP2(
        redeclare package Medium = Medium,
        T=300,
        p0=3e5) annotation (Placement(transformation(extent={{70,-60},{90,-40}},
              rotation=0)));
      Gas.PressDrop PressDrop2(
        redeclare package Medium = Medium,
        rhonom=3,
        wnom=1,
        Kf=8e5,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.Kf,
        dpnom=200000,
        pstart=500000,
        Tstart=400) annotation (Placement(transformation(extent={{-30,-60},{-10,
                -40}}, rotation=0)));
      Gas.Valve Valve2(
        redeclare package Medium = Medium,
        wnom=1,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint,
        pnom=250000,
        dpnom=150000)                                     annotation (Placement(
            transformation(extent={{40,-60},{60,-40}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine2(
        phase=0,
        startTime=0.1,
        freqHz=0.2,
        amplitude=5e5,
        offset=7e5) annotation (Placement(transformation(extent={{-96,-32},{-76,
                -12}}, rotation=0)));
      //initial equation
      //Valve2.w=1;

      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(PressDrop1.outlet, PressDropLin1.inlet) annotation (Line(
          points={{-10,20},{6,20}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop1.inlet, SourceP1.flange) annotation (Line(
          points={{-30,20},{-50,20}},
          color={159,159,223},
          thickness=0.5));
      connect(Valve1.outlet, SinkP1.flange) annotation (Line(
          points={{60,20},{70,20}},
          color={159,159,223},
          thickness=0.5));
      connect(Step1.y, Valve1.theta)
        annotation (Line(points={{41,50},{50,50},{50,27.2}}, color={0,0,127}));
      connect(PressDropLin1.outlet, Valve1.inlet) annotation (Line(
          points={{26,20},{40,20}},
          color={159,159,223},
          thickness=0.5));
      connect(Sine1.y, SourceP1.in_p0) annotation (Line(points={{-73,50},{-66,50},
              {-66,26.4}}, color={0,0,127}));
      connect(PressDrop2.outlet, PressDropLin2.inlet) annotation (Line(
          points={{-10,-50},{6,-50}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop2.inlet, SourceP2.flange) annotation (Line(
          points={{-30,-50},{-50,-50}},
          color={159,159,223},
          thickness=0.5));
      connect(Valve2.outlet, SinkP2.flange) annotation (Line(
          points={{60,-50},{70,-50}},
          color={159,159,223},
          thickness=0.5));
      connect(Step2.y, Valve2.theta) annotation (Line(points={{41,-20},{50,-20},
              {50,-42.8}}, color={0,0,127}));
      connect(PressDropLin2.outlet, Valve2.inlet) annotation (Line(
          points={{26,-50},{40,-50}},
          color={159,159,223},
          thickness=0.5));
      connect(Sine2.y, SourceP2.in_p0) annotation (Line(points={{-75,-22},{-66,-22},
              {-66,-43.6}}, color={0,0,127}));
      annotation (Diagram(graphics), Documentation(info="<html>
This model tests the <tt>PressDrop</tt>, <tt>PressDropLin</tt> and <tt>Valve</tt> models, testing various conditions, such as different friction coefficients in <tt>PressDrop</tt> and different flow coefficients in <tt>Valve</tt>, by setting the <tt>FFtype</tt> and <tt>CvData</tt> respectively on different value. Reverse flow conditions are also tested.
<p>Simulate for 10 seconds. At time t=2 the valve is partially closed.
</html>"));
    end TestGasPressDrop;

    model TestGasValveOpPoint
      extends Modelica.Icons.Example;

      package Medium = Media.Air;
      Gas.SourcePressure
                  SourceP1(redeclare package Medium = Medium, p0=5e5)
        annotation (Placement(transformation(extent={{-80,10},{-60,30}},
              rotation=0)));
      Gas.SinkPressure
                SinkP1(redeclare package Medium = Medium,
        p0=250000,
        use_in_p0=true)                                             annotation (
         Placement(transformation(extent={{62,10},{82,30}}, rotation=0)));
      Gas.Valve Valve1(
        redeclare package Medium = Medium,
        pnom=5e5,
        dpnom=1e5,
        wnom=1,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) annotation (Placement(
            transformation(extent={{-40,10},{-20,30}}, rotation=0)));
      Gas.Valve Valve2(
        redeclare package Medium = Medium,
        pnom=4e5,
        dpnom=1.5e5,
        wnom=1,
        CheckValve=false,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) annotation (Placement(
            transformation(extent={{10,10},{30,30}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine1(
        amplitude=2e5,
        offset=3.5e5,
        freqHz=0.4) annotation (Placement(transformation(extent={{40,40},{60,60}},
              rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        offset=1,
        startTime=0.3,
        height=-0.5) annotation (Placement(transformation(extent={{-60,40},{-40,
                60}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step2(
        height=-0.3,
        offset=1,
        startTime=0.7) annotation (Placement(transformation(extent={{-10,40},{
                10,60}}, rotation=0)));
      Gas.SourcePressure
                  SourceP2(redeclare package Medium = Medium, p0=5e5)
        annotation (Placement(transformation(extent={{-80,-60},{-60,-40}},
              rotation=0)));
      Gas.SinkPressure
                SinkP2(redeclare package Medium = Medium,
        p0=250000,
        use_in_p0=true)                                             annotation (
         Placement(transformation(extent={{62,-60},{82,-40}}, rotation=0)));
      Gas.Valve Valve3(
        redeclare package Medium = Medium,
        pnom=5e5,
        dpnom=1e5,
        wnom=1,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) annotation (Placement(
            transformation(extent={{-40,-60},{-20,-40}}, rotation=0)));
      Gas.Valve Valve4(
        redeclare package Medium = Medium,
        pnom=4e5,
        dpnom=1.5e5,
        wnom=1,
        CheckValve=true,
        CvData=ThermoPower.Choices.Valve.CvTypes.OpPoint) annotation (Placement(
            transformation(extent={{10,-60},{30,-40}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine2(
        amplitude=2e5,
        offset=3.5e5,
        freqHz=0.4) annotation (Placement(transformation(extent={{40,-30},{60,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Step Step3(
        offset=1,
        startTime=0.3,
        height=-0.8) annotation (Placement(transformation(extent={{-60,-30},{-40,
                -10}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step4(
        height=-0.3,
        offset=1,
        startTime=0.7) annotation (Placement(transformation(extent={{-10,-30},{
                10,-10}}, rotation=0)));
      /*initial equation
  Valve1.w=1;
  Valve2.Av=0.25*Valve1.Av;
  Valve3.w=1;
  Valve4.inlet.p=4e5;*/

      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceP1.flange, Valve1.inlet) annotation (Line(
          points={{-60,20},{-40,20}},
          color={159,159,223},
          thickness=0.5));
      connect(Valve1.outlet, Valve2.inlet) annotation (Line(
          points={{-20,20},{10,20}},
          color={159,159,223},
          thickness=0.5));
      connect(Valve2.outlet, SinkP1.flange) annotation (Line(
          points={{30,20},{62,20}},
          color={159,159,223},
          thickness=0.5));
      connect(Step1.y, Valve1.theta) annotation (Line(points={{-39,50},{-30,50},
              {-30,27.2}}, color={0,0,127}));
      connect(Step2.y, Valve2.theta)
        annotation (Line(points={{11,50},{20,50},{20,27.2}}, color={0,0,127}));
      connect(Sine1.y, SinkP1.in_p0) annotation (Line(points={{61,50},{66,50},{
              66,25.95},{65.55,25.95}}, color={0,0,127}));
      connect(SourceP2.flange, Valve3.inlet) annotation (Line(
          points={{-60,-50},{-40,-50}},
          color={159,159,223},
          thickness=0.5));
      connect(Valve3.outlet, Valve4.inlet) annotation (Line(
          points={{-20,-50},{10,-50}},
          color={159,159,223},
          thickness=0.5));
      connect(Valve4.outlet, SinkP2.flange) annotation (Line(
          points={{30,-50},{62,-50}},
          color={159,159,223},
          thickness=0.5));
      connect(Step3.y, Valve3.theta) annotation (Line(points={{-39,-20},{-30,-20},
              {-30,-42.8}}, color={0,0,127}));
      connect(Step4.y, Valve4.theta) annotation (Line(points={{11,-20},{20,-20},
              {20,-42.8}}, color={0,0,127}));
      connect(Sine2.y, SinkP2.in_p0) annotation (Line(points={{61,-20},{66,-20},
              {66,-44.05},{65.55,-44.05}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        Documentation(info="<html>
This models tests the Valve model in different operating conditions. The valve flow coefficients are set by the initial operating point; this means that four additional initial equations are needed to fully specify the flow coefficients.
<p>Simulate for 4 s. The valves are partially closed at t = 0.3 and t = 0.7.
</html>"),
        experiment(StopTime=10),
        experimentSetupOutput);
    end TestGasValveOpPoint;

    model TestGasValve
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;
      Gas.SourcePressure
                  SourceP1(
        redeclare package Medium = Medium,
        T=500,
        p0=5e5) annotation (Placement(transformation(extent={{-90,40},{-70,60}},
              rotation=0)));
      Gas.SinkPressure
                SinkP1(
        redeclare package Medium = Medium,
        p0=250000,
        T=350,
        use_in_p0=true)
                  annotation (Placement(transformation(extent={{70,40},{90,60}},
              rotation=0)));
      Gas.Valve V1(
        redeclare package Medium = Medium,
        dpnom=1e5,
        wnom=0.5,
        Tstart=500,
        pnom=5e5,
        Cv=165,
        CvData=ThermoPower.Choices.Valve.CvTypes.Cv) annotation (Placement(
            transformation(extent={{-50,40},{-30,60}}, rotation=0)));
      Modelica.Blocks.Sources.Step S2(
        offset=1,
        startTime=6,
        height=-0.5) annotation (Placement(transformation(extent={{-70,70},{-50,
                90}}, rotation=0)));
      Gas.Valve V2(
        redeclare package Medium = Medium,
        dpnom=1e5,
        wnom=0.5,
        Tstart=500,
        pnom=4e5,
        Av=30e-4,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av) annotation (Placement(
            transformation(extent={{-10,40},{10,60}}, rotation=0)));
      Gas.Valve V3(
        redeclare package Medium = Medium,
        wnom=0.5,
        Tstart=500,
        dpnom=0.5e5,
        pnom=3e5,
        Kv=132,
        CvData=ThermoPower.Choices.Valve.CvTypes.Kv) annotation (Placement(
            transformation(extent={{30,40},{50,60}}, rotation=0)));
      Modelica.Blocks.Sources.Step S3(
        offset=1,
        height=-0.3,
        startTime=3) annotation (Placement(transformation(extent={{-30,70},{-10,
                90}}, rotation=0)));
      Modelica.Blocks.Sources.Step S4(
        offset=1,
        startTime=1,
        height=-0.6) annotation (Placement(transformation(extent={{10,70},{30,
                90}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine2(
        freqHz=0.5,
        offset=4e5,
        amplitude=2e5) annotation (Placement(transformation(extent={{46,70},{66,
                90}}, rotation=0)));

      Gas.SourcePressure
                  SourceP2(
        redeclare package Medium = Medium,
        T=500,
        p0=5e5) annotation (Placement(transformation(extent={{-90,-30},{-70,-10}},
              rotation=0)));
      Gas.SinkPressure
                SinkP2(
        redeclare package Medium = Medium,
        p0=200000,
        T=350,
        use_in_p0=true)
                annotation (Placement(transformation(extent={{70,-30},{90,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Step S6(
        offset=1,
        startTime=6,
        height=-0.3) annotation (Placement(transformation(extent={{-70,0},{-50,
                20}},  rotation=0)));
      Gas.Valve V6(
        redeclare package Medium = Medium,
        CheckValve=false,
        Av=12e-4,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av,
        pnom=500000,
        dpnom=150000,
        wnom=0.5,
        Tstart=500)                                  annotation (Placement(
            transformation(extent={{-50,-30},{-30,-10}}, rotation=0)));
      Modelica.Blocks.Sources.Step S7(
        offset=1,
        startTime=1,
        height=-0.5) annotation (Placement(transformation(extent={{-30,0},{-10,
                20}},  rotation=0)));
      Modelica.Blocks.Sources.Step S8(
        offset=1,
        startTime=3,
        height=-0.5) annotation (Placement(transformation(extent={{10,0},{30,20}},
                       rotation=0)));
      Gas.Valve V7(
        redeclare package Medium = Medium,
        CheckValve=false,
        Kv=102,
        CvData=ThermoPower.Choices.Valve.CvTypes.Kv,
        pnom=350000,
        dpnom=50000,
        wnom=0.5,
        Tstart=500)                                  annotation (Placement(
            transformation(extent={{-10,-30},{10,-10}}, rotation=0)));
      Gas.Valve V8(
        redeclare package Medium = Medium,
        Cv=122,
        CheckValve=true,
        CvData=ThermoPower.Choices.Valve.CvTypes.Cv,
        pnom=300000,
        dpnom=100000,
        wnom=0.5,
        Tstart=500)                                  annotation (Placement(
            transformation(extent={{30,-30},{50,-10}}, rotation=0)));
      Modelica.Blocks.Sources.Sine Sine1(
        freqHz=0.5,
        amplitude=2e5,
        offset=4e5) annotation (Placement(transformation(extent={{46,0},{66,20}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Gas.SourcePressure
                  SourceP3(
        redeclare package Medium = Medium,
        T=500,
        p0=5e5) annotation (Placement(transformation(extent={{-90,-80},{-70,-60}},
              rotation=0)));
      Gas.SinkPressure
                SinkP3(
        redeclare package Medium = Medium,
        p0=200000,
        T=350,
        use_in_p0=false)
                annotation (Placement(transformation(extent={{70,-80},{90,-60}},
              rotation=0)));
      Gas.Valve V9(
        redeclare package Medium = Medium,
        CheckValve=false,
        Av=12e-4,
        CvData=ThermoPower.Choices.Valve.CvTypes.Av,
        wnom=0.5,
        useThetaInput=false,
        pnom=500000,
        dpnom=150000,
        Tstart=500)                                  annotation (Placement(
            transformation(extent={{-10,-80},{10,-60}},  rotation=0)));
    equation
      connect(S2.y, V1.theta) annotation (Line(points={{-49,80},{-40,80},{-40,
              57.2}}, color={0,0,127}));
      connect(V1.outlet, V2.inlet) annotation (Line(
          points={{-30,50},{-10,50}},
          color={159,159,223},
          thickness=0.5));
      connect(S3.y, V2.theta)
        annotation (Line(points={{-9,80},{0,80},{0,57.2}}, color={0,0,127}));
      connect(S4.y, V3.theta)
        annotation (Line(points={{31,80},{40,80},{40,57.2}}, color={0,0,127}));
      connect(V3.outlet, SinkP1.flange) annotation (Line(
          points={{50,50},{70,50}},
          color={159,159,223},
          thickness=0.5));
      connect(V2.outlet, V3.inlet) annotation (Line(
          points={{10,50},{30,50}},
          color={159,159,223},
          thickness=0.5));
      connect(Sine2.y, SinkP1.in_p0) annotation (Line(points={{67,80},{74,80},{
              74,55.95},{73.55,55.95}}, color={0,0,127}));
      connect(SourceP1.flange, V1.inlet) annotation (Line(
          points={{-70,50},{-50,50}},
          color={159,159,223},
          thickness=0.5));
      connect(S6.y, V6.theta) annotation (Line(points={{-49,10},{-40,10},{-40,
              -12.8}}, color={0,0,127}));
      connect(V6.outlet, V7.inlet) annotation (Line(
          points={{-30,-20},{-10,-20}},
          color={159,159,223},
          thickness=0.5));
      connect(V7.outlet, V8.inlet) annotation (Line(
          points={{10,-20},{30,-20}},
          color={159,159,223},
          thickness=0.5));
      connect(V8.outlet, SinkP2.flange) annotation (Line(
          points={{50,-20},{70,-20}},
          color={159,159,223},
          thickness=0.5));
      connect(S8.y, V8.theta) annotation (Line(points={{31,10},{40,10},{40,
              -12.8}},
            color={0,0,127}));
      connect(S7.y, V7.theta) annotation (Line(points={{-9,10},{0,10},{0,-12.8}},
            color={0,0,127}));
      connect(Sine1.y, SinkP2.in_p0) annotation (Line(points={{67,10},{74,10},{
              74,-14.05},{73.55,-14.05}},  color={0,0,127}));
      connect(SourceP2.flange, V6.inlet) annotation (Line(
          points={{-70,-20},{-50,-20}},
          color={159,159,223},
          thickness=0.5));
      connect(SourceP3.flange, V9.inlet) annotation (Line(
          points={{-70,-70},{-10,-70}},
          color={159,159,223},
          smooth=Smooth.None));
      connect(V9.outlet, SinkP3.flange) annotation (Line(
          points={{10,-70},{70,-70}},
          color={159,159,223},
          smooth=Smooth.None));
      annotation (experiment(StopTime=10), Documentation(info="<html>
This model tests the <tt>Valve</tt> model, in each possible configuration, i.e. with all the <tt>CvData</tt> options except <tt>OpPoint</tt>, as well as <tt>CheckValve</tt>.

<p>Simulate for 10 s. At time t=1, t=3 and t=6 the valves are partially closed.
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics));
    end TestGasValve;

    model TestCompressorConstSpeed
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;
    protected
      parameter Real tableEta[6, 4]=[0, 95, 100, 105; 1, 82.5e-2, 81e-2,
          80.5e-2; 2, 84e-2, 82.9e-2, 82e-2; 3, 83.2e-2, 82.2e-2, 81.5e-2; 4,
          82.5e-2, 81.2e-2, 79e-2; 5, 79.5e-2, 78e-2, 76.5e-2];
      parameter Real tablePhic[6, 4]=[0, 95, 100, 105; 1, 38.3e-3, 43e-3,
          46.8e-3; 2, 39.3e-3, 43.8e-3, 47.9e-3; 3, 40.6e-3, 45.2e-3, 48.4e-3;
          4, 41.6e-3, 46.1e-3, 48.9e-3; 5, 42.3e-3, 46.6e-3, 49.3e-3];

      parameter Real tablePR[6, 4]=[0, 95, 100, 105; 1, 22.6, 27, 32; 2, 22,
          26.6, 30.8; 3, 20.8, 25.5, 29; 4, 19, 24.3, 27.1; 5, 17, 21.5, 24.2];

    public
      ThermoPower.Gas.SourcePressure
                              SourceP1(
        redeclare package Medium = Medium,
        p0=0.35e5,
        T=244.4) annotation (Placement(transformation(extent={{-80,6},{-60,26}},
              rotation=0)));
      ThermoPower.Gas.SinkPressure
                            SinkP1(
        redeclare package Medium = Medium,
        p0=8.3e5,
        T=691.4) annotation (Placement(transformation(extent={{40,6},{60,26}},
              rotation=0)));
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
        Tdes_in=244.4) annotation (Placement(transformation(extent={{-20,-20},{
                20,20}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sources.ConstantSpeed ConstantSpeed1(
          w_fixed=523.3, useSupport=false) annotation (Placement(transformation(
              extent={{-50,-10},{-30,10}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceP1.flange, Compressor.inlet) annotation (Line(
          points={{-60,16},{-16,16}},
          color={159,159,223},
          thickness=0.5));
      connect(Compressor.outlet, SinkP1.flange) annotation (Line(
          points={{16,16},{40,16}},
          color={159,159,223},
          thickness=0.5));
      connect(ConstantSpeed1.flange, Compressor.shaft_a) annotation (Line(
          points={{-30,0},{-30,0},{-26,-0.2},{-12,0}},
          color={0,0,0},
          thickness=0.5));
      annotation (
        experiment(StopTime=2),
        experimentSetupOutput,
        Documentation(info="<html>
This model test the <tt>Compressor</tt> model at constant speed.

<p>Simulate for 2s.

</html>"));
    end TestCompressorConstSpeed;

    model TestCompressorInertia
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;
    protected
      parameter Real tableEta[6, 4]=[0, 95, 100, 105; 1, 82.5e-2, 81e-2,
          80.5e-2; 2, 84e-2, 82.9e-2, 82e-2; 3, 83.2e-2, 82.2e-2, 81.5e-2; 4,
          82.5e-2, 81.2e-2, 79e-2; 5, 79.5e-2, 78e-2, 76.5e-2];
      parameter Real tablePhic[6, 4]=[0, 95, 100, 105; 1, 38.3e-3, 43e-3,
          46.8e-3; 2, 39.3e-3, 43.8e-3, 47.9e-3; 3, 40.6e-3, 45.2e-3, 48.4e-3;
          4, 41.6e-3, 46.1e-3, 48.9e-3; 5, 42.3e-3, 46.6e-3, 49.3e-3];

      parameter Real tablePR[6, 4]=[0, 95, 100, 105; 1, 22.6, 27, 32; 2, 22,
          26.6, 30.8; 3, 20.8, 25.5, 29; 4, 19, 24.3, 27.1; 5, 17, 21.5, 24.2];

    public
      ThermoPower.Gas.SourcePressure
                              SourceP1(
        redeclare package Medium = Medium,
        p0=0.35e5,
        T=244.4) annotation (Placement(transformation(extent={{-80,6},{-60,26}},
              rotation=0)));
      ThermoPower.Gas.SinkPressure
                            SinkP1(
        redeclare package Medium = Medium,
        p0=8.3e5,
        T=691.4) annotation (Placement(transformation(extent={{40,6},{60,26}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Components.Inertia Inertia1(J=10000)
        annotation (Placement(transformation(extent={{10,-10},{30,10}},
              rotation=0)));
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
        Tdes_in=244.4) annotation (Placement(transformation(extent={{-40,-20},{
                0,20}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    initial equation
      Inertia1.w = 523.3;

    equation
      connect(SourceP1.flange, Compressor.inlet) annotation (Line(
          points={{-60,16},{-36,16}},
          color={159,159,223},
          thickness=0.5));
      connect(Compressor.outlet, SinkP1.flange) annotation (Line(
          points={{-4,16},{40,16}},
          color={159,159,223},
          thickness=0.5));
      connect(Compressor.shaft_b, Inertia1.flange_a) annotation (Line(
          points={{-8,0},{-8,-0.05},{10,-0.05},{10,0}},
          color={0,0,0},
          thickness=0.5));
      annotation (
        experiment(StopTime=2),
        experimentSetupOutput,
        Documentation(info="<html>
This model test the <tt>Compressor</tt> model with an inertial load. Boundary conditions and data refer to an turbojet engine at 11.000 m.

<p>Simulate for 2 seconds. The compressor slows down.
</html>"));
    end TestCompressorInertia;

    model TestGasTurbine
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;
    protected
      parameter Real tablePhic[5, 4]=[1, 90, 100, 110; 2.36, 4.68e-3, 4.68e-3,
          4.68e-3; 2.88, 4.68e-3, 4.68e-3, 4.68e-3; 3.56, 4.68e-3, 4.68e-3,
          4.68e-3; 4.46, 4.68e-3, 4.68e-3, 4.68e-3];
      parameter Real tableEta[5, 4]=[1, 90, 100, 110; 2.36, 89e-2, 89.5e-2,
          89.3e-2; 2.88, 90e-2, 90.6e-2, 90.5e-2; 3.56, 90.5e-2, 90.6e-2,
          90.5e-2; 4.46, 90.2e-2, 90.3e-2, 90e-2];
    public
      ThermoPower.Gas.SourcePressure
                              SourceP1(
        redeclare package Medium = Medium,
        T=1270,
        p0=7.85e5) annotation (Placement(transformation(extent={{-80,6},{-60,26}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Components.Inertia Inertia1(J=10000)
        annotation (Placement(transformation(extent={{10,-10},{30,10}},
              rotation=0)));
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
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix) annotation (
         Placement(transformation(extent={{-40,-20},{0,20}}, rotation=0)));
      Gas.SinkPressure
                SinkP1(
        redeclare package Medium = Medium,
        p0=1.52e5,
        T=883) annotation (Placement(transformation(extent={{40,6},{60,26}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceP1.flange, Turbine1.inlet) annotation (Line(
          points={{-60,16},{-36,16}},
          color={159,159,223},
          thickness=0.5));
      connect(Turbine1.outlet, SinkP1.flange) annotation (Line(
          points={{-4,16},{40,16}},
          color={159,159,223},
          thickness=0.5));
    initial equation
      Inertia1.w = 523.3;

    equation
      connect(Turbine1.shaft_b, Inertia1.flange_a) annotation (Line(
          points={{-8,0},{-4,0},{-4,0},{10,0}},
          color={0,0,0},
          thickness=0.5));
      annotation (
        experiment(StopTime=10),
        experimentSetupOutput,
        Documentation(info="<html>
This model test the Turbine model with an inertial load. Boundary conditions and data refer to an turbojet engine at 11.000 m.

<p>Simulate for 5 seconds.
</html>"));
    end TestGasTurbine;

    model TestGasTurbineStodola
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.IdealGases.MixtureGases.CombustionAir;

    protected
      parameter Real tableEta[5, 4]=[1, 90, 100, 110; 7, 89e-2, 89.5e-2,
          89.3e-2; 10, 90e-2, 90.6e-2, 90.5e-2; 12, 90.5e-2, 90.6e-2, 90.5e-2;
          15, 90.2e-2, 90.3e-2, 90e-2];
    public
      ThermoPower.Gas.SourcePressure
                              SourceP1(
        redeclare package Medium = Medium,
        T=1270,
        p0=7.85e5) annotation (Placement(transformation(extent={{-80,6},{-60,26}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Components.Inertia Inertia1(J=10000)
        annotation (Placement(transformation(extent={{30,-10},{50,10}},
              rotation=0)));
      Gas.TurbineStodola Turbine1(
        redeclare package Medium = Medium,
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
        tableEta=tableEta,
        fixedEta=true,
        Ndesign=523.3,
        wnom=104,
        Tdes_in=1400,
        pstart_in=785000,
        pstart_out=152000,
        Tstart_in=1270,
        Tstart_out=883)
                  annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=0)));
      Gas.SinkPressure
                SinkP1(
        redeclare package Medium = Medium,
        p0=1.52e5,
        T=883) annotation (Placement(transformation(extent={{60,6},{80,26}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Sources.ConstantSpeed ConstantSpeed1(
          w_fixed=523.3, useSupport=false) annotation (Placement(transformation(
              extent={{-50,-10},{-30,10}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceP1.flange, Turbine1.inlet) annotation (Line(
          points={{-60,16},{-16,16}},
          color={159,159,223},
          thickness=0.5));
      connect(Turbine1.outlet, SinkP1.flange) annotation (Line(
          points={{16,16},{60,16}},
          color={159,159,223},
          thickness=0.5));
      connect(Turbine1.shaft_b, Inertia1.flange_a) annotation (Line(
          points={{12,0},{16,0},{30,0}},
          color={0,0,0},
          thickness=0.5));
      connect(ConstantSpeed1.flange, Turbine1.shaft_a) annotation (Line(
          points={{-30,0},{-14,0},{-12,0}},
          color={0,0,0},
          thickness=0.5));
      annotation (
        extent=[-58, 20; -38, 40],
        Diagram(graphics),
        Documentation(info="<html>
This model test the Turbine model based on the Stodola's law at constant speed. Boundary conditions and data refer to an turbojet engine at 11.000 m.
<p>Simulate for 5 seconds.
</html>"),
        experiment(StopTime=5),
        Placement(transformation(extent={{-58,20},{-38,40}}, rotation=0)),
        Diagram);
    end TestGasTurbineStodola;

    model TestTurboJetInertia
      extends Modelica.Icons.Example;
      parameter SI.SpecificEnthalpy HH(fixed=false, start=40e6)
        "Fuel lower heat value";
    protected
      parameter Real tableEtaC[6, 4]=[0, 95, 100, 105; 1, 82.5e-2, 81e-2,
          80.5e-2; 2, 84e-2, 82.9e-2, 82e-2; 3, 83.2e-2, 82.2e-2, 81.5e-2; 4,
          82.5e-2, 81.2e-2, 79e-2; 5, 79.5e-2, 78e-2, 76.5e-2];
      parameter Real tablePhicC[6, 4]=[0, 95, 100, 105; 1, 38.3e-3, 43e-3,
          46.8e-3; 2, 39.3e-3, 43.8e-3, 47.9e-3; 3, 40.6e-3, 45.2e-3, 48.4e-3;
          4, 41.6e-3, 46.1e-3, 48.9e-3; 5, 42.3e-3, 46.6e-3, 49.3e-3];

      parameter Real tablePR[6, 4]=[0, 95, 100, 105; 1, 22.6, 27, 32; 2, 22,
          26.6, 30.8; 3, 20.8, 25.5, 29; 4, 19, 24.3, 27.1; 5, 17, 21.5, 24.2];
      parameter Real tableEtaT[5, 4]=[1, 90, 100, 110; 2.36, 89e-2, 89.5e-2,
          89.3e-2; 2.88, 90e-2, 90.6e-2, 90.5e-2; 3.56, 90.5e-2, 90.6e-2,
          90.5e-2; 4.46, 90.2e-2, 90.3e-2, 90e-2];
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
        tablePR=tablePR) annotation (Placement(transformation(extent={{-46,-24},
                {-26,-4}}, rotation=0)));
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
        tableEta=tableEtaT) annotation (Placement(transformation(extent={{58,-24},
                {78,-4}}, rotation=0)));
      ThermoPower.Gas.CombustionChamber CombustionChamber1(
        gamma=1,
        Cm=1,
        pstart=8.11e5,
        V=0.05,
        S=0.05,
        Tstart=1370,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HH=HH) annotation (Placement(transformation(extent={{8,0},{28,20}},
              rotation=0)));
      ThermoPower.Gas.SourcePressure
                              SourceP1(
        redeclare package Medium = Media.Air,
        T=244.4,
        p0=0.3447e5) annotation (Placement(transformation(extent={{-100,-16},{-80,
                4}}, rotation=0)));
      ThermoPower.Gas.SinkPressure
                            SinkP1(
        redeclare package Medium = Media.FlueGas,
        p0=1.52e5,
        T=800) annotation (Placement(transformation(extent={{82,-16},{102,4}},
              rotation=0)));
      ThermoPower.Gas.SourceMassFlow
                              SourceW1(
        redeclare package Medium = Media.NaturalGas,
        w0=2.02,
        p0=8.11e5,
        T=300) annotation (Placement(transformation(extent={{-20,34},{0,54}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Components.Inertia Inertia1(J=50)
        annotation (Placement(transformation(extent={{6,-24},{26,-4}}, rotation=
               0)));
      Gas.PressDrop PressDrop1(
        redeclare package Medium = Media.FlueGas,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        A=1,
        wnom=102,
        rhonom=2,
        dpnom=26000,
        pstart=811000,
        Tstart=1370) annotation (Placement(transformation(extent={{34,0},{54,20}},
              rotation=0)));
      Gas.PressDrop PressDrop2(
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        A=1,
        redeclare package Medium = Media.Air,
        wnom=100,
        rhonom=4.7,
        dpnom=18000,
        pstart=829000,
        Tstart=600) annotation (Placement(transformation(extent={{-20,0},{0,20}},
              rotation=0)));
      Gas.PressDrop PressDrop3(
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        A=1,
        redeclare package Medium = Media.Air,
        wnom=100,
        rhonom=0.48,
        dpnom=170,
        pstart=34470,
        Tstart=244.4) annotation (Placement(transformation(extent={{-72,-16},{-52,
                4}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        height=-0.2,
        offset=2.02,
        startTime=1) annotation (Placement(transformation(extent={{-60,50},{-40,
                70}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceW1.flange, CombustionChamber1.inf) annotation (Line(
          points={{0,44},{18,44},{18,20}},
          color={159,159,223},
          thickness=0.5));
      connect(Compressor1.shaft_b, Inertia1.flange_a) annotation (Line(
          points={{-30,-14},{6,-14}},
          color={0,0,0},
          thickness=0.5));
      connect(Inertia1.flange_b, Turbine1.shaft_a) annotation (Line(
          points={{26,-14},{62,-14}},
          color={0,0,0},
          thickness=0.5));
      connect(CombustionChamber1.out, PressDrop1.inlet) annotation (Line(
          points={{28,10},{34,10}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop1.outlet, Turbine1.inlet) annotation (Line(
          points={{54,10},{60,10},{60,-6}},
          color={159,159,223},
          thickness=0.5));
      connect(Compressor1.outlet, PressDrop2.inlet) annotation (Line(
          points={{-28,-6},{-28,10},{-20,10}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop2.outlet, CombustionChamber1.ina)
        annotation (Line(points={{0,10},{8,10}}, color={159,159,223}));
      connect(PressDrop3.outlet, Compressor1.inlet) annotation (Line(
          points={{-52,-6},{-44,-6}},
          color={159,159,223},
          thickness=0.5));
      connect(SourceP1.flange, PressDrop3.inlet) annotation (Line(
          points={{-80,-6},{-72,-6}},
          color={159,159,223},
          thickness=0.5));
      connect(Turbine1.outlet, SinkP1.flange) annotation (Line(
          points={{76,-6},{82,-6}},
          color={159,159,223},
          thickness=0.5));
    initial equation
      Inertia1.phi = 0;
      Inertia1.w = 523;
      der(Inertia1.w) = 0;

    equation
      connect(Step1.y, SourceW1.in_w0) annotation (Line(points={{-39,60},{-16,
              60},{-16,49}}, color={0,0,127}));
      annotation (Documentation(info="<html>
This is the full model of a turbojet-type engine at 11.000m [1].

<p>Simulate the model for 20s. At time t = 1 the fuel flow rate is reduced by 10%; the engine slows down accordingly.
<p><b>References:</b></p>
<ol>
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol>
</html>"), experiment(StopTime=5));
    end TestTurboJetInertia;

    model TestTurboJetConstSpeed
      extends Modelica.Icons.Example;
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
        Tdes_in=244.4) annotation (Placement(transformation(extent={{-66,-30},{
                -46,-10}}, rotation=0)));
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
        Tstart_in=1370) annotation (Placement(transformation(extent={{54,-30},{
                74,-10}}, rotation=0)));

      ThermoPower.Gas.CombustionChamber CombustionChamber1(
        gamma=1,
        Cm=1,
        pstart=8.11e5,
        Tstart=1370,
        V=0.05,
        S=0.05,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HH=41.6e6) annotation (Placement(transformation(extent={{-6,0},{14,20}},
              rotation=0)));
      ThermoPower.Gas.SourcePressure
                              SourceP1(
        redeclare package Medium = Media.Air,
        p0=0.343e5,
        T=244.4) annotation (Placement(transformation(extent={{-100,0},{-80,20}},
              rotation=0)));
      ThermoPower.Gas.SinkPressure
                            SinkP1(
        redeclare package Medium = Media.FlueGas,
        p0=1.52e5,
        T=800) annotation (Placement(transformation(extent={{82,0},{102,20}},
              rotation=0)));
      ThermoPower.Gas.SourceMassFlow
                              SourceW1(
        redeclare package Medium = Media.NaturalGas,
        w0=2.02,
        p0=8.11e5,
        T=300) annotation (Placement(transformation(extent={{-30,30},{-10,50}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Components.Inertia Inertia1(J=50)
        annotation (Placement(transformation(extent={{-6,-30},{14,-10}},
              rotation=0)));
      Gas.PressDrop PressDrop1(
        redeclare package Medium = Media.FlueGas,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        A=1,
        wnom=102,
        rhonom=2,
        dpnom=26000,
        pstart=811000,
        Tstart=1370) annotation (Placement(transformation(extent={{28,0},{48,20}},
              rotation=0)));
      Gas.PressDrop PressDrop2(
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        A=1,
        redeclare package Medium = Media.Air,
        wnom=100,
        rhonom=4.7,
        dpnom=19000,
        pstart=830000,
        Tstart=600) annotation (Placement(transformation(extent={{-36,0},{-16,
                20}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sources.ConstantSpeed ConstantSpeed1(
          w_fixed=523.33, useSupport=false) annotation (Placement(
            transformation(extent={{-98,-30},{-78,-10}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceW1.flange, CombustionChamber1.inf) annotation (Line(
          points={{-10,40},{4,40},{4,20}},
          color={159,159,223},
          thickness=0.5));
      connect(Turbine1.outlet, SinkP1.flange) annotation (Line(
          points={{72,-12},{72,10},{82,10}},
          color={159,159,223},
          thickness=0.5));
      connect(Compressor1.shaft_b, Inertia1.flange_a) annotation (Line(
          points={{-50,-20},{-41.8,-20},{-41.8,-20},{-6,-20}},
          color={0,0,0},
          thickness=0.5));
      connect(Inertia1.flange_b, Turbine1.shaft_a) annotation (Line(
          points={{14,-20},{58,-20}},
          color={0,0,0},
          thickness=0.5));
      connect(SourceP1.flange, Compressor1.inlet) annotation (Line(
          points={{-80,10},{-64,10},{-64,-12}},
          color={159,159,223},
          thickness=0.5));
      connect(CombustionChamber1.out, PressDrop1.inlet) annotation (Line(
          points={{14,10},{28,10}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop1.outlet, Turbine1.inlet) annotation (Line(
          points={{48,10},{56,10},{56,-12}},
          color={159,159,223},
          thickness=0.5));
      connect(Compressor1.outlet, PressDrop2.inlet) annotation (Line(
          points={{-48,-12},{-48,10},{-36,10}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop2.outlet, CombustionChamber1.ina) annotation (Line(
          points={{-16,10},{-6,10}},
          color={159,159,223},
          thickness=0.5));
      connect(ConstantSpeed1.flange, Compressor1.shaft_a) annotation (Line(
          points={{-78,-20},{-62,-20},{-62,-20}},
          color={0,0,0},
          thickness=0.5));
      annotation (experiment(StopTime=5), Documentation(info="<html>
This is a simplified model of a turbojet-type engine at 11.000m [1], at constant speed.
<p>Simulate the model for 20s. At time t = 1 the fuel flow rate is reduced by 10%; the engine slows down accordingly.
<p><b>References:</b></p>
<ol>
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol>
</html>"));
    end TestTurboJetConstSpeed;

    model TestGT_ISO
      extends Modelica.Icons.Example;

      parameter Real tableData[8, 4]=[1.3e6, 7e6, 11.6, 18.75; 1.85e6, 8.2e6,
          12, 18.7; 2e6, 8.5e6, 12.1, 18.65; 3e6, 10.8e6, 12.7, 18.6; 3.5e6,
          12.1e6, 13, 18.55; 4e6, 13.4e6, 13.2, 18.5; 4.5e6, 14.75e6, 13.5,
          18.45; 4.8e6, 15.5e6, 13.6, 18.43];
      ThermoPower.Gas.GTunit_ISO GT(
        tableData=tableData,
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
        constantCompositionExhaust=true,
        HH=47.92e6,
        pstart=97350,
        Tstart=285.5,
        phi(start=0, fixed=true))
                    annotation (Placement(transformation(extent={{-30,-20},{10,
                20}}, rotation=0)));
      ThermoPower.Gas.SourcePressure
                              SourceP1(
        redeclare package Medium = ThermoPower.Media.Air,
        p0=1.011e5,
        T=288.15) annotation (Placement(transformation(extent={{-92,-4},{-72,16}},
              rotation=0)));
      ThermoPower.Gas.SinkPressure
                            SinkP1(
        redeclare package Medium = ThermoPower.Media.FlueGas,
        p0=1e5,
        T=526 + 273) annotation (Placement(transformation(extent={{30,4},{50,24}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Sources.ConstantSpeed ConstantSpeed1(
          w_fixed=1819.6, useSupport=false) annotation (Placement(
            transformation(extent={{80,-10},{60,10}}, rotation=0)));
      ThermoPower.Gas.SourceMassFlow
                              SourceW1(
        redeclare package Medium = ThermoPower.Media.NaturalGas,
        w0=0.317,
        p0=1327000,
        T=291.44,
        use_in_w0=true)
                  annotation (Placement(transformation(extent={{-40,24},{-20,44}},
              rotation=0)));
      Gas.PressDrop PressDrop1(
        redeclare package Medium = ThermoPower.Media.Air,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        rhonom=1.2,
        wnom=18.6,
        dpnom=3750,
        pstart=101100,
        Tstart=288.15) annotation (Placement(transformation(extent={{-60,-4},{-40,
                16}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        height=-0.1,
        offset=0.317,
        startTime=1) annotation (Placement(transformation(extent={{-70,52},{-50,
                72}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceW1.flange, GT.Fuel_in) annotation (Line(
          points={{-20,34},{-10,34},{-10,14.4}},
          color={159,159,223},
          thickness=0.5));
      connect(SourceP1.flange, PressDrop1.inlet) annotation (Line(
          points={{-72,6},{-72,6},{-60,6}},
          color={159,159,223},
          thickness=0.5));
      connect(PressDrop1.outlet, GT.Air_in) annotation (Line(
          points={{-40,6},{-28,6}},
          color={159,159,223},
          thickness=0.5));
      connect(GT.FlueGas_out, SinkP1.flange) annotation (Line(
          points={{8,6},{20,6},{20,14},{30,14}},
          color={159,159,223},
          thickness=0.5));
      connect(GT.shaft_b, ConstantSpeed1.flange) annotation (Line(
          points={{9.6,0},{60,0}},
          color={0,0,0},
          thickness=0.5));
      connect(Step1.y, SourceW1.in_w0) annotation (Line(points={{-49,62},{-36,
              62},{-36,39}}, color={0,0,127}));
      annotation (experiment(StopTime=2), Documentation(info="<html>
This model tests <tt>GTunit_ISO</tt>.

<p>Simulate for 2 s. The model start at steady state. At time t = 1, the fuel flow rate is reduced by 30%. The net power output GT.Pout goes from 4.5 MW to 2.7 MW.
</html>"));
    end TestGT_ISO;

    model TestGT
      extends Modelica.Icons.Example;

      parameter Real tabW[11, 4]=[0, 233.15, 288.15, 313.15; 0.485e6, 20.443,
          18.608, 17.498; 0.97e6, 20.443, 18.596, 17.483; 1.455e6, 20.443,
          18.584, 17.467; 1.94e6, 20.443, 18.572, 17.452; 2.425e6, 20.443,
          18.560, 17.437; 2.91e6, 20.443, 18.548, 17.421; 3.395e6, 20.443,
          18.536, 17.406; 3.88e6, 20.443, 18.524, 17.391; 4.365e6, 20.443,
          18.512, 17.375; 4.85e6, 20.443, 18.500, 17.360]
        "table for wia_iso=f(ZLPout_iso,Tsync)";
      parameter Real tabPR[11, 4]=[0, 233.15, 288.15, 313.15; 0.485e6, 11.002,
          10.766, 10.144; 0.97e6, 12.084, 11.070, 10.453; 1.455e6, 12.717,
          11.374, 10.762; 1.94e6, 13.166, 11.678, 11.070; 2.425e6, 13.515,
          11.981, 11.379; 2.91e6, 13.799, 12.258, 11.687; 3.395e6, 14.040,
          12.589, 11.996; 3.88e6, 14.248, 12.893, 12.305; 4.365e6, 14.432,
          13.196, 12.613; 4.85e6, 14.597, 13.500, 12.922]
        " table for PR=g(ZLPout_iso,Tsync)";
      parameter Real tabHI[12, 4]=[0, 233.15, 288.15, 313.15; 0.7275e6, 39e6,
          39e6, 39e6; 0.97e6, 31.2e6, 27.36e6, 28.08e6; 1.12125e6, 26.52e6,
          24.32e6, 24.96e6; 1.455e6, 24.18e6, 22.344e6, 22.932e6; 1.94e6,
          21.06e6, 19.456e6, 19.968e6; 2.425e6, 19.188e6, 17.936e6, 18.408e6;
          2.91e6, 17.784e6, 17.024e6, 17.472e6; 3.395e6, 17.16e6, 16.416e6,
          16.848e6; 3.88e6, 16.38e6, 15.96e6, 16.38e6; 4.365e6, 16.224e6,
          15.58e6, 15.99e6; 4.85e6, 16.224e6, 15.2e6, 15.6e6]
        "table for HI_iso=h(ZLPout_iso,Tsync)";
      ThermoPower.Gas.GTunit GTunit(
        pstart=0.999e5,
        HH=42.53e6,
        Tstart=280.55,
        constantCompositionExhaust=true,
        tableHI=tabHI,
        tablePR=tabPR,
        tableW=tabW,
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix) annotation (
         Placement(transformation(extent={{-72,-20},{-32,20}}, rotation=0)));
      ThermoPower.Gas.SourcePressure
                              SourceP1(
        redeclare package Medium = ThermoPower.Media.Air,
        p0=0.999e5,
        T=280.55) annotation (Placement(transformation(extent={{-100,-4},{-80,
                16}}, rotation=0)));
      ThermoPower.Gas.SinkPressure
                            SinkP1(
        redeclare package Medium = ThermoPower.Media.FlueGas,
        p0=1e5,
        T=526 + 273) annotation (Placement(transformation(extent={{-22,20},{-2,
                40}}, rotation=0)));
      ThermoPower.Gas.SourceMassFlow
                              SourceW1(
        redeclare package Medium = ThermoPower.Media.NaturalGas,
        T=291.44,
        p0=12.5e5,
        w0=0.365) annotation (Placement(transformation(extent={{-80,20},{-60,40}},
              rotation=0)));
      Electrical.Generator Generator(
        Pnom=5e6,                    Np=2, eta=0.98) annotation (Placement(
            transformation(extent={{32,-10},{52,10}}, rotation=0)));
      Electrical.Breaker Breaker(Pnom=5e6)
                                 annotation (Placement(transformation(extent={{
                56,-10},{76,10}}, rotation=0)));
      Electrical.Grid Grid(Pgrid=1e9)
                                   annotation (Placement(transformation(extent=
                {{80,-10},{100,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Components.IdealGear IdealGear1(ratio=(
            17372/60)/25, useSupport=false) annotation (Placement(
            transformation(extent={{6,-10},{26,10}}, rotation=0)));
      Modelica.Blocks.Sources.BooleanStep BooleanStep1(startTime=1, startValue=
            true) annotation (Placement(transformation(extent={{40,20},{60,40}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceW1.flange, GTunit.Fuel_in) annotation (Line(
          points={{-60,30},{-52,30},{-52,14.4}},
          color={159,159,223},
          thickness=0.5));
      connect(SourceP1.flange, GTunit.Air_in) annotation (Line(
          points={{-80,6},{-70,6}},
          color={159,159,223},
          thickness=0.5));
      connect(GTunit.FlueGas_out, SinkP1.flange) annotation (Line(
          points={{-34,6},{-27.6,6},{-27.6,30},{-22,30}},
          color={159,159,223},
          thickness=0.5));
      connect(IdealGear1.flange_b, Generator.shaft) annotation (Line(
          points={{26,0},{30,0},{30,1.77636e-016},{33.4,1.77636e-016}},
          color={0,0,0},
          thickness=0.5));
      connect(BooleanStep1.y, Breaker.closed)
        annotation (Line(points={{61,30},{66,30},{66,8}}, color={255,0,255}));
      connect(Generator.port, Breaker.port_a) annotation (Line(
          points={{50.6,0},{57.4,0}},
          color={0,0,255},
          thickness=0.5));
      connect(Breaker.port_b, Grid.port) annotation (Line(
          points={{74.6,0},{81.4,0}},
          color={0,0,255},
          thickness=0.5));

      connect(GTunit.shaft_b, IdealGear1.flange_a)
        annotation (Line(points={{-32.4,0},{6,0}}, color={0,0,0}));
      annotation (experiment(StopTime=2), Documentation(info="<html>
This model tests a simple power plant based on a <tt>GTunit</tt>.

<p>Simulate for 2 s. The plant starts at steady states, and produces approximately 5 MW of power. At time t=1 the breaker opens, and the GT unit starts accelerating, with a time constant of 10 seconds.

</html>"));
    end TestGT;

    model TestFanMech
      extends Modelica.Icons.Example;

      Gas.FanMech FanMech1(
        redeclare package Medium = Modelica.Media.Air.SimpleAir,
        rho0=1.23,
        n0=590,
        bladePos0=0.8,
        redeclare function flowCharacteristic = flowChar,
        q_single_start=144,
        w0=144,
        dp0=6000) annotation (Placement(transformation(extent={{-70,-24},{-30,
                16}}, rotation=0)));
      Gas.SinkPressure
                SinkP1(redeclare package Medium = Modelica.Media.Air.SimpleAir)
        annotation (Placement(transformation(extent={{0,20},{20,40}}, rotation=
                0)));
      Gas.SourcePressure
                  SourceP1(redeclare package Medium =
            Modelica.Media.Air.SimpleAir) annotation (Placement(transformation(
              extent={{-98,-10},{-78,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sources.ConstantSpeed ConstantSpeed1(
          w_fixed=Modelica.SIunits.Conversions.from_rpm(590), useSupport=false)
        annotation (Placement(transformation(extent={{90,-10},{70,10}},
              rotation=0)));
      function flowChar = Functions.FanCharacteristics.quadraticFlowBlades (
          bladePos_nom={0.30,0.35,0.40,0.45,0.50,0.55,0.60,0.65,0.70,0.75,0.80,
              0.85},
          q_nom=[0, 0, 100, 300, 470, 620, 760, 900, 1000, 1100, 1300, 1500; 70,
              125, 310, 470, 640, 820, 1000, 1200, 1400, 1570, 1700, 1900; 100,
              200, 370, 530, 700, 900, 1100, 1300, 1500, 1750, 2000, 2300],
          H_nom=[3100, 3800, 3700, 3850, 4200, 4350, 4700, 4900, 5300, 5600,
              5850, 6200; 2000, 3000, 3000, 3000, 3000, 3200, 3200, 3300, 3600,
              4200, 5000, 5500; 1000, 2000, 2000, 2000, 2000, 1750, 1750, 2000,
              2350, 2500, 2850, 3200]);
      Modelica.Blocks.Sources.Ramp Ramp1(
        startTime=1,
        height=0.55,
        duration=9,
        offset=0.30) annotation (Placement(transformation(extent={{-100,40},{-80,
                60}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        startTime=15,
        height=-1,
        offset=1) annotation (Placement(transformation(extent={{-30,54},{-10,74}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Components.Inertia Inertia1(w(start=
              Modelica.SIunits.Conversions.from_rpm(590)), J=10000,
        phi(fixed=true, start=0))                                   annotation (
         Placement(transformation(extent={{-20,-10},{0,10}}, rotation=0)));
      Gas.PressDrop PressDrop1(
        wnom=2000*1.229,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        rhonom=1.229,
        redeclare package Medium = Modelica.Media.Air.SimpleAir,
        dpnom=6000) annotation (Placement(transformation(extent={{-30,20},{-10,
                40}}, rotation=0)));
      Modelica.Mechanics.Rotational.Components.Clutch Clutch1(fn_max=1e6,
        phi_rel(fixed=true),
        w_rel(fixed=true))
        annotation (Placement(transformation(extent={{30,-10},{50,10}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SourceP1.flange, FanMech1.infl) annotation (Line(
          points={{-78,0},{-78,0.4},{-66,0.4}},
          color={159,159,223},
          thickness=0.5));
      connect(Ramp1.y, FanMech1.in_bladePos) annotation (Line(points={{-79,50},
              {-58,50},{-58,11.2}}, color={0,0,127}));
      connect(FanMech1.MechPort, Inertia1.flange_a) annotation (Line(
          points={{-31.4,0.2},{-26.425,0.2},{-26.425,0},{-20,0}},
          color={0,0,0},
          thickness=0.5));
      connect(PressDrop1.outlet, SinkP1.flange) annotation (Line(
          points={{-10,30},{0,30}},
          color={159,159,223},
          thickness=0.5));
      connect(FanMech1.outfl, PressDrop1.inlet) annotation (Line(
          points={{-38,10.4},{-40.4,10.4},{-40.4,30},{-30,30}},
          color={159,159,223},
          thickness=0.5));
      connect(Inertia1.flange_b, Clutch1.flange_a) annotation (Line(
          points={{0,0},{30,0}},
          color={0,0,0},
          thickness=0.5));
      connect(Clutch1.flange_b, ConstantSpeed1.flange) annotation (Line(
          points={{50,0},{70,0}},
          color={0,0,0},
          thickness=0.5));
      connect(Step1.y, Clutch1.f_normalized)
        annotation (Line(points={{-9,64},{40,64},{40,11}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=50, Algorithm="Dassl"),
        experimentSetupOutput(equdistant=false));
    end TestFanMech;
  end GasComponents;

  package DistributedParameterComponents
    "Tests for thermo-hydraulic distributed parameter components"
    extends Modelica.Icons.ExamplesPackage;

    model TestWaterFlow1DFV_A "Test case for Water.Flow1DFV"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      parameter Integer Nnodes=20 "Number of nodes";
      parameter Modelica.SIunits.Length Lhex=10 "Total length";
      parameter Modelica.SIunits.Diameter Dihex=0.02 "Internal diameter";
      final parameter Modelica.SIunits.Radius rhex=Dihex/2 "Internal radius";
      final parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex
        "Internal perimeter";
      final parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2
        "Internal cross section";
      parameter Real Cfhex=0.005 "Friction coefficient";
      parameter Modelica.SIunits.MassFlowRate whex=0.31
        "Nominal mass flow rate";
      parameter Modelica.SIunits.Pressure phex=2e5 "Initial pressure";
      parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5
        "Initial inlet specific enthalpy";
      parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5
        "Initial outlet specific enthalpy";
      parameter Modelica.SIunits.SpecificEnthalpy deltah=41800
        "Height of enthalpy step";
      parameter Modelica.SIunits.EnergyFlowRate W=41800*whex
        "Height of power step";

      SI.Time tau "Transport time delay";
      ThermoPower.Water.SourceMassFlow fluidSource(
        p0=phex,
        h=hinhex,
        w0=whex,
        use_in_w0=true,
        use_in_h=true,
        redeclare package Medium = Medium)
                 annotation (Placement(transformation(extent={{-78,-10},{-58,10}},
              rotation=0)));
      ThermoPower.Water.SinkPressure fluidSink(p0=phex/2, redeclare package
          Medium = Medium)                          annotation (Placement(
            transformation(extent={{70,-10},{90,10}}, rotation=0)));
      ThermoPower.Water.ValveLin valve(Kv=3e-6, redeclare package Medium =
            Medium)                             annotation (Placement(
            transformation(extent={{10,-10},{30,10}}, rotation=0)));
      Water.Flow1DFV
                   hex(
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
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        pstart=phex,
        dpnom=1000,
        redeclare package Medium = Medium)
                    annotation (Placement(transformation(extent={{-20,-10},{0,
                10}}, rotation=0)));
      ThermoPower.Water.SensT T_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-50,-6},{-30,14}},
              rotation=0)));
      Thermal.HeatSource1DFV heatSource(Nw=Nnodes - 1)
                        annotation (Placement(transformation(extent={{-20,22},{
                0,42}}, rotation=0)));
      Modelica.Blocks.Sources.Step MassFlowRate(
        offset=whex,
        startTime=50,
        height=-0.03) annotation (Placement(transformation(extent={{-98,28},{-78,
                48}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{-10,60},{10,80}}, rotation=0)));
      Modelica.Blocks.Sources.Step InSpecEnthalpy(
        height=deltah,
        offset=hinhex,
        startTime=1) annotation (Placement(transformation(extent={{-90,60},{-70,
                80}}, rotation=0)));
      Modelica.Blocks.Sources.Step ExtPower(height=W, startTime=30) annotation (
         Placement(transformation(extent={{-40,40},{-20,60}}, rotation=0)));
      ThermoPower.Water.SensT T_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{40,-6},{60,14}}, rotation=
               0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      tau = sum(hex.rho)/Nnodes*Lhex*Ahex/whex;
      connect(hex.outfl,valve. inlet) annotation (Line(
          points={{0,0},{6,0},{10,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(T_in.outlet, hex.infl) annotation (Line(
          points={{-34,0},{-28,0},{-20,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(fluidSource.flange, T_in.inlet)  annotation (Line(
          points={{-58,0},{-46,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(heatSource.wall, hex.wall)
        annotation (Line(points={{-10,29},{-10,5}}, color={255,127,0}));
      connect(T_out.outlet, fluidSink.flange)  annotation (Line(
          points={{56,0},{70,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(valve.outlet, T_out.inlet) annotation (Line(
          points={{30,0},{44,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(MassFlowRate.y, fluidSource.in_w0)
        annotation (Line(points={{-77,38},{-72,38},{-72,6}}, color={0,0,127}));
      connect(InSpecEnthalpy.y, fluidSource.in_h)
        annotation (Line(points={{-69,70},{-64,70},{-64,6}}, color={0,0,127}));
      connect(ExtPower.y, heatSource.power)    annotation (Line(points={{-19,50},
              {-10,50},{-10,36}}, color={0,0,127}));
      connect(Constant1.y,valve. cmd)
        annotation (Line(points={{11,70},{20,70},{20,8}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
        experiment(StopTime=80, Tolerance=1e-006),
        Documentation(info="<html>
<p>The model is designed to test the component <code>Water.Flow1DFV</code> (fluid side of a heat exchanger, finite volumes).</p>
<p>This model represent the fluid side of a heat exchanger with an applied external heat flow. The operating fluid is liquid water.</p>
<p>During the simulation, the inlet specific enthalpy, heat flux and mass flow rate are changed. The outlet temperature can be predicted analytically assuming incompressible flow and constant cp.</p>
<p><ul>
<li>t=0 s, Step variation of the specific enthalpy of the fluid entering the heat exchanger. The outlet temperature should undergo a step increase of 10 degrees 10 s later. </li>
<li>t=30 s, Step variation of the thermal flow entering the heat exchanger lateral surface. The outlet temperature should undergo a ramp increase of 10 degrees lasting 10 s </li>
<li>t=50 s, Step reduction of the mass flow rate entering the heat exchanger. The outlet temperature should undergo a ramp change of one degree lasting 10s</li>
</ul></p>
<p>Simulation Interval = [0...80] sec </p>
<p>Integration Algorithm = DASSL </p>
<p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<p><ul>
<li>12 Sep 2013 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br/>Updated to new FV structure. Updated parameters.</li></li>
<li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br/>First release.</li>
</ul></p>
</html>"));
    end TestWaterFlow1DFV_A;

    model TestWaterFlow1DFV_B "Test case for Water.Flow1DFV"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      parameter Integer Nnodes=10 "Number of nodes";
      parameter Integer Nt = 5 "Number of tubes";
      parameter Modelica.SIunits.Length Lhex=2 "Total length";
      parameter Modelica.SIunits.Diameter Dihex=0.02 "Internal diameter";
      final parameter Modelica.SIunits.Radius rhex=Dihex/2 "Internal radius";
      final parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex
        "Internal perimeter";
      final parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2
        "Internal cross section";
      parameter Real Cfhex=0.005 "Friction coefficient";
      parameter Modelica.SIunits.MassFlowRate whex=0.31
        "Nominal mass flow rate";
      parameter Modelica.SIunits.Pressure phex=3e5 "Initial pressure";
      parameter Modelica.SIunits.SpecificEnthalpy hs=1e5
        "Initial inlet specific enthalpy";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma = 1500
        "Fixed heat transfer coefficient";
      Real cp = Medium.specificHeatCapacityCp(hex.fluidState[1]);
      Real NTU = (Nt*Lhex*Dihex*3.1415*gamma)/(whex*Medium.specificHeatCapacityCp(hex.fluidState[1]))
        "Number of heat transfer units";
      Real alpha = 1-exp(-NTU)
        "Steady state gain of outlet temperature vs. external temperature";

      Water.ValveLin valve(Kv=2*whex/phex)      annotation (
          Placement(transformation(extent={{14,-22},{34,-2}}, rotation=0)));
      Water.SourceMassFlow fluidSource(
        w0=whex,
        p0=phex,
        h=hs) annotation (Placement(transformation(extent={{-86,-22},{-66,-2}},
              rotation=0)));
      Water.SinkPressure      fluidSink(p0=phex/2, h=hs) annotation (Placement(
            transformation(extent={{74,-22},{94,-2}}, rotation=0)));
      Modelica.Blocks.Sources.Step Temperature(
        height=10,
        startTime=10,
        offset=296.9) annotation (Placement(transformation(extent={{-82,34},{-62,54}},
                      rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{-12,56},{8,76}},  rotation=0)));
      Water.SensT T_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-56,-18},{-36,2}},
              rotation=0)));
      Water.SensT T_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{44,-18},{64,2}}, rotation=
               0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Thermal.TempSource1DFV tempSource(Nw=Nnodes - 1)
        annotation (Placement(transformation(extent={{-22,14},{-2,34}})));
      Water.Flow1DFV hex(
        redeclare package Medium = Medium,
        N=Nnodes,
        L=Lhex,
        A=Ahex,
        omega=omegahex,
        Dhyd=Dihex,
        wnom=whex,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        Cfnom=Cfhex,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Liquid,
        pstart=phex,
        hstartin=hs,
        hstartout=hs,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        redeclare model HeatTransfer =
          ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=gamma),
        Nt=Nt,
        dpnom=1000)
        annotation (Placement(transformation(extent={{-22,-22},{-2,-2}})));
    equation
      connect(T_in.inlet,fluidSource. flange) annotation (Line(
          points={{-52,-12},{-60,-12},{-66,-12}},
          thickness=0.5,
          color={0,0,255}));
      connect(valve.outlet, T_out.inlet)     annotation (Line(
          points={{34,-12},{48,-12}},
          thickness=0.5,
          color={0,0,255}));
      connect(T_out.outlet,fluidSink. flange) annotation (Line(
          points={{60,-12},{74,-12}},
          thickness=0.5,
          color={0,0,255}));
      connect(Constant1.y, valve.cmd)
        annotation (Line(points={{9,66},{24,66},{24,-4}}, color={0,0,127}));
      connect(T_in.outlet, hex.infl)      annotation (Line(
          points={{-40,-12},{-22,-12}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(hex.outfl, valve.inlet)          annotation (Line(
          points={{-2,-12},{14,-12}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(tempSource.wall, hex.wall)          annotation (Line(
          points={{-12,21},{-12,-7}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(Temperature.y, tempSource.temperature)     annotation (Line(
          points={{-61,44},{-12,44},{-12,28}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(StopTime=40, Tolerance=1e-006),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>The model is designed to test the component <code>Water.Flow1DFV</code> (fluid side of a heat exchanger, finite volumes). </p>
<p>This model represent the fluid side of a heat exchanger with convective exchange with an external source of uniform given temperature. The operating fluid is liquid water. The number of transfer units in the selected operating point is NTU = 0.73. Assuming incompressible fluid and constant cp, when the external temperature is raised at time t = 20 s, the outlet temperature should follow a ramp change, with a duration equal to the residence time of the fluid in the tubes, and an amplitude equal to a fraction exp(-NTU) of the external temperature change.</p>
<p>Simulation Interval = [0...200] sec </p>
<p>Integration Algorithm = DASSL </p>
<p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<p><ul>
<li>18 Sep 2013 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br/>Updated to new FV structure. Updated parameters.</li></li>
<li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br/>First release.</li>
</ul></p>
</html>"));
    end TestWaterFlow1DFV_B;

    model TestWaterFlow1DFV_D "Test case for Water.Flow1DFV"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      parameter Integer Nnodes=5 "number of Nodes";
      parameter Integer Nt = 10 "number of tubes in parallel";
      parameter Modelica.SIunits.Length Lhex=10 "total length";
      parameter Modelica.SIunits.Diameter Dihex=0.02 "internal diameter";
      parameter Modelica.SIunits.Radius rhex=Dihex/2 "internal radius";
      parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex
        "internal perimeter";
      parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2
        "internal cross section";
      parameter Real Cfhex=0.005 "friction coefficient";
      parameter Modelica.SIunits.MassFlowRate whex=1e-2
        "nominal mass flow rate";
      parameter Modelica.SIunits.Pressure phex=0.2e5 "initial pressure";
      parameter Modelica.SIunits.SpecificEnthalpy hs=2.971e6
        "initial specific enthalpy";
      Real gamma = Medium.specificHeatCapacityCp(hex.fluidState[1])/Medium.specificHeatCapacityCv(hex.fluidState[1]) "cp/cv";
      Real dMtot_dp = hex.Mtot/(hex.p*gamma) "compressibility";
      Real dw_dp = valve.Kv "sensitivity of valve flow to pressure";
      SI.Time tau = dMtot_dp/dw_dp "time constant of pressure transient";

      Water.Flow1DFV
                   hex(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hs,
        hstartout=hs,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        pstart=phex,
        Nt=Nt,
        dpnom=1000) annotation (Placement(transformation(extent={{-20,-10},{0,
                10}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                MassFlowRateSource(w0=whex, h=hs,
        use_in_w0=true)                                           annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              FluidSink(
        p0=0,
        R=100,
        h=3e6) annotation (Placement(transformation(extent={{70,-10},{90,10}},
              rotation=0)));
      ThermoPower.Water.ValveLin valve(Kv=1e-7)     annotation (Placement(
            transformation(extent={{34,-10},{54,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step MassFlowRateStep(
        height=whex/10,
        offset=whex,
        startTime=1)   annotation (Placement(transformation(extent={{-90,30},{-70,
                50}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{8,60},{28,80}}, rotation=0)));
      Thermal.HeatSource1DFV heatSource(Nw=Nnodes - 1)
                        annotation (Placement(transformation(extent={{-20,20},{
                0,40}}, rotation=0)));
      Modelica.Blocks.Sources.Constant ExtPower(k=0) annotation (Placement(
            transformation(extent={{-50,60},{-30,80}}, rotation=0)));
      Water.SensP sensP annotation (Placement(transformation(extent={{10,14},{
                30,34}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(valve.inlet, hex.outfl)     annotation (Line(
          points={{34,0},{0,0}},
          color={0,0,255},
          thickness=0.5));
      connect(valve.outlet, FluidSink.flange)     annotation (Line(
          points={{54,0},{70,0}},
          color={0,0,255},
          thickness=0.5));
      connect(MassFlowRateSource.flange, hex.infl) annotation (Line(
          points={{-40,0},{-20,0}},
          color={0,0,255},
          thickness=0.5));
      connect(heatSource.wall, hex.wall)
        annotation (Line(points={{-10,27},{-10,5}}, color={255,127,0}));
      connect(sensP.flange, valve.inlet)
        annotation (Line(points={{20,20},{20,12},{34,12},{34,0}}));
      connect(Constant1.y, valve.cmd)
        annotation (Line(points={{29,70},{44,70},{44,8}}, color={0,0,127}));
      connect(ExtPower.y, heatSource.power)    annotation (Line(points={{-29,70},
              {-10,70},{-10,34}}, color={0,0,127}));
      connect(MassFlowRateStep.y, MassFlowRateSource.in_w0)
        annotation (Line(points={{-69,40},{-54,40},{-54,6}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}),
                graphics),
        experiment(StopTime=6, Tolerance=1e-006),
        Documentation(info="<html>
<p>The model is designed to test the component <code>Water.Flow1DFV</code> (fluid side of a heat exchanger, finite volumes).</p><p>This model is designed to the test compressibility effects. The operating fluid is superheated vapour; the heat flow entering the heat exchanger is set to zero. </p><p>At time t = 1 the inlet flow rate undergoes a step increase; the pressure follows a first order transient with time constant tau. </p>
<p>Simulation Interval = [0...6] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<p><ul>
<li>18 Sep 2013 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br/>Updated to new FV structure. Updated parameters.</li></li>
<li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br/>First release.</li>
</ul></p>
</html>"),
        __Dymola_experimentSetupOutput);
    end TestWaterFlow1DFV_D;

    model TestWaterFlow1DFV_E "Test case for Water.Flow1DFV"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      parameter Integer Nnodes=20 "number of nodes";
      parameter Modelica.SIunits.Length Lhex=200 "total length";
      parameter Modelica.SIunits.Diameter Dihex=0.02
        "diameter of internal tube";
      parameter Modelica.SIunits.Diameter Dehex=0.04
        "diameter of external tube";
      parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex
        "wet perimeter of the tube interface";
      parameter Modelica.SIunits.Area Aint=Modelica.Constants.pi*Dihex^2/4
        "cross section of internal tube";
      parameter Modelica.SIunits.Area Aext=Modelica.Constants.pi*Dehex^2/4 - Aint
        "cross section of external tube";
      parameter Real Cfhex=0.005 "friction coefficient";
      parameter Modelica.SIunits.MassFlowRate whex=0.31
        "nominal (and initial) mass flow rate";
      parameter Modelica.SIunits.Pressure phex=3e5 "initial pressure";
      parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5
        "initial inlet specific enthalpy";
      parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5
        "initial outlet specific enthalpy";

      Water.SinkPressure      SideA_FluidSink annotation (Placement(
            transformation(extent={{74,-82},{94,-62}}, rotation=0)));
      Water.SinkPressure      SideB_FluidSink annotation (Placement(
            transformation(extent={{-76,18},{-96,38}},  rotation=0)));
      Water.SourceMassFlow      SideA_MassFlowRate(w0=whex,
        p0=300000,
        use_in_h=true)                                              annotation (
         Placement(transformation(extent={{-70,-82},{-50,-62}}, rotation=0)));
      Water.ValveLin             ValveLin1(Kv=whex/(2e5)) annotation (Placement(
            transformation(extent={{18,-82},{38,-62}}, rotation=0)));
      Water.ValveLin             ValveLin2(Kv=whex/(2e5)) annotation (Placement(
            transformation(extent={{-26,18},{-46,38}}, rotation=0)));
      Water.SensT             SensT_A_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-46,-78},{-26,-58}},
              rotation=0)));
      Modelica.Blocks.Sources.Step SideA_InSpecEnth(
        height=1e5,
        offset=1e5,
        startTime=50) annotation (Placement(transformation(extent={{-86,-32},{-66,-12}},
                     rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{-66,58},{-46,78}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant2(k=1)
                                                 annotation (Placement(
            transformation(extent={{4,-32},{24,-12}},
                                                    rotation=0)));
      Water.SensT             SensT_B_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{34,22},{14,42}}, rotation=
               0)));
      Water.SourceMassFlow      SideB_MassFlowRate(w0=whex, p0=3e5) annotation (
         Placement(transformation(extent={{64,18},{44,38}}, rotation=0)));
      Water.SensT             SensT_A_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{44,-78},{64,-58}},
              rotation=0)));
      Water.SensT             SensT_B_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-50,22},{-70,42}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Water.Flow1DFV hexFVb(
        N=Nnodes,
        Nt=1,
        L=Lhex,
        wnom=whex,
        hstartin=hinhex,
        hstartout=houthex,
        redeclare package Medium = Medium,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        pstart=phex,
        redeclare model HeatTransfer =
          ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=800),
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
        A=Aext,
        omega=omegahex)
                     annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-8,28})));
      Water.Flow1DFV hexFVa(
        N=Nnodes,
        L=Lhex,
        Dhyd=Dihex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hinhex,
        hstartout=houthex,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        pstart=phex,
        redeclare model HeatTransfer =
          ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=800),
        A=Aint,
        omega=omegahex,
        dpnom=1000)
        annotation (Placement(transformation(extent={{-18,-82},{2,-62}})));
      Thermal.CounterCurrentFV counterCurrentFV(Nw=Nnodes-1)
        annotation (Placement(transformation(extent={{-18,-30},{2,-10}})));
    equation
      connect(SideA_MassFlowRate.flange,SensT_A_in. inlet) annotation (Line(
          points={{-50,-72},{-42,-72}},
          thickness=0.5,
          color={0,0,255}));
      connect(SideB_MassFlowRate.flange,SensT_B_in. inlet) annotation (Line(
          points={{44,28},{30,28}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveLin1.outlet,SensT_A_out. inlet) annotation (Line(
          points={{38,-72},{48,-72}},
          thickness=0.5,
          color={0,0,255}));
      connect(SensT_A_out.outlet,SideA_FluidSink. flange) annotation (Line(
          points={{60,-72},{74,-72}},
          thickness=0.5,
          color={0,0,255}));
      connect(SensT_B_out.outlet,SideB_FluidSink. flange) annotation (Line(
          points={{-66,28},{-76,28}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_B_out.inlet,ValveLin2. outlet) annotation (Line(
          points={{-54,28},{-46,28}},
          thickness=0.5,
          color={0,0,255}));
      connect(SideA_InSpecEnth.y,SideA_MassFlowRate. in_h) annotation (Line(
            points={{-65,-22},{-56,-22},{-56,-66}}, color={0,0,127}));
      connect(Constant2.y,ValveLin1. cmd) annotation (Line(points={{25,-22},{28,-22},
              {28,-64}},      color={0,0,127}));
      connect(Constant1.y,ValveLin2. cmd) annotation (Line(points={{-45,68},{-36,68},
              {-36,36}},     color={0,0,127}));
      connect(ValveLin2.inlet,hexFVb. outfl)
                                           annotation (Line(
          points={{-26,28},{-18,28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(hexFVb.infl, SensT_B_in.outlet)
                                            annotation (Line(
          points={{2,28},{18,28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(SensT_A_in.outlet,hexFVa. infl)
                                            annotation (Line(
          points={{-30,-72},{-18,-72}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(hexFVa.outfl, ValveLin1.inlet)
                                           annotation (Line(
          points={{2,-72},{18,-72}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(counterCurrentFV.side1, hexFVb.wall) annotation (Line(
          points={{-8,-17},{-8,23}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(counterCurrentFV.side2, hexFVa.wall) annotation (Line(
          points={{-8,-23.1},{-8,-67}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(StopTime=1200, Tolerance=1e-006),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>The model is designed to test the component <code>Water.Flow1DFV</code> (fluid side of a heat exchanger, model uses finite volumes).</p><p>This model represent the two fluid sides of a heat exchanger made by two concentric tubes in counterflow configuration. The thickness of the wall separating the two tubes is negligible. The operating fluid is liquid water. The mass flow rate during the experiment and initial conditions are the same for the two sides. </p><p>During the simulation, the inlet specific enthalpy for hexA (&QUOT;hot side&QUOT;) is changed at time t = 50 s. The outlet temperature of the hot side starts changing after the fluid transport time delay, while the outlet temperature of the cold side starts changing immediately. </p>
<p>Simulation Interval = [0...1200] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<ul>
    <li>18 Sep 2013 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br/>Updated to new FV structure. Updated parameters.</li></li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
    end TestWaterFlow1DFV_E;

    model TestWaterFlow1DFV_F "Test case for Water.Flow1DFV"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      parameter Integer Nnodes=20 "number of nodes";
      parameter Modelica.SIunits.Length Lhex=200 "total length";
      parameter Modelica.SIunits.Diameter Dihex=0.02
        "diameter of internal tube";
      parameter Modelica.SIunits.Diameter Dehex= 0.04
        "diameter of external tube";
      parameter Modelica.SIunits.Length th = 0.002 "tube wall thickness";
      parameter Modelica.SIunits.Radius rint=Dihex/2
        "internal radius tube walls";
      parameter Modelica.SIunits.Radius rext=rint+th
        "internal radius tube walls";
      parameter Modelica.SIunits.Length omegaint=Modelica.Constants.pi*Dihex
        "wet perimeter internal tube";
      parameter Modelica.SIunits.Length omegaext=Modelica.Constants.pi*(Dihex+2*th)
        "wet perimeter internal tube";
      parameter Modelica.SIunits.Area Aint=Modelica.Constants.pi*rint^2;
      parameter Modelica.SIunits.Area Aext=Modelica.Constants.pi*Dehex^2/4 -
                                           Modelica.Constants.pi*rext^2;
      parameter Real Cfhex=0.005 "friction coefficient";
      parameter Modelica.SIunits.MassFlowRate whex=0.31
        "nominal (and initial) mass flow rate";
      parameter Modelica.SIunits.Pressure phex=3e5 "initial pressure";
      parameter Modelica.SIunits.SpecificEnthalpy hinhex=1e5
        "initial inlet specific enthalpy";
      parameter Modelica.SIunits.SpecificEnthalpy houthex=1e5
        "initial outlet specific enthalpy";

      Water.SinkPressure      SideA_FluidSink annotation (Placement(
            transformation(extent={{74,-82},{94,-62}}, rotation=0)));
      Water.SinkPressure      SideB_FluidSink annotation (Placement(
            transformation(extent={{-76,18},{-96,38}},  rotation=0)));
      Water.SourceMassFlow      SideA_MassFlowRate(w0=whex,
        p0=300000,
        use_in_h=true)                                              annotation (
         Placement(transformation(extent={{-70,-82},{-50,-62}}, rotation=0)));
      Water.ValveLin             ValveLin1(Kv=whex/(2e5)) annotation (Placement(
            transformation(extent={{18,-82},{38,-62}}, rotation=0)));
      Water.ValveLin             ValveLin2(Kv=whex/(2e5)) annotation (Placement(
            transformation(extent={{-26,18},{-46,38}}, rotation=0)));
      Water.SensT             SensT_A_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-46,-78},{-26,-58}},
              rotation=0)));
      Modelica.Blocks.Sources.Step SideA_InSpecEnth(
        height=1e5,
        offset=1e5,
        startTime=50) annotation (Placement(transformation(extent={{-86,-32},{-66,-12}},
                     rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{-66,58},{-46,78}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant2(k=1)
                                                 annotation (Placement(
            transformation(extent={{4,-32},{24,-12}},
                                                    rotation=0)));
      Water.SensT             SensT_B_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{34,22},{14,42}}, rotation=
               0)));
      Water.SourceMassFlow      SideB_MassFlowRate(w0=whex, p0=3e5) annotation (
         Placement(transformation(extent={{64,18},{44,38}}, rotation=0)));
      Water.SensT             SensT_A_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{44,-78},{64,-58}},
              rotation=0)));
      Water.SensT             SensT_B_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-50,22},{-70,42}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Water.Flow1DFV hexFVb(
        Nt=1,
        L=Lhex,
        wnom=whex,
        hstartin=hinhex,
        hstartout=houthex,
        redeclare package Medium = Medium,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        pstart=phex,
        redeclare model HeatTransfer =
          ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=800),
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
        A=Aext,
        omega=omegaext,
        Dhyd=Dehex,
        N=Nnodes)    annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-8,28})));
      Water.Flow1DFV hexFVa(
        N=Nnodes,
        L=Lhex,
        Dhyd=Dihex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hinhex,
        hstartout=houthex,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        pstart=phex,
        redeclare model HeatTransfer =
          ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient(gamma=800),
        omega=omegaint,
        A=Aint,
        dpnom=1000)
        annotation (Placement(transformation(extent={{-18,-82},{2,-62}})));
      Thermal.CounterCurrentFV counterCurrentFV(Nw=Nnodes - 1)
        annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
      Thermal.MetalTubeFV metalTubeFV(
        Nw=Nnodes - 1,
        L=Lhex,
        rint=rint,
        rext=rext,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        lambda=20,
        rhomcm=7800*500)
        annotation (Placement(transformation(extent={{-18,-20},{2,-40}})));
    equation
      connect(SideA_MassFlowRate.flange,SensT_A_in. inlet) annotation (Line(
          points={{-50,-72},{-42,-72}},
          thickness=0.5,
          color={0,0,255}));
      connect(SideB_MassFlowRate.flange,SensT_B_in. inlet) annotation (Line(
          points={{44,28},{30,28}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveLin1.outlet,SensT_A_out. inlet) annotation (Line(
          points={{38,-72},{48,-72}},
          thickness=0.5,
          color={0,0,255}));
      connect(SensT_A_out.outlet,SideA_FluidSink. flange) annotation (Line(
          points={{60,-72},{74,-72}},
          thickness=0.5,
          color={0,0,255}));
      connect(SensT_B_out.outlet,SideB_FluidSink. flange) annotation (Line(
          points={{-66,28},{-76,28}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_B_out.inlet,ValveLin2. outlet) annotation (Line(
          points={{-54,28},{-46,28}},
          thickness=0.5,
          color={0,0,255}));
      connect(SideA_InSpecEnth.y,SideA_MassFlowRate. in_h) annotation (Line(
            points={{-65,-22},{-56,-22},{-56,-66}}, color={0,0,127}));
      connect(Constant2.y,ValveLin1. cmd) annotation (Line(points={{25,-22},{28,-22},
              {28,-64}},      color={0,0,127}));
      connect(Constant1.y,ValveLin2. cmd) annotation (Line(points={{-45,68},{-36,68},
              {-36,36}},     color={0,0,127}));
      connect(ValveLin2.inlet,hexFVb. outfl)
                                           annotation (Line(
          points={{-26,28},{-18,28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(hexFVb.infl, SensT_B_in.outlet)
                                            annotation (Line(
          points={{2,28},{18,28}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(SensT_A_in.outlet,hexFVa. infl)
                                            annotation (Line(
          points={{-30,-72},{-18,-72}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(hexFVa.outfl, ValveLin1.inlet)
                                           annotation (Line(
          points={{2,-72},{18,-72}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(counterCurrentFV.side1, hexFVb.wall) annotation (Line(
          points={{-8,3},{-8,23}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(counterCurrentFV.side2, metalTubeFV.ext) annotation (Line(
          points={{-8,-3.1},{-8,-26.9}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(metalTubeFV.int, hexFVa.wall) annotation (Line(
          points={{-8,-33},{-8,-67}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(StopTime=1200, Tolerance=1e-006),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>The model is designed to test the component <code>Water.Flow1DFV</code> (fluid side of a heat exchanger, model uses finite volumes).</p><p>This model represent the two fluid sides of a heat exchanger made by two concentric tubes in counterflow configuration. The thickness of the wall separating the two tubes is negligible. The operating fluid is liquid water. The mass flow rate during the experiment and initial conditions are the same for the two sides. </p><p>During the simulation, the inlet specific enthalpy for hexA (&QUOT;hot side&QUOT;) is changed at time t = 50 s. The outlet temperature of the hot side starts changing after the fluid transport time delay, while the outlet temperature of the cold side starts changing immediately. </p>
<p>Simulation Interval = [0...1200] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<ul>
    <li>18 Sep 2013 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br/>Updated to new FV structure. Updated parameters.</li></li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
    end TestWaterFlow1DFV_F;

    model TestWaterFlow1DFV_DB
      "Test case for Water.Flow1DFV with Dittus-Boelter heat transfer"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      parameter Integer Nnodes=10 "number of Nodes";
      parameter Modelica.SIunits.Length Lhex=10 "total length";
      parameter Modelica.SIunits.Diameter Dihex=0.02 "internal diameter";
      parameter Modelica.SIunits.Radius rhex=Dihex/2 "internal radius";
      parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex
        "internal perimeter";
      parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2
        "internal cross-section";
      parameter Real Cfhex=0.005 "friction coefficient";
      parameter Modelica.SIunits.MassFlowRate whex=0.31
        "nominal mass flow rate";
      parameter Modelica.SIunits.Pressure phex=3e5 "initial pressure";
      parameter Modelica.SIunits.SpecificEnthalpy hs=1e5
        "initial inlet specific enthalpy";

      Water.Flow1DFV hexFV(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hs,
        hstartout=hs,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        redeclare model HeatTransfer =
          ThermoPower.Thermal.HeatTransferFV.DittusBoelter(useAverageTemperature=true),
        dpnom=1000) annotation (Placement(transformation(extent={{-20,-10},{0,10}},
                      rotation=0)));
      Thermal.TempSource1DFV
                           TempSource(Nw=Nnodes - 1)
                                                annotation (Placement(
            transformation(extent={{-20,18},{0,38}}, rotation=0)));
      Water.ValveLin valve(Kv=2*whex/phex)                 annotation (
          Placement(transformation(extent={{14,-10},{34,10}}, rotation=0)));
      Water.SourceMassFlow      FluidSource(
        w0=whex,
        p0=phex,
        h=hs) annotation (Placement(transformation(extent={{-80,-10},{-60,10}},
              rotation=0)));
      Water.SinkPressure      FluidSink(p0=phex/2, h=hs) annotation (Placement(
            transformation(extent={{70,-10},{90,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step Temperature(
        height=10,
        startTime=10,
        offset=296.95)
                      annotation (Placement(transformation(extent={{-46,38},{-26,58}},
                      rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{0,40},{20,60}},  rotation=0)));
      Water.SensT             T_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-50,-6},{-30,14}},
              rotation=0)));
      Water.SensT             T_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{40,-6},{60,14}}, rotation=
               0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(hexFV.outfl, valve.inlet)   annotation (Line(
          points={{0,0},{14,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(valve.outlet, T_out.inlet)     annotation (Line(
          points={{34,0},{44,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(T_out.outlet,FluidSink. flange) annotation (Line(
          points={{56,0},{70,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(Temperature.y,TempSource. temperature) annotation (Line(points={{-25,48},
              {-10,48},{-10,32}},         color={0,0,127}));
      connect(Constant1.y, valve.cmd)
        annotation (Line(points={{21,50},{24,50},{24,8}}, color={0,0,127}));
      connect(FluidSource.flange,T_in. inlet) annotation (Line(
          points={{-60,0},{-46,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(T_in.outlet, hexFV.infl)
                                     annotation (Line(
          points={{-34,0},{-20,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(TempSource.wall, hexFV.wall) annotation (Line(
          points={{-10,25},{-10,5}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(StopTime=40, Tolerance=1e-006),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>The model is designed to test the component <code>Water.Flow1DFV</code> (fluid side of a heat exchanger, model uses finite volumes), with Dittus-Boelter heat transfer coefficient computation.</p>This model represent the fluid side of a heat exchanger with convective exchange with an external source of uniform given temperature.</p><p>At time t = 10 s, the external temperature is raised.</p>
<p>Simulation Interval = [0...40] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>"));
    end TestWaterFlow1DFV_DB;

    model TestWaterFlow1DFV_A_Fast "Test case for Flow1DFV"
       extends TestWaterFlow1DFV_A(
         redeclare package Medium =
            Modelica.Media.CompressibleLiquids.LinearWater_pT_Ambient);
      // package Medium = Media.LiquidWaterConstant;
    annotation (
        Diagram(graphics),
        experiment(StopTime=80, Tolerance=1e-006),
        Documentation(info="<html>
<p>Same as TestWaterFllow1DFV_A with simpler medium model.</p>
</html>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>First release.</li>
</ul>
</html>"));
    end TestWaterFlow1DFV_A_Fast;

    model TestGasFlow1DFV_A "Test case for Gas.Flow1DFV"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.IdealGases.SingleGases.N2
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      parameter Integer Nnodes=10 "number of Nodes";
      parameter SI.Length Lhex=200 "total length";
      parameter SI.Diameter Dihex=0.02 "internal diameter";
      parameter SI.Radius rhex=Dihex/2 "internal radius";
      parameter SI.Length omegahex=Modelica.Constants.pi*Dihex
        "internal perimeter";
      parameter SI.Area Ahex=Modelica.Constants.pi*rhex^2
        "internal cross section";
      parameter Real Cfhex=0.005 "friction coefficient";
      parameter SI.MassFlowRate whex=0.05
        "nominal (and initial) mass flow rate";
      parameter SI.Pressure phex=3e5 "initial pressure";
      parameter SI.Temperature Tinhex=300 "initial inlet temperature";
      parameter SI.Temperature Touthex=300 "initial outlet temperature";
      // parameter Temperature deltaT=10 "height of temperature step";
      parameter SI.EnergyFlowRate W=500 "height of power step";
      Real gamma = Medium.specificHeatCapacityCp(hex.gas[1].state)/Medium.specificHeatCapacityCv(hex.gas[1].state) "cp/cv";
      Real dMtot_dp = hex.Mtot/(hex.p*gamma) "compressibility";
      Real dw_dp = valve.Kv "sensitivity of valve flow to pressure";
      SI.Time tau = dMtot_dp/dw_dp "time constant of pressure transient";
      SI.Mass Mhex "Mass in the heat exchanger";
      SI.Mass Mbal "Mass resulting from the mass balance";
      SI.Mass Merr(min = -1e9) "Mass balance error";

      Gas.SourceMassFlow Source(
        redeclare package Medium = Medium,
        p0=phex,
        T=Tinhex,
        w0=whex,
        use_in_T=true)
                 annotation (Placement(transformation(extent={{-78,-10},{-58,10}},
              rotation=0)));
      Gas.SinkPressure Sink(
        redeclare package Medium = Medium,
        p0=10000,
        T=300) annotation (Placement(transformation(extent={{78,-10},{98,10}},
              rotation=0)));
      Gas.SensT SensT1(redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{-50,-6},{-30,14}}, rotation=0)));
      Gas.SensT SensT2(redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{50,-6},{70,14}}, rotation=0)));
      Gas.Flow1DFV hex(
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
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        dpnom=1000) annotation (Placement(transformation(extent={{-20,-10},{0,
                10}}, rotation=0)));
      Gas.ValveLin valve(redeclare package Medium = Medium, Kv=whex/phex)
        annotation (Placement(transformation(extent={{20,-10},{40,10}},
              rotation=0)));
      Thermal.HeatSource1DFV heatSource(Nw=Nnodes - 1)
                        annotation (Placement(transformation(extent={{-20,16},{
                0,36}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step1(height=W, startTime=20) annotation (
          Placement(transformation(extent={{-40,40},{-20,60}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step4(
        height=10,
        offset=Tinhex,
        startTime=10) annotation (Placement(transformation(extent={{-100,20},{-80,
                40}}, rotation=0)));
      Modelica.Blocks.Sources.Step Step2(
        height=-0.2,
        offset=1,
        startTime=40) annotation (Placement(transformation(extent={{0,40},{20,
                60}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(Source.flange, SensT1.inlet)   annotation (Line(
          points={{-58,0},{-46,0}},
          color={159,159,223},
          thickness=0.5));
      connect(SensT1.outlet, hex.infl) annotation (Line(
          points={{-34,0},{-20,0}},
          color={159,159,223},
          thickness=0.5));
      connect(hex.outfl, valve.inlet)     annotation (Line(
          points={{0,0},{20,0}},
          color={159,159,223},
          thickness=0.5));
      connect(valve.outlet, SensT2.inlet)     annotation (Line(
          points={{40,0},{54,0}},
          color={159,159,223},
          thickness=0.5));
      connect(SensT2.outlet, Sink.flange)   annotation (Line(
          points={{66,0},{78,0}},
          color={159,159,223},
          thickness=0.5));
      connect(heatSource.wall, hex.wall)
        annotation (Line(points={{-10,23},{-10,5}}, color={255,127,0}));
      connect(Step1.y, heatSource.power)    annotation (Line(points={{-19,50},{
              -10,50},{-10,30}}, color={0,0,127}));
      connect(Step4.y, Source.in_T)
        annotation (Line(points={{-79,30},{-68,30},{-68,5}}, color={0,0,127}));
      connect(Step2.y, valve.cmd)
        annotation (Line(points={{21,50},{30,50},{30,7}}, color={0,0,127}));
      Mhex = hex.M;
      der(Mbal) = hex.infl.m_flow + hex.outfl.m_flow;
      Merr = Mhex - Mbal;
    initial equation
      Mbal = Mhex;

      annotation (
        Diagram(graphics),
        experiment(StopTime=80, Tolerance=1e-006),
        Documentation(info="<html>
<p>The model is designed to test the component <code>Gas.Flow1DFV</code> (fluid side of a heat exchanger, finite volumes). A uniform prescribed heat flux is applied to the lateral boundary. The working fluid is pure nitrogen.</p>
<p>The model starts at steady state. </p>
<p><ul>
<li>At t = 10 s, step variation of the temperature of the fluid entering the heat exchanger. The temperature change is propagated at the outlet with a delay approximately equal to the residence time</li>
<li>At t = 20 s, a thermal power flow W is applied to the heat exchanger lateral surface. The outlet temperature undergoes a ramp change, whose duration is approximately equal to the residence time, and whose amplitude is equal to W/(whex*cp)</li>
<li>At t = 50 s, step reduction of the outlet valve opening</li>
</ul></p>
<p>Simulation Interval = [0...80] sec </p>
<p>Integration Algorithm = DASSL </p>
<p>Algorithm Tolerance = 1e-6 </p>
</html>"),
        __Dymola_experimentSetupOutput);
    end TestGasFlow1DFV_A;

    model TestGasFlow1DFV_B "Test case for Gas.Flow1DFV"
      extends Modelica.Icons.Example;
      extends ThermoPower.Test.DistributedParameterComponents.TestGasFlow1DFV_A(
          redeclare package Medium =
            Modelica.Media.IdealGases.MixtureGases.CombustionAir, Source(
            use_in_X=true));
      parameter Real deltaX[2]={0.05,-0.05} "height of composition step";

      Modelica.Blocks.Sources.Step[2] Step3(
        height=deltaX,
        each startTime=30,
        offset=Medium.reference_X) annotation (Placement(transformation(extent=
                {{-100,60},{-80,80}}, rotation=0)));
    equation
      connect(Step3.y, Source.in_X)
        annotation (Line(points={{-79,70},{-62,70},{-62,5}}, color={0,0,127}));
      annotation (
        experiment(StopTime=80, Tolerance=1e-006),
        Documentation(info="<html>
<p>Same as <code>TestGasFlow1DFV_A</code>, but with mixture fluid (CombustionAir) and UniformComposition = true. The inlet composition is changed stepwise at time t = 30; </p>
</html>"),
        __Dymola_experimentSetupOutput);
    end TestGasFlow1DFV_B;

    model TestGasFlow1DFV_C "Test case for Gas.Flow1DFV"
      extends ThermoPower.Test.DistributedParameterComponents.TestGasFlow1DFV_B(
          hex(UniformComposition=false));
      annotation (
        experiment(StopTime=80, Tolerance=1e-006),
        Documentation(info="<html>
<p>Same as <code>TestGasFlow1D_B</code>, but with UniformComposition = false. The outlet composition transient is computed with greater accuracy. </p>
</html>"));
    end TestGasFlow1DFV_C;

    model TestGasFlow1DFV_D "Test case for Gas.Flow1DFV"
      extends ThermoPower.Test.DistributedParameterComponents.TestGasFlow1DFV_B(
          hex(QuasiStatic=true));
      annotation (Documentation(info="<html>
<p>Same as <code>TestGasFlow1D_B</code>, but with QuasiStatic = true; the model is purely algebraic (no mass and energy storage). </p>
</html>"));
    end TestGasFlow1DFV_D;

    model TestWaterFlow1DFEM_A "Test case for Flow1DFEM"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      // number of Nodes
      parameter Integer Nnodes=12;
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

      ThermoPower.Water.SourceMassFlow Fluid_Source(
        redeclare package Medium = Medium,
        p0=phex,
        h=hinhex,
        w0=whex,
        use_in_w0=true,
        use_in_h=true)
                 annotation (Placement(transformation(extent={{-76,-10},{-56,10}},
              rotation=0)));
      ThermoPower.Water.SinkPressure Fluid_Sink(
        p0=phex/2,
        redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{64,-10},{84,10}}, rotation=0)));
      ThermoPower.Water.ValveLin Valve(
        Kv=3e-6,
        redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{12,-10},{32,10}}, rotation=0)));
      Water.Flow1DFEM hex(
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
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        dpnom=10000)                                          annotation (
          Placement(transformation(extent={{-20,-10},{0,10}}, rotation=0)));
      ThermoPower.Water.SensT T_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-48,-6},{-28,14}},
              rotation=0)));
      Thermal.HeatSource1DFEM HeatSource1D1(
        N=Nnodes,
        L=Lhex,
        omega=omegahex) annotation (Placement(transformation(extent={{-20,22},{
                0,42}}, rotation=0)));
      Modelica.Blocks.Sources.Step MassFlowRate(
        height=-0.02,
        offset=whex,
        startTime=50) annotation (Placement(transformation(extent={{-94,20},{-74,
                40}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{-10,60},{10,80}}, rotation=0)));
      Modelica.Blocks.Sources.Step InSpecEnthalpy(
        height=deltah,
        offset=hinhex,
        startTime=1) annotation (Placement(transformation(extent={{-94,50},{-74,
                70}}, rotation=0)));
      Modelica.Blocks.Sources.Step ExtPower(height=W, startTime=30) annotation (
         Placement(transformation(extent={{-40,40},{-20,60}}, rotation=0)));
      ThermoPower.Water.SensT T_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{38,-6},{58,14}}, rotation=
               0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(hex.outfl, Valve.inlet) annotation (Line(
          points={{0,0},{12,0}},
          color={0,0,255},
          thickness=0.5));
      connect(T_in.outlet, hex.infl) annotation (Line(
          points={{-32,0},{-20,0}},
          color={0,0,255},
          thickness=0.5));
      connect(Fluid_Source.flange, T_in.inlet) annotation (Line(
          points={{-56,0},{-44,0}},
          color={0,0,255},
          thickness=0.5));
      connect(HeatSource1D1.wall, hex.wall)
        annotation (Line(points={{-10,29},{-10,5}}, color={255,127,0}));
      connect(T_out.outlet, Fluid_Sink.flange) annotation (Line(
          points={{54,0},{64,0}},
          color={0,0,255},
          thickness=0.5));
      connect(Valve.outlet, T_out.inlet) annotation (Line(
          points={{32,0},{42,0}},
          color={0,0,255},
          thickness=0.5));
      connect(MassFlowRate.y, Fluid_Source.in_w0)
        annotation (Line(points={{-73,30},{-70,30},{-70,6}}, color={0,0,127}));
      connect(InSpecEnthalpy.y, Fluid_Source.in_h)
        annotation (Line(points={{-73,60},{-62,60},{-62,6}}, color={0,0,127}));
      connect(ExtPower.y, HeatSource1D1.power) annotation (Line(points={{-19,50},
              {-10,50},{-10,36}}, color={0,0,127}));
      connect(Constant1.y, Valve.cmd)
        annotation (Line(points={{11,70},{22,70},{22,8}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
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
</HTML>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
</ul>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
    end TestWaterFlow1DFEM_A;

    model TestWaterFlow1DFEM_B "Test case for Flow1DFEM"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      // number of Nodes
      parameter Integer Nnodes=12;
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
      Water.Flow1DFEM hex(
        redeclare package Medium = Medium,
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hs,
        hstartout=hs,
        alpha=1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        dpnom=10000,
        redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFEM.ConstantHeatTransferCoefficient
            (gamma=400))
        annotation (Placement(transformation(extent={{-20,-10},{0,10}},
              rotation=0)));
      Thermal.TempSource1DFEM          TempSource(N=Nnodes) annotation (
          Placement(transformation(extent={{-20,10},{0,30}}, rotation=0)));
      ThermoPower.Water.ValveLin ValveLin1(
        Kv=2*whex/phex,
        redeclare package Medium = Medium) annotation (
          Placement(transformation(extent={{10,-10},{30,10}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow FluidSource(
        redeclare package Medium = Medium,
        w0=whex,
        p0=phex,
        h=hs) annotation (Placement(transformation(extent={{-80,-10},{-60,10}},
              rotation=0)));
      ThermoPower.Water.SinkPressure FluidSink(
        p0=phex/2,
        h=hs,
        redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{70,-10},{90,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step Temperature(
        height=10,
        offset=297,
        startTime=20) annotation (Placement(transformation(extent={{-50,30},{
                -30,50}},
                      rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{-10,70},{10,90}}, rotation=0)));
      ThermoPower.Water.SensT T_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-50,-6},{-30,14}},
              rotation=0)));
      ThermoPower.Water.SensT T_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{40,-6},{60,14}}, rotation=
               0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(hex.outfl, ValveLin1.inlet) annotation (Line(
          points={{0,0},{10,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(T_in.inlet, FluidSource.flange) annotation (Line(
          points={{-46,0},{-60,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(T_in.outlet, hex.infl) annotation (Line(
          points={{-34,0},{-20,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(ValveLin1.outlet, T_out.inlet) annotation (Line(
          points={{30,0},{44,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(T_out.outlet, FluidSink.flange) annotation (Line(
          points={{56,0},{70,0}},
          thickness=0.5,
          color={0,0,255}));
      connect(Temperature.y, TempSource.temperature) annotation (Line(points={{-29,40},
              {-10,40},{-10,24}},         color={0,0,127}));
      connect(Constant1.y, ValveLin1.cmd)
        annotation (Line(points={{11,80},{20,80},{20,8}}, color={0,0,127}));
      connect(TempSource.wall, hex.wall) annotation (Line(
          points={{-10,17},{-10,5}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),
                graphics),
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
</HTML>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
</ul>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
    end TestWaterFlow1DFEM_B;

    model TestWaterFlow1DFEM_C "Test case for Flow1Dfem"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      // number of Nodes
      parameter Integer Nnodes=12;
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
      Water.Flow1DFEM hex(
        redeclare package Medium = Medium,
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hs,
        hstartout=hs,
        DynamicMomentum=false,
        alpha=1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        dpnom=10000)
        annotation (Placement(transformation(extent={{-20,-10},{0,10}},
              rotation=0)));
      ThermoPower.Water.ValveLin ValveLin1(
        redeclare package Medium = Medium,
        Kv=2*whex/phex) annotation (
          Placement(transformation(extent={{40,-10},{60,10}}, rotation=0)));
      ThermoPower.Water.SinkPressure SinkP1(
        h=hs,
        p0=4*phex,
        redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{70,-10},{90,10}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow SourceW1(
        redeclare package Medium = Medium,
        w0=whex,
        G=0,
        p0=2*phex,
        h=2*hs,
        use_in_w0=true)
                annotation (Placement(transformation(extent={{-78,-10},{-58,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp1(
        duration=20,
        height=-2*whex,
        offset=whex,
        startTime=500) annotation (Placement(transformation(extent={{-100,26},{
                -80,46}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{10,50},{30,70}}, rotation=0)));
      ThermoPower.Water.SensT T_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-50,-6},{-30,14}},
              rotation=0)));
      ThermoPower.Water.SensT T_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{10,-6},{30,14}}, rotation=
               0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(ValveLin1.outlet, SinkP1.flange) annotation (Line(
          points={{60,0},{70,0}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceW1.flange, T_in.inlet) annotation (Line(
          points={{-58,0},{-46,0}},
          color={0,0,255},
          thickness=0.5));
      connect(T_in.outlet, hex.infl) annotation (Line(
          points={{-34,0},{-20,0}},
          color={0,0,255},
          thickness=0.5));
      connect(hex.outfl, T_out.inlet) annotation (Line(
          points={{0,0},{14,0}},
          color={0,0,255},
          thickness=0.5));
      connect(T_out.outlet, ValveLin1.inlet) annotation (Line(
          points={{26,0},{40,0}},
          color={0,0,255},
          thickness=0.5));
      connect(Ramp1.y, SourceW1.in_w0)
        annotation (Line(points={{-79,36},{-72,36},{-72,6}}, color={0,0,127}));
      connect(Constant1.y, ValveLin1.cmd)
        annotation (Line(points={{31,60},{50,60},{50,8}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),
                graphics),
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
</HTML>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
</ul>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
    end TestWaterFlow1DFEM_C;

    model TestWaterFlow1DFEM_D "Test case for Flow1DFEM"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      // number of Nodes
      parameter Integer Nnodes=12;
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
      Water.Flow1DFEM hex(
        redeclare package Medium = Medium,
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        alpha=1,
        hstartin=hs,
        hstartout=hs,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        dpnom=10000)
        annotation (Placement(transformation(extent={{-20,-10},{0,10}},
              rotation=0)));
      ThermoPower.Water.SourceMassFlow MassFlowRateSource(
        w0=whex, h=hs,
        use_in_w0=true,
        redeclare package Medium = Medium)
        annotation (
          Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
      ThermoPower.Water.SinkPressure FluidSink(
        redeclare package Medium = Medium,
        R=100,
        h=3e6,
        p0=5000)
               annotation (Placement(transformation(extent={{76,-10},{96,10}},
              rotation=0)));
      ThermoPower.Water.ValveLin ValveLin1(
        Kv=1e-7,
        redeclare package Medium = Medium) annotation (Placement(
            transformation(extent={{40,-10},{60,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step MassFlowRateStep(
        height=whex/10,
        offset=whex,
        startTime=0.5) annotation (Placement(transformation(extent={{-86,20},{-66,
                40}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{20,40},{40,60}}, rotation=0)));
      Water.SensP SensP annotation (Placement(transformation(extent={{12,4},{32,
                24}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(ValveLin1.inlet, hex.outfl) annotation (Line(
          points={{40,0},{0,0}},
          color={0,0,255},
          thickness=0.5));
      connect(ValveLin1.outlet, FluidSink.flange) annotation (Line(
          points={{60,0},{76,0}},
          color={0,0,255},
          thickness=0.5));
      connect(MassFlowRateSource.flange, hex.infl) annotation (Line(
          points={{-40,0},{-20,0}},
          color={0,0,255},
          thickness=0.5));
      connect(SensP.flange, ValveLin1.inlet)
        annotation (Line(points={{22,10},{40,10},{40,0}}));
      connect(MassFlowRateStep.y, MassFlowRateSource.in_w0)
        annotation (Line(points={{-65,30},{-54,30},{-54,6}}, color={0,0,127}));
      connect(Constant1.y, ValveLin1.cmd)
        annotation (Line(points={{41,50},{50,50},{50,8}}, color={0,0,127}));
      annotation (
        Diagram(graphics),
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
</HTML>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
</ul>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
    end TestWaterFlow1DFEM_D;

    model TestWaterFlow1DFEM_E "Test case for Flow1DFEM"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      // number of Nodes
      parameter Integer Nnodes=12;
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
      Water.Flow1DFEM hexA(
        N=Nnodes,
        Nt=1,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hinhex,
        hstartout=houthex,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        dpnom=10000,
        redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-20,-50},{0,-30}},
              rotation=0)));
      ThermoPower.Water.SinkPressure
                              SideA_FluidSink(redeclare package Medium = Medium)
                                              annotation (Placement(
            transformation(extent={{70,-50},{90,-30}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SideB_FluidSink(redeclare package Medium = Medium)
                                              annotation (Placement(
            transformation(extent={{-80,40},{-100,60}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                SideA_MassFlowRate(w0=whex,
        p0=300000,
        use_in_h=true,
        redeclare package Medium = Medium)                          annotation (
         Placement(transformation(extent={{-78,-50},{-58,-30}}, rotation=0)));
      ThermoPower.Water.ValveLin ValveLin1(Kv=whex/(2e5), redeclare package
          Medium =
            Medium)                                       annotation (Placement(
            transformation(extent={{20,-50},{40,-30}}, rotation=0)));
      ThermoPower.Water.ValveLin ValveLin2(Kv=whex/(2e5), redeclare package
          Medium =
            Medium)                                       annotation (Placement(
            transformation(extent={{-30,40},{-50,60}}, rotation=0)));
      Water.Flow1DFEM hexB(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hinhex,
        hstartout=houthex,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        dpnom=10000,
        redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFEM.ConstantHeatTransferCoefficient
            (gamma=400),
        redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{0,60},{-20,40}}, rotation=
               0)));
      ThermoPower.Water.SensT SensT_A_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-50,-46},{-30,-26}},
              rotation=0)));
      Modelica.Blocks.Sources.Step SideA_InSpecEnth(
        height=1e5,
        offset=1e5,
        startTime=50) annotation (Placement(transformation(extent={{-94,-20},{-74,
                0}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{-70,70},{-50,90}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant2(k=1)
                                                 annotation (Placement(
            transformation(extent={{4,-20},{24,0}}, rotation=0)));
      ThermoPower.Water.SensT SensT_B_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{30,44},{10,64}}, rotation=
               0)));
      ThermoPower.Water.SourceMassFlow
                                SideB_MassFlowRate(w0=whex, p0=3e5,
        redeclare package Medium = Medium)                          annotation (
         Placement(transformation(extent={{60,40},{40,60}}, rotation=0)));
      ThermoPower.Water.SensT SensT_A_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{46,-46},{66,-26}},
              rotation=0)));
      ThermoPower.Water.SensT SensT_B_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-54,44},{-74,64}},
              rotation=0)));
      Thermal.CounterCurrentFEM
                             CounterCurrent1(N=Nnodes) annotation (Placement(
            transformation(extent={{-20,-10},{0,10}},rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SideA_MassFlowRate.flange, SensT_A_in.inlet) annotation (Line(
          points={{-58,-40},{-46,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_A_in.outlet, hexA.infl) annotation (Line(
          points={{-34,-40},{-20,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(hexA.outfl, ValveLin1.inlet) annotation (Line(
          points={{0,-40},{20,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(ValveLin2.inlet, hexB.outfl) annotation (Line(
          points={{-30,50},{-20,50}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_B_in.outlet, hexB.infl) annotation (Line(
          points={{14,50},{0,50}},
          color={0,0,255},
          thickness=0.5));
      connect(SideB_MassFlowRate.flange, SensT_B_in.inlet) annotation (Line(
          points={{40,50},{26,50}},
          color={0,0,255},
          thickness=0.5));
      connect(ValveLin1.outlet, SensT_A_out.inlet) annotation (Line(
          points={{40,-40},{50,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_A_out.outlet, SideA_FluidSink.flange) annotation (Line(
          points={{62,-40},{70,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(SideB_FluidSink.flange, SensT_B_out.outlet) annotation (Line(
          points={{-80,50},{-70,50}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_B_out.inlet, ValveLin2.outlet) annotation (Line(
          points={{-58,50},{-50,50}},
          color={0,0,255},
          thickness=0.5));
      connect(hexB.wall, CounterCurrent1.side1)
        annotation (Line(points={{-10,45},{-10,26},{-10,3}},
                                                     color={255,127,0}));
      connect(SideA_InSpecEnth.y, SideA_MassFlowRate.in_h) annotation (Line(
            points={{-73,-10},{-64,-10},{-64,-34}}, color={0,0,127}));
      connect(Constant1.y, ValveLin2.cmd) annotation (Line(points={{-49,80},{-40,
              80},{-40,58}}, color={0,0,127}));
      connect(Constant2.y, ValveLin1.cmd) annotation (Line(points={{25,-10},{30,
              -10},{30,-32}}, color={0,0,127}));
      connect(CounterCurrent1.side2, hexA.wall) annotation (Line(
          points={{-10,-3.1},{-10,-35}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}),
                graphics),
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
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       New heat transfer components.</li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>

</html>
"));
    end TestWaterFlow1DFEM_E;

    model TestWaterFlow1DFEM_F "Test case for Flow1DFEM"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      // number of Nodes
      parameter Integer Nnodes=16;
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
      Water.Flow1DFEM hexA(
        N=Nnodes,
        Nt=1,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hinhex,
        hstartout=houthex,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        dpnom=10000,
        redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFEM.ConstantHeatTransferCoefficient
            (gamma=400),
        redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-20,-60},{0,-40}},
              rotation=0)));
      ThermoPower.Water.SinkPressure
                              SideA_FluidSink(redeclare package Medium = Medium)
                                              annotation (Placement(
            transformation(extent={{70,-60},{90,-40}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              SideB_FluidSink(redeclare package Medium = Medium)
                                              annotation (Placement(
            transformation(extent={{-80,40},{-100,60}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                SideA_MassFlowRate(w0=whex,
        p0=300000,
        use_in_h=true,
        redeclare package Medium = Medium)                          annotation (
         Placement(transformation(extent={{-82,-60},{-62,-40}}, rotation=0)));
      ThermoPower.Water.ValveLin ValveLin1(Kv=whex/(2e5), redeclare package
          Medium =
            Medium)                                       annotation (Placement(
            transformation(extent={{20,-60},{40,-40}}, rotation=0)));
      ThermoPower.Water.ValveLin ValveLin2(Kv=whex/(2e5), redeclare package
          Medium =
            Medium)                                       annotation (Placement(
            transformation(extent={{-30,40},{-50,60}}, rotation=0)));
      Water.Flow1DFEM hexB(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        hstartin=hinhex,
        hstartout=houthex,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        dpnom=10000,
        redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFEM.ConstantHeatTransferCoefficient
            (gamma=400),
        redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{0,60},{-20,40}}, rotation=
               0)));
      Thermal.MetalTubeFEM          MetalWall(
        N=Nnodes,
        L=Lhex,
        lambda=20,
        rint=rhex,
        rext=rhex + 1e-3,
        rhomcm=4.9e6,
        Tstart1=297,
        TstartN=297,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) annotation (
          Placement(transformation(extent={{-20,0},{0,-20}}, rotation=0)));
      ThermoPower.Water.SensT SensT_A_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-52,-56},{-32,-36}},
              rotation=0)));
      Modelica.Blocks.Sources.Step SideA_InSpecEnth(
        height=1e5,
        offset=1e5,
        startTime=50) annotation (Placement(transformation(extent={{-96,-34},{-76,
                -14}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                 annotation (Placement(
            transformation(extent={{-70,70},{-50,90}}, rotation=0)));
      Modelica.Blocks.Sources.Constant Constant2(k=1)
                                                 annotation (Placement(
            transformation(extent={{4,-40},{24,-20}}, rotation=0)));
      ThermoPower.Water.SensT SensT_B_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{30,44},{10,64}}, rotation=
               0)));
      ThermoPower.Water.SourceMassFlow
                                SourceW1(w0=whex, p0=3e5,
        redeclare package Medium = Medium)                annotation (Placement(
            transformation(extent={{60,40},{40,60}}, rotation=0)));
      ThermoPower.Water.SensT SensT_A_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{46,-56},{66,-36}},
              rotation=0)));
      ThermoPower.Water.SensT SensT_B_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-54,44},{-74,64}},
              rotation=0)));
      Thermal.CounterCurrentFEM
                             CounterCurrent1(N=Nnodes) annotation (Placement(
            transformation(extent={{-20,24},{0,44}},rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(SideA_MassFlowRate.flange, SensT_A_in.inlet) annotation (Line(
          points={{-62,-50},{-48,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_A_in.outlet, hexA.infl) annotation (Line(
          points={{-36,-50},{-20,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(hexA.outfl, ValveLin1.inlet) annotation (Line(
          points={{0,-50},{20,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(ValveLin2.inlet, hexB.outfl) annotation (Line(
          points={{-30,50},{-20,50}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_B_in.outlet, hexB.infl) annotation (Line(
          points={{14,50},{0,50}},
          color={0,0,255},
          thickness=0.5));
      connect(SourceW1.flange, SensT_B_in.inlet) annotation (Line(
          points={{40,50},{26,50}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_A_out.inlet, ValveLin1.outlet) annotation (Line(
          points={{50,-50},{40,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_A_out.outlet, SideA_FluidSink.flange) annotation (Line(
          points={{62,-50},{70,-50}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_B_out.outlet, SideB_FluidSink.flange) annotation (Line(
          points={{-70,50},{-80,50}},
          color={0,0,255},
          thickness=0.5));
      connect(SensT_B_out.inlet, ValveLin2.outlet) annotation (Line(
          points={{-58,50},{-50,50}},
          color={0,0,255},
          thickness=0.5));
      connect(CounterCurrent1.side2, MetalWall.ext)
        annotation (Line(points={{-10,30.9},{-10,10},{-10,-6.9}},
                                                        color={255,127,0}));
      connect(SideA_InSpecEnth.y, SideA_MassFlowRate.in_h) annotation (Line(
            points={{-75,-24},{-68,-24},{-68,-44}}, color={0,0,127}));
      connect(Constant2.y, ValveLin1.cmd) annotation (Line(points={{25,-30},{30,
              -30},{30,-42}}, color={0,0,127}));
      connect(Constant1.y, ValveLin2.cmd) annotation (Line(points={{-49,80},{-40,
              80},{-40,58}}, color={0,0,127}));
      connect(hexB.wall, CounterCurrent1.side1) annotation (Line(
          points={{-10,45},{-10,37}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(MetalWall.int, hexA.wall) annotation (Line(
          points={{-10,-13},{-10,-45}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}),
                graphics),
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
<li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
<li><i>20 Dec 2004</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       New heat transfer components.</li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>

</html>"));
    end TestWaterFlow1DFEM_F;

    model TestWaterFlow1DFEM_G "Test case for Flow1DFEM"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      // number of Nodes
      parameter Integer Nnodes=6;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dihex=0.02;
      // internal radius
      parameter SI.Radius rhex=Dihex/2;
      // internal perimeter
      parameter SI.Length omegahex=Modelica.Constants.pi*Dihex;
      // internal cross section
      parameter SI.Area Ahex=Modelica.Constants.pi*rhex^2;
      // friction coefficient
      parameter SI.PerUnit Cfhex=0.005;
      // nominal (and initial) mass flow rate
      parameter SI.MassFlowRate whex=0.3;
      // initial pressure
      parameter SI.Pressure phex=2e5;
      // initial inlet specific enthalpy
      parameter SI.SpecificEnthalpy hinhex=1e5;
      // initial outlet specific enthalpy
      parameter SI.SpecificEnthalpy houthex=1e5;

      //height of enthalpy step
      parameter SI.SpecificEnthalpy deltah=41800;

      //height of power step
      parameter SI.EnergyFlowRate W=41800*whex;

      ThermoPower.Water.SourceMassFlow
                                Fluid_Source(
        p0=phex,
        w0=whex,
        h=hinhex + deltah,
        use_in_w0=true,
        redeclare package Medium = Medium)
                           annotation (Placement(transformation(extent={{-76,-10},
                {-56,10}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Fluid_Sink(p0=phex/2, h=hinhex,
        redeclare package Medium = Medium)                    annotation (
          Placement(transformation(extent={{64,-10},{84,10}}, rotation=0)));
      Water.Flow1DFEM hex(
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
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.noInit,
        ML=0,
        dpnom=100000,
        alpha=1,
        redeclare package Medium = Medium)
                      annotation (Placement(transformation(extent={{-8,-10},{12,
                10}}, rotation=0)));
      ThermoPower.Water.SensT T_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-48,-6},{-28,14}},
              rotation=0)));
      Modelica.Blocks.Sources.TimeTable MassFlowRate(
        offset=0,
        startTime=0,
        table=[0, whex; 19.5, whex; 20.5, -whex; 40, -whex; 41, 0; 100, 0])
        annotation (Placement(transformation(extent={{-94,20},{-74,40}},
              rotation=0)));
      ThermoPower.Water.SensT T_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{38,-6},{58,14}}, rotation=
               0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(T_in.outlet, hex.infl) annotation (Line(
          points={{-32,0},{-20,0},{-8,0}},
          color={0,0,255},
          thickness=0.5));
      connect(Fluid_Source.flange, T_in.inlet) annotation (Line(
          points={{-56,0},{-44,0}},
          color={0,0,255},
          thickness=0.5));
      connect(T_out.outlet, Fluid_Sink.flange) annotation (Line(
          points={{54,0},{64,0}},
          color={0,0,255},
          thickness=0.5));
      connect(MassFlowRate.y, Fluid_Source.in_w0)
        annotation (Line(points={{-73,30},{-70,30},{-70,6}}, color={0,0,127}));
      connect(hex.outfl, T_out.inlet) annotation (Line(
          points={{12,0},{42,0}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (
        Diagram(graphics),
        experiment(StopTime=50, Tolerance=1e-006),
        Documentation(info="<html>
<p>The model is designed to test the component <code>Flow1DFEM</code> (fluid side of a heat exchanger, finite element method) under reversing and zero flow conditions.</p>
<p>The simulation starts with cold fluid in the pipe and with positive flow from the hot source on the left. Around t = 20, the flow is reversed, and cold fluid enters the pipe from the cold source on the right. Around t = 40, the flow is brought to zero and stays there.</p>
<p>Simulation Interval = [0...50] sec </p>
<p>Integration Algorithm = DASSL </p>
<p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
    <li><i>23 Lug 2011</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput);
    end TestWaterFlow1DFEM_G;

    model TestWaterFlow1DFEM_K "Test case for Flow1DFEM"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.StandardWater
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      // number of Nodes
      parameter Integer Nnodes=11;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dihex=0.02;
      // internal radius
      parameter SI.Radius rhex=Dihex/2;
      // internal perimeter
      parameter SI.Length omegahex=Modelica.Constants.pi*Dihex;
      // internal cross section
      parameter SI.Area Ahex=Modelica.Constants.pi*rhex^2;
      // friction coefficient
      parameter SI.PerUnit Cfhex=0.05;
      // nominal (and initial) mass flow rate
      parameter SI.MassFlowRate whex=0.3;
      // initial pressure
      parameter SI.Pressure phex=30e5;
      // initial temperature
      parameter SI.Temperature Thex=700;
      // initial specific enthalpy
      final parameter SI.SpecificEnthalpy hhex=
          Medium.specificEnthalpy_pT(phex, Thex);
      // initial density
      final parameter SI.Density rhohex=Medium.density_pT(phex,
          Thex);
      // Cv of fluid
      final parameter SI.SpecificHeatCapacity cp=
          Medium.specificHeatCapacityCp(Medium.setState_pT(phex, Thex));
      //height of power step
      parameter SI.EnergyFlowRate W=100;
      // prediction of the flow rate going out the pipe from each side
      // Approximated value of drho/dT, assuming ideal gas
      final parameter Real drho_dT = rhohex/Thex;
      // Initial mass
      final parameter SI.Mass M = rhohex*Ahex*Lhex;
      // Approximated value of temperature derivative (isobaric expansion)
      final parameter Real dT_dt = W/(cp*M);
      // Approximated dM/dT = V*drho_dT*dT_dt
      final parameter SI.MassFlowRate dM_dT = Ahex*Lhex*drho_dT*dT_dt;
      // Approximated value of flow rate at each end
      final parameter SI.MassFlowRate wout=0.5*dM_dT;

      ThermoPower.Water.SinkPressure
                              sink1(p0=phex, h=hhex,
        redeclare package Medium = Medium)           annotation (Placement(
            transformation(extent={{66,-10},{86,10}}, rotation=0)));
      Water.Flow1DFEM pipe1(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        DynamicMomentum=false,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Middle,
        hstartin=hhex,
        hstartout=hhex,
        initOpt=ThermoPower.Choices.Init.Options.noInit,
        alpha=0,
        pstart=phex,
        wnf=1,
        dpnom=10000,
        redeclare package Medium = Medium)
               annotation (Placement(transformation(extent={{-12,-10},{8,10}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Water.SourcePressure
                    source1(h=hhex, p0=phex,
        redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
      Thermal.HeatSource1DFEM
                           heatSource1D(
        L=Lhex,
        omega=Dihex*3.14159,
        N=Nnodes)
        annotation (Placement(transformation(extent={{-12,12},{8,32}})));
      Modelica.Blocks.Sources.Step step(height=W)
        annotation (Placement(transformation(extent={{-38,30},{-18,50}})));
    equation
      connect(source1.flange, pipe1.infl) annotation (Line(
          points={{-52,0},{-12,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pipe1.outfl, sink1.flange) annotation (Line(
          points={{8,0},{66,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(heatSource1D.wall, pipe1.wall) annotation (Line(
          points={{-2,19},{-2,5}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(step.y, heatSource1D.power) annotation (Line(
          points={{-17,40},{-2,40},{-2,26}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        experiment(
          StartTime=-10,
          StopTime=10,
          Tolerance=1e-006),
        Documentation(info="<html>
<p>The model is designed to test the coupling between the mass and energy balance equations in the component <code>Flow1DFEM</code> (fluid side of a heat exchanger, finite element method).</p>
<p>The pipe is connected to two pressure source at the same pressure, with initial conditions corresponding to superheated steam @ 30 bar, 700 K. </p>
<p>At time t = 0, a constant uniform heat flux is applied to the lateral boundary of the pipe. The steam heats up and expands uniformly; since the configuration is symmetric, there is a backflow in the left half of the pipe and a forward flow on the right half of the pipe. The parameter wout is an analytical estimate of the flow rate going out each end of the pipe, which is in a good agreement with the actual solution.</p>
</html>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
    <li><i>23 Aug 2011</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput(doublePrecision=true, equdistant=false),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics));
    end TestWaterFlow1DFEM_K;

    model TestWaterFlow1DFEM_J "Test case for Flow1Dfem"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.StandardWater
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      // number of Nodes
      parameter Integer Nnodes=11;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dihex=0.02;
      // internal radius
      parameter SI.Radius rhex=Dihex/2;
      // internal perimeter
      parameter SI.Length omegahex=Modelica.Constants.pi*Dihex;
      // internal cross section
      parameter SI.Area Ahex=Modelica.Constants.pi*rhex^2;
      // friction coefficient
      parameter SI.PerUnit Cfhex=0.05;
      // nominal (and initial) mass flow rate
      parameter SI.MassFlowRate whex=0.03;
      // initial pressure
      parameter SI.Pressure phex=30e5;
      // initial temperature
      parameter SI.Temperature Thex=700;
      // initial specific enthalpy
      final parameter SI.SpecificEnthalpy hhex=
          Medium.specificEnthalpy_pT(phex, Thex);
      // initial density
      final parameter SI.Density rhohex=Medium.density_pT(phex,
          Thex);
      // Cv of fluid
      final parameter SI.SpecificHeatCapacity cv=
          Medium.specificHeatCapacityCv(Medium.setState_pT(phex, Thex));
      //height of power step

      ThermoPower.Water.SinkPressure
                              sink1(p0=phex, h=hhex,
        use_in_p0=true,
        redeclare package Medium = Medium)           annotation (Placement(
            transformation(extent={{66,-10},{86,10}}, rotation=0)));
      Water.Flow1DFEM pipe1(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dihex,
        A=Ahex,
        wnom=whex,
        Cfnom=Cfhex,
        DynamicMomentum=false,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Middle,
        hstartin=hhex,
        hstartout=hhex,
        initOpt=ThermoPower.Choices.Init.Options.noInit,
        alpha=0,
        pstart=phex,
        dpnom=10000,
        wnf=1,
        redeclare package Medium = Medium)
               annotation (Placement(transformation(extent={{-12,-10},{8,10}},
              rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Water.SourcePressure
                    source1(h=hhex, p0=phex + 150,
        use_in_p0=true,
        redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=phex,
        duration=10,
        offset=phex)
        annotation (Placement(transformation(extent={{-94,28},{-74,48}})));
    equation
      connect(source1.flange, pipe1.infl) annotation (Line(
          points={{-52,0},{-12,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(pipe1.outfl, sink1.flange) annotation (Line(
          points={{8,0},{66,0}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(ramp.y, source1.in_p0) annotation (Line(
          points={{-73,38},{-66,38},{-66,9.2}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp.y, sink1.in_p0) annotation (Line(
          points={{-73,38},{72,38},{72,8.8}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        experiment(
          StartTime=-10,
          StopTime=10,
          __Dymola_NumberOfIntervals=10000,
          Tolerance=1e-007),
        Documentation(info="<html>
<p>The model is designed to test the coupling between the mass and energy balance equations in the component <code>Flow1DFEM</code> (fluid side of a heat exchanger, finite element method).</p>
<p>The pipe is connected to two pressure sources at the same pressure, with initial conditions corresponding to superheated steam @ 30 bar, 700 K. </p>
<p>At time t = 0, the two pressures start to increase, so that the fluid is compressed into the pipe. Since the configuration is symmetric, there is a forward flow in the left half of the pipe and a backward flow on the right half of the pipe. The parameter wout is an analytical estimate of the flow rate going out each end of the pipe, which is in a good agreement with the actual solution.</p>
</html>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
    <li><i>23 Aug 2011</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput(doublePrecision=true, equdistant=false));
    end TestWaterFlow1DFEM_J;

    model TestWaterFlow1DFV2ph
      extends Modelica.Icons.Example;
       package Medium = Modelica.Media.Water.WaterIF97_ph;
      constant Real pi = Modelica.Constants.pi;
      // number of Nodes
      parameter Integer Nnodes=15;
      // total length
      parameter SI.Length Lhex=20;
      // internal diameter
      parameter SI.Diameter Dhex=0.01;
      // wall thickness
      parameter SI.Thickness thhex=0.002;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=pi*Dhex;
      // internal cross section
      parameter SI.Area Ahex=pi*rhex^2;
      // friction factor
      parameter SI.PerUnit Cfhex=0.005;
      Water.ValveLin             valve(Kv=0.05/60e5) annotation (Placement(
            transformation(extent={{30,-70},{50,-50}}, rotation=0)));
      Water.SinkPressure      Sink(p0=10000)
                                         annotation (Placement(transformation(
              extent={{70,-70},{90,-50}}, rotation=0)));
      Modelica.Blocks.Sources.Step hIn(
        height=0,
        startTime=30,
        offset=1e6)   annotation (Placement(transformation(extent={{-80,-40},{-60,-20}},
                       rotation=0)));
      Water.SourceMassFlow      Source(
        w0=0.05,
        G=0.05/600e5,
        use_in_h=true,
        p0=6000000)   annotation (Placement(transformation(extent={{-60,-70},{-40,-50}},
                       rotation=0)));
      Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1,
        duration=1)                                           annotation (
          Placement(transformation(extent={{10,-40},{30,-20}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Water.Flow1DFV2ph hexFV(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        A=Ahex,
        Cfnom=0.005,
        DynamicMomentum=false,
        hstartin=1e6,
        hstartout=1e6,
        Dhyd=2*rhex,
        wnom=0.05,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        fixedMassFlowSimplified = true,
        redeclare model HeatTransfer =
          ThermoPower.Thermal.HeatTransferFV.HeatTransfer2phDB (gamma_b=30000),
        dpnom=1000)
        annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
      Thermal.MetalTubeFV metalTubeFV(
        L=Lhex,
        rint=rhex,
        rhomcm=7000*680,
        lambda=20,
        rext=rhex + 2*thhex,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        Nw=Nnodes - 1,
        Tstart1=510,
        TstartN=510)
        annotation (Placement(transformation(extent={{-20,-26},{0,-6}})));
      Thermal.TempSource1DlinFV tempSource1DlinFV(Nw=Nnodes - 1)
        annotation (Placement(transformation(extent={{-20,6},{0,26}})));
      Modelica.Blocks.Sources.Ramp extTemp1(
        duration=100,
        height=50,
        offset=540,
        startTime=100) annotation (Placement(transformation(extent={{-100,24},{-80,44}},
                          rotation=0)));
      Modelica.Blocks.Sources.Ramp extTemp2(
        duration=100,
        height=-50,
        startTime=500) annotation (Placement(transformation(extent={{-100,64},{-80,84}},
                          rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent={{-66,44},
                {-46,64}},          rotation=0)));
      Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(extent={{0,74},{
                20,94}},         rotation=0)));
      Modelica.Blocks.Sources.Constant DT(k=5) annotation (Placement(
            transformation(extent={{-36,64},{-16,84}}, rotation=0)));
    equation
      connect(valve.outlet,Sink. flange) annotation (Line(
          points={{50,-60},{70,-60}},
          color={0,0,255},
          thickness=0.5));
      connect(hIn.y,Source. in_h) annotation (Line(points={{-59,-30},{-46,-30},{-46,
              -54}},      color={0,0,127}));
      connect(xValve.y,valve. cmd) annotation (Line(points={{31,-30},{40,-30},{40,-52}},
                        color={0,0,127}));
      connect(hexFV.infl, Source.flange)    annotation (Line(
          points={{-20,-60},{-40,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(hexFV.outfl, valve.inlet)    annotation (Line(
          points={{0,-60},{30,-60}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(Add2.u2,DT. y) annotation (Line(points={{-2,78},{-8,78},{-8,74},{-15,74}},
                        color={0,0,127}));
      connect(Add2.u1,Add1. y) annotation (Line(points={{-2,90},{-40,90},{-40,54},{-45,
              54}},          color={0,0,127}));
      connect(extTemp1.y,Add1. u2)
        annotation (Line(points={{-79,34},{-68,48}}, color={0,0,127}));
      connect(extTemp2.y,Add1. u1)
        annotation (Line(points={{-79,74},{-68,60}}, color={0,0,127}));
      connect(tempSource1DlinFV.temperature_1, Add1.y) annotation (Line(
          points={{-14,19},{-14,54},{-45,54}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tempSource1DlinFV.temperature_Nw, Add2.y) annotation (Line(
          points={{-6,18.8},{-6,56},{28,56},{28,84},{21,84}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(tempSource1DlinFV.wall, metalTubeFV.int) annotation (Line(
          points={{-10,13},{-10,-13}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(metalTubeFV.ext, hexFV.wall) annotation (Line(
          points={{-10,-19.1},{-10,-55}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        experiment(
          StopTime=1000,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-008),
        __Dymola_experimentSetupOutput);
    end TestWaterFlow1DFV2ph;

    model TestWaterFlow1DFV2ph_A "Test case for Flow1DFV2ph"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      constant Real pi = Modelica.Constants.pi;
      // number of Nodes
      parameter Integer Nnodes=10;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dhex=0.06;
      // wall thickness
      parameter SI.Thickness thhex=0;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=Dhex;
      // internal cross section
      parameter SI.Area Ahex=pi*rhex^2;
      // friction factor
      parameter SI.PerUnit Cfhex=0.005;
      SI.Mass Mhex "Mass in the heat exchanger";
      SI.Mass Mbal "Mass resulting from the mass balance";
      SI.Mass Merr(min = -1e9) "Mass balance error";

      Water.Flow1DFV2ph
                      hex(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dhex,
        A=Ahex,
        Cfnom=0.005,
        hstartin=6e5,
        hstartout=6e5,
        wnom=1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        redeclare package Medium = Medium,
        dpnom=1000,
        pstart=1000000)
                    annotation (Placement(transformation(extent={{-20,-30},{0,-10}},
              rotation=0)));
      ThermoPower.Water.ValveLin valve(redeclare package Medium = Medium, Kv=
            0.4/10e5) annotation (Placement(transformation(extent={{20,-30},{40,
                -10}}, rotation=0)));
      Thermal.HeatSource1DFV           heatSource(Nw=Nnodes - 1)
                        annotation (Placement(transformation(extent={{-20,0},{0,
                20}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(redeclare package Medium = Medium, p0=100000)
        annotation (Placement(transformation(extent={{60,-30},{80,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp hIn(
        height=1e5,
        offset=4e5,
        startTime=100,
        duration=2) annotation (Placement(transformation(extent={{-80,-10},{-60,
                10}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower(
        startTime=10,
        duration=50,
        height=12e5) annotation (Placement(transformation(extent={{-80,26},{-60,
                46}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                Source(redeclare package Medium = Medium, w0=
            0.4,
        use_in_h=true)
                 annotation (Placement(transformation(extent={{-60,-30},{-40,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower2(
        duration=10,
        startTime=150,
        height=-12e5) annotation (Placement(transformation(extent={{-80,58},{-60,
                78}}, rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-40,40},{-20,60}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1,
        duration=1)                                           annotation (
          Placement(transformation(extent={{0,20},{20,40}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(heatSource.wall, hex.wall)
        annotation (Line(points={{-10,7},{-10,-15}}, color={255,127,0}));
      connect(hex.outfl, valve.inlet) annotation (Line(
          points={{0,-20},{20,-20}},
          color={0,0,255},
          thickness=0.5));
      connect(valve.outlet, Sink.flange) annotation (Line(
          points={{40,-20},{60,-20}},
          color={0,0,255},
          thickness=0.5));
      connect(Source.flange, hex.infl) annotation (Line(
          points={{-40,-20},{-20,-20}},
          color={0,0,255},
          thickness=0.5));
      Mhex = hex.M;
      der(Mbal) = hex.infl.m_flow + hex.outfl.m_flow;
      Merr = Mhex - Mbal;
    initial equation
      Mbal = Mhex;

    equation
      connect(hIn.y, Source.in_h)
        annotation (Line(points={{-59,0},{-46,0},{-46,-14}}, color={0,0,127}));
      connect(xValve.y, valve.cmd)
        annotation (Line(points={{21,30},{30,30},{30,-12}}, color={0,0,127}));
      connect(Add1.y, heatSource.power) annotation (Line(points={{-19,50},{-10,
              50},{-10,14}}, color={0,0,127}));
      connect(extPower.y, Add1.u2)
        annotation (Line(points={{-59,36},{-42,44}}, color={0,0,127}));
      connect(extPower2.y, Add1.u1)
        annotation (Line(points={{-59,68},{-42,56}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
        experiment(
          StopTime=250,
          __Dymola_NumberOfIntervals=2000,
          Tolerance=1e-009),
        Documentation(info="<html>
<p>The model is designed to test the component <code>Flow1D2ph</code> when used as an evaporator.</p><p>This model represent the fluid side of a once-through boiler with an applied external heat flow. The operating fluid is water.</p><p>During the simulation, the inlet specific enthalpy and heat flux are changed, while maintaining the inlet flowrate constant: </p>
<ul>
<li>t=0 s. The initial state of the water is subcooled liquid. </li>
<li>t=10 s. Ramp increase of the applied heat flow. The water starts boiling and is blown out of the outlet, whose pressure and flowrate undergo a transient increase. At the end of the transient the outlet fluid is in superheated vapour state. </li>
<li>t=100 s. Step increase of the inlet enthalpy </li>
<li>t=150 s. The heat flow is brought back to zero. The vapour collapses, causing a suddend decrease in the outlet pressure and flowrate, until the liquid fills again the entire boiler. At that instant, the flowrate rises again rapidly to the inlet values.</li>
</ul>
<p>Simulation Interval = [0...250] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-9</p>
</html>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
    <li><i>26 Jul 2007</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Parameters updated.</li>
    <li><i>10 Dec 2005</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Parameters updated.</li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput(equdistant=false));
    end TestWaterFlow1DFV2ph_A;

    model TestWaterFlow1DFV2ph_B "Test case for Flow1DFV2ph"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      constant Real pi = Modelica.Constants.pi;
      // number of Nodes
      parameter Integer Nnodes=10;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dhex=0.06;
      // wall thickness
      parameter SI.Thickness thhex=0;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=Dhex;
      // internal cross section
      parameter SI.Area Ahex=pi*rhex^2;
      // friction factor
      parameter SI.PerUnit Cfhex=0.005;
      SI.Mass Mhex "Mass in the heat exchanger";
      SI.Mass Mbal "Mass resulting from the mass balance";
      SI.Mass Merr(min = -1e9) "Mass balance error";

      Water.Flow1DFV2ph
                      hex(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dhex,
        A=Ahex,
        Cfnom=0.005,
        DynamicMomentum=false,
        hstartin=6e5,
        hstartout=6e5,
        wnom=1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        redeclare package Medium = Medium,
        avoidInletEnthalpyDerivative=true,
        dpnom=1000,
        pstart=1000000)
                    annotation (Placement(transformation(extent={{-20,-30},{0,-10}},
              rotation=0)));
      ThermoPower.Water.ValveLin valve(redeclare package Medium = Medium, Kv=
            0.4/10e5) annotation (Placement(transformation(extent={{20,-30},{40,
                -10}}, rotation=0)));
      Thermal.HeatSource1DFV           heatSource(Nw=Nnodes - 1)
                        annotation (Placement(transformation(extent={{-20,0},{0,
                20}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(p0=1e5, redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{60,-30},{80,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Step hIn(
        height=1e5,
        offset=4e5,
        startTime=100) annotation (Placement(transformation(extent={{-80,-10},{
                -60,10}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower(
        startTime=10,
        duration=50,
        height=12e5) annotation (Placement(transformation(extent={{-80,26},{-60,
                46}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                Source(redeclare package Medium = Medium, w0=
            0.4,
        use_in_h=true)
                 annotation (Placement(transformation(extent={{-60,-30},{-40,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower2(
        duration=10,
        startTime=150,
        height=-12e5) annotation (Placement(transformation(extent={{-80,58},{-60,
                78}}, rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-40,40},{-20,60}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1,
        duration=1)                                           annotation (
          Placement(transformation(extent={{0,20},{20,40}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(heatSource.wall, hex.wall)
        annotation (Line(points={{-10,7},{-10,-15}}, color={255,127,0}));
      connect(hex.outfl, valve.inlet) annotation (Line(
          points={{0,-20},{20,-20}},
          color={0,0,255},
          thickness=0.5));
      connect(valve.outlet, Sink.flange) annotation (Line(
          points={{40,-20},{60,-20}},
          color={0,0,255},
          thickness=0.5));
      connect(Source.flange, hex.infl) annotation (Line(
          points={{-40,-20},{-20,-20}},
          color={0,0,255},
          thickness=0.5));
      Mhex = hex.M;
      der(Mbal) = hex.infl.m_flow + hex.outfl.m_flow;
      Merr = Mhex - Mbal;
    initial equation
      Mbal = Mhex;

    equation
      connect(extPower2.y, Add1.u1)
        annotation (Line(points={{-59,68},{-42,56}}, color={0,0,127}));
      connect(extPower.y, Add1.u2)
        annotation (Line(points={{-59,36},{-42,44}}, color={0,0,127}));
      connect(Add1.y, heatSource.power) annotation (Line(points={{-19,50},{-10,
              50},{-10,14}}, color={0,0,127}));
      connect(hIn.y, Source.in_h)
        annotation (Line(points={{-59,0},{-46,0},{-46,-14}}, color={0,0,127}));
      connect(xValve.y, valve.cmd)
        annotation (Line(points={{21,30},{30,30},{30,-12}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
        experiment(
          StopTime=250,
          __Dymola_NumberOfIntervals=2000,
          Tolerance=1e-009),
        Documentation(info="<HTML>
<p>Same as TestFlow1D2phA, but in this case the enthalpy at the inlet changes stepwise. The avodInletEnthalpyDerivative flag is set to true, in order to avoid problems with the derivative of h[1].
<p>
Simulation Interval = [0...250] sec <br>
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-9
</p>
</HTML>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
    <li><i>27 Jul 2007</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Created.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput(equdistant=false));
    end TestWaterFlow1DFV2ph_B;

    model TestWaterFlow1DFV2ph_C "Test case for Flow1D2ph"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      constant Real pi = Modelica.Constants.pi;
      // number of Nodes
      parameter Integer Nnodes=20;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dhex=0.06;
      // wall thickness
      parameter SI.Thickness thhex=0;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=Dhex;
      // internal cross section
      parameter SI.Area Ahex=pi*rhex^2;
      // friction factor
      parameter SI.PerUnit Cfhex=0.005;
      SI.Mass Mhex "Mass in the heat exchanger";
      SI.Mass Mbal "Mass resulting from the mass balance";
      SI.Mass Merr(min = -1e9) "Mass balance error";

      Water.Flow1DFV2ph
                      hex(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dhex,
        A=Ahex,
        Cfnom=0.005,
        DynamicMomentum=false,
        wnom=1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        redeclare package Medium = Medium,
        hstartin=6e5,
        hstartout=6e5,
        dpnom=1000) annotation (Placement(transformation(extent={{-10,-30},{10,
                -10}}, rotation=0)));
      Thermal.HeatSource1DFV           heatSource(Nw=Nnodes - 1)
                        annotation (Placement(transformation(extent={{-10,0},{
                10,20}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(redeclare package Medium = Medium, p0=11e5)
        annotation (Placement(transformation(extent={{60,-30},{80,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp hIn(
        height=1e5,
        offset=4e5,
        duration=2,
        startTime=100) annotation (Placement(transformation(extent={{-80,-10},{
                -60,10}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower(
        startTime=10,
        duration=50,
        height=12e5) annotation (Placement(transformation(extent={{-80,26},{-60,
                46}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                Source(redeclare package Medium = Medium, w0=
            0.4,
        use_in_h=true)
                 annotation (Placement(transformation(extent={{-60,-30},{-40,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower2(
        startTime=150,
        height=-12e5,
        duration=50) annotation (Placement(transformation(extent={{-80,60},{-60,
                80}}, rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-40,40},{-20,60}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(heatSource.wall, hex.wall)
        annotation (Line(points={{0,7},{0,-15}}, color={255,127,0}));
      connect(Source.flange, hex.infl) annotation (Line(
          points={{-40,-20},{-10,-20}},
          color={0,0,255},
          thickness=0.5));
      Mhex = hex.M;
      der(Mbal) = hex.infl.m_flow + hex.outfl.m_flow;
      Merr = Mhex - Mbal;
    initial equation
      Mbal = Mhex;

    equation
      connect(hex.outfl, Sink.flange) annotation (Line(
          points={{10,-20},{60,-20}},
          color={0,0,255},
          thickness=0.5));
      connect(extPower.y, Add1.u2)
        annotation (Line(points={{-59,36},{-42,44}}, color={0,0,127}));
      connect(extPower2.y, Add1.u1)
        annotation (Line(points={{-59,70},{-42,56}}, color={0,0,127}));
      connect(Add1.y, heatSource.power)
        annotation (Line(points={{-19,50},{0,50},{0,14}}, color={0,0,127}));
      connect(hIn.y, Source.in_h)
        annotation (Line(points={{-59,0},{-46,0},{-46,-14}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
        experiment(
          StopTime=250,
          __Dymola_NumberOfIntervals=2000,
          Tolerance=1e-009),
        Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2ph</tt> when used as an evaporator.<br>
This model represent the fluid side of a once-through boiler with an applied external heat flow. The operating fluid is water. The outlet pressure is kept constant, emulating perfect pressure control.<br>
During the simulation, the inlet specific enthalpy and heat flux are changed, while maintaining the inlet flowrate constant:
<ul>
    <li>t=0 s. The initial state of the water is subcooled liquid.
    <li>t=10 s. Ramp increase of the applied heat flow. The water starts boiling and is blown out of the outlet, whose flowrate undergo a transient increase. At the end of the transient the outlet fluid is in superheated vapour state.</li>
    <li>t=100 s. Step increase of the inlet enthalpy</li>
    <li>t=150 s. The heat flow is brought back to zero. The vapour collapses, causing a suddend decrease in the outlet flowrate, until the liquid fills again the entire boiler. At that instant, the flowrate rises again rapidly to the inlet values.</li>
</ul>
<p>
Simulation Interval = [0...250] sec <br>
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-9
</p>
</HTML>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
    <li><i>26 Jul 2007</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Parameters updated.</li>
    <li><i>10 Dec 2005</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Parameters updated.</li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput(equdistant=false));
    end TestWaterFlow1DFV2ph_C;

    model TestWaterFlow1DFV2ph_D "Test case for Flow1D2ph"
     extends Modelica.Icons.Example;
     package Medium = Modelica.Media.Water.WaterIF97_ph;
      constant Real pi = Modelica.Constants.pi;
      // number of Nodes
      parameter Integer Nnodes=10;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dhex=0.06;
      // wall thickness
      parameter SI.Thickness thhex=0;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=Dhex;
      // internal cross section
      parameter SI.Area Ahex=pi*rhex^2;
      // friction factor
      parameter SI.PerUnit Cfhex=0.005;
      SI.Mass Mhex "Mass in the heat exchanger";
      SI.Mass Mbal "Mass resulting from the mass balance";
      SI.Mass Merr(min = -1e9) "Mass balance error";

      Water.Flow1DFV2ph
                      hex(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dhex,
        A=Ahex,
        Cfnom=0.005,
        DynamicMomentum=false,
        wnom=1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        redeclare package Medium = Medium,
        hstartin=3.2e6,
        hstartout=3.26e6,
        dpnom=1000,
        pstart=1000000)
                    annotation (Placement(transformation(extent={{-20,-30},{0,-10}},
              rotation=0)));
      ThermoPower.Water.ValveLin valve(redeclare package Medium = Medium, Kv=
            0.2/10e5) annotation (Placement(transformation(extent={{20,-30},{40,
                -10}}, rotation=0)));
      Thermal.HeatSource1DFV           heatSource(Nw=Nnodes - 1)
                        annotation (Placement(transformation(extent={{-20,0},{0,
                20}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(p0=1e5, redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{60,-30},{80,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp hIn(
        height=1e5,
        duration=2,
        offset=3.2e6,
        startTime=300) annotation (Placement(transformation(extent={{-80,-10},{
                -60,10}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower(
        startTime=10,
        height=-6e5,
        duration=200) annotation (Placement(transformation(extent={{-80,26},{-60,
                46}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                Source(redeclare package Medium = Medium, w0=
            0.2,
        use_in_h=true)
                 annotation (Placement(transformation(extent={{-60,-30},{-40,-10}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower2(
        duration=150,
        height=+6e5,
        startTime=400) annotation (Placement(transformation(extent={{-80,58},{-60,
                78}}, rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-40,40},{-20,60}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1,
        duration=1)                                           annotation (
          Placement(transformation(extent={{0,20},{20,40}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(heatSource.wall, hex.wall)
        annotation (Line(points={{-10,7},{-10,-15}}, color={255,127,0}));
      connect(hex.outfl, valve.inlet) annotation (Line(
          points={{0,-20},{20,-20}},
          color={0,0,255},
          thickness=0.5));
      connect(valve.outlet, Sink.flange) annotation (Line(
          points={{40,-20},{60,-20}},
          color={0,0,255},
          thickness=0.5));
      connect(Source.flange, hex.infl) annotation (Line(
          points={{-40,-20},{-20,-20}},
          color={0,0,255},
          thickness=0.5));
      Mhex = hex.M;
      der(Mbal) = hex.infl.m_flow + hex.outfl.m_flow;
      Merr = Mhex - Mbal;
    initial equation
      Mbal = Mhex;

    equation
      connect(extPower.y, Add1.u2)
        annotation (Line(points={{-59,36},{-42,44}}, color={0,0,127}));
      connect(extPower2.y, Add1.u1)
        annotation (Line(points={{-59,68},{-42,56}}, color={0,0,127}));
      connect(hIn.y, Source.in_h)
        annotation (Line(points={{-59,0},{-46,0},{-46,-14}}, color={0,0,127}));
      connect(Add1.y, heatSource.power) annotation (Line(points={{-19,50},{-10,
              50},{-10,14}}, color={0,0,127}));
      connect(xValve.y, valve.cmd)
        annotation (Line(points={{21,30},{30,30},{30,-12}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
        experiment(
          StopTime=600,
          __Dymola_NumberOfIntervals=2000,
          Tolerance=1e-009),
        Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2ph</tt> when used as a condenser.<br>
This model represent the fluid side of a condenser with an applied external heat flow. The operating fluid is water.<br>
During the simulation, the inlet specific enthalpy and heat flux are changed, while maintaining the inlet flowrate constant:
<ul>
    <li>t=0 s. The initial state of the water is superheated vapour.
    <li>t=10 s. Ramp increase of the heat flow extracted from the component. The steam condenses, causing a reduction of pressure and a flow rate transient decrease. At the end of the transient the outlet fluid is in subcooled liquid state.</li>
    <li>t=300 s. Step increase of the inlet enthalpy</li>
    <li>t=400 s. The heat flow is brought back to zero. The fluids evaporates, causing an increase of pressure and a surge of flow rate at the outlet..</li>
</ul>
<p>
Simulation Interval = [0...600] sec <br>
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-9
</p>
</HTML>", revisions="<html>
<ul>
    <li><i>7 Jan 2015</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Updated to new FEM model.</li>
    <li><i>26 Jul 2007</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Parameters updated.</li>
    <li><i>10 Dec 2005</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    Parameters updated.</li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput(equdistant=false));
    end TestWaterFlow1DFV2ph_D;

    model CheckFlow1DFV2phMassBalance
      "Checks Flow1DFV2ph equations for mass conservation"
      extends Modelica.Icons.Example;
      package Medium = ThermoPower.Water.StandardWater;
      package SmoothMedium = Medium (final smoothModel=true);
      parameter Integer N=2;
      constant SI.Pressure pzero=10 "Small deltap for calculations";
      constant SI.Pressure pc=Medium.fluidConstants[1].criticalPressure;
      constant SI.SpecificEnthalpy hzero=1e-3 "Small value for deltah";
      SmoothMedium.BaseProperties fluid[N]
        "Properties of the fluid at the nodes";
      Medium.SaturationProperties sat "Properties of saturated fluid";
      Medium.ThermodynamicState dew "Thermodynamic state at dewpoint";
      Medium.ThermodynamicState bubble "Thermodynamic state at bubblepoint";
      Medium.AbsolutePressure p "Fluid pressure for property calculations";
      Medium.Temperature T[N] "Fluid temperature";
      Medium.Temperature Ts "Saturated water temperature";
      Medium.SpecificEnthalpy h[N] "Fluid specific enthalpy";
      Medium.SpecificEnthalpy hl "Saturated liquid temperature";
      Medium.SpecificEnthalpy hv "Saturated vapour temperature";
      SI.PerUnit x[N] "Steam quality";
      Medium.Density rho[N] "Fluid density";
      Units.LiquidDensity rhol "Saturated liquid density";
      Units.GasDensity rhov "Saturated vapour density";
      // protected
      SI.DerEnthalpyByPressure dhldp
        "Derivative of saturated liquid enthalpy by pressure";
      SI.DerEnthalpyByPressure dhvdp
        "Derivative of saturated vapour enthalpy by pressure";
      Medium.Density rhobar[N - 1] "Fluid average density";
      SI.DerDensityByPressure drdp[N] "Derivative of density by pressure";
      SI.DerDensityByPressure drbdp[N - 1]
        "Derivative of average density by pressure";
      SI.DerDensityByPressure drldp
        "Derivative of saturated liquid density by pressure";
      SI.DerDensityByPressure drvdp
        "Derivative of saturated vapour density by pressure";
      SI.DerDensityByEnthalpy drdh[N] "Derivative of density by enthalpy";
      SI.DerDensityByEnthalpy drbdh1[N - 1]
        "Derivative of average density by left enthalpy";
      SI.DerDensityByEnthalpy drbdh2[N - 1]
        "Derivative of average density by right enthalpy";
      Real AA;
      Real AA1;
      import Modelica.Math.*;
      Real rhobar_check[N - 1];
      Real rhobar_err[N - 1]=rhobar - rhobar_check;
      Real case[N - 1];

    equation
      p = 30e5 - 10e5*min(1, max(0, time - 0)) + 10e5*min(1, max(0, time - 2))
         - 10e5*min(1, max(0, time - 4)) + 10e5*min(1, max(0, time - 6)) - 10e5
        *min(1, max(0, time - 8)) + 10e5*min(1, max(0, time - 10)) - 10e5*min(1,
        max(0, time - 12)) + 10e5*min(1, max(0, time - 14)) - 10e5*min(1, max(0,
        time - 16)) + 10e5*min(1, max(0, time - 18)) - 10e5*min(1, max(0, time
         - 20));
      h[1] = 4e5 + 14e5*min(1, max(0, time - 5)) + 14e5*min(1, max(0, time - 7))
         - 14e5*min(1, max(0, time - 13)) - 14e5*min(1, max(0, time - 15)) +
        8e5*min(1, max(0, time - 17));
      h[2] = 4e5 + 14e5*min(1, max(0, time - 1)) + 14e5*min(1, max(0, time - 3))
         - 14e5*min(1, max(0, time - 9)) - 14e5*min(1, max(0, time - 11)) +
        12e5*min(1, max(0, time - 17));
      for j in 1:N - 1 loop
        der(rhobar_check[j]) = drbdh1[j]*der(h[j]) + drbdh2[j]*der(h[j + 1]) +
          drbdp[j]*der(p);
      end for;
    initial equation
      rhobar_check = rhobar;
    equation
      for j in 1:(N - 1) loop
        if noEvent((h[j] < hl and h[j + 1] < hl) or (h[j] > hv and h[j + 1] >
            hv) or p >= (pc - pzero) or abs(h[j + 1] - h[j]) < hzero) then
          // 1-phase or almost uniform properties
          rhobar[j] = (rho[j] + rho[j + 1])/2;
          drbdp[j] = (drdp[j] + drdp[j + 1])/2;
          drbdh1[j] = drdh[j]/2;
          drbdh2[j] = drdh[j + 1]/2;
          case[j] = 0;
        elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] >= hl and h[j + 1]
             <= hv) then
          // 2-phase
          rhobar[j] = AA*log(rho[j]/rho[j + 1])/(h[j + 1] - h[j]);
          drbdp[j] = (AA1*log(rho[j]/rho[j + 1]) + AA*(1/rho[j]*drdp[j] - 1/rho[
            j + 1]*drdp[j + 1]))/(h[j + 1] - h[j]);
          drbdh1[j] = (rhobar[j] - rho[j])/(h[j + 1] - h[j]);
          drbdh2[j] = (rho[j + 1] - rhobar[j])/(h[j + 1] - h[j]);
          case[j] = 1;
        elseif noEvent(h[j] < hl and h[j + 1] >= hl and h[j + 1] <= hv) then
          // liquid/2-phase
          rhobar[j] = ((rho[j] + rhol)*(hl - h[j])/2 + AA*log(rhol/rho[j + 1]))
            /(h[j + 1] - h[j]);
          drbdp[j] = ((drdp[j] + drldp)*(hl - h[j])/2 + (rho[j] + rhol)/2*dhldp
             + AA1*log(rhol/rho[j + 1]) + AA*(1/rhol*drldp - 1/rho[j + 1]*drdp[
            j + 1]))/(h[j + 1] - h[j]);
          drbdh1[j] = (rhobar[j] - (rho[j] + rhol)/2 + drdh[j]*(hl - h[j])/2)/(
            h[j + 1] - h[j]);
          drbdh2[j] = (rho[j + 1] - rhobar[j])/(h[j + 1] - h[j]);
          case[j] = 2;
        elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] > hv) then
          // 2-phase/vapour
          rhobar[j] = (AA*log(rho[j]/rhov) + (rhov + rho[j + 1])*(h[j + 1] - hv)
            /2)/(h[j + 1] - h[j]);
          drbdp[j] = (AA1*log(rho[j]/rhov) + AA*(1/rho[j]*drdp[j] - 1/rhov*
            drvdp) + (drvdp + drdp[j + 1])*(h[j + 1] - hv)/2 - (rhov + rho[j +
            1])/2*dhvdp)/(h[j + 1] - h[j]);
          drbdh1[j] = (rhobar[j] - rho[j])/(h[j + 1] - h[j]);
          drbdh2[j] = ((rhov + rho[j + 1])/2 - rhobar[j] + drdh[j + 1]*(h[j + 1]
             - hv)/2)/(h[j + 1] - h[j]);
          case[j] = 3;
        elseif noEvent(h[j] < hl and h[j + 1] > hv) then
          // liquid/2-phase/vapour
          rhobar[j] = ((rho[j] + rhol)*(hl - h[j])/2 + AA*log(rhol/rhov) + (
            rhov + rho[j + 1])*(h[j + 1] - hv)/2)/(h[j + 1] - h[j]);
          drbdp[j] = ((drdp[j] + drldp)*(hl - h[j])/2 + (rho[j] + rhol)/2*dhldp
             + AA1*log(rhol/rhov) + AA*(1/rhol*drldp - 1/rhov*drvdp) + (drvdp
             + drdp[j + 1])*(h[j + 1] - hv)/2 - (rhov + rho[j + 1])/2*dhvdp)/(h[
            j + 1] - h[j]);
          drbdh1[j] = (rhobar[j] - (rho[j] + rhol)/2 + drdh[j]*(hl - h[j])/2)/(
            h[j + 1] - h[j]);
          drbdh2[j] = ((rhov + rho[j + 1])/2 - rhobar[j] + drdh[j + 1]*(h[j + 1]
             - hv)/2)/(h[j + 1] - h[j]);
          case[j] = 4;
        elseif noEvent(h[j] >= hl and h[j] <= hv and h[j + 1] < hl) then
          // 2-phase/liquid
          rhobar[j] = (AA*log(rho[j]/rhol) + (rhol + rho[j + 1])*(h[j + 1] - hl)
            /2)/(h[j + 1] - h[j]);
          drbdp[j] = (AA1*log(rho[j]/rhol) + AA*(1/rho[j]*drdp[j] - 1/rhol*
            drldp) + (drldp + drdp[j + 1])*(h[j + 1] - hl)/2 - (rhol + rho[j +
            1])/2*dhldp)/(h[j + 1] - h[j]);
          drbdh1[j] = (rhobar[j] - rho[j])/(h[j + 1] - h[j]);
          drbdh2[j] = ((rhol + rho[j + 1])/2 - rhobar[j] + drdh[j + 1]*(h[j + 1]
             - hl)/2)/(h[j + 1] - h[j]);
          case[j] = 5;
        elseif noEvent(h[j] > hv and h[j + 1] < hl) then
          // vapour/2-phase/liquid
          rhobar[j] = ((rho[j] + rhov)*(hv - h[j])/2 + AA*log(rhov/rhol) + (
            rhol + rho[j + 1])*(h[j + 1] - hl)/2)/(h[j + 1] - h[j]);
          drbdp[j] = ((drdp[j] + drvdp)*(hv - h[j])/2 + (rho[j] + rhov)/2*dhvdp
             + AA1*log(rhov/rhol) + AA*(1/rhov*drvdp - 1/rhol*drldp) + (drldp
             + drdp[j + 1])*(h[j + 1] - hl)/2 - (rhol + rho[j + 1])/2*dhldp)/(h[
            j + 1] - h[j]);
          drbdh1[j] = (rhobar[j] - (rho[j] + rhov)/2 + drdh[j]*(hv - h[j])/2)/(
            h[j + 1] - h[j]);
          drbdh2[j] = ((rhol + rho[j + 1])/2 - rhobar[j] + drdh[j + 1]*(h[j + 1]
             - hl)/2)/(h[j + 1] - h[j]);
          case[j] = 6;
        else
          // vapour/2-phase
          rhobar[j] = ((rho[j] + rhov)*(hv - h[j])/2 + AA*log(rhov/rho[j + 1]))
            /(h[j + 1] - h[j]);
          drbdp[j] = ((drdp[j] + drvdp)*(hv - h[j])/2 + (rho[j] + rhov)/2*dhvdp
             + AA1*log(rhov/rho[j + 1]) + AA*(1/rhov*drvdp - 1/rho[j + 1]*drdp[
            j + 1]))/(h[j + 1] - h[j]);
          drbdh1[j] = (rhobar[j] - (rho[j] + rhov)/2 + drdh[j]*(hv - h[j])/2)/(
            h[j + 1] - h[j]);
          drbdh2[j] = (rho[j + 1] - rhobar[j])/(h[j + 1] - h[j]);
          case[j] = 7;
        end if;
      end for;

      // Saturated fluid property calculations
      sat = Medium.setSat_p(p);
      Ts = sat.Tsat;
      bubble = Medium.setBubbleState(sat, 1);
      dew = Medium.setDewState(sat, 1);
      rhol = Medium.bubbleDensity(sat);
      rhov = Medium.dewDensity(sat);
      hl = Medium.bubbleEnthalpy(sat);
      hv = Medium.dewEnthalpy(sat);
      drldp = Medium.dBubbleDensity_dPressure(sat);
      drvdp = Medium.dDewDensity_dPressure(sat);
      dhldp = Medium.dBubbleEnthalpy_dPressure(sat);
      dhvdp = Medium.dDewEnthalpy_dPressure(sat);
      AA = (hv - hl)/(1/rhov - 1/rhol);
      AA1 = ((dhvdp - dhldp)*(rhol - rhov)*rhol*rhov - (hv - hl)*(rhov^2*drldp
         - rhol^2*drvdp))/(rhol - rhov)^2;

      // Fluid property calculations
      for j in 1:N loop
        fluid[j].p = p;
        fluid[j].h = h[j];
        T[j] = fluid[j].T;
        rho[j] = fluid[j].d;
        drdp[j] = Medium.density_derp_h(fluid[j].state);
        drdh[j] = Medium.density_derh_p(fluid[j].state);
        x[j] = noEvent(if h[j] <= hl then 0 else if h[j] >= hv then 1 else (h[j]
           - hl)/(hv - hl));
      end for;
      annotation (
        experiment(
          StopTime=19,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-009),
        Documentation(info="<html>
This model checks the dynamic mass balance equations of Flow1DFV2ph, by prescribing enthalpy and pressure values that will ensure complete coverage of the different cases.
</html>"),
        __Dymola_experimentSetupOutput);
    end CheckFlow1DFV2phMassBalance;

    model TestFlow1D2phDB "Test case for Flow1D2phDB"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      constant Real pi = Modelica.Constants.pi;
      // number of Nodes
      parameter Integer Nnodes=8;
      // total length
      parameter SI.Length Lhex=20;
      // internal diameter
      parameter SI.Diameter Dhex=0.01;
      // wall thickness
      parameter SI.Thickness thhex=0.002;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=pi*Dhex;
      // internal cross section
      parameter SI.Area Ahex=pi*rhex^2;
      // friction factor
      parameter SI.PerUnit Cfhex=0.005;
      Water.Flow1D2phDB hex(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        A=Ahex,
        Cfnom=0.005,
        DynamicMomentum=false,
        hstartin=1e6,
        hstartout=1e6,
        gamma_b=20000,
        Dhyd=2*rhex,
        wnom=0.05,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        dpnom=1000) annotation (Placement(transformation(extent={{-20,-70},{0,
                -50}},
              rotation=0)));
      ThermoPower.Water.ValveLin valve(Kv=0.05/60e5) annotation (Placement(
            transformation(extent={{30,-70},{50,-50}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(p0=1000)
                                         annotation (Placement(transformation(
              extent={{70,-70},{90,-50}}, rotation=0)));
      Modelica.Blocks.Sources.Step hIn(
        height=0,
        offset=1e6,
        startTime=30) annotation (Placement(transformation(extent={{-80,-40},{-60,
                -20}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extTemp1(
        duration=100,
        height=50,
        offset=540,
        startTime=100) annotation (Placement(transformation(extent={{-100,20},{
                -80,40}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                Source(
        w0=0.05,
        G=0.05/600e5,
        use_in_h=true,
        p0=6000000)   annotation (Placement(transformation(extent={{-60,-70},{-40,
                -50}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extTemp2(
        duration=100,
        height=-50,
        startTime=500) annotation (Placement(transformation(extent={{-100,60},{
                -80,80}}, rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-66,40},{-46,60}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1,
        duration=1)                                           annotation (
          Placement(transformation(extent={{10,-40},{30,-20}}, rotation=0)));
      Thermal.MetalTube Tube(
        N=Nnodes,
        L=Lhex,
        rint=rhex,
        rhomcm=7000*680,
        lambda=20,
        rext=rhex + 2*thhex,
        Tstart1=510,
        TstartN=510,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) annotation (
          Placement(transformation(extent={{-20,-6},{0,-26}}, rotation=0)));
      Thermal.ConvHT_htc htFluid(N=Nnodes) annotation (Placement(transformation(
              extent={{-20,-26},{0,-46}}, rotation=0)));
      Thermal.ConvHT htExt(N=Nnodes, gamma=10000) annotation (Placement(
            transformation(extent={{-20,-6},{0,14}}, rotation=0)));
      Thermal.TempSource1Dlin tempSource(N=Nnodes) annotation (Placement(
            transformation(extent={{-20,16},{0,36}}, rotation=0)));
      Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(extent=
               {{0,70},{20,90}}, rotation=0)));
      Modelica.Blocks.Sources.Constant DT(k=5) annotation (Placement(
            transformation(extent={{-36,60},{-16,80}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(hex.outfl, valve.inlet) annotation (Line(
          points={{0,-60},{16,-60},{30,-60}},
          color={0,0,255},
          thickness=0.5));
      connect(valve.outlet, Sink.flange) annotation (Line(
          points={{50,-60},{70,-60}},
          color={0,0,255},
          thickness=0.5));
      connect(Source.flange, hex.infl) annotation (Line(
          points={{-40,-60},{-30,-60},{-20,-60}},
          thickness=0.5,
          color={0,0,255}));
      connect(htExt.side2, Tube.ext)
        annotation (Line(points={{-10,0.9},{-10,-12.9}}, color={255,127,0}));
      connect(Tube.int, htFluid.otherside)
        annotation (Line(points={{-10,-19},{-10,-33}}, color={255,127,0}));
      connect(htFluid.fluidside, hex.wall)
        annotation (Line(points={{-10,-39},{-10,-55}}));
      connect(tempSource.wall, htExt.side1)
        annotation (Line(points={{-10,23},{-10,7}}, color={255,127,0}));
      connect(hIn.y, Source.in_h) annotation (Line(points={{-59,-30},{-46,-30},
              {-46,-54}}, color={0,0,127}));
      connect(tempSource.temperature_node1, Add1.y) annotation (Line(points={{-14,
              29},{-14,50},{-45,50}}, color={0,0,127}));
      connect(tempSource.temperature_nodeN, Add2.y) annotation (Line(points={{-6,
              28.8},{-6,50},{30,50},{30,80},{21,80}}, color={0,0,127}));
      connect(Add2.u2, DT.y) annotation (Line(points={{-2,74},{-8,74},{-8,70},{
              -15,70}}, color={0,0,127}));
      connect(Add2.u1, Add1.y) annotation (Line(points={{-2,86},{-40,86},{-40,
              50},{-45,50}}, color={0,0,127}));
      connect(xValve.y, valve.cmd) annotation (Line(points={{31,-30},{40,-30},{
              40,-52}}, color={0,0,127}));
      connect(extTemp1.y, Add1.u2)
        annotation (Line(points={{-79,30},{-68,44}}, color={0,0,127}));
      connect(extTemp2.y, Add1.u1)
        annotation (Line(points={{-79,70},{-68,56}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
        experiment(
          StopTime=1000,
          __Dymola_NumberOfIntervals=5000,
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
</HTML>", revisions="<html>
<ul>
    <li><i>4 Feb 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    First release.</li>
</ul>
</html>"));
    end TestFlow1D2phDB;

    model TestFlow1D2phDB_hf "Test case for Flow1D2ph"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph (smoothModel=true);
      constant Real pi = Modelica.Constants.pi;
      // number of Nodes
      parameter Integer Nnodes=10;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dhex=0.02;
      // wall thickness
      parameter SI.Thickness thhex=0;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=Dhex;
      // internal cross section
      parameter SI.Area Ahex=pi*rhex^2;
      // friction factor
      parameter Real Cfhex=0.005;
      Water.Flow1D2phDB hex(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dhex,
        A=Ahex,
        Cfnom=0.005,
        DynamicMomentum=false,
        hstartin=6e5,
        hstartout=6e5,
        redeclare package Medium = Medium,
        wnom=0.1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        dpnom=1000) annotation (Placement(transformation(extent={{-30,-50},{-10,
                -30}}, rotation=0)));
      ThermoPower.Water.ValveLin valve(Kv=0.1/15e5) annotation (Placement(
            transformation(extent={{20,-50},{40,-30}}, rotation=0)));
      ThermoPower.Thermal.HeatSource1Dhtc heatSource(
        N=Nnodes,
        L=Lhex,
        omega=omegahex) annotation (Placement(transformation(extent={{-30,-28},
                {-10,-8}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(p0=1e5) annotation (Placement(transformation(
              extent={{60,-50},{80,-30}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower(
        duration=30,
        height=3e5,
        startTime=10) annotation (Placement(transformation(extent={{-80,44},{-60,
                64}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                Source(w0=0.1, use_in_h=true)
                                               annotation (Placement(
            transformation(extent={{-68,-50},{-48,-30}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower2(
        duration=10,
        height=-3e5,
        startTime=70) annotation (Placement(transformation(extent={{-80,74},{-60,
                94}}, rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-40,60},{-20,80}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1,
        duration=1)                                           annotation (
          Placement(transformation(extent={{0,-20},{20,0}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp hIn1(
        duration=30,
        offset=6e5,
        height=2.2e6,
        startTime=120) annotation (Placement(transformation(extent={{-90,-20},{
                -70,0}}, rotation=0)));
      Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(extent=
               {{40,60},{60,80}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower1(
        duration=60,
        height=-2.5e5,
        startTime=170) annotation (Placement(transformation(extent={{0,74},{20,
                94}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower3(
        duration=30,
        height=2.5e5,
        startTime=260) annotation (Placement(transformation(extent={{0,44},{20,
                64}}, rotation=0)));
      Modelica.Blocks.Math.Add Add3 annotation (Placement(transformation(extent=
               {{-46,0},{-26,20}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    initial equation
      der(hex.p) = 0;
      der(hex.htilde) = zeros(Nnodes - 1);

    equation
      connect(heatSource.wall, hex.wall) annotation (Line(points={{-20,-21},{-20,
              -28},{-20,-35}}, color={255,127,0}));
      connect(hex.outfl, valve.inlet) annotation (Line(
          points={{-10,-40},{20,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(valve.outlet, Sink.flange) annotation (Line(
          points={{40,-40},{60,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(Source.flange, hex.infl) annotation (Line(
          points={{-48,-40},{-30,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(hIn1.y, Source.in_h) annotation (Line(points={{-69,-10},{-54,-10},
              {-54,-34}}, color={0,0,127}));
      connect(xValve.y, valve.cmd) annotation (Line(points={{21,-10},{30,-10},{
              30,-32}}, color={0,0,127}));
      connect(Add3.y, heatSource.power) annotation (Line(points={{-25,10},{-20,
              10},{-20,-14}}, color={0,0,127}));
      connect(Add3.u1, Add2.y) annotation (Line(points={{-48,16},{-58,16},{-58,
              30},{70,30},{70,70},{61,70}}, color={0,0,127}));
      connect(Add3.u2, Add1.y) annotation (Line(points={{-48,4},{-66,4},{-66,38},
              {-10,38},{-10,70},{-19,70}}, color={0,0,127}));
      connect(extPower.y, Add1.u2)
        annotation (Line(points={{-59,54},{-42,64}}, color={0,0,127}));
      connect(extPower2.y, Add1.u1)
        annotation (Line(points={{-59,84},{-42,76}}, color={0,0,127}));
      connect(Add2.u1, extPower1.y)
        annotation (Line(points={{38,76},{21,84}}, color={0,0,127}));
      connect(Add2.u2, extPower3.y)
        annotation (Line(points={{38,64},{21,54}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
        experiment(
          StopTime=300,
          __Dymola_NumberOfIntervals=2000,
          Tolerance=1e-007),
        Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2phDB</tt> (fluid side of a heat exchanger, finite volumes, two-phase flow, heat transfer computation) with a prescribed external heat flux, for debugging purposes. The heat transfer coefficient on the <tt>wall</tt> connector should be a continuous function.
<p>
Simulation Interval = [0...300] sec <br>
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-7
</p>
</HTML>", revisions="<HTML>
<ul>
    <li><i>11 Oct 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    First release.</li>
</ul>
</HTML>"),
        __Dymola_experimentSetupOutput(equdistant=false));
    end TestFlow1D2phDB_hf;

    model TestFlow1D2phChen "Test case for Flow1D2phChen"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      import Modelica.Constants.*;
      // number of Nodes
      parameter Integer Nnodes=8;
      // total length
      parameter SI.Length Lhex=20;
      // internal diameter
      parameter SI.Diameter Dhex=0.01;
      // wall thickness
      parameter SI.Thickness thhex=0.002;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=pi*Dhex;
      // internal cross section
      parameter SI.Area Ahex=pi*rhex^2;
      // friction factor
      parameter SI.PerUnit Cfhex=0.005;
      Water.Flow1D2phChen hex(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        A=Ahex,
        Cfnom=0.005,
        DynamicMomentum=false,
        hstartin=1e6,
        hstartout=1e6,
        Dhyd=2*rhex,
        redeclare package Medium = Medium,
        wnom=0.05,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        pstart=6000000)                                        annotation (
          Placement(transformation(extent={{-20,-70},{0,-50}}, rotation=0)));
      ThermoPower.Water.ValveLin valve(Kv=0.05/60e5) annotation (Placement(
            transformation(extent={{30,-70},{50,-50}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(p0=10000)
                                         annotation (Placement(transformation(
              extent={{70,-70},{90,-50}}, rotation=0)));
      Modelica.Blocks.Sources.Step hIn(
        height=0,
        offset=1e6,
        startTime=30) annotation (Placement(transformation(extent={{-80,-40},{-60,
                -20}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extTemp1(
        duration=100,
        height=60,
        offset=540,
        startTime=100) annotation (Placement(transformation(extent={{-100,20},{
                -80,40}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                Source(
        w0=0.05,
        G=0.05/600e5,
        p0=6000000,
        use_in_h=true)
                      annotation (Placement(transformation(extent={{-62,-70},{
                -42,-50}},
                       rotation=0)));
      Modelica.Blocks.Sources.Ramp extTemp2(
        duration=100,
        height=-30,
        startTime=500) annotation (Placement(transformation(extent={{-100,60},{
                -80,80}}, rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-66,40},{-46,60}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1,
        duration=1)                                           annotation (
          Placement(transformation(extent={{10,-40},{30,-20}}, rotation=0)));
      Thermal.MetalTube Tube(
        N=Nnodes,
        L=Lhex,
        rint=rhex,
        rhomcm=7000*680,
        lambda=20,
        rext=rhex + 2*thhex,
        Tstart1=510,
        TstartN=510,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) annotation (
          Placement(transformation(extent={{-20,-6},{0,-26}}, rotation=0)));
      Thermal.ConvHT_htc htFluid(N=Nnodes) annotation (Placement(transformation(
              extent={{-20,-26},{0,-46}}, rotation=0)));
      Thermal.ConvHT htExt(N=Nnodes, gamma=10000) annotation (Placement(
            transformation(extent={{-20,-6},{0,14}}, rotation=0)));
      Thermal.TempSource1Dlin tempSource(N=Nnodes) annotation (Placement(
            transformation(extent={{-20,16},{0,36}}, rotation=0)));
      Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(extent=
               {{0,70},{20,90}}, rotation=0)));
      Modelica.Blocks.Sources.Constant DT(k=5) annotation (Placement(
            transformation(extent={{-36,60},{-16,80}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(hex.outfl, valve.inlet) annotation (Line(
          points={{0,-60},{30,-60}},
          color={0,0,255},
          thickness=0.5));
      connect(valve.outlet, Sink.flange) annotation (Line(
          points={{50,-60},{70,-60}},
          color={0,0,255},
          thickness=0.5));
      connect(Source.flange, hex.infl) annotation (Line(
          points={{-42,-60},{-20,-60}},
          color={0,0,255},
          thickness=0.5));
      connect(htExt.side2, Tube.ext)
        annotation (Line(points={{-10,0.9},{-10,-12.9}}, color={255,127,0}));
      connect(Tube.int, htFluid.otherside)
        annotation (Line(points={{-10,-19},{-10,-33}}, color={255,127,0}));
      connect(htFluid.fluidside, hex.wall)
        annotation (Line(points={{-10,-39},{-10,-55}}));
      connect(tempSource.wall, htExt.side1)
        annotation (Line(points={{-10,23},{-10,7}}, color={255,127,0}));
      connect(hIn.y, Source.in_h) annotation (Line(points={{-59,-30},{-48,-30},
              {-48,-54}}, color={0,0,127}));
      connect(xValve.y, valve.cmd) annotation (Line(points={{31,-30},{40,-30},{
              40,-52}}, color={0,0,127}));
      connect(Add1.y, tempSource.temperature_node1) annotation (Line(points={{-45,
              50},{-14,50},{-14,29}}, color={0,0,127}));
      connect(DT.y, Add2.u2) annotation (Line(points={{-15,70},{-8,70},{-8,74},
              {-2,74}}, color={0,0,127}));
      connect(Add2.u1, Add1.y) annotation (Line(points={{-2,86},{-40,86},{-40,
              50},{-45,50}}, color={0,0,127}));
      connect(tempSource.temperature_nodeN, Add2.y) annotation (Line(points={{-6,
              28.8},{-6,50},{30,50},{30,80},{21,80}}, color={0,0,127}));
      connect(extTemp1.y, Add1.u2)
        annotation (Line(points={{-79,30},{-68,44}}, color={0,0,127}));
      connect(extTemp2.y, Add1.u1)
        annotation (Line(points={{-79,70},{-68,56}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
        experiment(StopTime=1000, Tolerance=1e-008),
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
</HTML>", revisions="<html>
<ul>
    <li><i>4 Feb 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput(equdistant=false));
    end TestFlow1D2phChen;

    model TestFlow1D2phChen_hf "Test case for Flow1D2ph"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph (smoothModel=true);
      constant Real pi = Modelica.Constants.pi;
      // number of Nodes
      parameter Integer Nnodes=10;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dhex=0.02;
      // wall thickness
      parameter SI.Thickness thhex=0;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=Dhex;
      // internal cross section
      parameter SI.Area Ahex=pi*rhex^2;
      // friction factor
      parameter Real Cfhex=0.005;
      Water.Flow1D2phChen hex(
        N=Nnodes,
        L=Lhex,
        omega=omegahex,
        Dhyd=Dhex,
        A=Ahex,
        Cfnom=0.005,
        DynamicMomentum=false,
        hstartin=6e5,
        hstartout=6e5,
        redeclare package Medium = Medium,
        wnom=0.1,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
        initOpt=ThermoPower.Choices.Init.Options.steadyState) annotation (
          Placement(transformation(extent={{-30,-50},{-10,-30}}, rotation=0)));
      ThermoPower.Water.ValveLin valve(Kv=0.1/15e5) annotation (Placement(
            transformation(extent={{20,-50},{40,-30}}, rotation=0)));
      ThermoPower.Thermal.HeatSource1Dhtc heatSource(
        N=Nnodes,
        L=Lhex,
        omega=omegahex) annotation (Placement(transformation(extent={{-30,-28},
                {-10,-8}}, rotation=0)));
      ThermoPower.Water.SinkPressure
                              Sink(p0=10000)
                                           annotation (Placement(transformation(
              extent={{60,-50},{80,-30}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower(
        duration=30,
        height=3e5,
        startTime=10) annotation (Placement(transformation(extent={{-80,44},{-60,
                64}}, rotation=0)));
      ThermoPower.Water.SourceMassFlow
                                Source(w0=0.1, use_in_h=true)
                                               annotation (Placement(
            transformation(extent={{-68,-50},{-48,-30}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower2(
        duration=10,
        height=-3e5,
        startTime=70) annotation (Placement(transformation(extent={{-80,76},{-60,
                96}}, rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-40,60},{-20,80}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1,
        duration=1)                                           annotation (
          Placement(transformation(extent={{0,-20},{20,0}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp hIn1(
        duration=30,
        offset=6e5,
        height=2.2e6,
        startTime=120) annotation (Placement(transformation(extent={{-90,-20},{
                -70,0}}, rotation=0)));
      Modelica.Blocks.Math.Add Add2 annotation (Placement(transformation(extent=
               {{40,60},{60,80}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower1(
        duration=60,
        height=-2.5e5,
        startTime=170) annotation (Placement(transformation(extent={{0,76},{20,
                96}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower3(
        duration=30,
        height=2.5e5,
        startTime=260) annotation (Placement(transformation(extent={{0,44},{20,
                64}}, rotation=0)));
      Modelica.Blocks.Math.Add Add3 annotation (Placement(transformation(extent=
               {{-52,0},{-32,20}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(heatSource.wall, hex.wall)
        annotation (Line(points={{-20,-21},{-20,-35}}, color={255,127,0}));
      connect(hex.outfl, valve.inlet) annotation (Line(
          points={{-10,-40},{20,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(valve.outlet, Sink.flange) annotation (Line(
          points={{40,-40},{60,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(Source.flange, hex.infl) annotation (Line(
          points={{-48,-40},{-30,-40}},
          color={0,0,255},
          thickness=0.5));
    initial equation
      der(hex.p) = 0;
      der(hex.htilde) = zeros(Nnodes - 1);

    equation
      connect(extPower.y, Add1.u2)
        annotation (Line(points={{-59,54},{-42,64}}, color={0,0,127}));
      connect(extPower2.y, Add1.u1)
        annotation (Line(points={{-59,86},{-42,76}}, color={0,0,127}));
      connect(extPower1.y, Add2.u1)
        annotation (Line(points={{21,86},{38,76}}, color={0,0,127}));
      connect(extPower3.y, Add2.u2)
        annotation (Line(points={{21,54},{38,64}}, color={0,0,127}));
      connect(xValve.y, valve.cmd) annotation (Line(points={{21,-10},{30,-10},{
              30,-32}}, color={0,0,127}));
      connect(Source.in_h, hIn1.y) annotation (Line(points={{-54,-34},{-54,-10},
              {-69,-10}}, color={0,0,127}));
      connect(Add3.y, heatSource.power) annotation (Line(points={{-31,10},{-20,
              10},{-20,-14}}, color={0,0,127}));
      connect(Add3.u1, Add2.y) annotation (Line(points={{-54,16},{-60,16},{-60,
              30},{72,30},{72,70},{61,70}}, color={0,0,127}));
      connect(Add3.u2, Add1.y) annotation (Line(points={{-54,4},{-72,4},{-72,36},
              {-10,36},{-10,70},{-19,70}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=false,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
        experiment(
          StopTime=300,
          __Dymola_NumberOfIntervals=2000,
          Tolerance=1e-007),
        Documentation(info="<HTML>
<p>The model is designed to test the component  <tt>Flow1D2phDB</tt> (fluid side of a heat exchanger, finite volumes, two-phase flow, heat transfer computation) with a prescribed external heat flux, for debugging purposes. The heat transfer coefficient on the <tt>wall</tt> connector should be a continuous function.
<p>
Simulation Interval = [0...300] sec <br>
Integration Algorithm = DASSL <br>
Algorithm Tolerance = 1e-7
</p>
</HTML>", revisions="<HTML>
<ul>
    <li><i>11 Oct 2004</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    First release.</li>
</ul>
</HTML>"),
        __Dymola_experimentSetupOutput(equdistant=false));
    end TestFlow1D2phChen_hf;

    model TestFlow1Dfem2ph "Test case for Flow1D2ph"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      // number of Nodes
      parameter Integer Nnodes=11;
      // total length
      parameter SI.Length Lhex=10;
      // internal diameter
      parameter SI.Diameter Dhex=0.03;
      // wall thickness
      parameter SI.Thickness thhex=1e-3;
      // internal radius
      parameter SI.Radius rhex=Dhex/2;
      // internal perimeter
      parameter SI.Length omegahex=Modelica.Constants.pi*Dhex;
      // internal cross section
      parameter SI.Area Ahex=Modelica.Constants.pi*rhex^2;
      // friction factor
      parameter SI.PerUnit Cfhex=0.005;

      parameter SI.SpecificEnthalpy hin=6e5;
      parameter SI.Pressure phex=1e6;
      parameter SI.MassFlowRate whex=1;

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
        ML=0,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        dpnom=1000) annotation (Placement(transformation(extent={{-30,-50},{-10,
                -30}}, rotation=0)));
      Water.ValveLin valve(Kv=whex/(phex)) annotation (Placement(transformation(
              extent={{20,-50},{40,-30}}, rotation=0)));
      Water.SinkPressure
                  Sink(p0=0) annotation (Placement(transformation(extent={{60,-50},
                {80,-30}}, rotation=0)));
      Modelica.Blocks.Sources.Step hIn(
        height=1e5,
        offset=hin,
        startTime=50) annotation (Placement(transformation(extent={{-90,-20},{-70,
                0}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower(
        duration=30,
        height=3e6,
        startTime=10) annotation (Placement(transformation(extent={{-90,24},{-70,
                44}}, rotation=0)));
      Water.SourceMassFlow
                    Source(
        h=hin,
        w0=whex,
        p0=phex,
        G=0,
        use_in_h=true)
             annotation (Placement(transformation(extent={{-68,-50},{-48,-30}},
              rotation=0)));
      Modelica.Blocks.Sources.Ramp extPower2(
        duration=10,
        height=-3e6,
        startTime=70) annotation (Placement(transformation(extent={{-90,54},{-70,
                74}}, rotation=0)));
      Modelica.Blocks.Math.Add Add1 annotation (Placement(transformation(extent=
               {{-50,40},{-30,60}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp xValve(height=0, offset=1,
        duration=1)                                           annotation (
          Placement(transformation(extent={{0,-20},{20,0}}, rotation=0)));
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
        initOpt=ThermoPower.Choices.Init.Options.steadyState) annotation (
          Placement(transformation(
            origin={-20,-10},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Thermal.HeatSource1D HeatSource1D1(
        N=Nnodes,
        Nt=1,
        L=Lhex,
        omega=(rhex + thhex)*2*Modelica.Constants.pi) annotation (Placement(
            transformation(extent={{-30,4},{-10,24}}, rotation=0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
    equation
      connect(hex.outfl, valve.inlet) annotation (Line(
          points={{-10,-40},{20,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(valve.outlet, Sink.flange) annotation (Line(
          points={{40,-40},{60,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(Source.flange, hex.infl) annotation (Line(
          points={{-48,-40},{-30,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(hex.wall, MetalWall.int)
        annotation (Line(points={{-20,-35},{-20,-13}}, color={255,127,0}));
      connect(HeatSource1D1.wall, MetalWall.ext)
        annotation (Line(points={{-20,11},{-20,-6.9}}, color={255,127,0}));
      connect(extPower2.y, Add1.u1)
        annotation (Line(points={{-69,64},{-52,56}}, color={0,0,127}));
      connect(extPower.y, Add1.u2)
        annotation (Line(points={{-69,34},{-52,44}}, color={0,0,127}));
      connect(hIn.y, Source.in_h) annotation (Line(points={{-69,-10},{-54,-10},
              {-54,-34}}, color={0,0,127}));
      connect(Add1.y, HeatSource1D1.power) annotation (Line(points={{-29,50},{-20,
              50},{-20,18}}, color={0,0,127}));
      connect(xValve.y, valve.cmd) annotation (Line(points={{21,-10},{30,-10},{
              30,-32}}, color={0,0,127}));
      annotation (
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
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
</HTML>", revisions="<html>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput(equdistant=false));
    end TestFlow1Dfem2ph;

    model Flow1D_check
      "Extended Flow1D model with mass & energy balance computation"

      extends Water.Flow1D;
      SI.SpecificEnergy Etot;
      SI.SpecificEnergy Evol[N - 1];
      SI.Mass Mtot;
      SI.Mass Mvol[N - 1];
      SI.MassFlowRate balM;
      SI.Power balE;
    equation
      for j in 1:N - 1 loop
        Mvol[j] = A*l*rhobar[j];
        Evol[j] = Mvol[j]*((h[j] + h[j + 1])/2 - p/rhobar[j]);
      end for;
      // M is computed in base class
      Mtot = M;
      Etot = sum(Evol);
      balM = infl.m_flow + outfl.m_flow;

      balE = infl.m_flow*(if infl.m_flow > 0 then inStream(infl.h_outflow)
         else infl.h_outflow) + outfl.m_flow*(if outfl.m_flow > 0 then inStream(
        outfl.h_outflow) else outfl.h_outflow) + sum(wall.phi[1:N - 1] + wall.phi[
        2:N])/2*omega*l;
      annotation (Documentation(info="<HTML>
<p>This model extends <tt>Water.Flow1D</tt> by adding the computation of mass and energy flows and buildups. It can be used to check the correctness of the <tt>Water.Flow1D</tt> model.</p>
</HTML>", revisions="<html>
<ul>
<li><i>1 Oct 2003</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco
Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
    end Flow1D_check;

    model TestWalls "Test various wall models"
      extends Modelica.Icons.Example;

      Thermal.MetalWallFV wall1(
        Nw=2,
        M=1,
        cm=500,
        Tstartbar=293.15)
        annotation (Placement(transformation(extent={{-50,32},{-30,52}})));
      Thermal.HeatSource1DFV internalFlowSource1(Nw=2)
        annotation (Placement(transformation(extent={{-50,46},{-30,66}})));
      Thermal.HeatSource1DFV externalFlowSource1(Nw=2)
        annotation (Placement(transformation(extent={{-50,34},{-30,14}})));
      Modelica.Blocks.Sources.Step powerInternal1(
        startTime=0,
        height=1000,
        offset=0)
        annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
      Modelica.Blocks.Sources.Step powerExternal1
        annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
      Thermal.MetalWallFV wall2(
        Nw=2,
        M=1,
        cm=500,
        WallRes=true,
        UA_ext=200,
        UA_int=800,
        Tstartbar=293.15)
        annotation (Placement(transformation(extent={{30,32},{50,52}})));
      Thermal.TempSource1DFV internalFlowSource2(Nw=2)
        annotation (Placement(transformation(extent={{30,46},{50,66}})));
      Thermal.TempSource1DFV externalFlowSource2(Nw=2)
        annotation (Placement(transformation(extent={{30,34},{50,14}})));
      Modelica.Blocks.Sources.Step temperatureInternal2(
        startTime=0,
        height=10,
        offset=293.15)
        annotation (Placement(transformation(extent={{0,60},{20,80}})));
      Modelica.Blocks.Sources.Constant temperatureExternal2(k=293.15)
        annotation (Placement(transformation(extent={{0,0},{20,20}})));
    equation
      connect(wall1.ext, externalFlowSource1.wall) annotation (Line(
          points={{-40,38.9},{-40,27}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(internalFlowSource1.wall, wall1.int) annotation (Line(
          points={{-40,53},{-40,45}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(powerInternal1.y, internalFlowSource1.power) annotation (Line(
          points={{-59,70},{-40,70},{-40,60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(powerExternal1.y, externalFlowSource1.power) annotation (Line(
          points={{-59,10},{-40,10},{-40,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(wall2.ext, externalFlowSource2.wall) annotation (Line(
          points={{40,38.9},{40,27}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(internalFlowSource2.wall, wall2.int) annotation (Line(
          points={{40,53},{40,45}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(temperatureExternal2.y, externalFlowSource2.temperature)
        annotation (Line(
          points={{21,10},{40,10},{40,20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(temperatureInternal2.y, internalFlowSource2.temperature)
        annotation (Line(
          points={{21,70},{40,70},{40,60}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics),
        experiment(StopTime=5, Tolerance=1e-006),
        __Dymola_experimentSetupOutput);
    end TestWalls;

    model TestHeatTransfer2phDB "Test of two-phase heat transfer components"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.StandardWater
        constrainedby Modelica.Media.Interfaces.PartialTwoPhaseMedium;

      parameter Integer Nf(min=2) = 6 "Number of nodes on the fluid side";
      parameter Integer Nw = 5 "Number of nodes on the wallside";
      parameter Integer Nt(min=1) = 1 "Number of tubes in parallel";
      parameter SI.Distance L = 2 "Tube length";
      parameter SI.Area A = 1e-3 "Cross-sectional area (single tube)";
      parameter SI.Length omega = 1e-3
        "Wet perimeter of heat transfer surface (single tube)";
      parameter SI.Length Dhyd = 1e-4 "Hydraulic Diameter (single tube)";
      parameter SI.MassFlowRate wnom = 10
        "Nominal mass flow rate (single tube)";
      parameter Boolean useAverageTemperature = true
        "= true to use average temperature for heat transfer";

      parameter Medium.AbsolutePressure p = 1e6;
      parameter Medium.SpecificEnthalpy h_liq = 1e5;
      parameter Medium.SpecificEnthalpy h_vap = 3.2e6;
      parameter Real u(unit = "1/s") = 1 "For unit consistency";

      replaceable ThermoPower.Thermal.HeatTransferFV.HeatTransfer2phDB
        heatTransfer constrainedby
        ThermoPower.Thermal.BaseClasses.DistributedHeatTransferFV(
        redeclare package Medium = Medium,
        final Nf=Nf,
        final Nw=Nw,
        final Nt=Nt,
        final L=L,
        final A=A,
        final Dhyd=Dhyd,
        final omega=omega,
        final wnom=wnom/Nt,
        final w=w,
        final fluidState=fluidState);

      ThermoPower.Thermal.TempSource1DFV tempSource(Nw = Nw);

      Medium.SpecificEnthalpy h1, h2;
      Medium.SpecificEnthalpy h[Nf];
      Medium.ThermodynamicState fluidState[Nf];
      Medium.MassFlowRate w[Nf];
      SI.Power Q[Nw] = -tempSource.wall.Q;
    equation
      h1 = if time < 2 then h_liq else
           if time < 3 then h_liq + (h_vap-h_liq)*u*(time-2) else
           if time < 4 then h_vap else
           h_vap + (h_liq-h_vap)*u*(time-4);
      h2 = if time < 1 then h_liq + (h_vap-h_liq)*u*time else
           if time < 3 then h_vap else
           if time < 4 then h_vap + (h_liq-h_vap)*u*(time-3) else
           h_liq;
      h = linspace(h1,h2,Nf);
      for i in 1:Nf loop
        fluidState[i] = Medium.setState_ph(p,h[i]);
      end for;
      w = ones(Nf)*wnom*(
            if time < 1 then 1 else
            if time < 1.5 then 1-(time-1)*2 else
            if time < 2 then (time-1.5)*2 else
            1);
      connect(tempSource.wall, heatTransfer.wall);
      tempSource.temperature = 800;
      annotation (experiment(
          StopTime=5,
          __Dymola_NumberOfIntervals=50000,
          Tolerance=1e-006), __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>The test demonstrates that the computed heat flows change continuously with the node enthalpies and the flow rate, as required to guarantee the existence and uniqueness of the DAE solution.</p>
</html>", revisions="<html>
<ul>
    <li><i>15 Lug 2014</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    First release.</li>
</ul>
</html>"));
    end TestHeatTransfer2phDB;

    model TestHeatTransfer2phDBa "Test case for HeatTransfer2phDB"
      extends Modelica.Icons.Example;
      package Medium = Modelica.Media.Water.WaterIF97_ph;
      parameter Integer Nnodes = 10;
      parameter Medium.SpecificEnthalpy hstartin = 1e5;
      Medium.SpecificEnthalpy hstartout = (1e5+0.001) + 3.4e6*time;
      Medium.SpecificEnthalpy h[Nnodes] = linspace(hstartin,hstartout,Nnodes);
      parameter SI.Area Across = 2.827e-3; // r = 0.03 [m] , A = pi*r^2
      parameter Medium.AbsolutePressure p = 3e6;
      parameter Medium.MassFlowRate wnom = 2;
      parameter Medium.MassFlowRate w[Nnodes] = wnom*ones(Nnodes);
      Medium.ThermodynamicState fluidState[Nnodes];

      Thermal.HeatTransferFV.HeatTransfer2phDB HeatTransfer(
        Nf=Nnodes,
        Nw=Nnodes - 1,
        Nt=1,
        A=Across,
        Dhyd=0.06,
        omega=0.188496,
        L=10,
        wnom=wnom,
        redeclare package Medium = Medium,
        fluidState=fluidState,
        w=w,
        gamma_b=30000)
        annotation (Placement(transformation(extent={{-18,-40},{18,-10}})));
      Thermal.TempSource1DFV TempSource(Nw=Nnodes - 1)
        annotation (Placement(transformation(extent={{-14,0},{14,26}})));
      Modelica.Blocks.Sources.Constant Temperature_const(k=873.15)
                                                 annotation (Placement(
            transformation(extent={{-62,56},{-42,76}},rotation=0)));
    equation
      connect(TempSource.wall, HeatTransfer.wall) annotation (Line(
          points={{0,9.1},{0,-20.5}},
          color={255,127,0},
          smooth=Smooth.None));

      for j in 1:Nnodes loop
        fluidState[j] = Medium.setState_ph(p, h[j]);
      end for;
      connect(Temperature_const.y, TempSource.temperature) annotation (Line(
          points={{-41,66},{0,66},{0,18.2}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        Diagram(graphics),
        experiment(
          StartTime=0.1,
          __Dymola_NumberOfIntervals=10000,
          Tolerance=1e-006),
        Documentation(info="<html>
<p>The model is designed to test the component <code>Water.HeatTransfer2phDB</code> during the evaporation process, using water as a test medium.</p>
<p>The wall temperature is fixed and uniform. The fluid enthalpy spatial distribution is linear: the inlet condition is subcooled fluid, while the outlet condition is progressively increased from subcooled to superheated. The ensuing heat flows do not show any discontinuity when the phase boundaries cross the volume boundaries.</p>
<p>Simulation Interval = [0...1] sec </p>
</html>", revisions="<html>
<ul>
    <li><i>3 May 2013</i> by <a href=\"mailto:stefanoboni@hotmail.it\">Stefano Boni</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput);
    end TestHeatTransfer2phDBa;

    model TestHeatTransfer2phDBb "Test case for HeatTransfer2phDB"
      extends Modelica.Icons.Example;
      extends TestHeatTransfer2phDBa(
        hstartin = 3.5e6,
        hstartout = (3.5e6+0.001) - 3.4e6*time);

      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        Diagram(graphics),
        experiment(
          StartTime=0.1,
          __Dymola_NumberOfIntervals=10000,
          Tolerance=1e-006),
        Documentation(info="<html>
<p>The model is designed to test the component <code>Water.HeatTransfer2phDB</code> during the condensation process, using water as a test medium.</p>
<p>The wall temperature is fixed and uniform. The fluid enthalpy spatial distribution is linear: the inlet condition is subcooled fluid, while the outlet condition is progressively increased from subcooled to superheated. The ensuing heat flows do not show any discontinuity when the phase boundaries cross the volume boundaries.</p>
<p>Simulation Interval = [0...1] sec </p>
</html>", revisions="<html>
<ul>
    <li><i>3 May 2013</i> by <a href=\"mailto:stefanoboni@hotmail.it\">Stefano Boni</a>:<br>
    First release.</li>
</ul>
</html>"),
        __Dymola_experimentSetupOutput);
    end TestHeatTransfer2phDBb;

    model TestFlowDependentHeatTransferCoefficient2ph
      "Test of two-phase heat transfer components"
      extends TestHeatTransfer2phDB(redeclare
          Thermal.HeatTransferFV.FlowDependentHeatTransferCoefficient2ph
          heatTransfer(
          alpha=0.8,
          gamma_nom_liq=2000,
          gamma_nom_2ph=5000,
          gamma_nom_vap=3000));
      annotation (experiment(
          StopTime=5,
          __Dymola_NumberOfIntervals=50000,
          Tolerance=1e-006), __Dymola_experimentSetupOutput,
        Documentation(revisions="<html>
<ul>
    <li><i>15 Lug 2014</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
    First release.</li>
</ul>
</html>", info="<html>
<p>The test demonstrates that the computed heat flows change continuously with the node enthalpies and the flow rate, as required to guarantee the existence and uniqueness of the DAE solution.</p>
</html>"));
    end TestFlowDependentHeatTransferCoefficient2ph;

    model TestWaterFlow1DFV_AdaptiveAverageTemp
      "Test case for Water.Flow1DFV"
      extends Modelica.Icons.Example;
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialPureSubstance;
      parameter Integer Nnodes=4 "Number of nodes";
      parameter Integer Nt = 5 "Number of tubes";
      parameter Modelica.SIunits.Length Lhex=2 "Total length";
      parameter Modelica.SIunits.Diameter Dihex=0.02 "Internal diameter";
      final parameter Modelica.SIunits.Radius rhex=Dihex/2 "Internal radius";
      final parameter Modelica.SIunits.Length omegahex=Modelica.Constants.pi*Dihex
        "Internal perimeter";
      final parameter Modelica.SIunits.Area Ahex=Modelica.Constants.pi*rhex^2
        "Internal cross section";
      parameter Real Cfhex=0.005 "Friction coefficient";
      parameter Modelica.SIunits.MassFlowRate whex=0.31
        "Nominal mass flow rate";
      parameter Modelica.SIunits.Pressure phex=3e5 "Initial pressure";
      parameter Modelica.SIunits.SpecificEnthalpy hs=Medium.specificEnthalpy_pT(phex,293.15)
        "Initial inlet specific enthalpy";
      parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma = 5000
        "Fixed heat transfer coefficient";
      Real cp = Medium.specificHeatCapacityCp(hex.fluidState[1]);
      Real NTU = (Nt*Lhex*Dihex*3.1415*gamma)/(whex*Medium.specificHeatCapacityCp(hex.fluidState[1]))
        "Number of heat transfer units";
      Real alpha = 1-exp(-NTU)
        "Steady state gain of outlet temperature vs. external temperature";

      Water.ValveLin valve(Kv=2*whex/phex)      annotation (
          Placement(transformation(extent={{26,-22},{46,-2}}, rotation=0)));
      Water.SourceMassFlow fluidSource(
        w0=whex,
        p0=phex,
        h=hs,
        use_in_w0=true)
              annotation (Placement(transformation(extent={{-70,-22},{-50,-2}},
              rotation=0)));
      Water.SinkPressure      fluidSink(p0=phex/2, h=hs) annotation (Placement(
            transformation(extent={{74,-22},{94,-2}}, rotation=0)));
      Modelica.Blocks.Sources.Constant temperature(k=293.15 + 50) annotation (
          Placement(transformation(extent={{-34,16},{-18,32}}, rotation=0)));
      Modelica.Blocks.Sources.Constant valveOpening(k=1) annotation (Placement(
            transformation(extent={{12,12},{28,28}}, rotation=0)));
      Water.SensT T_in(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-40,-18},{-20,2}},
              rotation=0)));
      Water.SensT T_out(redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{50,-18},{70,2}}, rotation=
               0)));
      inner System system
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Thermal.TempSource1DFV tempSource(Nw=Nnodes - 1)
        annotation (Placement(transformation(extent={{-12,2},{8,22}})));
      Water.Flow1DFV hex(
        redeclare package Medium = Medium,
        N=Nnodes,
        L=Lhex,
        A=Ahex,
        omega=omegahex,
        Dhyd=Dihex,
        wnom=whex,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        Cfnom=Cfhex,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        FluidPhaseStart=ThermoPower.Choices.FluidPhase.FluidPhases.Liquid,
        pstart=phex,
        hstartin=hs,
        hstartout=hs,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        Nt=Nt,
        dpnom=1000,
        redeclare model HeatTransfer =
            Thermal.HeatTransferFV.FlowDependentHeatTransferCoefficient (
            gamma_nom=gamma,
            alpha=0.8,
            adaptiveAverageTemperature=true))
        annotation (Placement(transformation(extent={{-12,-22},{8,-2}})));
      Modelica.Blocks.Sources.Ramp massFlowRate(
        offset=whex,
        startTime=10,
        duration=10,
        height=-whex) annotation (Placement(transformation(extent={{-94,8},{-78,24}},
                      rotation=0)));
    equation
      connect(T_in.inlet,fluidSource. flange) annotation (Line(
          points={{-36,-12},{-36,-12},{-50,-12}},
          thickness=0.5,
          color={0,0,255}));
      connect(valve.outlet, T_out.inlet)     annotation (Line(
          points={{46,-12},{54,-12}},
          thickness=0.5,
          color={0,0,255}));
      connect(T_out.outlet,fluidSink. flange) annotation (Line(
          points={{66,-12},{74,-12}},
          thickness=0.5,
          color={0,0,255}));
      connect(valveOpening.y, valve.cmd)
        annotation (Line(points={{28.8,20},{36,20},{36,-4}}, color={0,0,127}));
      connect(T_in.outlet, hex.infl)      annotation (Line(
          points={{-24,-12},{-12,-12}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(hex.outfl, valve.inlet)          annotation (Line(
          points={{8,-12},{26,-12}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(tempSource.wall, hex.wall)          annotation (Line(
          points={{-2,9},{-2,-7}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(temperature.y, tempSource.temperature) annotation (Line(
          points={{-17.2,24},{-2,24},{-2,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(massFlowRate.y, fluidSource.in_w0)
        annotation (Line(points={{-77.2,16},{-64,16},{-64,-6}}, color={0,0,127}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}})),
        experiment(StopTime=200, Tolerance=1e-006),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>This model is designed to test the adaptive average temperature mechanism of the <a href=\"modelica://Thermal.HeatTransferFV.FlowDependentHeatTransferCoefficient\">FlowDependentHeatTransferCoefficient</a> model.
<p>This model represent the fluid side of a heat exchanger with convective thermal exchange against an external source of constant and uniform temperature. The number of transfer units at the beginning of the transient with the nominal flow rate is NTU = 2.42. </p>
<p>By computing the heat transfer with the average volume temperatures, using three finite volumes the outlet temperature is computed at 66.17 degC, which is very close to the theoretical value 20+50*(1-exp(-NTU))=65.55. </p>
<p>After 10 seconds, the mass flow rate is rapidly reduced to zero. Thanks to the adaptive average temperature feature, when the flows gets below 10% of the nominal value, the heat transfer is computed as a function of the volume outlet temperatures instead of the average inlet/outlet temperature. As a consequence, all the temperatures correctly move to the value of the heat source</p>
<p>If the adaptiveAverageTemperature parameter of the heat transfer model is set to false, the values of the temperature along the heat exchanger approach non-physical values, some of them above the source temperature, and lead to a singularity when the flow rate is exactly zero.</p>
<p>Simulation Interval = [0...200] sec </p>
<p>Integration Algorithm = DASSL </p>
<p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<p><ul>
<li>18 Feb 2017 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br/>First release.</li>
</ul></p>
</html>"));
    end TestWaterFlow1DFV_AdaptiveAverageTemp;

    package OldTests "Contains tests for old Flow1D components"
      extends Modelica.Icons.ExamplesPackage;

      model TestFlow1Db "Test case for Flow1D"
        package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph;
        // number of Nodes
        parameter Integer Nnodes=10;
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
        Water.Flow1D hex(
          N=Nnodes,
          L=Lhex,
          omega=omegahex,
          Dhyd=Dihex,
          A=Ahex,
          wnom=whex,
          Cfnom=Cfhex,
          hstartin=hs,
          hstartout=hs,
          redeclare package Medium = Medium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          pstart=phex,
          dpnom=1000) annotation (Placement(transformation(extent={{-26,-10},{-6,
                  10}}, rotation=0)));
        ThermoPower.Thermal.TempSource1D TempSource(N=Nnodes) annotation (
            Placement(transformation(extent={{-26,40},{-6,60}}, rotation=0)));
        ThermoPower.Water.ValveLin ValveLin1(Kv=2*whex/phex) annotation (
            Placement(transformation(extent={{10,-10},{30,10}}, rotation=0)));
        ThermoPower.Water.SourceMassFlow
                                  FluidSource(
          w0=whex,
          p0=phex,
          h=hs) annotation (Placement(transformation(extent={{-90,-10},{-70,10}},
                rotation=0)));
        ThermoPower.Water.SinkPressure
                                FluidSink(p0=phex/2, h=hs) annotation (Placement(
              transformation(extent={{70,-10},{90,10}}, rotation=0)));
        Modelica.Blocks.Sources.Step Temperature(
          height=10,
          offset=297,
          startTime=20) annotation (Placement(transformation(extent={{-60,60},{-40,
                  80}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                   annotation (Placement(
              transformation(extent={{-10,70},{10,90}}, rotation=0)));
        ThermoPower.Thermal.ConvHT ConvEx(N=Nnodes, gamma=400) annotation (
            Placement(transformation(extent={{-26,20},{-6,40}}, rotation=0)));
        ThermoPower.Water.SensT T_in(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-60,-6},{-40,14}},
                rotation=0)));
        ThermoPower.Water.SensT T_out(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{40,-6},{60,14}}, rotation=
                 0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(hex.outfl, ValveLin1.inlet) annotation (Line(
            points={{-6,0},{10,0}},
            thickness=0.5,
            color={0,0,255}));
        connect(ConvEx.side1, TempSource.wall)
          annotation (Line(points={{-16,33},{-16,47}}, color={255,127,0}));
        connect(hex.wall, ConvEx.side2)
          annotation (Line(points={{-16,5},{-16,26.9}}, color={255,127,0}));
        connect(T_in.inlet, FluidSource.flange) annotation (Line(
            points={{-56,0},{-70,0}},
            thickness=0.5,
            color={0,0,255}));
        connect(T_in.outlet, hex.infl) annotation (Line(
            points={{-44,0},{-26,0}},
            thickness=0.5,
            color={0,0,255}));
        connect(ValveLin1.outlet, T_out.inlet) annotation (Line(
            points={{30,0},{44,0}},
            thickness=0.5,
            color={0,0,255}));
        connect(T_out.outlet, FluidSink.flange) annotation (Line(
            points={{56,0},{70,0}},
            thickness=0.5,
            color={0,0,255}));
        connect(Temperature.y, TempSource.temperature) annotation (Line(points={{
                -39,70},{-16,70},{-16,54}}, color={0,0,127}));
        connect(Constant1.y, ValveLin1.cmd)
          annotation (Line(points={{11,80},{20,80},{20,8}}, color={0,0,127}));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                  graphics),
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
</HTML>",   revisions="<html>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
      end TestFlow1Db;

      model TestFlow1Dd "Test case for Flow1D"
        package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph;
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
        SI.Time tau;

        Water.Flow1D hex(
          N=Nnodes,
          L=Lhex,
          omega=omegahex,
          Dhyd=Dihex,
          A=Ahex,
          wnom=whex,
          Cfnom=Cfhex,
          hstartin=hs,
          hstartout=hs,
          redeclare package Medium = Medium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          dpnom=1000,
          pstart=phex)
                      annotation (Placement(transformation(extent={{-20,-10},{0,
                  10}}, rotation=0)));
        ThermoPower.Water.SourceMassFlow
                                  MassFlowRateSource(w0=whex, h=hs,
          use_in_w0=true)                                           annotation (
            Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=0)));
        ThermoPower.Water.SinkPressure
                                FluidSink(
          p0=0,
          R=100,
          h=3e6) annotation (Placement(transformation(extent={{70,-10},{90,10}},
                rotation=0)));
        ThermoPower.Water.ValveLin ValveLin1(Kv=1e-7) annotation (Placement(
              transformation(extent={{34,-10},{54,10}}, rotation=0)));
        Modelica.Blocks.Sources.Step MassFlowRateStep(
          height=whex/10,
          offset=whex,
          startTime=0.5) annotation (Placement(transformation(extent={{-90,30},{-70,
                  50}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                   annotation (Placement(
              transformation(extent={{8,60},{28,80}}, rotation=0)));
        ThermoPower.Thermal.HeatSource1D HeatSource1D1(
          N=Nnodes,
          L=Lhex,
          omega=omegahex) annotation (Placement(transformation(extent={{-20,20},{
                  0,40}}, rotation=0)));
        Modelica.Blocks.Sources.Constant ExtPower(k=0) annotation (Placement(
              transformation(extent={{-50,60},{-30,80}}, rotation=0)));
        Water.SensP SensP annotation (Placement(transformation(extent={{10,14},{
                  30,34}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        // RC constant of equivalent circuit
        tau = (1/ValveLin1.Kv)*(Ahex*Lhex/1200^2);
        connect(ValveLin1.inlet, hex.outfl) annotation (Line(
            points={{34,0},{0,0}},
            color={0,0,255},
            thickness=0.5));
        connect(ValveLin1.outlet, FluidSink.flange) annotation (Line(
            points={{54,0},{70,0}},
            color={0,0,255},
            thickness=0.5));
        connect(MassFlowRateSource.flange, hex.infl) annotation (Line(
            points={{-40,0},{-20,0}},
            color={0,0,255},
            thickness=0.5));
        connect(HeatSource1D1.wall, hex.wall)
          annotation (Line(points={{-10,27},{-10,5}}, color={255,127,0}));
      initial equation
        der(hex.p) = 0;

      equation
        connect(SensP.flange, ValveLin1.inlet)
          annotation (Line(points={{20,20},{20,12},{34,12},{34,0}}));
        connect(Constant1.y, ValveLin1.cmd)
          annotation (Line(points={{29,70},{44,70},{44,8}}, color={0,0,127}));
        connect(ExtPower.y, HeatSource1D1.power) annotation (Line(points={{-29,70},
                {-10,70},{-10,34}}, color={0,0,127}));
        connect(MassFlowRateStep.y, MassFlowRateSource.in_w0)
          annotation (Line(points={{-69,40},{-54,40},{-54,6}}, color={0,0,127}));
        annotation (
          Diagram(graphics),
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
</HTML>",   revisions="<html>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
      end TestFlow1Dd;

      model TestFlow1De "Test case for Flow1D"
        package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph;
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
        Water.Flow1D hexA(
          N=Nnodes,
          Nt=1,
          L=Lhex,
          omega=omegahex,
          Dhyd=Dihex,
          A=Ahex,
          wnom=whex,
          Cfnom=Cfhex,
          hstartin=hinhex,
          hstartout=houthex,
          redeclare package Medium = Medium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          pstart=phex,
          dpnom=1000) annotation (Placement(transformation(extent={{-20,-70},{0,-50}},
                rotation=0)));
        ThermoPower.Water.SinkPressure
                                SideA_FluidSink annotation (Placement(
              transformation(extent={{70,-70},{90,-50}}, rotation=0)));
        ThermoPower.Water.SinkPressure
                                SideB_FluidSink annotation (Placement(
              transformation(extent={{-80,30},{-100,50}}, rotation=0)));
        ThermoPower.Water.SourceMassFlow
                                  SideA_MassFlowRate(w0=whex,
          p0=300000,
          use_in_h=true)                                              annotation (
           Placement(transformation(extent={{-74,-70},{-54,-50}}, rotation=0)));
        ThermoPower.Water.ValveLin ValveLin1(Kv=whex/(2e5)) annotation (Placement(
              transformation(extent={{14,-70},{34,-50}}, rotation=0)));
        ThermoPower.Water.ValveLin ValveLin2(Kv=whex/(2e5)) annotation (Placement(
              transformation(extent={{-30,30},{-50,50}}, rotation=0)));
        Water.Flow1D hexB(
          N=Nnodes,
          L=Lhex,
          omega=omegahex,
          Dhyd=Dihex,
          A=Ahex,
          wnom=whex,
          Cfnom=Cfhex,
          hstartin=hinhex,
          hstartout=houthex,
          redeclare package Medium = Medium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          pstart=phex,
          dpnom=1000) annotation (Placement(transformation(extent={{0,50},{-20,30}},
                rotation=0)));
        ThermoPower.Water.SensT SensT_A_in(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-50,-66},{-30,-46}},
                rotation=0)));
        Modelica.Blocks.Sources.Step SideA_InSpecEnth(
          height=1e5,
          offset=1e5,
          startTime=50) annotation (Placement(transformation(extent={{-90,-20},{-70,
                  0}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                   annotation (Placement(
              transformation(extent={{-70,70},{-50,90}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant2(k=1)
                                                   annotation (Placement(
              transformation(extent={{0,-20},{20,0}}, rotation=0)));
        ThermoPower.Water.SensT SensT_B_in(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{30,34},{10,54}}, rotation=
                 0)));
        ThermoPower.Water.SourceMassFlow
                                  SideB_MassFlowRate(w0=whex, p0=3e5) annotation (
           Placement(transformation(extent={{60,30},{40,50}}, rotation=0)));
        Thermal.ConvHT ConvExCF(N=Nnodes, gamma=400) annotation (Placement(
              transformation(extent={{-20,-40},{0,-20}}, rotation=0)));
        ThermoPower.Water.SensT SensT_A_out(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{40,-66},{60,-46}},
                rotation=0)));
        ThermoPower.Water.SensT SensT_B_out(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-54,34},{-74,54}},
                rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
        Thermal.CounterCurrent CounterCurrent1(N=Nnodes, counterCurrent=true)
                                                         annotation (Placement(
              transformation(extent={{-20,-6},{0,14}},rotation=0)));
      equation
        connect(SideA_MassFlowRate.flange, SensT_A_in.inlet) annotation (Line(
            points={{-54,-60},{-46,-60}},
            thickness=0.5,
            color={0,0,255}));
        connect(SensT_A_in.outlet, hexA.infl) annotation (Line(
            points={{-34,-60},{-20,-60}},
            thickness=0.5,
            color={0,0,255}));
        connect(hexA.outfl, ValveLin1.inlet) annotation (Line(
            points={{0,-60},{14,-60}},
            thickness=0.5,
            color={0,0,255}));
        connect(ValveLin2.inlet, hexB.outfl) annotation (Line(
            points={{-30,40},{-20,40}},
            thickness=0.5,
            color={0,0,255}));
        connect(SensT_B_in.outlet, hexB.infl) annotation (Line(
            points={{14,40},{0,40}},
            thickness=0.5,
            color={0,0,255}));
        connect(SideB_MassFlowRate.flange, SensT_B_in.inlet) annotation (Line(
            points={{40,40},{26,40}},
            thickness=0.5,
            color={0,0,255}));
        connect(ConvExCF.side2, hexA.wall)
          annotation (Line(points={{-10,-33.1},{-10,-55}}, color={255,127,0}));
        connect(ValveLin1.outlet, SensT_A_out.inlet) annotation (Line(
            points={{34,-60},{44,-60}},
            thickness=0.5,
            color={0,0,255}));
        connect(SensT_A_out.outlet, SideA_FluidSink.flange) annotation (Line(
            points={{56,-60},{70,-60}},
            thickness=0.5,
            color={0,0,255}));
        connect(SensT_B_out.outlet, SideB_FluidSink.flange) annotation (Line(
            points={{-70,40},{-80,40}},
            color={0,0,255},
            thickness=0.5));
        connect(SensT_B_out.inlet, ValveLin2.outlet) annotation (Line(
            points={{-58,40},{-50,40}},
            thickness=0.5,
            color={0,0,255}));
        connect(SideA_InSpecEnth.y, SideA_MassFlowRate.in_h) annotation (Line(
              points={{-69,-10},{-60,-10},{-60,-54}}, color={0,0,127}));
        connect(Constant2.y, ValveLin1.cmd) annotation (Line(points={{21,-10},{24,
                -10},{24,-52}}, color={0,0,127}));
        connect(Constant1.y, ValveLin2.cmd) annotation (Line(points={{-49,80},{-40,
                80},{-40,48}}, color={0,0,127}));
        connect(hexB.wall, CounterCurrent1.side1) annotation (Line(
            points={{-10,35},{-10,7}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(CounterCurrent1.side2, ConvExCF.side1) annotation (Line(
            points={{-10,0.9},{-10,-27}},
            color={255,127,0},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                  graphics),
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
</HTML>",   revisions="<html>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
      end TestFlow1De;

      model TestFlow1Df "Test case for Flow1D"
        package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph;
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
        Water.Flow1D hexA(
          N=Nnodes,
          Nt=1,
          L=Lhex,
          omega=omegahex,
          Dhyd=Dihex,
          A=Ahex,
          wnom=whex,
          Cfnom=Cfhex,
          hstartin=hinhex,
          hstartout=houthex,
          redeclare package Medium = Medium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          dpnom=1000,
          pstart=phex)
                      annotation (Placement(transformation(extent={{-20,-60},{0,-40}},
                rotation=0)));
        Thermal.ConvHT ConvHTB(N=Nnodes, gamma=800) annotation (Placement(
              transformation(extent={{-20,20},{0,40}}, rotation=0)));
        Thermal.ConvHT ConvHTA(N=Nnodes, gamma=800) annotation (Placement(
              transformation(extent={{-20,-40},{0,-20}}, rotation=0)));
        ThermoPower.Water.SinkPressure
                                SideA_FluidSink annotation (Placement(
              transformation(extent={{70,-60},{90,-40}}, rotation=0)));
        ThermoPower.Water.SinkPressure
                                SideB_FluidSink annotation (Placement(
              transformation(extent={{-80,40},{-100,60}}, rotation=0)));
        ThermoPower.Water.SourceMassFlow
                                  SideA_MassFlowRate(w0=whex,
          p0=300000,
          use_in_h=true)                                              annotation (
           Placement(transformation(extent={{-76,-60},{-56,-40}}, rotation=0)));
        ThermoPower.Water.ValveLin ValveLin1(Kv=whex/(2e5)) annotation (Placement(
              transformation(extent={{18,-60},{38,-40}}, rotation=0)));
        ThermoPower.Water.ValveLin ValveLin2(Kv=whex/(2e5)) annotation (Placement(
              transformation(extent={{-30,40},{-50,60}}, rotation=0)));
        Water.Flow1D hexB(
          N=Nnodes,
          L=Lhex,
          omega=omegahex,
          Dhyd=Dihex,
          A=Ahex,
          wnom=whex,
          Cfnom=Cfhex,
          hstartin=hinhex,
          hstartout=houthex,
          redeclare package Medium = Medium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          dpnom=1000,
          pstart=phex)
                      annotation (Placement(transformation(extent={{0,60},{-20,40}},
                rotation=0)));
        ThermoPower.Thermal.MetalTube MetalWall(
          N=Nnodes,
          L=Lhex,
          lambda=20,
          rint=rhex,
          rhomcm=4.9e6,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          rext=rhex + 4e-3,
          Tstart1=297,
          TstartN=297)                                          annotation (
            Placement(transformation(extent={{-20,0},{0,-20}}, rotation=0)));
        ThermoPower.Water.SensT SensT_A_in(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-50,-56},{-30,-36}},
                rotation=0)));
        Modelica.Blocks.Sources.Step SideA_InSpecEnth(
          height=1e5,
          offset=1e5,
          startTime=50) annotation (Placement(transformation(extent={{-90,-20},{-70,
                  0}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant1(k=1)
                                                   annotation (Placement(
              transformation(extent={{-72,70},{-52,90}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant2(k=1)
                                                   annotation (Placement(
              transformation(extent={{4,-20},{24,0}}, rotation=0)));
        ThermoPower.Water.SensT SensT_B_in(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{30,44},{10,64}}, rotation=
                 0)));
        ThermoPower.Water.SourceMassFlow
                                  SourceW1(w0=whex, p0=3e5) annotation (Placement(
              transformation(extent={{60,40},{40,60}}, rotation=0)));
        ThermoPower.Water.SensT SensT_A_out(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{44,-56},{64,-36}},
                rotation=0)));
        ThermoPower.Water.SensT SensT_B_out(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-54,44},{-74,64}},
                rotation=0)));
        Thermal.CounterCurrent CounterCurrent1(N=Nnodes) annotation (Placement(
              transformation(extent={{-20,0},{0,20}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(SideA_MassFlowRate.flange, SensT_A_in.inlet) annotation (Line(
            points={{-56,-50},{-46,-50}},
            thickness=0.5,
            color={0,0,255}));
        connect(SensT_A_in.outlet, hexA.infl) annotation (Line(
            points={{-34,-50},{-20,-50}},
            thickness=0.5,
            color={0,0,255}));
        connect(hexA.outfl, ValveLin1.inlet) annotation (Line(
            points={{0,-50},{18,-50}},
            thickness=0.5,
            color={0,0,255}));
        connect(ValveLin2.inlet, hexB.outfl) annotation (Line(
            points={{-30,50},{-20,50}},
            thickness=0.5,
            color={0,0,255}));
        connect(ConvHTB.side1, hexB.wall)
          annotation (Line(points={{-10,33},{-10,45}}, color={255,127,0}));
        connect(hexA.wall, ConvHTA.side2)
          annotation (Line(points={{-10,-45},{-10,-33.1}}, color={255,127,0}));
        connect(SensT_B_in.outlet, hexB.infl) annotation (Line(
            points={{14,50},{0,50}},
            thickness=0.5,
            color={0,0,255}));
        connect(SourceW1.flange, SensT_B_in.inlet) annotation (Line(
            points={{40,50},{26,50}},
            thickness=0.5,
            color={0,0,255}));
        connect(MetalWall.int, ConvHTA.side1)
          annotation (Line(points={{-10,-13},{-10,-27}}, color={255,127,0}));
        connect(SensT_A_out.inlet, ValveLin1.outlet) annotation (Line(
            points={{48,-50},{38,-50}},
            thickness=0.5,
            color={0,0,255}));
        connect(SensT_A_out.outlet, SideA_FluidSink.flange) annotation (Line(
            points={{60,-50},{70,-50}},
            thickness=0.5,
            color={0,0,255}));
        connect(SensT_B_out.outlet, SideB_FluidSink.flange) annotation (Line(
            points={{-70,50},{-80,50}},
            thickness=0.5,
            color={0,0,255}));
        connect(SensT_B_out.inlet, ValveLin2.outlet) annotation (Line(
            points={{-58,50},{-50,50}},
            thickness=0.5,
            color={0,0,255}));
        connect(ConvHTB.side2, CounterCurrent1.side1)
          annotation (Line(points={{-10,26.9},{-10,13}}, color={255,127,0}));
        connect(MetalWall.ext, CounterCurrent1.side2)
          annotation (Line(points={{-10,-6.9},{-10,6.9}}, color={255,127,0}));
        connect(Constant1.y, ValveLin2.cmd) annotation (Line(points={{-51,80},{-40,
                80},{-40,58}}, color={0,0,127}));
        connect(SideA_InSpecEnth.y, SideA_MassFlowRate.in_h) annotation (Line(
              points={{-69,-10},{-62,-10},{-62,-44}}, color={0,0,127}));
        connect(Constant2.y, ValveLin1.cmd) annotation (Line(points={{25,-10},{28,
                -10},{28,-42}}, color={0,0,127}));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                  graphics),
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
</HTML>",   revisions="<html>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
      end TestFlow1Df;

      model TestConvHT2N
        parameter Integer Nbig=6;
        parameter Integer Nsmall=3;
        Thermal.ConvHT2N HTa(
          gamma=100,
          N1=Nbig,
          N2=Nsmall) annotation (Placement(transformation(extent={{-60,-12},{-20,
                  28}}, rotation=0)));
        Thermal.TempSource1Dlin T1a(N=Nbig) annotation (Placement(transformation(
                extent={{-60,16},{-20,56}}, rotation=0)));
        Thermal.TempSource1Dlin T2a(N=Nsmall) annotation (Placement(
              transformation(extent={{-60,0},{-20,-40}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant1(k=300) annotation (Placement(
              transformation(extent={{-92,50},{-72,70}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant2(k=400) annotation (Placement(
              transformation(extent={{-64,70},{-44,90}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant3(k=280) annotation (Placement(
              transformation(extent={{-92,-60},{-72,-40}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant4(k=350) annotation (Placement(
              transformation(extent={{-66,-80},{-46,-60}}, rotation=0)));
        Thermal.ConvHT2N HTb(
          gamma=100,
          N1=Nsmall,
          N2=Nsmall) annotation (Placement(transformation(extent={{-16,-12},{24,
                  28}}, rotation=0)));
        Thermal.TempSource1Dlin T1b(N=Nsmall) annotation (Placement(
              transformation(extent={{-16,16},{24,56}}, rotation=0)));
        Thermal.TempSource1Dlin T2b(N=Nsmall) annotation (Placement(
              transformation(extent={{-16,0},{24,-40}}, rotation=0)));
        Thermal.ConvHT2N HTc(
          gamma=100,
          N1=Nsmall,
          N2=Nbig) annotation (Placement(transformation(extent={{30,-12},{70,28}},
                rotation=0)));
        Thermal.TempSource1Dlin T1c(N=Nsmall) annotation (Placement(
              transformation(extent={{30,16},{70,56}}, rotation=0)));
        Thermal.TempSource1Dlin T2c(N=Nbig) annotation (Placement(transformation(
                extent={{30,0},{70,-40}}, rotation=0)));
      equation
        connect(T1a.wall, HTa.side1)
          annotation (Line(points={{-40,30},{-40,14}}, color={255,127,0}));
        connect(HTa.side2, T2a.wall)
          annotation (Line(points={{-40,1.8},{-40,-14}}, color={255,127,0}));
        connect(Constant1.y, T1a.temperature_node1) annotation (Line(points={{-71,
                60},{-48,60},{-48,42}}, color={0,0,127}));
        connect(Constant2.y, T1a.temperature_nodeN) annotation (Line(points={{-43,
                80},{-32,80},{-32,41.6}}, color={0,0,127}));
        connect(Constant3.y, T2a.temperature_node1) annotation (Line(points={{-71,
                -50},{-48,-50},{-48,-26}}, color={0,0,127}));
        connect(Constant4.y, T2a.temperature_nodeN) annotation (Line(points={{-45,
                -70},{-32,-70},{-32,-25.6}}, color={0,0,127}));
        connect(T1b.wall, HTb.side1)
          annotation (Line(points={{4,30},{4,14}}, color={255,127,0}));
        connect(HTb.side2, T2b.wall)
          annotation (Line(points={{4,1.8},{4,-14}}, color={255,127,0}));
        connect(T1c.wall, HTc.side1)
          annotation (Line(points={{50,30},{50,14}}, color={255,127,0}));
        connect(HTc.side2, T2c.wall)
          annotation (Line(points={{50,1.8},{50,-14}}, color={255,127,0}));
        connect(Constant3.y, T2b.temperature_node1) annotation (Line(points={{-71,
                -50},{-4,-50},{-4,-26}}, color={0,0,127}));
        connect(Constant3.y, T2c.temperature_node1) annotation (Line(points={{-71,
                -50},{42,-50},{42,-26}}, color={0,0,127}));
        connect(Constant4.y, T2b.temperature_nodeN) annotation (Line(points={{-45,
                -70},{12,-70},{12,-25.6}}, color={0,0,127}));
        connect(Constant4.y, T2c.temperature_nodeN) annotation (Line(points={{-45,
                -70},{58,-70},{58,-25.6}}, color={0,0,127}));
        connect(Constant1.y, T1b.temperature_node1)
          annotation (Line(points={{-71,60},{-4,60},{-4,42}}, color={0,0,127}));
        connect(Constant1.y, T1c.temperature_node1)
          annotation (Line(points={{-71,60},{42,60},{42,42}}, color={0,0,127}));
        connect(Constant2.y, T1b.temperature_nodeN) annotation (Line(points={{-43,
                80},{12,80},{12,41.6}}, color={0,0,127}));
        connect(Constant2.y, T1c.temperature_nodeN) annotation (Line(points={{-43,
                80},{58,80},{58,41.6}}, color={0,0,127}));
        annotation (Diagram(graphics), Documentation(info="<html>
<p>This model is designed to test the <tt>ConvHT2N</tt> model.
<p> HTa tests the case with a bigger number of nodes on side1, HTb the case with an equal number of nodes on both sides, and HTc the case with a smaller number of nodes on side 1. It is possible to change <tt>Nbig</tt> and <tt>Nsmall</tt> to any value.
</html>",   revisions="<html>
<ul>
        <li><i>12 May 2005</i> by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
        First release.</li>
</ul>
</html>

"));
      end TestConvHT2N;

      model TestFlow1DDB "Test case for Flow1D"
        package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph;
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
          hstartin=hs,
          hstartout=hs,
          redeclare package Medium = Medium,
          FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
          initOpt=ThermoPower.Choices.Init.Options.steadyState,
          HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
          dpnom=1000) annotation (Placement(transformation(extent={{-20,-10},{0,
                  10}}, rotation=0)));
        Thermal.TempSource1D TempSource(N=Nnodes) annotation (Placement(
              transformation(extent={{-20,40},{0,60}}, rotation=0)));
        ThermoPower.Water.ValveLin ValveLin1(Kv=2*whex/phex) annotation (
            Placement(transformation(extent={{14,-10},{34,10}}, rotation=0)));
        ThermoPower.Water.SourceMassFlow
                                  FluidSource(
          w0=whex,
          p0=phex,
          h=hs) annotation (Placement(transformation(extent={{-80,-10},{-60,10}},
                rotation=0)));
        ThermoPower.Water.SinkPressure
                                FluidSink(p0=phex/2, h=hs) annotation (Placement(
              transformation(extent={{70,-10},{90,10}}, rotation=0)));
        Modelica.Blocks.Sources.Step Temperature(
          height=10,
          offset=297,
          startTime=20) annotation (Placement(transformation(extent={{-50,60},{-30,
                  80}}, rotation=0)));
        Modelica.Blocks.Sources.Constant Constant1 annotation (Placement(
              transformation(extent={{-4,70},{16,90}}, rotation=0)));
        ThermoPower.Water.SensT T_in(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{-50,-6},{-30,14}},
                rotation=0)));
        ThermoPower.Water.SensT T_out(redeclare package Medium = Medium)
          annotation (Placement(transformation(extent={{40,-6},{60,14}}, rotation=
                 0)));
        ThermoPower.Thermal.ConvHT_htc ConvHTe_htc1(N=Nnodes) annotation (
            Placement(transformation(extent={{-20,36},{0,16}}, rotation=0)));
        inner System system
          annotation (Placement(transformation(extent={{80,80},{100,100}})));
      equation
        connect(hex.outfl, ValveLin1.inlet) annotation (Line(
            points={{0,0},{14,0}},
            thickness=0.5,
            color={0,0,255}));
        connect(ValveLin1.outlet, T_out.inlet) annotation (Line(
            points={{34,0},{44,0}},
            thickness=0.5,
            color={0,0,255}));
        connect(T_out.outlet, FluidSink.flange) annotation (Line(
            points={{56,0},{70,0}},
            thickness=0.5,
            color={0,0,255}));
        connect(ConvHTe_htc1.fluidside, hex.wall)
          annotation (Line(points={{-10,23},{-10,5}}, color={0,0,255}));
        connect(ConvHTe_htc1.otherside, TempSource.wall)
          annotation (Line(points={{-10,29},{-10,47}}, color={255,127,0}));
        connect(Temperature.y, TempSource.temperature) annotation (Line(points={{
                -29,70},{-10,70},{-10,54}}, color={0,0,127}));
        connect(Constant1.y, ValveLin1.cmd)
          annotation (Line(points={{17,80},{24,80},{24,8}}, color={0,0,127}));
        connect(FluidSource.flange, T_in.inlet) annotation (Line(
            points={{-60,0},{-46,0}},
            thickness=0.5,
            color={0,0,255}));
        connect(T_in.outlet, hex.infl) annotation (Line(
            points={{-34,0},{-20,0}},
            thickness=0.5,
            color={0,0,255}));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {100,100}}),
                  graphics),
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
</HTML>",   revisions="<html>
<ul>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"));
      end TestFlow1DDB;

      model TestEvaporatorTemp
        extends Water.BaseClasses.EvaporatorBase(
          redeclare package Medium = Modelica.Media.Water.StandardWater,
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
          csivstart=0.8*L);
        SI.Temperature Text "External temperature";
        parameter Real K(fixed=false, start=1.2e3);
      equation
        Text = 700 - 2*min(max(time - 1, 0), 70) + 2*min(max(time - 300, 0), 70);
        Ql = K*(Text - fluid_in.T)*csil/L*(1 - min(max(time - 100, 0), 160)/200
           + min(max(time - 400, 0), 200)/200);
        Qb = K*(Text - sat.Tsat)*(csiv - csil)/L*(1 - min(max(time - 100, 0), 160)
          /200 + min(max(time - 400, 0), 200)/200);
        Qv = K*(Text - fluid_out.T)*(L - csiv)/L*(1 - min(max(time - 100, 0), 160)
          /200 + min(max(time - 400, 0), 200)/200);
        hin = 8e5;
        win = 0.1;
        wout = 0.1/60e5*p;
      initial equation
        der(csil) = 0;
        der(csiv) = 0;
        der(hout) = 0;
        hout = 2.9e6;
        der(p) = 0;
        annotation (
          experiment(
            __Dymola_NumberOfIntervals=1000,
            Tolerance=1e-008),
          Documentation(info="<html>
The moving boundary evaporator model is still incomplete, and it fails at t = 245.
</html>"),__Dymola_experimentSetupOutput);
      end TestEvaporatorTemp;

      model TestEvaporatorFlux
        extends Water.BaseClasses.EvaporatorBase(
          redeclare package Medium = Modelica.Media.Water.StandardWater,
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
          csivstart=0);
      equation
        Ql = 2.5e5*csil/L*min(max(time - 10, 0), 100);
        Qb = 2.5e5*(csiv - csil)/L*min(max(time - 10, 0), 100);
        Qv = 2.5e5*(L - csiv)/L*min(max(time - 10, 0), 100);
        hin = 4e5;
        win = 0.1;
        wout = 0.1/10e5*p;
      initial equation
        csil = L;
        csiv = L;
        hout = 4e5;
        der(p) = 0;
        annotation (
          Documentation(info="<html>
The moving boundary evaporator model is still incomplete, and it fails at t = 12.
</html>"));
      end TestEvaporatorFlux;
    end OldTests;

    model TestConstantHeatTransferTwoGrid_Wcoarse
      "Test of the ConstantHeatTransferTwoGrid component with coarser grid on the wall side"

      replaceable package Medium = Modelica.Media.Water.StandardWater
        constrainedby Modelica.Media.Interfaces.PartialTwoPhaseMedium;

      parameter Integer Nf(min=2) = 7 "Number of nodes on the fluid side";
      parameter Integer Nw = 3 "Number of nodes on the wallside";
      parameter Integer Nt(min=1) = 1 "Number of tubes in parallel";
      parameter SI.Distance L = Nf-1 "Tube length";
      parameter SI.Area A = 1e-3 "Cross-sectional area (single tube)";
      parameter SI.Length omega = 1
        "Wet perimeter of heat transfer surface (single tube)";
      parameter SI.CoefficientOfHeatTransfer gamma = 1
        "Constant heat transfer coefficient";
      parameter SI.Length Dhyd = 1e-4 "Hydraulic Diameter (single tube)";
      parameter SI.MassFlowRate wnom = 10
        "Nominal mass flow rate (single tube)";

      parameter Medium.AbsolutePressure p = 1e6;
      parameter Medium.SpecificEnthalpy h_vap = 3.2e6;
      parameter Real u(unit = "1/s") = 1 "For unit consistency";

      parameter SI.Temperature Tw_start = 300+273.15;
      parameter SI.Temperature Tw_end = 320+273.15;
      parameter SI.Temperature Tf_start = 300+273.15;
      parameter SI.Temperature Tf_end = 360+273.15;

      Medium.Temperature Tf[Nf];
      Medium.ThermodynamicState fluidState[Nf];
      Medium.MassFlowRate w[Nf];

      ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficientTwoGrids
        constantHeatTransferCoefficientTwoGrids(
        redeclare package Medium = Medium,
        gamma=gamma,
        Nf=Nf,
        Nw=Nw,
        Nt=Nt,
        L=L,
        A=A,
        omega=omega,
        Dhyd=Dhyd,
        wnom=wnom,
        w=w,
        final fluidState=fluidState)
        annotation (Placement(transformation(extent={{-28,-2},{-8,18}})));

      Thermal.TempSource1DlinFV tempSource1DlinFV(
         temperature_1=Tw_start,
         temperature_Nw=Tw_end,
         Nw=Nw)
        annotation (Placement(transformation(extent={{-28,20},{-8,40}})));
    equation
      w=ones(Nf)*wnom;
      Tf=Functions.linspaceExt(Tf_start,Tf_end,Nf);

      for i in 1:Nf loop
        fluidState[i] = Medium.setState_pT(p,Tf[i]);
      end for;

      connect(tempSource1DlinFV.wall, constantHeatTransferCoefficientTwoGrids.wall)
        annotation (Line(
          points={{-18,27},{-18,11}},
          color={255,127,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), experiment(StopTime=10));
    end TestConstantHeatTransferTwoGrid_Wcoarse;

    model TestConstantHeatTransferTwoGrid_Fcoarse
      "Test of the ConstantHeatTransferTwoGrid component with coarser grid on the wall side"
      extends TestConstantHeatTransferTwoGrid_Wcoarse(
        Nf=4,
        Nw=6,
        L=Nw,
        Tf_start = 295+273.15,
        Tf_end = 325+273.15,
        Tw_start = 305+273.15,
        Tw_end = 355+273.15);
      annotation (experiment(StopTime=10));
    end TestConstantHeatTransferTwoGrid_Fcoarse;

    model TestRefrigerantEvaporator
      "Test case with once-through evaporator using Dittus-Boelter 2-phase heat transfer model"
      replaceable package Medium = Modelica.Media.Water.WaterIF97OnePhase_ph
        constrainedby Modelica.Media.Interfaces.PartialMedium;
      parameter Integer Nnodes=10 "number of nodes";
      parameter SI.Length Dint= 5e-3 "Internal diameter of refrigerant tube";
      parameter SI.Length th= 0.5e-3 "Thickness of refrigerant tube";
      parameter SI.Length Dext = Dint + 2*th
        "External diameter of refrigerant tube";
      parameter SI.Length Dgas = 20e-3 "External diameter of gas tube";
      parameter SI.Length L= 10 "Length of refrigerant tube";
      constant Real pi = Modelica.Constants.pi;
      SI.Temperature Tgas[:] = gasFlow.T[end:-1:1]
        "Alias variable for direct comparisons";
      SI.Temperature Tfluid[:] = fluidFlow.T
        "Alias variable for direct comparisons";
      SI.Temperature Twall[:] = tubeWall.Tvol
        "Alias variable for direct comparisons";
      SI.SpecificEnthalpy hl[:] = fluidFlow.hl*ones(Nnodes);
      SI.SpecificEnthalpy hv[:] = fluidFlow.hv*ones(Nnodes);

      Water.SinkPressure fluidSink(redeclare package Medium =
            Modelica.Media.R134a.R134a_ph, p0=3000000) annotation (Placement(
            transformation(extent={{50,-82},{70,-62}}, rotation=0)));
      Gas.SinkPressure gasSink(redeclare package Medium = ThermoPower.Media.Air)
        annotation (Placement(transformation(extent={{-54,18},{-74,38}}, rotation=0)));
      Water.SourceMassFlow fluidSource(
        use_in_w0=true,
        use_in_h=false,
        redeclare package Medium = Modelica.Media.R134a.R134a_ph,
        h=250e3,
        p0=300000)      annotation (Placement(transformation(extent={{-70,-82},{-50,
                -62}}, rotation=0)));
      Water.SensT             fluid_T_in(redeclare package Medium =
            Modelica.Media.R134a.R134a_ph)
        annotation (Placement(transformation(extent={{-46,-78},{-26,-58}},
              rotation=0)));
      Gas.SensT gas_T_in(redeclare package Medium = ThermoPower.Media.Air)
        annotation (Placement(transformation(extent={{34,22},{14,42}}, rotation=0)));
      Gas.SourceMassFlow gasSource(
        redeclare package Medium = ThermoPower.Media.Air,
        use_in_w0=true,
        T=423.15) annotation (Placement(transformation(extent={{64,18},{44,38}},
              rotation=0)));
      Water.SensT             fluid_T_out(redeclare package Medium =
            Modelica.Media.R134a.R134a_ph)
        annotation (Placement(transformation(extent={{20,-78},{40,-58}},
              rotation=0)));
      Gas.SensT gas_T_out(redeclare package Medium = ThermoPower.Media.Air)
        annotation (Placement(transformation(extent={{-24,22},{-44,42}}, rotation=0)));
      inner System system(allowFlowReversal=false, initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{80,80},{100,100}})));
      Gas.Flow1DFV gasFlow(
        Nt=1,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.NoFriction,
        N=Nnodes,
        redeclare package Medium = ThermoPower.Media.Air,
        L=L,
        Dhyd=Dgas,
        wnom=0.02,
        noInitialPressure=true,
        A=(Dgas^2 - Dext^2)/4*pi,
        omega=Dext*pi,
        redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.ConstantHeatTransferCoefficient
            (gamma=120),
        Tstartin=333.15,
        Tstartout=303.15)                                 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-8,28})));
      Water.Flow1DFV2ph fluidFlow(
        N=Nnodes,
        Cfnom=0.005,
        FFtype=ThermoPower.Choices.Flow1D.FFtypes.Cfnom,
        HydraulicCapacitance=ThermoPower.Choices.Flow1D.HCtypes.Downstream,
        redeclare package Medium = Modelica.Media.R134a.R134a_ph,
        L=L,
        A=Dint^2/4*pi,
        omega=Dint*pi,
        Dhyd=Dint,
        wnom=0.005,
        noInitialPressure=true,
        hstartin=250e3,
        hstartout=250e3,
        dpnom=1000,
        pstart=3000000,
        redeclare model HeatTransfer =
            ThermoPower.Thermal.HeatTransferFV.FlowDependentHeatTransferCoefficient2ph
            (
            gamma_nom_liq=800,
            gamma_nom_2ph=8000,
            gamma_nom_vap=800))
        annotation (Placement(transformation(extent={{-18,-82},{2,-62}})));
      Thermal.CounterCurrentFV counterCurrentFV(Nw=Nnodes - 1)
        annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
      Thermal.MetalTubeFV tubeWall(
        Nw=Nnodes - 1,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        L=L,
        rint=Dint/2,
        rhomcm=7800*400,
        lambda=300,
        WallRes=false,
        rext=Dext/2)
        annotation (Placement(transformation(extent={{-18,-20},{2,-40}})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=0,
        duration=1,
        offset=0.01)
        annotation (Placement(transformation(extent={{-20,62},{0,82}})));
      Modelica.Blocks.Sources.Ramp ramp1(
        offset=0.0025,
        height=0.001,
        duration=1e6)
        annotation (Placement(transformation(extent={{-98,-48},{-78,-28}})));
    equation
      connect(fluidSource.flange, fluid_T_in.inlet) annotation (Line(
          points={{-50,-72},{-42,-72}},
          thickness=0.5,
          color={0,0,255}));
      connect(fluid_T_out.outlet, fluidSink.flange) annotation (Line(
          points={{36,-72},{50,-72}},
          thickness=0.5,
          color={0,0,255}));
      connect(fluid_T_in.outlet, fluidFlow.infl) annotation (Line(
          points={{-30,-72},{-18,-72}},
          color={0,0,255},
          smooth=Smooth.None));
      connect(counterCurrentFV.side1, gasFlow.wall) annotation (Line(
          points={{-8,3},{-8,23}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(counterCurrentFV.side2, tubeWall.ext) annotation (Line(
          points={{-8,-3.1},{-8,-26.9}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(tubeWall.int, fluidFlow.wall) annotation (Line(
          points={{-8,-33},{-8,-67}},
          color={255,127,0},
          smooth=Smooth.None));
      connect(gas_T_out.inlet, gasFlow.outfl) annotation (Line(
          points={{-28,28},{-18,28}},
          color={159,159,223},
          smooth=Smooth.None));
      connect(gasFlow.infl, gas_T_in.outlet) annotation (Line(
          points={{2,28},{18,28}},
          color={159,159,223},
          smooth=Smooth.None));
      connect(gas_T_in.inlet, gasSource.flange) annotation (Line(
          points={{30,28},{44,28}},
          color={159,159,223},
          smooth=Smooth.None));
      connect(gasSink.flange, gas_T_out.outlet) annotation (Line(
          points={{-54,28},{-40,28}},
          color={159,159,223},
          smooth=Smooth.None));
      connect(ramp.y, gasSource.in_w0) annotation (Line(
          points={{1,72},{60,72},{60,33}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(ramp1.y, fluidSource.in_w0) annotation (Line(
          points={{-77,-38},{-64,-38},{-64,-66}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(fluidFlow.outfl, fluid_T_out.inlet) annotation (Line(
          points={{2,-72},{24,-72}},
          color={0,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics),
        __Dymola_experimentSetupOutput,
        Documentation(info="<html>
<p>The model is designed to test the component <code>Water.Flow1DFV</code> (fluid side of a heat exchanger, model uses finite volumes).</p><p>This model represent the two fluid sides of a heat exchanger made by two concentric tubes in counterflow configuration. The thickness of the wall separating the two tubes is negligible. The operating fluid is liquid water. The mass flow rate during the experiment and initial conditions are the same for the two sides. </p><p>During the simulation, the inlet specific enthalpy for hexA (&QUOT;hot side&QUOT;) is changed at time t = 50 s. The outlet temperature of the hot side starts changing after the fluid transport time delay, while the outlet temperature of the cold side starts changing immediately. </p>
<p>Simulation Interval = [0...1200] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<ul>
    <li>18 Sep 2013 by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br/>Updated to new FV structure. Updated parameters.</li></li>
    <li><i>1 Oct 2003</i> by <a href=\"mailto:francesco.schiavo@polimi.it\">Francesco Schiavo</a>:<br>
    First release.</li>
</ul>
</html>"),
        experiment(StopTime=1e+006, Interval=200));
    end TestRefrigerantEvaporator;
  end DistributedParameterComponents;

  package ElectricalComponents "Test for Electrical package components"
    extends Modelica.Icons.ExamplesPackage;

    model TestElectrical1
      extends Modelica.Icons.Example;
      parameter SI.Power Pnom=10e6 "Nominal generator power";
      parameter SI.Frequency f0=system.fnom "Nominal network frequency";
      parameter Integer Np = 2 "Number of polar expansions";
      parameter SI.AngularVelocity omegan_m=2*pi*f0/Np
        "Nominal mechanical angular velocity";
      constant Real pi = Modelica.Constants.pi;
      Electrical.Generator generator(
        Pnom=Pnom,
        Ta=10,
        Np=2,
        referenceGenerator=true) annotation (Placement(transformation(
              extent={{8,-10},{28,10}},  rotation=0)));
      Electrical.Load load(Pnom=Pnom) annotation (Placement(transformation(extent={{40,-20},
                {60,0}},          rotation=0)));
      Modelica.Mechanics.Rotational.Sources.Torque primeMover(useSupport=false)
        annotation (Placement(transformation(extent={{-30,-10},{-10,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Step Step1(
        height=-Pnom/omegan_m,
        offset=Pnom/omegan_m,
        startTime=1) annotation (Placement(transformation(extent={{-70,-10},{
                -50,10}},
                      rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
    equation
      connect(generator.port, load.port) annotation (Line(
          points={{26.6,2.22045e-16},{50,2.22045e-16},{50,-1.4}},
          thickness=0.5,
          color={0,0,0}));
      connect(Step1.y, primeMover.tau) annotation (Line(points={{-49,0},{-32,0}}, color={0,0,127}));
      connect(primeMover.flange, generator.shaft) annotation (Line(points={{-10,0},
              {0,0},{0,2.22045e-16},{9.4,2.22045e-16}},     color={0,0,0}));
      annotation (
        experiment(StopTime=2),
        Documentation(info="<html>
<p>The model is designed to test the generator and load components of the <span style=\"font-family: Courier New;\">Electrical</span> library.</p><p>Simulation sequence: </p>
<ul>
<li>t=0 s: The system starts at equilibrium </li>
<li>t=1 s: The torque is brought to zero. Since there is a deficit of 100&percnt; nominal power in the island, the frequency starts
decreasing with a rate of 100&percnt; for each acceleration time Ta=10 s, i.e., by 10&percnt;/s, or 5 Hz/s </li>
</ul>
<p>Since the system is not connected to a grid, the generator has <span style=\"font-family: Courier New;\">referenceGenerator = true</span> to provide a well-posed initialization problem.</p>
<p>Simulation Interval = [0...2] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<ul>
<li><i>21 Feb 2019</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Rewrote from scratch.</li></ul>
</html>
"));
    end TestElectrical1;

    model TestElectrical2
      extends Modelica.Icons.Example;
      parameter SI.Power Pnom=10e6 "Nominal generator power";
      parameter SI.Frequency f0=system.fnom "Nominal network frequency";
      parameter Integer Np = 2 "Number of polar expansions";
      parameter SI.AngularVelocity omegan_m=2*pi*f0/Np
        "Nominal mechanical angular velocity";
      constant Real pi = Modelica.Constants.pi;

      Electrical.Generator generator(Ta = 10, Np = Np, Pnom = Pnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState)       annotation (Placement(transformation(
              extent={{10,-10},{30,10}}, rotation=0)));
      Electrical.Load load(Pnom = Pnom, usePowerInput=true) annotation (Placement(transformation(extent={
                {30,-40},{50,-20}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sources.Torque primeMover(useSupport=false)
        annotation (Placement(transformation(extent={{-30,-10},{-10,10}},
              rotation=0)));

      Modelica.Blocks.Sources.Step GenTorque(
        height=-0.1*Pnom/omegan_m,
        offset=Pnom/omegan_m,
        startTime=1) annotation (Placement(transformation(extent={{-64,-10},{-44,10}},
                      rotation=0)));
      Electrical.Grid grid(Pgrid=1e9)
                                     annotation (Placement(transformation(extent=
                {{76,-10},{96,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step LocalLoad(
        height=0.1*Pnom,
        offset=Pnom,
        startTime=3) annotation (Placement(transformation(extent={{0,-40},{20,-20}},
              rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
    equation

      connect(load.port, generator.port) annotation (Line(
          points={{40,-21.4},{40,1.77636e-016},{28.6,1.77636e-016}},
          thickness=0.5,
          color={0,0,0}));
      connect(LocalLoad.y, load.referencePower)
        annotation (Line(points={{21,-30},{36.7,-30}}, color={0,0,127}));
      connect(GenTorque.y, primeMover.tau)
        annotation (Line(points={{-43,0},{-32,0}}, color={0,0,127}));
      connect(primeMover.flange, generator.shaft)
        annotation (Line(points={{-10,0},{11.4,0}}, color={0,0,0}));
      connect(generator.port, grid.port) annotation (Line(
          points={{28.6,0},{77.4,0}},
          color={0,0,255},
          thickness=0.5));
      annotation (
        experiment(StopTime=5, Interval = 0.005, Tolerance=1e-006),
        Documentation(info="<html>
<p>The model is designed to test the generator, load, and grid components of the <span style=\"font-family: Courier New;\">Electrical</span> library.</p><p>Simulation sequence: </p>
<ul>
<li>t=0 s: The system starts at equilibrium. All power coming from the generator is absorbed by the load, no exchange with the grid. </li>
<li>t=1 s: The generator torque (hence power) is reduced by 10&percnt;; the corresponding amount of power is now drawn from the grid. </li>
<li>t=3 s: The load power is increased by 10&percnt;; the corresponding amount of power is drawn from the grid. </li>
</ul>
<p>Simulation Interval = [0...5] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<ul>
<li><i>21 Feb 2019</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Rewrote from scratch.</li></ul>
</html>
"));
    end TestElectrical2;

    model TestElectrical3
      extends Modelica.Icons.Example;
      parameter SI.Power Pnom=10e6 "Nominal generator power";
      parameter SI.Frequency f0=system.fnom "Nominal network frequency";
      parameter Integer Np = 2 "Number of polar expansions";
      parameter SI.AngularVelocity omegan_m=2*pi*f0/Np
        "Nominal mechanical angular velocity";
      constant Real pi = Modelica.Constants.pi;
      Electrical.Generator generator(Ta = 10, Np = Np, Pnom = Pnom) annotation (Placement(transformation(
              extent={{10,-10},{30,10}}, rotation=0)));
      Electrical.Load load(Pnom = Pnom, usePowerInput=true) annotation (Placement(transformation(extent={
                {30,-40},{50,-20}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sources.Torque primeMover(useSupport=false)  annotation (Placement(transformation(extent={{-30,-10},{-10,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Step GenTorque(
        height=-0.2*Pnom/omegan_m,
        offset=Pnom/omegan_m,
        startTime=1) annotation (Placement(transformation(extent={{-64,-10},{-44,10}},
                      rotation=0)));
      Electrical.Grid grid(Pgrid=1e9)
                                     annotation (Placement(transformation(extent=
                {{76,-10},{96,10}}, rotation=0)));
      Electrical.Breaker Breaker1(Pnom = Pnom) annotation (Placement(transformation(extent={
                {50,-10},{70,10}}, rotation=0)));
      Modelica.Blocks.Sources.Step LocalLoad(
        height=-0.1*Pnom,
        offset=Pnom,
        startTime=3) annotation (Placement(transformation(extent={{0,-40},{20,-20}},
              rotation=0)));
      Modelica.Blocks.Sources.BooleanStep BreakerCommand(startTime=5,
          startValue=true) annotation (Placement(transformation(extent={{20,20},
                {40,40}}, rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
    equation
      connect(Breaker1.port_b, grid.port) annotation (Line(
          points={{68.6,1.77636e-016},{70.8,1.77636e-016},{70.8,1.77636e-016},{
              73,1.77636e-016},{73,1.77636e-016},{77.4,1.77636e-016}},
          thickness=0.5,
          color={0,0,0}));
      connect(BreakerCommand.y, Breaker1.closed)
        annotation (Line(points={{41,30},{60,30},{60,8}}, color={255,0,255}));
      connect(generator.port, Breaker1.port_a) annotation (Line(
          points={{28.6,1.77636e-016},{40,-3.1606e-022},{38,0},{51.4,
              1.77636e-016}},
          thickness=0.5,
          color={0,0,0}));

      connect(load.port, generator.port) annotation (Line(
          points={{40,-21.4},{40,1.77636e-016},{28.6,1.77636e-016}},
          thickness=0.5,
          color={0,0,0}));
      connect(LocalLoad.y, load.referencePower)
        annotation (Line(points={{21,-30},{36.7,-30}}, color={0,0,127}));
      connect(GenTorque.y, primeMover.tau)
        annotation (Line(points={{-43,0},{-32,0}}, color={0,0,127}));
      connect(primeMover.flange, generator.shaft)
        annotation (Line(points={{-10,0},{11.4,0}}, color={0,0,0}));
      annotation (
        experiment(
          StopTime=10,
          Interval= 0.002,
          Tolerance=1e-06),
        Documentation(info="<html>
<p>The model is designed to test the generator and load components of the <span style=\"font-family: Courier New;\">Electrical</span> library.</p>
<p>Simulation sequence: </p>
<ul>
<li>t=0 s: The system starts at equilibrium, with the breaker closed. All the active power produced by the generator is consumed by the load, so there is zero power drawn from the grid. </li>
<li>t=1 s: The torque (hence the power) is reduced by 20&percnt;; the corresponding amount of power is now drawn from the grid. </li>
<li>t=3 s: The load is reduced by 10&percnt;, so the power drawn from the grid is now reduced to 10&percnt; of the nominal value. </li>
<li>t=5 s: The breaker is opened. Since there is a deficit of 10&percnt; nominal power in the formed island, the frequency starts decreasing with
           a rate of 10&percnt; for each acceleration time Ta=10 s, i.e., by 1&percnt;/s, or 0.5 Hz/s. </li>
</ul>
<p>Simulation Interval = [0...10] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>", revisions="<html>
<ul>
<li><i>21 Feb 2019</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Rewrote from scratch.</li></ul>
</html>
"));
    end TestElectrical3;

    model TestElectrical4
      extends Modelica.Icons.Example;
      parameter SI.Power Pnom=10e6 "Nominal generator power";
      parameter SI.Frequency f0=system.fnom "Nominal network frequency";
      parameter Integer Np = 4 "Number of polar expansions";
      parameter SI.AngularVelocity omega_m_nom=2*pi*f0/Np
        "Nominal mechanical angular velocity";
      constant Real pi = Modelica.Constants.pi;
      Electrical.Generator generator(Ta = 10, Np = Np, Pnom = Pnom,
        initOpt=ThermoPower.Choices.Init.Options.steadyState,
        D=0.01)                                                     annotation (Placement(transformation(
              extent={{-16,-10},{4,10}}, rotation=0)));
      Electrical.Load load(Pnom = Pnom, usePowerInput=true) annotation (Placement(transformation(extent={{4,-40},
                {24,-20}},          rotation=0)));
      Modelica.Mechanics.Rotational.Sources.Torque primeMover(useSupport=false)  annotation (Placement(transformation(extent={{-56,-10},
                {-36,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Step GenTorque(
        height=0,
        offset=Pnom/omega_m_nom,
        startTime=2) annotation (Placement(transformation(extent={{-90,-10},{
                -70,10}},
                      rotation=0)));
      Electrical.Grid grid(Pgrid=1e9) annotation (Placement(transformation(extent={{48,-10},
                {68,10}},           rotation=0)));
      Modelica.Blocks.Sources.Step LocalLoad(
        height=-0.2*Pnom,
        offset=0.2*Pnom,
        startTime=1) annotation (Placement(transformation(extent={{-26,-40},{-6,
                -20}},
              rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
      Electrical.TransmissionLine transmissionLine(Pnom=Pnom, Xpu=0.1)
        annotation (Placement(transformation(extent={{24,-10},{44,10}})));
    equation

      connect(load.port, generator.port) annotation (Line(
          points={{14,-21.4},{14,1.77636e-16},{2.6,1.77636e-16}},
          thickness=0.5,
          color={0,0,0}));
      connect(LocalLoad.y, load.referencePower)
        annotation (Line(points={{-5,-30},{10.7,-30}}, color={0,0,127}));
      connect(GenTorque.y, primeMover.tau)
        annotation (Line(points={{-69,0},{-58,0}}, color={0,0,127}));
      connect(primeMover.flange, generator.shaft)
        annotation (Line(points={{-36,0},{-14.6,0}},color={0,0,0}));
      connect(grid.port, transmissionLine.port_b) annotation (Line(
          points={{49.4,0},{44,0}},
          color={0,0,255},
          thickness=0.5));
      connect(generator.port, transmissionLine.port_a) annotation (
          Line(
          points={{2.6,0},{24,0}},
          color={0,0,255},
          thickness=0.5));
      annotation (
        experiment(
          StopTime=10,
          Interval= 0.002,
          Tolerance=1e-06),
        Documentation(
    info="<html>
<p>The model is designed to test the generator and load components of the <span style=\"font-family: Courier New;\">Electrical</span> library.</p>
<p>Simulation sequence: </p>
<ul>
<li>t=0 s: The system starts at equilibrium. 20% of the active power produced by the generator is consumed by the local load, while the remaining
80% is fed to the grid via a transmission line. </li>
<li>t=1 s: The local load is brought to zero. As a consequence, 20% of the active power production is now rerouted to the grid</li>
</ul>
<p>During the transient, electro-mechanical oscillations are triggered. The theoretical pseudo-period is 
<code>T = sqrt(2*pi*Ta*Xpu/fnom) = </code>0.35, which corresponds to the observed one.</p>
<p>Simulation Interval = [0...10] sec </p><p>Integration Algorithm = DASSL </p><p>Algorithm Tolerance = 1e-6 </p>
</html>",
    revisions="<html>
<ul>
<li><i>21 Feb 2019</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Rewrote from scratch.</li></ul>
</html>
"));
    end TestElectrical4;

    model TestElectrical5
      extends Modelica.Icons.Example;
      parameter SI.Power Pa = 30e6;
      parameter SI.Power Pb = 10e6;
      parameter SI.Power P = Pa + Pb;
      parameter Integer Np = 2;
      parameter SI.Time Ta = 10;
      parameter SI.AngularVelocity omega = 2*pi*system.fnom/Np;
      constant SI.PerUnit pi = Modelica.Constants.pi;
      Electrical.Generator gen_a(
        Ta=Ta,
        Np=Np,                                    Pnom = Pa,
        referenceGenerator=true,
        initOpt=ThermoPower.Choices.Init.Options.steadyState)
                                                             annotation (Placement(
            transformation(extent={{-40,-10},{-20,10}}, rotation=0)));
      Electrical.Generator gen_b(
        Ta=Ta,
        Np=Np,                                    Pnom = Pb,
        initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(
            transformation(
            origin={30,0},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Modelica.Mechanics.Rotational.Sources.Torque torque_a(useSupport=false)
        annotation (Placement(transformation(extent={{-70,-10},{-50,10}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Sources.Torque torque_b(useSupport=false)
        annotation (Placement(transformation(extent={{70,-10},{50,10}},
              rotation=0)));
      Modelica.Blocks.Sources.Step NomTorque_a(
        offset=Pa/omega,
        startTime=20,
        height=0)           annotation (Placement(transformation(extent={{-96,-6},
                {-84,6}}, rotation=0)));
      Modelica.Blocks.Sources.Step NomTorque_b(height=0, offset=Pb/omega)
        annotation (Placement(transformation(extent={{96,-6},{84,6}}, rotation=
                0)));
      Electrical.TransmissionLine transmissionLine(Pnom=P, Xpu=0.3)
        annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
      Electrical.Load load(Pnom=40e6, usePowerInput=true)
        annotation (Placement(transformation(extent={{-30,-38},{-10,-18}})));
      Modelica.Blocks.Sources.Step Load(
        offset=P,
        startTime=2,
        height=0.01*P)
                      annotation (Placement(transformation(extent={{-56,-34},{-44,-22}},
              rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
    equation
      connect(NomTorque_b.y, torque_b.tau)
        annotation (Line(points={{83.4,0},{72,0}}, color={0,0,127}));
      connect(NomTorque_a.y, torque_a.tau)
        annotation (Line(points={{-83.4,0},{-72,0}}, color={0,0,127}));
      connect(torque_b.flange, gen_b.shaft) annotation (Line(
          points={{50,0},{48,0},{48,-1.23083e-015},{38.6,-1.23083e-015}},
          color={0,0,0},
          thickness=0.5));
      connect(torque_a.flange, gen_a.shaft) annotation (Line(
          points={{-50,0},{-47.3,0},{-47.3,1.77636e-016},{-38.6,1.77636e-016}},
          color={0,0,0},
          thickness=0.5));

      connect(gen_a.port, transmissionLine.port_a) annotation (Line(
          points={{-21.4,0},{-8,0}},
          color={0,0,255},
          thickness=0.5));
      connect(gen_b.port, transmissionLine.port_b) annotation (Line(
          points={{21.4,1.11022e-15},{16,1.11022e-15},{16,0},{12,0}},
          color={0,0,255},
          thickness=0.5));
      connect(gen_a.port, load.port) annotation (Line(
          points={{-21.4,0},{-20,0},{-20,-19.4}},
          color={0,0,255},
          thickness=0.5));
      connect(Load.y, load.referencePower)
        annotation (Line(points={{-43.4,-28},{-23.3,-28}}, color={0,0,127}));
      annotation (
        experiment(StopTime=15, Tolerance=1e-07),
        Documentation(info="<html>
<p>This model represents a simple islanded power system operating in open loop. Generator A has 30 MW nominal power, generator B has 10 MW.</p>
<p>The model starts at steady state, with both generators at full load supplying a 40 MW load connected at the A side of the transmission line.</p>
<p>At time = 2s, the load is increased by 1%. As both generators have Ta = 10s, the frequency starts dropping by 1% every 10 s, or 0.05 Hz/s.
Electro-mechanical oscillations are also triggered, that are not damped out because the generator models do not include the effect of
rotor damper cages, and there is no primary frequency control in the system.</p>
</html>", revisions="<html>
<ul>
<li><i>21 Feb 2019</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Rewrote from scratch.</li></ul>
</html>
"),     __Dymola_experimentSetupOutput(equdistant=false));
    end TestElectrical5;

    model TestElectrical6
      extends Modelica.Icons.Example;
      parameter SI.Power Pa = 30e6;
      parameter SI.Power Pb = 10e6;
      parameter SI.Power P = Pa + Pb;
      parameter Integer Np = 2;
      parameter SI.AngularVelocity omega = 2*pi*system.fnom/Np;
      constant SI.PerUnit pi = Modelica.Constants.pi;
      Electrical.Generator gen_a(Ta = 10, Np = 2, Pnom = Pa,
        D=0.02,
        referenceGenerator=true,
        initOpt=ThermoPower.Choices.Init.Options.steadyState)
                                                             annotation (Placement(
            transformation(extent={{-44,-50},{-24,-30}},rotation=0)));
      Electrical.Generator gen_b(Ta = 10, Np = 2, Pnom = Pb,
        D=0.02,
        initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(
            transformation(
            origin={26,-40},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Modelica.Mechanics.Rotational.Sources.Torque torque_a(useSupport=false)
        annotation (Placement(transformation(extent={{-74,-50},{-54,-30}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Sources.Torque torque_b(useSupport=false)
        annotation (Placement(transformation(extent={{66,-50},{46,-30}},
              rotation=0)));
      Modelica.Blocks.Continuous.FirstOrder
                                   torqueGen_a(
        T=0.2,
        initType=Modelica.Blocks.Types.Init.SteadyState,
        y_start=Pa/omega)   annotation (Placement(transformation(extent={{-100,-46},
                {-88,-34}},
                          rotation=0)));
      Electrical.TransmissionLine transmissionLine(Pnom=P, Xpu=0.3)
        annotation (Placement(transformation(extent={{-12,-50},{8,-30}})));
      Electrical.Load load(Pnom=40e6, usePowerInput=true)
        annotation (Placement(transformation(extent={{-34,-78},{-14,-58}})));
      Modelica.Blocks.Sources.Step Load(
        offset=P,
        startTime=2,
        height=-0.1*P)
                      annotation (Placement(transformation(extent={{-60,-74},{-48,-62}},
              rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
      Electrical.FrequencySensor frequency_a annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-26,-16})));
      Electrical.FrequencySensor frequency_b annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={16,-16})));
      PrimaryController controllerA(Pnom=Pa)
        annotation (Placement(transformation(extent={{-122,-34},{-110,-46}})));
      Modelica.Blocks.Sources.Constant refPa(k=Pa)
        annotation (Placement(transformation(extent={{-156,-48},{-144,-36}})));
      Modelica.Blocks.Sources.Constant refPb(k=Pb)
        annotation (Placement(transformation(extent={{142,-48},{130,-36}})));
      PrimaryController controllerB(Pnom=Pb)
        annotation (Placement(transformation(extent={{112,-34},{100,-46}})));
      Modelica.Blocks.Continuous.FirstOrder torqueGen_b(
        T=0.2,
        initType=Modelica.Blocks.Types.Init.SteadyState,
        y_start=Pb/omega) annotation (Placement(transformation(extent={{90,-46},{78,
                -34}}, rotation=0)));
    equation
      connect(torqueGen_a.y, torque_a.tau)
        annotation (Line(points={{-87.4,-40},{-76,-40}},
                                                     color={0,0,127}));
      connect(torque_b.flange, gen_b.shaft) annotation (Line(
          points={{46,-40},{34.6,-40}},
          color={0,0,0},
          thickness=0.5));
      connect(torque_a.flange, gen_a.shaft) annotation (Line(
          points={{-54,-40},{-42.6,-40}},
          color={0,0,0},
          thickness=0.5));

      connect(gen_a.port, transmissionLine.port_a) annotation (Line(
          points={{-25.4,-40},{-12,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(gen_b.port, transmissionLine.port_b) annotation (Line(
          points={{17.4,-40},{8,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(gen_a.port, load.port) annotation (Line(
          points={{-25.4,-40},{-24,-40},{-24,-59.4}},
          color={0,0,255},
          thickness=0.5));
      connect(Load.y, load.referencePower)
        annotation (Line(points={{-47.4,-68},{-27.3,-68}}, color={0,0,127}));
      connect(gen_a.port, frequency_a.port) annotation (Line(
          points={{-25.4,-40},{-26,-40},{-26,-26}},
          color={0,0,255},
          thickness=0.5));
      connect(gen_b.port, frequency_b.port) annotation (Line(
          points={{17.4,-40},{16,-40},{16,-26}},
          color={0,0,255},
          thickness=0.5));
      connect(torqueGen_a.u, controllerA.torque) annotation (Line(points={{-101.2,-40},
              {-106,-40},{-106,-40},{-110,-40}}, color={0,0,127}));
      connect(frequency_a.f, controllerA.frequency) annotation (Line(points={{-26,-5.8},
              {-26,4},{-138,4},{-138,-37.6},{-122,-37.6}}, color={0,0,127}));
      connect(refPa.y, controllerA.powerSetPoint) annotation (Line(points={{-143.4,-42},
              {-134,-42},{-134,-42.4},{-122,-42.4}}, color={0,0,127}));
      connect(controllerB.powerSetPoint, refPb.y) annotation (Line(points={{112,-42.4},
              {126,-42.4},{126,-42},{129.4,-42}}, color={0,0,127}));
      connect(frequency_b.f, controllerB.frequency) annotation (Line(points={{16,-5.8},
              {16,4},{124,4},{124,-37.6},{112,-37.6}}, color={0,0,127}));
      connect(controllerB.torque, torqueGen_b.u)
        annotation (Line(points={{100,-40},{91.2,-40}}, color={0,0,127}));
      connect(torque_b.tau, torqueGen_b.y)
        annotation (Line(points={{68,-40},{77.4,-40}}, color={0,0,127}));
      annotation (
        experiment(StopTime=40, Tolerance=1e-06),
        Documentation(info="<html>
<p>This model represents a simple islanded power system with primary frequency control open loop. Generator A has 30 MW nominal power, generator B has 10 MW.</p>
<p>The model starts at steady state, with both generators at full load supplying a 40 MW load connected at the A side of the transmission line.</p>
<p>At time = 2s, the load is decreased by 10%. The primary frequency controllers kick in and stabilize the frequency, with an error of 5% of 10% of 50 Hz, 
i.e. 0.25 Hz. Electro-mechanical oscillations are also triggered, but eventually die out thanks to the generator damping effect.</p>
</html>", revisions="<html>
<ul>
<li><i>21 Feb 2019</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Rewrote from scratch.</li></ul>
</html>
"),     __Dymola_experimentSetupOutput(equdistant=false),
        Diagram(coordinateSystem(extent={{-160,-100},{160,100}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end TestElectrical6;

    model TestElectrical7
      extends Modelica.Icons.Example;
      parameter SI.Power Pa = 30e6;
      parameter SI.Power Pb = 10e6;
      parameter SI.Power P = Pa + Pb;
      parameter Integer Np = 2;
      parameter SI.AngularVelocity omega = 2*pi*system.fnom/Np;
      constant SI.PerUnit pi = Modelica.Constants.pi;
      Electrical.Generator gen_a(Ta = 10, Np = 2, Pnom = Pa,
        D=0.02,
        referenceGenerator=true,
        initOpt=ThermoPower.Choices.Init.Options.steadyState)
                                                             annotation (Placement(
            transformation(extent={{-44,-50},{-24,-30}},rotation=0)));
      Electrical.Generator gen_b(Ta = 10, Np = 2, Pnom = Pb,
        D=0.02,
        initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(
            transformation(
            origin={26,-40},
            extent={{-10,-10},{10,10}},
            rotation=180)));
      Modelica.Mechanics.Rotational.Sources.Torque torque_a(useSupport=false)
        annotation (Placement(transformation(extent={{-74,-50},{-54,-30}},
              rotation=0)));
      Modelica.Mechanics.Rotational.Sources.Torque torque_b(useSupport=false)
        annotation (Placement(transformation(extent={{66,-50},{46,-30}},
              rotation=0)));
      Modelica.Blocks.Continuous.FirstOrder
                                   torqueGen_a(
        T=0.2,
        initType=Modelica.Blocks.Types.Init.SteadyState,
        y_start=Pa/omega)   annotation (Placement(transformation(extent={{-100,-46},
                {-88,-34}},
                          rotation=0)));
      Electrical.TransmissionLine transmissionLine(Pnom=P, Xpu=0.3)
        annotation (Placement(transformation(extent={{-12,-50},{8,-30}})));
      Electrical.Load load(Pnom=40e6, usePowerInput=true)
        annotation (Placement(transformation(extent={{-34,-78},{-14,-58}})));
      Modelica.Blocks.Sources.Step Load(
        offset=P,
        startTime=2,
        height=-0.1*P)
                      annotation (Placement(transformation(extent={{-60,-74},{-48,-62}},
              rotation=0)));
      inner System system(initOpt=ThermoPower.Choices.Init.Options.steadyState)
        annotation (Placement(transformation(extent={{60,60},{80,80}})));
      Electrical.FrequencySensor frequency_a annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-26,-16})));
      Electrical.FrequencySensor frequency_b annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={16,-16})));
      PrimaryController controllerA(Pnom=Pa)
        annotation (Placement(transformation(extent={{-122,-34},{-110,-46}})));
      Modelica.Blocks.Sources.Constant refPa(k=Pa)
        annotation (Placement(transformation(extent={{-190,-48},{-178,-36}})));
      Modelica.Blocks.Sources.Constant refPb(k=Pb)
        annotation (Placement(transformation(extent={{142,-48},{130,-36}})));
      PrimaryController controllerB(Pnom=Pb)
        annotation (Placement(transformation(extent={{112,-34},{100,-46}})));
      Modelica.Blocks.Continuous.FirstOrder torqueGen_b(
        T=0.2,
        initType=Modelica.Blocks.Types.Init.SteadyState,
        y_start=Pb/omega) annotation (Placement(transformation(extent={{90,-46},{78,
                -34}}, rotation=0)));
      SecondaryController secondaryController(Pnom=40e6, Ts=300)
        annotation (Placement(transformation(extent={{-60,20},{-80,40}})));
      Modelica.Blocks.Math.Feedback feedback
        annotation (Placement(transformation(extent={{-168,-34},{-152,-50}})));
    equation
      connect(torqueGen_a.y, torque_a.tau)
        annotation (Line(points={{-87.4,-40},{-76,-40}},
                                                     color={0,0,127}));
      connect(torque_b.flange, gen_b.shaft) annotation (Line(
          points={{46,-40},{34.6,-40}},
          color={0,0,0},
          thickness=0.5));
      connect(torque_a.flange, gen_a.shaft) annotation (Line(
          points={{-54,-40},{-42.6,-40}},
          color={0,0,0},
          thickness=0.5));

      connect(gen_a.port, transmissionLine.port_a) annotation (Line(
          points={{-25.4,-40},{-12,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(gen_b.port, transmissionLine.port_b) annotation (Line(
          points={{17.4,-40},{8,-40}},
          color={0,0,255},
          thickness=0.5));
      connect(gen_a.port, load.port) annotation (Line(
          points={{-25.4,-40},{-24,-40},{-24,-59.4}},
          color={0,0,255},
          thickness=0.5));
      connect(Load.y, load.referencePower)
        annotation (Line(points={{-47.4,-68},{-27.3,-68}}, color={0,0,127}));
      connect(gen_a.port, frequency_a.port) annotation (Line(
          points={{-25.4,-40},{-26,-40},{-26,-26}},
          color={0,0,255},
          thickness=0.5));
      connect(gen_b.port, frequency_b.port) annotation (Line(
          points={{17.4,-40},{16,-40},{16,-26}},
          color={0,0,255},
          thickness=0.5));
      connect(torqueGen_a.u, controllerA.torque) annotation (Line(points={{-101.2,-40},
              {-106,-40},{-106,-40},{-110,-40}}, color={0,0,127}));
      connect(frequency_a.f, controllerA.frequency) annotation (Line(points={{-26,-5.8},
              {-26,4},{-138,4},{-138,-37.6},{-122,-37.6}}, color={0,0,127}));
      connect(controllerB.powerSetPoint, refPb.y) annotation (Line(points={{112,-42.4},
              {126,-42.4},{126,-42},{129.4,-42}}, color={0,0,127}));
      connect(frequency_b.f, controllerB.frequency) annotation (Line(points={{16,-5.8},
              {16,4},{124,4},{124,-37.6},{112,-37.6}}, color={0,0,127}));
      connect(controllerB.torque, torqueGen_b.u)
        annotation (Line(points={{100,-40},{91.2,-40}}, color={0,0,127}));
      connect(torque_b.tau, torqueGen_b.y)
        annotation (Line(points={{68,-40},{77.4,-40}}, color={0,0,127}));
      connect(frequency_a.f, secondaryController.frequency)
        annotation (Line(points={{-26,-5.8},{-26,30},{-60,30}}, color={0,0,127}));
      connect(controllerA.powerSetPoint, feedback.y) annotation (Line(points={{-122,
              -42.4},{-138,-42.4},{-138,-42},{-152.8,-42}}, color={0,0,127}));
      connect(feedback.u1, refPa.y)
        annotation (Line(points={{-166.4,-42},{-177.4,-42}}, color={0,0,127}));
      connect(secondaryController.powerOffset, feedback.u2) annotation (Line(points=
             {{-80,30},{-160,30},{-160,-35.6}}, color={0,0,127}));
      annotation (
        experiment(StopTime=300, Tolerance=1e-06),
        Documentation(info="<html>
<p>This model represents a simple islanded power system with primary and secondary frequency control open loop. Generator A has 30 MW nominal power, generator B has 10 MW.</p>
<p>The model starts at steady state, with both generators at full load supplying a 40 MW load connected at the A side of the transmission line.</p>
<p>At time = 2s, the load is decreased by 10%. The primary frequency controllers kick in and quickly stabilize the frequency, with an error of about 5% of 10% of 50 Hz, 
i.e. 0.25 Hz. Electro-mechanical oscillations are also triggered, but eventually die out thanks to the generator damping effect. </p>
<p>Subsequently, the secondary frequency controller brings back the system to 50 Hz in 300 s. Only generator A participates to the secondary frequency control action.</p>
</html>", revisions="<html>
<ul>
<li><i>22 Feb 2019</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       Rewrote from scratch.</li></ul>
</html>
"),     __Dymola_experimentSetupOutput(equdistant=false),
        Diagram(coordinateSystem(extent={{-200,-100},{160,100}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end TestElectrical7;

    model PrimaryController
      parameter SI.PerUnit droop = 0.05 "Droop";
      parameter SI.Power Pnom "Nominal active power";
      parameter Integer Np = 2 "Number of electric poles";
      final parameter SI.Frequency f0 = system.fnom "Reference frequency";
      constant Real pi = Modelica.Constants.pi;
      outer System system;

      SI.Power P;
      Modelica.Blocks.Interfaces.RealInput frequency "Measured frequency in Hz"
                                                     annotation (Placement(
            transformation(extent={{-120,-60},{-80,-20}},rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput torque annotation (Placement(
            transformation(extent={{100,0},{120,20}},   rotation=0),
            iconTransformation(extent={{80,-20},{120,20}})));
      Modelica.Blocks.Interfaces.RealInput powerSetPoint "Power set point in W"
        annotation (Placement(transformation(extent={{-120,20},{-80,60}}, rotation=0)));
    equation
      P = powerSetPoint + Pnom/droop*(f0 - frequency)/f0;
      torque = P/(2*pi*frequency/Np);
      annotation (
        Icon(graphics={Rectangle(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Text(
                  extent={{-60,60},{60,-60}},
                  lineColor={0,0,0},
                  textString="C")}),
        Documentation(info="<html>
<p>Controller for static control of the frequency.
</html>", revisions="<html>
<ul>
<li><i>15 Jul 2008</i>
    by <a> Luca Savoldelli </a>:<br>
       First release.</li>
</ul>
</html>"));
    end PrimaryController;

    model SecondaryController
      parameter SI.PerUnit droop = 0.05 "Droop";
      parameter SI.Power Pnom "Overall system nominal active power";
      parameter SI.Time Ts "Settling time of frequency";
      parameter ThermoPower.Choices.Init.Options initOpt=system.initOpt
        "Initialization option" annotation (Dialog(tab="Initialization"));
      parameter SI.Power powerOffset_start = 0 "Start value of power offset" annotation (Dialog(tab="Initialization"));
      final parameter SI.Frequency f0 = system.fnom "Nominal frequency";
      final parameter SI.AngularFrequency mu = 5*Ts*Pnom/(f0*droop) "Integral controller gain";
      outer System system;

      Modelica.Blocks.Interfaces.RealInput frequency "Measured frequency in Hz" annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}, rotation=0),
            iconTransformation(extent={{-120,-20},{-80,20}})));
      Modelica.Blocks.Interfaces.RealOutput powerOffset(start = powerOffset_start)
         "Power offset to the plant controllers" annotation (Placement(
            transformation(extent={{100,0},{120,20}},   rotation=0),
            iconTransformation(extent={{80,-20},{120,20}})));

    equation
      der(powerOffset) = 5*Pnom/(Ts*droop)*(frequency-f0)/f0;
    initial equation
      if initOpt == ThermoPower.Choices.Init.Options.noInit then
        // do nothing
      elseif initOpt == ThermoPower.Choices.Init.Options.steadyState then
        der(powerOffset) = 0;
      elseif initOpt == ThermoPower.Choices.Init.Options.fixedState then
        powerOffset = powerOffset_start;
      else
        assert(false, "Unsupported initialisation option");
      end if;

      annotation (
        Icon(graphics={Rectangle(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),Text(
                  extent={{-60,60},{60,-60}},
                  lineColor={0,0,0},
                  textString="C")}),
        Documentation(info="<html>
<p>Controller for static control of the frequency.
</html>", revisions="<html>
<ul>
<li><i>15 Jul 2008</i>
    by <a> Luca Savoldelli </a>:<br>
       First release.</li>
</ul>
</html>"));
    end SecondaryController;
  end ElectricalComponents;

  annotation (Documentation(info="<HTML>
This package contains test cases for the ThermoPower library.
</HTML>"));
end Test;
