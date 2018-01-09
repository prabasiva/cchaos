classdef dTStat
    properties(GetAccess = 'public',SetAccess = 'private')
        mu
        sig
        to
        pdc
        rawData
    end
    methods
        function obj = dTStat(name)
           disp(name);
           obj.rawData=getData(1);
           [y,lag]=autocorr(obj.rawData,100);
            pos=find(y>0 == 0.0000000,1,'first');
            y1=y(pos-1);
            y2=y(pos);
            x1=lag(pos-1);
            x2=lag(pos);
            m=(y2-y1)/(x2-x1);
            b1=y1-m*x1;
            obj.to=-1*b1/m;
            obj.mu=mean(y);
            obj.sig=var(y);
        end;
    end
end


