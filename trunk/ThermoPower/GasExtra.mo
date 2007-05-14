package GasExtra 
  extends Modelica.Icons.Library;
    model Compressor_low "Gas compressor" 
    extends ThermoPower.Gas.CompressorBase;
    import ThermoPower.Choices.TurboMachinery.TableTypes;
    parameter AngularVelocity Ndesign "Design velocity";
    parameter Real tablePhic_low[:,:]=fill(0, 0, 2) "Table for phic(N_T,beta)";
    parameter Real tableEta_low[:,:]=fill(0, 0, 2) "Table for eta(N_T,beta)";
    parameter Real tablePR_low[:,:]=fill(0, 0, 2) "Table for PR(N_T,beta)";
    parameter String fileName="noName" "File where matrix is stored";
    parameter TableTypes.Temp Table 
      "Selection of the way of definition of table matrix";
    Modelica.Blocks.Tables.CombiTable2D Eta_low(
      tableOnFile=if (Table == 0) then false else true,
                  table=tableEta_low,tableName=if (Table==0) then "NoName" else "tabEta_low",
                  fileName=if (Table==0) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) 
                                           annotation (extent=[-10,60; 10,80]);
    Modelica.Blocks.Tables.CombiTable2D PressRatio_low(
      tableOnFile=if (Table == 0) then false else true,
                  table=tablePR_low, tableName=if (Table==0) then "NoName" else "tabPR_low",
                  fileName=if (Table==0) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) 
      annotation (extent=[-10,0; 10,20]);
    Modelica.Blocks.Tables.CombiTable2D Phic_low(
      tableOnFile=if (Table == 0) then false else true,
                  table=tablePhic_low, tableName=if (Table==0) then "NoName" else "tabPhic_low",
                  fileName=if (Table==0) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) 
      annotation (extent=[-10,30; 10,50]);
    Real N_T "Referred speed ";
    Real Ndesign_T "Referred design speed";
    Real phic_low(final unit="(kg/s)*(T^0.5)/Pa") "Flow number at low speed";
    Real eta_low "efficiency at low speed";
    Real beta(start=integer(size(tablePhic_low, 1)/2)) "Number of beta line";
    Real PR_low "pressure ratio at low speed";
    
    equation 
    Ndesign_T=Ndesign/sqrt(Tstart_in) "Referred design velocity";
    N_T = 100*omega/(sqrt(gas_in.T)*Ndesign_T) 
      "Referred speed definition, as percentage of design velocity";
    phic_low = w*gas_in.T/(gas_in.p*omega) 
      "Flow number definition at low speed";
    eta_low= eta*(hout-gas_in.h)/(omega^2) "Efficiency definition at low speed";
    PR_low = (hout-gas_in.h)/(omega^2) "Pressure ratio definition at low speed";
    assert(beta >= 1, "The compressor works in unstable conditions");
    
    // phic_low = Phic_low(beta, N_T)
    Phic_low.u1 = beta;
    Phic_low.u2 = N_T;
    phic_low = Phic_low.y;
    
    // eta_low = Eta_low(beta, N_T)
    Eta_low.u1 = beta;
    Eta_low.u2 = N_T;
    eta_low = Eta_low.y;
    
    // PR_low = PressRatio_low(beta, N_T)
    PressRatio_low.u1 = beta;
    PressRatio_low.u2 = N_T;
    PR_low = PressRatio_low.y;
    annotation (uses(                         ThermoPower(version="2"), Modelica(
            version="2.2")),                   Diagram,
      Documentation(info="<html>
This model adds the performance characteristics to the Compressor_Base model, at low speed.</p>
<p>In the low speed region, it is not possible to use the standard definitio of efficiency <tt>eta</tt>, because efficiency becomes negative and/or singular. The referred speed <tt>N_T</tt> and beta lines <tt>beta</tt> are still employed, but the flow number, the pressure ratio and the efficiency are replaced with <tt>phic_low</tt>, <tt>PR_low</tt> and <tt>eta_low</tt> respectively [2].</p>
<p>The performance maps are thus tabulated into three differents tables, <tt>tablePhic_low</tt>,  <tt>tablePR_low</tt> and <tt>tableEta_low</tt>, which express <tt>phic_low</tt>, <tt>PR_low</tt> and <tt>eta_low</tt> as a function of <tt>N_T</tt> and <tt>beta</tt>, respectively, where <tt>N_T</tt> is the first row while <tt>beta</tt> is the first column. The referred speed <tt>N_T</tt> is defined as a percentage of the design referred speed and <tt>beta</tt> are arbitrary lines, drawn parallel to the surge-line on the performance maps.
<p><tt>Modelica.Blocks.Tables.CombiTable2D</tt> interpolates the tables to obtain values of referred flow, pressure ratio and efficiency at given levels of referred speed and beta.
<p><b>Modelling options</b></p>
<p>The following options are available to determine how the table is defined:
<ul><li><tt>Table = 0</tt>: the table is explicitly supplied as matrix parameter.
<li><tt>Table = 1</tt>: the table is read from a file; the string <tt>fileName</tt> contains the path to the files where the tables are stored, either in ASCII or Matlab binary format.
</ul>
<p><b>References:</b></p>
<ol>
<li>S. L. Dixon: <i>Fluid mechanics, thermodynamics of turbomachinery</i>, Oxford, Pergamon press, 1966, pp. 213.
</ol>
<ol>
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol> 
</html>", revisions="<html>
<ul>
<li><i>22 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
  First release.</li>
</ul>
</html>"));
    end Compressor_low;
  
  model Turbine_low "Gas Turbine for low speed" 
    extends ThermoPower.Gas.TurbineBase;
    import ThermoPower.Choices.TurboMachinery.TableTypes;
    parameter AngularVelocity Ndesign "Design velocity";
    parameter Real tablePhic_low[:,:]=fill(0,0,2) "Table for phic(N_T,PR)";
    parameter Real tableEta_low[:,:]=fill(0,0,2) "Table for eta(N_T,PR)";
    parameter String fileName="NoName" "File where matrix is stored";
    parameter TableTypes.Temp Table 
      "Selection of the way of definition of table matrix";
    
    Real N_T "Referred speed";
    Real Ndesign_T "Referred design speed";
    Real phic_low "Flow number at low speed";
    Real eta_low "Efficiency at low speed";
    Real PR_low "pressure ratio at low speed";
    Modelica.Blocks.Tables.CombiTable2D Eta_low(
                    tableOnFile=if (Table == 0) then false else true, table=tableEta_low,
                    tableName=if (Table == 0) then "NoName" else "tabEta_low",
                    fileName=if (Table == 0) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) 
      annotation (extent=[-10,48; 10,68]);
    Modelica.Blocks.Tables.CombiTable2D Phic_low(
                    tableOnFile=if (Table == 0) then false else true, table=tablePhic_low,
                    tableName=if (Table == 0) then "NoName" else "tabPhic_low",
                    fileName=if (Table == 0) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) 
      annotation (extent=[-10,18; 10,38]);
  equation 
    Ndesign_T=Ndesign/sqrt(Tstart_in) "Referred design velocity";
    N_T = 100*omega/(sqrt(gas_in.T)*Ndesign_T) 
      "Referred speed definition as percentage of design velocity";
    phic_low = w*(gas_in.T)/(omega*(gas_in.p)) "Flow number definition";
    eta_low = eta*(gas_in.h-hout)/(omega^2) 
      "Efficiency definition at low speed";
    PR_low = (gas_in.h-hout)/omega^2 "pressure ratio definition at low speed";
    
    // phic_low = Phic_low(PR_low, N_T)
    Phic_low.u1 = PR_low;
    Phic_low.u2 = N_T;
    phic_low = Phic_low.y;
    
    // eta_low = Eta_low(PR_low, N_T)
    Eta_low.u1 = PR_low;
    Eta_low.u2 = N_T;
    eta_low = Eta_low.y;
    
    annotation (Documentation(info="<html>
This model adds the performance characteristics to the Turbine_Base model at low speed.
<p>The performance characteristics are described by two characteristic equations: the first relates the flow number <tt>phic</tt>, the pressure ratio <tt>PR</tt> and the referred speed <tt>N_T</tt>; the second relates the efficiency <tt>eta</tt>, the flow number <tt>phic</tt>, and the referred speed <tt>N_T</tt> [1]. </p> 
<p>At low speed, the definition of efficiency becomes tenous; to overcome this difficoulty, alternative number groups are used for loading maps into starting model, where the gropus <tt>N_T</tt> and <tt>PR_low</tt> are used to read the map, with <tt>phic_low</tt> and <tt>eta_low</tt> returned from it.</p>
<p>The performance maps are tabulated into two differents tables, <tt>tablePhic_low</tt> and <tt>tableEta_low</tt> which express <tt>phic_low</tt> and <tt>eta_low</tt> as a function of <tt>N_T</tt> and <tt>PR_low</tt> respectively, where <tt>N_T</tt> represents the first row and <tt>PR_low</tt> the first column [2]. The referred speed <tt>N_T</tt> is defined as a percentage of the design referred speed.
<p>The <tt>Modelica.Blocks.Tables.CombiTable2D</tt> interpolates the tables to obtain values of referred flow and efficiency at given levels of referred speed.
<p><b>Modelling options</b></p>
<p>The following options are available to determine how the table is defined:
<ul><li><tt>Table = 0</tt>: the table is explicitly supplied as matrix parameter.
<li><tt>Table = 1</tt>: the table is read from a file; the string <tt>fileName</tt> contains the path to the files where tables are stored, either in ASCII or Matlab binary format.
</ul>
<p><b>References:</b></p>
<ol>
<li>S. L. Dixon: <i>Fluid mechanics, thermodynamics of turbomachinery</i>, Oxford, Pergamon press, 1966, pp. 213.
</ol>
<ol>
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>, 2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol> 
</html>",   revisions="<html>
<ul>
<li><i>22 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"),   uses(                         ThermoPower(version="2"), Modelica(
            version="2.2")),
      Diagram);
  end Turbine_low;
  
  model Compressor_M "Gas compressor" 
    extends ThermoPower.Gas.CompressorBase;
    import ThermoPower.Choices.TurboMachinery.TableTypes;
   parameter AngularVelocity Ndesign "Design velocity";
   parameter Real tablePhic[:,:]= fill(0,0,2) "Table for phic(N_T,beta)";
   parameter Real tableM[:,:]=fill(0,0,2) "Table for torque(N_T,beta)";
   parameter Real tablePR[:,:]=fill(0,0,2) "Table for PR(N_T,beta)";
   parameter String fileName="noName" "File where matrix is stored";
   parameter TableTypes.Temp Table 
      "Selection of the way of definition of table matrix";
   Modelica.Blocks.Tables.CombiTable2D Torque(
                   tableOnFile=if (Table == 0) then false else true,
                   fileName=if (Table == 0) then "NoName" else fileName,
                   table=tableM, tableName=if (Table == 0) then "NoName" else "tabM",
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) 
                                           annotation (extent=[-10,60; 10,80]);
   Modelica.Blocks.Tables.CombiTable2D PressRatio(tableOnFile= if (Table==0) then false else true,
                  table=tablePR, tableName=if (Table==0) then "NoName" else "tabPR",
                  fileName=if (Table==0) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) 
      annotation (extent=[-10,0; 10,20]);
   Modelica.Blocks.Tables.CombiTable2D Phic(tableOnFile= if (Table==0) then false else true,
                  table=tablePhic, tableName=if (Table==0) then "NoName" else "tabPhic",
                  fileName=if (Table==0) then "NoName" else fileName,
      smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative) 
      annotation (extent=[-10,30; 10,50]);
   Real N_T "Referred speed ";
   Real Ndesign_T "Referred design velocity";
   Real phic(final unit = "(kg/s)*(T^0.5)/Pa") "Flow number ";
   Real beta(start=integer(size(tablePhic,1)/2)) "Number of beta line";
   Real torque( final unit= "(J/kg)/(rad/s)/(T^0.5)") " corrected torque";
    
  equation 
    Ndesign_T=Ndesign/sqrt(Tstart_in) "Referred design velocity";
    N_T = 100*omega/(sqrt(gas_in.T)*Ndesign_T) 
      "Referred speed definition, as percentage of design velocity";
    phic = w*sqrt(gas_in.T)/(gas_in.p) "Flow number definition";
    torque=tau/(w*sqrt(gas_in.T));
    // phic = Phic(beta, N_T)
    Phic.u1 = beta;
    Phic.u2 = N_T;
    Phic.y = phic;
    
    // M = Torque(beta, N_T)
    Torque.u1 = beta;
    Torque.u2 = N_T;
    Torque.y = torque;
    
    // PR = PressRatio(beta, N_T)
    PressRatio.u1 = beta;
    PressRatio.u2 = N_T;
    PressRatio.y = PR;
    annotation (uses(ThermoPower(version="2"), Modelica(version="2.2")),
                                               Diagram,
      Documentation(info="<html>
This model adds the performance characteristics to the Compressor_Base model, by means of 2D interpolation tables.</p>
<p>Theoretically speaking, the perfomance characteristics are specified by two characteristic equations: the first relates the flow number <tt>phic</tt>, the pressure ratio <tt>PR</tt> and the referred speed <tt>N_T</tt>; the second relates the efficiency <tt>eta</tt>, the flow number <tt>phic</tt>, and the referred speed <tt>N_T</tt> [1]. In order to avoid singularities at low speed, one possible solution is the use of the corrected torque <tt>torque</tt> instead of the efficiency <tt>eta</tt> [2]. To avoid singularities, the two characteristic equations are expressed in parametric form by adding a further variable <tt>beta</tt> (method of beta lines [3]). 
<p>The performance maps are thus tabulated into three differents tables, <tt>tablePhic</tt>,  <tt>tablePR</tt> and <tt>tableM</tt>, which express <tt>phic</tt>, <tt>PR</tt> and <tt>torque</tt> as a function of <tt>N_T</tt> and <tt>beta</tt>, respectively, where <tt>N_T</tt> is the first row while <tt>beta</tt> is the first column. The referred speed <tt>N_T</tt> is defined as a percentage of the design referred speed and <tt>beta</tt> are arbitrary lines, drawn parallel to the surge-line on the performance maps.
<p><tt>Modelica.Blocks.Tables.CombiTable2D</tt> interpolates the tables to obtain values of referred flow, pressure ratio and efficiency at given levels of referred speed and beta.
<p><b>Modelling options</b></p>
<p>The following options are available to determine how the table is defined:
<ul><li><tt>Table = 0</tt>: the table is explicitly supplied as matrix parameter.
<li><tt>Table = 1</tt>: the table is read from a file; the string <tt>fileName</tt> contains the path to the files where the tables are stored, either in ASCII or Matlab binary format.
</ul>
<p><b>References:</b></p>
<ol>
<li>S. L. Dixon: <i>Fluid mechanics, thermodynamics of turbomachinery</i>,  Oxford, Pergamon press, 1966, pp. 213.
</ol>
<ol>
<li>Riegler C., Bauer M, Kurzke J: <i>Some Aspects of Modelling Compressor Behavior in Gas Turbine Performance Calculations</i>,  Proceedings of ASME IGTI, Turbo Expo 2000.
</ol>
<ol>
<li>P. P. Walsh, P. Fletcher: <i>Gas Turbine Performance</i>,  2nd ed., Oxford, Blackwell, 2004, pp. 646.
</ol> 
</html>", revisions="<html>
<ul>
<li><i>22 Apr 2005</i>
    by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
       First release.</li>
</ul>
</html>"));
  end Compressor_M;
  
  package Test 
    
    model GTprova_ISO 
      annotation (uses(ThermoPower(version="2"), Modelica(version="2.2")), Diagram);
      ThermoPower.Gas.GTunit_ISO GTunit1(
        pstart=0.999e5,
        HH=42.53e6,
        Tstart=280.55,
        fileName="D:/mati_nuovo/ThermoPower/table/tableGTunit_ISO.txt",
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.file) 
                       annotation (extent=[-44,-34; 20,30]);
      ThermoPower.Gas.SourceP SourceP1(
        redeclare package Medium = ThermoPower.Media.Air,
        p0=0.999e5,
        T=280.55) 
               annotation (extent=[-98,12; -78,32]);
      ThermoPower.Gas.SinkP SinkP1(
        redeclare package Medium = ThermoPower.Media.FlueGas,
        p0=1e5,
        T=526 + 273) 
               annotation (extent=[66,2; 86,22]);
      Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
        annotation (extent=[34,-26; 54,-6]);
      Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=1791.336) 
        annotation (extent=[32,-58; 52,-38]);
      ThermoPower.Gas.SourceW SourceW1(
        redeclare package Medium = ThermoPower.Media.NaturalGas,
        T=291.44,
        p0=12.5e5,
        w0=0.357) 
                 annotation (extent=[-38,42; -18,62]);
    equation 
      connect(GTunit1.shaft_b, Inertia1.flange_a) annotation (points=[19.36,-2;
            26.68,-2; 26.68,-16; 34,-16], style(color=0, rgbcolor={0,0,0}));
      connect(ConstantSpeed1.flange, Inertia1.flange_b) annotation (points=[52,
            -48; 68,-48; 68,-16; 54,-16],
                                     style(color=0, rgbcolor={0,0,0}));
      connect(SourceW1.flange, GTunit1.Fuel_in) annotation (points=[-18,52; -14,52;
            -14,21.04; -12,21.04], style(color=76, rgbcolor={159,159,223}));
      connect(SourceP1.flange, GTunit1.Air_in) annotation (points=[-78,22; -60,22;
            -60,7.6; -40.8,7.6], style(color=76, rgbcolor={159,159,223}));
      connect(GTunit1.FlueGas_out, SinkP1.flange) annotation (points=[16.8,7.6;
            40.4,7.6; 40.4,12; 66,12], style(color=76, rgbcolor={159,159,223}));
    end GTprova_ISO;
    
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
    /*double tabPR(11,4)   # table for PR=g(ZLPout_iso,Tsync)
    0           233.15      288.15      313.15
    0.485e6      11.002      10.766      10.144
    0.97e6       12.084      11.070      10.453
    1.455e6      12.717      11.374      10.762
    1.94e6       13.166      11.678      11.070
    2.425e6      13.515      11.981      11.379
    2.91e6       13.799      12.258      11.687
    3.395e6      14.040      12.589      11.996 
    3.88e6       14.248      12.893      12.305
    4.365e6      14.432      13.196      12.613
    4.85e6       14.597      13.500      12.922
double tabHI(12,4)   # table for HI_iso=h(ZLPout_iso,Tsync)
    0           233.15       288.15       313.15
    0.7275e6     39e6         39e6         39e6
    0.97e6       31.2e6       27.36e6      28.08e6              
    1.12125e6    26.52e6      24.32e6      24.96e6
    1.455e6      24.18e6      22.344e6     22.932e6
    1.94e6       21.06e6      19.456e6     19.968e6
    2.425e6      19.188e6     17.936e6     18.408e6
    2.91e6       17.784e6     17.024e6     17.472e6
    3.395e6      17.16e6      16.416e6     16.848e6
    3.88e6       16.38e6      15.96e6      16.38e6
    4.365e6      16.224e6     15.58e6      15.99e6
    4.85e6       16.224e6     15.2e6       15.6e6*/
      ThermoPower.Gas.GTunit GTunit(
        pstart=0.999e5,
        HH=42.53e6,
        Tstart=280.55,
        fileName="D:/mati_nuovo/ThermoPower/table/tableGTunit.txt",
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.file) 
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
    
    model Test_low 
    package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
      annotation (uses(ThermoPower(version="2"), Modelica(version="2.2")), Diagram);
      ThermoPower.Gas.SourceP SourceP1(redeclare package Medium = Medium,
        T=244.4,
        p0=0.5e5) 
        annotation (extent=[-102,32; -82,52]);
      ThermoPower.Gas.SinkP SinkP1(
        redeclare package Medium = Medium,
        p0=1e5,
        T=560) annotation (extent=[66,20; 86,40]);
      Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
        annotation (extent=[-20,-6; 0,14]);
      
      Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=5.23) 
        annotation (extent=[-92,-10; -72,10]);
      ThermoPower.Gas.Compressor_low Compressor11_1(
        redeclare package Medium=Medium,
        pstart_in=0.35e5,
        pstart_out=8.3e5,
        Tstart_in=244.4,
        Tstart_out=691.4,
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.file,
        fileName="D:/mati_nuovo/ThermoPower/table/Compr_low.txt",
        Ndesign=523.3)           annotation (extent=[-50,12; -30,32]);
      Gas.Turbine_low Turbine_low1(
        redeclare package Medium = Medium,
        Tstart_in=691,
        Tstart_out=560,
        fileName="D:/mati_nuovo/ThermoPower/table/Turb_low.txt",
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.file,
        pstart_out=2e5,
        pstart_in=7.3e5,
        Ndesign=523.3) 
        annotation (extent=[6,12; 28,32]);
      Gas.PressDrop PressDrop1(
        pstart=2e5,
        Tstart=560,
        dpnom=1e5,
        rhonom=1,
        A=1,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        wnom=0.3) annotation (extent=[34,20; 54,40]);
      Gas.PressDrop PressDrop2(
        rhonom=1,
        A=1,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        pstart=0.5e5,
        Tstart=244,
        wnom=0.3,
        dpnom=0.15e5) annotation (extent=[-72,32; -52,52]);
      Gas.PressDrop PressDrop3(
        dpnom=1e5,
        rhonom=1,
        A=1,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        pstart=8.3e5,
        Tstart=691,
        wnom=0.3) annotation (extent=[-22,22; -2,42]);
    equation 
      connect(ConstantSpeed1.flange, Compressor11_1.shaft_a) annotation (points=[
            -72,0; -60,0; -60,21.9; -46.5,21.9], style(color=0, rgbcolor={0,0,0}));
      connect(Compressor11_1.shaft_b, Inertia1.flange_a) annotation (points=[
            -33.6,21.9; -33.6,15.95; -20,15.95; -20,4], style(color=0, rgbcolor={
              0,0,0}));
      connect(Turbine_low1.shaft_a, Inertia1.flange_b) annotation (points=[8.97,
            22; 0,22; 0,4],         style(color=0, rgbcolor={0,0,0}));
      connect(Turbine_low1.outlet, PressDrop1.inlet) annotation (points=[25.8,30;
            34,30], style(color=76, rgbcolor={159,159,223}));
      connect(PressDrop1.outlet, SinkP1.flange) annotation (points=[54,30; 66,30],
          style(color=76, rgbcolor={159,159,223}));
      connect(PressDrop2.outlet, Compressor11_1.inlet) annotation (points=[-52,42;
            -50,42; -50,30; -48,30], style(color=76, rgbcolor={159,159,223}));
      connect(SourceP1.flange, PressDrop2.inlet) annotation (points=[-82,42; -72,
            42], style(color=76, rgbcolor={159,159,223}));
      connect(Compressor11_1.outlet, PressDrop3.inlet) annotation (points=[-32,30;
            -28,30; -28,32; -22,32], style(color=76, rgbcolor={159,159,223}));
      connect(PressDrop3.outlet, Turbine_low1.inlet) annotation (points=[-2,32; 4,
            32; 4,30; 8.2,30], style(color=76, rgbcolor={159,159,223}));
    end Test_low;
    
    model Test_low1 
    package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
      annotation (uses(ThermoPower(version="2"), Modelica(version="2.2")), Diagram);
      ThermoPower.Gas.SourceP SourceP1(redeclare package Medium = Medium,
        T=244.4,
        p0=0.5e5) 
        annotation (extent=[-102,32; -82,52]);
      ThermoPower.Gas.SinkP SinkP1(
        redeclare package Medium = Medium,
        p0=1e5,
        T=560) annotation (extent=[66,20; 86,40]);
      Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
        annotation (extent=[-20,-6; 0,14]);
      
      ThermoPower.Gas.Compressor_low Compressor1(
        redeclare package Medium = Medium,
        pstart_in=0.35e5,
        pstart_out=8.3e5,
        Tstart_in=244.4,
        Tstart_out=691.4,
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.file,
        fileName="D:/mati_nuovo/ThermoPower/table/Compr_low.txt",
        Ndesign=523.3)           annotation (extent=[-50,12; -30,32]);
      Gas.Turbine_low Turbine_low1(
        redeclare package Medium = Medium,
        Tstart_in=691,
        Tstart_out=560,
        fileName="D:/mati_nuovo/ThermoPower/table/Turb_low.txt",
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.file,
        pstart_out=2e5,
        pstart_in=7.3e5,
        Ndesign=523.3) 
        annotation (extent=[6,12; 28,32]);
      Gas.PressDrop PressDrop1(
        pstart=2e5,
        Tstart=560,
        dpnom=1e5,
        rhonom=1,
        A=1,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        wnom=0.3) annotation (extent=[34,20; 54,40]);
      Gas.PressDrop PressDrop2(
        rhonom=1,
        A=1,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        pstart=0.5e5,
        Tstart=244,
        wnom=0.3,
        dpnom=0.15e5) annotation (extent=[-72,32; -52,52]);
      Gas.PressDrop PressDrop3(
        dpnom=1e5,
        rhonom=1,
        A=1,
        redeclare package Medium = Medium,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        pstart=8.3e5,
        Tstart=691,
        wnom=0.3) annotation (extent=[-22,20; -2,40]);
      Modelica.Mechanics.Rotational.Fixed Fixed1 
        annotation (extent=[-70,-14; -50,6]);
      Modelica.Mechanics.Rotational.Damper Damper1(d=9) 
        annotation (extent=[-70,2; -50,22], rotation=270);
    equation 
      connect(Compressor1.shaft_b, Inertia1.flange_a)    annotation (points=[
            -33.6,21.9; -33.6,15.95; -20,15.95; -20,4], style(color=0, rgbcolor={
              0,0,0}));
      connect(Turbine_low1.shaft_a, Inertia1.flange_b) annotation (points=[8.97,
            22; 0,22; 0,4],         style(color=0, rgbcolor={0,0,0}));
      connect(Turbine_low1.outlet, PressDrop1.inlet) annotation (points=[25.8,30;
            34,30], style(color=76, rgbcolor={159,159,223}));
      connect(PressDrop1.outlet, SinkP1.flange) annotation (points=[54,30; 66,30],
          style(color=76, rgbcolor={159,159,223}));
      connect(PressDrop2.outlet, Compressor1.inlet)    annotation (points=[-52,42;
            -50,42; -50,30; -48,30], style(color=76, rgbcolor={159,159,223}));
      connect(SourceP1.flange, PressDrop2.inlet) annotation (points=[-82,42; -72,
            42], style(color=76, rgbcolor={159,159,223}));
      connect(Compressor1.outlet, PressDrop3.inlet)    annotation (points=[-32,30;
            -22,30],                 style(color=76, rgbcolor={159,159,223}));
      connect(PressDrop3.outlet, Turbine_low1.inlet) annotation (points=[-2,30;
            8.2,30],           style(color=76, rgbcolor={159,159,223}));
      connect(Damper1.flange_a, Compressor1.shaft_a)    annotation (points=[-60,
            22; -54,22; -54,21.9; -46.5,21.9], style(color=0, rgbcolor={0,0,0}));
      connect(Damper1.flange_b, Fixed1.flange_b) 
        annotation (points=[-60,2; -60,-4], style(color=0, rgbcolor={0,0,0}));
    initial equation 
    Inertia1.w=5;
    end Test_low1;
    
    model GTprova 
      annotation (uses(ThermoPower(version="2"), Modelica(version="2.2")), Diagram);
      ThermoPower.Gas.GTunit GTunit1(
        pstart=0.999e5,
        HH=42.53e6,
        Tstart=280.55,
        fileName="D:/mati_nuovo/ThermoPower/table/tableGTunit.txt",
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.file) 
                       annotation (extent=[-44,-34; 20,30]);
      ThermoPower.Gas.SourceP SourceP1(
        redeclare package Medium = ThermoPower.Media.Air,
        p0=0.999e5,
        T=280.55) 
               annotation (extent=[-98,12; -78,32]);
      ThermoPower.Gas.SinkP SinkP1(
        redeclare package Medium = ThermoPower.Media.FlueGas,
        p0=1e5,
        T=526 + 273) 
               annotation (extent=[66,2; 86,22]);
      Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
        annotation (extent=[34,-26; 54,-6]);
      Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=314) 
        annotation (extent=[32,-58; 52,-38]);
      ThermoPower.Gas.SourceW SourceW1(
        redeclare package Medium = ThermoPower.Media.NaturalGas,
        T=291.44,
        p0=12.5e5,
        w0=0.357) 
                 annotation (extent=[-38,42; -18,62]);
    equation 
      connect(GTunit1.shaft_b, Inertia1.flange_a) annotation (points=[19.36,-2;
            26.68,-2; 26.68,-16; 34,-16], style(color=0, rgbcolor={0,0,0}));
      connect(ConstantSpeed1.flange, Inertia1.flange_b) annotation (points=[52,
            -48; 68,-48; 68,-16; 54,-16],
                                     style(color=0, rgbcolor={0,0,0}));
      connect(SourceW1.flange, GTunit1.Fuel_in) annotation (points=[-18,52; -14,52;
            -14,21.04; -12,21.04], style(color=76, rgbcolor={159,159,223}));
      connect(SourceP1.flange, GTunit1.Air_in) annotation (points=[-78,22; -60,22;
            -60,7.6; -40.8,7.6], style(color=76, rgbcolor={159,159,223}));
      connect(GTunit1.FlueGas_out, SinkP1.flange) annotation (points=[16.8,7.6;
            40.4,7.6; 40.4,12; 66,12], style(color=76, rgbcolor={159,159,223}));
    end GTprova;
    
    model TestCompressorInertia_ESTR 
    package Medium=Modelica.Media.IdealGases.MixtureGases.CombustionAir;
      annotation (uses(ThermoPower(version="2"), Modelica(version="2.1")), Diagram,
        experiment(StopTime=2),
        experimentSetupOutput,
        Documentation(info="<html>
This model test the <tt>Compressor</tt> model with an inertial load. Boundary conditions and data refer to an turbojet engine at 11.000 m.
<p>Simulate for 2 seconds. The compressor slows down.
</html>"));
    /*protected 
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
  
public */
      ThermoPower.Gas.SourceP SourceP1(redeclare package Medium = Medium,
        p0=0.35e5,
        T=244.4) 
        annotation (extent=[-60,30; -40,50]);
      ThermoPower.Gas.SinkP SinkP1(
        redeclare package Medium = Medium,
        T=691.4,
        p0=0.35e5) 
               annotation (extent=[62,26; 82,46]);
      Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
        annotation (extent=[12,4; 32,24]);
      ThermoPower.Gas.Compressor Compressor(
        redeclare package Medium = Medium,
        pstart_in=0.35e5,
        pstart_out=8.3e5,
        Tstart_in=244.4,
        Tstart_out=691.4,
        explicitIsentropicEnthalpy=false,
        Ndesign=523.3,
        Tdes_in=244.4,
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.file,
        beta(start=5),
        fileName="D:/mati_nuovo/tabelle/COMPR.mat") 
                        annotation (extent=[-24,4; -4,24]);
      Gas.PressDropLin PressDropLin1(redeclare package Medium = Medium, R=8e5/100) 
        annotation (extent=[16,26; 36,46]);
    initial equation 
      Inertia1.w=523.3;
    equation 
    //  assert(Compressor.beta>=1, "the model works in unstable conditions");
      connect(SourceP1.flange, Compressor.inlet)     annotation (points=[-40,40;
            -30,40; -30,22; -22,22], style(color=76, rgbcolor={159,159,223}));
      connect(Compressor.shaft_b, Inertia1.flange_a)     annotation (points=[-7.6,
            13.9; -7.6,13.95; 12,13.95; 12,14],
                                             style(color=0, rgbcolor={0,0,0}));
      connect(Compressor.outlet, PressDropLin1.inlet) annotation (points=[-6,22; 4,22;
            4,36; 16,36], style(color=76, rgbcolor={159,159,223}));
      connect(PressDropLin1.outlet, SinkP1.flange) annotation (points=[36,36; 62,
            36], style(color=76, rgbcolor={159,159,223}));
    end TestCompressorInertia_ESTR;
    
    model GTprova_ISO11 
      
    protected 
      parameter Real tableData[8,4]=[  1.3e6,   7e6,    11.6,  18.75;
                                  1.85e6,  8.2e6,  12,    18.7;
                                  2e6,     8.5e6,  12.1,  18.65;
                                  3e6,    10.8e6,  12.7,  18.6;
                                  3.5e6,  12.1e6,  13,    18.55;
                                  4e6,    13.4e6,  13.2,  18.5;
                                  4.5e6,  14.75e6, 13.5,  18.45;
                                  4.8e6,  15.5e6,  13.6,  18.43];
    public 
      ThermoPower.Gas.GTunit_ISO GTunit1(
        tableData=tableData,
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
        Tstart=285.5,
        constantCompositionExhaust=true,
        HH=47.92e6,
        pstart=0.99e5) annotation (extent=[-38,-10; 8,30]);
      ThermoPower.Gas.SourceP SourceP1(
        redeclare package Medium = ThermoPower.Media.Air,
        T=288.15,
        p0=0.99e5) 
               annotation (extent=[-100,6; -80,26]);
      ThermoPower.Gas.SinkP SinkP1(
        redeclare package Medium = ThermoPower.Media.FlueGas,
        p0=1e5,
        T=526 + 273) 
               annotation (extent=[34,6; 54,26]);
      Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
        annotation (extent=[34,-26; 54,-6]);
      Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=1819.6) 
        annotation (extent=[62,-26; 82,-6]);
      ThermoPower.Gas.SourceW SourceW1(
        redeclare package Medium = ThermoPower.Media.NaturalGas,
        T=291.44,
        p0=13.27e5,
        w0=0.317) 
                 annotation (extent=[-38,40; -18,60]);
    equation 
      connect(GTunit1.shaft_b, Inertia1.flange_a) annotation (points=[7.54,10;
            26.68,10; 26.68,-16; 34,-16], style(color=0, rgbcolor={0,0,0}));
      connect(ConstantSpeed1.flange, Inertia1.flange_b) annotation (points=[82,
            -16; 54,-16],            style(color=0, rgbcolor={0,0,0}));
      connect(SourceW1.flange, GTunit1.Fuel_in) annotation (points=[-18,50; -14,
            50; -14,24.4; -15,24.4],
                                   style(color=76, rgbcolor={159,159,223}));
     annotation (uses(ThermoPower(version="2"), Modelica(version="2.2")), Diagram);
      connect(GTunit1.FlueGas_out, SinkP1.flange) annotation (points=[5.7,16; 34,16],
          style(color=76, rgbcolor={159,159,223}));
      connect(GTunit1.Air_in, SourceP1.flange) annotation (points=[-35.7,16; -80,
            16], style(color=76, rgbcolor={159,159,223}));
    end GTprova_ISO11;
    
    model TestCompressor 
      package Medium=ThermoPower.Media.Air;
      ThermoPower.Gas.SourceP SourceP1(
        redeclare package Medium = Medium,
        T=-20 + 273.15,
        p0=1.003e5) 
        annotation (extent=[-60,30; -40,50]);
      ThermoPower.Gas.SinkP SinkP1(
        redeclare package Medium = Medium,
        p0=12.223e5,
        T=298.6 + 273.15) 
               annotation (extent=[10,30; 30,50]);
      Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
        annotation (extent=[12,4; 32,24]);
      ThermoPower.Gas.Compressor Compressor(
        redeclare package Medium = Medium,
        pstart_in=1.003e5,
        pstart_out=12.223e5,
        Tdes_in=15 + 273.15,
        Tstart_in=-20 + 273.15,
        Tstart_out=298.6 + 273.15,
        Ndesign=Modelica.SIunits.Conversions.from_rpm(4923),
        fileName="D:/mati_nuovo/tabelle/comprGTT.mat",
        Table=ThermoPower.Choices.TurboMachinery.TableTypes.file) 
                        annotation (extent=[-24,4; -4,24]);
    initial equation 
      Inertia1.w=Modelica.SIunits.Conversions.from_rpm(4923);
    equation 
      connect(SourceP1.flange, Compressor.inlet)     annotation (points=[-40,40;
            -30,40; -30,22; -22,22], style(color=76, rgbcolor={159,159,223}));
      connect(Compressor.shaft_b, Inertia1.flange_a)     annotation (points=[-7.6,
            13.9; -7.6,13.95; 12,13.95; 12,14],
                                             style(color=0, rgbcolor={0,0,0}));
      connect(Compressor.outlet, SinkP1.flange) annotation (points=[-6,22; -6,31;
            10,31; 10,40], style(color=76, rgbcolor={159,159,223}));
    annotation (uses(ThermoPower(version="2"), Modelica(version="2.1")), Diagram,
        experiment(StopTime=2),
        experimentSetupOutput,
        Documentation(info="<html>
This model test the <tt>Compressor</tt> model with an inertial load. Boundary conditions and data refer to an turbojet engine at 11.000 m.
<p>Simulate for 2 seconds. The compressor slows down.
</html>"));
      
    end TestCompressor;
    
    model TestTurbine 
      package Medium=ThermoPower.Media.FlueGas;
    protected 
      parameter Modelica.SIunits.MassFraction Xturb[Medium.nX]={0.15581,0.01320,0.03822,0.05543,0.73734};
      parameter Modelica.SIunits.MassFraction Xexhaust[Medium.nX]={0.16342,0.01323,0.03444,0.04988,0.73904};
    public 
      ThermoPower.Gas.SourceP SourceP1(
        redeclare package Medium = Medium,
        p0=12.223e5,
        Xnom=Xturb,
        T=1267.33) 
        annotation (extent=[-94,28; -74,48]);
      Modelica.Mechanics.Rotational.Inertia Inertia1(J=10000) 
        annotation (extent=[4,-4; 24,16]);
      Gas.TurbineStodola Turbine(
        redeclare package Medium = Medium,
        Xstart=Xturb,
        pstart_in=11.758e5,
        Tdes_in=288.15,
        Tstart_in=1267.33,
        Tstart_out=495.3 + 273.15,
        fixedEta=true,
        eta_nom=0.96,
        Ndesign=Modelica.SIunits.Conversions.from_rpm(4923),
        pstart_out=1.003e5,
        NominalCondition=true,
        wnom=158.5)        annotation (extent=[-24,20; -6,40]);
      Gas.SinkP SinkP1(
        redeclare package Medium = Medium,
        Xnom=Xexhaust,
        p0=1.003e5,
        T=580) annotation (extent=[14,28; 34,48]);
      Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(w_fixed=Modelica.SIunits.Conversions.from_rpm(4923)) 
        annotation (extent=[-48,-8; -28,12]);
      Gas.PressDrop PressDrop1(
        redeclare package Medium = Medium,
        Xstart=Xturb,
        pstart=12.223e5,
        FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
        dpnom=0.465e5,
        rhonom=3,
        wnom=158.5,
        Tstart=1267.33)        annotation (extent=[-60,28; -40,48]);
    equation 
      connect(Turbine.outlet, SinkP1.flange)     annotation (points=[-7.8,38; 14,
            38],          style(color=76, rgbcolor={159,159,223}));
      connect(Turbine.shaft_b, Inertia1.flange_a)     annotation (points=[-8.43,
            30; -4,30; -4,6; 4,6],
                               style(color=0, rgbcolor={0,0,0}));
      connect(ConstantSpeed1.flange, Turbine.shaft_a)     annotation (points=[-28,
            2; -26,2; -26,30; -21.57,30],style(color=0, rgbcolor={0,0,0}));
      connect(SourceP1.flange, PressDrop1.inlet) annotation (points=[-74,38; -60,38],
          style(color=76, rgbcolor={159,159,223}));
      connect(PressDrop1.outlet, Turbine.inlet)  annotation (points=[-40,38;
            -22.2,38],
          style(color=76, rgbcolor={159,159,223}));
        annotation (extent=[-58,20; -38,40], Diagram,
        Documentation(info="<html>
This model test the Turbine model based on the Stodola's law at constant speed. Boundary conditions and data refer to an turbojet engine at 11.000 m. 
<p>Simulate for 5 seconds. 
</html>"),
        experiment(StopTime=5));
    end TestTurbine;
    
  end Test;
end GasExtra;
