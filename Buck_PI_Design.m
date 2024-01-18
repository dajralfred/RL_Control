%Buck rL Transfer Function Generator
Vin=input(['Please enter the Input Voltage of the Buck Converter:',char(10)]);
L=input(['Please enter the Inductance value in Henries:',char(10)]);
Cap=input(['Please enter the Output Capacitance Value in Farads:',char(10)]);
R=input(['Please enter the Output Resistance Value in Ohms:',char(10)]);
rL=input(['Please enter the Inductor Resistance Value in Ohms:',char(10)]);

A=[-rL/L,-1/L;1/Cap,-1/(R*Cap)];
B=[Vin/L;0];
C=[0,1];
D=[0];

[Pnum,Pden] = ss2tf(A,B,C,D);
Ps=tf(Pnum,Pden);
disp('The Converter Power Stage Transfer Function, P(s) is:')
display(Ps);

vPText=[char(10),'Please enter the Peak voltage for the Sawtooth Wave used to create the PWM signal',char(10),'Enter 0 or hit "Enter" to use default: 3V',char(10)];
Vp=input(vPText);
clear('vPText')

%H(s) Input
Hnum=[1];
Hden=[1];
Hs=tf(Hnum,Hden);
disp('The default feedback Function, H(s) is:')
display(Hs);
HsMenu=menu(['Would you like to use this default value for H(s) or ',char(10),...
'Provide a new value for H(s)?',char(10)],...
'Use default H(s)','Calculate new H(s) Transfer Function');
if(HsMenu==1)
disp('Using default value for H(s)');

elseif(HsMenu==2)
clear('Hnum','Hden','Hs');
Hnum=input(['Enter the New numerator for H(s) as an array of Comma-Separated Values',...
char(10),'(example) [1,2,...,n]',char(10)]);
Hden=input(['Enter the New denominator for H(s) as an array of Comma-Separated Values',...
char(10),'(example) [1,2,...,n]',char(10)]);
Hs=tf(Hnum,Hden);
disp('The new Feedback Transfer Function, H(s) is:')
display(Hs);
end 
clear('HsMenu');


%G =
% 
%         4.364e09
%  -----------------------
%  s^2 + 2459 s + 9.183e07