function Time = TimeConverter(GMSt)
%#codegen
%GMSt in second
a=GMSt/3600; %in Hours
limit=24;

for i=1:20
    b=a-(i*24);
    if b<=limit
        break; 
    end
end

%hours
h=fix(b);
%minutes
min=(b-h)*60;
m=fix(min);
%sec
sec=(min-m)*60;
s=fix(sec);

%so, T=[h, m ,s]
T=[h; m; s];

Time = T;