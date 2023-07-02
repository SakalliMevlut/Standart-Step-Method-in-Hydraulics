clear
close all
clc
promptMessage = sprintf('What is The Channel Type?');
titleBarCaption = 'Channel Type';
numberOfUsers = 1;
buttonSelections = zeros(1, numberOfUsers); 
userNumber = 1; 
button = questdlg(promptMessage, titleBarCaption, 'Trapezoidal', 'Rectangular', 'Trapezoidal');
if strcmpi(button, 'Trapezoidal')
Channel_Type = 1;
disp('Channel Type: Trapezoidal');
elseif strcmpi(button, 'Rectangular')
Channel_Type = 2;
disp('Channel Type: Rectangular');
end
promptMessage = sprintf('What Unit System is Used?');
titleBarCaption = 'US or SI ';
numberOfUsers = 1;
buttonSelections2 = zeros(1, numberOfUsers); % Preallocate.
userNumber2 = 1; 
button = questdlg(promptMessage, titleBarCaption, 'US', 'SI', 'US');
if strcmpi(button, 'SI')
g = 9.81;
fprintf('g = %.2f m/s^2\n',g);
fprintf('Unit System : SI Unit System(m^3/s - m).\n');
else 
g = 32.2;
fprintf('g = %.2f ft/s^2\n',g);
fprintf('Unit System : US Unit System(ft^3/s - ft).\n');
end
if Channel_Type == 1
if g == 9.81
Trapezoidal = imread('trapezoidal.jpg');
imshow(Trapezoidal)
Trapezoidal = title('Trapezoidal Channel','Color','blue');
prompt = {'Q(m^3/s):','b(m):','H(Channel side slope):','V:'};
dlgtitle = 'Input';
answer = inputdlg(prompt,dlgtitle);
given_data_Q = str2double(answer(1,1));
given_data_b = str2double(answer(2,1));
given_data_m = str2double(answer(3,1));
given_data_l = str2double(answer(4,1));
close Figure 1
else
Trapezoidal = imread('trapezoidal.jpg');
imshow(Trapezoidal)
Trapezoidal = title('Trapezoidal Channel','Color','blue');
prompt1 = {'Q(ft^3/s):','b(ft):','H(Channel side slope):','V:'};
dlgtitle1 = 'Input';
answer1 = inputdlg(prompt1,dlgtitle1);
given_data_Q = str2double(answer1(1,1));
given_data_b = str2double(answer1(2,1));
given_data_m = str2double(answer1(3,1));
given_data_l = str2double(answer1(4,1));
close Figure 1
end
prompt2 = {'n:'};
dlgtitle2 = 'Input';
given_data_n = str2double(inputdlg(prompt2,dlgtitle2));
Slope1 = imread('slope_of_channel.jpeg');
imshow(Slope1)
Slope1 = title('Slope Equation','Color','blue');
promptMessage = sprintf('Is S0 value known?');
titleBarCaption = 'Yes or No';
numberOfUsers1 = 1;
buttonSelections1 = zeros(1, numberOfUsers); % Preallocate.
userNumber1 = 1; 
button = questdlg(promptMessage, titleBarCaption, 'Yes', 'No', 'Yes');
if strcmpi(button, 'Yes')
prompt3 = {'S0:'};
dlgtitle3 = 'Input';
given_data_S0 = str2double(inputdlg(prompt3,dlgtitle3));
close Figure 1
else
prompt4 = {'X:','Z:'};
dlgtitle4 = 'Input';
answer4 = inputdlg(prompt4,dlgtitle4);
given_data_X = str2double(answer4(1,1));
given_data_Z = str2double(answer4(2,1));
given_data_S0 = given_data_Z/given_data_X;
close Figure 1
%fprintf('S0 = %f\n',given_data_S0);
end
else
if g == 9.81
Rectangular = imread('rechteck.jpg');
imshow(Rectangular)
Rectangular = title('Rectangular Channel','Color','blue');
prompt5 = {'Q(m^3/s):','b(m):'};
dlgtitle5 = 'Input';
answer5 = inputdlg(prompt5,dlgtitle5);
given_data_Q = str2double(answer5(1,1));
given_data_b = str2double(answer5(2,1));
close Figure 1
else
Rectangular = imread('rechteck.jpg');
imshow(Rectangular)
Rectangular = title('Rectangular Channel','Color','blue');
prompt6 = {'Q(ft^3/s):','b(ft):'};
dlgtitle6 = 'Input';
answer6 = inputdlg(prompt6,dlgtitle6);
given_data_Q = str2double(answer6(1,1));
given_data_b = str2double(answer6(2,1));
close Figure 1
end
prompt7 = {'n:'};
dlgtitle7 = 'Input';
given_data_n = str2double(inputdlg(prompt7,dlgtitle7));
Slope2 = imread('slope_of_channel.jpeg');
imshow(Slope2)
Slope2 = title('Slope Equation','Color','blue');
promptMessage = sprintf('Is S0 value known?');
titleBarCaption = 'Yes or No';
numberOfUsers2 = 1;
buttonSelections2 = zeros(1, numberOfUsers); % Preallocate.
userNumber2 = 1; 
button = questdlg(promptMessage, titleBarCaption, 'Yes', 'No', 'Yes');
if strcmpi(button, 'Yes')
prompt8 = {'S0:'};
dlgtitle8 = 'Input';
given_data_S0 = str2double(inputdlg(prompt8,dlgtitle8));
close Figure 1
else
prompt9 = {'X:','Z:'};
dlgtitle9 = 'Input';
answer9 = inputdlg(prompt9,dlgtitle9);
given_data_X = str2double(answer9(1,1));
given_data_Z = str2double(answer9(2,1));
given_data_S0 = given_data_Z/given_data_X;
close Figure 1
end    
end
if Channel_Type == 2 && g == 9.81 %(Rectangular,SI Unit)
    syms yn
    yn=vpasolve(given_data_Q==((yn*given_data_b)/given_data_n)*(yn*given_data_b/(given_data_b+2*yn))...
    ^(2/3)*(given_data_S0)^(1/2));
elseif Channel_Type == 1 && g == 9.81 %(Trapez,SI Unit)
    syms yn
    assume(yn,'real');
    yn = vpasolve(given_data_Q==((given_data_b*yn+given_data_m*yn^2)^(5/3))*sqrt(given_data_S0)...
    /(given_data_n*((given_data_b+2*yn*sqrt(1+given_data_m^2)))^(2/3)),[-Inf Inf] );
elseif Channel_Type == 2 && g == 32.2 %(Rectangular,US Unit)
    syms yn
    yn=vpasolve(given_data_Q==1.49*((yn*given_data_b)/given_data_n)*(yn*given_data_b/(given_data_b+2*yn))...
    ^(2/3)*(given_data_S0)^(1/2));
elseif Channel_Type == 1 && g == 32.2 %(Trapez,US Unit)
    syms yn
    assume(yn,'real');
    yn = vpasolve(given_data_Q==1.49*((given_data_b*yn+given_data_m*yn^2)^(5/3))*sqrt(given_data_S0)...
    /(given_data_n*((given_data_b+2*yn*sqrt(1+given_data_m^2)))^(2/3)),[-Inf Inf] );
end
if Channel_Type == 2
syms yc
yc=((((given_data_Q/given_data_b)^2)/g)^(1/3));
else 
syms yc
yc=vpasolve(1==(given_data_Q/(given_data_b*yc+2*yc^2))/...
((g*(given_data_b*yc+2*yc^2)/(given_data_b+4*yc))^0.5));
end
if g == 9.81
fprintf('Normal Depth(m): %f\n',yn);
fprintf('Critical Depth(m): %f\n',yc);    
else
fprintf('Normal Depth(ft): %f\n',yn);
fprintf('Critical Depth(ft): %f\n',yc);    
end
promptMessage3 = sprintf('How many ranges are required to be solved?');
titleBarCaption3 = 'Solution Ranges';
numberOfUsers3 = 1;
buttonSelections3 = zeros(1, numberOfUsers3); 
userNumber3 = 1; 
button3 = questdlg(promptMessage3, titleBarCaption3, '1', '2', '3', '1');
if strcmpi(button3, '1')
prompt10 = {'y1:','L:'};
dlgtitle10 = 'Input';
answer10 = inputdlg(prompt10,dlgtitle10);
given_data_y1 = str2double(answer10(1,1));
given_data_L1 = str2double(answer10(2,1));
Range_number = 1;
elseif strcmpi(button3, '2')
prompt11 = {'y1:','y2:','L1:','L2:'};
dlgtitle11 = 'Input';
answer11 = inputdlg(prompt11,dlgtitle11);
given_data_y1 = str2double(answer11(1,1));
given_data_y2 = str2double(answer11(2,1));
given_data_L1 = str2double(answer11(3,1));
given_data_L2 = str2double(answer11(4,1));
Range_number = 2;
elseif strcmpi(button3, '3')
prompt12 = {'y1:', 'y2:', 'y3:', 'L1:', 'L2:', 'L3:'};
dlgtitle12 = 'Input';
answer12 = inputdlg(prompt12,dlgtitle12);
given_data_y1 = str2double(answer12(1,1));
given_data_y2 = str2double(answer12(2,1));
given_data_y3 = str2double(answer12(3,1));
given_data_L1 = str2double(answer12(4,1));
given_data_L2 = str2double(answer12(5,1));
given_data_L3 = str2double(answer12(6,1));
Range_number = 3;
%elseif strcmpi(button, '4')
%prompt13 = {'y1:', 'y2:', 'y3:', 'y4:'};
%dlgtitle13 = 'Input';
%answer13 = inputdlg(prompt13,dlgtitle13);
%given_data_y1 = str2double(answer13(1,1));
%given_data_y2 = str2double(answer13(2,1));
%given_data_y3 = str2double(answer13(3,1));
%given_data_y4 = str2double(answer13(4,1));
%Range_number = 4;
end
if yc > yn
Steep_Slope = imread('Steep_Slope.jpg');
imshow(Steep_Slope)
Steep_Slope = title('Steep Slope Profile','Color','blue');
fprintf('Slope Type: Steep Slope.\n');
Typ_of_Slp = 1;
    %if given_data_y1 > yc && given_data_y1 > yn 
        %fprintf('Slope Profile : S1.\n');
        %profile = 1;
        %fprintf('Flow : Subcritical Flow.\n')
        %flow = 1;
        %fprintf('Control : Downstream to Upstream.\n');
    %elseif given_data_y1 > yn && given_data_y1 < yc
        %fprintf('Slope Profile : S2.\n');
        %profile = 1;
        %fprintf('Flow : Supercritical Flow.\n')
        %flow = 2;
        %fprintf('Control : Upstream to Downstream.\n');
    %elseif given_data_y1 < yc && given_data_y1 < yn
        %fprintf('Slope Profile : S3.\n');
        %profile = 2;
        %fprintf('Flow : Supercritical Flow.\n');
        %flow = 2;
        %fprintf('Control : Upstream to Downstream.\n');
    %end    
else
fprintf('Slope Type: Mild Slope.\n');
Typ_of_Slp = 2;
Mild_Slope = imread('Mild_Slope.jpg');
imshow(Mild_Slope)
Mild_Slope = title('Mild Slope Profile','Color','blue');
    %if given_data_y1 > yc && given_data_y1 > yn 
        %fprintf('Slope Profile : M1.\n');
        %profile = 1;
        %fprintf('Flow : Subcritical Flow.\n')
        %flow = 1;
        %fprintf('Control : Downstream to Upstream.\n');
    %elseif given_data_y1 > yc && given_data_y1 < yn
        %fprintf('Slope Profile : M2.\n');
        %profile = 2;
        %fprintf('Flow : Subcritical Flow.\n')
        %flow = 1;
        %fprintf('Control : Downstream to Upstream.\n');
    %elseif given_data_y1 < yc && given_data_y1 < yn
        %fprintf('Slope Profile : M3.\n');
        %profile = 2;
        %fprintf('Flow : Supercritical Flow.\n');
        %flow = 2;
        %fprintf('Control : Upstream to Downstream.\n');
    %end
end
for o = 1 : Range_number
stepnum = 2;
y1 = zeros(stepnum,1);
WS1 = zeros(stepnum,1);
A1 = zeros(stepnum,1);
V1 = zeros(stepnum,1);
Pw1 = zeros(stepnum,1);
R1 = zeros(stepnum,1);
H1 = zeros(stepnum,1);
Sf1 = zeros(stepnum,1);
y2 = zeros(stepnum,1);
WS2 = zeros(stepnum,1);
A2 = zeros(stepnum,1);
V2 = zeros(stepnum,1);
Pw2 = zeros(stepnum,1);
R2 = zeros(stepnum,1);
H2 = zeros(stepnum,1);
Sf2 = zeros(stepnum,1);
hl_obs = zeros(stepnum,1);
Sf_bar = zeros(stepnum,1);
hl_calc = zeros(stepnum,1);
WS2_calc = zeros(stepnum,1);
WS2_updated = zeros(stepnum,1);
Diff = zeros(stepnum,1);
if Channel_Type == 2 
  for i = 1:stepnum
      if  o == 1
      y1(i) = given_data_y1;
      given_data_L = given_data_L1;
      elseif o == 2
      y1(i) = given_data_y2;
      given_data_L = given_data_L2;
      elseif o == 3
      y1(i) = given_data_y3;
      given_data_L = given_data_L3;
      end
      A1(i) = given_data_b*y1(i);
      V1(i) = given_data_Q/A1(i);
      Pw1(i) = given_data_b+2*y1(i);
      R1(i) = A1(i)/Pw1(i);
      H1(i) = y1(i)+((V1(i)^2)/(2*g))+ given_data_y1;
      if g == 9.81 %(SI Unit)
      Sf1(i) = (given_data_n*given_data_Q/(A1(i)*R1(i)^(2/3)))^2;
      else %(US Unit)
      Sf1(i) = (given_data_n*given_data_Q/(1.49*A1(i)*R1(i)^(2/3)))^2;
      end
  end
      y2(1) = given_data_y1 + 1;
      WS2(1) = y2(1) + given_data_y1; 
      A2(1) = given_data_b*y2(1);
      Pw2(1) = 2*y2(1)+given_data_b;
      V2(1) = given_data_Q/A2(1);
      R2(1) = A2(1)/Pw2(1);
      H2(1) = WS2(1) + (V2(1)^2)/(2*g);
      if g == 9.81 %(SI Unit)
      Sf2(1) = (given_data_n*given_data_Q/(A2(1)*R2(1)^(2/3)))^2;
      else %(US Unit)
      Sf2(1) = (given_data_n*given_data_Q/(1.49*A2(1)*R2(1)^(2/3)))^2;
      end
      X=abs(Sf2);
      Sf2 = X;
      hl_obs(1) = H2(1)-H1(1);
      Sf_bar(1) = (Sf1(1)+X(1))/2;
      hl_calc(1) = Sf_bar(1)*given_data_L;
      WS2_calc(1) = H1(1) + hl_calc(1) - ((V2(1)^2)/2)/g;
      WS2_updated(1) = (WS2(1)+WS2_calc(1))/2 ;
      Diff(1) = ((WS2_updated(1)-WS2(1))/WS2_updated(1))*100;
      if g == 9.81 %(SI Unit)
      syms c
 c=vpasolve(0 ==(((((c + given_data_y1)+((y1(2)+...
 (((given_data_Q/(given_data_b*y1(2)))^2)/(2*g))+ given_data_y1)+...
 (((((given_data_n*given_data_Q/((given_data_b*y1(2))*...
 ((given_data_b*y1(2))/(given_data_b+2*y1(2)))^(2/3)))^2)+...
 (abs((given_data_n*given_data_Q/((given_data_b*c)*((given_data_b*c)/...
 (given_data_b+2*c))^(2/3)))^2)))/2)*given_data_L)-(((given_data_Q/...
 (given_data_b*c))^2)/2)/g))/2)-(c + given_data_y1))/(((c + given_data_y1)+...
 ((y1(2)+(((given_data_Q/(given_data_b*y1(2)))^2)/(2*g))+ given_data_y1)+...
 (((((given_data_n*given_data_Q/((given_data_b*y1(2))*...
 ((given_data_b*y1(2))/(given_data_b+2*y1(2)))^(2/3)))^2)+...
 (abs((given_data_n*given_data_Q/((given_data_b*c)*...
 ((given_data_b*c)/(given_data_b+2*c))^(2/3)))^2)))/2)*given_data_L)-...
 (((given_data_Q/(given_data_b*c))^2)/2)/g))/2))*100);
 y2(2) = double(c);
      else %(US Unit)
      syms c
 c=vpasolve(0 ==(((((c + given_data_y1)+((y1(2)+...
 (((given_data_Q/(given_data_b*y1(2)))^2)/(2*g))+ given_data_y1)+...
 (((((given_data_n*given_data_Q/(1.49*(given_data_b*y1(2))*...
 ((given_data_b*y1(2))/(given_data_b+2*y1(2)))^(2/3)))^2)+...
 (abs((given_data_n*given_data_Q/(1.49*(given_data_b*c)*((given_data_b*c)/...
 (given_data_b+2*c))^(2/3)))^2)))/2)*given_data_L)-(((given_data_Q/...
 (given_data_b*c))^2)/2)/g))/2)-(c + given_data_y1))/(((c + given_data_y1)+...
 ((y1(2)+(((given_data_Q/(given_data_b*y1(2)))^2)/(2*g))+ given_data_y1)+...
 (((((given_data_n*given_data_Q/(1.49*(given_data_b*y1(2))*...
 ((given_data_b*y1(2))/(given_data_b+2*y1(2)))^(2/3)))^2)+...
 (abs((given_data_n*given_data_Q/(1.49*(given_data_b*c)*...
 ((given_data_b*c)/(given_data_b+2*c))^(2/3)))^2)))/2)*given_data_L)-...
 (((given_data_Q/(given_data_b*c))^2)/2)/g))/2))*100);
 y2(2) = double(c);
      end
 WS2(2) = y2(2) + given_data_y1; 
 A2(2) = given_data_b*y2(2);
 Pw2(2) = 2*y2(2)+given_data_b;
 V2(2) = given_data_Q/A2(2);
 R2(2) = A2(2)/Pw2(2);
 H2(2) = WS2(2) + (V2(2)^2)/(2*g);
      if g == 9.81 %(SI Unit)
      Sf2(2) = (given_data_n*given_data_Q/(A2(2)*R2(2)^(2/3)))^2;
      else %(US Unit)
      Sf2(2) = (given_data_n*given_data_Q/(1.49*A2(2)*R2(2)^(2/3)))^2;
      end
      X=abs(Sf2);
      Sf2 = X;
      hl_obs(2) = H2(2)-H1(2);
      Sf_bar(2) = (Sf1(2)+X(2))/2;
      hl_calc(2) = Sf_bar(2)*given_data_L;
      WS2_calc(2) = H1(2) + hl_calc(2) - ((V2(2)^2)/2)/g;
      WS2_updated(2) = (WS2(2)+WS2_calc(2))/2 ;
      Diff(2) = ((WS2_updated(2)-WS2(2))/WS2_updated(2))*100;
elseif Channel_Type == 1
  for i = 1:stepnum
      if  o == 1
      y1(i) = given_data_y1;
      given_data_L = given_data_L1;
      elseif o == 2
      y1(i) = given_data_y2;
      given_data_L = given_data_L2;
      elseif o == 3
      y1(i) = given_data_y3;
      given_data_L = given_data_L3;
      end     
      A1(i) = (given_data_b*y1(i))+(given_data_m*(y1(i)^2));
      V1(i) = given_data_Q/A1(i);
      Pw1(i) = given_data_b+(2*y1(i)*((1+given_data_m^2)^0.5));
      R1(i) = A1(i)/Pw1(i);
      H1(i) = ((V1(i)^2)/(2*g))+ y1(i) + given_data_y1;
      if g == 9.81 %(SI Unit)
      Sf1(i) = (given_data_n*given_data_Q/(A1(i)*R1(i)^(2/3)))^2;
      else %(US Unit)
      Sf1(i) = (given_data_n*given_data_Q/(1.49*A1(i)*(R1(i)^(2/3))))^2;
      end
  end
      y2(1) =abs(given_data_y1 + 1);
      format short
      WS2(1) = y2(1)+given_data_y1; 
      A2(1) = (given_data_b*y2(1))+(given_data_m*(y2(1)^2));
      Pw2(1) = given_data_b+(2*y2(1)*((1+given_data_m^2)^0.5));
      V2(1) = given_data_Q/A2(1);
      R2(1) = A2(1)/Pw2(1);
      H2(1) = WS2(1) + (V2(1)^2)/(2*g);
      if g == 9.81 %(SI Unit)
      Sf2(1) = ((given_data_n*given_data_Q)/(A2(1)*(R2(1)^(2/3))))^2;
      else %(US Unit)
      Sf2(1) = ((given_data_n*given_data_Q)/(1.49*A2(1)*(R2(1)^(2/3))))^2;
      end
      X=abs(Sf2);
      Sf2 = X;
      hl_obs(1) = H2(1)-H1(1);
      Sf_bar(1) = (Sf1(1)+X(1))/2;
      hl_calc(1) = Sf_bar(1)*given_data_L;
      WS2_calc(1) = H1(1) + hl_calc(1) - ((V2(1)^2)/2)/g;
      WS2_updated(1) = (WS2(1)+WS2_calc(1))/2 ; 
      Diff(1) = ((WS2_updated(1)-WS2(1))/WS2_updated(1))*100;
      if g == 9.81 %(SI Unit)
      syms c
 c=vpasolve( 0 == (((((c + given_data_y1)+((y1(2)+(((given_data_Q/((given_data_b*y1(2)) +...
 (given_data_m*(y1(2)^2))))^2)/(2*g))+ given_data_y1) +...
 (((((given_data_n*given_data_Q/(((given_data_b*y1(2))+...
 (given_data_m*(y1(2)^2)))*(((given_data_b*y1(2))+(given_data_m*(y1(2)^2)))/...
 (given_data_b+(2*y1(2)*((1+given_data_m^2)^0.5))))^(2/3)))^2) +...
 (abs((given_data_n*given_data_Q/(((given_data_b*c)+(given_data_m*(c^2)))*...
 (((given_data_b*c)+(given_data_m*(c^2)))/(given_data_b+(2*c*((1+given_data_m^2)^0.5))))^...
 (2/3)))^2)))/2)*given_data_L) - (((given_data_Q/((given_data_b*c)+...
 (given_data_m*(c^2))))^2)/2)/g))/2)-(c + given_data_y1))/(((c + given_data_y1)+...
 ((y1(2)+(((given_data_Q/((given_data_b*y1(2))+(given_data_m*(y1(2)^2))))^2)/(2*g))+ given_data_y1) + ...
 (((((given_data_n*given_data_Q/(((given_data_b*y1(2))+(given_data_m*(y1(2)^2)))*...
 (((given_data_b*y1(2))+(given_data_m*(y1(2)^2)))/(given_data_b+(2*y1(2)*...
 ((1+given_data_m^2)^0.5))))^(2/3)))^2)+X(2))/2)*given_data_L) -...
 (((given_data_Q/((given_data_b*c)+(given_data_m*(c^2))))^2)/2)/g))/2))*100);
 y2(2) = double(c);
      else %(US Unit)
      syms c
 c=vpasolve( 0 == (((((c + given_data_y1)+((y1(2)+(((given_data_Q/((given_data_b*y1(2)) +...
 (given_data_m*(y1(2)^2))))^2)/(2*g))+ given_data_y1) +...
 (((((given_data_n*given_data_Q/(1.49*((given_data_b*y1(2))+...
 (given_data_m*(y1(2)^2)))*(((given_data_b*y1(2))+(given_data_m*(y1(2)^2)))/...
 (given_data_b+(2*y1(2)*((1+given_data_m^2)^0.5))))^(2/3)))^2) +...
 (abs((given_data_n*given_data_Q/(1.49*((given_data_b*c)+(given_data_m*(c^2)))*...
 (((given_data_b*c)+(given_data_m*(c^2)))/(given_data_b+(2*c*((1+given_data_m^2)^0.5))))^...
 (2/3)))^2)))/2)*given_data_L) - (((given_data_Q/((given_data_b*c)+...
 (given_data_m*(c^2))))^2)/2)/g))/2)-(c + given_data_y1))/(((c + given_data_y1)+...
 ((y1(2)+(((given_data_Q/((given_data_b*y1(2))+(given_data_m*(y1(2)^2))))^2)/(2*g))+ given_data_y1) + ...
 (((((given_data_n*given_data_Q/(1.49*((given_data_b*y1(2))+(given_data_m*(y1(2)^2)))*...
 (((given_data_b*y1(2))+(given_data_m*(y1(2)^2)))/(given_data_b+(2*y1(2)*...
 ((1+given_data_m^2)^0.5))))^(2/3)))^2)+X(2))/2)*given_data_L) -...
 (((given_data_Q/((given_data_b*c)+(given_data_m*(c^2))))^2)/2)/g))/2))*100);
 y2(2) = double(c);
      end
      WS2(2) = y2(2)+given_data_y1; 
      A2(2) = (given_data_b*y2(2))+(given_data_m*(y2(2)^2));
      Pw2(2) = given_data_b+(2*y2(2)*((1+given_data_m^2)^0.5));
      V2(2) = given_data_Q/A2(2);
      R2(2) = A2(2)/Pw2(2);
      H2(2) = WS2(2) + (V2(2)^2)/(2*g);
      if g == 9.81 %(SI Unit)
      Sf2(2) = ((given_data_n*given_data_Q)/(A2(2)*(R2(2)^(2/3))))^2;
      else %(US Unit)
      Sf2(2) = ((given_data_n*given_data_Q)/(1.49*A2(2)*(R2(2)^(2/3))))^2;
      end
      X=abs(Sf2);
      Sf2 = X;
      hl_obs(2) = H2(2)-H1(2);
      Sf_bar(2) = (Sf1(2)+X(2))/2;
      hl_calc(2) = Sf_bar(2)*given_data_L;
      WS2_calc(2) = H1(2) + hl_calc(2) - ((V2(2)^2)/2)/g;
      WS2_updated(2) = (WS2(2)+WS2_calc(2))/2 ; 
      Diff(2) = ((WS2_updated(2)-WS2(2))/WS2_updated(2))*100;
end
AllData = table( y1, A1, V1, Pw1, R1, H1, Sf1, y2, WS2, A2, V2, Pw2,...
R2, H2, Sf2, hl_obs, Sf_bar, hl_calc, WS2_calc, WS2_updated, Diff);
AllData.Properties.VariableNames = ["y1","A1","V1","Pw1","R1","H1","Sf1"...
,"y2","WS2","A2","V2","Pw2","R2","H2","Sf2","hl obs.","Sf bar",...
"hl calc.","WS2 calc.","WS2 updated","Diff."];
if o == 1 
title = 'Standart Step Method Range-1';
elseif o == 2 
title = 'Standart Step Method Range-2';
elseif o == 3 
title = 'Standart Step Method Range-3';
elseif o == 4 
title = 'Standart Step Method Range-4';
end
fprintf('%70s\n',title);
disp(AllData);
fprintf('y1(ft): %f\n',y1(1));
fprintf('y2(ft): %f\n',c);
fprintf('L(ft): %f\n',given_data_L);
end
