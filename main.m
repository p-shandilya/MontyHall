%Author: Pradyoth Shandilya
%Contact: shandilya@umbc.edu
%Description: Simulating the Monty-Hall Problem with N doors
%Note: The word 'random' is used as a substitue for pseudorandom
%Last modified: 09-19-22

clearvars
clc

N_doors = 1000; %Number of doors
N_sims = 10^4; %Number of simulations of the game show


contestant_correct = 0;
switch_correct = 0;

for counter = 1:N_sims
    %Set up the doors and reward
    doors = zeros(N_doors,1); %Vector populated with zeros. Zeros represent goats
    rvar = randi(N_doors);
    doors(rvar) = 1; %Reward fixed behind one of the doors randomly
    %Set up complete

    %The game show contestant picks a door randomly
    contestant_door = randi(N_doors);
    allowed_doors = (1:N_doors).';
    allowed_doors(contestant_door) = [];
    if contestant_door ~= rvar
        allowed_door_index = [contestant_door;rvar];
    else
        allowed_door_index = [contestant_door;allowed_doors(randi(length(allowed_doors)))];
    end

    adr = allowed_door_index;

    %Now open all doors except the contenstant's door and one door containing a
    %goat

    %pick_door = allowed_door_index(randi(length(allowed_door_index)));

    %allowed_door_index = [contestant_door;pick_door];

    %Now ask if the contestant wants to switch or not.

    if doors(adr(1))==1
        contestant_correct = contestant_correct + 1;

    elseif doors(adr(2)) == 1
        switch_correct = switch_correct + 1;
    else
        disp("Something went wrong");
    end


end

fprintf("Switching gives you the reward %d/%d times\n",switch_correct,N_sims);
fprintf("Not switching gives you the reward %d/%d times\n",contestant_correct,N_sims);


