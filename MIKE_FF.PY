import pandas as pd
import numpy as np

# Define the players and their rivals
data = {
    "Mike": "Dan",
    "Preston": "Galvo",
    "Nik": "Justin",
    "Bilotti": "Nick",
    "Anton": "Birch",
    "Ed": "Kyle",
    "Dan": "Mike",
    "Galvo": "Preston",
    "Nick": "Bilotti",
    "Birch": "Anton",
    "Kyle": "Ed",
    "Justin": "Nik"
}

def create_initial_schedule(players):
    schedule = pd.DataFrame(index=np.arange(1, 15), columns=players.keys())
    
    for player, rival in players.items():
        schedule.loc[1, player] = rival
        schedule.loc[7, player] = rival
        schedule.loc[14, player] = rival
        
    return schedule

def fill_remaining_weeks(schedule, players):
    for week in range(2, 15):
        if week in [1, 7, 14]:  # We skip the weeks when rivals are playing
            continue
            
        while True:
            assignments = {}  # We will first try to make assignments for the week here
            valid = True  # This will keep track if all assignments are valid
            
            for player in players.keys():
                if pd.isna(schedule.loc[week, player]):  # We only assign games for empty slots
                    potential_opponents = set(players.keys()) - set(schedule[player].dropna()) - set(assignments.values()) - {player}
                    
                    if potential_opponents:
                        opponent = np.random.choice(list(potential_opponents))  # We randomly select an opponent who this player hasn't played with
                        assignments[player] = opponent
                    else:
                        valid = False  # If we can't find an opponent for a player, we will need to reshuffle
                        break  # No need to continue with the rest of the players this week
            
            if valid:  # If all assignments are valid, we update the actual schedule
                for player, opponent in assignments.items():
                    schedule.loc[week, player] = opponent
                    schedule.loc[week, opponent] = player  # We also update the schedule for the opponent
                break  # We managed to make a schedule for this week, so we can move on to the next one
                
    return schedule

def create_player_schedules(players):
    initial_schedule = create_initial_schedule(players)
    full_schedule = fill_remaining_weeks(initial_schedule, players)
    
    player_schedules = {}
    
    for player in players.keys():
        player_schedules[player] = full_schedule[player]
        
    return player_schedules

schedules = create_player_schedules(data)

# Save each player's schedule to a CSV file
for player, schedule in schedules.items():
    schedule.to_csv(f"/Users/ianpatete/python_scripts/{player}_schedule.csv", header=True)
