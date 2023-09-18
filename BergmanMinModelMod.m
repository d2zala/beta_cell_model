classdef BergmanMinModelMod


    properties
            r0 {mustBeNumeric}
            Ego {mustBeNumeric}
            Si {mustBeNumeric}
            sigma {mustBeNumeric}
            alpha {mustBeNumeric}
            do {mustBeNumeric}
            r1 {mustBeNumeric}
            r2 {mustBeNumeric}
            k {mustBeNumeric}

    end

    methods

        function obj = BergmanMinModelMod()
             if nargin == 9
                obj.r0 = r0;
                obj.Ego = Ego;
                obj.Si = Si;
                obj.sigma = sigma;
                obj.alpha = alpha;
                obj.k = k;
                obj.do = do;
                obj.r1 = r1;
                obj.r2 = r2;
             end
        end

        function GlucoseConcentration = glucconcentration(obj, insconcentration, glucconcentration)

        
           GlucoseConcentration = obj.r0 - ((obj.Ego + (obj.Si*insconcentration)) * glucconcentration);

        end

        function InsulinConcentration = insconcentration(obj,betacellmass, glucconccentration, insconcentration)

            InsulinConcentration = (((betacellmass * obj.sigma * glucconccentration^2)/(obj.alpha + (glucconccentration^2)))) - (obj.k*insconcentration);

        end

        function beta_cell_mass = betacellmass(obj, betacellmass, glucconcentration)

            beta_cell_mass = (-obj.do + (obj.r1*glucconcentration) - (obj.r2*(glucconcentration^2)))*betacellmass;

        end

    end
end

